package com.example.Backend.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "recipes")
public class Recipe {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "recipe_detail", nullable = true)
    private String recipeDetail;


    @OneToOne
    @JoinColumn(name = "visitRegistration_id")
    private VisitRegistration visitRegistration;

   /* @OneToOne
    @JoinColumn(name = "consultation_id")
    private Consultation consultation;*/

    /*@OneToOne(mappedBy = "recipe", cascade = CascadeType.ALL, orphanRemoval = true)
    private Procedure procedure;*/
}
