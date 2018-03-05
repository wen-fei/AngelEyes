package org.angeleyes.service.impl;

import org.angeleyes.dao.ReplyDao;
import org.angeleyes.entity.Reply;
import org.angeleyes.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Created by user on 2017/5/2.
 */
@Service
@Transactional
public class ReplyServiceImpl implements ReplyService{

    @Autowired
    private ReplyDao replyDao;

    public List<Reply> getReplyList() {
        return replyDao.getReplyList();
    }

    public List<Reply> getReplyListByArticleId(Long articleId) {
        return replyDao.getReplyListByArticleId(articleId);
    }

    public List<Reply> getReplyListByUserId(Long userID) {
        return replyDao.getReplyListByUserId(userID);
    }

    public List<Reply> getReplyListByTime(Long startTime, Long endTime) {
        return replyDao.getReplyListByTime(startTime,endTime);
    }

    public List<Reply> getReplyListByModuleId(int moduleId) {
        return replyDao.getReplyListByModuleId(moduleId);
    }

    public List<Reply> getReplyListByForumId(int forumId) {
        return replyDao.getrReplyListByForumId(forumId);
    }

    public Reply getReplyByReplyId(Long replyId) {
        return replyDao.getReplyById(replyId);
    }

    public Reply getReplyByReplyContent(String contentKey) {
        return replyDao.getReplyByReplyContent(contentKey);
    }

    public int insertOneReply(Long articleId,String content, Long userId) {
        Long createTime = (new Date()).getTime();
        return replyDao.insertOneReply(articleId,createTime,content,userId);
    }

    public int deleteOneReply(Long replyId) {
        return replyDao.deleteOneReply(replyId);
    }

    public int deleteAllReplyByArticleId(Long articleId) {
        return replyDao.deleteAllReplyByArticleId(articleId);
    }

    public int deleteAllReplyByUserId(Long userId) {
        return replyDao.deleteAllReplyByUserId(userId);
    }

    public int deleteOneReplyBySelf(Long userId, Long replyId) {
        return replyDao.deleteOneReplyBySelf(userId,replyId);
    }
}
