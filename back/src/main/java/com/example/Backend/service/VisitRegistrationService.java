package com.example.Backend.service;

import com.example.Backend.dto.*;
import com.example.Backend.model.Triage;
import com.example.Backend.model.VisitRegistration;
import org.springframework.cglib.core.Local;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface VisitRegistrationService {
    public abstract VisitRegistration createVisitRegistration(VisitRegistration visitRegistration);
    public abstract void deleteVisitRegistration(int id);
    public abstract List<VisitRegistration> getAllVisitRegistrations();

    public abstract List<VisitRegistrationDTO> getAllVisitRegistrationsDTOs();


    public abstract VisitRegistration getVisitRegistration(int id);

    public abstract boolean isVisitRegistrationExist(int id);

    public abstract List<VisitRegistration> getVisitRegistrationsByPersonId(int personId);

    /*public abstract boolean updateVisitRegistration(int id, String summaryReason, String dateVisit,
                                                    String cide10,String diagnosis);*/


    //public abstract Optional<VisitRegistrationDTO> getLatestConsultationByPersonId(int personId);

    public abstract boolean updateMadeTriage(int id,Boolean madeTriage);

    public abstract boolean updateMadeRecipe(int id,Boolean madeRecipe);

    public abstract boolean updateMadeConsultation(int id,Boolean madeConsultation);

    public abstract boolean updateMadeProcedure(int id,Boolean madeProcedure);

    public abstract TriageDTO getTriageByVisitId(int visitId);

    public abstract ConsultationDTO getConsultationByVisitId(int visitId);

    public abstract RecipeDTO getRecipeByVisitId(int visitId);

    public abstract ProcedureDTO getProcedureByVisitId(int visitId);


}
