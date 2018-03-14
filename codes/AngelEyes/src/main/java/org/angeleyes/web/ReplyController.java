package org.angeleyes.web;

import org.angeleyes.entity.Article;
import org.angeleyes.entity.Reply;
import org.angeleyes.service.*;
import org.angeleyes.entity.Article;
import org.angeleyes.entity.Reply;
import org.angeleyes.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequestMapping("/")
public class ReplyController {

    //日志对象
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ArticleService articleService;

    @Autowired
    private ReplyService replyService;

    @Autowired
    private UserService userService;

    @Autowired
    private ModuleService moduleService;

    @Autowired
    private CommonService commonService;

    /**
     * 前台发表一篇回复
     * @param result
     * @param request
     * @return
     */
    @RequestMapping(value = "app/article/newreply",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public  String newreply(@RequestBody String result, HttpServletRequest request){
        String reply_content = request.getParameter("reply_content");
        long reply_author_id = Long.valueOf(request.getParameter("reply_author_id"));
        long article_id = Long.valueOf(request.getParameter("article_id"));
        int insertResult = replyService.insertOneReply(article_id,reply_content,reply_author_id);
        if (insertResult > 0)
            result = "1";
        else
            result = "0";
        return result;
    }

}
