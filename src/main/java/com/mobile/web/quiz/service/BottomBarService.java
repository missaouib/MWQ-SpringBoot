package com.mobile.web.quiz.service;

import com.mobile.web.quiz.model.BottomBarItem;
import com.mobile.web.quiz.repository.BottomBarItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class BottomBarService {
    @Autowired
    private BottomBarItemRepository repository;

    public void add(BottomBarItem barItem) {
        repository.save(barItem);
    }

    public void add(String title, String icon, String url, int order) {

        BottomBarItem newItem = new BottomBarItem();
        newItem.setItemTitle(title);
        newItem.setItemDefaultTitle(title);

        newItem.setItemIcon(icon);
        newItem.setItemDefaultIcon(icon);

        newItem.setItemUrl(url);
        newItem.setItemDefaultUrl(url);

        newItem.setItemOrder(order);
        newItem.setItemDefaultOrder(order);

        repository.save(newItem);
    }

    public void delete(long id) {
        repository.deleteById(id);
    }

    public List<BottomBarItem> getItems() {
        return (List<BottomBarItem>) repository.findAll(Sort.by(Sort.Direction.ASC, "itemOrder"));
    }

    public BottomBarItem getBarItemById(long id) {
        Optional<BottomBarItem> optionalUser = repository.findById(id);
        return optionalUser.orElse(null);
    }
}