import socket
from numpy import loadtxt
from face_recognition import compare_feature, get_image
import torch
from torch.legacy import nn

VGG_FACE_LOCATION = 'D://vgg.pkl'
FEATURE_LOCATION = 'D:\\feature\\feature.dat'

s = socket.socket()
host = socket.gethostname()
port = 12345
s.bind((host, port))

vgg_net = torch.load(VGG_FACE_LOCATION)
vgg_net.modules[31] = nn.View(1, 25088)
feature = loadtxt(FEATURE_LOCATION)

s.listen(5)
while True:
    c, addr = s.accept()
    fileName = str(c.recv(1024), 'gbk')
    name, sim = compare_feature(fileName, vgg_net, feature)
    result = name + ',' + str(sim[0][0])
    c.send(bytes(result, 'gbk'))
    c.close()
