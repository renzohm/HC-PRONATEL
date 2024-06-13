package com.example.Backend.service.impl;

import com.example.Backend.model.Procedure;
import com.example.Backend.model.Recipe;
import com.example.Backend.repository.ProcedureRepository;
import com.example.Backend.service.ProcedureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProcedureServiceImpl implements ProcedureService {
    @Autowired
    ProcedureRepository procedureRepository;
    @Override
    public Procedure createProcedure(Procedure procedure) {
        return procedureRepository.save(procedure);
    }

    @Override
    public void deleteProcedure(int id) {
        procedureRepository.deleteById(id);
    }

    @Override
    public List<Procedure> getAllProcedures() {
        return (List<Procedure>) procedureRepository.findAll();
    }

    @Override
    public Procedure getProcedure(int id) {
        return procedureRepository.findById(id).get();
    }

    @Override
    public boolean isProcedureExist(int id) {
        return procedureRepository.existsById(id);
    }

    @Override
    public boolean updateProcedure(int id, String treatment, String additionalDetails) {
        Optional<Procedure> registrationOptional = procedureRepository.findById(id);
        if (registrationOptional.isPresent()) {
            Procedure procedure = registrationOptional.get();
            procedure.setId(id);
            procedure.setTreatment(treatment);
            procedure.setAdditionalDetails(additionalDetails);

            procedureRepository.save(procedure);
            return true;
        }
        return false;
    }
}
