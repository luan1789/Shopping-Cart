/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.FoodDTO;
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
public class FoodDAO {

    public List<FoodDTO> getFoodBySearch(String categoryID, String name, float priceCheck, int pagesize, int pageNumber) throws SQLException {
        List<FoodDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBIUtils.getConnnection();
            if (conn != null) {
                String sql = "SELECT foodID,foodName,price,description,B.categoryName as category "
                        + ",createDate,image,quantity "
                        + "FROM tblFoods A "
                        + "JOIN tblCategorys B ON A.categoryID=B.categoryID AND (A.categoryID = ? OR ? is Null) AND "
                        + "status=1 AND quantity>0 AND foodName like ? AND price<=? "
                        + "ORDER BY createDate DESC "
                        + "OFFSET ? * (? - 1) ROWS "
                        + "FETCH NEXT ? ROWS ONLY ";
                stm = conn.prepareStatement(sql);
                stm.setString(1,categoryID );
                stm.setString(2,categoryID );
                stm.setString(3, "%" + name + "%");
                stm.setFloat(4, priceCheck);
                stm.setInt(5, pagesize);
                stm.setInt(6, pageNumber);
                stm.setInt(7, pagesize);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String foodID = rs.getString("foodID");
                    String foodName = rs.getString("foodName");
                    float price = rs.getFloat("price");
                    String des = rs.getString("description");
                    String category = rs.getString("category");
                    Date createDate = new Date(rs.getDate("createDate").getTime());
                    String image = rs.getString("image");
                    int quantity = rs.getInt("quantity");
                    if (result == null) {
                        result = new ArrayList<FoodDTO>();
                    }
                    result.add(new FoodDTO(foodID, foodName, price, des, image, createDate, category, quantity, true));
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

    public List<FoodDTO> getFoodBySearchAdmin(String categoryID, String name, float priceCheck, int pagesize, int pageNumber) throws SQLException {
        List<FoodDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBIUtils.getConnnection();
            if (conn != null) {
                String sql = "SELECT foodID,foodName,price,description,B.categoryName as category "
                        + ",createDate,image,quantity,status "
                        + "FROM tblFoods A "
                        + "JOIN tblCategorys B ON A.categoryID=B.categoryID AND (A.categoryID = ? OR ? is Null) AND "
                        + "foodName like ? AND price<=? "
                        + "ORDER BY createDate DESC "
                        + "OFFSET ? * (? - 1) ROWS "
                        + "FETCH NEXT ? ROWS ONLY ";
                stm = conn.prepareStatement(sql);
                stm.setString(1,  categoryID );
                stm.setString(2,  categoryID );
                stm.setString(3, "%" + name + "%");
                stm.setFloat(4, priceCheck);
                stm.setInt(5, pagesize);
                stm.setInt(6, pageNumber);
                stm.setInt(7, pagesize);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String foodID = rs.getString("foodID");
                    String foodName = rs.getString("foodName");
                    float price = rs.getFloat("price");
                    String des = rs.getString("description");
                    String category = rs.getString("category");
                    Date createDate = new Date(rs.getDate("createDate").getTime());
                    String image = rs.getString("image");
                    int quantity = rs.getInt("quantity");
                    boolean status = rs.getBoolean("status");
                    if (result == null) {
                        result = new ArrayList<FoodDTO>();
                    }
                    result.add(new FoodDTO(foodID, foodName, price, des, image, createDate, category, quantity, status));
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

    public FoodDTO getFoodDTO(String foodID) throws SQLException {
        FoodDTO result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBIUtils.getConnnection();
            if (conn != null) {
                String sql = "SELECT foodName,price,description,B.categoryName as category ,createDate,image,quantity,status "
                        + "FROM tblFoods A "
                        + "JOIN tblCategorys B ON A.categoryID=B.categoryID AND foodID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, foodID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String foodName = rs.getString("foodName");
                    float price = rs.getFloat("price");
                    String des = rs.getString("description");
                    String category = rs.getString("category");
                    Date createDate = new Date(rs.getDate("createDate").getTime());
                    String image = rs.getString("image");
                    int quantity = rs.getInt("quantity");
                    boolean status = rs.getBoolean("status");
                    result = new FoodDTO(foodID, foodName, price, des, image, createDate, category, quantity, status);
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

    public void deleteFood(String foodID) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        int rs = 0;
        try {
            conn = DBIUtils.getConnnection();
            if (conn != null) {
                String sql = "UPDATE tblFoods SET status=0 WHERE foodID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, foodID);
                rs = stm.executeUpdate();
            }
        } catch (Exception e) {
        } finally {

            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
    }

    public void updateFood(FoodDTO food) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBIUtils.getConnnection();
            if (conn != null) {

                String sql = "UPDATE  tblFoods SET foodName=?,price=?,description=?,categoryID=?,"
                        + "image=? ,quantity=?,status=? WHERE foodID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, food.getFoodName());
                stm.setFloat(2, food.getPrice());
                stm.setNString(3, food.getDes());
                stm.setString(4, food.getCategory());
                stm.setString(5, food.getImage());
                stm.setInt(6, food.getQuantity());
                stm.setBoolean(7, food.isStatus());
                stm.setString(8, food.getFoodID());
                stm.executeUpdate();
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
    }

    public void createFood(FoodDTO food) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBIUtils.getConnnection();
            if (conn != null) {
                String sql = "INSERT INTO  tblFoods ( foodID,foodName,price,description,categoryID,image,quantity)"
                        + "VALUES(?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, food.getFoodID());
                stm.setString(2, food.getFoodName());
                stm.setFloat(3, food.getPrice());
                stm.setString(4, food.getDes());
                stm.setString(5, food.getCategory());
                stm.setString(6, food.getImage());
                stm.setInt(7, food.getQuantity());
                stm.executeUpdate();
            }
        } catch (Exception e) {
        } finally {

            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
    }

    public int getNoOfRecordsSearch(String category, String nameSearch, float prieCheck) throws SQLException {
        int result = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBIUtils.getConnnection();
            if (conn != null) {
                String sql = "SELECT count(*) as noRecord FROM tblFoods "
                        + "WHERE status=1 AND quantity>0 AND (categoryID=? OR ? is Null ) AND price<=?  AND foodName like ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1,category);
                stm.setString(2,category);
                stm.setFloat(3, prieCheck);
                stm.setString(4, "%" + nameSearch + "%");
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("noRecord");
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

    public int getNoOfRecordsSearchAdmin(String category, String nameSearch, float prieCheck) throws SQLException {
        int result = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBIUtils.getConnnection();
            if (conn != null) {
                String sql = "SELECT count(*) as noRecord FROM tblFoods "
                        + "WHERE (categoryID=? OR ? is Null ) AND price<=?  AND foodName like ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1,category);
                stm.setString(2,category);
                stm.setFloat(3, prieCheck);
                stm.setString(4, "%" + nameSearch + "%");
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("noRecord");
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

    public int getQuantityFood(String foodID) throws SQLException {
        int result = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBIUtils.getConnnection();
            if (conn != null) {
                String sql = "SELECT quantity FROM tblFoods  WHERE foodID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, foodID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("quantity");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                rs.close();
            }
            if (conn != null) {
                rs.close();
            }
        }
        return result;
    }

    public List<FoodDTO> getRecommendation(String foodIdRe) throws SQLException {
        List<FoodDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBIUtils.getConnnection();
            if (conn != null) {
                String sql = " SELECT TOP 4 foodID,foodName,price,description,categoryID as category,createDate,image,quantity "
                        + " FROM tblFoods "
                        + " WHERE foodID IN ("
                        + "   SELECT DISTINCT B.foodID "
                        + "   FROM tblOrders A join tblOrderDetails B "
                        + "   ON A.orderID=B.orderID AND A.orderID IN ( "
                        + "                SELECT orderID "
                        + "                FROM tblOrderDetails "
                        + "                WHERE foodID=? ) "
                        + "    AND B.foodID !=? "
                        + "                    )";
                stm = conn.prepareStatement(sql);
                stm.setString(1, foodIdRe);
                stm.setString(2, foodIdRe);

                rs = stm.executeQuery();
                while (rs.next()) {
                    String foodID = rs.getString("foodID");
                    String foodName = rs.getString("foodName");
                    float price = rs.getFloat("price");
                    String des = rs.getString("description");
                    String category = rs.getString("category");
                    Date createDate = new Date(rs.getDate("createDate").getTime());
                    String image = rs.getString("image");
                    int quantity = rs.getInt("quantity");
                    if (result == null) {
                        result = new ArrayList<FoodDTO>();
                    }
                    result.add(new FoodDTO(foodID, foodName, price, des, image, createDate, category, quantity, true));
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
}
