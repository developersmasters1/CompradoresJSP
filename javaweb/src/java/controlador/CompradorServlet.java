package controlador;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.RequestDispatcher;

import modelo.Comprador;
import modelo.CompradorDAO;

@WebServlet("/CompradorServlet")
public class CompradorServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private CompradorDAO compradorDAO = new CompradorDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String accion = request.getParameter("accion");

        try {  // Accion de eliminar
            if ("eliminar".equals(accion)) {
                int id = Integer.parseInt(request.getParameter("id"));
                compradorDAO.eliminar(id);
                response.sendRedirect("CompradorServlet"); // Redirige tras eliminar
                return;
            }
            if ("editar".equals(accion)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Comprador comprador = compradorDAO.obtenerPorId(id);
                request.setAttribute("comprador", comprador);
                RequestDispatcher dispatcher = request.getRequestDispatcher("form_comprador.jsp");
                dispatcher.forward(request, response);
                return;
            }

            // Acción por defecto: listar
            List<Comprador> lista = compradorDAO.listar();
            request.setAttribute("listaCompradores", lista);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ListarCompradores.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String idStr = request.getParameter("id");
            String nombres = request.getParameter("nombres");
            String apellidos = request.getParameter("apellidos");
            String tipoDocumento = request.getParameter("tipoDocumento");
            String numeroDocumento = request.getParameter("numeroDocumento");
            LocalDate fechaNacimiento = LocalDate.parse(request.getParameter("fechaNacimiento"));
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contrasena");
            String departamento = request.getParameter("departamento");
            String ciudad = request.getParameter("ciudad");
            String direccion = request.getParameter("direccion");

            if (nombres == null || nombres.trim().isEmpty() || correo == null || correo.trim().isEmpty()) {
                request.setAttribute("error", "Los campos nombre y correo son obligatorios.");
                request.getRequestDispatcher("form_comprador.jsp").forward(request, response);
                return;
            }

            Comprador comprador = new Comprador(
                    0, nombres, apellidos, tipoDocumento, numeroDocumento,
                    fechaNacimiento, correo, contrasena,
                    departamento, ciudad, direccion
            );

            if (idStr != null && !idStr.isEmpty()) {
                // Actualizar
                comprador.setId(Integer.parseInt(idStr));
                compradorDAO.actualizar(comprador);
            } else {
                // Insertar
                compradorDAO.insertar(comprador);
            }

            response.sendRedirect("CompradorServlet");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al procesar el formulario.");
            request.getRequestDispatcher("form_comprador.jsp").forward(request, response);
        }
    }
}
