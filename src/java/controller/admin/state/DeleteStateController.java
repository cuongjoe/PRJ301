/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.state;

import controller.admin.auth.BaseAuthAdminController;
import dal.auth.UserDBContext;
import dal.product.StateDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.auth.User;
import utils.Validate;

/**
 *
 * @author giaki
 */
public class DeleteStateController extends BaseAuthAdminController {

    @Override
    protected boolean isPermissionGet(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("admin");
        int numDelete = userDB.getNumberOfPermission(user.getId(), "STATE", "DELETE");
        return numDelete >= 1;
    }

    @Override
    protected boolean isPermissionPost(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("admin");
        int numDelete = userDB.getNumberOfPermission(user.getId(), "STATE", "DELETE");
        return numDelete >= 1;
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Validate validate = new Validate();
        try {
            String idString = validate.getField(request, "id", true);
            int id = validate.fieldInt(idString, "Error get field id");
            StateDBContext stateDB = new StateDBContext();
            stateDB.delete(id);
            response.sendRedirect(request.getHeader("referer"));
        } catch (Exception ex) {
            Logger.getLogger(DeleteStateController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
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
