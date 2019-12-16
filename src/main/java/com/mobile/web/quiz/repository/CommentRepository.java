package com.mobile.web.quiz.repository;

import com.mobile.web.quiz.model.Comment;
import com.mobile.web.quiz.model.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {

}