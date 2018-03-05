-- 创建数据库
create DATABASE angeleyes;

-- 使用数据库
use angeleyes;

-- 创建数据库表

-- 1. 用户表

CREATE TABLE user(
  user_id BIGINT UNIQUE NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  user_email VARCHAR(30) UNIQUE NOT NULL COMMENT '用户邮箱, 也做登陆名',
  user_name VARCHAR(120) COMMENT '昵称',
  user_password VARCHAR(21) NOT NULL COMMENT '用户密码，md5加密',
  user_type SMALLINT NOT NULL DEFAULT 0 COMMENT '用户类型，1：普通会员，2：高级会员，3：版主，4：模块管理员，0：系统管理员',
  user_gender  TINYINT NOT NULL DEFAULT 0 COMMENT '用户性别，0代表男，1代表女',
  user_phoneNumber CHAR(11) NOT NULL COMMENT '用户手机号',
  user_img VARCHAR(50) NOT NULL COMMENT '用户头像',
  user_homeTown_province VARCHAR(20) NOT NULL COMMENT '家乡—省',
  user_homeTown_city VARCHAR(20) NOT NULL COMMENT '家乡—市',
  user_homeTown_district VARCHAR(20) NOT NULL COMMENT '家乡—县',
  user_homeTown_town VARCHAR(20) NOT NULL COMMENT '家乡—镇',
  user_homeTown_details VARCHAR(20) NOT NULL COMMENT '家乡—详细',
  PRIMARY KEY (user_id)
)ENGINE=INNODB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- 2. 论坛模块表
CREATE TABLE module(
  module_id INT NOT NULL AUTO_INCREMENT COMMENT '模块ID',
  module_name VARCHAR(30) NOT NULL COMMENT '模块名称',
  module_controller_id BIGINT UNIQUE NOT NULL COMMENT '模块管理员用户ID',
  module_belong_forum_id INT UNIQUE NOT NULL  COMMENT  '模块所属板块ID',
  module_article_count BIGINT NOT NULL COMMENT '模块帖子数量',
  module_read_count BIGINT NOT NULL COMMENT '模块总浏览量',
  module_article_count_closedDay   BIGINT NOT NULL COMMENT '最近一天模块帖子数量',
  module_article_count_closedWeek  BIGINT NOT NULL COMMENT '最近一周模块帖子数量',
  module_article_count_closedMonth BIGINT NOT NULL COMMENT '最近一月模块帖子数量',
  module_article_count_closedYear  BIGINT NOT NULL COMMENT '最近一年模块帖子数量',
  module_reply_count_closedDay   BIGINT NOT NULL COMMENT '最近一天模块回复数量',
  module_reply_count_closedWeek  BIGINT NOT NULL COMMENT '最近一周模块回复数量',
  module_reply_count_closedMonth BIGINT NOT NULL COMMENT '最近一月模块回复数量',
  module_reply_count_closedYear  BIGINT NOT NULL COMMENT '最近一年模块回复数量',
  module_read_count_closedDay    BIGINT NOT NULL COMMENT '最近一天模块浏览量',
  module_read_count_closedWeek   BIGINT NOT NULL COMMENT '最近一周模块浏览量',
  module_read_count_closedMonth  BIGINT NOT NULL COMMENT '最近一月模块浏览量',
  module_read_count_closedYear   BIGINT NOT NULL COMMENT '最近一年模块浏览量',
  PRIMARY KEY (module_id),
  CONSTRAINT fk_module_author FOREIGN KEY (module_controller_id) REFERENCES user(user_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='模块信息表';

-- 3. 主题（发表的帖子，和发表的回复不同）信息表
CREATE TABLE article(
  article_id BIGINT NOT NULL AUTO_INCREMENT COMMENT '帖子ID',
  article_title VARCHAR(255) NOT NULL  COMMENT '帖子标题',
  article_authorID BIGINT UNIQUE NOT NULL COMMENT '帖子作者用户ID',
  article_content LONGTEXT COMMENT '帖子内容',
  article_create_time TIMESTAMP NOT NULL DEFAULT now() COMMENT '帖子创建时间',
  article_module_id INT UNIQUE NOT NULL COMMENT '帖子所属模块ID',
  article_comment_number INT NOT NULL COMMENT '帖子评论数量',
  article_read_number BIGINT NOT NULL COMMENT '帖子浏览次数',
  article_is_good TINYINT NOT NULL COMMENT '是否是加精帖子',
  article_is_hot TINYINT NOT NULL COMMENT '是否是热帖子',
  article_is_top TINYINT NOT NULL COMMENT '是否是置顶帖子',
  article_last_reply_userID BIGINT NOT NULL  COMMENT '最后回复用户ID',
  article_last_reply_time DATETIME NOT NULL  COMMENT '最后回复时间',

  article_collect_counts INT NOT NULL COMMENT '帖子收藏数量',
  article_good_counts INT NOT NULL COMMENT '帖子点赞数量',
  article_notgood_counts INT NOT NULL COMMENT '帖子踩数量',
  article_share_counts INT NOT NULL COMMENT '帖子分享数量',
  /*主键*/
  PRIMARY KEY (article_id),
  /*外键*/
  CONSTRAINT fk_article_author FOREIGN KEY (article_authorID) REFERENCES user(user_id),
  CONSTRAINT fk_article_module FOREIGN KEY (article_module_id) REFERENCES module(module_id),
  CONSTRAINT fk_article_last_reply_author FOREIGN KEY (article_last_reply_userID) REFERENCES  user(user_id),

  /*索引*/
  KEY idx_article_title(article_title),
  KEY idx_article_hot(article_is_hot),
  KEY idx_article_top(article_is_top),
  KEY idx_article_good(article_is_good),
  KEY idx_article_time(article_create_time)
)ENGINE=INNODB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='帖子信息表';

-- 4. 论坛帖子回复表
CREATE TABLE reply(
  reply_id BIGINT NOT NULL AUTO_INCREMENT COMMENT '回复ID',
  reply_content LONGTEXT COMMENT '回复内容',
  reply_time DATETIME NOT NULL COMMENT '回复时间',
  reply_author_id BIGINT UNIQUE NOT NULL COMMENT '外键：回复作者用户ID',
  reply_article_id BIGINT UNIQUE NOT NULL COMMENT '外键：所属帖子ID',
  PRIMARY KEY (reply_id),

  /*外键*/
  CONSTRAINT fk_reply_author FOREIGN KEY (reply_author_id) REFERENCES user(user_id),
  CONSTRAINT fk_reply_article FOREIGN KEY (reply_article_id) REFERENCES article(article_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='帖子回复表';

-- 5. 论坛帖子评分表
CREATE TABLE article_scores(
  article_scores_id BIGINT NOT NULL AUTO_INCREMENT COMMENT '帖子ID',
  article_scores int NOT NULL DEFAULT 0 COMMENT '帖子得分',
  PRIMARY KEY (article_scores_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='帖子评分表';

-- 6. 照片库(分布式？)
CREATE TABLE img_sources(
  img_id  BIGINT UNIQUE NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  img_url VARCHAR(200) NOT NULL COMMENT '图片URL',
  PRIMARY KEY (img_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='照片库';

-- 7. 图片匹配相似度记录表
CREATE TABLE img_sim_history(
  item_id BIGINT UNIQUE NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  img_store_id BIGINT NOT NULL COMMENT '数据库存储的原图片ID',
  img_upload_id BIGINT NOT NULL COMMENT '用户上传的图片的ID',
  PRIMARY KEY (item_id),
  CONSTRAINT fk_img_store FOREIGN KEY (img_store_id) REFERENCES img_sources(img_id),
  CONSTRAINT fk_img_upload FOREIGN KEY (img_upload_id) REFERENCES img_sources(img_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='图片匹配相似度记录表';

-- 8. 用户对帖子行为操作记录表
CREATE TABLE ARTICLE_COLLECT(
  id BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
  aid BIGINT NOT NULL COMMENT '帖子id',
  uid BIGINT NOT NULL COMMENT '用户id',
  time TIMESTAMP NOT NULL DEFAULT now() COMMENT '操作时间',

  PRIMARY KEY (id),
  CONSTRAINT fk_aid FOREIGN KEY (aid) REFERENCES article(article_id),
  CONSTRAINT fk_uid FOREIGN KEY (uid) REFERENCES user(user_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='图片匹配相似度记录表';


-- 9. 走失儿童登记表
CREATE TABLE LOST_PERSON_INFO(
  lost_person_id BIGINT UNIQUE NOT NULL AUTO_INCREMENT COMMENT '走失儿童ID',
  lost_person_type TINYINT NOT NULL COMMENT '走失类别 0：宝贝寻家 1：家寻宝贝',
  lost_person_no VARCHAR(50) NOT NULL COMMENT '走失儿童编号',
  lost_person_name VARCHAR(50) NOT NULL COMMENT '走失儿童姓名',
  lost_person_sex TINYINT NOT NULL DEFAULT 0 COMMENT '走失儿童性别',
#   lost_person_age int NOT NULL DEFAULT 0 COMMENT '走失儿童年龄',
  lost_person_birth VARCHAR(100) NOT NULL DEFAULT 0 COMMENT '走失儿童出生日期',
  lost_person_height int NOT NULL DEFAULT 0 COMMENT '走失儿童身高',
  lost_person_area VARCHAR(200) NOT NULL COMMENT '走失地区',
  lost_person_live VARCHAR(200) NOT NULL COMMENT '走失儿童户籍详细地区',
  lost_person_character VARCHAR(255) NOT NULL COMMENT '走失儿童家属描述特征',
  lost_person_others VARCHAR(255) COMMENT '走失儿童其他补充信息',
  lost_person_time DATETIME NOT NULL COMMENT '走失时间',
  lost_person_registerTime DATETIME NOT NULL COMMENT '注册时间',
  lost_person_img_id BIGINT NOT NULL COMMENT '走失儿童照片id',
  lost_person_family_name VARCHAR(200) NULL COMMENT '走失家属联系人',
  lost_person_family_phone CHAR(11) NULL COMMENT '走失儿童家属联系方式',
  PRIMARY KEY (lost_person_id),
  CONSTRAINT fk_lost_person_img FOREIGN KEY (lost_person_img_id) REFERENCES img_sources(img_id)

)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='走失儿童信息登记表';

USE angeleyes;
-- 10. 帖子回复表
CREATE TABLE reply(
  reply_id BIGINT NOT NULL AUTO_INCREMENT COMMENT '回复ID',
  reply_content LONGTEXT COMMENT '回复内容',
  reply_time DATETIME NOT NULL COMMENT '回复时间',
  reply_author_id BIGINT UNIQUE NOT NULL COMMENT '外键：回复作者用户ID',
  reply_article_id BIGINT UNIQUE NOT NULL COMMENT '外键：所属帖子ID',
  PRIMARY KEY (reply_id),
  /*外键*/
  CONSTRAINT fk_reply_author FOREIGN KEY (reply_author_id) REFERENCES user (user_id),
  CONSTRAINT fk_reply_article FOREIGN KEY (reply_article_id) REFERENCES article(article_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='帖子回复表';

-- 触发器

-- 发表一篇文章的同时更新文章得分表
DELIMITER $$

CREATE
  /*[DEFINER = { user | CURRENT_USER }]*/
TRIGGER `angeleyes`.`article_score`
AFTER INSERT
  ON `angeleyes`.`article`
FOR EACH ROW
  BEGIN
    INSERT INTO article_scores
    SET article_scores_id = new.article_id, article_scores = 0;
    UPDATE module
    SET module_article_count = module_article_count + 1
    WHERE module_id = new.article_module_id;
  END$$
DELIMITER ;


-- 点赞、转发、踩、分享记录同时更新到主题表
DELIMITER $$

CREATE
  /*[DEFINER = { user | CURRENT_USER }]*/
TRIGGER `angeleyes`.`collcetUpdateToArticle` AFTER INSERT
  ON `angeleyes`.`ARTICLE_COLLECT`
FOR EACH ROW BEGIN
  UPDATE article SET article_collect_counts = article_collect_counts + 1 WHERE article_id = new.aid;
  UPDATE article SET article_good_counts = article_good_counts + 1 WHERE article_id = new.aid;
  UPDATE article SET article_notgood_counts = article_notgood_counts + 1 WHERE article_id = new.aid;
  UPDATE article SET article_share_counts = article_share_counts + 1 WHERE article_id = new.aid;

END$$

DELIMITER ;
DELIMITER $$

-- 统计模块下文章数量
