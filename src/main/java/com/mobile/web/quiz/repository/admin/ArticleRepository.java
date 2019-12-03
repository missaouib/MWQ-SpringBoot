package com.mobile.web.quiz.repository.admin;

import com.mobile.web.quiz.model.admin.Article;
import com.mobile.web.quiz.model.admin.Notice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ArticleRepository extends JpaRepository<Article, Long> {

}