package org.angeleyes.web;

import org.angeleyes.entity.User;
import org.angeleyes.service.ArticleService;
import org.angeleyes.service.UserService;
import org.angeleyes.utils.CodeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by user on 2017/4/23.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    //日志对象
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ArticleService articleService;

    @Autowired
    private UserService userService;

    //admin.jsp
    @RequestMapping(value = "/admin")
    public String admin(Model model) {
        return "admin/admin";
    }

    //welcome.jsp
    @RequestMapping(value = "/welcome")
    public String welcome(Model model){
        return "admin/welcome";
    }


    /**
     * 后台管理员登录
     * @param model
     * @param session
     * @param userInfo_
     * @return
     */
    @RequestMapping(value="/login")
    public String login(Model model, HttpSession session, User userInfo_, HttpServletRequest request){
        Long user_id = Long.valueOf(request.getParameter("user_id"));
        String user_password = request.getParameter("adminpwd");
        User userInfo = userService.adminUserLogin(user_id, CodeUtils.EncodeByMd5(user_password));
        if(userInfo == null){
            model.addAttribute("result","用户名或密码错误");
            return "/error/adminLoginResult";
        }else{
            session.setAttribute("admin_user",userInfo);
            return "redirect: /admin/admin";
        }
    }

    /**
     * 登录界面
     * @param model
     * @return
     */
    @RequestMapping(value="/loginview")
    public String loginView(Model model){
        return "admin/login/login";

    }
}
