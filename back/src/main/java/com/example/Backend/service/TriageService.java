package com.example.Backend.service;


import com.example.Backend.model.Triage;

import java.util.List;

public interface TriageService {
    public abstract Triage createTriage(Triage triage);
    public abstract void deleteTriage(int id);
    public abstract List<Triage> getAllTriages();

    public abstract Triage getTriage(int id);

    public abstract boolean isTriageExist(int id);

    public abstract boolean updateTriage(int id,int heartRate, int breathingFrequency,int bloodPressure,
                                         float bodyTemperature, int oxygenSaturation,String conscienceLevel,
                                         int glasgowEyeOpening, int glasgowVerbalResponse,
                                         int glasgowMotorResponse);




}
