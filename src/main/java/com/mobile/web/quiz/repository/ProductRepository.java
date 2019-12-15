package com.mobile.web.quiz.repository;

import com.mobile.web.quiz.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> getByStatusEquals(int status);
}