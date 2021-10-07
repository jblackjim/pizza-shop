package com.pizza.pizzaplanet.dao;

import com.pizza.pizzaplanet.entity.City;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin("http://localhost:4200")
        @RepositoryRestResource(collectionResourceRel = "city", path = "city")

public interface CityRepository  extends JpaRepository <City, Integer> {




}
