package com.example.Backend.service.impl;

import com.example.Backend.dto.PersonDTO;
import com.example.Backend.model.Consultation;
import com.example.Backend.model.Person;
import com.example.Backend.model.VisitRegistration;
import com.example.Backend.repository.PersonRepository;
import com.example.Backend.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class PersonServiceImpl implements PersonService {
    @Autowired
    private PersonRepository personRepository;
    @Override
    public Person createPerson(Person person) {
        return personRepository.save(person);
    }

    @Override
    public void deletePerson(int id) {
        personRepository.deleteById(id);
    }

    @Override
    public List<PersonDTO> getAllPersons() {
        List<Person> persons = (List<Person>) personRepository.findAll();
        return persons.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

        private PersonDTO convertToDTO(Person person) {
        PersonDTO dto = new PersonDTO();
        dto.setId(person.getId());
        dto.setPosition(person.getPosition());
        dto.setNames(person.getNames());
        dto.setGender(person.getGender());
        dto.setTypeDocument(person.getTypeDocument());
        dto.setDocument(person.getDocument());
        dto.setDependence(person.getDependence());
        dto.setPhoneNumber(person.getPhoneNumber());
        dto.setEmail(person.getEmail());
        dto.setBirthdate(person.getBirthdate());
        dto.setPrecedents(person.getPrecedents());
        dto.setEmergencyPhoneNumber(person.getEmergencyPhoneNumber());
        dto.setAllergies(person.getAllergies());
        // Copiar otros campos necesarios
        return dto;
    }
    @Override
    public boolean isPersonExist(int id) {
        return personRepository.existsById(id);
    }

    @Override
    public Person getPerson(int id) {
        return personRepository.findById(id).get();    }

   /* @Override
    public List<VisitRegistration> getConsultationsByPersonId(int personId) {
        return personRepository.findConsultationsByPersonId(personId);
    }*/
}
