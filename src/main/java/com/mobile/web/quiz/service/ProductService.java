package com.mobile.web.quiz.service;

import com.mobile.web.quiz.exception.RecordNotFoundException;
import com.mobile.web.quiz.model.Group;
import com.mobile.web.quiz.model.Product;
import com.mobile.web.quiz.repository.GroupRepository;
import com.mobile.web.quiz.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;

@Component
public class ProductService {
    @Autowired
    private ProductRepository repository;

    public void add(Product product) {
        repository.save(product);
    }

    public void delete(long id) {
        try {
            repository.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int changeStatus(long id) {
        try {
            Product product = getProductById(id);
            if (product.getStatus() == Product.ACTIVE)
                product.setStatus(Product.INACTIVE);
            else
                product.setStatus(Product.ACTIVE);

            return product.getStatus();
        } catch (RecordNotFoundException ex) {
            return -1;
        }
    }

    public List<Product> getAllProducts() {
        return repository.findAll();
    }
    public List<Product> getAvailableProducts() {
        return repository.getByStatusEquals(Product.ACTIVE);
    }

    public Product getProductById(long id) {
        Optional<Product> optionalProduct = repository.findById(id);
        return optionalProduct.orElseThrow(() -> new RecordNotFoundException("Couldn't find a Group with id: " + id));
    }
}