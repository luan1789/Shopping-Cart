/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

/**
 *
 * @author PC
 */
public class FoodErrorDTO {

    private String foodIDError;
    private String priceError;

    public FoodErrorDTO() {
    }

    public FoodErrorDTO(String foodIDError, String priceError) {
        this.foodIDError = foodIDError;
        this.priceError = priceError;
    }

    public String getFoodIDError() {
        return foodIDError;
    }

    public void setFoodIDError(String foodIDError) {
        this.foodIDError = foodIDError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

}
