/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.TypeDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBIUtils;

/**
 *
 * @author PC
 */
public class TypeFoodDAO {
     public List<TypeDTO> getAllTypeDTOs() throws SQLException {
        List<TypeDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBIUtils.getConnnection();
            if (conn != null) {
                String sql = "SELECT categoryID,categoryName FROM tblCategorys";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String typeID = rs.getString("categoryID");
                    String type = rs.getString("categoryName");
                    if (result == null) {
                        result = new ArrayList<TypeDTO>();
                    }
                    result.add(new TypeDTO(typeID, type));
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
