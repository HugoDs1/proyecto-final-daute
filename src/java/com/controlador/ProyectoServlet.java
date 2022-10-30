package com.controlador;

import com.modelo.Proyecto;
import com.modelo.ProyectoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
public class ProyectoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            //Captura de datos
            int idProyecto = Integer.parseInt(request.getParameter("txtIdP"));
            String nombre = request.getParameter("txtNombre");
            double valor = Double.parseDouble(request.getParameter("txtValor"));
            int estado = Integer.parseInt(request.getParameter("txtEstado"));
            int idUsuario = Integer.parseInt(request.getParameter("txtUsuario"));
            int idMunicipio = Integer.parseInt(request.getParameter("txtIdMunicipio"));
            String mensaje = "Error";
            int res;

            Proyecto p = new Proyecto(idProyecto, idMunicipio, idUsuario, nombre, estado, valor);
            ProyectoDAO proyectoDAO = new ProyectoDAO();

            if (request.getParameter("btnGuardar") != null) {
                res = proyectoDAO.insertarProyecto(p);
                if (res != 0) {
                    mensaje = "Registro Agregado";
                }
            } else if (request.getParameter("btnEditar") != null) {
                res = proyectoDAO.modificarProyecto(p);
                if (res != 0) {
                    mensaje = "Registro Modificado";
                }
            } else if (request.getParameter("btnEliminar") != null) {
                res = proyectoDAO.eliminarProyecto(p);
                if (res != 0) {
                    mensaje = "Registro Eliminado";
                }

            }
            request.setAttribute("message", mensaje);
            request.getRequestDispatcher("/vistas/proyecto.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
