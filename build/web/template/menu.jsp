<%-- 
    Document   : menu
    Created on : Oct 24, 2022, 3:53:28 PM
    Author     : bless
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-dark bg-warning fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="/docs/5.1/assets/brand/bootstrap-logo.svg" alt="" width="30" height="24" class="d-inline-block align-text-top">
      Constructora
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="offcanvas offcanvas-end bg-dark" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel" style="color: white">Offcanvas</h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
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