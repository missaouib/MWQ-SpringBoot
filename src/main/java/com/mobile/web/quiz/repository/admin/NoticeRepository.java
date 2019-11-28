package com.mobile.web.quiz.repository.admin;

import com.mobile.web.quiz.model.admin.AdminUser;
import com.mobile.web.quiz.model.admin.Notice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NoticeRepository extends JpaRepository<Notice, Long> {

}