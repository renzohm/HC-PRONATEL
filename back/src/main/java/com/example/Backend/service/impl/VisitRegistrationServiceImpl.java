package com.example.Backend.service.impl;

import com.example.Backend.dto.*;
import com.example.Backend.exception.ValidationException;
import com.example.Backend.model.Triage;
import com.example.Backend.model.VisitRegistration;
import com.example.Backend.repository.PersonRepository;
import com.example.Backend.repository.TriageRepository;
import com.example.Backend.repository.VisitRegistrationRepository;
import com.example.Backend.service.VisitRegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.Local;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class VisitRegistrationServiceImpl implements VisitRegistrationService {
    @Autowired
    VisitRegistrationRepository visitRegistrationRepository;

    @Autowired
    PersonRepository personRepository;
    @Override
    public VisitRegistration createVisitRegistration(VisitRegistration visitRegistration) {
        return visitRegistrationRepository.save(visitRegistration);
    }

    @Override
    public void deleteVisitRegistration(int id) {
        visitRegistrationRepository.deleteById(id);
    }

    @Override
    public List<VisitRegistration> getAllVisitRegistrations() {
        return (List<VisitRegistration>) visitRegistrationRepository.findAll();
    }

    @Override
    public List<VisitRegistrationDTO> getAllVisitRegistrationsDTOs() {
        List<VisitRegistration> registrations = getAllVisitRegistrations(); // Método existente que obtiene todas las entidades
        return registrations.stream()
                .map(reg -> new VisitRegistrationDTO(reg.getId(), reg.getDateVisit(),reg.getMadeTriage(),
                        reg.getMadeConsultation(),reg.getMadeRecipe(),reg.getMadeProcedure()))
                .collect(Collectors.toList());    }

    @Override
    public VisitRegistration getVisitRegistration(int id) {
        return visitRegistrationRepository.findById(id).get();
    }

    @Override
    public boolean isVisitRegistrationExist(int id) {
        return visitRegistrationRepository.existsById(id);
    }

    @Override
    public List<VisitRegistration> getVisitRegistrationsByPersonId(int personId) {
        return visitRegistrationRepository.findVisitsByPersonId(personId);
    }

    @Override
    public boolean updateMadeTriage(int id, Boolean madeTriage) {
        Optional<VisitRegistration> registrationOptional = visitRegistrationRepository.findById(id);
        if (registrationOptional.isPresent()) {
            VisitRegistration registration = registrationOptional.get();
            registration.setId(id);
            registration.setMadeTriage(madeTriage);
            visitRegistrationRepository.save(registration);
            return true;
        }
        return false;
    }

    @Override
    public boolean updateMadeRecipe(int id, Boolean madeRecipe) {
        Optional<VisitRegistration> registrationOptional = visitRegistrationRepository.findById(id);
        if (registrationOptional.isPresent()) {
            VisitRegistration registration = registrationOptional.get();
            registration.setId(id);
            registration.setMadeRecipe(madeRecipe);
            visitRegistrationRepository.save(registration);
            return true;
        }
        return false;
    }

    @Override
    public boolean updateMadeConsultation(int id, Boolean madeConsultation) {
        Optional<VisitRegistration> registrationOptional = visitRegistrationRepository.findById(id);
        if (registrationOptional.isPresent()) {
            VisitRegistration registration = registrationOptional.get();
            registration.setId(id);
            registration.setMadeConsultation(madeConsultation);
            visitRegistrationRepository.save(registration);
            return true;
        }
        return false;
    }

    @Override
    public boolean updateMadeProcedure(int id, Boolean madeProcedure) {
        Optional<VisitRegistration> registrationOptional = visitRegistrationRepository.findById(id);
        if (registrationOptional.isPresent()) {
            VisitRegistration registration = registrationOptional.get();
            registration.setId(id);
            registration.setMadeProcedure(madeProcedure);
            visitRegistrationRepository.save(registration);
            return true;
        }
        return false;
    }

    @Override
    public TriageDTO getTriageByVisitId(int visitId) {
        return visitRegistrationRepository.findTriageByVisitId(visitId);
    }

    @Override
    public ConsultationDTO getConsultationByVisitId(int visitId) {
        return visitRegistrationRepository.findConsultationByVisitId(visitId);
    }

    @Override
    public RecipeDTO getRecipeByVisitId(int visitId) {
        return visitRegistrationRepository.findRecipeByVisitId(visitId);
    }

    @Override
    public ProcedureDTO getProcedureByVisitId(int visitId) {
        return visitRegistrationRepository.findProcedureByVisitId(visitId);
    }

   /* @Override
    public boolean updateVisitRegistration(int id, String summaryReason, String dateVisit,String cide10,
                                           String diagnosis) {
        Optional<VisitRegistration> registrationOptional = visitRegistrationRepository.findById(id);
        if (registrationOptional.isPresent()) {
            VisitRegistration registration = registrationOptional.get();
            registration.setId(id);
            registration.setSummaryReason(summaryReason);
            registration.setDateVisit(dateVisit);
            registration.setCide10(cide10);
            registration.setDiagnosis(diagnosis);

            visitRegistrationRepository.save(registration);
            return true;
        }
        return false;
    }*/

   /* @Override
    public Optional<VisitRegistrationDTO> getLatestConsultationByPersonId(int personId) {
        return visitRegistrationRepository.findByTriagePersonId(personId)
                .map(cons -> new VisitRegistrationDTO(cons.getId(), cons.getDateVisit(),
                        cons.getSummaryReason(), cons.getCide10(), cons.getDiagnosis()));
    }*/
}
