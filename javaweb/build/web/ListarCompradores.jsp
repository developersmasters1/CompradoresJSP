<%-- 
    Document   : ListarCompradores
    Created on : 27/07/2025, 8:54:16 p. m.
    Author     : David
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelo.Comprador" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Compradores</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        th, td {
            border: 1px solid #cccccc;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #2e86de;
            color: white;
        }
        a {
            text-decoration: none;
            color: #2e86de;
        }
    </style>
</head>
<body>
    <h1>Lista de Compradores</h1>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Tipo Doc</th>
                <th>Num Doc</th>
                <th>Fecha Nac</th>
                <th>Correo</th>
                <th>Departamento</th>
                <th>Ciudad</th>
                <th>Dirección</th>
                <th>Editar</th>
                <th>Eliminar</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<Comprador> lista = (List<Comprador>) request.getAttribute("listaCompradores");
            if (lista != null && !lista.isEmpty()) {
                for (Comprador c : lista) {
        %>
            <tr>
                <td><%= c.getId() %></td>
                <td><%= c.getNombres() %></td>
                <td><%= c.getApellidos() %></td>
                <td><%= c.getTipoDocumento() %></td>
                <td><%= c.getNumeroDocumento() %></td>
                <td><%= c.getFechaNacimiento() %></td>
                <td><%= c.getCorreo() %></td>
                <td><%= c.getDepartamento() %></td>
                <td><%= c.getCiudad() %></td>
                <td><%= c.getDireccion() %></td>
                <td>
                    <a href="CompradorServlet?accion=editar&id=<%= c.getId() %>">Editar</a>
                </td>
                <td>
                    <a href="CompradorServlet?accion=eliminar&id=<%= c.getId() %>"
                       onclick="return confirm('¿Estás seguro de eliminar este comprador?')">Eliminar</a>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="12">No hay compradores registrados.</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</body>
</html>

