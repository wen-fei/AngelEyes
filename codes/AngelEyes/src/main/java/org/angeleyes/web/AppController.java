package org.angeleyes.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/app")
public class AppController {
    //日志对象
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    /**
     * 主页主模块列表
     * @param model
     * @return
     */
    @RequestMapping("/index")
    public String index(Model model){
        return "app/index";
    }


}
