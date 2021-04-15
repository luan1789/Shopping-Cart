/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.FoodDTO;
import dtos.OrderDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import utils.DBIUtils;

/**
 *
 * @author PC
 */
public class OrderDAO {

    public boolean inserFullOrder(OrderDTO order) throws SQLException {
        boolean result = true;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBIUtils.getConnnection();
            if (conn != null) {
                conn.setAutoCommit(false);

                String sql = "INSERT INTO tblOrders(orderID,userID,totalMoney) VALUES(?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, order.getOrderID());
                stm.setString(2, order.getUserID());
                stm.setFloat(3, order.getTotalMoney());
                stm.executeUpdate();

                for (FoodDTO fdto : order.getListFood()) {

                    sql = "INSERT INTO tblOrderDetails(foodID,quantity,price,orderID)"
                            + " VALUES(?,?,?,?)";
                    stm = conn.prepareStatement(sql);
                    stm.setString(1, fdto.getFoodID());
                    stm.setInt(2, fdto.getQuantity());
                    stm.setFloat(3, fdto.getPrice());
                    stm.setInt(4, order.getOrderID());

                    stm.executeUpdate();

                    sql = "UPDATE tblFoods SET quantity=quantity-? WHERE foodID=?";
                    stm = conn.prepareStatement(sql);
                    stm.setInt(1, fdto.getQuantity());
                    stm.setString(2, fdto.getFoodID());

                    stm.executeUpdate();
                }

            }
            conn.commit();
        } catch (Exception e) {
            result = false;
            conn.rollback();
        } finally {

            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return result;
    }

    public List<OrderDTO> getOrder(String userID) throws SQLException {
        List<OrderDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBIUtils.getConnnection();
            if (conn != null) {
                String sql = "SELECT orderID,totalMoney,orderDate "
                        + "FROM tblOrders "
                        + "WHERE userID=? ORDER BY orderDate DESC";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    float totalMoney = rs.getFloat("totalMoney");
                    Date orderDate = new Date(rs.getDate("orderDate").getTime());
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(new OrderDTO(orderID, userID, orderDate, totalMoney));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public List<OrderDTO> getOrderBySearch(String userID, String histotrySearch, Date dateSearch) throws SQLException {
        List<OrderDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBIUtils.getConnnection();
            if (conn != null) {
                String sql = "select DISTINCT A.orderID,totalMoney,orderDate "
                        + "from tblOrders A "
                        + "join tblOrderDetails B on A.userID=? And A.orderID=B.orderID "
                        + "    and ( (CAST(A.orderDate AS DATE)= ?) or ? is null)"
                        + "join tblFoods C on B.foodID=C.foodID and C.foodName like ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                if (dateSearch == null) {
                    stm.setDate(2, null);
                    stm.setDate(3, null);
                } else {
                    stm.setDate(2, new java.sql.Date(dateSearch.getTime()));
                    stm.setDate(3, new java.sql.Date(dateSearch.getTime()));
                }
                stm.setString(4, "%" + histotrySearch + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    float totalMoney = rs.getFloat("totalMoney");
                    Date orderDate = new Date(rs.getDate("orderDate").getTime());
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(new OrderDTO(orderID, userID, orderDate, totalMoney));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public OrderDTO getOrderDetail(int orderID) throws SQLException {
        OrderDTO result = new OrderDTO();
        List<FoodDTO> listFood = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBIUtils.getConnnection();
            if (conn != null) {
                String sql = "SELECT C.foodName,C.image,B.quantity,B.price,totalMoney "
                        + "FROM tblOrders A "
                        + "JOIN tblOrderDetails B "
                        + "ON A.orderID=? AND A.orderID=B.orderID "
                        + "JOIN tblfoods C "
                        + "ON B.foodID=C.foodID ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, orderID);
                rs = stm.executeQuery();
                float totalMoney = 0;
                while (rs.next()) {
                    String foodName = rs.getString("foodName");
                    String image = rs.getString("image");
                    int quantity = rs.getInt("quantity");
                    float foodPrice = rs.getFloat("price");
                    totalMoney = rs.getFloat("totalMoney");
                    listFood.add(new FoodDTO("", foodName, foodPrice, "", image, null, "", quantity, true));
                }
                result.setListFood(listFood);
                result.setOrderID(orderID);
                result.setTotalMoney(totalMoney);
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }
}
