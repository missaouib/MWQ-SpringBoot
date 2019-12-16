package com.mobile.web.quiz.controller;

import com.mobile.web.quiz.config.Config;
import com.mobile.web.quiz.model.Group;
import com.mobile.web.quiz.model.Post;
import com.mobile.web.quiz.model.admin.Notice;
import com.mobile.web.quiz.utils.UploadDirectories;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
public class MainController extends BaseController {

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

        model.addAttribute("popularGroups", groupService.getPopularGroups());

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
    public String latestlist(Model model) {
        return "latestlist";
    }

    @GetMapping({"/profile"})
    public String user(Model model, HttpSession session) {
        if (isLoggedIn()) {
            model.addAttribute("bottomBar", getBottomBarItems(3));
            return "user";
        } else {
            model.addAttribute("redirectCtrl", "profile");
            return "login";
        }
    }

    @GetMapping({"/circle/{id}"})
    public String viewGroup(Model model, @PathVariable("id") Long id) {
        if (isLoggedIn()) {
            model.addAttribute("group", groupService.getGroupById(id));
            model.addAttribute("post", postService.getApprovedPosts(id));
            model.addAttribute("isJoined", groupService.checkExistUser(id, getLoggedUser()));
            return "circle";
        } else {
            model.addAttribute("redirectCtrl", "circle/" + id);
            return "login";
        }
    }

    @PostMapping({"/join-group"})
//    @ResponseBody
//    public HashMap<String, Object> joinGroup(@RequestParam Map<String, String> params) {
//        HashMap<String, Object> response = new HashMap<>();
//
//        String groupId = params.get("id");
//
//        boolean status = groupService.joinGroup(Long.parseLong(groupId), getLoggedUser());
//
//        response.put("status", status);
//        return response;
//    }
    public String joinGroup(Model model, @RequestParam Map<String, String> params) {

        long groupId = Long.parseLong(params.get("id"));
        boolean status = groupService.joinGroup(groupId, getLoggedUser());

        model.addAttribute("group", groupService.getGroupById(groupId));
        model.addAttribute("isJoined", groupService.checkExistUser(groupId, getLoggedUser()));
        model.addAttribute("status", status);
        return "circle";
    }

    @GetMapping({"/join-groups"})
    public String listJoinGroups(Model model) {
        if (isLoggedIn()) {

            return "join_groups";
        } else {
            model.addAttribute("redirectCtrl", "join-groups");
            return "login";
        }
    }

    @GetMapping({"/releasepost"})
    public String releasepost(Model model, @RequestParam(value = "group_id") long groupId) {
        model.addAttribute("group_id", groupId);
        return "releasepost";
    }

    @PostMapping({"/add-post"})
    @ResponseBody
    public HashMap<String, Object> addPost(@RequestParam long groupId, @RequestParam String message, @RequestParam(value="images[]") String[] images) {
        HashMap<String, Object> response = new HashMap<>();

        boolean status = false;

        try {

            String imageUrls = "";
            for (String image : images) {
                String imageUrl = saveUploadedFile(UploadDirectories.POST, image);
                imageUrls += "@" + imageUrl;
            }

            Post newPost = new Post();
            newPost.setMessage(message);
            newPost.setImageUrls(imageUrls.isEmpty() ? "" : imageUrls.substring(1));
            newPost.setUser(userService.getUserById(getLoggedUser().getId()));
            newPost.setGroup(groupService.getGroupById(groupId));
            newPost.setStatus(Post.PENDING);

            postService.add(newPost);

            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.put("status", status);
        return response;
    }

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
    public String mall(Model model) {
        model.addAttribute("products", productService.getAvailableProducts());
        return "mall";
    }

    @GetMapping({"/product-detail/{id}"})
    public String productDetail(Model model, @PathVariable("id") Long id) {
        model.addAttribute("product", productService.getProductById(id));
        return "product_detail";
    }

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

    private String saveUploadedFile(String dest, String fileData) {
        String uploadedUrl = "";

        try {
            String extension = fileData.substring("data:image/".length(), fileData.indexOf(";base64,"));
            String data = fileData.substring(fileData.indexOf(";base64,") + ";base64,".length());

            byte[] bytes = Base64.getDecoder().decode(data);

            String fileName = UUID.randomUUID().toString() + "." + extension;
            Path savedPath = Paths.get(Config.UPLOAD_DIR.getAbsolutePath(), dest, fileName);
            Files.write(savedPath, bytes);

            uploadedUrl = Paths.get(Config.UPLOAD_PATH, dest, fileName).toString();
        } catch (IOException ex) {
            ex.printStackTrace();
            uploadedUrl = null;
        }

        return uploadedUrl;
    }
}

