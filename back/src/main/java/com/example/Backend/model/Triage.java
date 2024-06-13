package com.example.Backend.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "triages")
public class Triage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "heartRate", nullable = true)
    private int heartRate;
    @Column(name = "breathingFrequency", nullable = true)
    private int breathingFrequency;
    @Column(name = "bloodPressure", nullable = true)
    private int bloodPressure;
    @Column(name = "bodyTemperature", nullable = true)
    private float bodyTemperature;
    @Column(name = "oxygenSaturation", nullable = true)
    private int oxygenSaturation;
    @Column(name = "conscienceLevel",length = 50,nullable = true)
    private String conscienceLevel;
    @Column(name = "glasgow_eye_opening",nullable = true)
    private int glasgowEyeOpening;
    @Column(name = "glasgow_verbal_response",nullable = true)
    private int glasgowVerbalResponse;
    @Column(name = "glasgow_motor_response",nullable = true)
    private int glasgowMotorResponse;

    @OneToOne
    @JoinColumn(name = "visitRegistration_id")
    private VisitRegistration visitRegistration;
    public Triage(){

    }
    /*@ManyToOne
    @JoinColumn(name = "person_id",foreignKey = @ForeignKey(name = "FK_triage_person"))
    private Person person;*/

   /* @OneToOne(mappedBy = "triage", cascade = CascadeType.ALL, orphanRemoval = true)
    private Consultation consultation;*/

   /* @OneToOne(mappedBy = "triage", cascade = CascadeType.ALL, orphanRemoval = true)
    private VisitRegistration visitRegistration;*/
    
}
