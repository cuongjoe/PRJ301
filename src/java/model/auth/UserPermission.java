/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.auth;

import java.sql.Timestamp;
import model.BaseModel;

/**
 *
 * @author giaki
 */
public class UserPermission extends BaseModel{
    private boolean licensed = true;
    private int userId;
    private int permissionId;

    public UserPermission() {
    }

    public UserPermission(int userId, int permissionId) {
        
        this.userId = userId;
        this.permissionId = permissionId;
    }
    
    

    public UserPermission(int userId, int permissionId, int id, Timestamp created_at, Timestamp updated_at) {
        super(id, created_at, updated_at);
        this.userId = userId;
        this.permissionId = permissionId;
    }
    

    public boolean isLicensed() {
        return licensed;
    }

    public void setLicensed(boolean licensed) {
        this.licensed = licensed;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(int permissionId) {
        this.permissionId = permissionId;
    }
    
}
