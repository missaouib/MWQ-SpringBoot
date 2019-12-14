package com.mobile.web.quiz.service.admin;

import com.mobile.web.quiz.model.admin.Article;
import com.mobile.web.quiz.model.admin.Notice;
import com.mobile.web.quiz.repository.admin.ArticleRepository;
import com.mobile.web.quiz.repository.admin.NoticeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ArticleService {
    @Autowired
    private ArticleRepository repository;

    public void add(Article article) {
        repository.save(article);
    }

    public void delete(long id) {
        repository.deleteById(id);
    }

    public List<Article> getArticles()
    {
        return (List<Article>) repository.findAll(Sort.by(Sort.Direction.DESC, "updatedAt"));
    }
    public List<Article> getPopularArticles()
    {
        try {
            return (List<Article>) repository.findAll(Sort.by(Sort.Direction.DESC, "readCount")).subList(0, 3);
        } catch (IndexOutOfBoundsException ex) {
            return (List<Article>) repository.findAll(Sort.by(Sort.Direction.DESC, "readCount"));
        }
    }
}