package com.mobile.web.quiz.service;

import com.mobile.web.quiz.exception.RecordNotFoundException;
import com.mobile.web.quiz.model.User;
import com.mobile.web.quiz.repository.UserRepository;
import com.mobile.web.quiz.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class UserService {
    @Autowired
    private UserRepository repository;

    @Autowired
    private VerifySMSService verifyService;

    public void add(User user) {
        repository.save(user);
    }

    public void delete(long id) {
        try {
            User user = getUserById(id);
            verifyService.deleteByPhoneNumber(user.getPhoneNumber());

            repository.deleteById(id);
        } catch (RecordNotFoundException ex) {

        }
    }

    public int changeStatus(long id) {
        try {
            User user = getUserById(id);
            if (user.getStatus() == User.ACTIVE)
                user.setStatus(User.INACTIVE);
            else
                user.setStatus(User.ACTIVE);

            return user.getStatus();
        } catch (RecordNotFoundException ex) {
            return -1;
        }
    }

    public List<User> getUsers() {
        return (List<User>) repository.findAll();
    }

    public boolean existPhoneNumber(String phoneNumber) {
        User user= repository.getByPhoneNumber(phoneNumber);
        return user != null;
    }

    public User validUser(String phoneNumber, String password) {
        User user= repository.getByPhoneNumber(phoneNumber);
        if (user != null && user.getPassword().equals(CommonUtils.getMD5Hex(password))) {
            return user;
        } else {
            return null;
        }
    }

    public User getUserById(long id) {
        Optional<User> optionalUser = repository.findById(id);
        return optionalUser.orElseThrow(() -> new RecordNotFoundException("Couldn't find a User with id: " + id));
    }
}