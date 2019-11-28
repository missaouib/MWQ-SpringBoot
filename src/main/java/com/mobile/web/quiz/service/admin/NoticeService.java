package com.mobile.web.quiz.service.admin;

import com.mobile.web.quiz.model.admin.AdminUser;
import com.mobile.web.quiz.model.admin.Notice;
import com.mobile.web.quiz.repository.admin.AdminUserRepository;
import com.mobile.web.quiz.repository.admin.NoticeRepository;
import com.mobile.web.quiz.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class NoticeService {
    @Autowired
    private NoticeRepository repository;

    public void add(Notice notice) {
        repository.save(notice);
    }

    public void delete(long id) {
        repository.deleteById(id);
    }

    public List<Notice> getNotices()
    {
        return (List<Notice>) repository.findAll(Sort.by(Sort.Direction.DESC, "updatedAt"));
    }
}