/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal.product;

import com.google.gson.Gson;
import dal.DBContext;
import dal.order.OrderDetailDBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.product.Category;
import model.product.Group;
import model.product.Image;
import model.product.Sea;
import model.product.State;
import utils.FileManage;



public class SeaDBContext extends DBContext<Sea> {

    public static void main(String[] args) {
        SeaDBContext pd = new SeaDBContext();
        ArrayList<Sea> list = pd.getSeas("", -1, -1, 1, 1,"[sea].[price]","asc");
        Gson g = new Gson();
        String a = g.toJson(list);
        System.out.println(a);
    }

// findByCategory : done
    
    // getSeas sửa xong  thiếu cách search tiếng việt
    public ArrayList<Sea> getSeas(String search, int idGroup, int idCategory, int pageIndex, int pageSize, String getField,String getAD) {
        ArrayList<Sea> seas = new ArrayList<>();
        ImageDBContext imageDB = new ImageDBContext();
        String sql = "SELECT * from (SELECT  [sea].[id]\n"
                + "                  ,[sea].[name]\n"
                + "                     ,[sea].[brand]\n"
                + "                     ,[sea].[price]\n"
                + "                    ,[sea].[quantity]\n"
                + "                    ,[sea].[description]\n"
                + "                     ,[sea].[content]\n"
                + "                      ,[sea].[isSale]\n"
                + "                     ,[sea].[discount]\n"
                + "                    ,[sea].[created_at] \n"
                + "                    ,[sea].[updated_at] \n"
                + "                    ,[sea].[categoryId]\n"
                + "                     ,[sea].[stateid]\n"
                + "                ,[category].[name] as 'categoryName'\n"
                + "                      ,[group].[id] as 'groupId'\n"
                + "                   ,[group].[name] as 'groupName'\n"
                + "               	 ,[state].[name] as 'stateName'\n"
                + "                      ,ROW_NUMBER() OVER (ORDER BY [sea].[id] DESC) as row_index\n"
                + "                  FROM [sea]\n"
                + "                 INNER JOIN [category] ON [category].[id] = [sea].[categoryId]\n"
                + "                 INNER JOIN [group] ON [group].[id] = [category].[groupId]\n"
                + "                 INNER JOIN [state] ON [state].[id] = [sea].[stateid]"
                + " WHERE [sea].[name] LIKE N'%" + search +"%'" ;
        if (idGroup != -1) {
            sql += " AND [group].[id] = ? ";
            if (idCategory != -1) {
                sql += " AND [category].[id] = ? ";
            }
        } else {
            if (idCategory != -1) {
                sql += " AND [category].[id] = ? ";
            }
        }

        sql += ") [sea]  WHERE row_index >= (? - 1) * ? + 1 AND row_index <= ? * ?";
        if(!getField.equals("")){
            sql +=" ORDER by "+getField+" " +getAD;
        }
        
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
//            statement.setString(1,"%"+search+"%" );
            if (idGroup != -1) {
                statement.setInt(1, idGroup);
                if (idCategory != -1) {
                    statement.setInt(2, idCategory);
                    statement.setInt(3, pageIndex);
                    statement.setInt(4, pageSize);
                    statement.setInt(5, pageIndex);
                    statement.setInt(6, pageSize);
                } else {
                    statement.setInt(2, pageIndex);
                    statement.setInt(3, pageSize);
                    statement.setInt(4, pageIndex);
                    statement.setInt(5, pageSize);
                }
            } else {
                if (idCategory != -1) {
                    statement.setInt(1, idCategory);
                    statement.setInt(2, pageIndex);
                    statement.setInt(3, pageSize);
                    statement.setInt(4, pageIndex);
                    statement.setInt(5, pageSize);
                } else {
                    statement.setInt(1, pageIndex);
                    statement.setInt(2, pageSize);
                    statement.setInt(3, pageIndex);
                    statement.setInt(4, pageSize);
                }
            }
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Sea sea = new Sea();
                sea.setId(result.getInt("id"));
                sea.setName(result.getString("name"));
                sea.setBrand(result.getString("brand"));
                sea.setPrice(result.getDouble("price"));
                sea.setQuantity(result.getInt("quantity"));
                sea.setDescription(result.getString("description"));
                sea.setContent(result.getString("content"));
                sea.setIsSale(result.getBoolean("isSale"));
                sea.setDiscount(result.getInt("discount"));
//                sea.setCreated_at(result.getTimestamp("created_at"));
//                sea.setUpdated_at(result.getTimestamp("updated_at"));
                sea.setCategoryId(result.getInt("categoryId"));
                sea.setStateId(result.getInt("stateid"));
                Group group = new Group();
                group.setId(result.getInt("groupId"));
                group.setName(result.getString("groupName"));
                Category category = new Category();
                category.setId(result.getInt("categoryId"));
                category.setName(result.getString("categoryName"));
                category.setGroup(group);
                sea.setCategory(category);
                State state = new State();
                state.setId(result.getInt("stateid"));
                state.setName(result.getString("stateName"));
                sea.setState(state);
                ArrayList<Image> images = imageDB.findBySea(sea.getId());
                sea.setImages(images);
                seas.add(sea);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SeaDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return seas;
    }

//    public ArrayList<Sea> getSeas(String search, int idGroup, int idCategory) {
//        ArrayList<Sea> seas = new ArrayList<>();
//        ImageDBContext imageDB = new ImageDBContext();
//        String sql = "SELECT [sea].[id]\n"
//                + "      ,[sea].[name]\n"
//                + "      ,[brand]\n"
//                + "      ,[price]\n"
//                + "      ,[quantity]\n"
//                + "      ,[description]\n"
//                + "      ,[content]\n"
//                + "      ,[issale]\n"
//                + "      ,[discount]\n"                  
//                + "      ,[categoryid]\n"
//                + "	  ,[category].[name] as 'categoryName'\n"
//                + "	   ,[group].[id] as 'groupId'\n"
//                + "	   ,[group].[name] as 'groupName'\n"
//                + "	   ,[state].[name] as 'stateName'\n"
//                + "\n"
//                + "	   ,ROW_NUMBER() OVER (ORDER BY [sea].[id] DESC) as row_index\n"
//                + "  FROM [dbo].[sea]\n"
//                + "  INNER JOIN [category] ON [category].[id] = [sea].[categoryId]\n"
//                + "  INNER JOIN [group] ON [group].[id] = [category].[groupId]\n"
//                + "  INNER JOIN [state] ON [state].[id] = [sea].[stateid]"
//                + " WHERE [sea].[name] LIKE ? ";
//        if (idGroup != -1) {
//            sql += " AND [group].[id] = ? ";
//            if (idCategory != -1) {
//                sql += " AND [category].[id] = ? ";
//            }
//        } else {
//            if (idCategory != -1) {
//                sql += " AND [category].[id] = ? ";
//            }
//        }
//
//
//        PreparedStatement statement = null;
//        try {
//            statement = connection.prepareStatement(sql);
//            statement.setString(1, "%" + search + "%");
//            if (idGroup != -1) {
//                statement.setInt(2, idGroup);
//                if (idCategory != -1) {
//                    statement.setInt(3, idCategory);
//
//                }
//                
//            } else {
//                if (idCategory != -1) {
//                    statement.setInt(2, idCategory);
//
//                } 
//            }
//            ResultSet result = statement.executeQuery();
//            while (result.next()) {
//                Sea sea = new Sea();
//                sea.setId(result.getInt("id"));
//                sea.setName(result.getString("name"));
//                sea.setBrand(result.getString("brand"));
//                sea.setPrice(result.getDouble("price"));
//                sea.setQuantity(result.getInt("quantity"));
//                sea.setDescription(result.getString("description"));
//                sea.setContent(result.getString("content"));
//                sea.setIsSale(result.getBoolean("issale"));
//                sea.setDiscount(result.getInt("discount"));
//                sea.setCategoryId(result.getInt("categoryid"));
//                Group group = new Group();
//                group.setId(result.getInt("groupId"));
//                group.setName(result.getString("groupName"));
//                Category category = new Category();
//                category.setId(result.getInt("categoryId"));
//                category.setName(result.getString("categoryName"));
//                category.setGroup(group);
//                sea.setCategory(category);
//                State state = new State();
////                state.setId(result.getInt("stateid"));
//                state.setName(result.getString("stateName"));
//                sea.setState(state);
//                ArrayList<Image> images = imageDB.findBySea(sea.getId());
//                sea.setImages(images);
//                seas.add(sea);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(SeaDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return seas;
//    }
    // getsizefromsearch đã check
    public int getSizeFromSearch(String search, int idGroup, int idCategory) {
        String sql = "SELECT COUNT([sea].[id]) as 'size' \n"
                + "  FROM [sea] INNER JOIN [category] ON [category].[id] = [sea].[categoryId]\n"
                + "  INNER JOIN [group] ON [group].[id] = [category].[groupId]\n"
                + " WHERE [sea].[name] LIKE ? ";
        if (idGroup != -1) {
            sql += " AND [group].[id] = ?";
            if (idCategory != -1) {
                sql += " AND [category].[id] = ?";
            }
        } else {
            if (idCategory != -1) {
                sql += " AND [category].[id] = ?";
            }
        }
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + search + "%");
            if (idGroup != -1) {
                statement.setInt(2, idGroup);
                if (idCategory != -1) {
                    sql += " AND [category].[id] = ? ";
                    statement.setInt(3, idCategory);
                }
            } else {
                if (idCategory != -1) {
                    sql += " [category].[id] = ? ";
                    statement.setInt(2, idCategory);
                }
            }
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                int size = result.getInt("size");
                return size;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SeaDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ArrayList<Sea> findByCategory(int categoryId) {
        ArrayList<Sea> seas = new ArrayList<>();
        ImageDBContext imageDB = new ImageDBContext();
        String sql = "SELECT [sea].[id]\n"
                + "      ,[sea].[name]\n"
                + "      ,[brand]\n"
                + "      ,[price]\n"
                + "      ,[quantity]\n"
                + "      ,[description]\n"
                + "      ,[content]\n"
                + "      ,[issale]\n"
                + "      ,[discount]\n"
                + "      ,[categoryid]\n"
                + "	  ,[category].[name] as 'categoryName'\n"
                + "	   ,[group].[id] as 'groupId'\n"
                + "	   ,[group].[name] as 'groupName'\n"
                + "	   ,[state].[name] as 'stateName'\n"
                + "\n"
                + "	   ,ROW_NUMBER() OVER (ORDER BY [sea].[id] DESC) as row_index\n"
                + "  FROM [dbo].[sea]\n"
                + "  INNER JOIN [category] ON [category].[id] = [sea].[categoryId]\n"
                + "  INNER JOIN [group] ON [group].[id] = [category].[groupId]\n"
                + "  INNER JOIN [state] ON [state].[id] = [sea].[stateid]"
                + " WHERE [sea].[categoryId] = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, categoryId);
//            statement.setInt(2, pageIndex);
//            statement.setInt(3, pageSize);
//            statement.setInt(4, pageIndex);
//            statement.setInt(5, pageSize);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Sea sea = new Sea();
                sea.setId(result.getInt("id"));
                sea.setName(result.getString("name"));
                sea.setBrand(result.getString("brand"));
                sea.setPrice(result.getDouble("price"));
                sea.setQuantity(result.getInt("quantity"));
                sea.setDescription(result.getString("description"));
                sea.setContent(result.getString("content"));
                sea.setIsSale(result.getBoolean("isSale"));
                sea.setDiscount(result.getInt("discount"));
                sea.setCategoryId(result.getInt("categoryId"));
//                sea.setStateId(result.getInt("state"));

                Group group = new Group();
                group.setId(result.getInt("groupId"));
                group.setName(result.getString("groupName"));

                Category category = new Category();
                category.setId(result.getInt("categoryId"));
                category.setName(result.getString("categoryName"));
                category.setGroup(group);
                sea.setCategory(category);

                State state = new State();
//                state.setId(result.getInt("state"));
                state.setName(result.getString("stateName"));
                sea.setState(state);

                ArrayList<Image> images = imageDB.findBySea(sea.getId());
                sea.setImages(images);
                seas.add(sea);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SeaDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return seas;
    }

