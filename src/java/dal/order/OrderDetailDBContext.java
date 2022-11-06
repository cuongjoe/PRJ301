/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal.order;

import dal.DBContext;
import dal.product.SeaDBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.order.OrderDetail;
import model.order.OrderState;
import model.product.Category;
import model.product.Group;
import model.product.Sea;
import model.product.State;

/**
 *
 * @author giaki
 */
public class OrderDetailDBContext extends DBContext<OrderDetail> {
    public static void main(String[] args) {
        OrderDetailDBContext od = new OrderDetailDBContext();
        ArrayList<OrderDetail> list = od.findByOrderId(1);
        System.out.println(list.get(0).getPrice());
    }
//test xong 
    public ArrayList<OrderDetail> findByOrderId(int orderId) {
        ArrayList<OrderDetail> orderDetails = new ArrayList<>();
        String sql = "SELECT [order_detail].[id]\n" +
"                    ,[order_detail].[quantity]\n" +
"                     ,[order_detail].[price]\n" +
"                     ,[order_detail].[discount]\n" +
"                      ,[order_detail].[created_at]\n" +
"                    ,[order_detail].[updated_at]\n" +
"                      ,[order_detail].[seaId]\n" +
"                      ,[order_detail].[orderId]\n" +
"               	  ,[sea].[name]\n" +
"                      ,[sea].[brand]\n" +
"                     ,[sea].[price] as 'sea_price'\n" +
"                      ,[sea].[quantity] as 'sea_quantity'\n" +
"                      ,[sea].[description]\n" +
"                      ,[sea].[content]\n" +
"                     ,[sea].[isSale]\n" +
"                     ,[sea].[discount] as 'sea_discount'\n" +
//"                      ,[sea].[created_at] as 'sea_created_at'\n" +
//"                    ,[sea].[updated_at] as 'sea_updated_at'\n" +
"                      ,[sea].[categoryId]\n" +
"                      ,[sea].[stateid]\n" +
"                    ,[category].[name] as 'categoryName'\n" +
"                      ,[group].[id] as 'groupId'\n" +
"                      ,[group].[name] as 'groupName'\n" +
"                      ,[state].[name] as 'stateName'\n" +
"                     ,ROW_NUMBER() OVER (ORDER BY [sea].[id] DESC) as row_index\n" +
"                  FROM [order_detail]\n" +
"                INNER JOIN [sea] ON [sea].[id] = [order_detail].[seaId]\n" +
"                  INNER JOIN [category] ON [category].[id] = [sea].[categoryId]\n" +
"                  INNER JOIN [group] ON [group].[id] = [category].[groupId]\n" +
"                  INNER JOIN [state] ON [state].[id] = [sea].[stateid]"
                + " WHERE [order_detail].[orderId] = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, orderId);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setId(result.getInt("id"));
                orderDetail.setOrderId(result.getInt("orderId"));
                orderDetail.setSeaId(result.getInt("seaId"));
                orderDetail.setQuantity(result.getInt("quantity"));
                orderDetail.setDiscount(result.getInt("discount"));
                orderDetail.setPrice(result.getDouble("price"));
//                orderDetail.setCreated_at(result.getTimestamp("created_at"));
//                orderDetail.setUpdated_at(result.getTimestamp("updated_at"));

                Sea sea = new Sea();
                sea.setId(result.getInt("seaId"));
                sea.setName(result.getString("name"));
                sea.setBrand(result.getString("brand"));
                sea.setPrice(result.getDouble("sea_price"));
                sea.setQuantity(result.getInt("sea_quantity"));
                sea.setDescription(result.getString("description"));
                sea.setContent(result.getString("content"));
                sea.setIsSale(result.getBoolean("isSale"));
                sea.setDiscount(result.getInt("sea_discount"));
//                sea.setCreated_at(result.getTimestamp("sea_created_at"));
//                sea.setUpdated_at(result.getTimestamp("sea_updated_at"));
                sea.setCategoryId(result.getInt("categoryId"));
                sea.setStateId(result.getInt("stateid"));

                Group group = new Group();
                group.setId(result.getInt("groupId"));
                group.setName(result.getString("groupName"));

                Category category = new Category();
                category.setId(sea.getId());
                category.setName(result.getString("categoryName"));
                category.setGroup(group);
                sea.setCategory(category);

                State state = new State();
                state.setId(result.getInt("stateid"));
                state.setName(result.getString("stateName"));
                sea.setState(state);

                orderDetail.setSea(sea);
                orderDetails.add(orderDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderDetails;
    }

    @Override
    public ArrayList<OrderDetail> list() {
        ArrayList<OrderDetail> orderDetails = new ArrayList<>();
        String sql = "SELECT [order_detail].[id]\n"
                + "      ,[order_detail].[quantity]\n"
                + "      ,[order_detail].[price]\n"
                + "      ,[order_detail].[discount]\n"
                + "      ,[order_detail].[created_at]\n"
                + "      ,[order_detail].[updated_at]\n"
                + "      ,[order_detail].[seaId]\n"
                + "      ,[order_detail].[orderId]\n"
                + "	  ,[sea].[name]\n"
                + "      ,[sea].[brand]\n"
                + "      ,[sea].[price] as 'sea_price'\n"
                + "      ,[sea].[quantity] as 'sea_quantity'\n"
                + "      ,[sea].[description]\n"
                + "      ,[sea].[content]\n"
                + "      ,[sea].[isSale]\n"
                + "      ,[sea].[discount] as 'sea_discount'\n"
                + "      ,[sea].[created_at] as 'sea_created_at'\n"
                + "      ,[sea].[updated_at] as 'sea_updated_at'\n"
                + "      ,[sea].[categoryId]\n"
                + "      ,[sea].[state]\n"
                + "      ,[category].[name] as 'categoryName'\n"
                + "      ,[group].[id] as 'groupId'\n"
                + "      ,[group].[name] as 'groupName'\n"
                + "      ,[state].[name] as 'stateName'\n"
                + "      ,ROW_NUMBER() OVER (ORDER BY [sea].[id] DESC) as row_index\n"
                + "  FROM [order_detail]\n"
                + "  INNER JOIN [sea] ON [sea].[id] = [order_detail].[seaId]\n"
                + "  INNER JOIN [category] ON [category].[id] = [sea].[categoryId]\n"
                + "  INNER JOIN [group] ON [group].[id] = [category].[groupId]\n"
                + "  INNER JOIN [state] ON [state].[id] = [sea].[state]";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setId(result.getInt("id"));
                orderDetail.setOrderId(result.getInt("orderId"));
                orderDetail.setSeaId(result.getInt("seaId"));
                orderDetail.setQuantity(result.getInt("quantity"));
                orderDetail.setDiscount(result.getInt("discount"));
                orderDetail.setPrice(result.getDouble("price"));
                orderDetail.setCreated_at(result.getTimestamp("created_at"));
                orderDetail.setUpdated_at(result.getTimestamp("updated_at"));

                Sea sea = new Sea();
                sea.setId(result.getInt("seaId"));
                sea.setName(result.getString("name"));
                sea.setBrand(result.getString("brand"));
                sea.setPrice(result.getDouble("sea_price"));
                sea.setQuantity(result.getInt("sea_quantity"));
                sea.setDescription(result.getString("description"));
                sea.setContent(result.getString("content"));
                sea.setIsSale(result.getBoolean("isSale"));
                sea.setDiscount(result.getInt("sea_discount"));
                sea.setCreated_at(result.getTimestamp("sea_created_at"));
                sea.setUpdated_at(result.getTimestamp("sea_updated_at"));
                sea.setCategoryId(result.getInt("categoryId"));
                sea.setStateId(result.getInt("state"));

                Group group = new Group();
                group.setId(result.getInt("groupId"));
                group.setName(result.getString("groupName"));

                Category category = new Category();
                category.setId(sea.getId());
                category.setName(result.getString("categoryName"));
                category.setGroup(group);
                sea.setCategory(category);

                State state = new State();
                state.setId(result.getInt("state"));
                state.setName(result.getString("stateName"));
                sea.setState(state);

                orderDetail.setSea(sea);
                orderDetails.add(orderDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderDetails;
    }

    @Override
    public OrderDetail get(int id) {
        SeaDBContext seaDB = new SeaDBContext();
        String sql = "SELECT [order_detail].[id]\n"
                + "      ,[order_detail].[quantity]\n"
                + "      ,[order_detail].[price]\n"
                + "      ,[order_detail].[discount]\n"
                + "      ,[order_detail].[created_at]\n"
                + "      ,[order_detail].[updated_at]\n"
                + "      ,[order_detail].[seaId]\n"
                + "      ,[order_detail].[orderId]\n"
                + "	  ,[sea].[name]\n"
                + "      ,[sea].[brand]\n"
                + "      ,[sea].[price] as 'sea_price'\n"
                + "      ,[sea].[quantity] as 'sea_quantity'\n"
                + "      ,[sea].[description]\n"
                + "      ,[sea].[content]\n"
                + "      ,[sea].[isSale]\n"
                + "      ,[sea].[discount] as 'sea_discount'\n"
                + "      ,[sea].[created_at] as 'sea_created_at'\n"
                + "      ,[sea].[updated_at] as 'sea_updated_at'\n"
                + "      ,[sea].[categoryId]\n"
                + "      ,[sea].[state]\n"
                + "      ,[category].[name] as 'categoryName'\n"
                + "      ,[group].[id] as 'groupId'\n"
                + "      ,[group].[name] as 'groupName'\n"
                + "      ,[state].[name] as 'stateName'\n"
                + "      ,ROW_NUMBER() OVER (ORDER BY [sea].[id] DESC) as row_index\n"
                + "  FROM [order_detail]\n"
                + "  INNER JOIN [sea] ON [sea].[id] = [order_detail].[seaId]\n"
                + "  INNER JOIN [category] ON [category].[id] = [sea].[categoryId]\n"
                + "  INNER JOIN [group] ON [group].[id] = [category].[groupId]\n"
                + "  INNER JOIN [state] ON [state].[id] = [sea].[state]\n"
                + " WHERE [order_detail].[id] = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setId(result.getInt("id"));
                orderDetail.setOrderId(result.getInt("orderId"));
                orderDetail.setSeaId(result.getInt("seaId"));
                orderDetail.setQuantity(result.getInt("quantity"));
                orderDetail.setDiscount(result.getInt("discount"));
                orderDetail.setPrice(result.getDouble("price"));
                orderDetail.setCreated_at(result.getTimestamp("created_at"));
                orderDetail.setUpdated_at(result.getTimestamp("updated_at"));

                Sea sea = new Sea();
                sea.setId(result.getInt("seaId"));
                sea.setName(result.getString("name"));
                sea.setBrand(result.getString("brand"));
                sea.setPrice(result.getDouble("sea_price"));
                sea.setQuantity(result.getInt("sea_quantity"));
                sea.setDescription(result.getString("description"));
                sea.setContent(result.getString("content"));
                sea.setIsSale(result.getBoolean("isSale"));
                sea.setDiscount(result.getInt("sea_discount"));
                sea.setCreated_at(result.getTimestamp("sea_created_at"));
                sea.setUpdated_at(result.getTimestamp("sea_updated_at"));
                sea.setCategoryId(result.getInt("categoryId"));
                sea.setStateId(result.getInt("state"));

                Group group = new Group();
                group.setId(result.getInt("groupId"));
                group.setName(result.getString("groupName"));

                Category category = new Category();
                category.setId(sea.getId());
                category.setName(result.getString("categoryName"));
                category.setGroup(group);
                sea.setCategory(category);

                State state = new State();
                state.setId(result.getInt("state"));
                state.setName(result.getString("stateName"));
                sea.setState(state);

                orderDetail.setSea(sea);
                return orderDetail;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public OrderDetail getLast() {
        SeaDBContext seaDB = new SeaDBContext();
        String sql = "SELECT TOP 1 [order_detail].[id]\n"
                + "      ,[order_detail].[quantity]\n"
                + "      ,[order_detail].[price]\n"
                + "      ,[order_detail].[discount]\n"
                + "      ,[order_detail].[created_at]\n"
                + "      ,[order_detail].[updated_at]\n"
                + "      ,[order_detail].[seaId]\n"
                + "      ,[order_detail].[orderId]\n"
                + "	 ,[sea].[name]\n"
                + "      ,[sea].[brand]\n"
                + "      ,[sea].[price] as 'sea_price'\n"
                + "      ,[sea].[quantity] as 'sea_quantity'\n"
                + "      ,[sea].[description]\n"
                + "      ,[sea].[content]\n"
                + "      ,[sea].[isSale]\n"
                + "      ,[sea].[discount] as 'sea_discount'\n"
                + "      ,[sea].[created_at] as 'sea_created_at'\n"
                + "      ,[sea].[updated_at] as 'sea_updated_at'\n"
                + "      ,[sea].[categoryId]\n"
                + "      ,[sea].[state]\n"
                + "      ,[category].[name] as 'categoryName'\n"
                + "      ,[group].[id] as 'groupId'\n"
                + "      ,[group].[name] as 'groupName'\n"
                + "      ,[state].[name] as 'stateName'\n"
                + "      ,ROW_NUMBER() OVER (ORDER BY [sea].[id] DESC) as row_index\n"
                + "  FROM [order_detail]\n"
                + "  INNER JOIN [sea] ON [sea].[id] = [order_detail].[seaId]\n"
                + "  INNER JOIN [category] ON [category].[id] = [sea].[categoryId]\n"
                + "  INNER JOIN [group] ON [group].[id] = [category].[groupId]\n"
                + "  INNER JOIN [state] ON [state].[id] = [sea].[state]\n"
                + "  ORDER BY [order_detail].[id] DESC";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setId(result.getInt("id"));
                orderDetail.setOrderId(result.getInt("orderId"));
                orderDetail.setSeaId(result.getInt("seaId"));
                orderDetail.setQuantity(result.getInt("quantity"));
                orderDetail.setDiscount(result.getInt("discount"));
                orderDetail.setPrice(result.getDouble("price"));
                orderDetail.setCreated_at(result.getTimestamp("created_at"));
                orderDetail.setUpdated_at(result.getTimestamp("updated_at"));

                Sea sea = new Sea();
                sea.setId(result.getInt("seaId"));
                sea.setName(result.getString("name"));
                sea.setBrand(result.getString("brand"));
                sea.setPrice(result.getDouble("sea_price"));
                sea.setQuantity(result.getInt("sea_quantity"));
                sea.setDescription(result.getString("description"));
                sea.setContent(result.getString("content"));
                sea.setIsSale(result.getBoolean("isSale"));
                sea.setDiscount(result.getInt("sea_discount"));
                sea.setCreated_at(result.getTimestamp("sea_created_at"));
                sea.setUpdated_at(result.getTimestamp("sea_updated_at"));
                sea.setCategoryId(result.getInt("categoryId"));
                sea.setStateId(result.getInt("state"));

                Group group = new Group();
                group.setId(result.getInt("groupId"));
                group.setName(result.getString("groupName"));

                Category category = new Category();
                category.setId(sea.getId());
                category.setName(result.getString("categoryName"));
                category.setGroup(group);
                sea.setCategory(category);

                State state = new State();
                state.setId(result.getInt("state"));
                state.setName(result.getString("stateName"));
                sea.setState(state);
                orderDetail.setSea(sea);
                return orderDetail;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public OrderDetail insert(OrderDetail model) {
        String sql = "INSERT INTO [order_detail]\n"
                + "           ([quantity]\n"
                + "           ,[price]\n"
                + "           ,[discount]\n"
                + "           ,[created_at]\n"
                + "           ,[updated_at]\n"
                + "           ,[seaId]\n"
                + "           ,[orderId])\n"
                + "     VALUES(?,?,?,?,?,?,?)";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, model.getQuantity());
            statement.setDouble(2, model.getPrice());
            statement.setInt(3, model.getDiscount());
            statement.setTimestamp(4, model.getCreated_at());
            statement.setTimestamp(5, model.getUpdated_at());
            statement.setInt(6, model.getSeaId());
            statement.setInt(7, model.getOrderId());
            statement.executeUpdate();
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    @Override
    public void update(OrderDetail model) {
        String sql = "UPDATE [order_detail]\n"
                + "        SET [quantity]=?\n"
                + "           ,[price]=?\n"
                + "           ,[discount]=?\n"
                + "           ,[created_at]=?\n"
                + "           ,[updated_at]=?\n"
                + "           ,[seaId]=?\n"
                + "           ,[orderId]=?\n"
                + "     WHERE id = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, model.getQuantity());
            statement.setDouble(2, model.getPrice());
            statement.setInt(3, model.getDiscount());
            statement.setTimestamp(4, model.getCreated_at());
            statement.setTimestamp(5, model.getUpdated_at());
            statement.setInt(6, model.getSeaId());
            statement.setInt(7, model.getOrderId());
            statement.setInt(8, model.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    @Override
    public void delete(int id) {
        try {
            String sql = "DELETE FROM [order_detail]\n"
                    + "WHERE id = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteBySea(int seaId) {
        try {
            String sql = "DELETE FROM [order_detail]\n"
                    + "WHERE seaId = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, seaId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
