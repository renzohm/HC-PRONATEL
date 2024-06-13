package com.example.Backend.controller;

import com.example.Backend.dto.ConsultationDTO;
import com.example.Backend.dto.VisitRegistrationDTO;
import com.example.Backend.exception.ValidationException;
import com.example.Backend.model.Consultation;

import com.example.Backend.model.VisitRegistration;
import com.example.Backend.repository.ConsultationRepository;
import com.example.Backend.service.ConsultationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1")
public class ConsultationController {
    @Autowired
    private ConsultationService consultationService;


    private final ConsultationRepository consultationRepository;

    public ConsultationController(ConsultationRepository consultationRepository) {
        this.consultationRepository = consultationRepository;
    }

    //EndPoint: http://localhost:8080/api/v1/workers
    //Method: GET
    @Transactional(readOnly = true)
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/consultations")
    public ResponseEntity<List<Consultation>> getAllConsultations(){
        return new ResponseEntity<List<Consultation>>(consultationService.getAllConsultations(), HttpStatus.OK);
    }

    //EndPoint: http://localhost:8080/api/v1/workers
    //Method: GET
    //Saca la plaza mediante el id del worker
   /* @Transactional(readOnly = true)
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/{id}/consultations")
    public ResponseEntity<Consultation> getConsultation(@PathVariable("id") int id){
        return new ResponseEntity<Consultation>(consultationService.getConsultation(id), HttpStatus.OK);
    }*/


    //EndPoint: localhost:8080/api/v1/workers
    //Method: POST
    @Transactional
    @PostMapping("/consultations")
    @CrossOrigin(origins = "http://localhost:4200")
    public ResponseEntity<Consultation> createConsultation(@RequestBody Consultation consultation){
        //validateConsultation(consultation);

        return new ResponseEntity<>(consultationService.createConsultation(consultation), HttpStatus.CREATED);
    }

    //EndPoint: localhost:8080/api/v1/users/{id}
    //Method: DELETE
    @Transactional
    @DeleteMapping("/consultations/{id}")
    @CrossOrigin(origins = "http://localhost:4200")
    public ResponseEntity<Object> deleteConsultation(@PathVariable("id") int id){
        boolean isExist=consultationService.isConsultationExist(id);
        if(isExist){
            consultationService.deleteConsultation(id);
            return new ResponseEntity<>("Consultation is deleted successfully", HttpStatus.OK);
        }else{
            throw new ValidationException("Error deleting consultation");
        }
    }


    @Transactional(readOnly = true)
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/{id}/consultations")
    public ResponseEntity<ConsultationDTO> getConsultation(@PathVariable("id") int id){

        Consultation consultation = consultationService.getConsultation(id);
        if (consultation == null) {
            return ResponseEntity.notFound().build();
        }
        ConsultationDTO dtoConsultation = new ConsultationDTO(
                consultation.getId(),
                consultation.getDateVisit(),
                consultation.getSummaryReason(),
                consultation.getDetailReason(),
                consultation.getCide10(),
                consultation.getDiagnosis()
        );
        return ResponseEntity.ok(dtoConsultation);
    }




    @Transactional
    @CrossOrigin(origins = "http://localhost:4200")
    @PutMapping("/consultations/{id}")
    public ResponseEntity<Object> updateConsultation(@PathVariable("id") int id, @RequestBody ConsultationDTO updateDTO) {
        boolean updated = consultationService.updateConsultation(id,updateDTO.getSummaryReason(), updateDTO.getDateVisit(),
                updateDTO.getDetailReason(), updateDTO.getCide10(),updateDTO.getDiagnosis());
        if (updated) {
            return ResponseEntity.ok("Consultation updated successfully");
        } else {
            return ResponseEntity.notFound().build();
        }
    }









    private void validateConsultation(Consultation consultation){
        if(consultation.getSummaryReason() == null || consultation.getSummaryReason().trim().isEmpty()){
            throw new ValidationException("El resumen del motivo de la consulta debe ser obligatorio");
        }
        if(consultation.getDetailReason() == null || consultation.getDetailReason().trim().isEmpty()){
            throw new ValidationException("El detalle del motivo de la consulta debe ser obligatorios");
        }
        if(consultation.getCide10() == null || consultation.getCide10().trim().isEmpty()){
            throw new ValidationException("El CIDE 10 debe ser obligatorio");
        }
        if(consultation.getDiagnosis() == null || consultation.getDiagnosis().trim().isEmpty()){
            throw new ValidationException("El diagnostico debe ser obligatorio");
        }

    }
}
