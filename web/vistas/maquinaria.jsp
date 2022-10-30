<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="com.modelo.Maquinaria" %>
<%@page import="com.modelo.MaquinariaDAO" %>
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
        <title>Empresa Constructora | Maquinaria</title>
        <%@include file ="../resources/links.jsp" %>
    </head>
    <body>
        <%!
            MaquinariaDAO maquinariaDAO = new MaquinariaDAO();
        %>
        <%@include file ="../template/menu.jsp" %>
        <br><br><br>
        <div class="container">
            <div class="row pt-5">
                <div class="col-10">
                    <h3 class="fw-bold">Gestionar Maquinaria</h3>
                </div>
                <div class="col-2">
                    <div class="d-grid gap-2">                       
                        <button type="button" class="btn btn-success btnAdd fw-bold" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Agregar</button>
                    </div>
                </div>
            </div>
            <hr>
            <div class="table-responsive">
                <table class="table table-hover" id="myDataTable">
                    <thead>
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Descripcion</th>
                    <th>Stock</th>
                    <th>Acciones</th>
                    </thead>
                    <tbody>
                        <%
                            ArrayList<Maquinaria> listaMaquinaria = maquinariaDAO.mostrarMaquinaria();
                            for (Maquinaria elem : listaMaquinaria) {
                        %>
                        <tr>
                            <td class="codigo"><%= elem.getIdMaquinaria()%></td>
                            <td class="nombre"><%= elem.getNombre()%></td>
                            <td class="descripcion"><%= elem.getDescripcion()%></td>
                            <td class="stock"><%= elem.getStock()%></td>
                            <td>
                                <button type="button" class="btn btn-outline-success btnEditar" data-bs-toggle="modal" data-bs-target="#staticBackdrop"><i class="fa-solid fa-pen-to-square"></i></button>
                                <button type="button" class="btn btn-outline-danger btnEliminar" data-bs-toggle="modal" data-bs-target="#staticBackdrop"><i class="fa-sharp fa-solid fa-trash"></i></button>
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
                        <h5 class="modal-title" id="staticBackdropLabel">Datos Maquinaria</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.servletContext.contextPath}/MaquinariaServlet" method="POST" role="form">
                            <div class="row">
                                <div class="col-4">
                                    <label>Codigo</label>
                                    <input type="text" name="txtCodigo" class="form-control" id="txtCodigo" value="0" readonly="true">
                                </div>
                                <div class="col-4">
                                    <label>Nombre</label>
                                    <input type="text" name="txtNombre" class="form-control" id="txtNombre">
                                </div>
                                <div class="col-4">
                                    <label>Stock</label>
                                    <input type="number" min="1" name="txtStock" class="form-control" id="txtStock">
                                    <br>
                                </div>
                            </div>  
                            <div class="row">
                                <div class="col-12">
                                    <label>Descripcion</label>
                                    <textarea type="text" name="txtDescripcion" class="form-control" id="txtDescripcion"></textarea>
                                </div>
                            </div> 
                            <br>
                            <div class="row">
                                <div class="col-12">
                                    <button type="submit" name="btnGuardar" class="btn btn-primary btnOcultar1">Guardar</button>
                                    <button type="submit" name="btnEditar" class="btn btn-dark btnOcultar2">Editar</button>
                                    <button type="submit" name="btnEliminar" class="btn btn-danger btnOcultar">Eliminar</button>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
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
        <script src="${pageContext.servletContext.contextPath}/js/maquinaria.js"></script>
    </body>
</html>