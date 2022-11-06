/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.product;

import java.util.ArrayList;
import model.BaseModel;

/**
 *
 * @author giaki
 */
public class Group extends BaseModel{
    private String name;
    ArrayList<Category> categories;
     public Group() {
    }

    public Group(String name,int id) {
        super(id);
        this.name = name;
       
    }
     

    public ArrayList<Category> getCategories() {
        return categories;
    }

   
    

    public void setCategories(ArrayList<Category> categories) {
        this.categories = categories;
    }
    
    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
