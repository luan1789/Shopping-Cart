package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import dtos.UserDTO;
import utils.DBIUtils;

/**
 *
 * @author User
 */
public class UserDAO {

    public UserDTO checkLogin(String userid, String password) throws SQLException {
        UserDTO result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBIUtils.getConnnection();
            if (conn != null) {

                String sql = "SELECT fullname,roleid FROM tblusers WHERE userid=? AND password=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userid);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String fullname = rs.getString("fullname");
                    String roleid = rs.getString("roleid").trim();
                    result = new UserDTO(userid, fullname, password, roleid,"");
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

    public UserDTO checkLoginGG(String userid) throws SQLException {
        UserDTO result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBIUtils.getConnnection();
            if (conn != null) {

                String sql = "SELECT fullName,roleid,email,address FROM tblusers WHERE userid=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userid);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String fullname = rs.getString("fullName");
                    String roleid = rs.getString("roleid").trim();
                    String gmail = rs.getString("email").trim();
                    result = new UserDTO(userid, fullname, "", roleid, gmail);
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

    public boolean checkID(String userID) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            conn = DBIUtils.getConnnection();
            if (conn != null) {

                String sql = "SELECT fullName FROM tblusers WHERE userid=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = true;
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



    public void createUserGG(UserDTO user) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBIUtils.getConnnection();
            if (conn != null) {

                String sql = "INSERT INTO tblUsers(fullName,userID,roleID,email) VALUES(?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getFullname());
                stm.setString(2, user.getUserID());
                stm.setString(3, user.getRoleID());
                stm.setString(4, user.getGmail());
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

}
