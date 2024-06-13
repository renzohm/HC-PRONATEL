package com.example.Backend.controller;

import com.example.Backend.dto.ConsultationDTO;
import com.example.Backend.dto.PersonDTO;
import com.example.Backend.dto.VisitRegistrationDTO;
import com.example.Backend.exception.ValidationException;
import com.example.Backend.model.Consultation;
import com.example.Backend.model.Person;
import com.example.Backend.model.VisitRegistration;
import com.example.Backend.repository.ConsultationRepository;
import com.example.Backend.repository.PersonRepository;
import com.example.Backend.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1")
public class PersonController {
    @Autowired
    private PersonService personService;


    private final PersonRepository personRepository;
    private final ConsultationRepository consultationRepository;

    public PersonController(PersonRepository personRepository,
                            ConsultationRepository consultationRepository) {
        this.personRepository = personRepository;
        this.consultationRepository=consultationRepository;
    }


    //EndPoint: http://localhost:8080/api/v1/workers
    //Method: GET
    //SE USA
    @Transactional(readOnly = true)
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/persons")
    public ResponseEntity<List<PersonDTO>> getAllPersons(){
        List<PersonDTO> allPersons = personService.getAllPersons();
        if (allPersons.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(allPersons);
    }

    //EndPoint: http://localhost:8080/api/v1/workers
    //Method: GET
    //SE USA
    @Transactional(readOnly = true)
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/{id}/persons")
    public ResponseEntity<PersonDTO> getPerson(@PathVariable("id") int id){
        Person person=personService.getPerson(id);
        if(person==null){
            return ResponseEntity.notFound().build();
        }
        PersonDTO dtoPerson = new PersonDTO(
                person.getId(),
        person.getPosition(),
        person.getNames(),
        person.getGender(),
        person.getTypeDocument(),
        person.getDocument(),
        person.getDependence(),
        person.getPhoneNumber(),
        person.getEmail(),
        person.getBirthdate(),
        person.getPrecedents(),
        person.getEmergencyPhoneNumber(),
        person.getAllergies()
        );
        return ResponseEntity.ok(dtoPerson);
    }


   /* @Transactional(readOnly = true)
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/persons/{personId}/consultations")
    public ResponseEntity<List<VisitRegistrationDTO>> getPersonConsultations(@PathVariable int personId) {
        List<VisitRegistration> visitRegistrations = personService.getConsultationsByPersonId(personId);
        if (visitRegistrations.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        List<VisitRegistrationDTO> dtoList = visitRegistrations.stream()
                .map(cons -> new VisitRegistrationDTO(cons.getId(), cons.getDateVisit()))
                .collect(Collectors.toList());
        return ResponseEntity.ok(dtoList);
    }*/


    //EndPoint: localhost:8080/api/v1/workers
    //Method: POST
    //SE USA
    @Transactional
    @PostMapping("/persons")
    @CrossOrigin(origins = "http://localhost:4200")
    public ResponseEntity<Person> createPerson(@RequestBody Person person){
        //existsUserByDNI(person);
        //validatePerson(person);
        return new ResponseEntity<>(personService.createPerson(person), HttpStatus.CREATED);
    }

    //EndPoint: localhost:8080/api/v1/users/{id}
    //Method: DELETE
    @Transactional
    @DeleteMapping("/persons/{id}")
    @CrossOrigin(origins = "http://localhost:4200")
    public ResponseEntity<Object> deletePerson(@PathVariable("id") int id){
        boolean isExist=personService.isPersonExist(id);
        if(isExist){
            personService.deletePerson(id);
            return new ResponseEntity<>("Person is deleted successfully", HttpStatus.OK);
        }else{
            throw new ValidationException("Error deleting person");
        }
    }


    private void existsUserByDNI(Person person){
        if(personRepository.existsByDocument(person.getDocument())){
            throw new ValidationException("No se puede registrar el usuario porque existe uno con el mismo tipo de documento");
        }
    }

   /* private void validatePerson(Person person){
        if(person.getPosition() == null || person.getPosition().trim().isEmpty()){
            throw new ValidationException("El cargo debe ser obligatorio");
        }
        if(person.getNames() == null || person.getNames().trim().isEmpty()){
            throw new ValidationException("Los nombres y apellidos deben ser obligatorios");
        }
        if(person.getGender() == null || person.getGender().trim().isEmpty()){
            throw new ValidationException("El genero debe ser obligatorio");
        }
        if(person.getDocument() == null || person.getDocument().trim().isEmpty()){
            throw new ValidationException("El documento de identidad debe ser obligatorio");
        }

        String phoneNumberRegex = "^9\\d{8}$";
        Pattern pattern = Pattern.compile(phoneNumberRegex);

        if (!pattern.matcher(person.getPhoneNumber()).matches()) {
            throw new ValidationException("El numero telefonico debe empezar con 9 y tener 9 digitos");
        } else if (person.getPhoneNumber() == null || person.getPhoneNumber().trim().isEmpty()) {
            throw new ValidationException("El numero telefonico debe ser obligatorio");
        }
        //String emailRegex = "^[^@\\s]+@[^@\\s]+$";
        //String emailRegex ="^[A-Za-z0-9+_.-]+@[A-Za-z0-9+_.-]$";
        //String emailRegex ="^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3,6}$";
        String emailRegex = "^[A-Za-z0-9+_.-]+@.+$";
        pattern = Pattern.compile(emailRegex);
        if (!pattern.matcher(person.getEmail()).matches()) {
            throw new ValidationException("El email debe ser valido");
        }else if(person.getEmail() == null || person.getEmail().trim().isEmpty()){
            throw new ValidationException("El email debe ser obligatorio");
        }
        if (person.getBirthdate() == null) {
            throw new ValidationException("La fecha de nacimiento debe ser obligatorio");
        }

    }*/

}
