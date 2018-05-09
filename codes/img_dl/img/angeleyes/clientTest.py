# -*- coding: UTF-8 -*-
import requests
import json
from fileConfig import *
import torch
from torch.legacy import nn
#对服务器上的功能进行测试
url = 'http://40.125.162.89/findsim'
d = {'name': '/media/wall/F6F4D817F4D7D7C7/image/face/Abner_Martinez/Abner_Martinez_0001.jpg'}
d = json.dumps(d)
d = {'name': d}
r = requests.get(url, params=d)
print(r.text)
