<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="com.modelo.Maquinaria" %>
<%@page import="com.modelo.MaquinariaDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MAQUINARIA</title>
        <%@include file ="../resources/links.jsp" %>
    </head>
    <body>
        <%!
            MaquinariaDAO maquinariaDAO = new MaquinariaDAO();
        %>
        <%@include file ="../template/menu.jsp" %>
        <br><br><br>
        <div class="container">
            <div class="row">
                <div class="col-9"><h1>Gestion de Maquinaria</h1></div>
                <div class="col-3 align-self-start">
                    <div class="d-grid gap-2">                       
                        <button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Agregar</button>
                    </div>
                </div>
            </div>                  
            <hr>
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                    <th>Codigo</th>
                    <th>Nombre</th>
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
                            <td class="stock"><%= elem.getStock()%></td>
                            <td>
                                <button type="button" class="btn btn-outline-success btnEditar" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar</button>
                                <button type="button" class="btn btn-outline-danger btnEliminar">Eliminar</button>
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
                                <div class="col-6">
                                    <label>Codigo</label>
                                    <input type="text" name="txtCodigo" class="form-control" id="txtCodigo" value="0" readonly="true">
                                </div>
                                <div class="col-6">
                                    <label>Nombre</label>
                                    <input type="text" name="txtNombre" class="form-control" id="txtNombre">
                                </div>
                            </div>  
                            <div class="row">                 
                                <div class="col-6">
                                    <label>Stock</label>
                                    <input type="number" min="1" name="txtStock" class="form-control" id="txtStock">
                                    <br>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <button type="submit" name="btnGuardar" class="btn btn-primary">Guardar</button>
                                        <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                    </div>
                                </div>
                            </div> 
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%
            if (request.getAttribute("message") != null) {
        %>
        <script>alert('<%= request.getAttribute("message")%>');</script>
        <%
            }
        %>
    </body>
</html>
