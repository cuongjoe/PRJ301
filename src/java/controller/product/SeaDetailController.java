/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.product;

import dal.product.GroupDBContext;
import dal.product.SeaDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.product.Group;
import model.product.Sea;
import utils.Validate;

/**
 *
 * @author giaki
 */
public class SeaDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Validate validate = new Validate();
        try {
            String idString = validate.getField(request, "id", true);
            int id = validate.fieldInt(idString, "Error get field id");
            SeaDBContext seaDB = new SeaDBContext();
            Sea sea = seaDB.get(id);
            request.setAttribute("sea", sea);
            GroupDBContext groupDB = new GroupDBContext();
            ArrayList<Group> groups = groupDB.list();
            request.setAttribute("groups", groups);
            
            ArrayList<Sea> sameSeas = seaDB.findByCategory(sea.getCategory().getId());
            request.setAttribute("sameSeas", sameSeas);
            
            request.getRequestDispatcher("/views/product/seaDetail.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(controller.admin.product.SeaDetailController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
