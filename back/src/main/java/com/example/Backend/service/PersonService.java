package com.example.Backend.service;

import com.example.Backend.dto.PersonDTO;
import com.example.Backend.model.Consultation;
import com.example.Backend.model.Person;
import com.example.Backend.model.VisitRegistration;

import java.util.List;

public interface PersonService {
    public abstract Person createPerson(Person person);
    public abstract void deletePerson(int id);
    public abstract List<PersonDTO> getAllPersons();
    public abstract boolean isPersonExist(int id);

    public abstract Person getPerson(int id);

    //public abstract List<VisitRegistration> getConsultationsByPersonId(int personId);

}
