/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.user;

import com.google.gson.Gson;
import controller.admin.auth.BaseAuthAdminController;
import dal.auth.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.auth.User;
import utils.FileManage;
import utils.Validate;

/**
 *
 * @author giaki
 */
@MultipartConfig
public class EditAvatarUserController extends BaseAuthAdminController {

    @Override
    protected boolean isPermissionGet(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("admin");
        int numRead = userDB.getNumberOfPermission(user.getId(), "USER", "READ");
        return numRead >= 1;
    }

    @Override
    protected boolean isPermissionPost(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("admin");
        int numRead = userDB.getNumberOfPermission(user.getId(), "USER", "READ");
        int numEdit = userDB.getNumberOfPermission(user.getId(), "USER", "EDIT");
        return numRead >= 1 && numEdit >= 1;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idString = request.getParameter("id");
        if (idString == null) {
            response.sendRedirect("/admin/users");
        }
        try {
            int id = Integer.parseInt(idString);
            UserDBContext userDB = new UserDBContext();
            Validate validate = new Validate();
            Part part = validate.getFieldAjaxFile(request, "avatar", true);
            FileManage fileManage = new FileManage();
            String folder = request.getServletContext().getRealPath("/assets/images/user");
            String filename = null;
            User user = userDB.get(id);
            if (part.getSize() != 0) {
                if (user.getAvatar() != null && !user.getAvatar().isEmpty()) {
                    fileManage.delete(user.getAvatar(), folder);
                }
                filename = fileManage.upLoad(part, folder);
            }
            if (filename != null) {
                user.setAvatar(filename);
            }
            Timestamp updated_at = new Timestamp(System.currentTimeMillis());
            user.setUpdated_at(updated_at);
            userDB.updateAvatar(user);
            String json = new Gson().toJson(user);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } catch (Exception e) {
            String json = new Gson().toJson(e);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
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
