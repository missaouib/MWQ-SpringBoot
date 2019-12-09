package com.mobile.web.quiz.controller;

import com.mobile.web.quiz.model.User;
import com.mobile.web.quiz.model.UserLoginHistory;
import com.mobile.web.quiz.model.VerifySMS;
import com.mobile.web.quiz.service.UserService;
import com.mobile.web.quiz.service.VerifySMSService;
import com.mobile.web.quiz.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@Controller
public class AuthController extends BaseController {

    // Register
    @PostMapping(path = {"/register/send-sms"}, produces = "application/json; charset=UTF-8")
    @ResponseBody
    public HashMap<String, Object> registerSendSMS(Model model, @RequestParam(required = true) String phoneNumber) {

        boolean status = false;
        String message = "";

        if (verifySMSService.canRegisterPhoneNumber(phoneNumber)) {
            HashMap<String, String> messages = new HashMap<>();
            messages.put("0", "短信发送成功");
            messages.put("-1", "参数不全");
            messages.put("-2", "服务器空间不支持,请确认支持curl或者fsocket，联系您的空间商解决或者更换空间！");
            messages.put("30", "密码错误");
            messages.put("40", "账号不存在");
            messages.put("41", "余额不足");
            messages.put("42", "帐户已过期");
            messages.put("43", "IP地址限制");
            messages.put("50", "内容含有敏感词");
            messages.put("51", "手机号码不准确");

            String SMSApiUrl = "http://api.smsbao.com/";
            String apiUser = "qiyunit"; //短信平台帐号
            String apiPass = CommonUtils.getMD5Hex("qiyun123"); //短信平台密码
            String code = CommonUtils.getRandomDigitString(6);

            String content = "您的验证码是`" +  code + "`,５分钟内有效。为了您的账户安全，请不要把验证码泄露给他人。";

            try {
                String sendUrl = SMSApiUrl + "sms?u=" + apiUser + "&p=" + apiPass + "&m=" + phoneNumber + "&c=" + URLEncoder.encode(content, "UTF-8");
                String result = CommonUtils.getURLContent(sendUrl);

                if (result == null) {
                    message = "Wrong sms api";
                } else if (result.equals("0")) {
                    status = true;

                    VerifySMS newEntity = new VerifySMS();
                    newEntity.setPhoneNumber(phoneNumber);
                    newEntity.setCode(code);
                    newEntity.setExpired(false);
                    verifySMSService.add(newEntity);

                } else {
                    message = messages.get(result);
                }
            } catch (Exception ex) {
                message = ex.getMessage();
            }
        } else {
            message = "phone exist";
        }

        HashMap<String, Object> response = new HashMap<>();
        response.put("status", status);
        response.put("message", message);

        return response;
    }

    @RequestMapping({"/register"})
    public String performRegister(Model model, @RequestParam Map<String, String> params) {
        if (params.size() == 0) {
            return "register";
        } else {
            String phoneNumber = params.get("phone");
            String username = params.get("username");
            String password = params.get("password");
            String passcode = params.get("passcode");

            boolean status = false;
            String message = "";

            if (userService.existPhoneNumber(phoneNumber)) {
                message = "phone exist";
            } else {
                VerifySMSService.ResultVerifySMS result = verifySMSService.checkSMSCode(phoneNumber, passcode);

                if (result == VerifySMSService.ResultVerifySMS.Expired) {
                    message = "sms expired";
                } else if (result == VerifySMSService.ResultVerifySMS.NotExist) {
                    message = "sms not exist";
                }
            }

            if (message.isEmpty()) {
                User newUser = new User();
                newUser.setName(username);
                newUser.setPhoneNumber(phoneNumber);
                newUser.setPassword(CommonUtils.getMD5Hex(password));
                newUser.setStatus(1);

                userService.add(newUser);

                System.out.println(newUser);

                status = true;

                return "redirect:/login";
            }

            model.addAttribute("username", username);
            model.addAttribute("phone", phoneNumber);
            model.addAttribute("password", password);
            model.addAttribute("passcode", passcode);

            model.addAttribute("message", message);

            return "register";
        }
    }

    // Login
    @RequestMapping({"/login"})
    public String performLogIn(Model model, @RequestParam Map<String, String> params) {
        if (params.size() == 0) {
            return "login";
        } else {
            String phoneNumber = params.get("phone");
            String password = params.get("password");

            boolean status = false;
            String message = "";

            if (!userService.existPhoneNumber(phoneNumber)) {
                message = "not exist";
            } else {
                User user = userService.validUser(phoneNumber, password);
                if (user != null) {
                    if (user.getStatus() == 0)
                        message = "inactive";
                    else
                    {
                        status = true;
                        setLoggedUser(user);

                        UserLoginHistory loginHistory = new UserLoginHistory();
                        loginHistory.setPhoneNumber(user.getPhoneNumber());
                        loginHistory.setUsername(user.getName());
                        loginHistory.setIpAddress(request.getRemoteAddr());
                        loginHistory.setActivity(0);
                        userLoginHistoryService.add(loginHistory);
                    }
                } else {
                    message = "wrong password";
                }
            }

            if (status) {
                return "redirect:";
            } else {
                model.addAttribute("phone", phoneNumber);
                model.addAttribute("password", password);

                model.addAttribute("message", message);

                return "login";
            }
        }
    }
}
