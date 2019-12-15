package com.mobile.web.quiz.repository;

import com.mobile.web.quiz.model.VerifySMS;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VerifySMSRepository extends JpaRepository<VerifySMS, Long> {

    List<VerifySMS> findByPhoneNumber(String phoneNumber);
    List<VerifySMS> findByPhoneNumberAndExpiredOrderByCreatedAtDesc(String phoneNumber, boolean expired);
}