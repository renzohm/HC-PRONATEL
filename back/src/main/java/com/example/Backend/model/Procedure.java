package com.example.Backend.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "procedures")
public class Procedure {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "treatment",nullable = true)
    private String treatment;
    @Column(name = "additional_details",nullable = true)
    private String additionalDetails;


    @OneToOne
    @JoinColumn(name = "visitRegistration_id")
    private VisitRegistration visitRegistration;
   /* @OneToOne
    @JoinColumn(name = "recipe_id")
    private Recipe recipe;*/
}
