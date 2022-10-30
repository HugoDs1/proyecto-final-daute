<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page session="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empresa Constructora | Login</title>
        <%@include file ="../resources/links.jsp" %>
    </head>
    <body>
        <section class="vh-100 bg-primary">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card shadow-2-strong" style="border-radius: 1rem;">
                            <div class="card-body">
                                <center>
                                    <div class="spinner-border border-0 mt-3 mx-1">
                                        <img
                                            src="https://cdn.icon-icons.com/icons2/1350/PNG/512/nuticon_87878.png"
                                            alt="Imagen de una tuerca"
                                            style="width: 50px; padding-bottom: 20px"
                                            >
                                    </div>
                                    <div class="spinner-border border-0 mt-3 mx-1">
                                        <img
                                            src="https://cdn.icon-icons.com/icons2/1350/PNG/512/nuticon_87878.png"
                                            alt="Imagen de una tuerca"
                                            style="width: 50px; padding-bottom: 20px"
                                            >
                                    </div>
                                    <div class="spinner-border border-0 mt-3 mx-1">
                                        <img
                                            src="https://cdn.icon-icons.com/icons2/1350/PNG/512/nuticon_87878.png"
                                            alt="Imagen de una tuerca"
                                            style="width: 50px; padding-bottom: 20px"
                                            >
                                    </div>
                                    <div class="spinner-border border-0 mt-3 mx-1">
                                        <img
                                            src="https://cdn.icon-icons.com/icons2/1350/PNG/512/nuticon_87878.png"
                                            alt="Imagen de una tuerca"
                                            style="width: 50px; padding-bottom: 20px"
                                            >
                                    </div>
                                    <div class="spinner-border border-0 mt-3 mx-1">
                                        <img
                                            src="https://cdn.icon-icons.com/icons2/1350/PNG/512/nuticon_87878.png"
                                            alt="Imagen de una tuerca"
                                            style="width: 50px; padding-bottom: 20px"
                                            >
                                    </div>
                                </center>
                                <br>
                                <h3 class="mb-5 text-center"><b>Empresa Constructora</b></h3>
                                <hr class="my-4">
                                <form action="${pageContext.servletContext.contextPath}/LoginServlet" method="POST">
                                    <div class="form-outline mb-4">
                                        <label class="form-label"><b>Username</b></label>
                                        <input type="text" name="txtUser" class="form-control form-control-lg" />              
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label"><b>Password</b></label>
                                        <input type="password" name="txtPass" class="form-control form-control-lg" />              
                                    </div>
                                    <div class="d-grid gap-2">
                                        <button class="btn btn-info btn-lg text-white fw-bold" name="btnLogin" type="submit">Log In</button>
                                    </div>
                                </form>                      
                                <hr class="my-4">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%
            HttpSession sesion = request.getSession();
            if (request.getAttribute("mensaje") != null) {
        %>
        <script>
            alert("<%= request.getAttribute("mensaje")%>");
        </script>
        <%
            }

            ArrayList<Usuario> lista = new ArrayList<>();
            if (request.getAttribute("datos") != null) {
                lista = (ArrayList<Usuario>) request.getAttribute("datos");
                String username = "";
                String nivel = "";
                for (Usuario elem : lista) {
                    username = elem.getUsername();
                    nivel = elem.getNivel() == 0 ? "Usuario" : "Administrador";
                }
                sesion.setAttribute("usuario", username);
                sesion.setAttribute("nivel", nivel);
                response.sendRedirect("index.jsp");

            }

            if (request.getParameter("cerrar") != null) {
                sesion.invalidate();
                response.sendRedirect("login.jsp");
            }
        %>
        <%@include file ="../resources/scripts.jsp" %>
    </body>
</html>
