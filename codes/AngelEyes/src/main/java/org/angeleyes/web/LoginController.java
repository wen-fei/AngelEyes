package org.angeleyes.web;

import org.angeleyes.entity.User;
import org.angeleyes.service.UserService;
import org.angeleyes.utils.CodeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;


@Controller
@RequestMapping("/app/login")
@SessionAttributes("UserSession")
public class LoginController {

    //日志对象
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserService userService;

    /**
     * 前台用户登陆
     * @param model
     * @return
     */
    @RequestMapping("/login")
    public String login(Model model, HttpServletRequest request, HttpSession session){
        String user_email = request.getParameter("user_email");
        String user_password = request.getParameter("user_password");
//        System.out.println("user_name is:" + user_email);
//        System.out.println("user_password is:" + user_password);

        // 两次密码不一致放在前台用模态框来验证
        User user = userService.user_login(user_email, CodeUtils.EncodeByMd5(user_password));
        if(user == null){
            model.addAttribute("result","用户名或密码错误");
            return "/error/regist_result";
        }else{

            session.setAttribute("UserInfo_session",user);
            return "redirect: /app/index";
        }

    }

    //用户注册
    @RequestMapping("/regist")
    public String regist(Model model, HttpServletRequest request) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        String user_name = request.getParameter("user_name");
        String password = request.getParameter("user_password");
        String user_email = request.getParameter("user_email");
        int result = userService.user_regist(user_email, CodeUtils.EncodeByMd5(password),
                user_name);
        if (result > 0){
            model.addAttribute("registResult", "注册成功，马上返回首页");
            return "/error/regist_result";
        }
        else{
            model.addAttribute("registResult", "注册失败，请重新注册");
            return "/error/regist_result";
        }

    }

    /**
     * ajax检查用户名是否使用
     *
     * @param user_email_regist
     * @return
     */
    @RequestMapping(value = "/{user_email_regist}/checkUsername",
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String checkUsername(@PathVariable String user_email_regist,
                                @RequestBody String result) {
        User userInfo = userService.check_email(user_email_regist);
        if (userInfo == null) {
            result = "1";
        } else {
            result = "0";
        }
        return result;
    }

    /**
     * 用户登陆界面
     * @param model
     * @return
     */
    @RequestMapping(value="/loginview")
    public String loginView(Model model){
        return "/app/user/login";
    }

    /**
     * 用户注册界面
     * @param model
     * @return
     */
    @RequestMapping(value="/registview")
    public String registView(Model model){
        return "/app/user/regist";
    }
}
