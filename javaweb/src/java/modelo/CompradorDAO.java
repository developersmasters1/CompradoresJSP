package modelo;

import java.sql.*;
import java.util.*;
import java.sql.Date;

public class CompradorDAO {
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private final String url = "jdbc:mysql://localhost:3306/ecommerce";
    private final String user = "root";
    private final String password = "901019Fn.";

    public CompradorDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Comprador> listar() {
        List<Comprador> lista = new ArrayList<>();
        try {
            ps = con.prepareStatement("SELECT * FROM comprador");
            rs = ps.executeQuery();
            while (rs.next()) {
                lista.add(new Comprador(
                    rs.getInt("id"),
                    rs.getString("nombres"),
                    rs.getString("apellidos"),
                    rs.getString("tipo_documento"),
                    rs.getString("numero_documento"),
                    rs.getDate("fecha_nacimiento").toLocalDate(),
                    rs.getString("correo"),
                    rs.getString("contraseña"),
                    rs.getString("departamento"),
                    rs.getString("ciudad"),
                    rs.getString("direccion")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cerrarRecursos();
        }
        return lista;
    }

    public void insertar(Comprador c) {
        try {
            ps = con.prepareStatement("INSERT INTO comprador (nombres, apellidos, tipo_documento, numero_documento, fecha_nacimiento, correo, contraseña, departamento, ciudad, direccion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, c.getNombres());
            ps.setString(2, c.getApellidos());
            ps.setString(3, c.getTipoDocumento());
            ps.setString(4, c.getNumeroDocumento());
            ps.setDate(5, Date.valueOf(c.getFechaNacimiento()));
            ps.setString(6, c.getCorreo());
            ps.setString(7, c.getContrasena());
            ps.setString(8, c.getDepartamento());
            ps.setString(9, c.getCiudad());
            ps.setString(10, c.getDireccion());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cerrarRecursos();
        }
    }

    public Comprador obtenerPorId(int id) {
        Comprador c = null;
        try {
            ps = con.prepareStatement("SELECT * FROM comprador WHERE id = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                c = new Comprador(
                    rs.getInt("id"),
                    rs.getString("nombres"),
                    rs.getString("apellidos"),
                    rs.getString("tipo_documento"),
                    rs.getString("numero_documento"),
                    rs.getDate("fecha_nacimiento").toLocalDate(),
                    rs.getString("correo"),
                    rs.getString("contraseña"),
                    rs.getString("departamento"),
                    rs.getString("ciudad"),
                    rs.getString("direccion")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cerrarRecursos();
        }
        return c;
    }

    public void actualizar(Comprador c) {
        try {
            ps = con.prepareStatement("UPDATE comprador SET nombres = ?, apellidos = ?, tipo_documento = ?, numero_documento = ?, fecha_nacimiento = ?, correo = ?, contraseña = ?, departamento = ?, ciudad = ?, direccion = ? WHERE id = ?");
            ps.setString(1, c.getNombres());
            ps.setString(2, c.getApellidos());
            ps.setString(3, c.getTipoDocumento());
            ps.setString(4, c.getNumeroDocumento());
            ps.setDate(5, Date.valueOf(c.getFechaNacimiento()));
            ps.setString(6, c.getCorreo());
            ps.setString(7, c.getContrasena());
            ps.setString(8, c.getDepartamento());
            ps.setString(9, c.getCiudad());
            ps.setString(10, c.getDireccion());
            ps.setInt(11, c.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cerrarRecursos();
        }
    }

    public void eliminar(int id) {
        try {
            ps = con.prepareStatement("DELETE FROM comprador WHERE id = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cerrarRecursos();
        }
    }

    private void cerrarRecursos() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
