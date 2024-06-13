package com.example.Backend.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDate;

@Data
@Entity
@Table(name = "consultations")
public class Consultation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "date_visit", nullable = true)
    private String dateVisit;
    @Column(name = "summary_reason", nullable = true)
    private String summaryReason;
    @Column(name = "detail_reason", nullable = true)
    private String detailReason;
    @Column(name = "cide10", length = 10, nullable = true)
    private String cide10;
    @Column(name = "diagnosis", nullable = true)
    private String diagnosis;

    public Consultation(){

    }
    /*@OneToOne
    @JoinColumn(name = "triage_id")
    //@JsonIgnore
    private Triage triage;*/

    @OneToOne
    @JoinColumn(name = "visitRegistration_id")
    private VisitRegistration visitRegistration;

   /* @OneToOne(mappedBy = "consultation", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonIgnore
    private Recipe recipe;*/


}
