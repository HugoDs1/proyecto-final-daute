<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.modelo.Usuario" %>
<%@page import="com.modelo.UsuarioDAO" %>
<%@page import="java.util.ArrayList" %>
<%@page session="true"%>

<%
    HttpSession ses = request.getSession();
    String usuario = "";
    if (ses.getAttribute("usuario") != null && ses != null) {
        usuario = ses.getAttribute("usuario").toString();
    } else {
        response.sendRedirect("../login.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empresa Constructora | Usuarios</title>
        <%@include file ="../resources/links.jsp" %>
    </head>
    <body>
        <%!
            UsuarioDAO usuarioDAO = new UsuarioDAO();
        %>
        <%@include file ="../template/menu.jsp" %>
        <div class="container py-5">
            <div class="pt-5">
                <h3>Gestionar Usuarios</h3>
            </div>
        </div>
        <div class="container">
            <div class="table-responsive">
                <table class="table table-success table-striped" id="myDataTable">
                    <thead>
                    <th scope="col">ID</th>
                    <th scope="col">Username</th>
                    <th scope="col">Fotografía</th>
                    <th scope="col">Acciones</th>
                    </thead>
                    <tbody>
                        <%
                            ArrayList<Usuario> lista = usuarioDAO.mostrar();
                            for (Usuario elem : lista) {
                        %>
                        <tr>
                            <td class="id"><%= elem.getIdUsuario()%></td>
                            <td class="username"><%= elem.getUsername()%></td>
                            <td class="fotografia"></td>
                            <td>
                                <div class="btn-group">    
                                    <button type="button" class="btn btn-success btnEditar" data-bs-toggle="modal" data-bs-target="#exampleModal" id="editar">Editar</button>
                                    <button type="button" class="btn btn-danger btnEliminar" data-bs-toggle="modal" data-bs-target="#exampleModal" id="eliminar">Eliminar</button>
                                </div>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <%@include file ="../resources/scripts.jsp" %>

        <script src="${pageContext.servletContext.contextPath}/js/usuarios.js"></script>
    </body>
</html>
