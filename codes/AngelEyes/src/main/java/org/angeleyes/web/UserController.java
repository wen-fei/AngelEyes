package org.angeleyes.web;

import org.angeleyes.entity.User;
import org.angeleyes.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

@Controller
@RequestMapping("/")
public class UserController {

    @Autowired
    private UserService userService;


    /**
     * 用户信息页
     * @param user_info_id
     * @param model
     * @return
     */
    @RequestMapping("app/user/user_info{user_info_id}/info")
    public String user_info(@PathVariable long user_info_id,  Model model){
        //根据用户查找用户信息
        User userInfo = userService.getUserInfoById(user_info_id);
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        userInfo.setUser_registerTime_date(dateFormat.format(userInfo.getUser_registerTime()));
        model.addAttribute("user_info_detail",userInfo);
        return "/app/user/user_info";
    }

    /**
     * 前台设置用户信息
     * @param user_info_id
     * @param model
     * @return
     */
    @RequestMapping("app/user/user_info{user_info_id}/setting")
    public String user_info_setting(@PathVariable long user_info_id, Model model, HttpSession session){
        //根据用户查找用户信息
        if(session.getAttribute("UserInfo_session") != null) {
            User userInfo = userService.getUserInfoById(user_info_id);
            model.addAttribute("user_info_detail", userInfo);
            return "/app/user/user_info_edit";
        }else{
            session.setAttribute("edit_userInfo_error","noRight");
            return "redirect: /app/user/user_info"+ user_info_id +"/info";
        }
    }
}
