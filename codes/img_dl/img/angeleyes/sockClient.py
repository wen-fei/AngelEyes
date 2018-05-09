# -*- coding: UTF-8 -*-
import socket
from sys import argv

#socket测试
script, fileName = argv
s = socket.socket()
host = socket.gethostname()
port = 12345

s.connect((host, port))
s.send(bytes(fileName, 'gbk'))
print(str(s.recv(1024), 'gbk'))
s.close()
