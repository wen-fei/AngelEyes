package org.angeleyes.service;

import org.angeleyes.entity.User;

import java.util.List;

public interface UserService {
    /**
     * 通过用户ID查找用户信息
     * @param userId
     * @return
     */
    User getUserInfoById(Long userId);

    /**
     * 统计会员数量
     * @return
     */
    Long getUserCounts();

    /**
     * 得到用户信息列表
     * @return
     */
    List<User> getUserList();

    /**
     * 查询某时间段内注册的用户
     * @param startTime  开始时间
     * @param endTime    结束时间
     * @return
     */
    List<User> getUserListByTime(Long startTime, Long endTime);

    /**
     * 修改用户邮箱
     * @param email
     * @param password
     * @return
     */
    int updateUserEmail(String email, String password);

    /**
     * 修改用户密码
     * @param email
     * @param password
     * @return
     */
    int updateUserPwd(String email, String old_password, String new_password);

    /**
     * 修改用户头像
     * @param email
     * @param imgUrl
     * @return
     */
    int updateUserImg(String email, String imgUrl);

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    int updateUserInfo(User user);


}
