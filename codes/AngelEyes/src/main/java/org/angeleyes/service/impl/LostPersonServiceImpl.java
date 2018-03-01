package org.angeleyes.service.impl;

import org.angeleyes.dao.LostPersonDao;
import org.angeleyes.entity.LostPerson;
import org.angeleyes.service.LostPersonService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;

@Service
@Transactional
public class LostPersonServiceImpl implements LostPersonService {

    @Resource
    private LostPersonDao lostPersonDao;

    public LostPerson queryByName(String name) {
        return lostPersonDao.queryByName(name);
    }

    public LostPerson queryById(Long id) {
        return lostPersonDao.queryById(id);
    }

    public LostPerson queryByAge(int age) {
        return lostPersonDao.queryByAge(age);
    }

    public LostPerson queryByArea(String area) {
        return lostPersonDao.queryByArea(area);
    }

    public LostPerson queryByLive(String live) {
        return lostPersonDao.queryByArea(live);
    }

    public LostPerson queryBySex(int sex) {
        return lostPersonDao.queryByAge(sex);
    }

    public LostPerson queryByTime(Long startTime, Long endTime) {
        return lostPersonDao.queryByTime(startTime, endTime);
    }

    public int insertLostPerson(int type, String no, String name, int sex,
                                int age, int height, String area, String live,
                                String character, String others, Long time,
                                Long registerTime, Long img_id, String family_name,
                                String family_phone) {
        registerTime = new Date().getTime();
        return lostPersonDao.insertLostPerson(type, no, name, sex, age,
                height, area, live, character, others, time, registerTime, img_id, family_name, family_phone
        );
    }

    public int updateLostPersonInfo(Long id, int type, String no,
                                    String name, int sex, int age,
                                    int height, String area, String live,
                                    String character, String others, Long time,
                                    Long img_id, String family_name, String family_phone) {

        return lostPersonDao.updateLostPersonInfo(id, type, no, name, sex, age, height,
                area, live, character, others, time, img_id, family_name, family_phone);
    }

    public int deleteLostPersonInfo_one(Long id) {
        return deleteLostPersonInfo_one(id);
    }

    public int deleteLostPersonInfo_many(Long[] ids) {
        return deleteLostPersonInfo_many(ids);
    }
}
