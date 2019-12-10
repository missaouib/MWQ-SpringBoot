package com.mobile.web.quiz.controller;

import com.mobile.web.quiz.model.admin.Notice;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class MainController extends BaseController  {

    @GetMapping({"/", "/home"})
    public String index(Model model) {
        StringBuilder notices = new StringBuilder();
        for (Notice item : noticeService.getNotices()) {
            notices.append(item.getContent());
            notices.append("，");
        }
	
	if (notices.length() > 0) {
            notices.deleteCharAt(notices.length() - 1);
	}

        model.addAttribute("notices", notices.toString());
        model.addAttribute("popularArticles", articleService.getPopularArticles());
        model.addAttribute("bottomBar", getBottomBarItems(0));

        return "home";
    }

    @GetMapping({"/live-broadcast"})
    public String video(Model model) {
        model.addAttribute("bottomBar", getBottomBarItems(2));

        return "video";
    }

    @GetMapping({"/push-order"})
    public String pushorder(Model model) {
        model.addAttribute("bottomBar", getBottomBarItems(1));

        return "pushorder";
    }

    @GetMapping({"/latestlist"})
    public String latestlist(Model model) { return "latestlist"; }

    @GetMapping({"/profile"})
    public String user(Model model, HttpSession session) {
        if (isLoggedIn()) {
            model.addAttribute("bottomBar", getBottomBarItems(3));
            return "user";
        } else {
            return "login";
        }
    }

    @GetMapping({"/circle"})
    public String circle(Model model) { return "circle"; }

    @GetMapping({"/releasepost"})
    public String releasepost(Model model) { return "releasepost"; }

    @GetMapping({"/rechargecenter"})
    public String rechargecenter(Model model) { return "rechargecenter"; }

    @GetMapping({"/online-recharge"})
    public String online_recharge(Model model) { return "online_recharge"; }

    @GetMapping({"/income"})
    public String income(Model model) { return "income"; }

    @GetMapping({"/becomemember"})
    public String becomemember(Model model) { return "becomemember"; }

    @GetMapping({"/invitefriends"})
    public String invitefriends(Model model) { return "invitefriends"; }

    @GetMapping({"/applyforentry"})
    public String applyforentry(Model model) { return "applyforentry"; }

    @GetMapping({"/submitsuccess"})
    public String submitsuccess(Model model) { return "submitsuccess"; }

    @GetMapping({"/mall"})
    public String mall(Model model) { return "mall"; }

    @GetMapping({"/buyhorn"})
    public String buyhorn(Model model) { return "buyhorn"; }

    @GetMapping({"/confirmorder"})
    public String confirmorder(Model model) { return "confirmorder"; }

    @GetMapping({"/myaddress"})
    public String myaddress(Model model) { return "myaddress"; }

    @GetMapping({"/myorder"})
    public String myorder(Model model) { return "myorder"; }

    @GetMapping({"/order-history"})
    public String order_history(Model model) { return "order_history"; }

    @GetMapping({"/notice-list"})
    public String notice_list(Model model) { return "notice_list"; }

}

