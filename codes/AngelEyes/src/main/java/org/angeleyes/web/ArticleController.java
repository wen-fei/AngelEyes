package org.angeleyes.web;

import org.angeleyes.entity.Article;
import org.angeleyes.entity.Module;
import org.angeleyes.entity.Reply;
import org.angeleyes.entity.User;
import org.angeleyes.service.ArticleService;
import org.angeleyes.service.CommonService;
import org.angeleyes.service.ModuleService;
import org.angeleyes.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/")
public class ArticleController {

    //日志对象
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ArticleService articleService;

    @Autowired
    private UserService userService;

    @Autowired
    private ModuleService moduleService;

    @Autowired
    private CommonService commonService;

    /**
     * 通过PrintWriter将响应数据写入response，ajax可以接受到这个数据
     *
     * @param response
     * @param data
     */
    private void renderData(HttpServletResponse response, String data) {
        PrintWriter printWriter = null;
        try {
            printWriter = response.getWriter();
            printWriter.print(data);
        } catch (IOException ex) {
            logger.info(ArticleController.class.getName(), ex);
        } finally {
            if (null != printWriter) {
                printWriter.flush();
                printWriter.close();
            }
        }
    }

    /**
     * 前台发表一篇主题
     * @param result
     * @param request
     * @return
     */
    @RequestMapping(value = "app/article/newarticle",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public  String newarticle(@RequestBody String result, HttpServletRequest request){
        String article_title = request.getParameter("article_title_new");
        String article_content = request.getParameter("article_content");
        long article_author_id = Long.valueOf(request.getParameter("article_author_id"));
        int module_id = Integer.valueOf(request.getParameter("module_id"));
//        int article_type = Integer.valueOf(request.getParameter("article_type"));
        int article_type = module_id;
        int insertResult = articleService.insertOneArticle(article_title,article_content,article_author_id,module_id, article_type);
        if (insertResult > 0)
            result = "1";
        else
            result = "0";
        return result;
    }


    /**
     * 访问一篇主题
     * @param articleId
     * @param model
     * @return
     */
    @RequestMapping(value = "app/article{articleId}/content")
    public String content(@PathVariable("articleId") Long articleId, Model model, HttpSession session){
        //得到主题信息
        Article article = articleService.getArticleById(articleId);
        //得到模块名称
        article.setArticle_module_name(moduleService.getModuleInfoById(article.getArticle_module_id()).getModule_name());
        //转换时间long->date
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        article.setArticle_create_time_date(dateFormat.format(article.getArticle_create_time()));
        model.addAttribute("articleInfo", article);

        //得到主题作者信息
        User articleAuthorInfo = userService.getUserInfoById(article.getArticle_authorID());
        Long user_reTime = articleAuthorInfo.getUser_registerTime();
        System.out.println(user_reTime);
        articleAuthorInfo.setUser_registerTime_date(dateFormat.format(user_reTime));
        model.addAttribute("articleAuthorInfo",articleAuthorInfo);

        //得到此主题下回复列表
        List<Reply> replyList = articleService.getReplyInfoByArticleId(articleId);
        //得到回复作者信息、设置时间、学校
        for (Reply reply : replyList) {
            reply.setUserInfo(userService.getUserInfoById(reply.getReply_author_id()));
            User replyUserInfo = reply.getUserInfo();
            replyUserInfo.setUser_registerTime_date(dateFormat.format(replyUserInfo.getUser_registerTime()));
            reply.setReply_time_date(dateFormat.format(reply.getReply_time()));
        }
        model.addAttribute("replyList",replyList);
        User getsession  =(User)session.getAttribute("UserInfo_session");
        /*日志记录，每访问一次主题就插入到数据库中*/
        if (session.getAttribute("UserInfo_session") == null){
            logger.info("用户尚未登录，只统计主题表里的点击次数");
            int resu = articleService.updateArticleClickCounts(articleId);
            if (resu > 0) {
                logger.info("日志记录插入成功" + "aid:" + articleId + "read");
            } else {
                logger.info("日志记录插入出错" + "aid:" + articleId + "read");
            }
        }
        else{
            int resu = articleService.updateArticleClickCounts(articleId);
            if (resu > 0) {
                logger.info("日志记录插入成功" + "aid:" + articleId + "read");
            } else {
                logger.info("日志记录插入出错" + "aid:" + articleId + "read");
            }

            long uid = getsession.getUser_id();
            int insert_result = userService.insertToUserRecord_click(uid, articleId);
            if (insert_result > 0) {
                logger.info("日志记录插入成功" + "uid:" + uid + "aid:" + articleId + "read");
            } else {
                logger.info("日志记录插入出错" + "uid:" + uid + "aid:" + articleId + "read");
            }
        }
        return "/app/article/article_reply";
    }

    /**
     * 前台文章点赞、收藏、转发等日志记录
     * @param typeId
     * @param result
     * @param request
     * @return
     */
    @RequestMapping(value = "app/article/type{typeId}/update",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public  String articleCollect(@PathVariable("typeId") Integer typeId, @RequestBody String result,
                                  HttpServletRequest request){
        logger.info("typeId:" + typeId);
        long uid = Long.valueOf(request.getParameter("user_info_id"));
        long aid = Long.valueOf(request.getParameter("article_id"));
        // 不是分享
        if (typeId != 2){
            // 判断是否已经点赞收藏踩
            Article articleIn = articleService.articleColletCheck(aid, uid, typeId);
            if (articleIn != null){
                result = ""+typeId;
            }else{
                int insertResult = articleService.articleCollet(aid, uid, typeId);
                if (insertResult > 0)
                    result = "9";
                else
                    result = "8";
            }
        }else{
            int insertResult = articleService.articleCollet(aid, uid, typeId);
            if (insertResult > 0)
                result = "9";
            else
                result = "8";
        }
        return result;
    }

    /**
     * 后台主题列表
     * @param model
     * @param article
     * @return
     */
    @RequestMapping(value="admin/article/list")
    public String list(Model model, Article article){
        int needId = article.getNeedId();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String startTimeFromWeb = article.getStartTime();
        String endTimeFromWeb   = article.getEndTime();
        String titleKey = article.getTitleKey();
        Date now = new Date();
        //获取列表页
        if(needId == 0 && startTimeFromWeb==null && endTimeFromWeb==null && titleKey==null){
            List<Article> articleList = articleService.getArticleList();
            model.addAttribute("articleList",articleList);
        }
        else{
            //如果搜索时间为空，则默认开始时间为最小时间，即1970年，最大时间为系统当前时间，即查询所有帖子
            if(startTimeFromWeb.equals("")){
                startTimeFromWeb = dateFormat.format(0);
            }
            if(endTimeFromWeb.equals("")){
                endTimeFromWeb = dateFormat.format(now.getTime());
            }
            try{
                Long startTime = dateFormat.parse(" "+ startTimeFromWeb +" 00:00:00.000 ").getTime();
                Long endTime = dateFormat.parse(" "+ endTimeFromWeb +" 00:00:00.000 ").getTime() ;
                List<Article> articleList = articleService.getArticleByNeeds(needId,startTime,endTime,titleKey);
                model.addAttribute("articleList",articleList);
            }
            catch (Exception e){
                e.printStackTrace();
            }
        }
        return "admin/article/article_list";

    }


    /**
     * 后台主题管理
     * @param model
     * @param article
     * @return
     */
    @RequestMapping(value="admin/article/control")
    public String control(Model model, Article article){
        Article article_detail = articleService.getArticleById(article.getArticle_id());
        article_detail = articleService.setArticleFromIdToName(article_detail);
        model.addAttribute("article_detail",article_detail);

        //List<ArticleType> articleTypeList = articleService.getArticleTypeList();
        //List<Module> moduleList = articleService.getAtricleModuleList(forumId);

        //model.addAttribute("articleTypeList",articleTypeList);
        //model.addAttribute("moduleList",moduleList);
        return "admin/article/article_control";
    }

}
