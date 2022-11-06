/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.auth;

import dal.auth.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.auth.User;
import utils.HashPass;
import utils.Validate;

/**
 *
 * @author giaki
 */
public class LoginAdminController extends HttpServlet {

    private final Validate validate = new Validate();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
                
        boolean loggedInUser = session != null && session.getAttribute("user") != null;
        boolean loggedInAdmin = session != null && session.getAttribute("admin") != null;
        
        if (loggedInUser) {
            request.getRequestDispatcher("/views/error/accessDenied.jsp").forward(request, response);
        } else {
            if (loggedInAdmin) {
                response.sendRedirect("/dashboard");
            } else {
                request.getRequestDispatcher("/views/admin/auth/login.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String username = validate.getField(request, "username", true);
            String password = validate.getField(request, "password", true);
            UserDBContext db = new UserDBContext();
//            HashPass hashPass = new HashPass();
            User user = db.getUser(username, password);
            if (user != null && user.isIs_super()) {
                HttpSession session = request.getSession();
                session.setAttribute("admin", user);
                session.setAttribute("user", user);
                response.sendRedirect("/cuongproject/dashboard");
            } else {
                request.setAttribute("error", "Username or password wrong!");
                request.getRequestDispatcher("/views/admin/auth/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/views/admin/auth/login.jsp").forward(request, response);
        }
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
