# AngelEyes
基于人脸识别技术的走失儿童找寻系统

pytorch实现vgg-face进行人脸识别

### 项目技术栈

1. 深度学习和神经网络
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

   ![](https://user-images.githubusercontent.com/8847689/75103448-b0577b00-5635-11ea-9b6e-194669038feb.png)

##### 二、人脸对齐

使用的技术：简单的仿射变换，opencv即可

![](https://user-images.githubusercontent.com/8847689/75103453-c49b7800-5635-11ea-92d4-6ac5fa6bff57.png)

（图片来源于网络，侵删）

##### 三、模型架构

![](https://user-images.githubusercontent.com/8847689/75103550-ee08d380-5636-11ea-9717-dc2069bc8a1a.png)

##### 四、匹配度

![](https://user-images.githubusercontent.com/8847689/75103574-535cc480-5637-11ea-9ee2-9b2af919a2dc.png)



#### 参与人员

@TenYun

@css0306

@莱布尼兹

@盐焗咸鱼

#### 其他

模型、数据见issue
