package com.example.Backend.service.impl;

import com.example.Backend.model.Consultation;
import com.example.Backend.model.VisitRegistration;
import com.example.Backend.repository.ConsultationRepository;
import com.example.Backend.service.ConsultationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ConsultationServiceImpl implements ConsultationService {
    @Autowired
    ConsultationRepository consultationRepository;
    @Override
    public Consultation createConsultation(Consultation consultation) {
        return consultationRepository.save(consultation);
    }

    @Override
    public void deleteConsultation(int id) {
        consultationRepository.deleteById(id);
    }

    @Override
    public List<Consultation> getAllConsultations() {
        return (List<Consultation>) consultationRepository.findAll();
    }

    @Override
    public Consultation getConsultation(int id) {
        return consultationRepository.findById(id).get();
    }

    @Override
    public boolean isConsultationExist(int id) {
        return consultationRepository.existsById(id);
    }

    @Override
    public boolean updateConsultation(int id, String summaryReason, String dateVisit, String detailReason, String cide10, String diagnosis) {
        Optional<Consultation> registrationOptional = consultationRepository.findById(id);
        if (registrationOptional.isPresent()) {
            Consultation consultation = registrationOptional.get();
            consultation.setId(id);
            consultation.setSummaryReason(summaryReason);
            consultation.setDateVisit(dateVisit);
            consultation.setCide10(cide10);
            consultation.setDiagnosis(diagnosis);
            consultation.setDetailReason(detailReason);

            consultationRepository.save(consultation);
            return true;
        }
        return false;    }
}
