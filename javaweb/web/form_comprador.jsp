<%-- 
    Document   : form_comprador
    Created on : 20/07/2025, 10:18:18 a. m.
    Author     : David
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelo.Comprador" %>
<%
    Comprador comprador = (Comprador) request.getAttribute("comprador");
    boolean esEdicion = comprador != null;
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= esEdicion ? "Editar Comprador" : "Registrar Comprador" %></title>
</head>
<body>
    <h2><%= esEdicion ? "Editar Comprador" : "Registrar Nuevo Comprador" %></h2>

    <form action="CompradorServlet" method="post">
        <% if (esEdicion) { %>
            <input type="hidden" name="id" value="<%= comprador.getId() %>">
        <% } %>

        <label>Nombres:</label><br>
        <input type="text" name="nombres" value="<%= esEdicion ? comprador.getNombres() : "" %>" required><br><br>

        <label>Apellidos:</label><br>
        <input type="text" name="apellidos" value="<%= esEdicion ? comprador.getApellidos() : "" %>" required><br><br>

        <label>Tipo de Documento:</label><br>
        <select name="tipoDocumento" required>
            <option value="">-- Seleccionar --</option>
            <option value="CC" <%= esEdicion && "CC".equals(comprador.getTipoDocumento()) ? "selected" : "" %>>Cédula de Ciudadanía</option>
            <option value="CE" <%= esEdicion && "CE".equals(comprador.getTipoDocumento()) ? "selected" : "" %>>Cédula de Extranjería</option>
            <option value="TI" <%= esEdicion && "TI".equals(comprador.getTipoDocumento()) ? "selected" : "" %>>Tarjeta de Identidad</option>
            <option value="PAS" <%= esEdicion && "PAS".equals(comprador.getTipoDocumento()) ? "selected" : "" %>>Pasaporte</option>
        </select><br><br>

        <label>Número de Documento:</label><br>
        <input type="text" name="numeroDocumento" value="<%= esEdicion ? comprador.getNumeroDocumento() : "" %>" required><br><br>

        <label>Fecha de Nacimiento:</label><br>
        <input type="date" name="fechaNacimiento" value="<%= esEdicion ? comprador.getFechaNacimiento() : "" %>" required><br><br>

        <label>Correo Electrónico:</label><br>
        <input type="email" name="correo" value="<%= esEdicion ? comprador.getCorreo() : "" %>" required><br><br>

        <label>Contraseña:</label><br>
        <input type="password" name="contrasena" value="<%= esEdicion ? comprador.getContrasena() : "" %>" required><br><br>

        <label>Departamento:</label><br>
        <input type="text" name="departamento" value="<%= esEdicion ? comprador.getDepartamento() : "" %>" required><br><br>

        <label>Ciudad:</label><br>
        <input type="text" name="ciudad" value="<%= esEdicion ? comprador.getCiudad() : "" %>" required><br><br>

        <label>Dirección:</label><br>
        <input type="text" name="direccion" value="<%= esEdicion ? comprador.getDireccion() : "" %>" required><br><br>

        <input type="submit" value="<%= esEdicion ? "Actualizar" : "Registrar" %>">
    </form>
</body>
</html>
