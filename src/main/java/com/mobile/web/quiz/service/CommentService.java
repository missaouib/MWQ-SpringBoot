package com.mobile.web.quiz.service;

import com.mobile.web.quiz.exception.RecordNotFoundException;
import com.mobile.web.quiz.model.Comment;
import com.mobile.web.quiz.model.Post;
import com.mobile.web.quiz.repository.CommentRepository;
import com.mobile.web.quiz.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class CommentService {
    @Autowired
    private CommentRepository repository;

    public void add(Comment comment) {
        repository.save(comment);
    }

    public void delete(long id) {
        try {
            repository.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Comment> getComments() {
        return repository.findAll();
    }

    public Comment getCommentById(long id) {
        Optional<Comment> optionalComment = repository.findById(id);
        return optionalComment.orElseThrow(() -> new RecordNotFoundException("Couldn't find a Comment with id: " + id));
    }
}