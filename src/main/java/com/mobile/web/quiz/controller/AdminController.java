package com.mobile.web.quiz.controller;

import com.mobile.web.quiz.config.Config;
import com.mobile.web.quiz.exception.RecordNotFoundException;
import com.mobile.web.quiz.model.Group;
import com.mobile.web.quiz.model.Product;
import com.mobile.web.quiz.model.User;
import com.mobile.web.quiz.model.admin.AdminUser;
import com.mobile.web.quiz.model.admin.Article;
import com.mobile.web.quiz.model.admin.Notice;
import com.mobile.web.quiz.model.admin.SideBarItem;
import com.mobile.web.quiz.service.*;
import com.mobile.web.quiz.service.admin.AdminUserService;
import com.mobile.web.quiz.service.admin.ArticleService;
import com.mobile.web.quiz.service.admin.NoticeService;
import com.mobile.web.quiz.utils.UploadDirectories;
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

    private String saveUploadedFile(String dest, MultipartFile file) {
        String uploadedUrl = "";

        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                String extension = FilenameUtils.getExtension(file.getOriginalFilename());
                String fileName = UUID.randomUUID().toString() + "." + extension;

                Path savedPath = Paths.get(Config.UPLOAD_DIR.getAbsolutePath(), dest, fileName);
                Files.write(savedPath, bytes);

                uploadedUrl = Paths.get(Config.UPLOAD_PATH, dest, fileName).toString();
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

    @PostMapping({"/admin/del-user"})
    @ResponseBody
    public HashMap<String, Object> deleteUser(@RequestParam Map<String, String> params) {
        HashMap<String, Object> response = new HashMap<>();

        String id = params.get("id");
        userService.delete(Long.parseLong(id));

        response.put("status", true);
        return response;
    }

    @PostMapping({"/admin/user-status"})
    @ResponseBody
    public HashMap<String, Object> changeUserStatus(@RequestParam Map<String, String> params) {
        HashMap<String, Object> response = new HashMap<>();

        String id = params.get("id");

        int status = userService.changeStatus(Long.parseLong(id));

        response.put("status", status);
        return response;
    }

    @Autowired
    private UserLoginHistoryService loginHistoryService;

    @GetMapping({"/admin/user-login-history"})
    public String login_management(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("user", "login-history"));
        model.addAttribute("loginHistories", loginHistoryService.getLoginHistories());

        return "admin/user/login_history";
    }

    @Autowired
    private ArticleService articleService;

    @RequestMapping({"/admin/add-article"})
    public String addArticle(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("info-center", "article"));
        return "admin/infos/add_article";
    }

    @PostMapping({"/admin/add-article"})
    @ResponseBody
    public HashMap<String, Object> addArticle(@RequestParam Map<String, String> params, @RequestParam Map<String, MultipartFile> files) {
        HashMap<String, Object> response = new HashMap<>();

        boolean status = false;
        if (params.size() != 0 || files.size() !=0) {
            String content = params.get("content");
            MultipartFile image = files.get("image");
            String imageUrl = saveUploadedFile(UploadDirectories.ARTICLE, image);

            if (imageUrl != null) {
                Article newArticle = new Article();
                newArticle.setContent(content);
                newArticle.setImageUrl(imageUrl);

                articleService.add(newArticle);
                status = true;
            } else {
                response.put("message", "fail to upload image");
            }
        }

        response.put("status", status);
        return response;
    }

    @PostMapping({"/admin/del-article"})
    @ResponseBody
    public HashMap<String, Object> deleteArticle(@RequestParam Map<String, String> params) {
        HashMap<String, Object> response = new HashMap<>();

        String id = params.get("id");
        articleService.delete(Long.parseLong(id));

        response.put("status", true);
        return response;
    }

    @GetMapping({"/admin/article-list"})
    public String articleList(Model model) {
        model.addAttribute("articleList", articleService.getArticles());
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
    public HashMap<String, Object> addNotice(@RequestParam Map<String, String> params, @RequestParam Map<String, MultipartFile> files) {
        HashMap<String, Object> response = new HashMap<>();

        boolean status = false;
        if (params.size() != 0 || files.size() !=0) {
            //String title = params.get("title");
            String content = params.get("content");

            Notice newNotice = new Notice();
            newNotice.setContent(content);
            noticeService.add(newNotice);

            status = true;
        }

        response.put("status", status);
        return response;
    }

    @PostMapping({"/admin/del-notice"})
    @ResponseBody
    public HashMap<String, Object> deleteNotice(@RequestParam Map<String, String> params) {
        HashMap<String, Object> response = new HashMap<>();

        String id = params.get("id");
        noticeService.delete(Long.parseLong(id));

        response.put("status", true);
        return response;
    }

    @GetMapping({"/admin/notice-list"})
    public String noticeList(Model model) {
        model.addAttribute("noticeList", noticeService.getNotices());
        model.addAttribute("sideBarItem", new SideBarItem("info-center", "notice"));
        return "admin/infos/notice_list";
    }

    @Autowired
    private GroupService groupService;

    @GetMapping({"/admin/add-circle"})
    public String addGroup(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("plate", "add-circle"));
        return "admin/sector/add_circle";
    }

    @PostMapping({"/admin/add-group"})
    @ResponseBody
    public HashMap<String, Object> addGroup(@RequestParam Map<String, String> params, @RequestParam Map<String, MultipartFile> files) {
        HashMap<String, Object> response = new HashMap<>();

        boolean status = false;
        if (params.size() != 0 || files.size() !=0) {
            String title = params.get("title");
            MultipartFile logo = files.get("image");
            String logoUrl = saveUploadedFile(UploadDirectories.GROUP, logo);

            if (logoUrl != null) {
                Group newGroup = new Group();
                newGroup.setTitle(title);
                newGroup.setLogoUrl(logoUrl);
                newGroup.setStatus(Group.PENDING);

                groupService.add(newGroup);
                status = true;
            } else {
                response.put("message", "fail to upload image");
            }
        }

        response.put("status", status);
        return response;
    }

    @PostMapping({"/admin/approve-group"})
    @ResponseBody
    public HashMap<String, Object> approveGroup(@RequestParam Map<String, String> params) {
        HashMap<String, Object> response = new HashMap<>();

        String id = params.get("id");
        boolean status = groupService.approve(Long.parseLong(id));

        response.put("status", status);
        return response;
    }

    @PostMapping({"/admin/group-status"})
    @ResponseBody
    public HashMap<String, Object> changeGroupStatus(@RequestParam Map<String, String> params) {
        HashMap<String, Object> response = new HashMap<>();

        String id = params.get("id");

        int status = groupService.changeStatus(Long.parseLong(id));

        response.put("status", status);
        return response;
    }

    @PostMapping({"/admin/del-group"})
    @ResponseBody
    public HashMap<String, Object> deleteGroup(@RequestParam Map<String, String> params) {
        HashMap<String, Object> response = new HashMap<>();

        String id = params.get("id");
        groupService.delete(Long.parseLong(id));

        response.put("status", true);
        return response;
    }

    @GetMapping({"/admin/circle-management"})
    public String groupList(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("plate", "circle-management"));
        model.addAttribute("groups", groupService.getApprovedGroups());
        return "admin/sector/circle_management";
    }

    @GetMapping({"/admin/group-user/{id}"})
    public String groupUsers(Model model, @PathVariable("id") Long id) {
        model.addAttribute("sideBarItem", new SideBarItem("plate", "circle-management"));
        model.addAttribute("users", groupService.getGroupById(id).getUsers());
        return "admin/sector/group_user";
    }

    @GetMapping({"/admin/group-post/{id}"})
    public String groupPosts(Model model, @PathVariable("id") Long id) {
        model.addAttribute("sideBarItem", new SideBarItem("plate", "circle-management"));
        model.addAttribute("posts", groupService.getGroupById(id).getApprovedPosts());
        return "admin/sector/group_post";
    }

    @Autowired
    private ProductService productService;

    @GetMapping({"/admin/product-add"})
    public String productAdd(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("shop", "add"));
        return "admin/shop/product_add";
    }

    @PostMapping({"/admin/add-product"})
    @ResponseBody
    public HashMap<String, Object> addProduct(@RequestParam Map<String, String> params, @RequestParam Map<String, MultipartFile> files) {
        HashMap<String, Object> response = new HashMap<>();

        boolean status = false;
        if (params.size() != 0 || files.size() !=0) {
            String name = params.get("name");
            MultipartFile image = files.get("image");
            String imageUrl = saveUploadedFile(UploadDirectories.PRODUCT, image);
            double price = params.get("price").isEmpty() ? 0 : Double.parseDouble(params.get("price"));
            double expressDeliveryCost = params.get("express").isEmpty() ? 0 : Double.parseDouble(params.get("express"));
            String parameter = params.get("parameter");
            String detail = params.get("detail");

            if (imageUrl != null) {
                Product newProduct = new Product();
                newProduct.setName(name);
                newProduct.setImageUrl(imageUrl);
                newProduct.setPrice(price);
                newProduct.setExpressDeliveryCost(expressDeliveryCost);
                newProduct.setParameter(parameter);
                newProduct.setDetail(detail);

                newProduct.setStatus(Product.ACTIVE);

                productService.add(newProduct);
                status = true;
            } else {
                response.put("message", "fail to upload image");
            }
        }

        response.put("status", status);
        return response;
    }

    @PostMapping({"/admin/product-status"})
    @ResponseBody
    public HashMap<String, Object> changeProductStatus(@RequestParam Map<String, String> params) {
        HashMap<String, Object> response = new HashMap<>();

        String id = params.get("id");

        int status = productService.changeStatus(Long.parseLong(id));

        response.put("status", status);
        return response;
    }

    @PostMapping({"/admin/del-product"})
    @ResponseBody
    public HashMap<String, Object> deleteProduct(@RequestParam Map<String, String> params) {
        HashMap<String, Object> response = new HashMap<>();

        String id = params.get("id");
        productService.delete(Long.parseLong(id));

        response.put("status", true);
        return response;
    }

    @GetMapping({"/admin/product-list"})
    public String productList(Model model) {
        model.addAttribute("sideBarItem", new SideBarItem("shop", "list"));
        model.addAttribute("products", productService.getAllProducts());
        return "admin/shop/product_list";
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

    @Autowired
    private PostService postService;

    @PostMapping({"/admin/approve-post"})
    @ResponseBody
    public HashMap<String, Object> approvePost(@RequestParam Map<String, String> params) {
        HashMap<String, Object> response = new HashMap<>();

        String id = params.get("id");
        boolean status = postService.approve(Long.parseLong(id));

        response.put("status", status);
        return response;
    }

    @PostMapping({"/admin/post-status"})
    @ResponseBody
    public HashMap<String, Object> changePostStatus(@RequestParam Map<String, String> params) {
        HashMap<String, Object> response = new HashMap<>();

        String id = params.get("id");

        int status = postService.changeStatus(Long.parseLong(id));

        response.put("status", status);
        return response;
    }

    @PostMapping({"/admin/del-post"})
    @ResponseBody
    public HashMap<String, Object> deletePost(@RequestParam Map<String, String> params) {
        HashMap<String, Object> response = new HashMap<>();

        String id = params.get("id");
        postService.delete(Long.parseLong(id));

        response.put("status", true);
        return response;
    }

    @Autowired
    private CommentService commentService;

    @GetMapping({"/admin/audited"})
    public String audited(Model model) {
        model.addAttribute("groups", groupService.getApprovedGroups());
        model.addAttribute("posts", postService.getApprovedPosts());
        model.addAttribute("sideBarItem", new SideBarItem("review", "audited"));
        return "admin/audit/audited";
    }

    @GetMapping({"/admin/pending-review"})
    public String pendingReview(Model model) {
        model.addAttribute("groups", groupService.getPendingGroups());
        model.addAttribute("posts", postService.getPendingPosts());
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
