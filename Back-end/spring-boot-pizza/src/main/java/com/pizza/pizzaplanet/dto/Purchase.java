package com.pizza.pizzaplanet.dto;

import com.pizza.pizzaplanet.entity.Address;
import com.pizza.pizzaplanet.entity.Customer;
import com.pizza.pizzaplanet.entity.Order;
import com.pizza.pizzaplanet.entity.OrderItem;
import java.util.Set;
import lombok.Data;

@Data
public class Purchase {

    private Customer customer;
    private Address shippingAddress;
    private Address billingAddress;
    private Order order;
    private Set<OrderItem> orderItems;
}
