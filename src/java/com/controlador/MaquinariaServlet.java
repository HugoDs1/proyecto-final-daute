package com.controlador;

import com.modelo.Maquinaria;
import com.modelo.MaquinariaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MaquinariaServlet extends HttpServlet {

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
            int codigo = Integer.parseInt(request.getParameter("txtCodigo"));
            String nombre = request.getParameter("txtNombre");
            int stock = Integer.parseInt(request.getParameter("txtStock"));
            String descripcion = request.getParameter("txtDescripcion");
            String mensaje = "Error";
            int res;

            Maquinaria c = new Maquinaria(codigo, nombre, stock, descripcion);
            MaquinariaDAO maquinariaDAO = new MaquinariaDAO();

            if (request.getParameter("btnGuardar") != null) {
                res = maquinariaDAO.insertarMaquinaria(c);
                if (res != 0) {
                    mensaje = "Registro Agregado";
                }
            } else if (request.getParameter("btnEditar") != null) {
                res = maquinariaDAO.modificarMaquinaria(c);
                if (res != 0) {
                    mensaje = "Registro Modificado";
                }
            } else if (request.getParameter("btnEliminar") != null) {
                res = maquinariaDAO.eliminarMaquinaria(c);
                if (res != 0) {
                    mensaje = "Registro Eliminado";
                }

            }
            request.setAttribute("message", mensaje);
            request.getRequestDispatcher("/vistas/maquinaria.jsp").forward(request, response);

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
