import socket
from numpy import loadtxt
from face_recognition import compare_feature
import torch
from torch.legacy import nn
from flask import Flask, request

VGG_FACE_LOCATION = 'D://vgg.pkl'
FEATURE_LOCATION = 'D:\\feature\\feature.dat'

vgg_net = torch.load(VGG_FACE_LOCATION)
vgg_net.modules[31] = nn.View(1, 25088)
feature = loadtxt(FEATURE_LOCATION)
print('文件加载成功！')

app = Flask(__name__)
app.debug = True

@app.route('/findsim', methods=['GET', 'POST'])
def findsim():
    if request.method == 'POST':
        name = request.form['name']
        name, sim = compare_feature(name, vgg_net, feature)
        result = name + ',' + str(sim[0][0])
        print(result)
        return result
    else:
        return 'method is not right'

@app.route('/hello')
def hello():
    return 'hello'

if __name__ == '__main__':
    app.run(port=1008)

