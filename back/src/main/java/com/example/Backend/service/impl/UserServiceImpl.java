package com.example.Backend.service.impl;

import com.example.Backend.model.User;
import com.example.Backend.repository.UserRepository;
import com.example.Backend.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public User createUser(User user) { return userRepository.save(user); }
    @Override
    public void deleteUser(int id) { userRepository.deleteById(id); }

    @Override
    public void updateUser(User user) { userRepository.save(user); }

    @Override
    public User getUser(int id) { return userRepository.findById(id).get(); }

    @Override
    public List<User> getAllUsers() { return (List<User>) userRepository.findAll(); }

    @Override
    public boolean isUserExist(int id) {return userRepository.existsById(id);}
}
