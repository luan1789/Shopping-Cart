/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author PC
 */
public class OrderDTO {
    private int orderID;
    private String userID;
    private Date orderDate;
    private float totalMoney;
     
    List<FoodDTO> listFood;

    public OrderDTO() {
    }

    public OrderDTO(int orderID, String userID, Date orderDate, float totalMoney) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderDate = orderDate;
        this.totalMoney = totalMoney;
        this.listFood = new ArrayList<>();
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public float getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(float totalMoney) {
        this.totalMoney = totalMoney;
    }

    public List<FoodDTO> getListFood() {
        return listFood;
    }

    public void setListFood(List<FoodDTO> listFood) {
        this.listFood = listFood;
    }
    

   
    
}
