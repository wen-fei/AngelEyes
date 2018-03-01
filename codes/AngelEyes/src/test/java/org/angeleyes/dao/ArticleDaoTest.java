package org.angeleyes.dao;
import java.sql.Timestamp;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class ArticleDaoTest {
    @Autowired
    private ArticleDao dao;

    @Test
    public void addArticle () throws Exception{
        String article_title = "test";
        Long article_authorID = 10004l;
        String article_content = "test";
        int article_module_id = 4;
        System.out.println(dao.addArticle(article_title,article_authorID,article_content,article_module_id));
    }

    @Test
    public void getArticleById() throws Exception{
        Long article_id = 8l;
        System.out.println(dao.getArticleById(article_id));
    }

    @Test
    public void getArticleByAuthorID() {
        Long authorID = 10004l;
        System.out.println(dao.getArticleByAuthorID(authorID).toString());
    }
    @Test
    public void getArticleCount() {
        System.out.println(dao.getArticleCount());
    }

    @Test
    public void getAllGood() {
        System.out.println(dao.getAllGood());
    }

    @Test
    public void getAllHot() {
        System.out.println(dao.getAllHot());
    }

    @Test
    public void getAllTop() {
        System.out.println(dao.getAllTop());
    }

    @Test
    public void setArticleGood() {
        Long article_id = 13l;
        System.out.println(dao.setArticleGood(article_id));
    }

    @Test
    public void setArticleHot() {
        Long article_id = 13l;
        System.out.println(dao.setArticleHot(article_id));
    }

    @Test
    public void setArticleTop() {
        Long article_id = 13l;
        System.out.println(dao.setArticleTop(article_id));
    }

    @Test
    public void cancelArticleGood() {
        Long article_id = 13l;
        System.out.println(dao.cancelArticleGood(article_id));
    }

    @Test
    public void cancelArticleHot() {
        Long article_id = 13l;
        System.out.println(dao.cancelArticleHot(article_id));
    }

    @Test
    public void canceArticleTop() {
        Long article_id = 13l;
        System.out.println(dao.cancelArticleTop(article_id));
    }
}