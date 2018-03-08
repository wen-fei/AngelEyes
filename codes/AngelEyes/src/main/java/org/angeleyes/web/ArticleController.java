package org.angeleyes.web;

import org.angeleyes.entity.Article;
import org.angeleyes.service.ArticleService;
import org.angeleyes.service.CommonService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("/")
public class ArticleController {

    //日志对象
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ArticleService articleService;

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
        int article_type = Integer.valueOf(request.getParameter("article_type"));
        int insertResult = articleService.insertOneArticle(article_title,article_content,article_author_id,module_id, article_type);
        if (insertResult > 0)
            result = "1";
        else
            result = "0";
        return result;
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
        if (typeId != 3){
            // 不是转发操作
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



}
