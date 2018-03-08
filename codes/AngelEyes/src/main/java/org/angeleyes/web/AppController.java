package org.angeleyes.web;

import org.angeleyes.entity.Article;
import org.angeleyes.entity.Counts;
import org.angeleyes.entity.Module;
import org.angeleyes.service.ArticleService;
import org.angeleyes.service.ModuleService;
import org.angeleyes.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
    /**
     * 主页主模块列表
     * @param model
     * @return
     */
    @RequestMapping("/index")
    public String index(Model model){
        return "app/index";
    }

    /**
     * 某个模块下的所有主题列表
     * @param moduleId
     * @param model
     * @return
     */
    @RequestMapping(value = "/module{moduleId}/list")
    public String list(@PathVariable("moduleId") int moduleId, Model model){

        //得到模块信息
        Module module = moduleService.getModuleInfoById(moduleId);
        model.addAttribute("moduleInfo",module);

        Counts counts_module_info = moduleService.getCountsInfo(2, moduleId);
        model.addAttribute("moduleCounts",counts_module_info);
        //得到此模块下主题列表

        //置顶主题
        List<Article> articleList_top = moduleService.getArticlesTop(moduleId);
        articleList_top = articleService.setArticleFromIdToName(articleList_top);
        model.addAttribute("articleList_top",articleList_top);

        //火热主题
        List<Article> articleList_hot = moduleService.getArticlesHot(moduleId);
        model.addAttribute("articleList_hot",articleList_hot);

        //加精主题
        List<Article> articleList_jing = moduleService.getArticlesJing(moduleId);
        model.addAttribute("articleList_jing",articleList_jing);

        //除了置顶主题以外的主题
        List<Article> articleList_common = moduleService.getArticlesCommon(moduleId);
        articleList_common = articleService.setArticleFromIdToName(articleList_common);
        model.addAttribute("articleList",articleList_common);

        return "app/article/article_list";
    }

}
