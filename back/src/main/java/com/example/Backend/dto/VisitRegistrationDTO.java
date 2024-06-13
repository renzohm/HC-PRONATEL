package com.example.Backend.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class VisitRegistrationDTO {

    private int id;

    private String dateVisit;
    private Boolean madeTriage;
    private Boolean madeConsultation;
    private Boolean madeRecipe;
    private Boolean madeProcedure;





}
