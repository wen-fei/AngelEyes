package org.angeleyes.entity;

public class User {
    private Long user_id;

    private String user_email;

    private String user_name;

    private String user_password;

    private int user_type;

    private int user_gender;

    private int user_age;

    private String user_phoneNumber;

    private String user_Img;

    private String user_homeTown_province;

    private String user_homeTown_city;

    private String user_homeTown_town;

    private String user_homeTown_detail;

    private String user_homeTown_district;

    public int getUser_age() {
        return user_age;
    }

    public void setUser_age(int user_age) {
        this.user_age = user_age;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public int getUser_type() {
        return user_type;
    }

    public void setUser_type(int user_type) {
        this.user_type = user_type;
    }

    public int getUser_gender() {
        return user_gender;
    }

    public void setUser_gender(int user_gender) {
        this.user_gender = user_gender;
    }

    public String getUser_phoneNumber() {
        return user_phoneNumber;
    }

    public void setUser_phoneNumber(String user_phoneNumber) {
        this.user_phoneNumber = user_phoneNumber;
    }

    public String getUser_Img() {
        return user_Img;
    }

    public void setUser_Img(String user_Img) {
        this.user_Img = user_Img;
    }

    public String getUser_homeTown_province() {
        return user_homeTown_province;
    }

    public void setUser_homeTown_province(String user_homeTown_province) {
        this.user_homeTown_province = user_homeTown_province;
    }

    public String getUser_homeTown_city() {
        return user_homeTown_city;
    }

    public void setUser_homeTown_city(String user_homeTown_city) {
        this.user_homeTown_city = user_homeTown_city;
    }

    public String getUser_homeTown_town() {
        return user_homeTown_town;
    }

    public void setUser_homeTown_town(String user_homeTown_town) {
        this.user_homeTown_town = user_homeTown_town;
    }

    public String getUser_homeTown_detail() {
        return user_homeTown_detail;
    }

    public void setUser_homeTown_detail(String user_homeTown_detail) {
        this.user_homeTown_detail = user_homeTown_detail;
    }

    public String getUser_homeTown_district() {
        return user_homeTown_district;
    }

    public void setUser_homeTown_district(String user_homeTown_district) {
        this.user_homeTown_district = user_homeTown_district;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_id=" + user_id +
                ", user_email='" + user_email + '\'' +
                ", user_name='" + user_name + '\'' +
                ", user_password='" + user_password + '\'' +
                ", user_type=" + user_type +
                ", user_gender=" + user_gender +
                ", user_phoneNumber='" + user_phoneNumber + '\'' +
                ", user_Img='" + user_Img + '\'' +
                ", user_homeTown_province='" + user_homeTown_province + '\'' +
                ", user_homeTown_city='" + user_homeTown_city + '\'' +
                ", user_homeTown_town='" + user_homeTown_town + '\'' +
                ", user_homeTown_detail='" + user_homeTown_detail + '\'' +
                '}';
    }
}