package com.mobile.web.quiz.controller;

import com.mobile.web.quiz.config.Config;
import com.mobile.web.quiz.model.admin.AdminUser;
import com.mobile.web.quiz.model.admin.Notice;
import com.mobile.web.quiz.model.admin.SideBarItem;
import com.mobile.web.quiz.service.UserLoginHistoryService;
import com.mobile.web.quiz.service.UserService;
import com.mobile.web.quiz.service.admin.AdminUserService;
import com.mobile.web.quiz.service.admin.NoticeService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
public class AdminController {
    private enum UploadType { Notice };

    @Autowired
    protected HttpSession session;

    @Autowired
    private AdminUserService adminUserService;

    private void setLoggedAdminUser(AdminUser adminUser) {
        session.setAttribute("LoggedAdminUser", adminUser);
    }

    private AdminUser getLoggedAdminUser() {
        return (AdminUser)session.getAttribute("LoggedAdminUser");
    }

    private boolean isLoggedIn() {
        AdminUser loggedAdminUser = getLoggedAdminUser();
        return loggedAdminUser != null;
    }

    private String saveUploadedFile(UploadType uploadType, MultipartFile file) {
        String[] subPaths = new String[] {"notice"};

        String uploadedUrl = "";

        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                String extension = FilenameUtils.getExtension(file.getOriginalFilename());
                String fileName = UUID.randomUUID().toString() + "." + extension;

                Path savedPath = Paths.get(Config.UPLOAD_DIR.getAbsolutePath(), subPaths[uploadType.ordinal()], fileName);
                Files.write(savedPath, bytes);

                uploadedUrl = Paths.get(Config.UPLOAD_PATH, subPaths[uploadType.ordinal()], fileName).toString();
            } catch (IOException ex) {
                ex.printStackTrace();
                uploadedUrl = null;
            }
        }

        return uploadedUrl;
    }

    // Dashboard
    @GetMapping({"/admin"})
    public String admin(Model model) {
        if (isLoggedIn()) {
            model.addAttribute("sideBarItem", new SideBarItem("dashboard", ""));
            return "admin/dashboard";
        } else {
            return "admin/login";
        }
    }

    // Login
    @RequestMapping({"admin/login"})
    public String performLogIn(Model model, @RequestParam Map<String, String> params) {
        if (params.size() == 0) {
            return "login";
        } else {
            String userName = params.get("username");
            String password = params.get("password");

            boolean status = false;
            String message = "";

            if (!adminUserService.existAdminUser(userName)) {
                message = "not exist";
            } else {
                AdminUser adminUser = adminUserService.validAdminUser(userName, password);
                if (adminUser != null) {
                    status = true;
                    setLoggedAdminUser(adminUser);
                } else {
                    message = "wrong password";
                }
            }

            if (status) {
                model.addAttribute("sideBarItem", new SideBarItem("dashboard", ""));
                return "admin/dashboard";
            } else {
                model.addAttribute("userName", userName);
                model.addAttribute("password", password);

                model.addAttribute("message", message);

                return "admin/login";
            }
        }
    }

    @Autowired
    private UserService userService;

    @GetMapping({"/admin/user-analysis"})
    public String userAnalysis(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("user", "analysis"));
        return "admin/user/user_analysis";
    }

    @GetMapping({"/admin/user-list"})
    public String userList(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("user", "list"));
        model.addAttribute("users", userService.getUsers());

        return "admin/user/user_list";
    }

    @Autowired
    private UserLoginHistoryService loginHistoryService;

    @GetMapping({"/admin/user-login-history"})
    public String login_management(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("user", "login-history"));
        model.addAttribute("loginHistories", loginHistoryService.getLoginHistories());

        return "admin/user/login_history";
    }

    @RequestMapping({"/admin/add-article"})
    public String addArticle(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("info-center", "article"));
        return "admin/infos/add_article";
    }

    @GetMapping({"/admin/article-list"})
    public String articleList(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("info-center", "article"));
        return "admin/infos/article_list";
    }

    @Autowired
    private NoticeService noticeService;

    @GetMapping({"/admin/add-notice"})
    public String addNotice(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("info-center", "notice"));
        return "admin/infos/add_notice";
    }

    @PostMapping({"/admin/add-notice"})
    @ResponseBody
    public HashMap<String, Object> addNotice(Model model, @RequestParam Map<String, String> params, @RequestParam Map<String, MultipartFile> files) {
        HashMap<String, Object> response = new HashMap<>();

        boolean status = false;
        if (params.size() != 0 || files.size() !=0) {
            String title = params.get("title");
            String content = params.get("content");

            MultipartFile image = files.get("image");
            String imageUrl = saveUploadedFile(UploadType.Notice, image);

            Notice newNotice = new Notice();
            newNotice.setTitle(title);
            newNotice.setContent(content);
            if (imageUrl != null)
                newNotice.setImageUrl(imageUrl);
            else
                response.put("message", "fail to upload image");

            noticeService.add(newNotice);
            status = true;
        }

        response.put("status", status);
        return response;
    }

    @GetMapping({"/admin/notice-list"})
    public String noticeList(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("info-center", "notice"));
        return "admin/infos/notice_list";
    }

    @GetMapping({"/admin/order-check"})
    public String orderCheck(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("order", "check"));
        return "admin/order/check_order";
    }

    @GetMapping({"/admin/order-list"})
    public String orderList(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("order", "list"));
        return "admin/order/order_list";
    }

    @GetMapping({"/admin/audited"})
    public String audited(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("review", "audited"));
        return "admin/audit/audited";
    }

    @GetMapping({"/admin/pending-review"})
    public String pendingReview(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("review", "pending"));
        return "admin/audit/pending_review";
    }

    @GetMapping({"/admin/finance"})
    public String finance(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("finance", ""));
        return "admin/financial/financial_statements";
    }

    @GetMapping({"/admin/fund-cash"})
    public String fundCash(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("fund", "cash"));
        return "admin/fund/cash_withdrawal_management";
    }

    @GetMapping({"/admin/fund-recharge"})
    public String fund_recharge(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("fund", "recharge"));
        return "admin/fund/recharge_management";
    }

    @GetMapping({"/admin/add-circle"})
    public String add_circle(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("plate", "add-circle"));
        return "admin/sector/add_circle";
    }

    @GetMapping({"/admin/circle-management"})
    public String circle_management(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("plate", "circle-management"));
        return "admin/sector/circle_management";
    }

    @GetMapping({"/admin/withdrawal"})
    public String withdrawal(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("withdrawal", ""));
        return "admin/withdrawal/withdrawal_review";
    }

    @GetMapping({"/admin/setting-basic"})
    public String basic(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("settings", "basic"));
        return "admin/settings/basic";
    }

    @GetMapping({"/admin/setting-parameter"})
    public String parameter(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("settings", "parameter"));
        return "admin/settings/parameter";
    }

    @GetMapping({"/admin/setting-menu"})
    public String menu(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("settings", "menu"));
        return "admin/settings/menu";
    }

    @GetMapping({"/admin/setting-payment"})
    public String payment(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("settings", "payment"));
        return "admin/settings/payment";
    }
}