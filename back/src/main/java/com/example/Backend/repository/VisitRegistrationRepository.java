package com.example.Backend.repository;

import com.example.Backend.dto.ConsultationDTO;
import com.example.Backend.dto.ProcedureDTO;
import com.example.Backend.dto.RecipeDTO;
import com.example.Backend.dto.TriageDTO;
import com.example.Backend.model.VisitRegistration;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface VisitRegistrationRepository extends JpaRepository<VisitRegistration,Integer> {
   // Optional<VisitRegistration> findFirstByTriagePersonIdOrderByIdDesc(int personId);

    //Optional<VisitRegistration> findByTriagePersonId(int personId);

   /*@Query("SELECT v FROM VisitRegistration v WHERE v.person.id = :personId")
    List<VisitRegistration> findVisitsByPersonId(@Param("personId") int personId);*/
   @Query("SELECT v FROM VisitRegistration v WHERE v.person.id = :personId ORDER BY v.id DESC")
   List<VisitRegistration> findVisitsByPersonId(@Param("personId") int personId);

    @Query("SELECT new com.example.Backend.dto.TriageDTO(t.id, t.heartRate, t.breathingFrequency, t.bloodPressure, t.bodyTemperature, t.oxygenSaturation, t.conscienceLevel, t.glasgowEyeOpening, t.glasgowVerbalResponse, t.glasgowMotorResponse) " +
            "FROM Triage t WHERE t.visitRegistration.id = :visitId")
    TriageDTO findTriageByVisitId(@Param("visitId") int visitId);


    @Query("SELECT new com.example.Backend.dto.ConsultationDTO(c.id, c.dateVisit, c.summaryReason, c.detailReason, c.cide10, c.diagnosis) " +
            "FROM Consultation c WHERE c.visitRegistration.id = :visitId")
    ConsultationDTO findConsultationByVisitId(@Param("visitId") int visitId);

   @Query("SELECT new com.example.Backend.dto.RecipeDTO(r.id, r.recipeDetail) " +
         "FROM Recipe r WHERE r.visitRegistration.id = :visitId")
   RecipeDTO findRecipeByVisitId(@Param("visitId") int visitId);

    @Query("SELECT new com.example.Backend.dto.ProcedureDTO(p.id, p.treatment, p.additionalDetails) " +
            "FROM Procedure p WHERE p.visitRegistration.id = :visitId")
    ProcedureDTO findProcedureByVisitId(@Param("visitId") int visitId);
}
