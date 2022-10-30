<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.modelo.Empleado" %>
<%@page import="com.modelo.EmpleadoDAO" %>
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
        <title>Empresa Constructora | Empleado</title>
        <%@include file ="../resources/links.jsp" %>
    </head>
    <body>
        <%!
            EmpleadoDAO empleadoDAO = new EmpleadoDAO();
        %>
        <%@include file ="../template/menu.jsp" %>
        <div class="container py-5">
            <div class="row pt-5">
                <div class="col-10">
                    <h3 class="fw-bold">Gestionar Empleados</h3>
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
                            <th>ID</th>
                            <th>DUI</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Salario</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ArrayList<Empleado> listaEmpleado = empleadoDAO.mostrarEmpleados();

                            for (Empleado elem : listaEmpleado) {
                        %>
                        <tr>
                            <td class="idEmpleado"><%= elem.getId_empleado()%></td>
                            <td class="dui"><%= elem.getDui()%></td>
                            <td class="nombre"><%= elem.getNombre()%></td>
                            <td class="apellido"><%= elem.getApellido()%></td>
                            <td class="salario"><%= elem.getSalario()%></td>
                            <td class="estado"><%= (elem.getEstado() == 1) ? ("Activo") : ("Inactivo")%></td>
                            <td>
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
                        <h5 class="modal-title" id="staticBackdropLabel">Datos Empleado</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.servletContext.contextPath}/EmpleadoServlet"" method="POST" role="form">
                            <div class="row py-3">
                                <div class="col-6">
                                    <label>ID</label>
                                    <input type="text" name="txtIdEmpleado" id="txtIdEmpleado" class="form-control" value="0" readonly="true" >
                                </div>
                                <div class="col-6">
                                    <label>DUI</label>
                                    <input type="text" maxlength="10" name="txtDUI" class="form-control" id="txtDUI">
                                </div>              
                            </div>
                            <div class="row py-3">
                                <div class="col-6">
                                    <label>Nombre</label>
                                    <input type="text" name="txtNombre" class="form-control" id="txtNombre">
                                </div> 
                                <div class="col-6">
                                    <label>Apellido</label>
                                    <input type="text" name="txtApellido" class="form-control" id="txtApellido">
                                </div>           
                            </div>
                            <div class="row py-3">
                                <div class="col-6">
                                    <label>Salario</label>
                                    <input type="number" name="txtSalario" class="form-control" id="txtSalario">
                                </div> 
                                <div class="col-6">
                                    <label>Estado</label>
                                    <select class="form-select" name="txtEstado" id="txtEstado">
                                        <option value="1">Activo</option>
                                        <option value="0">Inactivo</option>
                                    </select>
                                </div> 
                            </div>
                            <br>
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
        <script src="${pageContext.servletContext.contextPath}/js/empleado.js"></script>
    </body>
</html>