#-*- coding: UTF-8 -*-

import re
import urllib
import requests
from lxml import etree
import time


res = urllib.request.urlopen("http://www.zgxrqsw.com/")
html = res.read()
res.close()


html = unicode(html, "gb2312").encode("utf8")  # gb2312--->utf-8
print(html)

# req = requests.get("http://www.zgxrqsw.com/")
# req.encoding = "utf-8"


# connection = pymysql.connect(host='localhost',
#                              user='landuy',
#                              password='123456',
#                              db='angeleyes',
#                              charset='utf8mb4',
#                              cursorclass=pymysql.cursors.DictCursor)
# i = 1
# sql = "INSERT INTO `lost_person_info` (`lost_person_type`, `lost_person_no`, " \
#                   "`lost_person_name`, `lost_person_sex`, `lost_person_age`, `lost_person_height`, " \
#                   "`lost_person_area`, `lost_person_live`, `lost_person_character`, `lost_person_others`, " \
#                   "`lost_person_registerTime`, `lost_person_img_id`, `lost_person_family_name`, `lost_person_family_phone`, `lost_person_time`)" \
#                   " VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"

#传入图片地址，文件名，保存单张图片
# def saveImg(imageURL, fileName):
#     u = urllib.request.urlopen(imageURL)
#     data = u.read()
#     f = open(fileName, 'wb')
#     f.write(data)
#     f.close()
#     u.close()

i = 16650
while i < 16655:
    url = "http://www.zgxrqsw.com/show.asp?id=" + str(i)
    i = i + 1
    response = requests.get(url)
    html = etree.HTML(response.text)

    content = html.xpath('//div[contains(@class, "zoom")]/p/text()')
    if len(content) == 0:
        print("搞基")
    else:
        print(content)



    # 编号
    # no_url = html.xpath('')
    # if len(no_url) == 0:
    #     continue
    # else:
    #     pattern = r'\d+'
    #     no = re.search(re.compile(pattern), no_url[0]).group(0)
    #     print("编号：" + no)

    # img = html.xpath('/html/body/center/table[4]/tbody/tr/td/table/tbody/tr/td[1]/table/tbody/tr/td/div[2]/p[1]/img[1]/img/@alt src')[0]
    # img = "http://www.zgxrqsw.com" + img;
    # saveImg(img, "E://test2//" + name + ".jpg")
    # time.sleep(5)


        # try
        #     with connection.cursor() as cursor:
        #         cursor.execute(sql, (
        #         0, no, name, sex, date_of_birth, height,
        #         area, user_homeTown_town, character, others, registerTime))
        #     connection.commit()
        # except Exception as e:
        #     print("错误原因：", e)
        # finally:
        #     connection.close()






