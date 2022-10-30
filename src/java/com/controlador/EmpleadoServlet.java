package com.controlador;

import com.modelo.Empleado;
import com.modelo.EmpleadoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EmpleadoServlet extends HttpServlet {

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
            //Captura de Datos 
            int idEmpleado = Integer.parseInt(request.getParameter("txtIdEmpleado"));
            String dui = (request.getParameter("txtDUI"));
            String nombre = (request.getParameter("txtNombre"));
            String apellido = (request.getParameter("txtApellido"));
            double salario = Double.parseDouble(request.getParameter("txtSalario"));
            int estado = Integer.parseInt(request.getParameter("txtEstado"));
            String mensaje = "Error";
            int res;

            Empleado em = new Empleado(idEmpleado, dui, nombre, apellido, salario, estado);
            EmpleadoDAO empleadoDAO = new EmpleadoDAO();

            if (request.getParameter("btnGuardar") != null) {
                res = empleadoDAO.insertarEmpleado(em);
                if (res != 0) {
                    mensaje = "Registro Agregado";
                }
            } else if (request.getParameter("btnEditar") != null) {
                res = empleadoDAO.modificarEmpleado(em);
                if (res != 0) {
                    mensaje = "Registro Modificado";
                }
            } else if (request.getParameter("btnEliminar") != null) {
                res = empleadoDAO.eliminarEmpleado(em);
                if (res != 0) {
                    mensaje = "Registro Eliminado";
                }
            }
            request.setAttribute("message", mensaje);
            request.getRequestDispatcher("/vistas/empleado.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("Error :" + e.getMessage() + "Diego");
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
