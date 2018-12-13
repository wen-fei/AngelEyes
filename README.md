# AngelEyes
基于人脸识别技术的走失儿童找寻系统

pytorch实现vgg-face进行人脸识别

### 项目技术栈

1. 深度学习
2. 图像处理
3. web开发、webApp开发

#### 项目完成功能

##### web端

包括一个完整的网站功能，基于Java8、SSM、tomcat7、mysql5.6

* 登录注册模块
* 论坛模块
* 走失人员登记模块
* 走失人员信息模块
* 后台管理模块
* 图像匹配模块

##### 数据采集

* 宝贝回家1.2W条左右图片和信息数据
* 万事通寻人网：9k左右图片和信息数据
* 中国寻人启事网：5k左右图片和信息数据

##### 图像识别

基于python实现，神经网络基于pytorch实现

##### 一、人脸检测

1. 使用的技术：dlib、CNN、opencv

2. 结果：准确率（1k张图片测试集）

   DLIB           92.82%

   OpenCV     88.14%

   CNN           90.77%

3. 效果如下：

   ![](http://otw7his7z.bkt.clouddn.com/1.png)

##### 二、人脸对齐

使用的技术：简单的仿射变换，opencv即可

![](http://otw7his7z.bkt.clouddn.com/2.png)

（图片来源于网络，侵删）

##### 三、模型架构

![](http://otw7his7z.bkt.clouddn.com/3.png)

##### 四、匹配度

![](http://otw7his7z.bkt.clouddn.com/4.png)



#### 参与人员

@TenYun

@css0306

@莱布尼兹

@盐焗咸鱼

#### 其他

图像处理用到的模型由于太大未上传，可邮箱联系qq282699766@gmail.com

数据库未上传，爬取的图片未上传
