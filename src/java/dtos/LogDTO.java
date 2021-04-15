/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.sql.Timestamp;

/**
 *
 * @author Lenovo
 */
public class LogDTO {

    int id;
    String userID, act, des;
    Timestamp actionDate;

    public LogDTO() {
    }

    public LogDTO(int id, String userID, String act, String des, Timestamp actionDate) {
        this.id = id;
        this.userID = userID;
        this.act = act;
        this.des = des;
        this.actionDate = actionDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getAct() {
        return act;
    }

    public void setAct(String act) {
        this.act = act;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public Timestamp getActionDate() {
        return actionDate;
    }

    public void setActionDate(Timestamp actionDate) {
        this.actionDate = actionDate;
    }

    
}
