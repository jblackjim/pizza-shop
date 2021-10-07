package com.pizza.pizzaplanet.dao;

import com.pizza.pizzaplanet.entity.Customer;

import org.springframework.data.jpa.repository.JpaRepository;


    public interface CustomerRepository extends JpaRepository<Customer, Long> {
}

