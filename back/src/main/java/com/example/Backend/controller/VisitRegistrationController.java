package com.example.Backend.controller;

import com.example.Backend.dto.*;
import com.example.Backend.exception.ValidationException;
import com.example.Backend.model.Consultation;
import com.example.Backend.model.VisitRegistration;
import com.example.Backend.repository.VisitRegistrationRepository;
import com.example.Backend.service.VisitRegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1")
public class VisitRegistrationController {
    @Autowired
    private VisitRegistrationService visitRegistrationService;


    private final VisitRegistrationRepository visitRegistrationRepository;

    public VisitRegistrationController(VisitRegistrationRepository visitRegistrationRepository) {
        this.visitRegistrationRepository = visitRegistrationRepository;
    }

    //EndPoint: http://localhost:8080/api/v1/workers
    //Method: GET
    @Transactional(readOnly = true)
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/visitRegistrations")
    public ResponseEntity<List<VisitRegistrationDTO>> getAllVisitRegistrations() {
        List<VisitRegistrationDTO> dtos = visitRegistrationService.getAllVisitRegistrationsDTOs();
        return new ResponseEntity<>(dtos, HttpStatus.OK);
    }

    //EndPoint: http://localhost:8080/api/v1/workers
    //Method: GET
    //Saca la plaza mediante el id del worker
        @Transactional(readOnly = true)
        @CrossOrigin(origins = "http://localhost:4200")
        @GetMapping("/{id}/visitRegistrations")
        public ResponseEntity<VisitRegistrationDTO> getVisitRegistration(@PathVariable("id") int id){

            VisitRegistration visitRegistration = visitRegistrationService.getVisitRegistration(id);
            if (visitRegistration == null) {
                return ResponseEntity.notFound().build();
            }
            VisitRegistrationDTO dtoVisitRegistration = new VisitRegistrationDTO(
                    visitRegistration.getId(),
                    visitRegistration.getDateVisit(),
                    visitRegistration.getMadeTriage(),
                    visitRegistration.getMadeConsultation(),
                    visitRegistration.getMadeRecipe(),
                    visitRegistration.getMadeProcedure()
            );
            return ResponseEntity.ok(dtoVisitRegistration);
        }


