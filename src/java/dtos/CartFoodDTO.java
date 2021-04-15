package dtos;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author User
 */
public class CartFoodDTO {

    private String customerName;
    private Map<String, FoodDTO> cart;

    public CartFoodDTO() {
    }

    public CartFoodDTO(String customerName, Map<String, FoodDTO> cart) {
        this.customerName = customerName;
        this.cart = cart;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public Map<String, FoodDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, FoodDTO> cart) {
        this.cart = cart;
    }

    public void add(FoodDTO fdto) {
        if (cart == null) {
            this.cart = new HashMap<String, FoodDTO>();
        }
        if (cart.containsKey(fdto.getFoodID())) {
            int quantity = cart.get(fdto.getFoodID()).getQuantity();
            fdto.setQuantity(quantity + fdto.getQuantity());
        }
        cart.put(fdto.getFoodID(), fdto);
    }

    public void delete(String id) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(id)) {
            cart.remove(id);
        }
    }

    public void update(FoodDTO fdto) {
        if (this.cart != null) {
            if (this.cart.containsKey(fdto.getFoodID())) {
                this.cart.replace(fdto.getFoodID(), fdto);
            }
        }
    }
}
