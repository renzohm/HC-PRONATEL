package com.example.Backend.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDate;

@Data
@Entity
@Table(name = "visit_registrations")
public class VisitRegistration {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "date_visit", nullable = true)
    private String dateVisit;
    @Column(name = "made_triage",nullable = true)
    private Boolean madeTriage;
    @Column(name = "made_consultation",nullable = true)
    private Boolean madeConsultation;
    @Column(name = "made_recipe",nullable = true)
    private Boolean madeRecipe;
    @Column(name = "made_procedure",nullable = true)
    private Boolean madeProcedure;

    @ManyToOne
    @JoinColumn(name = "person_id",foreignKey = @ForeignKey(name = "FK_visitRegistration_person"))
    private Person person;

   @OneToOne(mappedBy = "visitRegistration", cascade = CascadeType.ALL, orphanRemoval = true)
    private Consultation consultation;

    @OneToOne(mappedBy = "visitRegistration", cascade = CascadeType.ALL, orphanRemoval = true)
    private Triage triage;

    @OneToOne(mappedBy = "visitRegistration", cascade = CascadeType.ALL, orphanRemoval = true)
    private Procedure procedure;

    @OneToOne(mappedBy = "visitRegistration", cascade = CascadeType.ALL, orphanRemoval = true)
    private Recipe recipe;

}
