/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.product;

import dal.product.CategoryDBContext;
import dal.product.GroupDBContext;
import dal.product.SeaDBContext;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import static java.lang.System.out;
import model.common.Pagination;
import model.product.Category;
import model.product.Group;
import model.product.Sea;
import utils.Validate;

public class SeaController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Validate validate = new Validate();
            int pageSize = 12;
            String page = validate.getField(request, "page", false);
//            String search = validate.getField(request, "q", false);
            String search = request.getParameter("q");
            String group = validate.getField(request, "group", false);
            String category = validate.getField(request, "category", false);
            String getField = request.getParameter("orderBy");
            String getAD = "";
            int idGroup = -1;
            int idCategory = -1;
            if (group == null || group.isEmpty() || group.equalsIgnoreCase("all")) {
                idGroup = -1;
            } else {
                idGroup = validate.fieldInt(group, "Error category");
            }
            if (category == null || category.isEmpty() || category.equalsIgnoreCase("all")) {
                idCategory = -1;
            } else {
                idCategory = validate.fieldInt(category, "Error category");
            }

            if (page == null || page.trim().length() == 0) {
                page = "1";
            }
            int pageIndex = 0;
            try {
                pageIndex = validate.fieldInt(page, "Something error!");
                if (pageIndex <= 0) {
                    pageIndex = 1;
                }
            } catch (Exception e) {
                pageIndex = 1;
            }
            if (search == null) {
                search = "";
            }
            if (getField == null) {
                getField = "";
            }
            if (getField.equals("az")) {
                getField = "[sea].[name]";
                getAD = "desc";
            }
            if (getField.equals("za")) {
                getField = "[sea].[name]";
                getAD = "asc";
            }
            if (getField.equals("ptd")) {
                getField = "[sea].[price]";
                getAD = "asc";
            }
            if (getField.equals("pgd")) {
                getField = "[sea].[price]";
                getAD = "desc";
            }
            if (getField.equals("tgn")) {
                getField = "[sea].[created_at]";
                getAD = "desc";
            }
            if (getField.equals("tgo")) {
                getField = "[sea].[created_at]";
                getAD = "asc";
            }

            System.out.println(search);
            SeaDBContext seaDB = new SeaDBContext();
            Pagination pagination = new Pagination(pageIndex, pageSize, seaDB.getSizeFromSearch(search, idGroup, idCategory));
            ArrayList<Sea> seas = seaDB.getSeas(search, idGroup, idCategory, pageIndex, pageSize, getField, getAD);
            CategoryDBContext categoryDB = new CategoryDBContext();
            ArrayList<Category> categorys = categoryDB.list();
            request.setAttribute("categorys", categorys);
            GroupDBContext groupDB = new GroupDBContext();
            ArrayList<Group> groups = groupDB.list();
            request.setAttribute("groups", groups);
            request.setAttribute("seas", seas);
            request.setAttribute("pagination", pagination);
            request.getRequestDispatcher("/views/product/sea.jsp").forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("/views/error/accessDenied.jsp").forward(request, response);
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
