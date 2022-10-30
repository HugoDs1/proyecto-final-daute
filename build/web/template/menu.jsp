<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-dark bg-primary fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="/EmpresaConstructora">
            Empresa Constructora
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="offcanvas offcanvas-end bg-primary" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header d-flex flex-column justify-content-center">
                <div>
                    <p class="fw-bold text-white"><%= usuario%> | <%= nivel%></p>
                </div>
                <div class="w-25">
                    <img
                        class="w-100 h-100 rounded-circle"
                        src="https://cdn-icons-png.flaticon.com/512/6073/6073873.png"
                        alt="Imagen del Usuario" 
                        >
                </div>
            </div>
            <div class="offcanvas-body">
                <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="${pageContext.servletContext.contextPath}/index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/vistas/usuarios.jsp">Gestionar Usuarios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/vistas/empleado.jsp">Gestionar Empleados</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/vistas/maquinaria.jsp">Gestionar Maquinaria</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/vistas/proyecto.jsp">Gestionar Proyecto</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/login.jsp?cerrar=true">Cerrar Sesion</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>