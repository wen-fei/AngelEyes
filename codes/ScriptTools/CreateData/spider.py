# Created by Landuy at 2018/3/1
import re
import requests
from lxml import etree
import pymysql.cursors
connection = pymysql.connect(host='localhost',
                             user='landuy',
                             password='123456',
                             db='angeleyes',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)
i = 1000
sql = "INSERT INTO `lost_person_info` (`lost_person_type`, `lost_person_no`, " \
                  "`lost_person_name`, `lost_person_sex`, `lost_person_age`, `lost_person_height`, " \
                  "`lost_person_area`, `lost_person_live`, `lost_person_character`, `lost_person_others`, " \
                  "`lost_person_registerTime`, `lost_person_img_id`, `lost_person_family_name`, `lost_person_family_phone`, `lost_person_time`)" \
                  " VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
while i < 10000:
    url = "http://www.baobeihuijia.com/view.aspx?id=" + str(i)
    i = i + 1
    response = requests.get(url)
    html = etree.HTML(response.text)
    print("url is :" + url)
    # 编号
    no_url = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[2]/a/@href')
    if len(no_url) == 0:
        continue
    else:
        # 类别
        type = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[1]/text()')[0]
        pattern = r'\d+'
        no = re.search(re.compile(pattern), no_url).group(0)
        # 姓名
        name = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[3]/text()')[0]
        # 性别
        sex = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[4]/text()')[0]
        # 出生日期
        date_of_birth = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[5]/text()')[0]
        # 身高
        height = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[6]/text()')[0]
        # 时间
        lost_time =  html.xpath('//*[@id="table_1_normaldivr"]/ul/li[7]/text()')[0]
        # 所在地
        area = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[8]/text()')[0]
        # 发现地点
        live = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[9]/text()')[0]
        # 特征
        character = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[10]/text()')[0]
        # 其他
        others = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[11]/text()')[0]
        # 注册时间
        registerTime = html.xpath('//*[@id="table_1_normaldivr"]/ul/li[12]/text()')[0]
        # try:
        #     with connection.cursor() as cursor:
        #         cursor.execute(sql, (
        #         0, no, name, sex, date_of_birth, height,
        #         area, user_homeTown_town, character, others, registerTime))
        #     connection.commit()
        # except Exception as e:
        #     print("错误原因：", e)
        # finally:
        #     connection.close()
        print(type)
        print(no)
        print(name)
        print(sex)
        print(date_of_birth)
        print(height)
        print(area)
        print(live)
        print(character)
        print(others)
        print(registerTime)