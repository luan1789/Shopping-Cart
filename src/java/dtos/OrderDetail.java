package dtos;


import java.util.Locale;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author truon
 */
public class OrderDetail {

    private String productName;
    private float subtotal;
    private float shipping;
    private float tax;
    private float total;

    public OrderDetail(String productName, String subtotal,
            String shipping, String tax, String total) {
        this.productName = productName;
        this.subtotal = Float.parseFloat(subtotal);
        this.shipping = Float.parseFloat(shipping);
        this.tax = Float.parseFloat(tax);
        this.total = Float.parseFloat(total);
    }

    public String getProductName() {
        return productName;
    }

    public String getSubtotal() {
        return String.format(Locale.US,"%.2f", subtotal);
    }

    public String getShipping() {
        return String.format(Locale.US,"%.2f", shipping);
    }

    public String getTax() {
        return String.format(Locale.US,"%.2f", tax);
    }

    public String getTotal() {
        return String.format(Locale.US,"%.2f", total);
    }
}
