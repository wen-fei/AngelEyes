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
        System.out.println(userDao.getUserList());
    }

    @Test
 /**
  * 没有Time属性
  **/
    public void getUserListByTime() throws Exception {
//        System.out.println(userDao.getUserListByTime());
    }

    @Test
    /**
     * 缺少方法
     * **/
    public void updateUserEmail() throws Exception {
//        System.out.println(userDao.upda);
    }

    @Test
    public void updateUserPwd() throws Exception {
        System.out.println(userDao.updateUserPwd("123456","1234567","gangshi@han.cn"));
    }

    @Test
    public void updateUserImg() throws Exception {
        System.out.println(userDao.updateUserImg("https://dummyimage.com/877x339", "gangshi@han.cn"));
    }

    @Test
    /**
     * 用户没有age属性
     */
    public void updateUserInfo() throws Exception {
//        System.out.println(userDao.updateUserInfo(10003l,"活鹅","gangshi@han.cn",12,0,
//                "黑龙江","哈尔滨","小胡同","黑虎镇","青海省玉县平山殴街V座 259406","1234536346346"));
    }



}