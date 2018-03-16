package org.angeleyes.web;

import org.angeleyes.entity.LostPerson;
import org.angeleyes.service.LostPersonService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;

@Controller
@RequestMapping("/app/loster")
public class LostPersonController {

    // 上传的图片保存路径
    private String UPLOAD_FILE_PATH = "G:/GitHome/v2/AngelEyes/codes/AngelEyes/src/main/webapp/style/imgs/app/loster/";
    //日志对象
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private LostPersonService lostPersonService;

    /**
     * 走失用户详细信息
     * @param model
     * @return
     */
    @RequestMapping(value = "/person_id/{lost_person_id}")
    public String loster_detail(@PathVariable Long lost_person_id, Model model, HttpServletRequest request){
        LostPerson lostPerson = lostPersonService.queryById(lost_person_id);
        if(lostPerson != null){
            model.addAttribute("loster_info", lostPerson);
            return "/app/loster/lost_person_info_detail";
        }else {
            model.addAttribute("loster_info_lost", "走失用户信息已被删除或撤回");
            return "/app/loster/loster_info_lost";
        }

    }

    /**
     * 登记界面
     * @param model
     * @return
     */
    @RequestMapping("/registration")
    public String loster_index(Model model){
        return "/app/registration/find";
    }

    /**
     * 登记
     * @param model
     * @param request
     * @param result
     * @param session
     * @return
     */
    @RequestMapping(value = "/registor",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String loster_registor(Model model, HttpServletRequest request, @RequestBody String result, HttpSession session){
        if(session.getAttribute("UserInfo_session") != null){
            try{
                String name = request.getParameter("loster_name");
                String sex = request.getParameter("loster_sex");
                String type = request.getParameter("loster_type");
                String birth_year = request.getParameter("loster_birth_year");
                String birth_month = request.getParameter("loster_birth_month");
                String birth_day = request.getParameter("loster_birth_day");
                String height = request.getParameter("loster_height");
                String  loster_year = request.getParameter("yearlost_day");
                String  loster_month = request.getParameter("monlost_day");
                String  loster_day = request.getParameter("daylost_day");
                String  live = request.getParameter("loster_live");
                String  loster_area_province = request.getParameter("loster_area_province");
                String  loster_area_city = request.getParameter("loster_area_city");
                String  loster_area_detail = request.getParameter("loster_area_detail");
                String  loster_character = request.getParameter("loster_character");
                String  loster_intro = request.getParameter("loster_intro");
                String  loster_family_name = request.getParameter("loster_family_name");
                String  loster_family_phone = request.getParameter("loster_family_phone");

                String no = "1";
                String age = birth_year + birth_month + birth_day;
                String area = loster_area_province +  loster_area_city + loster_area_detail;
                String time = loster_year + loster_month + loster_day;
                Long img_id = 1l;
                int updaterow = lostPersonService.insertLostPerson(type, no, name, sex, age, height,
                        area, live, loster_character, loster_intro, time, img_id, loster_family_name,  loster_family_phone);

                if (updaterow > 0){
                    result = "1";
                }else{
                    result = "0";
                }
            }
            catch (Exception e){
                System.out.println(e);
            }
        }else{
            // 用户尚未登录，无权发布
            result = "2";
        }
        return result;

    }


    @RequestMapping("/upload")
    @ResponseBody
    public String upload(MultipartFile file, HttpServletRequest request) throws IOException {
        String path = request.getContextPath();
        System.out.println(path);
        //String path = request.getSession().getServletContext().getRealPath("upload");
        System.out.println("path is :" + UPLOAD_FILE_PATH);
        String fileName = file.getOriginalFilename();
        System.out.println("fileName is :" + fileName);
        try{
            File dir = new File(UPLOAD_FILE_PATH, fileName);
            file.transferTo(dir);
            return "1";
        }catch (Exception e){
            System.out.println("上传图片报错" + e);
            return "0";

        }

    }


    @RequestMapping("/uploadimg")
    public String uploadImg(Model model){
        return "/app/registration/upload_img";
    }

}
