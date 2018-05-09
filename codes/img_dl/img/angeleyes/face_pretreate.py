# -*- coding: UTF-8 -*-
import cv2 as cv
import os
import numpy as np
import re
from face_alignment import warpAffineImg, warpAffilneByAngle
from matplotlib import pyplot as plt
import dlib
from fileConfig import *

# 输入文件夹，输出里面处理好的图片（所有图片都在一个文件中，图片名为唯一标识）
def pick_withoutDir(fileName, targetName, *suffix):
    # 文件名存在
    if os.path.exists(fileName):
        images = os.listdir(fileName)  # 读取一级目录
        for image in images:  # 遍历二级目录
            # 文件名为所需要的后缀名
            if endwith(image, suffix):
                print(fileName + os.sep + image)
                #  进行图片预处理
                img, flag = pretreat_img_internet(fileName + os.sep + image)
                if flag == 1:  # 人脸识别处理成功

                    # 提取文件的唯一标识
                    p = r"\d+"
                    pattern = re.compile(p)
                    result = re.search(pattern, image)[0]

                    # 创建目录
                    if not os.path.exists(targetName + os.sep + result):
                        os.makedirs(targetName + os.sep + result)
                    count = len(os.listdir(targetName + os.sep + result))
                    # 保存图片
                    cv.imwrite(targetName + os.sep + result + os.sep + str(count) + '.jpg', img)
                    print(targetName + os.sep + result + os.sep + str(count) + '.jpg', ' successful')  # 打印成功信息
                else:
                    print(fileName + os.sep + image, ' fail')  # 打印失败信息
    else:
        print('connot find the path')

# 读取多个文件夹的图片（文件夹名为唯一标识）
def pick_dir(fileName, targetName, *suffix):
    # 判断文件存在
    if os.path.exists(fileName):
        f = os.listdir(fileName)
        # 遍历所有的文件夹
        for name in f:
            images = os.listdir(fileName + os.sep + name)
            count = 0
            # 遍历文件夹内的所有文件
            for image in images:
                if endwith(image, suffix):
                    img, ret = pretreat_img_internet(fileName + os.sep + name + os.sep + image)
                    if ret == 1:
                        # 创建targetName/image_face/图片名称的路径
                        if (not os.path.exists(targetName + os.sep + "image_face" + os.sep + name)):
                            os.makedirs(targetName + os.sep + "image_face" + os.sep + name)
                        # 存储图片
                        cv.imwrite(
                            targetName + os.sep + "image_face" + os.sep + name + os.sep + str(count) + '.jpg', img)
                        print(targetName + os.sep + "image_face" + os.sep + name + os.sep + str(count) + '.jpg',
                              ' successful')
                        count += 1
                    else:
                        print(targetName + os.sep + "image_face" + os.sep + name, ' fail')
    # 找不到输入的路径
    else:
        print("cannot find the path")

# 读取单个文件夹内的图片（文件夹名为唯一标识）
def pick_single(fileName, targetName, *suffix):
    # 判断文件存在
    if os.path.exists(fileName):
        images = os.listdir(fileName)  # 读取目录
        count = 0
        for image in images:
            # 后缀名判断
            if endwith(image, suffix):
                img = pretreat_img(fileName + os.sep + image)
                # 创建目录
                if (not os.path.exists(targetName + os.sep + "image_face" + os.sep + os.path.basename(fileName))):
                    os.makedirs(targetName + os.sep + "image_face" + os.sep + os.path.basename(fileName))
                # 保存图片
                cv.imwrite(targetName + os.sep + "image_face" + os.sep + os.path.basename(fileName) + os.sep + str(
                    count) + '.jpg', img)
                print(targetName + os.sep + "image_face" + os.sep + os.path.basename(fileName) + os.sep + str(
                    count) + '.jpg', ' successfule')
                count += 1
    else:
        print("cannot find the path")


