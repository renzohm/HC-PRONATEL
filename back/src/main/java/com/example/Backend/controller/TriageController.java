package com.example.Backend.controller;

import com.example.Backend.dto.TriageDTO;
import com.example.Backend.exception.ValidationException;
import com.example.Backend.model.Triage;
import com.example.Backend.repository.TriageRepository;
import com.example.Backend.service.TriageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1")
public class TriageController {

    @Autowired
    private TriageService triageService;


    private final TriageRepository triageRepository;

    public TriageController(TriageRepository triageRepository) {
        this.triageRepository = triageRepository;
    }

    //EndPoint: http://localhost:8080/api/v1/workers
    //Method: GET
    @Transactional(readOnly = true)
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/triages")
    public ResponseEntity<List<Triage>> getAllTriages(){
        return new ResponseEntity<List<Triage>>(triageService.getAllTriages(), HttpStatus.OK);
    }

    //EndPoint: http://localhost:8080/api/v1/workers
    //Method: GET
    //Saca la plaza mediante el id del worker
    @Transactional(readOnly = true)
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/{id}/triages")
    public ResponseEntity<Triage> getTriage(@PathVariable("id") int id){
        return new ResponseEntity<Triage>(triageService.getTriage(id), HttpStatus.OK);
    }
    //EndPoint: localhost:8080/api/v1/workers
    //Method: POST
    @Transactional
    @PostMapping("/triages")
    @CrossOrigin(origins = "http://localhost:4200")
    public ResponseEntity<Triage> createTriage(@RequestBody Triage triage){
        return new ResponseEntity<>(triageService.createTriage(triage), HttpStatus.CREATED);
    }

    //EndPoint: localhost:8080/api/v1/users/{id}
    //Method: DELETE
    @Transactional
    @DeleteMapping("/triages/{id}")
    @CrossOrigin(origins = "http://localhost:4200")
    public ResponseEntity<Object> deletePerson(@PathVariable("id") int id){
        boolean isExist=triageService.isTriageExist(id);
        if(isExist){
            triageService.deleteTriage(id);
            return new ResponseEntity<>("Triage is deleted successfully", HttpStatus.OK);
        }else{
            throw new ValidationException("Error deleting triage");
        }
    }
/*
*  private int heartRate;
    private int breathingFrequency;
    private int bloodPressure;
    private float bodyTemperature;
    private int oxygenSaturation;
    private String conscienceLevel;
    private int glasgowEyeOpening;
    private int glasgowVerbalResponse;
    private int glasgowMotorResponse;*/

    @Transactional
    @CrossOrigin(origins = "http://localhost:4200")
    @PutMapping("/triages/{id}")
    public ResponseEntity<Object> updateTriage(@PathVariable("id") int id, @RequestBody TriageDTO updateDTO) {
        boolean updated = triageService.updateTriage(id,updateDTO.getHeartRate(),updateDTO.getBreathingFrequency(),
                updateDTO.getBloodPressure(), updateDTO.getBodyTemperature(),updateDTO.getOxygenSaturation(),
                updateDTO.getConscienceLevel(), updateDTO.getGlasgowEyeOpening(),
                updateDTO.getGlasgowVerbalResponse(),updateDTO.getGlasgowMotorResponse());
        if (updated) {
            return ResponseEntity.ok("Triage updated successfully");
        } else {
            return ResponseEntity.notFound().build();
        }
    }


}
