# -*- coding: UTF-8 -*-
import cv2 as cv
import math
import dlib
from fileConfig import *
from matplotlib import pyplot as plt
"""
人脸对齐模块
"""

# 根据人脸关键点进行仿射变换，水平人脸
def warpAffineImg(img):
    eyes = getEyes(img)
    # 当获取到正常的2个关键点时进行水平操作
    if len(eyes) == 2:

        # 关键点1
        x, y, w, h = eyes[0]
        x1 = (x + w) / 2
        y1 = (y + h) / 2
        # 关键点2
        x, y, w, h = eyes[1]
        x2 = (x + w) / 2
        y2 = (y + h) / 2

        # 中心点
        center_x = (x1 + x2) / 2
        center_y = (y1 + y2) / 2
        # 偏移角度
        angle = math.atan((y2 - y1) / (x2 - x1)) * 180 / math.pi

        # 消除识别角度过大的错误识别
        if angle < 25 and angle > -25:
            M = cv.getRotationMatrix2D((center_x, center_y), angle, 1.0)# 创建变换矩阵
            img = cv.warpAffine(img, M, (224, 224))
        return img
    else:
        return img

# 给出固定角度，旋转图片
def warpAffilneByAngle(img, angle):
    height, width, color = img.shape
    # 旋转矩阵
    m = cv.getRotationMatrix2D((width/2, height/2), angle, 1)

    # 对平移量进行修改，修正旋转后图片中心点改变问题
    m[0, 2] += (height-width)/2
    m[1, 2] += (width-height)/2
    img = cv.warpAffine(img, m, (height, width))
    return img

#获取眼部关键点
def getEyes(img):
    if not img is None:
        # 加载眼部识别器
        eye_cascade = cv.CascadeClassifier(HAARCASCADE_EYES_LOCATION)
        eyes = eye_cascade.detectMultiScale(img)  # 识别眼部，返回坐标元组
        if len(eyes) == 2:
            return eyes
        else:
            return ()
            print("未能正确获取眼部")

#画出眼部关键点
def drawEyees(img):
    if img.any():
        # 加载眼部识别器
        eye_cascade = cv.CascadeClassifier(HAARCASCADE_EYES_LOCATION)
        eyes = eye_cascade.detectMultiScale(img)
        for (x, y, w, h) in eyes:
            # 根据坐标绘制图像
            img = cv.rectangle(img, (x, y), (x + w, y + h), (255, 0, 0))
        return img
