
package com.pizza.pizzaplanet.service;

import com.pizza.pizzaplanet.dto.Purchase;
import com.pizza.pizzaplanet.dto.PurchaseResponse;


public interface CheckoutService {
   

    PurchaseResponse placeOrder(Purchase purchase);
}