    //Mediante el id del Visit registration obtengo el triaje
    @Transactional(readOnly = true)
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/triages/{id}/visitRegistrations")
    public ResponseEntity<TriageDTO> getTriageByVisitRegistrationId(@PathVariable("id") int id) {
        TriageDTO dtoTriage = visitRegistrationService.getTriageByVisitId(id);
        if (dtoTriage == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(dtoTriage);
    }


    //Mediante el id del Visit registration obtengo la consulta
    @Transactional(readOnly = true)
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/consultations/{id}/visitRegistrations")
    public ResponseEntity<ConsultationDTO> getConsultationByVisitRegistrationId(@PathVariable("id") int id) {
        ConsultationDTO dtoConsultation = visitRegistrationService.getConsultationByVisitId(id);
        if (dtoConsultation == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(dtoConsultation);
    }

    //Mediante el id del Visit registration obtengo la receta
    @Transactional(readOnly = true)
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/recipes/{id}/visitRegistrations")
    public ResponseEntity<RecipeDTO> getRecipeByVisitRegistrationId(@PathVariable("id") int id) {
        RecipeDTO dtoRecipe = visitRegistrationService.getRecipeByVisitId(id);
        if (dtoRecipe == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(dtoRecipe);
    }



    //Mediante el id del Visit registration obtengo el procedimiento
    @Transactional(readOnly = true)
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/procedures/{id}/visitRegistrations")
    public ResponseEntity<ProcedureDTO> getProcedureVisitRegistrationId(@PathVariable("id") int id) {
        ProcedureDTO dtoProcedure = visitRegistrationService.getProcedureByVisitId(id);
        if (dtoProcedure == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(dtoProcedure);
    }












    @Transactional(readOnly = true)
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/persons/{personId}/visitRegistrations")
    public ResponseEntity<List<VisitRegistrationDTO>> getPersonVisitRegistrations(@PathVariable int personId) {
        List<VisitRegistration> visitRegistrations = visitRegistrationService.getVisitRegistrationsByPersonId(personId);
        if (visitRegistrations.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        List<VisitRegistrationDTO> dtoList = visitRegistrations.stream()
                .map(cons -> new VisitRegistrationDTO(cons.getId(), cons.getDateVisit(),cons.getMadeTriage(),cons.getMadeConsultation(),
                        cons.getMadeRecipe(),cons.getMadeProcedure()))
                .collect(Collectors.toList());
        return ResponseEntity.ok(dtoList);
    }






    //EndPoint: localhost:8080/api/v1/workers
    //Method: POST
    //SE USA
    @Transactional
    @PostMapping("/visitRegistrations")
    @CrossOrigin(origins = "http://localhost:4200")
    public ResponseEntity<VisitRegistration> createVisitRegistration(@RequestBody VisitRegistration visitRegistration){

        return new ResponseEntity<>(visitRegistrationService.createVisitRegistration(visitRegistration), HttpStatus.CREATED);
    }

    //EndPoint: localhost:8080/api/v1/users/{id}
    //Method: DELETE
    @Transactional
    @DeleteMapping("/visitRegistrations/{id}")
    @CrossOrigin(origins = "http://localhost:4200")
    public ResponseEntity<Object> deleteVisitRegistration(@PathVariable("id") int id){
        boolean isExist=visitRegistrationService.isVisitRegistrationExist(id);
        if(isExist){
            visitRegistrationService.deleteVisitRegistration(id);
            return new ResponseEntity<>("Visit registration is deleted successfully", HttpStatus.OK);
        }else{
            throw new ValidationException("Error deleting visit registration");
        }
    }

    //EndPoint: localhost:8080/api/saveup/v1/customers/{id}
    //Method: PUT
    //SE USA
    @Transactional
    @CrossOrigin(origins = "http://localhost:4200")
    @PutMapping("/updateMadeTriage/{id}")
    public ResponseEntity<Object> updateMadeTriage(@PathVariable("id") int id, @RequestBody VisitRegistrationDTO updateDTO) {
        boolean updated = visitRegistrationService.updateMadeTriage(id,updateDTO.getMadeTriage());
        if (updated) {
            return ResponseEntity.ok("Made Triage updated successfully");
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    //EndPoint: localhost:8080/api/saveup/v1/customers/{id}
    //Method: PUT
    //SE USA
    @Transactional
    @CrossOrigin(origins = "http://localhost:4200")
    @PutMapping("/updateMadeRecipe/{id}")
    public ResponseEntity<Object> updateMadeRecipe(@PathVariable("id") int id, @RequestBody VisitRegistrationDTO updateDTO) {
        boolean updated = visitRegistrationService.updateMadeRecipe(id,updateDTO.getMadeRecipe());
        if (updated) {
            return ResponseEntity.ok("Made Recipe updated successfully");
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    //EndPoint: localhost:8080/api/saveup/v1/customers/{id}
    //Method: PUT
    //SE USA
    @Transactional
    @CrossOrigin(origins = "http://localhost:4200")
    @PutMapping("/updateMadeConsultation/{id}")
    public ResponseEntity<Object> updateMadeConsultation(@PathVariable("id") int id, @RequestBody VisitRegistrationDTO updateDTO) {
        boolean updated = visitRegistrationService.updateMadeConsultation(id,updateDTO.getMadeConsultation());
        if (updated) {
            return ResponseEntity.ok("Made Consultation updated successfully");
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    //EndPoint: localhost:8080/api/saveup/v1/customers/{id}
    //Method: PUT
    //SE USA
    @Transactional
    @CrossOrigin(origins = "http://localhost:4200")
    @PutMapping("/updateMadeProcedure/{id}")
    public ResponseEntity<Object> updateMadeProcedure(@PathVariable("id") int id, @RequestBody VisitRegistrationDTO updateDTO) {
        boolean updated = visitRegistrationService.updateMadeProcedure(id,updateDTO.getMadeProcedure());
        if (updated) {
            return ResponseEntity.ok("Made Procedure updated successfully");
        } else {
            return ResponseEntity.notFound().build();
        }
    }



    //EndPoint: localhost:8080/api/saveup/v1/customers/{id}
    //Method: PUT
   /* @Transactional
    @CrossOrigin(origins = "http://localhost:4200")
    @PutMapping("/visitRegistrations/{id}")
    public ResponseEntity<Object> updateVisitRegistration(@PathVariable("id") int id, @RequestBody VisitRegistrationDTO updateDTO) {
        boolean updated = visitRegistrationService.updateVisitRegistration(id,updateDTO.getSummaryReason(), updateDTO.getDateVisit(),
                updateDTO.getCide10(),updateDTO.getDiagnosis());
        if (updated) {
            return ResponseEntity.ok("Summary reason and date visit updated successfully");
        } else {
            return ResponseEntity.notFound().build();
        }
    }*/

   /* @Transactional(readOnly = true)
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/persons/{personId}/consultation")
    public ResponseEntity<VisitRegistrationDTO> getPersonConsultation(@PathVariable int personId) {
        return visitRegistrationService.getLatestConsultationByPersonId(personId)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }*/



}
