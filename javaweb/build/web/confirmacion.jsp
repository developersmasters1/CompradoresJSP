<%-- 
    Document   : confirmacion
    Created on : 27/07/2025, 8:43:13 p. m.
    Author     : David
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelo.Comprador" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirmación de Registro</title>
</head>
<body>
    <h2>¡¡¡Registro Exitoso!!!</h2>
    <p>Aquí están los datos del comprador:</p>
    <%
        Comprador comprador = (Comprador) request.getAttribute("comprador");
        if (comprador != null) {
    %>
        <ul>
            <li><strong>ID:</strong> <%= comprador.getId() %></li>
            <li><strong>Nombres:</strong> <%= comprador.getNombres() %></li>
            <li><strong>Apellidos:</strong> <%= comprador.getApellidos() %></li>
            <li><strong>Tipo de Documento:</strong> <%= comprador.getTipoDocumento() %></li>
            <li><strong>Número de Documento:</strong> <%= comprador.getNumeroDocumento() %></li>
            <li><strong>Fecha de Nacimiento:</strong> <%= comprador.getFechaNacimiento() %></li>
            <li><strong>Correo:</strong> <%= comprador.getCorreo() %></li>
            <li><strong>Contraseña:</strong> <%= comprador.getContrasena() %></li>
            <li><strong>Departamento:</strong> <%= comprador.getDepartamento() %></li>
            <li><strong>Ciudad:</strong> <%= comprador.getCiudad() %></li>
            <li><strong>Dirección:</strong> <%= comprador.getDireccion() %></li>
        </ul>
    <%
        } else {
    %>
        <p>No se encontraron datos del comprador.</p>
    <%
        }
    %>
    <div><a href="index.jsp">Volver a la pagina principal</a></div>
</body>
</html>