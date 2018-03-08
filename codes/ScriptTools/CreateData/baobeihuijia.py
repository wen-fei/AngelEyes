# -*- coding: UTF-8 -*-

import re
import urllib
import requests
from lxml import etree
import time
import pymysql
from urllib import request
import socket

connection = pymysql.connect(host='localhost',
                             port=3306,
                             user='root',
                             password='123456',
                             db='test',
                             charset='utf8',
                             cursorclass=pymysql.cursors.DictCursor)
# i = 1
# sql = "INSERT INTO `lost_person_info` (`lost_person_no`, `lost_person_type`, " \
#       "`lost_person_name`, `lost_person_sex`, `lost_person_birth`, `lost_person_height`, `lost_person_time`" \
#       "`lost_person_area`, `lost_person_live`, `lost_person_character`, `lost_person_others`, " \
#       "`lost_person_registerTime`)" \
#       "VALUES(%s, , 'css', 1, '19950306', 170, '', 'suzhou', 'suzhou', 'handsome', 'cool', '')"
# cursor = connection.cursor()
# cursor.execute(sql)

# 传入图片地址，文件名，保存单张图片
def saveImg(imageURL, fileName):
    u = urllib.request.urlopen(imageURL)
    data = u.read()
    f = open(fileName, 'wb')
    f.write(data)
    f.close()
    u.close()

i = 45846
while i < 50000:

    # # 添加header
    # url = 'http://www.baobeihuijia.com/'
    # header = {}
    # header['User-Agent'] = 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome'
    # rq = request.Request(url, headers=header)

    socket.setdefaulttimeout(20)
    Headers = {
        'Host': 'abc.de',
        'Connection': 'keep-alive',
        'Cache-Control': 'max-age=0',
        'Upgrade-Insecure-Request': '1',
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
        'Accept-Encoding': 'gzip, deflate, sdch, br',
        'Accept-Language': 'zh-CN,zh;q=0.8,en;q=0.6'
    }
    url = 'http://www.baobeihuijia.com/'
    req = urllib.request.Request(url, None, Headers)

    url = "http://www.baobeihuijia.com/view.aspx?id=" + str(i)
    response = requests.get(url)
    html = etree.HTML(response.text)
    i = i + 1

    # 编号
    no_url = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[2]/a/@href')
    if len(no_url) == 0:
        print("空的页面：" + str(i - 1))
        continue
    else:
        pattern = r'\d+'
        user_no = re.search(re.compile(pattern), no_url[0]).group(0)
        print("编号：" + user_no)

        # 类别
        type_no = 0
        type = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[1]/text()')[0]
        if type == "家寻宝贝":
            type_no = 1
        elif type == "宝贝寻家":
            type_no = 2
        elif type == "流浪乞讨":
            type_no = 3
        elif type == "其他寻人":
            type_no = 4

        # 姓名
        user_name = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[3]/text()')[0]
        print("姓名：" + user_name)

        # 性别
        sex = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[4]/text()')[0]
        map_sex = {'男': 0, '女': 1, '未知': 2}
        sex_no = map_sex[sex]
        print("性别：" + str(sex_no))

        # 出生日期
        date_of_birth = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[5]/text()')[0]
        print("出生日期：" + date_of_birth)

        # 身高
        height = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[6]/text()')[0]
        print("身高：" + height)

        # 时间
        lost_time = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[7]/text()')[0]
        print("失踪时间：" + lost_time)

        # 失踪人所在地
        area = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[8]/text()')
        if len(area) > 0:
            area = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[8]/text()')[0]
        else:
            area = "未知"
        print("失踪人所在地：" + area)

        # 发现地点
        live = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[9]/text()')
        if len(live) > 0:
            live = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[9]/text()')[0]
        else:
            live = "未知"
        print("发现地点：" + live)

        # 特征
        user_character = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[10]/text()')
        if len(user_character) > 0:
            user_character = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[10]/text()')[0]
        else:
            user_character = "无"
        print("特征：" + user_character)

        # 其他
        others = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[11]/text()')
        if len(others) > 0:
            others = others = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[11]/text()')[0]
        else:
            others = "无"
        print("其他：" + others)

        # 注册时间
        registerTime = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[12]/text()')
        if len(registerTime) > 0:
            registerTime = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[12]/text()')[0]
        else:
            registerTime = "未知"
        print("注册时间：" + registerTime)

        # img = html.xpath('//*[@id="_table_1_photo"]/img/@src')[0]
        # # print(img)
        # img = "http://www.baobeihuijia.com" + img;
        # saveImg(img, "E://test//" + name + ".jpg")

        sql = "INSERT INTO `lost_person_info` (`lost_person_no`, `lost_person_type`, " \
              "`lost_person_name`, `lost_person_sex`, `lost_person_birth`, `lost_person_height`, `lost_person_time`, " \
              "`lost_person_area`, `lost_person_live`, `lost_person_character`, `lost_person_others`, `lost_person_registerTime`)" \
              "VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);"
        try:
            with connection.cursor() as cursor:
                # cursor.execute(sql(0, no, name, sex, date_of_birth, height, area, character, others, registerTime))
                cursor.execute(sql, (user_no, type_no, user_name, sex_no, date_of_birth, height, lost_time, area, live, user_character, others, registerTime))
                print("写入成功")
            connection.commit()
        except Exception as e:
            print("写入失败")
            print("错误原因：", e)
    time.sleep(0)
connection.close()



