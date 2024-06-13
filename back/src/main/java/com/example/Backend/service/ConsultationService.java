package com.example.Backend.service;

import com.example.Backend.model.Consultation;

import java.util.List;

public interface ConsultationService {
    public abstract Consultation createConsultation(Consultation consultation);
    public abstract void deleteConsultation(int id);
    public abstract List<Consultation> getAllConsultations();

    public abstract Consultation getConsultation(int id);

    public abstract boolean isConsultationExist(int id);

    public abstract boolean updateConsultation(int id, String summaryReason, String dateVisit,
                                                   String detailReason, String cide10,String diagnosis);


}
