package org.angeleyes.dao;

import org.angeleyes.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {

    /**
     * 通过用户ID查询用户信息
     * @param userId
     * @return
     */
    User queryUserById(Long userId);

    /**
     * 统计用户数量
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
    List<User> getUserListByTime(@Param("startTime") Long startTime,
                                     @Param("endTime") Long endTime);


    /**
     * 通过学生家乡所在省份/城市/镇查找学生
     * @param home
     * @return
     */
    List<User> getUserListByArea(String home);

    /**
     * 用户登录验证
     * @param userEmail  用户名
     * @param password  密码
     * @return
     */
    User getLoginInfo(@Param("userEmail") String userEmail,
                          @Param("password") String password);

    /**
     * 判断用户邮箱是否唯一
     * @param userEmail
     * @return
     */
    User checkUser_email(String userEmail);

    /**
     * 更新用户信息
     * @param user_id               用户id
     * @param user_name             昵称
     * @param user_email            邮箱
     * @param user_gender           性别
     * @param user_home_province    家乡省份
     * @param user_home_city        家乡城市
     * @param user_home_district    家乡县
     * @param user_home_town        家乡镇
     * @param user_home_details     详细地址
     * @param user_type             用户类型
     * @param phoneNumber           手机
     * @return
     */
    int updateUserInfo(@Param("user_id") Long user_id,
                       @Param("user_name")String user_name,
                       @Param("user_email") String user_email,
                       @Param("user_age") int user_age,
                       @Param("user_gender") int user_gender,
                       @Param("user_home_province") String user_home_province,
                       @Param("user_home_city") String user_home_city,
                       @Param("user_home_district") String user_home_district,
                       @Param("user_home_town") String user_home_town,
                       @Param("user_home_details") String user_home_details,
                       @Param("user_phoneNumber") String phoneNumber
    );

    /**
     * 修改用户头像
     * @param user_img
     * @param user_email
     * @return
     */
    int updateUserImg(@Param("user_img") String user_img,
                      @Param("user_email") String user_email);

    /**
     * 修改用户密码
     * @param old_password 原密码
     * @param new_password 新密码
     * @param user_email   用户邮箱
     * @return
     */
    int updateUserPwd(@Param("old_password") String old_password,
                      @Param("new_password") String new_password,
                      @Param("user_email") String user_email);

    /**
     * 设置管理员
     * @param user_email
     * @return
     */
    int setUserController(@Param("user_email")Long user_email);

}
