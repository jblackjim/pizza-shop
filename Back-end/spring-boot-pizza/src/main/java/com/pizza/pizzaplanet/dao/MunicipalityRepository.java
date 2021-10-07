package com.pizza.pizzaplanet.dao;

import com.pizza.pizzaplanet.entity.Municipality;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.List;



@CrossOrigin("http://localhost:4200")
        @RepositoryRestResource

        public interface MunicipalityRepository  extends JpaRepository<Municipality, Integer>{

        //Retrive municipalities for a specific city code
        //http://localhost:8080/api/municipalities/search/findByCityCode?code=At
        List<Municipality> findByCityCode(@Param("code") String code);

        }