    @Override
    public ArrayList<Sea> list() {
        ArrayList<Sea> seas = new ArrayList<>();
        CategoryDBContext categoryDB = new CategoryDBContext();
        ImageDBContext imageDB = new ImageDBContext();
        String sql = "SELECT [sea].[id]\n"
                + "      ,[sea].[name]\n"
                + "      ,[sea].[brand]\n"
                + "      ,[sea].[price]\n"
                + "      ,[sea].[quantity]\n"
                + "      ,[sea].[description]\n"
                + "      ,[sea].[content]\n"
                + "      ,[sea].[isSale]\n"
                + "      ,[sea].[discount]\n"
                + "      ,[sea].[created_at] \n"
                + "      ,[sea].[updated_at] \n"
                + "      ,[sea].[categoryId]\n"
                + "      ,[sea].[state]\n"
                + "	  ,[category].[name] as 'categoryName'\n"
                + "      ,[group].[id] as 'groupId'\n"
                + "      ,[group].[name] as 'groupName'\n"
                + "	  ,[state].[name] as 'stateName'\n"
                + "  FROM [sea]\n"
                + "  INNER JOIN [category] ON [category].[id] = [sea].[categoryId]\n"
                + "  INNER JOIN [group] ON [group].[id] = [category].[groupId]\n"
                + "  INNER JOIN [state] ON [state].[id] = [sea].[state]";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Sea sea = new Sea();
                sea.setId(result.getInt("id"));
                sea.setName(result.getString("name"));
                sea.setBrand(result.getString("brand"));
                sea.setPrice(result.getDouble("price"));
                sea.setQuantity(result.getInt("quantity"));
                sea.setDescription(result.getString("description"));
                sea.setContent(result.getString("content"));
                sea.setIsSale(result.getBoolean("isSale"));
                sea.setDiscount(result.getInt("discount"));
                sea.setCreated_at(result.getTimestamp("created_at"));
                sea.setUpdated_at(result.getTimestamp("updated_at"));
                sea.setCategoryId(result.getInt("categoryId"));
                sea.setStateId(result.getInt("state"));
                Group group = new Group();
                group.setId(result.getInt("groupId"));
                group.setName(result.getString("groupName"));
                Category category = new Category();
                category.setId(result.getInt("categoryId"));
                category.setName(result.getString("categoryName"));
                category.setGroup(group);
                sea.setCategory(category);
                State state = new State();
                state.setId(result.getInt("state"));
                state.setName(result.getString("stateName"));
                sea.setState(state);
                ArrayList<Image> images = imageDB.findBySea(sea.getId());
                sea.setImages(images);
                seas.add(sea);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SeaDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return seas;
    }

