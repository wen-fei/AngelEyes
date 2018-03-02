package org.angeleyes.service.impl;

import org.angeleyes.entity.Article;
import org.angeleyes.service.ArticleService;

import java.sql.Timestamp;
import java.util.List;

public class ArticleServiceImpl implements ArticleService{
    public int addArticle(String article_title, Long article_authorID, String article_content, int article_module_id) {
        return 0;
    }

    public Article getArticleById(Long article_id) {
        return null;
    }

    public List<Article> getArticleByAuthorID(Long authorID) {
        return null;
    }

    public List<Article> getAllArticle() {
        return null;
    }

    public List<Article> getArticleByTime(Timestamp startTime, Timestamp endTime) {
        return null;
    }

    public int getArticleCount() {
        return 0;
    }

    public List<Article> getAllGood() {
        return null;
    }

    public List<Article> getAllHot() {
        return null;
    }

    public List<Article> getAllTop() {
        return null;
    }

    public int setArticleGood(Long article_id) {
        return 0;
    }

    public int setArticleHot(Long article_id) {
        return 0;
    }

    public int setArticleTop(Long article_id) {
        return 0;
    }

    public int cancelArticleGood(Long article_id) {
        return 0;
    }

    public int cancelArticleHot(Long article_id) {
        return 0;
    }

    public int cancelArticleTop(Long article_id) {
        return 0;
    }

    public int addArticleCollect(Long article_id) {
        return 0;
    }

    public int addArticleGood(Long article_id) {
        return 0;
    }

    public int addArticleNotgood(Long article_id) {
        return 0;
    }

    public int addArticleShare(Long article_id) {
        return 0;
    }

    public int addArticleComment(Long article_id) {
        return 0;
    }

    public int addArticleread(Long article_id) {
        return 0;
    }
}
