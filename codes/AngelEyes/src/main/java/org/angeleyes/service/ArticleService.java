package org.angeleyes.service;

import org.angeleyes.entity.Article;

import java.sql.Timestamp;
import java.util.List;

public interface ArticleService {
    /**
     * 创建新的article
     * @param article_title
     * @param article_authorID
     * @param article_content
     * @param article_module_id
     * @return
     */
    int addArticle(String article_title, Long article_authorID,
                   String article_content, int article_module_id);
    /**
     * 通过id获取article
     * @param article_id
     * @return
     */
    Article getArticleById(Long article_id);

    /**
     * 获取用户发布的所有article
     * @param authorID
     * @return
     */
    List<Article> getArticleByAuthorID(Long authorID);

    /**
     * 获取所有的Article
     * @return
     */
    List<Article> getAllArticle();

    /**
     * 通过获取某一时间段的artile
     * @param startTime
     * @param endTime
     * @return
     */
    List<Article> getArticleByTime(Timestamp startTime, Timestamp endTime);

    /**
     * 获取article数量
     * @return
     */
    int getArticleCount();

    /**
     * 获取所有good的article
     * @return
     */
    List<Article> getAllGood();

    /**
     * 获取所有hot的article
     * @return
     */
    List<Article> getAllHot();

    /**
     * 获取所有Top的article
     * @return
     */
    List<Article> getAllTop();

    /**
     * 设置article的good，hot，top
     * @param article_id
     * @return
     */
    int setArticleGood(Long article_id);

    int setArticleHot(Long article_id);

    int setArticleTop(Long article_id);

    /**
     * 取消article的good， hot， top
     * @param article_id
     * @return
     */
    int cancelArticleGood(Long article_id);

    int cancelArticleHot(Long article_id);

    int cancelArticleTop(Long article_id);

    /**
     * +1 article的count of collect，good，notgood，share, readNumber, commentNumber
     */
    int addArticleCollect(Long article_id);

    int addArticleGood(Long article_id);

    int addArticleNotgood(Long article_id);

    int addArticleShare(Long article_id);

    int addArticleComment(Long article_id);

    int addArticleread(Long article_id);
}
