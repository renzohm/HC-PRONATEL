package com.example.Backend.service;

import com.example.Backend.model.User;

import java.util.List;

public interface UserService {
    public abstract User createUser(User user);
    public abstract void deleteUser(int id);
    public abstract void updateUser(User user);
    public abstract User getUser(int id);
    public abstract List<User> getAllUsers();
    public abstract boolean isUserExist(int id);


}
