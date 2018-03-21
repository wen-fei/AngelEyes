import cv2 as cv
import os
import numpy as np
import re

from face_alignment import warpAffineImg
from matplotlib import pyplot as plt

coding = 'utf-8'


# X_train,X_test,y_train,y_test = train_test_split(imgs,labels,test_size=0.2,random_state=random.randint(0, 100))
# 输入文件夹，输出里面处理好的
def pick_withoutDir(fileName, targetName, *suffix):
    if not fileName == None:
        images = os.listdir(fileName)
        for image in images:
            if endwith(image, suffix):
                img = pretreat_img_chinese(fileName + os.sep + image)
                p = r"\d+"
                pattern = re.compile(p)
                result = re.search(pattern, image)[0]
                if not os.path.exists(targetName + os.sep + result):
                    os.makedirs(targetName + os.sep + result)
                count = len(os.listdir(targetName + os.sep + result))
                cv.imwrite(targetName + os.sep + result + os.sep + str(count) + '.jpg', img)
                print(targetName + os.sep + result + os.sep + str(count) + '.jpg', ' successful')
    else:
        print('找不到输入路径')

#读取带有中文路径的图片
def pretreat_img_chinese(fileName):
    if endwith(fileName, '.jpg', ',JPG', '.PNG', '.png'):
        img = cv.imdecode(np.fromfile(fileName, dtype=np.uint8), -1)
        img, flag = getFaceImage(img)
        if flag == 1:
            img = warpAffineImg(img)
        return img
    else:
        return False


# 输入文件名，输出处理好的列表形式img
def pretreat_img(fileName):
    if endwith(fileName, '.jpg', ',JPG', '.PNG', '.png'):
        img = cv.imread(fileName)
        img, flag = getFaceImage(img)
        if flag == 1:
            img = warpAffineImg(img)
        return img
    else:
        return False


# 读取多个文件夹的图片
def pick_dir(fileName, targetName, *suffix):
    if os.path.exists(fileName):
        f = os.listdir(fileName)
        # 遍历所有的文件夹
        for name in f:
            images = os.listdir(fileName + os.sep + name)
            count = 0
            # 遍历文件夹内的所有文件
            for image in images:
                if endwith(image, suffix):
                    img = pretreat_img(fileName + os.sep + name + os.sep + image)
                    # 创建targetName/image_face/图片名称的路径
                    if (not os.path.exists(targetName + os.sep + "image_face" + os.sep + name)):
                        os.makedirs(targetName + os.sep + "image_face" + os.sep + name)
                    # 存储图片
                    cv.imwrite(targetName + os.sep + "image_face" + os.sep + name + os.sep + str(count) + '.jpg', img)
                    print(targetName + os.sep + "image_face" + os.sep + name + os.sep + str(count) + '.jpg',
                          ' successful')
                    count += 1
    # 找不到输入的路径
    else:
        print("找不到输入的路径")


# 读取单个文件夹内的图片
def pick_single(fileName, targetName, *suffix):
    if os.path.exists(fileName):
        images = os.listdir(fileName)
        count = 0
        for image in images:
            if endwith(image, suffix):
                img = pretreat_img(fileName + os.sep + image)

                if (not os.path.exists(targetName + os.sep + "image_face" + os.sep + os.path.basename(fileName))):
                    os.makedirs(targetName + os.sep + "image_face" + os.sep + os.path.basename(fileName))
                cv.imwrite(targetName + os.sep + "image_face" + os.sep + os.path.basename(fileName) + os.sep + str(
                    count) + '.jpg', img)
                print(targetName + os.sep + "image_face" + os.sep + os.path.basename(fileName) + os.sep + str(
                    count) + '.jpg', ' successfule')
                count += 1
    else:
        print("找不到输入的路径")


# 传入图片矩阵，识别人脸，并把人脸裁剪出
def getFaceImage(img):
    # img = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
    face_cascade = cv.CascadeClassifier('D://haarcascade_frontalface_default.xml')

    faces = face_cascade.detectMultiScale(img, 1.3, 5)
    if len(faces) == 1:
        for (x, y, w, h) in faces:
            img = img[y:y + h, x:x + w]
        if img.size > 0:
            img = cv.resize(img, (224, 224), interpolation=cv.INTER_CUBIC)
            ret = 1
    else:
        ret = 0
        img = cv.resize(img, (224, 224), interpolation=cv.INTER_CUBIC)
    return img, ret


# 识别是图片文件
def endwith(fileName, *suffix):
    result = map(fileName.endswith, suffix)
    if True in result:
        # print("格式正确")
        return True
    else:
        # print("格式错误")
        return False


def draw_face(fileName):
    if not fileName == None:
        img = cv.imread(fileName)
        print(img)
        face_classify = cv.CascadeClassifier('D://haarcascade_frontalface_default.xml')
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


# pick_single('D:\\test', 'D:\\test_image', '.jpg')
# pick_dir('D://image//face', 'D:\\tetst_image', 'jpg')

# images = os.listdir('D:\\img_test')
# count = 1
# for image in images:
#     img = draw_face('D:\\img_test' + os.sep + image)
#     img = img[:,:,::-1]
#
#     plt.subplot('33'+str(count))
#     plt.imshow(img)
#     plt.xticks([])
#     plt.yticks([])
#     count += 1
# plt.show()

# pick_withoutDir('D:\\image\\loster', 'D://image//2018319', '.jpg')
