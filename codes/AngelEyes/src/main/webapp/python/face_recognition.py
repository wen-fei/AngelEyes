import cv2 as cv
import os
from face_pretreate import endwith, pretreat_img_chinese
import sklearn.metrics.pairwise as pw
import torch
import numpy as np
from torch.legacy import nn
from matplotlib import pyplot as plt
from numpy import loadtxt

VGG_FACE_LOCATION = 'D://vgg.pkl'
FEATURE_LOCATION = 'D:\\feature\\feature.dat'
ID_LOCATION = 'D:\\feature\\id.dat'

# 从处理过的图像集中获取特征
def save_all_feature(fileName, targetName, *suffix):
    if os.path.exists(fileName):
        vgg_net = torch.load(VGG_FACE_LOCATION)
        vgg_net.modules[31] = nn.View(1, 25088)
        f = os.listdir(fileName)
        for name in f:
            images = os.listdir(fileName + os.sep + name)
            for image in images:
                if endwith(image, suffix):
                    img = cv.imread(fileName + os.sep + name + os.sep + image)
                    feature = list(get_feature(img, vgg_net))
                    # print(feature)
                    if not os.path.exists(targetName):
                        os.makedirs(targetName)
                    with open(targetName + os.sep + 'id.dat', 'a') as f:
                        f.write(name)
                        f.write('\n')
                    with open(targetName + os.sep + 'feature.dat', 'a') as f:
                        feature = map(str, feature)
                        f.writelines(s+' ' for s in feature)
                        f.write('\n')
                    print(name, " successfule")
        # if not os.path.exists(targetName + os.sep + 'feature'):
        #     os.makedirs(targetName+os.sep+'feature')
        # featureData.to_table(targetName + os.sep + 'feature//feature.dat')
        # nameData.to_table(targetName + os.sep + 'feature//id.dat')



def save_feature(fileName, targetName, *suffix):
    if os.path.exists(fileName):
        name = os.path.basename(fileName)
        vgg_net = torch.load(VGG_FACE_LOCATION)
        vgg_net.modules[31] = nn.View(1, 25088)
        images = os.listdir(fileName)
        for image in images:
            if endwith(image, suffix):
                img = cv.imread(fileName + os.sep + image)
                feature = list(get_feature(img, vgg_net))
                # print(feature)
                if not os.path.exists(targetName):
                    os.makedirs(targetName)
                with open(targetName + os.sep + 'id.dat', 'a') as f:
                    f.write(name)
                    f.write('\n')
                with open(targetName + os.sep + 'feature.dat', 'a') as f:
                    feature = map(str, feature)
                    f.writelines(s + ' ' for s in feature)
                    f.write('\n')
                print(name, " successfule")


# 获取图片的矩阵形式，输出特征
def get_feature(file, net):
    img = np.zeros((3, 224, 224))
    img[0, :, :] = (file[:, :, 2])
    img[1, :, :] = (file[:, :, 1])
    img[2, :, :] = (file[:, :, 0])
    # img = torch.from_numpy(img).float()
    # img = torch.Tensor(img).unsqueeze(0)
    # img = Variable(img)
    # print(img)
    img = img.astype(float)
    trainingMean = [129.1863, 104.7624, 93.5940]
    for i in range(3):
        img[0, i] = img[0, i] - trainingMean[i]
    input = torch.Tensor(1, 3, 224, 224)
    input[0] = torch.from_numpy(img)
    output = net.forward(input)
    output = net.modules[35].output.clone().numpy()
    return output[0]


def compare(feat1, feat2):
    prediction = pw.cosine_similarity(feat1, feat2)
    return prediction

"""
接收的图片地址，
返回图片对应的id号，
如果返回为fail说明数据库中不存在匹配的id
"""
def compare_feature(fileName, vgg_net, feature):
    # print(feature)
    img = pretreat_img_chinese(fileName)
    img_feature = get_feature(img, vgg_net)
    sim = 0
    num = -1
    count = 0
    for i in range(feature.shape[0]):
        comp = compare(img_feature.reshape(1, -1), feature[i].reshape(1, -1))
        if comp > sim:
            num = i
            sim = comp
        if sim > 60:
            break
    if not num == -1:
        with open(ID_LOCATION) as f:
            for line in f.readlines():
                if num == count:
                    return line[:-1], sim
                else:
                    count += 1
    else:
        return 'fail'

def get_image(name):
    return 'D:\image_face\\'+name+'\\0.jpg'

def threshold_test():
    if os.path.exists('D://image_test'):
        sum_count = 27
        images = os.listdir('D://image_test')
        test_point = np.arange(10, 70, 10).astype('float32')
        accuracy = np.arange(10, 70, 10).astype('float32')
        vgg_net = torch.load(VGG_FACE_LOCATION)
        print('模型加载成功')
        vgg_net.modules[31] = nn.View(1, 25088)
        feature = loadtxt(FEATURE_LOCATION)
        print('feature加载成功')
        for w in range(test_point.shape[0]):
            right_count = 0
            for image in images:
                num = -1
                sim = -1
                y = os.path.splitext(image)[0]
                img = cv.imread('D://image_test' + os.path.sep + image)
                image_feature = get_feature(img, vgg_net)
                # 找到对应的id在第几行
                for i in range(feature.shape[0]):
                    comp = compare(feature[i].reshape(1, -1), image_feature.reshape(1, -1))
                    if comp > sim:
                        num = i
                        sim = comp
                    if sim >= test_point[w]:
                        break

                # 判断找到的id和正确id是否相同
                if not num == -1:
                    count = 0
                    with open(ID_LOCATION) as f:
                        for line in f.readlines():
                            if num == count:
                                if line[:-1] == y:
                                    right_count += 1
                                    print(test_point[w], ' | ', line[:-1], ' | ', y, ' right ', sim)
                                    break
                                else:
                                    print(test_point[w], ' | ', line[:-1], ' | ', y, ' wrong ', sim)
                                    break
                            count += 1
                else:
                    print(test_point[w], ' | ', image, ' | ', y, ' not found')
            print(right_count, ' ', sum_count)
            accuracy[w] = right_count / sum_count
            print(test_point[w], ' | ', accuracy[w])

        for i in range(accuracy.shape[0]):
            print('threshold: ', i+1, ' | accuracy:', accuracy[i])

# threshold_test()
# save_all_feature('D:\image\\2018319', 'D://feature', '.jpg')
# save_feature('D:\image_face\Aaron_Sorkin', 'D://feature_test', '.jpg')
# name, sim = compare_feature('D:\image\\2018319\\10772\\0.jpg')
# net = torch.load('D://vgg.pkl')
# net.modules[31] = nn.View(1, 25088)
# img = pretreat_img("D:\image_face\Ai_Sugiyama\\4.jpg")
# feature = get_feature(img, net)
# count = 0
# for i in range(feature.shape[0]):
#     if not feature[i] == 0:
#         count += 1
# print(count)


