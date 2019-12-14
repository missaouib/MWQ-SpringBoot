package com.mobile.web.quiz.service;

import com.mobile.web.quiz.exception.RecordNotFoundException;
import com.mobile.web.quiz.model.Group;
import com.mobile.web.quiz.model.User;
import com.mobile.web.quiz.repository.GroupRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class GroupService {
    @Autowired
    private GroupRepository repository;

    public void add(Group group) {
        repository.save(group);
    }

    public void delete(long id) {
        repository.deleteById(id);
    }

    public List<Group> getGroups() {
        return (List<Group>) repository.findAll();
    }

    public Group getGroupById(long id) {
        Optional<Group> optionalGroup = repository.findById(id);
        return optionalGroup.orElseThrow(() -> new RecordNotFoundException("Couldn't find a Group with id: " + id));
    }
}