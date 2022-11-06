/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal.cart;

import com.google.gson.Gson;
import com.google.gson.annotations.JsonAdapter;
import dal.DBContext;
import dal.product.CategoryDBContext;
import dal.product.GroupDBContext;
import dal.product.ImageDBContext;
import dal.product.SeaDBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.auth.Permission;
import model.auth.User;
import model.cart.Cart;
import model.product.Category;
import model.product.Group;
import model.product.Image;
import model.product.Sea;

/**
 *
 * @author giaki
 */
public class CartDBContext extends DBContext<Cart> {

    public static void main(String[] args) {
        CartDBContext cd = new CartDBContext();
    Cart list = cd.findBySeaUser(10012, 4);
        Gson j = new Gson();
        String a = j.toJson(list);
        System.out.println(a);
    }

    public ArrayList<Cart> findByUser(int userId) {
        ArrayList<Cart> carts = new ArrayList<>();
        CategoryDBContext categoryDB = new CategoryDBContext();
        ImageDBContext imageDB = new ImageDBContext();
        SeaDBContext seaDB = new SeaDBContext();
        String sql = "SELECT [cart].[id]\n"
                + "                      ,[cart].[userId]\n"
                + "                     ,[cart].[seaId]\n"
                + "                      ,[cart].[quantity]\n"
                + "                      ,[cart].[created_at]\n"
                + "                     ,[cart].[updated_at]\n"
                + "                 ,[sea].[name]\n"
                + "                      ,[sea].[brand]\n"
                + "                     ,[sea].[price]\n"
                + "                     ,[sea].[quantity] as 'sea_quantity'\n"
                + "                      ,[sea].[description]\n"
                + "                      ,[sea].[content]\n"
                + "                      ,[sea].[isSale]\n"
                + "                      ,[sea].[discount]\n"
                + "                     ,[sea].[categoryId]\n"
                + "                      ,[sea].[stateid]\n"
                + "                	 ,[category].[name] as 'categoryName'\n"
                + "                      ,[group].[id] as 'groupId'\n"
                + "                      ,[group].[name] as 'groupName'\n"
                + "                	 ,[user].[username]\n"
                + "                      ,[user].[password]\n"
                + "                     ,[user].[first_name]\n"
                + "                      ,[user].[lastname]\n"
                + "                      ,[user].[birthday]\n"
                + "                      ,[user].[email]\n"
                + "                      ,[user].[phone]\n"
                + "                      ,[user].[gender]\n"
                + "                      ,[user].[is_super]\n"
                + "                     ,[user].[isactive]\n"
                + "                      ,[user].[permission]\n"
                + "                      ,[user].[avatar]\n"
                + "                	  ,[permission].[id] as 'permissionId'\n"
                + "                      ,[permission].[name] as 'permissionName'\n"
                + "                 FROM [cart]\n"
                + "                 INNER JOIN [sea] ON [sea].[id] = [cart].[seaId]\n"
                + "                 INNER JOIN [category] ON [category].[id] = [sea].[categoryId]\n"
                + "                 INNER JOIN [group] ON [group].[id] = [category].[groupId]\n"
                + "                 LEFT JOIN  [user] ON [user].[id] = [cart].[userId]\n"
                + "                 INNER JOIN [user_permisstion] ON [user_permisstion].[userId] = [user].[id]\n"
                + "                INNER JOIN [permission]  ON [permission].[id] = [user_permisstion].[permisstionid]\n"
                + "                 WHERE [cart].[userId] = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Cart cart = new Cart();
                cart.setId(result.getInt("id"));
                cart.setSeaId(result.getInt("seaId"));
                cart.setQuantity(result.getInt("quantity"));

                User user = new User();
                user.setId(result.getInt("userId"));
                user.setUsername(result.getString("username"));
                user.setPassword(result.getString("password"));
                user.setEmail(result.getString("email"));
                user.setFirst_name(result.getString("first_name"));
                user.setLast_name(result.getString("lastname"));
                user.setBirthday(result.getDate("birthday"));
                user.setPhone(result.getString("phone"));
                user.setGender(result.getBoolean("gender"));
                user.setPermission(result.getString("permission"));
                user.setIs_active(result.getBoolean("isactive"));
                user.setIs_super(result.getBoolean("is_super"));
                user.setAvatar(result.getString("avatar"));

                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);

