package com.mobile.web.quiz.repository;

import com.mobile.web.quiz.model.Group;
import com.mobile.web.quiz.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GroupRepository extends JpaRepository<Group, Long> {

}