CREATE TABLE LOST_PERSON_INFO(
  lost_person_id BIGINT UNIQUE NOT NULL AUTO_INCREMENT COMMENT '走失儿童ID',
  lost_person_type TINYINT NOT NULL COMMENT '走失类别 0：宝贝寻家 1：家寻宝贝',
  lost_person_no VARCHAR(50) NOT NULL COMMENT '走失儿童编号',
  lost_person_name VARCHAR(50) NOT NULL COMMENT '走失儿童姓名',
  lost_person_sex TINYINT NOT NULL DEFAULT 0 COMMENT '走失儿童性别',
  lost_person_age INT NOT NULL DEFAULT 0 COMMENT '走失儿童年龄',
  lost_person_height INT NOT NULL DEFAULT 0 COMMENT '走失儿童身高',
  lost_person_area VARCHAR(200) NOT NULL COMMENT '走失地区',
  lost_person_live VARCHAR(200) NOT NULL COMMENT '走失儿童户籍详细地区',
  lost_person_character VARCHAR(255) NOT NULL COMMENT '走失儿童家属描述特征',
  lost_person_others VARCHAR(255) COMMENT '走失儿童其他补充信息',
  lost_person_time DATETIME NOT NULL COMMENT '走失时间',
  lost_person_registerTime DATETIME NOT NULL COMMENT '注册时间',
  lost_person_img_id BIGINT NOT NULL UNIQUE COMMENT '走失儿童照片id',
  lost_person_family_name VARCHAR(200) NULL COMMENT '走失家属联系人',
  lost_person_family_phone CHAR(11) NULL COMMENT '走失儿童家属联系方式',
  PRIMARY KEY (lost_person_id),
  CONSTRAINT fk_lost_person_img FOREIGN KEY (lost_person_img_id) REFERENCES img_sources(img_id)

)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='走失儿童信息登记表';
