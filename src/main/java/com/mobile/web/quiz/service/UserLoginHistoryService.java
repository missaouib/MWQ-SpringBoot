package com.mobile.web.quiz.service;

import com.mobile.web.quiz.model.User;
import com.mobile.web.quiz.model.UserLoginHistory;
import com.mobile.web.quiz.repository.UserLoginHistoryRepository;
import com.mobile.web.quiz.repository.UserRepository;
import com.mobile.web.quiz.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class UserLoginHistoryService {
    @Autowired
    private UserLoginHistoryRepository repository;

    public void add(UserLoginHistory loginHistory) {
        repository.save(loginHistory);
    }

    public void delete(long id) {
        repository.deleteById(id);
    }

    public List<UserLoginHistory> getLoginHistories() {
        return (List<UserLoginHistory>) repository.findAll(Sort.by(Sort.Direction.DESC, "createdAt"));
    }
}