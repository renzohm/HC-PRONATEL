package com.example.Backend.repository;

import com.example.Backend.model.Triage;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TriageRepository extends JpaRepository<Triage,Integer> {
}
