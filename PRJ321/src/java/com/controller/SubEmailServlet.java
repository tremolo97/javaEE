package com.controller;

import com.model.SubEmailModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SubEmailServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = (String) request.getParameter("txtSubemail");
            final String header = "Greetings from Divine Shop - Games and Gears";
            String content = "You have subscribed to news and sales from Divine Shop - Games and Gears\n"
                    + "You can cancel your subscribe by following the link be low!\n"
                    + "Unsubscribe here: http://localhost:8080/PRJ321/UnsubEmailServlet?txtSubemail=";
            try {
                if (new SubEmailModel().subscribe(email)) {
                    request.setAttribute("subEmail", email);
                    request.getRequestDispatcher("SubEmail.jsp").forward(request, response);
                    content += email;
                    new Thread(new SendMail(email, header, content)).start();
                } else {
                    request.getRequestDispatcher("SubEmail.jsp").forward(request, response);
                }
            } catch (Exception ex) {
                Logger.getLogger(SubEmailServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
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
