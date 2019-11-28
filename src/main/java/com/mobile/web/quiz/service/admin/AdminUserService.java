package com.mobile.web.quiz.service.admin;

import com.mobile.web.quiz.model.User;
import com.mobile.web.quiz.model.admin.AdminUser;
import com.mobile.web.quiz.repository.admin.AdminUserRepository;
import com.mobile.web.quiz.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class AdminUserService {
    @Autowired
    private AdminUserRepository repository;

    public void add(AdminUser adminUser) {
        repository.save(adminUser);
    }

    public void add(String name, String password) {
        AdminUser adminUser = new AdminUser();

        adminUser.setName(name);
        adminUser.setPassword(CommonUtils.getMD5Hex(password));

        repository.save(adminUser);
    }

    public void delete(long id) {
        repository.deleteById(id);
    }

    public boolean existAdminUser(String userName) {
        AdminUser adminUser = repository.getByUsername(userName);
        return adminUser != null;
    }

    public AdminUser validAdminUser(String userName, String password) {
        AdminUser adminUser = repository.getByUsername(userName);
        if (adminUser != null && adminUser.getPassword().equals(CommonUtils.getMD5Hex(password))) {
            return adminUser;
        } else {
            return null;
        }
    }

    public List<AdminUser> getUsers() {
        return (List<AdminUser>) repository.findAll();
    }
}