package com.example.Backend.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Data
@Entity
@Table(name = "persons")
public class Person {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "position", length = 100, nullable = false)
    private String position;
    @Column(name = "names", length = 100, nullable = false)
    private String names;
    @Column(name = "gender", nullable = false)
    private int gender;
    @Column(name = "type_document", nullable = false)
    private int typeDocument;
    @Column(name = "document", length = 9, nullable = false)
    private String document;
    @Column(name = "dependence", nullable = false)
    private int dependence;
    @Column(name = "phone_number", length = 9, nullable = false)
    private String phoneNumber;
    @Column(name = "email", length = 100, nullable = false)
    private String email;
    @Column(name = "birthdate", nullable = false)
    private LocalDate birthdate;
    @Column(name = "precedents",length = 100, nullable = true)
    private String precedents;
    @Column(name = "emergencyPhoneNumber",length = 9, nullable = true)
    private String emergencyPhoneNumber;




    /*@Column(name = "age", nullable = true)
    private int age;*/
    @Column(name = "allergies", nullable = true)
    private String allergies;

    @OneToMany(mappedBy = "person", cascade = CascadeType.ALL, orphanRemoval = true)
    //@JsonIgnore
    private List<VisitRegistration> visitRegistrations;
}
