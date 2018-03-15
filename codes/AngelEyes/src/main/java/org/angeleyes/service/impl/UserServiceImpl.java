package org.angeleyes.service.impl;

import org.angeleyes.dao.UserDao;
import org.angeleyes.entity.User;
import org.angeleyes.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

import static org.angeleyes.utils.CodeUtils.EncodeByMd5;


@Service
@Transactional
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDao userDao;

    public User getUserInfoById(Long userId) {
        return userDao.queryUserById(userId);
    }

    public Long getUserCounts() {
        return userDao.getUserCounts();
    }

    public List<User> getUserList() {
        return userDao.getUserList();
    }

    public List<User> getUserListByTime(Long startTime, Long endTime) {
        return null;
    }

    public int updateUserEmail(String email, String password) {
        return 0;
    }

    public int updateUserPwd(String email, String old_password,String new_password) {
        return userDao.updateUserPwd(old_password, new_password, email);
    }

    public int updateUserImg(String email, String imgUrl) {
        return userDao.updateUserImg(imgUrl, email);
    }

    public int updateUserInfo(User user) {
        return userDao.updateUserInfo(user.getUser_id(),
                user.getUser_name(),
                user.getUser_email(),
                user.getUser_age(),
                user.getUser_gender(),
                user.getUser_homeTown_province(),
                user.getUser_homeTown_city(),
                user.getUser_homeTown_district(),
                user.getUser_homeTown_town(),
                user.getUser_homeTown_detail(),
                user.getUser_phoneNumber()
                );
    }

    public User user_login(String email, String passsword) {
        return userDao.user_login(email, EncodeByMd5(passsword));
    }

    public int user_regist(String email, String password, String user_name) {
        return userDao.user_regist(email, user_name, EncodeByMd5(password));
    }

    public User check_email(String email) {
        return userDao.checkUser_email(email);
    }

    public int insertToUserRecord_click(long uid, long aid) {
        long time = (new Date()).getTime();
        return userDao.insertToUserArticleRecords_click(uid, aid,time) ;
    }

    public User adminUserLogin(Long userId, String password) {
        return userDao.adminUserLogin(userId, password);
    }

    public int setController(int module_id, long user_id) {
        return userDao.setController(module_id, user_id);
    }

}
