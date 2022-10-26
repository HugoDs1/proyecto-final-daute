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
                    <p class="fw-bold text-white">Username</p>
                </div>
                <div class="w-25">
                    <img
                        class="w-100 h-100 rounded-circle"
                        src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLe5PABjXc17cjIMOibECLM7ppDwMmiDg6Dw&usqp=CAU"
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
                        <a class="nav-link" href="#">Gestionar Empleados</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.servletContext.contextPath}/vistas/maquinaria.jsp">Gestionar Maquinaria</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Gestionar Proyecto</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Reportes
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown">
                            <li><a class="dropdown-item" href="#">Proyectos en Ejecucion</a></li>
                            <li><a class="dropdown-item" href="#">Proyectos Entregados</a></li>
                            <li><a class="dropdown-item" href="#">Ganancias</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Boletas de Pago</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>