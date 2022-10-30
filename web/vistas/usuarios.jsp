<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.modelo.Usuario" %>
<%@page import="com.modelo.UsuarioDAO" %>
<%@page import="java.util.ArrayList" %>
<%@page session="true"%>

<%
    HttpSession ses = request.getSession();
    String usuario = "";
    String nivel = "";
    if (ses.getAttribute("usuario") != null && ses != null) {
        usuario = ses.getAttribute("usuario").toString();
        nivel = ses.getAttribute("nivel").toString();
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
            <div class="row pt-5">
                <div class="col-10">
                    <h3 class="fw-bold">Gestionar Usuarios</h3>
                </div>
                <div class="col-2">
                    <div class="d-grid gap-2">                       
                        <button type="button" class="btn btn-success btnAdd fw-bold" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Agregar</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="table-responsive">
                <table class="table table-hover" id="myDataTable">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Username</th>
                            <th scope="col">Nivel de Acceso</th>
                            <td class="d-none"></td>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ArrayList<Usuario> lista = usuarioDAO.mostrar();
                            for (Usuario elem : lista) {
                        %>
                        <tr>
                            <td class="id"><%= elem.getIdUsuario()%></td>
                            <td class="username"><%= elem.getUsername()%></td>
                            <td class="nivel"><%= (elem.getNivel() == 1) ? ("Administrador") : ("Usuario")%></td>
                            <td class="password d-none"><%= elem.getPassword()%></td>
                            <td class="">
                                <div class="btn-group">    
                                    <button type="button" class="btn btn-outline-success btnEditar" data-bs-toggle="modal" data-bs-target="#staticBackdrop"><i class="fa-solid fa-pen-to-square"></i></button>
                                    <button type="button" class="btn btn-outline-danger btnEliminar" data-bs-toggle="modal" data-bs-target="#staticBackdrop"><i class="fa-sharp fa-solid fa-trash"></i></button>
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
        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Datos Usuario</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.servletContext.contextPath}/UsuarioServlet" method="POST" role="form">
                            <div class="row">
                                <div class="col-2">
                                    <label>ID</label>
                                    <input type="text" name="txtID" class="form-control" id="txtID" value="0" readonly="true">
                                </div>
                                <div class="col-3">
                                    <label>Username</label>
                                    <input type="text" name="txtUsername" class="form-control" id="txtUsername">
                                </div>
                                <div class="col-3">
                                    <label>Password</label>
                                    <input type="text" name="txtPassword" class="form-control" id="txtPassword">
                                    <br>
                                </div>
                                <div class="col-4">
                                    <label>Nivel de Acceso</label>
                                    <select class="form-select" name="txtNivel" id="txtNivel">
                                        <option value="<%= 1%>">Administrador</option>
                                        <option value="<%= 0%>">Usuario</option>
                                    </select>
                                    <br>
                                </div>
                            </div>  
                            <div class="row">
                                <div class="col-12">
                                    <button name="btnGuardar" class="btn btn-primary btnOcultar1">Guardar</button>
                                    <button name="btnEditar" class="btn btn-dark btnOcultar2">Editar</button>
                                    <button name="btnEliminar" class="btn btn-danger btnOcultar">Eliminar</button>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close">Cancelar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file ="../resources/scripts.jsp" %>
        <%
            if (request.getAttribute("message") != null) {
        %>
        <script>
            $(document).ready(function () {
                Swal.fire({
                    icon: 'success',
                    title: '<%= request.getAttribute("message")%>',
                    showConfirmButton: false,
                    timer: 1000
                });
            });
        </script>
        <%
            }
        %>
        <script src="${pageContext.servletContext.contextPath}/js/usuarios.js"></script>
    </body>
</html>
