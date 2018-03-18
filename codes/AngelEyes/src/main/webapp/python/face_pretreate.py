import cv2 as cv
import os
from face_alignment import warpAffineImg


# X_train,X_test,y_train,y_test = train_test_split(imgs,labels,test_size=0.2,random_state=random.randint(0, 100))
# 读取多个文件夹的图片

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
                    print(targetName + os.sep + "image_face" + os.sep + name + os.sep + str(count) + '.jpg', ' successful')
                    count += 1
    #找不到输入的路径
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
                cv.imwrite(targetName + os.sep + "image_face" + os.sep + os.path.basename(fileName) + os.sep + str(count) + '.jpg', img)
                print(targetName + os.sep + "image_face" + os.sep + os.path.basename(fileName) + os.sep + str(count) + '.jpg', ' successfule')
                count += 1
    else:
        print("找不到输入的路径")


# 识别人脸，并把人脸裁剪出
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

# pick_single('D:\\test', 'D:\\test_image', '.jpg')
# pick_dir('D://image//face', 'D:\\tetst_image', 'jpg')