#读取带有中文路径的图片，进行预处理
def pretreat_img_chinese(fileName):
    # 后缀名判断
    if endwith(fileName, '.jpg', ',JPG', '.PNG', '.png'):
        # 对路径包含中文字符的文件进行读取
        img = cv.imdecode(np.fromfile(fileName, dtype=np.uint8), -1)
        if img is None:  # 图片为空
            return 0, 0
        else:  # 图片不为空，进行预处理
            # 图片文件过大，计算机内存不足，滤过过大文件
            if img.shape[0] < 1500 and img.shape[1] < 1500:
                img, flag = getFaceImage(img)  # 人脸识别
                if flag == 1:
                    img = warpAffineImg(img)  # 人脸对齐
                return img, flag  # 成功获取目标图片
            # 未能识别人脸
            else:
                return img, 0
    # 文件名非指定图片格式
    else:
        return 0, 0

#从网络读取图片，进行预处理
def pretreat_img_internet(fileName):
    # 后缀名判断
    if endwith(fileName, '.jpg', ',JPG', '.PNG', '.png'):

        # 从网络路径读取图片文件
        cap = cv.VideoCapture(fileName)
        ret, img = cap.read()

        if img is None:  # 图片为空
            return 0, 0
        else:  # 图片不为空，进行预处理
            # 图片文件过大，计算机内存不足，滤过过大文件
            if img.shape[0] < 1500 and img.shape[1] < 1500:
                img, flag = getFaceImage(img)  # 人脸识别
                if flag == 1:
                    img = warpAffineImg(img)  # 人脸对齐
                return img, flag  # 成功获取目标图片
            # 未能识别人脸
            else:
                return img, 0
    # 文件名非指定图片格式
    else:
        return 0, 0


# 输入文件名，输出处理好的列表形式img
def pretreat_img(fileName):
    if endwith(fileName, '.jpg', ',JPG', '.PNG', '.png'):
        img = cv.imread(fileName)
        if img is None:  # 图片为空
            return 0, 0
        else:  # 图片不为空，进行预处理
            # 图片文件过大，计算机内存不足，滤过过大文件
            if img.shape[0] < 1500 and img.shape[1] < 1500:
                img, flag = getFaceImage(img)  # 人脸识别
                if flag == 1:
                    img = warpAffineImg(img)  # 人脸对齐
                return img, flag  # 成功获取目标图片
            # 未能识别人脸
            else:
                return img, 0
    # 文件名非指定图片格式
    else:
        return 0, 0

#使用多个模型进行人脸识别
def getFaceImageMerge(img):
    img_result, ret = getFaceImageDlib(img)

    #Dlib读取失败, 进行别的模型识别
    if ret == 0:
        #进行opencv识别
        img_result, ret = getFaceImageOpencv(img)
        return img_result, ret
    #cnn识别成功
    else:
        return img_result, ret

#进行人脸识别，无法识别时，进行旋转处理，识别侧倒的人脸
def getFaceImage(img):
    img_result, ret = getFaceImageMerge(img)
    # 识别失败，进行旋转处理
    if ret == 0:
        img_trans = warpAffilneByAngle(img, 90)
        img_result, ret = getFaceImageMerge(img_trans)
        if ret == 0:
            # 识别失败，进行相反角度的旋转处理
            img_trans = warpAffilneByAngle(img, -90)
            img_result, ret = getFaceImageMerge(img_trans)
            # 旋转无法识别人脸，采用cnn进行人脸识别
            if ret == 0:
                img_result = getFaceImageDlibCnn(img)
                return img_result, ret
            else:
                return img_result, ret
        else:
            return img_result, ret
    else:
        return img_result, ret

