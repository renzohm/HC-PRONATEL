package com.example.Backend.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "email", length = 50, nullable = false)
    private String email;
    @Column(name = "password", length = 30, nullable = false)
    private String password;
    @Column(name = "names", length = 100, nullable = false)
    private String names;
    @Column(name = "specialty", nullable = false)
    private String specialty;
    @Column(name = "cmp", length = 5, nullable = false)
    private String cmp;
    @Column(name = "dni", length = 8, nullable = false)
    private String dni;
}
