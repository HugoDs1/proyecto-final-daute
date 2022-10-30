<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
    HttpSession ses = request.getSession();
    String usuario = "";
    String nivel = "";
    if (ses.getAttribute("usuario") != null && ses != null) {
        usuario = ses.getAttribute("usuario").toString();
        nivel = ses.getAttribute("nivel").toString();
    } else {
        response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empresa Constructora | Home</title>
        <%@include file ="resources/links.jsp" %>
    </head>
    <body>
        <%@include file ="template/menu.jsp" %>
        <div class="container py-5">
            <div class="pt-5 text-center">
                <h2 class="fw-bold text-secondary">Bienvenido a Empresa Constructora</h2>
            </div>
        </div>
        <div class="container">
            <div class="row justify-content-center">
                <%
                    if (nivel.equals("Administrador")) {
                %>
                <div class="card bg-dark text-center pt-3 w-75 m-3 col">
                    <div class="p-4">
                        <img
                            class="card-img-top rounded-circle"
                            src="https://luciamonterorodriguez.com/wp-content/uploads/2021/03/computer-1331579_640.png"
                            alt="Card image cap"
                            >
                    </div>
                    <div class="card-body">
                        <h5 class="card-title py-3 text-white fw-bold">
                            Usuario
                        </h5>
                        <a href="vistas/usuarios.jsp" class="btn btn-success fw-bold text-white">Go to Usuario</a>
                    </div>
                </div>
                <%
                    }
                %>
                <div class="card bg-dark text-center pt-3 w-75 m-3 col">
                    <div class="p-4">
                        <img
                            class="card-img-top rounded-circle"
                            src="https://img.freepik.com/vector-premium/oficina-negocios-empleado-espacio-trabajo-dibujos-animados_24640-32907.jpg"
                            alt="Card image cap"
                            >
                    </div>
                    <div class="card-body">
                        <h5 class="card-title py-3 text-white fw-bold">
                            Empleado
                        </h5>
                        <a href="vistas/empleado.jsp" class="btn btn-success fw-bold text-white">Go to Empleado</a>
                    </div>
                </div>
                <div class="card bg-dark text-center pt-3 w-75 m-3 col">
                    <div class="p-4">
                        <img
                            class="card-img-top rounded-circle"
                            src="https://img.freepik.com/vector-premium/coleccion-vehiculos-maquinaria-pesada-construccion-ilustracion-aislada_338371-326.jpg"
                            alt="Card image cap"
                            >
                    </div>
                    <div class="card-body">
                        <h5 class="card-title py-3 text-white fw-bold">
                            Maquinaria
                        </h5>
                        <a href="vistas/maquinaria.jsp" class="btn btn-success fw-bold text-white">Go to Maquinaria</a>
                    </div>
                </div>
                <div class="card bg-dark text-center pt-3 w-75 m-3 col">
                    <div class="p-4">
                        <img
                            class="card-img-top rounded-circle"
                            src="https://thumbs.dreamstime.com/b/proceso-de-inicio-proyecto-empresarial-la-idea-lanzamiento-proyectos-gesti%C3%B3n-investigaci%C3%B3n-negocios-vector-negocio-plano-186332592.jpg"
                            alt="Card image cap"
                            >
                    </div>
                    <div class="card-body">
                        <h5 class="card-title py-3 text-white fw-bold">
                            Proyecto
                        </h5>
                        <a href="vistas/proyecto.jsp" class="btn btn-success fw-bold text-white">Go to Proyecto</a>
                    </div>
                </div>
            </div>
        </div>
        <%@include file ="resources/scripts.jsp" %>
    </body>
</html>
