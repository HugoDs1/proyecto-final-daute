<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.io.File"%>
<%@page import="com.conexion.Conexion"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empresa Constructora | Gastos por Proyecto</title>
    </head>
    <body>
        <%
            Conexion con = new Conexion();
            con.conectar();
            File reportFile = new File(application.getRealPath("reportes/gastosPorProyectoReport.jasper"));
            Map parametros = new HashMap();
            parametros.put("idProyecto", Integer.parseInt(request.getParameter("idProyecto")));
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parametros, con.getCon());
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream output = response.getOutputStream();
            response.getOutputStream();
            output.write(bytes, 0, bytes.length);
            output.flush();
            output.close();
            con.desconectar();
        %>
    </body>
</html>
