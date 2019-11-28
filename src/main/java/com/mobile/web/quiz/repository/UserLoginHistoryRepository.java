package com.mobile.web.quiz.repository;

import com.mobile.web.quiz.model.User;
import com.mobile.web.quiz.model.UserLoginHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserLoginHistoryRepository extends JpaRepository<UserLoginHistory, Long> {

}