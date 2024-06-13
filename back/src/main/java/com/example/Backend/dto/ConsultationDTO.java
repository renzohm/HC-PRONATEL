package com.example.Backend.dto;

import com.example.Backend.model.Consultation;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.cglib.core.Local;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ConsultationDTO {
    private int id;
    private String dateVisit;
    private String summaryReason;
    private String detailReason;
    private String cide10;
    private String diagnosis;


}
