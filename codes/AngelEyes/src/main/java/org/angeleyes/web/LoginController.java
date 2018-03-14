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
        String user_email = request.getParameter("email");
        String user_password = request.getParameter("password");
        // 两次密码不一致放在前台用模态框来验证
        User user = userService.user_login(user_email, user_password);
        if(user == null){
            model.addAttribute("registResult","用户名或密码错误");
            return "/error/regist_result";
        }else{
            session.setAttribute("UserInfo_session",user);
            String back_url = session.getAttribute("back_url_session").toString();
            System.out.println("login ------------> back_url is :" + back_url);
            return "redirect: " + back_url ;
        }

    }

    //用户注册
    @RequestMapping("/regist")
    public String regist(Model model, HttpServletRequest request) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        String user_name = request.getParameter("user_name_regist");
        String password = request.getParameter("user_password");
        String user_email = request.getParameter("user_email");
        int result = userService.user_regist(user_email, password, user_name);
        if (result > 0){
            model.addAttribute("registResult", "注册成功，马上返回登陆界面");
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
    @RequestMapping(value = "/{user_email_regist}/checkUserEmail",
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
    public String loginView(Model model, HttpServletRequest request){
        return "/app/user/login";
    }

    /**
     * 接收前台传过来的用于返回的url
     * @return
     */
    @RequestMapping(value="/back_url_session")
    @ResponseBody
    public String get_back_url(HttpServletRequest request, HttpSession session, @RequestBody String result){
        String back_url = request.getParameter("back_url");
//        System.out.println("back_url_session ------------> back_url is :" + back_url);
        if(back_url != null){
            session.setAttribute("back_url_session", back_url);
        }
        return "1";
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

    //用户退出登录
    @RequestMapping(value="/logout",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String logout(Model model, HttpSession session){
        session.removeAttribute("UserInfo_session");
        return "1";
    }
}
