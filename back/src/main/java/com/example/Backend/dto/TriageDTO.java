package com.example.Backend.dto;

import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TriageDTO {
    private int id;
    private int heartRate;
    private int breathingFrequency;
    private int bloodPressure;
    private float bodyTemperature;
    private int oxygenSaturation;
    private String conscienceLevel;
    private int glasgowEyeOpening;
    private int glasgowVerbalResponse;
    private int glasgowMotorResponse;
}
