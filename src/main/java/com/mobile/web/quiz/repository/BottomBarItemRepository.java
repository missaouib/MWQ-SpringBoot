package com.mobile.web.quiz.repository;

import com.mobile.web.quiz.model.BottomBarItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BottomBarItemRepository extends JpaRepository<BottomBarItem, Long> {

}