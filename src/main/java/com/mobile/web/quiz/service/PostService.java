package com.mobile.web.quiz.service;

import com.mobile.web.quiz.exception.RecordNotFoundException;
import com.mobile.web.quiz.model.Post;
import com.mobile.web.quiz.model.User;
import com.mobile.web.quiz.repository.PostRepository;
import com.mobile.web.quiz.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;

@Component
public class PostService {
    @Autowired
    private PostRepository repository;

    public void add(Post post) {
        repository.save(post);
    }

    public void delete(long id) {
        repository.deleteById(id);
    }

    public boolean approve(long id) {
        try {
            Post post = getPostById(id);
            post.setStatus(Post.ACTIVE);

            return true;
        } catch (RecordNotFoundException ex) {
            return false;
        }
    }

    public int changeStatus(long id) {
        try {
            Post post = getPostById(id);
            if (post.getStatus() == Post.ACTIVE)
                post.setStatus(Post.INACTIVE);
            else
                post.setStatus(Post.ACTIVE);

            return post.getStatus();
        } catch (RecordNotFoundException ex) {
            return -1;
        }
    }

    public List<Post> getAllPosts() {
        return repository.findAll();
    }

    public List<Post> getPendingPosts() {
        return repository.getByStatusEquals(Post.PENDING);
    }

    public List<Post> getApprovedPosts() {
        return repository.getByStatusLessThan(Post.ACTIVE);
    }

    public List<Post> getApprovedPosts(long groupId) {
        return repository.getByStatusAndGroupId(Post.ACTIVE, groupId);
    }

    public List<Post> getPopularPosts() {
        List<Post> availablePosts = repository.getByStatusLessThan(Post.PENDING);

        availablePosts.sort(new Comparator<Post>() {
            @Override
            public int compare(Post p1, Post p2) {
                int c1 = p1.getComments().size();
                int c2 = p2.getComments().size();

                if (c1 < c2)
                    return 1;
                else if (c1 == c2)
                    return 0;
                else
                    return -1;
            }
        });

        return availablePosts;
    }

    public Post getPostById(long id) {
        Optional<Post> optionalPost = repository.findById(id);
        return optionalPost.orElseThrow(() -> new RecordNotFoundException("Couldn't find a Post with id: " + id));
    }
}