#使用cnn模型进行人脸的识别
def getFaceImageDlibCnn(img):
    ret = 0
    # 加载cnn识别模型
    cnn_detector = dlib.cnn_face_detection_model_v1(DLIB_FACE_CNN_DETECTION)
    faces = cnn_detector(img, 1)  # 进行识别
    if len(faces) == 1:
        for face in faces:
            # 获取脸部，进行裁剪
            img = img[face.rect.top():face.rect.bottom(), face.rect.left():face.rect.right()]
            if img.size > 0:
                img = cv.resize(img, (224, 224), interpolation=cv.INTER_CUBIC)
                ret = 1

    return img, ret

#dlib模块下的hog特征识别人脸
def getFaceImageDlib(img):
    ret = 0
    # 加载dlib人脸识别器
    detector = dlib.get_frontal_face_detector()
    faces = detector(img, 1)
    if len(faces) == 1:
        for face in faces:
            # 标出人脸，进行裁剪
            img = img[face.top():face.bottom(), face.left():face.right()]
        if img.size > 0:
            img = cv.resize(img, (224, 224), interpolation=cv.INTER_CUBIC)
            ret = 1

    return img, ret

# 传入图片矩阵，识别人脸，并把人脸裁剪出（haar联级识别器）
def getFaceImageOpencv(img):
    ret = 0
    # img = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
    # 加载haar联级分类器
    face_cascade = cv.CascadeClassifier(HARRCASCADE_FACE_LOCATION)
    faces = face_cascade.detectMultiScale(img, 1.3, 5)
    if len(faces) == 1:
        # 标识人脸，进行裁剪
        for (x, y, w, h) in faces:
            img = img[y:y + h, x:x + w]
        if img.size > 0:
            img = cv.resize(img, (224, 224), interpolation=cv.INTER_CUBIC)
            ret = 1

    return img, ret


# 识别图片后缀名
def endwith(fileName, *suffix):
    result = map(fileName.endswith, suffix)
    if True in result:
        # print("格式正确")
        return True
    else:
        # print("格式错误")
        return False

#画出人脸所在位置
def draw_face(fileName):
    if not fileName == None:
        img = cv.imread(fileName)
        print(img)
        face_classify = cv.CascadeClassifier(HARRCASCADE_FACE_LOCATION)
        faces = face_classify.detectMultiScale(img, 1.3, 5)
        if not len(faces) == 0:
            for (x, y, w, h) in faces:
                img = cv.rectangle(img, (x, y), (x + w, y + h), (255, 0, 0), 5)
                img = cv.resize(img, (224, 224), interpolation=cv.INTER_CUBIC)
            return img
        else:
            return img
    else:
        return None

#测试识别人脸的识别率
def test_pick_method(fileName):
    files = os.listdir(fileName)
    count_sum = len(files)
    count1 = 0  # cnn
    count2 = 0  # hog
    count3 = 0  # haar
    if len(files) > 0:
        for file in files:
            cnn = 0
            dlib = 0
            open = 0
            img = cv.imread(fileName + os.sep + file)
            # cnn模块识别
            img1, ret = getFaceImageDlibCnn(img)
            if ret == 1:
                count1 += 1
                cnn = 1
            # hog识别
            img1, ret = getFaceImageDlib(img)
            if ret == 1:
                count2 += 1
                dlib = 1
            # haar识别
            img1, ret = getFaceImageOpencv(img)
            if ret == 1:
                count3 += 1
                open = 1
            print(file, '  ', cnn,dlib,open)
        print('cnn:', count1/count_sum)
        print('hog:', count2/count_sum)
        print('haar:', count3/count_sum)


if __name__ == '__main__':
    # img = cv.imread('/media/wall/F6F4D817F4D7D7C7/image/test/20170205093501张红霞 .jpg')
    # img, ret = getFaceImage(img)
    # img, ret = getFaceImage(img)
    # plt.imshow(img)
    # plt.show()
    pick_dir('/media/wall/F6F4D817F4D7D7C7/image/face', '/media/wall/F6F4D817F4D7D7C7/image/20180326_test', '.jpg')
    # test_pick_method('/media/wall/F6F4D817F4D7D7C7/image/cnxunren')

