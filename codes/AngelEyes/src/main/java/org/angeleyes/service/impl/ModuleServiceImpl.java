package org.angeleyes.service.impl;

import org.angeleyes.dao.ArticleDao;
import org.angeleyes.dao.ModuleDao;
import org.angeleyes.entity.Article;
import org.angeleyes.entity.Counts;
import org.angeleyes.entity.Module;
import org.angeleyes.service.ModuleService;
import org.angeleyes.service.UserService;
import org.angeleyes.utils.DateUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class ModuleServiceImpl implements ModuleService {

    private ModuleService moduleService;

    private UserService userService;

    @Resource
    private ModuleDao moduleDao;

    @Resource
    private ArticleDao articleDao;


    public List<Module> getModuleAll() {
        return moduleDao.getModuleAll();
    }


    public int deleteModule(int moduleId) {
        return moduleDao.deleteModuleById(moduleId);
    }


    public int getModuleCounts(int forumId) {
        return moduleDao.getModuleCounts(forumId);
    }


    public List<Article> getArticleListByModuleID(int ModuleId) {
        return moduleDao.getArticleListByModuleID(ModuleId);
    }


    public List<Module> getModuleInfo() {
        return moduleDao.getModuleInfo();
    }



    public Module getModuleInfoById(int moduleId) {
        return moduleDao.queryModuleById(moduleId);
    }


    public List<Article> getArticlesHot(int moduelId) {
        return moduleDao.getArticlesHot(moduelId);
    }




    public List<Article> getArticlesTop(int moduleId) {
        return moduleDao.getArticlesTop(moduleId);
    }


    public List<Article> getArticlesCommon(int moduleId) {
        return moduleDao.getArticlesCommon(moduleId);
    }

    public List<Article> getArticlesGood(int moduleId) {
        return articleDao.getArticlesGood(moduleId);
    }



}
