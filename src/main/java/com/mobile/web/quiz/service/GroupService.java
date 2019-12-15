package com.mobile.web.quiz.service;

import com.mobile.web.quiz.exception.RecordNotFoundException;
import com.mobile.web.quiz.model.Group;
import com.mobile.web.quiz.model.User;
import com.mobile.web.quiz.model.admin.Article;
import com.mobile.web.quiz.repository.GroupRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;

import java.util.Comparator;
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

    public boolean approve(long id) {
        try {
            Group group = getGroupById(id);
            group.setStatus(Group.ACTIVE);

            return true;
        } catch (RecordNotFoundException ex) {
            return false;
        }
    }

    public int changeStatus(long id) {
        try {
            Group group = getGroupById(id);
            if (group.getStatus() == Group.ACTIVE)
                group.setStatus(Group.INACTIVE);
            else
                group.setStatus(Group.ACTIVE);

            return group.getStatus();
        } catch (RecordNotFoundException ex) {
            return -1;
        }
    }

    public List<Group> getAllGroups() {
        return repository.findAll();
    }

    public List<Group> getPendingGroups() {
        return repository.getByStatusEquals(Group.PENDING);
    }

    public List<Group> getApprovedGroups() {
        return repository.getByStatusLessThan(Group.PENDING);
    }

    public List<Group> getPopularGroups() {
        List<Group> availableGroups = repository.getByStatusLessThan(Group.PENDING);

        availableGroups.sort(new Comparator<Group>() {
            @Override
            public int compare(Group g1, Group g2) {
                int c1 = g1.getUserCount();
                int c2 = g2.getUserCount();

                if (c1 > c2)
                    return 1;
                else if (c1 == c2)
                    return 0;
                else
                    return -1;
            }
        });

        try {
            return availableGroups.subList(0, 4);
        } catch (IndexOutOfBoundsException ex) {
            return availableGroups;
        }
    }

    public Group getGroupById(long id) {
        Optional<Group> optionalGroup = repository.findById(id);
        return optionalGroup.orElseThrow(() -> new RecordNotFoundException("Couldn't find a Group with id: " + id));
    }
}