                Sea sea = new Sea();
                sea.setId(result.getInt("seaId"));
                sea.setName(result.getString("name"));
                sea.setBrand(result.getString("brand"));
                sea.setPrice(result.getDouble("price"));
                sea.setQuantity(result.getInt("sea_quantity"));
                sea.setDescription(result.getString("description"));
                sea.setContent(result.getString("content"));
                sea.setIsSale(result.getBoolean("isSale"));
                sea.setDiscount(result.getInt("discount"));
                sea.setCategoryId(result.getInt("categoryId"));
                sea.setStateId(result.getInt("stateid"));

                ArrayList<Image> images = imageDB.findBySea(sea.getId());
                sea.setImages(images);

                Group group = new Group();
                group.setId(result.getInt("groupId"));
                group.setName(result.getString("groupName"));

                Category category = new Category();
                category.setId(sea.getId());
                category.setName(result.getString("categoryName"));
                category.setGroup(group);
                sea.setCategory(category);

                cart.setSea(sea);
                carts.add(cart);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return carts;
    }

    @Override
    public ArrayList<Cart> list() {
        ArrayList<Cart> carts = new ArrayList<>();
        ImageDBContext imageDB = new ImageDBContext();
        CategoryDBContext categoryDB = new CategoryDBContext();
        String sql = "SELECT [cart].[id]\n"
                + "                      ,[cart].[userId]\n"
                + "                     ,[cart].[seaId]\n"
                + "                      ,[cart].[quantity]\n"
                + "                      ,[cart].[created_at]\n"
                + "                     ,[cart].[updated_at]\n"
                + "                 ,[sea].[name]\n"
                + "                      ,[sea].[brand]\n"
                + "                     ,[sea].[price]\n"
                + "                     ,[sea].[quantity] as 'sea_quantity'\n"
                + "                      ,[sea].[description]\n"
                + "                      ,[sea].[content]\n"
                + "                      ,[sea].[isSale]\n"
                + "                      ,[sea].[discount]\n"
                + "                     ,[sea].[categoryId]\n"
                + "                      ,[sea].[stateid]\n"
                + "                	 ,[category].[name] as 'categoryName'\n"
                + "                      ,[group].[id] as 'groupId'\n"
                + "                      ,[group].[name] as 'groupName'\n"
                + "                	 ,[user].[username]\n"
                + "                      ,[user].[password]\n"
                + "                     ,[user].[first_name]\n"
                + "                      ,[user].[lastname]\n"
                + "                      ,[user].[birthday]\n"
                + "                      ,[user].[email]\n"
                + "                      ,[user].[phone]\n"
                + "                      ,[user].[gender]\n"
                + "                      ,[user].[is_super]\n"
                + "                     ,[user].[isactive]\n"
                + "                      ,[user].[permission]\n"
                + "                      ,[user].[avatar]\n"
                + "                	  ,[permission].[id] as 'permissionId'\n"
                + "                      ,[permission].[name] as 'permissionName'\n"
                + "                 FROM [cart]\n"
                + "                 INNER JOIN [sea] ON [sea].[id] = [cart].[seaId]\n"
                + "                 INNER JOIN [category] ON [category].[id] = [sea].[categoryId]\n"
                + "                 INNER JOIN [group] ON [group].[id] = [category].[groupId]\n"
                + "                 LEFT JOIN  [user] ON [user].[id] = [cart].[userId]\n"
                + "                 INNER JOIN [user_permisstion] ON [user_permisstion].[userId] = [user].[id]\n"
                + "                INNER JOIN [permission]  ON [permission].[id] = [user_permisstion].[permisstionid]\n";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Cart cart = new Cart();
                cart.setId(result.getInt("id"));
                cart.setSeaId(result.getInt("seaId"));
                cart.setQuantity(result.getInt("quantity"));

                User user = new User();
                user.setId(result.getInt("userId"));
                user.setUsername(result.getString("username"));
                user.setPassword(result.getString("password"));
                user.setEmail(result.getString("email"));
                user.setFirst_name(result.getString("first_name"));
                user.setLast_name(result.getString("lastname"));
                user.setBirthday(result.getDate("birthday"));
                user.setPhone(result.getString("phone"));
                user.setGender(result.getBoolean("gender"));
                user.setPermission(result.getString("permission"));
                user.setIs_active(result.getBoolean("isactive"));
                user.setIs_super(result.getBoolean("is_super"));
                user.setAvatar(result.getString("avatar"));

                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);

                Sea sea = new Sea();
                sea.setId(result.getInt("seaId"));
                sea.setName(result.getString("name"));
                sea.setBrand(result.getString("brand"));
                sea.setPrice(result.getDouble("price"));
                sea.setQuantity(result.getInt("sea_quantity"));
                sea.setDescription(result.getString("description"));
                sea.setContent(result.getString("content"));
                sea.setIsSale(result.getBoolean("isSale"));
                sea.setDiscount(result.getInt("discount"));

                sea.setCategoryId(result.getInt("categoryId"));
                sea.setStateId(result.getInt("stateid"));

                ArrayList<Image> images = imageDB.findBySea(sea.getId());
                sea.setImages(images);

                Group group = new Group();
                group.setId(result.getInt("groupId"));
                group.setName(result.getString("groupName"));

                Category category = new Category();
                category.setId(sea.getId());
                category.setName(result.getString("categoryName"));
                category.setGroup(group);
                sea.setCategory(category);

                cart.setSea(sea);
                carts.add(cart);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return carts;
    }

    @Override
    public Cart get(int id) {
        ArrayList<Cart> carts = new ArrayList<>();
        ImageDBContext imageDB = new ImageDBContext();
        CategoryDBContext categoryDB = new CategoryDBContext();
        String sql = "SELECT [cart].[id]\n"
                + "                      ,[cart].[userId]\n"
                + "                     ,[cart].[seaId]\n"
                + "                      ,[cart].[quantity]\n"
                + "                      ,[cart].[created_at]\n"
                + "                     ,[cart].[updated_at]\n"
                + "                 ,[sea].[name]\n"
                + "                      ,[sea].[brand]\n"
                + "                     ,[sea].[price]\n"
                + "                     ,[sea].[quantity] as 'sea_quantity'\n"
                + "                      ,[sea].[description]\n"
                + "                      ,[sea].[content]\n"
                + "                      ,[sea].[isSale]\n"
                + "                      ,[sea].[discount]\n"
                + "                     ,[sea].[categoryId]\n"
                + "                      ,[sea].[stateid]\n"
                + "                	 ,[category].[name] as 'categoryName'\n"
                + "                      ,[group].[id] as 'groupId'\n"
                + "                      ,[group].[name] as 'groupName'\n"
                + "                	 ,[user].[username]\n"
                + "                      ,[user].[password]\n"
                + "                     ,[user].[first_name]\n"
                + "                      ,[user].[lastname]\n"
                + "                      ,[user].[birthday]\n"
                + "                      ,[user].[email]\n"
                + "                      ,[user].[phone]\n"
                + "                      ,[user].[gender]\n"
                + "                      ,[user].[is_super]\n"
                + "                     ,[user].[isactive]\n"
                + "                      ,[user].[permission]\n"
                + "                      ,[user].[avatar]\n"
                + "                	  ,[permission].[id] as 'permissionId'\n"
                + "                      ,[permission].[name] as 'permissionName'\n"
                + "                 FROM [cart]\n"
                + "                 INNER JOIN [sea] ON [sea].[id] = [cart].[seaId]\n"
                + "                 INNER JOIN [category] ON [category].[id] = [sea].[categoryId]\n"
                + "                 INNER JOIN [group] ON [group].[id] = [category].[groupId]\n"
                + "                 LEFT JOIN  [user] ON [user].[id] = [cart].[userId]\n"
                + "                 INNER JOIN [user_permisstion] ON [user_permisstion].[userId] = [user].[id]\n"
                + "                INNER JOIN [permission]  ON [permission].[id] = [user_permisstion].[permisstionid]\n"
                + " WHERE [cart].[id] = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Cart cart = new Cart();
                cart.setId(result.getInt("id"));
                cart.setSeaId(result.getInt("seaId"));
                cart.setQuantity(result.getInt("quantity"));
                User user = new User();
                user.setId(result.getInt("userId"));
                user.setUsername(result.getString("username"));
                user.setPassword(result.getString("password"));
                user.setEmail(result.getString("email"));
                user.setFirst_name(result.getString("first_name"));
                user.setLast_name(result.getString("lastname"));
                user.setBirthday(result.getDate("birthday"));
                user.setPhone(result.getString("phone"));
                user.setGender(result.getBoolean("gender"));
                user.setPermission(result.getString("permission"));
                user.setIs_active(result.getBoolean("isactive"));
                user.setIs_super(result.getBoolean("is_super"));
                user.setAvatar(result.getString("avatar"));

                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);

                Sea sea = new Sea();
                sea.setId(result.getInt("seaId"));
                sea.setName(result.getString("name"));
                sea.setBrand(result.getString("brand"));
                sea.setPrice(result.getDouble("price"));
                sea.setQuantity(result.getInt("sea_quantity"));
                sea.setDescription(result.getString("description"));
                sea.setContent(result.getString("content"));
                sea.setIsSale(result.getBoolean("isSale"));
                sea.setDiscount(result.getInt("discount"));
                sea.setCategoryId(result.getInt("categoryId"));
                sea.setStateId(result.getInt("stateid"));

                ArrayList<Image> images = imageDB.findBySea(sea.getId());
                sea.setImages(images);

                Group group = new Group();
                group.setId(result.getInt("groupId"));
                group.setName(result.getString("groupName"));

                Category category = new Category();
                category.setId(sea.getId());
                category.setName(result.getString("categoryName"));
                category.setGroup(group);
                sea.setCategory(category);

                cart.setSea(sea);
                return cart;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Cart findBySeaUser(int seaId, int userId) {
        ArrayList<Cart> carts = new ArrayList<>();
        ImageDBContext imageDB = new ImageDBContext();
        CategoryDBContext categoryDB = new CategoryDBContext();
        String sql = "SELECT [cart].[id]\n"
                + "                      ,[cart].[userId]\n"
                + "                     ,[cart].[seaId]\n"
                + "                      ,[cart].[quantity]\n"
                + "                      ,[cart].[created_at]\n"
                + "                     ,[cart].[updated_at]\n"
                + "                 ,[sea].[name]\n"
                + "                      ,[sea].[brand]\n"
                + "                     ,[sea].[price]\n"
                + "                     ,[sea].[quantity] as 'sea_quantity'\n"
                + "                      ,[sea].[description]\n"
                + "                      ,[sea].[content]\n"
                + "                      ,[sea].[isSale]\n"
                + "                      ,[sea].[discount]\n"
                + "                     ,[sea].[categoryId]\n"
                + "                      ,[sea].[stateid]\n"
                + "                	 ,[category].[name] as 'categoryName'\n"
                + "                      ,[group].[id] as 'groupId'\n"
                + "                      ,[group].[name] as 'groupName'\n"
                + "                	 ,[user].[username]\n"
                + "                      ,[user].[password]\n"
                + "                     ,[user].[first_name]\n"
                + "                      ,[user].[lastname]\n"
                + "                      ,[user].[birthday]\n"
                + "                      ,[user].[email]\n"
                + "                      ,[user].[phone]\n"
                + "                      ,[user].[gender]\n"
                + "                      ,[user].[is_super]\n"
                + "                     ,[user].[isactive]\n"
                + "                      ,[user].[permission]\n"
                + "                      ,[user].[avatar]\n"
                + "                	  ,[permission].[id] as 'permissionId'\n"
                + "                      ,[permission].[name] as 'permissionName'\n"
                + "                 FROM [cart]\n"
                + "                 INNER JOIN [sea] ON [sea].[id] = [cart].[seaId]\n"
                + "                 INNER JOIN [category] ON [category].[id] = [sea].[categoryId]\n"
                + "                 INNER JOIN [group] ON [group].[id] = [category].[groupId]\n"
                + "                 LEFT JOIN  [user] ON [user].[id] = [cart].[userId]\n"
                + "                 INNER JOIN [user_permisstion] ON [user_permisstion].[userId] = [user].[id]\n"
                + "                INNER JOIN [permission]  ON [permission].[id] = [user_permisstion].[permisstionid]\n"
                + " WHERE [cart].[seaId] = ? and [cart].[userId] = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, seaId);
            statement.setInt(2, userId);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Cart cart = new Cart();
                cart.setId(result.getInt("id"));
                cart.setSeaId(result.getInt("seaId"));
                cart.setQuantity(result.getInt("quantity"));

                User user = new User();
                user.setId(result.getInt("userId"));
                user.setUsername(result.getString("username"));
                user.setPassword(result.getString("password"));
                user.setEmail(result.getString("email"));
                user.setFirst_name(result.getString("first_name"));
                user.setLast_name(result.getString("lastname"));
                user.setBirthday(result.getDate("birthday"));
                user.setPhone(result.getString("phone"));
                user.setGender(result.getBoolean("gender"));
                user.setPermission(result.getString("permission"));
                user.setIs_active(result.getBoolean("isactive"));
                user.setIs_super(result.getBoolean("is_super"));
                user.setAvatar(result.getString("avatar"));

                Permission permission = new Permission();
                permission.setId(result.getInt("permissionId"));
                permission.setName(result.getString("permissionName"));
                user.setUser_permission(permission);

                Sea sea = new Sea();
                sea.setId(result.getInt("seaId"));
                sea.setName(result.getString("name"));
                sea.setBrand(result.getString("brand"));
                sea.setPrice(result.getDouble("price"));
                sea.setQuantity(result.getInt("sea_quantity"));
                sea.setDescription(result.getString("description"));
                sea.setContent(result.getString("content"));
                sea.setIsSale(result.getBoolean("isSale"));
                sea.setDiscount(result.getInt("discount"));
                sea.setCategoryId(result.getInt("categoryId"));
                sea.setStateId(result.getInt("stateid"));

                ArrayList<Image> images = imageDB.findBySea(sea.getId());
                sea.setImages(images);

                Group group = new Group();
                group.setId(result.getInt("groupId"));
                group.setName(result.getString("groupName"));

                Category category = new Category();
                category.setId(sea.getId());
                category.setName(result.getString("categoryName"));
                category.setGroup(group);
                sea.setCategory(category);

                cart.setSea(sea);
                return cart;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public Cart insert(Cart model) {
        String sql = "INSERT INTO [cart]\n"
                + "           ([userId]\n"
                + "           ,[seaId]\n"
                + "           ,[quantity]\n"
                + "     VALUES(?,?,?)";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, model.getUserId());
            statement.setInt(2, model.getSeaId());
            statement.setInt(3, model.getQuantity());
            statement.executeUpdate();
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    @Override
    public void update(Cart model) {
        String sql = "UPDATE [cart]\n"
                + "        SET [quantity] = ?\n"
                + "     WHERE id = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, model.getQuantity());
            statement.setInt(2, model.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void deleteBySea(int seaId, int userId) {
        try {
            String sql = "DELETE FROM [cart]\n"
                    + "WHERE seaId = ? and userId = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, seaId);
            statement.setInt(2, userId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void delete(int id) {
        try {
            String sql = "DELETE FROM [cart]\n"
                    + "WHERE id = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
