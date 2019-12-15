package com.mobile.web.quiz.controller;

import com.mobile.web.quiz.model.BottomBarItem;
import com.mobile.web.quiz.model.BottomBarItem2;
import com.mobile.web.quiz.model.User;
import com.mobile.web.quiz.service.*;
import com.mobile.web.quiz.service.admin.ArticleService;
import com.mobile.web.quiz.service.admin.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BaseController {
    @Autowired
    protected HttpServletRequest request;

    @Autowired
    protected HttpSession session;

    @Autowired
    protected UserService userService;

    @Autowired
    protected UserLoginHistoryService userLoginHistoryService;

    @Autowired
    protected VerifySMSService verifySMSService;

    @Autowired
    protected NoticeService noticeService;

    @Autowired
    protected ArticleService articleService;

    @Autowired
    protected GroupService groupService;

    @Autowired
    protected ProductService productService;

    @Autowired
    protected BottomBarService bottomBarService;

    protected void setLoggedUser(User user) {
        session.setAttribute("LoggedUser", user);
    }

    protected User getLoggedUser() {
        return (User)session.getAttribute("LoggedUser");
    }

    protected boolean isLoggedIn() {
        User loggedUser = getLoggedUser();
        return loggedUser != null;
    }

    protected List<BottomBarItem2> getBottomBarItems(int active) {
        List<BottomBarItem2> items = new ArrayList<BottomBarItem2>();

        List<BottomBarItem> dbItems = bottomBarService.getItems();
        for (int i = 0; i < dbItems.size(); i++) {
            String title = dbItems.get(i).getItemTitle();
            String icon = "/img/bottom_bar/" + dbItems.get(i).getItemIcon() + "_" + (i == active? "en" : "dis") + ".png";
            String url = dbItems.get(i).getItemUrl();
            String color = i == active? "#ff9800" : "#999999";

            BottomBarItem2 item = new BottomBarItem2(title, icon, url, color);
            items.add(item);
        }

        return items;
    }
}

