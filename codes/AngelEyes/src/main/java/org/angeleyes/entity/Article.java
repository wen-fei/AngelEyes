package org.angeleyes.entity;

import java.sql.Timestamp;

public class Article {
    private Long article_id;

    private  String article_title;

    private  Long article_authorID;

    private String article_content;

    private Timestamp article_create_time;

    private int article_module_id;

    private int article_comment_number;

    private Long article_read_number;

    private int article_is_good;

    private int article_is_hot;

    private int article_is_top;

    private Long article_last_reply_userID;

    private Timestamp article_last_reply_time;

    private int article_collect_counts;

    private int article_good_counts;

    private int article_notgood_counts;

    private int article_share_counts;

    public Long getArticle_id() {
        return article_id;
    }

    public void setArticle_id(Long article_id) {
        this.article_id = article_id;
    }

    public String getArticle_title() {
        return article_title;
    }

    public void setArticle_title(String article_title) {
        this.article_title = article_title;
    }

    public Long getArticle_authorID() {
        return article_authorID;
    }

    public void setArticle_authorID(Long article_authorID) {
        this.article_authorID = article_authorID;
    }

    public String getArticle_content() {
        return article_content;
    }

    public void setArticle_content(String article_content) {
        this.article_content = article_content;
    }

    public Timestamp getArticle_create_time() {
        return article_create_time;
    }

    public void setArticle_create_time(Timestamp article_create_time) {
        this.article_create_time = article_create_time;
    }

    public int getArticle_module_id() {
        return article_module_id;
    }

    public void setArticle_module_id(int article_module_id) {
        this.article_module_id = article_module_id;
    }

    public int getArticle_comment_number() {
        return article_comment_number;
    }

    public void setArticle_comment_number(int article_comment_number) {
        this.article_comment_number = article_comment_number;
    }

    public Long getArticle_read_number() {
        return article_read_number;
    }

    public void setArticle_read_number(Long article_read_number) {
        this.article_read_number = article_read_number;
    }

    public int getArticle_is_good() {
        return article_is_good;
    }

    public void setArticle_is_good(int article_is_good) {
        this.article_is_good = article_is_good;
    }

    public int getArticle_is_hot() {
        return article_is_hot;
    }

    public void setArticle_is_hot(int article_is_hot) {
        this.article_is_hot = article_is_hot;
    }

    public int getArticle_is_top() {
        return article_is_top;
    }

    public void setArticle_is_top(int article_is_top) {
        this.article_is_top = article_is_top;
    }

    public Long getArticle_last_reply_userID() {
        return article_last_reply_userID;
    }

    public void setArticle_last_reply_userID(Long article_last_reply_userID) {
        this.article_last_reply_userID = article_last_reply_userID;
    }

    public Timestamp getArticle_last_reply_time() {
        return article_last_reply_time;
    }

    public void setArticle_last_reply_time(Timestamp article_last_reply_time) {
        this.article_last_reply_time = article_last_reply_time;
    }

    public int getArticle_collect_counts() {
        return article_collect_counts;
    }

    public void setArticle_collect_counts(int article_collect_counts) {
        this.article_collect_counts = article_collect_counts;
    }

    public int getArticle_good_counts() {
        return article_good_counts;
    }

    public void setArticle_good_counts(int article_good_counts) {
        this.article_good_counts = article_good_counts;
    }

    public int getArticle_notgood_counts() {
        return article_notgood_counts;
    }

    public void setArticle_notgood_counts(int article_notgood_counts) {
        this.article_notgood_counts = article_notgood_counts;
    }

    public int getArticle_share_counts() {
        return article_share_counts;
    }

    public void setArticle_share_counts(int article_share_counts) {
        this.article_share_counts = article_share_counts;
    }

}
