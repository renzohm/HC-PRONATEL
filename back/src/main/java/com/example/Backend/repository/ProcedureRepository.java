package com.example.Backend.repository;

import com.example.Backend.model.Procedure;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProcedureRepository extends JpaRepository<Procedure,Integer> {
}
