package com.pizza.pizzaplanet.entity;

import lombok.Data;

import javax.persistence.*;


@Entity
@Table(name="municipalities")
@Data

public class Municipality {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id")
    private int id;


    @Column(name="name")
    private String name;

    @ManyToOne
    @JoinColumn(name="city_id")
    private City city;


}