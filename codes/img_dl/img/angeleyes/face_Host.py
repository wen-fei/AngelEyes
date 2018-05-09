# -*- coding: UTF-8 -*-
from numpy import loadtxt
from face_recognition import compare_feature
import torch
from torch.legacy import nn
from flask import Flask, request
from fileConfig import *
import json

"""
flask实现服务器部署
"""
vgg_net = torch.load(VGG_FACE_LOCATION)
vgg_net.modules[31] = nn.View(1, 25088)
feature = loadtxt(FEATURE_LOCATION)
print('config successful!')

app = Flask(__name__)

# 匹配人脸模块入口
@app.route('/findsim', methods=['GET', 'POST'])
def findsim():
    # GET方法请求
    if request.method == 'GET':
        # 获取参数，从json文件中获取图片
        data = request.args.get('name')
        name = json.loads(data)
        name = name['name']

        # 进行人脸的匹配
        name, ret, sim = compare_feature(name, vgg_net, feature)

        if ret == 2:  # 匹配成功，返回结果
            result = name + ',' + str(sim[0][0])
            print(result)
            return result

        elif ret == 0:  # 人脸识别失败，需要重新上传清晰照片
            return 'pickfail'

        else:  # 数据库中没有找到匹配的人脸
            return 'findfail'
    else:
        data = request.form.get('name')
        name = json.loads(data)
        name = name['name']
        # 进行人脸的匹配
        name, ret, sim = compare_feature(name, vgg_net, feature)
        if ret == 2:  # 匹配成功，返回结果
            result = name + ',' + str(sim[0][0])
            print(result)
            return result
        elif ret == 0:  # 人脸识别失败，需要重新上传清晰照片
            return 'pickfail'
        else:  # 数据库中没有找到匹配的人脸
            return 'findfail'

#hello测试
@app.route('/hello')
def hello():
    return 'hello'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=1234)