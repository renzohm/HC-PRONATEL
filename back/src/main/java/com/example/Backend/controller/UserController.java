package com.example.Backend.controller;

import com.example.Backend.config.JwtUtil;
import com.example.Backend.exception.ValidationException;
import com.example.Backend.model.User;
import com.example.Backend.repository.UserRepository;
import com.example.Backend.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1")
public class UserController {
    @Autowired
    private UserService userService;
    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    //EndPoint: http://localhost:8080/api/v1/users
    //Method: GET
    @Transactional(readOnly = true)
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/users")
    public ResponseEntity<List<User>> getAllUsers(){
        return new ResponseEntity<List<User>>(userService.getAllUsers(), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/{id}/users")
    public ResponseEntity<User> getUser(@PathVariable("id") int id){
        return new ResponseEntity<User>(userService.getUser(id), HttpStatus.OK);
    }

    //EndPoint: localhost:8080/api/v1/users
    //Method: POST
    @Transactional
    @PostMapping("/users")
    @CrossOrigin(origins = "http://localhost:4200")
    public ResponseEntity<User> createUser(@RequestBody User user){
        //validateUser(user);
        existsUserByEmail(user);
        return new ResponseEntity<>(userService.createUser(user), HttpStatus.CREATED);
    }

    //EndPoint: localhost:8080/api/v1/users/{id}
    //Method: PUT
    @Transactional
    @PutMapping("/users/{id}")
    @CrossOrigin(origins = "http://localhost:4200")

    public ResponseEntity<Object> updateUser(@PathVariable("id") int id,@RequestBody User user){
        boolean isExist=userService.isUserExist(id);
        if(isExist){
            existsUserByEmail(user);
            //validateUser(user);
            user.setId(id);
            userService.updateUser(user);
            return new ResponseEntity<>("User is updated succesfully", HttpStatus.OK);
        }else{
            throw new ValidationException("Error updating user");
        }
    }

    //EndPoint: localhost:8080/api/v1/users/{id}
    //Method: DELETE
    @Transactional
    @DeleteMapping("/users/{id}")
    @CrossOrigin(origins = "http://localhost:4200")

    public ResponseEntity<Object> deleteUser(@PathVariable("id") int id){
        boolean isExist=userService.isUserExist(id);
        if(isExist){
            userService.deleteUser(id);
            return new ResponseEntity<>("User is deleted successfully", HttpStatus.OK);
        }else{
            throw new ValidationException("Error deleting user");
        }
    }

    //EndPoint: localhost:8080/api/v1/users/login
    //Method: GET
    @Transactional(readOnly = true)
    @GetMapping("/users/login")
    @CrossOrigin(origins = "http://localhost:4200")

    public ResponseEntity<User> getCompanyByEmailAndPassword(
            @RequestParam("email") String email,
            @RequestParam("password") String password) {

        User company = userRepository.findByEmailAndPassword(email, password);
        if (company != null) {
            return new ResponseEntity<>(company, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }
    }

    private void existsUserByEmail(User user){
        if(userRepository.existsByEmail(user.getEmail())){
            throw new ValidationException("No se puede registrar el usuario porque existe una cuenta con el email");
        }
    }

    @Autowired
    private JwtUtil jwtUtil;

    @PostMapping("/users/register")
    public ResponseEntity<?> registerUser(@RequestBody User user) {
        //validateUser(user);
        existsUserByEmail(user);
        User savedUser = userService.createUser(user);
        String token = jwtUtil.generateToken(user);
        //return ResponseEntity.ok(Map.of("token", token, "user", savedUser));
        return ResponseEntity.ok(Map.of("token", token));

    }

    @PostMapping("/users/login")
    public ResponseEntity<?> loginUser(@RequestBody User loginRequest) {
        String email = loginRequest.getEmail();
        String password = loginRequest.getPassword();
        User user = userRepository.findByEmailAndPassword(email, password);
        if (user != null) {
            String token = jwtUtil.generateToken(user);
            return ResponseEntity.ok(Map.of("token", token, "user", user));
            //return ResponseEntity.ok(Map.of("token", token));

        } else {
            return new ResponseEntity<>("Usuario o contraseña incorrectos", HttpStatus.UNAUTHORIZED);
        }
    }

    @GetMapping("/users/me")
    public ResponseEntity<?> getUserDetails(@RequestHeader("Authorization") String authHeader) {
        if (authHeader != null && authHeader.startsWith("Bearer ")) {
            String token = authHeader.substring(7);
            Map<String, Object> userDetails = jwtUtil.decodeToken(token);
            return ResponseEntity.ok(userDetails);
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Token no proporcionado o formato incorrecto");
        }
    }

}
