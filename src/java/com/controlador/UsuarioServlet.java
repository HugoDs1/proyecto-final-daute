package com.controlador;

import com.modelo.Usuario;
import com.modelo.UsuarioDAO;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UsuarioServlet extends HttpServlet {

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
            int id = Integer.parseInt(request.getParameter("txtID"));
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            int nivel = Integer.parseInt(request.getParameter("txtNivel"));
            String mensaje = "Error";
            int res;

            Usuario u = new Usuario(id, username, password, nivel);
            UsuarioDAO usuarioDAO = new UsuarioDAO();

            if (request.getParameter("btnGuardar") != null) {
                res = usuarioDAO.insertar(u);
                if (res != 0) {
                    mensaje = "Registro Agregado";
                }
            } else if (request.getParameter("btnEditar") != null) {
                res = usuarioDAO.modificar(u);
                if (res != 0) {
                    mensaje = "Registro Modificado";
                }
            } else if (request.getParameter("btnEliminar") != null) {
                res = usuarioDAO.eliminar(u);
                if (res != 0) {
                    mensaje = "Registro Eliminado";
                }
            }
            request.setAttribute("message", mensaje);
            request.getRequestDispatcher("/vistas/usuarios.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("Error: " + e);
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
