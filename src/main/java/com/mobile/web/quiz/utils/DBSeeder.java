package com.mobile.web.quiz.utils;

import com.mobile.web.quiz.service.BottomBarService;
import com.mobile.web.quiz.service.admin.AdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class DBSeeder {

    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private BottomBarService bottomBarService;


    @EventListener
    public void appReady(ApplicationReadyEvent event) {
        System.out.println(new Date(1574813618379L));
        System.out.println(new Date(1574830454037L));

        setAdminUsers();
        setBottomBarItems();
    }

    // Default Admin Users
    private void setAdminUsers() {
        if (adminUserService.getUsers().isEmpty()) {

            adminUserService.add("admin", "admin");
            adminUserService.add("root", "123");
        }
    }

    // Default Bottom Bar Settings
    private void setBottomBarItems() {
        if (bottomBarService.getItems().isEmpty()) {

            bottomBarService.add("首页", "home", "/home", 1);
            bottomBarService.add("推单", "refresh", "/push-order", 2);
            bottomBarService.add("直播", "video", "/live-broadcast", 3);
            bottomBarService.add("我的", "user", "/profile", 4);
        }
    }
}