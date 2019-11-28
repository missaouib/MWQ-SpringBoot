package com.mobile.web.quiz.repository.admin;

import com.mobile.web.quiz.model.User;
import com.mobile.web.quiz.model.admin.AdminUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminUserRepository extends JpaRepository<AdminUser, Long> {
    AdminUser getByUsername(String username);
}