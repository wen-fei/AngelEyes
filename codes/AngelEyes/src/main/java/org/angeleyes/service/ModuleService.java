package org.angeleyes.service;

import org.angeleyes.entity.Article;
import org.angeleyes.entity.Counts;
import org.angeleyes.entity.Module;

import java.util.List;

/**
 * Created by user on 2017/4/23.
 */
public interface ModuleService {

    /**
     * 查询所有模块列表
     * @return
     */
    List<Module> getModuleAll();

    /**
     * 根据模块id删除模块
     * @param moduleId
     * @return
     */
    int deleteModule(int moduleId);


    /**
     * 根据模块ID得到属于本模块下的文章列表
     * @param ModuleId
     * @return
     */
    List<Article> getArticleListByModuleID(int ModuleId);



    /**
     * 获取所有模块信息
     * @return
     */
    List<Module> getModuleInfo();

    /**
     * 获取统计信息，无参默认查询所有统计信息
     * @return
     */

//    Counts getCountsInfo();
    /**
     * 获取统计信息
     * @param typeId   值为1 按版块id查，值为2按模块id查
     * @param ID  板块id或模块id
     * @return
     */
//    Counts getCountsInfo(int typeId, int ID);


    /**
     * 通过模块id得到模块信息
     * @param moduleId
     * @return
     */
    Module getModuleInfoById(int moduleId);


    /**
     * 查询某模块下火贴
     * @param moduelId
     * @return
     */
    List<Article> getArticlesHot(int moduelId);

    /**
     * 查询某模块下置顶帖子
     * @param moduleId
     * @return
     */
    List<Article> getArticlesTop(int moduleId);

    /**
     * 查询普通帖子
     * @param moduleId
     * @return
     */
    List<Article> getArticlesCommon(int moduleId);

    /**
     * 查询普通帖子
     * @param moduleId
     * @return
     */
    List<Article> getArticlesGood(int moduleId);



}
