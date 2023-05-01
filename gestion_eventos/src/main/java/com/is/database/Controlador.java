/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.is.database;

import com.is.modelo.Login;
import com.is.modelo.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author santi
 */

@WebServlet(name="Controlador",urlPatterns={"/Controlador"})
public class Controlador extends HttpServlet {

    LoginDAO dao = new LoginDAO();
    Login login = new Login();
    int r,admin;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        if (accion.equals("Ingresar")) {
            String user = request.getParameter("usuario");
            String password = request.getParameter("passlogin");
            ///////url sillas
            String cod_evento = request.getParameter("cod_evento");
            String nombrerecinto = request.getParameter("nombrerecinto");
            String sillas = request.getParameter("sillas");

            login.setUsuario(user);
            login.setPassword(password);
            r = dao.validar(login);
            
            //sesion desde index
            if (r == 1 && cod_evento.equals("null") && nombrerecinto.equals("null")) {
                admin = dao.validadAdmin(login);
                
                //verificar que sea un admin
                if(admin==1){
                    request.getSession().setAttribute("user", user); 
                    request.getRequestDispatcher("PanelConfiguraciones.jsp").forward(request, response);
                }else{
                    request.getSession().setAttribute("user", user); 
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                
                
            }
            //sesion desde compra sillas
            else if(r == 1 && !(cod_evento.equals("null") && nombrerecinto.equals("null")) ){
                admin = dao.validadAdmin(login);
                //verificar que sea admin
                if(admin==1){
                    request.getSession().setAttribute("user", user); 
                    request.getRequestDispatcher("PanelConfiguraciones.jsp").forward(request, response);
                    
                }else{
                    request.getSession().setAttribute("user", user); 
                    request.getRequestDispatcher(sillas+".jsp?codigo_evento="+cod_evento+"&sala="+nombrerecinto).forward(request, response);
                }
                
                 
            }
            //usuario no encontrado
            else {
                
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
            //cerrar sesion
        }else{
                request.getSession().setAttribute("user", "Inicie sesion");
                request.getRequestDispatcher("Login.jsp").forward(request, response);

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
