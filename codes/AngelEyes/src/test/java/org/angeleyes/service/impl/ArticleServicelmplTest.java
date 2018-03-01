package org.angeleyes.service.impl;

import org.angeleyes.dao.ArticleDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import java.sql.Timestamp;
import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class ArticleServicelmplTest {
    @Autowired
    private ArticleDao dao;


}
