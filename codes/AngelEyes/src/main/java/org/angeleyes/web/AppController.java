package org.angeleyes.web;

import org.angeleyes.entity.*;
import org.angeleyes.service.ArticleService;
import org.angeleyes.service.LostPersonService;
import org.angeleyes.service.ModuleService;
import org.angeleyes.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/app")
public class AppController {
    //日志对象
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ArticleService articleService;

    @Autowired
    private ModuleService moduleService;

    @Autowired
    private UserService userService;

    @Autowired
    private LostPersonService lostPersonService;
    /**
     * 主页主模块列表
     * 显示走失儿童信息瀑布模式
     * @param model
     * @return
     */
    @RequestMapping("/index")
    public String index(Model model){
        List<LostPerson> lost_person_info = lostPersonService.queryInfo50Recent();
        model.addAttribute("lost_person_info", lost_person_info);
        return "app/index";
    }

    /**
     * 某个模块下的所有主题列表
     * @param moduleId
     * @param model
     * @return
     */
    @RequestMapping(value = "/module{moduleId}/list")
    public String list(@PathVariable("moduleId") int moduleId, Model model, HttpSession session){

        //得到模块信息
        Module module = moduleService.getModuleInfoById(moduleId);
        model.addAttribute("moduleInfo",module);

        //得到此模块下主题列表

        //置顶主题
        List<Article> articleList_top = articleService.getArticlesTop(moduleId);
        articleList_top = articleService.setArticleFromIdToName(articleList_top);
        model.addAttribute("articleList_top",articleList_top);

        //火热主题
        List<Article> articleList_hot = articleService.getArticlesHot(moduleId);
        model.addAttribute("articleList_hot",articleList_hot);

        //加精主题
        List<Article> articleList_good = articleService.getArticlesGood(moduleId);
        model.addAttribute("articleList_good",articleList_good);

        //除了置顶主题以外的主题
        List<Article> articleList_common = articleService.getArticlesCommon(moduleId);
        articleList_common = articleService.setArticleFromIdToName(articleList_common);
        model.addAttribute("articleList",articleList_common);

        return "/app/article/article_list";
    }


}
