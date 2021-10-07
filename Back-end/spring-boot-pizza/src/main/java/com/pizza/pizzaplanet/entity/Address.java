
package com.pizza.pizzaplanet.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity
@Table(name = "address")
@Getter
@Setter
public class Address {
    
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")

    private Long id;

    @Column(name = "street")
    private String street;
    
    @Column(name = "city" )
    private String city;

    @Column(name = "municipality")
    private String municipality;
    
    @Column(name = "zip_Code")
    private String  zipCode;
    
    @OneToOne
    @PrimaryKeyJoinColumn
    private Order order;
}
