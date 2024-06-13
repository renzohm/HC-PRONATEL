package com.example.Backend.dto;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PersonDTO {
    private int id;
    private String position;
    private String names;
    private int gender;
    private int typeDocument;
    private String document;
    private int dependence;
    private String phoneNumber;
    private String email;
    private LocalDate birthdate;
    private String precedents;
    private String emergencyPhoneNumber;
    private String allergies;



}
