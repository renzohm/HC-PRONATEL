package com.example.Backend.controller;

import com.example.Backend.dto.ProcedureDTO;
import com.example.Backend.dto.RecipeDTO;
import com.example.Backend.exception.ValidationException;
import com.example.Backend.model.Procedure;
import com.example.Backend.repository.ProcedureRepository;
import com.example.Backend.service.ProcedureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1")
public class ProcedureController {
    @Autowired
    ProcedureService procedureService;

    private final ProcedureRepository procedureRepository;

    public ProcedureController(ProcedureRepository procedureRepository){
        this.procedureRepository=procedureRepository;
    }

    //EndPoint: http://localhost:8080/api/v1/workers
    //Method: GET
    @Transactional(readOnly = true)
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/procedures")
    public ResponseEntity<List<Procedure>> getAllProcedures(){
        return new ResponseEntity<List<Procedure>>(procedureService.getAllProcedures(), HttpStatus.OK);
    }

    //EndPoint: http://localhost:8080/api/v1/workers
    //Method: GET
    //Saca la plaza mediante el id del worker
    @Transactional(readOnly = true)
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/{id}/procedures")
    public ResponseEntity<Procedure> getProcedure(@PathVariable("id") int id){
        return new ResponseEntity<Procedure>(procedureService.getProcedure(id), HttpStatus.OK);
    }

    @Transactional
    @PostMapping("/procedures")
    @CrossOrigin(origins = "http://localhost:4200")
    public ResponseEntity<Procedure> createProcedure(@RequestBody Procedure procedure){

        return new ResponseEntity<>(procedureService.createProcedure(procedure), HttpStatus.CREATED);
    }


    //EndPoint: localhost:8080/api/v1/users/{id}
    //Method: DELETE
    @Transactional
    @DeleteMapping("/procedures/{id}")
    @CrossOrigin(origins = "http://localhost:4200")
    public ResponseEntity<Object> deleteProcedure(@PathVariable("id") int id){
        boolean isExist=procedureService.isProcedureExist(id);
        if(isExist){
            procedureService.deleteProcedure(id);
            return new ResponseEntity<>("Procedure is deleted successfully", HttpStatus.OK);
        }else{
            throw new ValidationException("Error deleting procedure");
        }
    }

    @Transactional
    @CrossOrigin(origins = "http://localhost:4200")
    @PutMapping("/procedures/{id}")
    public ResponseEntity<Object> updateProcedure(@PathVariable("id") int id, @RequestBody ProcedureDTO updateDTO) {
        boolean updated = procedureService.updateProcedure(id,updateDTO.getTreatment(),updateDTO.getAdditionalDetails());
        if (updated) {
            return ResponseEntity.ok("Triage updated successfully");
        } else {
            return ResponseEntity.notFound().build();
        }
    }

}