    @Override
    public Sea get(int id) {
        CategoryDBContext categoryDB = new CategoryDBContext();
        ImageDBContext imageDB = new ImageDBContext();
        StateDBContext stateDB = new StateDBContext();
        String sql = "SELECT [sea].[id]\n"
                + "      ,[sea].[name]\n"
                + "      ,[brand]\n"
                + "      ,[price]\n"
                + "      ,[quantity]\n"
                + "      ,[description]\n"
                + "      ,[content]\n"
                + "      ,[issale]\n"
                + "      ,[discount]\n"
                + "      ,[categoryid]\n"
                + "	  ,[category].[name] as 'categoryName'\n"
                + "	   ,[group].[id] as 'groupId'\n"
                + "	   ,[group].[name] as 'groupName'\n"
                + "	   ,[state].[name] as 'stateName'\n"
                + "\n"
                + "	   ,ROW_NUMBER() OVER (ORDER BY [sea].[id] DESC) as row_index\n"
                + "  FROM [dbo].[sea]\n"
                + "  INNER JOIN [category] ON [category].[id] = [sea].[categoryId]\n"
                + "  INNER JOIN [group] ON [group].[id] = [category].[groupId]\n"
                + "  INNER JOIN [state] ON [state].[id] = [sea].[stateid]"
                + " WHERE [sea].[id] = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Sea sea = new Sea();
                sea.setId(result.getInt("id"));
                sea.setName(result.getString("name"));
                sea.setBrand(result.getString("brand"));
                sea.setPrice(result.getDouble("price"));
                sea.setQuantity(result.getInt("quantity"));
                sea.setDescription(result.getString("description"));
                sea.setContent(result.getString("content"));
                sea.setIsSale(result.getBoolean("isSale"));
                sea.setDiscount(result.getInt("discount"));
//                sea.setCreated_at(result.getTimestamp("created_at"));
//                sea.setUpdated_at(result.getTimestamp("updated_at"));
                sea.setCategoryId(result.getInt("categoryId"));
//                sea.setStateId(result.getInt("state"));
                Group group = new Group();
                group.setId(result.getInt("groupId"));
                group.setName(result.getString("groupName"));
                Category category = new Category();
                category.setId(result.getInt("categoryId"));
                category.setName(result.getString("categoryName"));
                category.setGroup(group);
                sea.setCategory(category);
                State state = new State();
//                state.setId(result.getInt("state"));
                state.setName(result.getString("stateName"));
                sea.setState(state);
                ArrayList<Image> images = imageDB.findBySea(sea.getId());
                sea.setImages(images);

                return sea;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SeaDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Sea getLast() {
        ArrayList<Sea> seas = new ArrayList<>();
        CategoryDBContext categoryDB = new CategoryDBContext();
        ImageDBContext imageDB = new ImageDBContext();
        StateDBContext stateDB = new StateDBContext();
        String sql = "SELECT TOP 1 [sea].[id]\n"
                + "      ,[sea].[name]\n"
                + "      ,[sea].[brand]\n"
                + "      ,[sea].[price]\n"
                + "      ,[sea].[quantity]\n"
                + "      ,[sea].[description]\n"
                + "      ,[sea].[content]\n"
                + "      ,[sea].[isSale]\n"
                + "      ,[sea].[discount]\n"
                + "      ,[sea].[created_at] \n"
                + "      ,[sea].[updated_at] \n"
                + "      ,[sea].[categoryId]\n"
                + "      ,[sea].[state]\n"
                + "	 ,[category].[name] as 'categoryName'\n"
                + "      ,[group].[id] as 'groupId'\n"
                + "      ,[group].[name] as 'groupName'\n"
                + "	 ,[state].[name] as 'stateName'\n"
                + "  FROM [sea]\n"
                + "  INNER JOIN [category] ON [category].[id] = [sea].[categoryId]\n"
                + "  INNER JOIN [group] ON [group].[id] = [category].[groupId]\n"
                + "  INNER JOIN [state] ON [state].[id] = [sea].[state]\n"
                + " ORDER BY id DESC";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Sea sea = new Sea();
                sea.setId(result.getInt("id"));
                sea.setName(result.getString("name"));
                sea.setBrand(result.getString("brand"));
                sea.setPrice(result.getDouble("price"));
                sea.setQuantity(result.getInt("quantity"));
                sea.setDescription(result.getString("description"));
                sea.setContent(result.getString("content"));
                sea.setIsSale(result.getBoolean("isSale"));
                sea.setDiscount(result.getInt("discount"));
                sea.setCreated_at(result.getTimestamp("created_at"));
                sea.setUpdated_at(result.getTimestamp("updated_at"));
                sea.setCategoryId(result.getInt("categoryId"));
                sea.setStateId(result.getInt("state"));
                Group group = new Group();
                group.setId(result.getInt("groupId"));
                group.setName(result.getString("groupName"));
                Category category = new Category();
                category.setId(result.getInt("categoryId"));
                category.setName(result.getString("categoryName"));
                category.setGroup(group);
                sea.setCategory(category);
                State state = new State();
                state.setId(result.getInt("state"));
                state.setName(result.getString("stateName"));
                sea.setState(state);
                ArrayList<Image> images = imageDB.findBySea(sea.getId());
                sea.setImages(images);
                return sea;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SeaDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public Sea insert(Sea model) {
        String sql = "INSERT INTO [sea]\n"
                + "           ([name]\n"
                + "           ,[brand]\n"
                + "           ,[price]\n"
                + "           ,[quantity]\n"
                + "           ,[description]\n"
                + "           ,[content]\n"
                + "           ,[isSale]\n"
                + "           ,[discount]\n"
                + "           ,[created_at]\n"
                + "           ,[updated_at]\n"
                + "           ,[categoryId]\n"
                + "           ,[state])\n"
                + "     VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, model.getName());
            statement.setString(2, model.getBrand());
            statement.setDouble(3, model.getPrice());
            statement.setInt(4, model.getQuantity());
            statement.setString(5, model.getDescription());
            statement.setString(6, model.getContent());
            statement.setBoolean(7, model.isIsSale());
            statement.setInt(8, model.getDiscount());
            statement.setTimestamp(9, model.getCreated_at());
            statement.setTimestamp(10, model.getUpdated_at());
            statement.setInt(11, model.getCategoryId());
            statement.setInt(12, model.getStateId());
            statement.executeUpdate();
            return getLast();
        } catch (SQLException ex) {
            Logger.getLogger(SeaDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(SeaDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(SeaDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    @Override
    public void update(Sea model) {
        String sql = "UPDATE [sea]\n"
                + "      SET  [name] = ?\n"
                + "           ,[brand] = ?\n"
                + "           ,[price] = ?\n"
                + "           ,[quantity] = ?\n"
                + "           ,[description] = ?\n"
                + "           ,[content] = ?\n"
                + "           ,[isSale] = ?\n"
                + "           ,[discount] = ?\n"
                + "           ,[created_at] = ?\n"
                + "           ,[updated_at] = ?\n"
                + "           ,[categoryId] = ?\n"
                + "           ,[state] = ?\n"
                + " WHERE id = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, model.getName());
            statement.setString(2, model.getBrand());
            statement.setDouble(3, model.getPrice());
            statement.setInt(4, model.getQuantity());
            statement.setString(5, model.getDescription());
            statement.setString(6, model.getContent());
            statement.setBoolean(7, model.isIsSale());
            statement.setInt(8, model.getDiscount());
            statement.setTimestamp(9, model.getCreated_at());
            statement.setTimestamp(10, model.getUpdated_at());
            statement.setInt(11, model.getCategoryId());
            statement.setInt(12, model.getStateId());
            statement.setInt(13, model.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SeaDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(SeaDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(SeaDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void deleteByCategory(int id) {
        try {
            String sql = "DELETE FROM [sea]\n"
                    + "WHERE categoryId = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SeaDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void delete(int id) {
        ImageDBContext imageDB = new ImageDBContext();
        OrderDetailDBContext orderDetailDB = new OrderDetailDBContext();
        imageDB.deleteBySea(id);
        orderDetailDB.deleteBySea(id);
        try {
            String sql = "DELETE FROM [sea]\n"
                    + "WHERE id = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SeaDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getSize() {
        String sql = "SELECT COUNT([sea].[id]) as 'size'  FROM [sea]";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                int size = result.getInt("size");
                return size;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

}
