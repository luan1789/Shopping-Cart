/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.LogDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBIUtils;

/**
 *
 * @author PC
 */
public class LogDAO {

    public void insertLog(LogDTO dto) throws Exception {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            String sql = "INSERT INTO tblLogs(userID, act, descripton, actionDate)"
                    + " VALUES(?,?,?,?)";
            conn = DBIUtils.getConnnection();
            stm = conn.prepareStatement(sql);
            stm.setString(1, dto.getUserID());
            stm.setString(2, dto.getAct());
            stm.setString(3, dto.getDes());
            stm.setTimestamp(4, dto.getActionDate());
            stm.executeUpdate();
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

    public List<LogDTO> loadLog() throws Exception {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<LogDTO> list = new ArrayList<>();
        try {
            String sql = "SELECT idLog, userID, act, descripton, actionDate"
                    + " FROM tblLogs ORDER BY actionDate DESC";
            conn = DBIUtils.getConnnection();
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new LogDTO(rs.getInt("idLog"), rs.getString("userID"),
                        rs.getString("act"), rs.getString("descripton"),
                        rs.getTimestamp("actionDate")));
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
        return list;
    }
}
