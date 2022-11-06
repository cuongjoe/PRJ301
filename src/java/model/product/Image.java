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
public class Image extends BaseModel{
    private String image;
    private int seaId;

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getSeaId() {
        return seaId;
    }

    public void setSeaId(int seaId) {
        this.seaId = seaId;
    }
    
    
}
