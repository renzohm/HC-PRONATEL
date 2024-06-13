package com.example.Backend.service.impl;

import com.example.Backend.model.Triage;
import com.example.Backend.repository.TriageRepository;
import com.example.Backend.service.TriageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service

public class TriageServiceImpl implements TriageService {
    @Autowired
    private TriageRepository triageRepository;
    @Override
    public Triage createTriage(Triage triage) {
        return triageRepository.save(triage);
    }

    @Override
    public void deleteTriage(int id) {
        triageRepository.deleteById(id);
    }

    @Override
    public List<Triage> getAllTriages() {
        return (List<Triage>) triageRepository.findAll();
    }

    @Override
    public Triage getTriage(int id) {
        return triageRepository.findById(id).get();
    }

    @Override
    public boolean isTriageExist(int id) {
        return triageRepository.existsById(id);
    }

    @Override
    public boolean updateTriage(int id, int heartRate, int breathingFrequency, int bloodPressure,
                                float bodyTemperature, int oxygenSaturation, String conscienceLevel,
                                int glasgowEyeOpening, int glasgowVerbalResponse, int glasgowMotorResponse) {
        Optional<Triage> registrationOptional = triageRepository.findById(id);
        if (registrationOptional.isPresent()) {
            Triage triage = registrationOptional.get();
            triage.setId(id);
            triage.setHeartRate(heartRate);
            triage.setBreathingFrequency(breathingFrequency);
            triage.setBloodPressure(bloodPressure);
            triage.setBodyTemperature(bodyTemperature);
            triage.setOxygenSaturation(oxygenSaturation);
            triage.setConscienceLevel(conscienceLevel);
            triage.setGlasgowEyeOpening(glasgowEyeOpening);
            triage.setGlasgowVerbalResponse(glasgowVerbalResponse);
            triage.setGlasgowMotorResponse(glasgowMotorResponse);

            triageRepository.save(triage);
            return true;
        }
        return false;
    }
}
