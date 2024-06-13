package com.example.Backend.repository;

import com.example.Backend.model.Consultation;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ConsultationRepository extends JpaRepository<Consultation,Integer> {

}
