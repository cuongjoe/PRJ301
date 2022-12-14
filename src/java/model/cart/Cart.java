/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.cart;

import java.math.BigDecimal;
import model.BaseModel;
import model.auth.User;
import model.product.Sea;

public class Cart extends BaseModel{
    private int userId;
    private User user;
    private int seaId;
    private Sea sea;
    private int quantity;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getSeaId() {
        return seaId;
    }

    public void setSeaId(int seaId) {
        this.seaId = seaId;
    }

    public Sea getSea() {
        return sea;
    }

    public void setSea(Sea sea) {
        this.sea = sea;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public BigDecimal getTotal(){
        BigDecimal total = new BigDecimal(sea.getPrice()*quantity);
        return total;
    }
    
    public BigDecimal getRealPrice(){
        BigDecimal total = new BigDecimal(sea.getPrice()*quantity - (sea.getPrice()*quantity*(double)sea.getDiscount()/100));
        return total;
    }
    
}
