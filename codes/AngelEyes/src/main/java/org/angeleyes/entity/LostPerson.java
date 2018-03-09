package org.angeleyes.entity;

public class LostPerson {

    private Long lost_person_id;
    private String lost_person_type;
    private String lost_person_no;
    private String lost_person_name;
    private String lost_person_sex;
    private String lost_person_age;
    private String lost_person_height;
    private String lost_person_area;
    private String lost_person_live;
    private String lost_person_character;
    private String lost_person_others;
    private String lost_person_registerTime;
    private Long lost_person_img_id;
    private String lost_person_family_name;
    private String lost_person_family_phone;
    private String lost_person_birth;
    private String lost_person_time;

    public String getLost_person_time() {
        return lost_person_time;
    }

    public void setLost_person_time(String lost_person_time) {
        this.lost_person_time = lost_person_time;
    }

    public String getLost_person_birth() {
        return lost_person_birth;
    }

    public void setLost_person_birth(String lost_person_birth) {
        this.lost_person_birth = lost_person_birth;
    }

    public String getLost_person_character() {
        return lost_person_character;
    }

    public void setLost_person_character(String lost_person_character) {
        this.lost_person_character = lost_person_character;
    }

    public Long getLost_person_id() {
        return lost_person_id;
    }

    public void setLost_person_id(Long lost_person_id) {
        this.lost_person_id = lost_person_id;
    }

    public String getLost_person_no() {
        return lost_person_no;
    }

    public void setLost_person_no(String lost_person_no) {
        this.lost_person_no = lost_person_no;
    }

    public String getLost_person_name() {
        return lost_person_name;
    }

    public void setLost_person_name(String lost_person_name) {
        this.lost_person_name = lost_person_name;
    }


    public String getLost_person_area() {
        return lost_person_area;
    }

    public void setLost_person_area(String lost_person_area) {
        this.lost_person_area = lost_person_area;
    }

    public String getLost_person_live() {
        return lost_person_live;
    }

    public void setLost_person_live(String lost_person_live) {
        this.lost_person_live = lost_person_live;
    }

    public String getLost_person_others() {
        return lost_person_others;
    }

    public void setLost_person_others(String lost_person_others) {
        this.lost_person_others = lost_person_others;
    }

    public String getLost_person_registerTime() {
        return lost_person_registerTime;
    }

    public void setLost_person_registerTime(String lost_person_registerTime) {
        this.lost_person_registerTime = lost_person_registerTime;
    }

    public Long getLost_person_img_id() {
        return lost_person_img_id;
    }

    public void setLost_person_img_id(Long lost_person_img_id) {
        this.lost_person_img_id = lost_person_img_id;
    }

    public String getLost_person_family_name() {
        return lost_person_family_name;
    }

    public void setLost_person_family_name(String lost_person_family_name) {
        this.lost_person_family_name = lost_person_family_name;
    }

    public String getLost_person_family_phone() {
        return lost_person_family_phone;
    }

    public void setLost_person_family_phone(String lost_person_family_phone) {
        this.lost_person_family_phone = lost_person_family_phone;
    }

    public String getLost_person_type() {
        return lost_person_type;
    }

    public void setLost_person_type(String lost_person_type) {
        this.lost_person_type = lost_person_type;
    }

    public String getLost_person_sex() {
        return lost_person_sex;
    }

    public void setLost_person_sex(String lost_person_sex) {
        this.lost_person_sex = lost_person_sex;
    }

    public String getLost_person_age() {
        return lost_person_age;
    }

    public void setLost_person_age(String lost_person_age) {
        this.lost_person_age = lost_person_age;
    }

    public String getLost_person_height() {
        return lost_person_height;
    }

    public void setLost_person_height(String lost_person_height) {
        this.lost_person_height = lost_person_height;
    }

    @Override
    public String toString() {
        return "LostPerson{" +
                "lost_person_id=" + lost_person_id +
                ", lost_person_type=" + lost_person_type +
                ", lost_person_no='" + lost_person_no + '\'' +
                ", lost_person_name='" + lost_person_name + '\'' +
                ", lost_person_sex=" + lost_person_sex +
                ", lost_person_age=" + lost_person_age +
                ", lost_person_height=" + lost_person_height +
                ", lost_person_area='" + lost_person_area + '\'' +
                ", lost_person_live='" + lost_person_live + '\'' +
                ", lost_person_charact='" + lost_person_character + '\'' +
                ", lost_person_others='" + lost_person_others + '\'' +
                ", lost_person_registerTime='" + lost_person_registerTime + '\'' +
                ", lost_person_img_id=" + lost_person_img_id +
                ", lost_person_family_name='" + lost_person_family_name + '\'' +
                ", lost_person_family_phone='" + lost_person_family_phone + '\'' +
                '}';
    }
}
