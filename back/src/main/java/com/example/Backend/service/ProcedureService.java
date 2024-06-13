package com.example.Backend.service;

import com.example.Backend.model.Procedure;

import java.util.List;

public interface ProcedureService {
    public abstract Procedure createProcedure(Procedure procedure);
    public abstract void deleteProcedure(int id);
    public abstract List<Procedure> getAllProcedures();

    public abstract Procedure getProcedure(int id);

    public abstract boolean isProcedureExist(int id);

    public abstract boolean updateProcedure(int id,String treatment,String additionalDetails);

}
