import cv2 as cv
import math
from matplotlib import pyplot as plt


def warpAffineImg(img):
    eyes = getEyes(img)
    if len(eyes) == 2:
        x, y, w, h = eyes[0]
        x1 = (x + w) / 2
        y1 = (y + h) / 2
        x, y, w, h = eyes[1]
        x2 = (x + w) / 2
        y2 = (y + h) / 2
        center_x = (x1 + x2) / 2
        center_y = (y1 + y2) / 2
        angle = math.atan((y2 - y1) / (x2 - x1)) * 180 / math.pi
        # 消除识别角度过大的错误识别
        if angle < 25 and angle > -25:
            M = cv.getRotationMatrix2D((center_x, center_y), angle, 1.0)
            img = cv.warpAffine(img, M, (224, 224))
        return img
    else:
        return img


def getEyes(img):
    if img.any():
        eye_cascade = cv.CascadeClassifier('D://haarcascade_eye.xml')
        eyes = eye_cascade.detectMultiScale(img)
        if len(eyes) == 2:
            return eyes
        else:
            return ()
            print("未能正确获取眼部")


def drawEyees(img):
    if img.any():
        eye_cascade = cv.CascadeClassifier('D://haarcascade_eye.xml')
        eyes = eye_cascade.detectMultiScale(img)
        for (x, y, w, h) in eyes:
            img = cv.rectangle(img, (x, y), (x + w, y + h), (255, 0, 0))
        return img

# img = drawEyees(img)
# cv.imshow("image", img)
# cv.waitKey(0)
# cv.destroyWindow("image")
# img = warpAffineImg(img)
# plt.imshow(img)
# plt.show()
