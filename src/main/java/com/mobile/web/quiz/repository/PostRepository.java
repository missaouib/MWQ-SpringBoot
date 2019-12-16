package com.mobile.web.quiz.repository;

import com.mobile.web.quiz.model.Group;
import com.mobile.web.quiz.model.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostRepository extends JpaRepository<Post, Long> {
    List<Post> getByStatusLessThan(int status);
    List<Post> getByStatusEquals(int status);
    List<Post> getByStatusAndGroupId(int status, long groupId);
}