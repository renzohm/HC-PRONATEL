package com.example.Backend.repository;

import com.example.Backend.model.Consultation;
import com.example.Backend.model.Person;
import com.example.Backend.model.VisitRegistration;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface PersonRepository extends JpaRepository<Person,Integer> {
    boolean existsByDocument (String document);

    /*@Query("SELECT c FROM Consultation c JOIN c.triage t WHERE t.person.id = :personId")
    List<Consultation> findConsultationsByPersonId(@Param("personId") int personId);*/
    /*@Query("SELECT vr FROM VisitRegistration vr JOIN vr.triage t WHERE t.person.id = :personId")
    List<VisitRegistration> findConsultationsByPersonId(@Param("personId") int personId);*/


}
