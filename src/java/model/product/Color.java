/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.product;

import model.BaseModel;

/**
 *
 * @author giaki
 */
public class Color extends BaseModel{
    private String name;
    private String color;
    private int seaId;
    private Sea sea;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
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
    
    
}
