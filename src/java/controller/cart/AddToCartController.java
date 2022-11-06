/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.cart;

import com.google.gson.Gson;
import dal.cart.CartDBContext;
import dal.product.SeaDBContext;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.auth.User;
import model.cart.Cart;
import utils.Validate;

/**
 *
 * @author giaki
 */
public class AddToCartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Validate validate = new Validate();
            String seaIdString = validate.getFieldAjax(request, "seaId", true);
            String quantityString = validate.getFieldAjax(request, "quantity", true);
            Timestamp created_at = new Timestamp(System.currentTimeMillis());
            Timestamp updated_at = new Timestamp(System.currentTimeMillis());

            int seaId = validate.fieldInt(seaIdString, "Error add to cart");
            int quantity = validate.fieldInt(quantityString, "Error add to cart");

            Cart cart = new Cart();
            cart.setSeaId(seaId);
            cart.setQuantity(quantity);
            cart.setCreated_at(created_at);
            cart.setUpdated_at(updated_at);

            SeaDBContext seaDB = new SeaDBContext();
            cart.setSea(seaDB.get(seaId));

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
            if (carts == null) {
                carts = new ArrayList<Cart>();
            }
            boolean isExit = false;
            for (Cart item : carts) {
                if (item.getSeaId() == cart.getSeaId()) {
                    item.setQuantity(cart.getQuantity() + item.getQuantity());
                    isExit = true;
                    break;
                }
            }
            if (user != null) {
                cart.setUserId(user.getId());
                CartDBContext cartDB = new CartDBContext();
                if (!isExit) {
                    cartDB.insert(cart);
                } else {
                    Cart old_cart = cartDB.findBySeaUser(seaId, user.getId());
                    if (old_cart != null) {
                        cart.setQuantity(old_cart.getQuantity() + quantity);
                        cart.setId(old_cart.getId());
                    }   
                    cartDB.update(cart);
                }
            }
            if (!isExit) {
                carts.add(cart);
            }

            int quantity_cart = 0;

            for (Cart item : carts) {
                quantity_cart += item.getQuantity();
            }
            session.setAttribute("carts", carts);
            session.setAttribute("quantity", quantity_cart);
            String json = new Gson().toJson(quantity_cart);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } catch (Exception ex) {
            String json = new Gson().toJson(new Error(ex.getMessage()));
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
