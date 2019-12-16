package com.mobile.web.quiz.controller;

import com.mobile.web.quiz.model.admin.Notice;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

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
    public String latestlist(Model model) { return "latestlist"; }

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
    public String releasepost(Model model) { return "releasepost"; }

    @PostMapping({"/add-post"})
    @ResponseBody
    public HashMap<String, Object> addPost(@RequestParam Map<String, String> params, @RequestParam Map<String, String[]> images) {
        HashMap<String, Object> response = new HashMap<>();

        boolean status = false;
        /*if (params.size() != 0 || files.size() !=0) {
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
        */

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

}

