/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.product;

import java.sql.Timestamp;
import model.BaseModel;

/**
 *
 * @author giaki
 */
public class Category extends BaseModel{
    private String name;
    private int groupId;
    private Group group;

    public Category() {
    }

    public Category(int id,String name, int groupId ) {
        super(id);
        this.name = name;
        this.groupId = groupId;
       
    }
   



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }
    
    
}
