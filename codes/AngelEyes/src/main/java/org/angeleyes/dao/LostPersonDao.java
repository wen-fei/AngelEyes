package org.angeleyes.dao;

import org.angeleyes.entity.LostPerson;
import org.apache.ibatis.annotations.Param;

public interface LostPersonDao {

    /**
     * 通过姓名查询
     * @param name
     * @return
     */
    LostPerson queryByName(String name);

    /**
     * 通过id查找
     * @param id
     * @return
     */
    LostPerson queryById(Long id);

    /**
     * 通过年龄查找
     * @param age
     * @return
     */
    LostPerson queryByAge(int age);

    /**
     * 通过走失地区查找
     * @param area
     * @return
     */
    LostPerson queryByArea(String area);

    /**
     * 通过居住地查找
     * @param live
     * @return
     */
    LostPerson queryByLive(String live);

    /**
     * 通过性别查找
     * @param sex
     * @return
     */
    LostPerson queryBySex(int sex);

    /**
     * 通过时间查找
     * @param startTime
     * @param endTime
     * @return
     */
    LostPerson queryByTime(@Param("startTime") Long startTime,
                           @Param("emdTime") Long endTime);

    /**
     * 插入一条走失儿童记录
     * @param type 类型 0：寻找走失儿童 1：为走失儿童寻找家庭
     * @param no   编号
     * @param name 姓名
     * @param sex  性别
     * @param age  年龄
     * @param height 身高
     * @param area 走失地区
     * @param live 家庭住址
     * @param character 走失人特征
     * @param others   其他
     * @param time   走失时间
     * @param registerTime 记录产生时间
     * @param img_id  走失人图片
     * @param family_name 家属联系人姓名
     * @param family_phone 家属联系人电话
     * @return
     */
    int insertLostPerson(@Param("type") int type,
                         @Param("no") String no,
                         @Param("name") String name,
                         @Param("sex") int sex,
                         @Param("age") int age,
                         @Param("height") int height,
                         @Param("arae") String area,
                         @Param("live") String live,
                         @Param("character") String character,
                         @Param("others") String others,
                         @Param("time") Long time,
                         @Param("registerTime") Long registerTime,
                         @Param("img_id") Long img_id,
                         @Param("family_name") String family_name,
                         @Param("family_phone") String family_phone);

    /**
     * 修改走失儿童信息
     * @param id  hidden
     * @param type
     * @param no
     * @param name
     * @param sex
     * @param age
     * @param height
     * @param area
     * @param live
     * @param character
     * @param others
     * @param time
     * @param img_id
     * @param family_name
     * @param family_phone
     * @return
     */
    int updateLostPersonInfo(@Param("id") Long id,
                             @Param("type") int type,
                             @Param("no") String no,
                             @Param("name") String name,
                             @Param("sex") int sex,
                             @Param("age") int age,
                             @Param("height") int height,
                             @Param("arae") String area,
                             @Param("live") String live,
                             @Param("character") String character,
                             @Param("others") String others,
                             @Param("time") Long time,
                             @Param("img_id") Long img_id,
                             @Param("family_name") String family_name,
                             @Param("family_phone") String family_phone);

    /**
     * 删除一条走失儿童信息
     * @param id
     * @return
     */
    int deleteLostPersonInfo_one(Long id);

    /**
     * 删除多条走失儿童信息
     * @param ids
     * @return
     */
    int deleteLostPersonInfo_many(Long[] ids);
}
