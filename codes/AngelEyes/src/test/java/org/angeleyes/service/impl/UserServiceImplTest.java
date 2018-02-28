package org.angeleyes.service.impl;

import org.angeleyes.dao.UserDao;
import org.angeleyes.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class UserServiceImplTest {

    @Autowired
    private UserDao userDao;

    @Test
    public void getUserInfoById() throws Exception {
        Long userid = 10003l;
        User user_info = userDao.queryUserById(userid);
        System.out.println(user_info);
    }

    @Test
    public void getUserCounts() throws Exception {
        System.out.println(userDao.getUserCounts());
    }

    @Test
    public void getUserList() throws Exception {
    }

    @Test
    public void getUserListByTime() throws Exception {
    }

    @Test
    public void updateUserEmail() throws Exception {
    }

    @Test
    public void updateUserPwd() throws Exception {
    }

    @Test
    public void updateUserImg() throws Exception {
    }

    @Test
    public void updateUserInfo() throws Exception {
    }



}