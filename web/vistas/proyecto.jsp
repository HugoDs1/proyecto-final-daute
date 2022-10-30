<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.modelo.Departamento"%>
<%@page import="com.modelo.DepartamentoDAO"%>
<%@page import="com.modelo.Municipio"%>
<%@page import="com.modelo.MunicipioDAO"%>
<%@page import="com.modelo.Usuario"%>
<%@page import="com.modelo.UsuarioDAO"%>
<%@page import="java.util.ArrayList" %>
<%@page import="com.modelo.Proyecto" %>
<%@page import="com.modelo.ProyectoDAO" %>
<%@page session="true"%>

<%
    HttpSession ses = request.getSession();
    String usuario = "";
    String nivel = "";
    int idDepartamento = 1;
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
        <title>Empresa Constructora | Proyecto</title>
        <%@include file ="../resources/links.jsp" %>
    </head>
    <body>
        <%!
            ProyectoDAO proyectoDAO = new ProyectoDAO();
            DepartamentoDAO departamentoDAO = new DepartamentoDAO();
            MunicipioDAO municipioDAO = new MunicipioDAO();
            UsuarioDAO usuarioDAO = new UsuarioDAO();
        %>
        <script>
            let departamentoIdSelected = {
                value: 0,
                changeDepartamentoId(newId) {
                    this.value = newId;
                }
            }
        </script>
        <%@include file ="../template/menu.jsp" %>
        <br><br><br>
        <div class="container">
            <div class="row pt-5">
                <div class="col-10">
                    <h3 class="fw-bold">Gestionar Proyecto</h3>
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
                        <tr>
                            <th>ID</th>
                            <th>Proyecto</th>
                            <th>Valor</th>
                            <th>Estado</th>
                            <th>Municipio</th>
                            <th>Departamento</th>
                            <th>Usuario</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ArrayList<Proyecto> listProyecto = proyectoDAO.mostrarProyecto();
                            for (Proyecto elem : listProyecto) {
                        %>
                        <tr>
                            <td class="id"><%= elem.getIdProyecto()%></td>
                            <td class="nombre"><%= elem.getNombre()%></td>
                            <td class="valor"><%=elem.getValor()%></td>
                            <td class="estado"><%= elem.getNombreEstado(elem.getEstado())%></td>
                            <td class="municipioId"><%= elem.getMunicipio()%></td>
                            <td class="departamentoId"><%= elem.getDepartamento()%></td>
                            <td class="usuario"><%= elem.getUsuario()%></td>
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
                        <h5 class="modal-title" id="staticBackdropLabel">Datos Proyecto</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.servletContext.contextPath}/ProyectoServlet" method="POST" role="form">
                            <div class="row">
                                <div class="col-1">
                                    <label>ID</label>
                                    <input type="text" name="txtIdP" class="form-control" id="txtIdP" value="0" readonly="true">
                                </div>
                                <div class="col-4">
                                    <label>Nombre</label>
                                    <input type="text" name="txtNombre" class="form-control" id="txtNombre">
                                </div>
                                <div class="col-4">
                                    <label>Valor</label>
                                    <input type="text" name="txtValor" class="form-control" id="txtValor">
                                </div>
                                <div class="col-3">
                                    <label>Estado</label>
                                    <select  name="txtEstado"  id="txtEstado" class="form-select">
                                        <option value="1">Ingresado</option>
                                        <option value="2">Confirmado</option>
                                        <option value="3">Entregado</option>
                                        <option value="4">Cancelado</option>

                                    </select>
                                    <br>
                                </div>
                            </div>  
                            <div class="row">                 
                                <div class="col-4">
                                    <label>Usuario</label>
                                    <select name="txtUsuario"  id="txtUsuario" class="form-select">
                                        <%
                                            ArrayList<Usuario> listaUsuario = usuarioDAO.mostrar();
                                            for (Usuario elem : listaUsuario) {
                                        %>
                                        <option value="<%=elem.getIdUsuario()%>">
                                            <%= elem.getUsername()%>
                                        </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="col-4">
                                    <label>Departamento</label>
                                    <select name="txtIdDepartamento" id="txtIdDepartamento" class="form-select">
                                        <%
                                            ArrayList<Departamento> listaDepartamento = departamentoDAO.mostrarDepartamento();
                                            for (Departamento elem : listaDepartamento) {

                                        %>
                                        <option value="<%=elem.getIdDepartamento()%>">
                                            <%= elem.getNombre()%>
                                        </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="col-4">
                                    <label>Municipio</label>
                                    <select name="txtIdMunicipio"  id="txtIdMunicipio" class="form-select">
                                        <%
                                            ArrayList<Municipio> listaMunicipio = municipioDAO.mostrarMunicipio();
                                            for (Municipio elem : listaMunicipio) {

                                        %>
                                        <option value="<%=elem.getIdMunicipio()%>"><%= elem.getNombreMunicipio()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-6">
                                    <button type="submit" name="btnGuardar" class="btn btn-primary btnOcultar1">Guardar</button>
                                    <button type="submit" name="btnEditar" class="btn btn-dark btnOcultar2">Editar</button>
                                    <button type="submit" name="btnEliminar" class="btn btn-danger btnOcultar">Eliminar</button>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                </div>
                            </div>
                    </div>

                </div> 
                </form>
            </div>
        </div>
    </div>
</div>
<%@include file ="../resources/scripts.jsp" %>
<%
    if (request.getAttribute(
            "message") != null) {
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
<script src="${pageContext.servletContext.contextPath}/js/proyectos.js"></script>
</body>
</html>