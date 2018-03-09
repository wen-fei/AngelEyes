package org.angeleyes.web;

import org.angeleyes.entity.LostPerson;
import org.angeleyes.service.LostPersonService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/app/loster")
public class LostPersonController {
    //日志对象
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private LostPersonService lostPersonService;

    /**
     * 前台用户登陆
     * @param model
     * @return
     */
    @RequestMapping(value = "/person_id/{lost_person_id}")
    public String loster_detail(@PathVariable Long lost_person_id, Model model, HttpServletRequest request){
        LostPerson lostPerson = lostPersonService.queryById(lost_person_id);
        if(lostPerson != null){
            model.addAttribute("loster_info", lostPerson);
            return "/app/loster/lost_person_info_detail";
        }else {
            model.addAttribute("loster_info_lost", "走失用户信息已被删除或撤回");
            return "/app/loster/loster_info_lost";
        }

    }


}
