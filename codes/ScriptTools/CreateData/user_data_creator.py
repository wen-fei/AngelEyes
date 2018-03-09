# Created by Landuy at 2018/2/28
#!/usr/bin/python
# -*- coding: UTF-8 -*-
from faker import Faker
import pymysql.cursors
faker = Faker('zh_CN')
from random import choice

connection = pymysql.connect(host='localhost',
                             user='landuy',
                             password='123456',
                             db='angeleyes',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)
email_ends = ['qq.com', '163.com', 'gmail.com']
try:
    with connection.cursor() as cursor:
        for i in range(0, 10000):
            user_email = faker.company_email()
            user_name = faker.user_name()
            user_password = '123456'
            user_phoneNumber = faker.phone_number()
            user_img = faker.image_url()
            user_homeTown_province = faker.province()
            user_homeTown_city = faker.city()
            user_homeTown_district = faker.district()
            user_homeTown_town = faker.street_name()
            user_homeTown_details = faker.address()
            sql = "INSERT INTO `user` (`user_email`, `user_password`, " \
                  "`user_name`, `user_phoneNumber`, `user_img`, `user_homeTown_province`, " \
                  "`user_homeTown_city`, `user_homeTown_town`, `user_homeTown_district`, `user_homeTown_details`) " \
                  " VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            try:

                cursor.execute(sql, (user_email, user_password, user_name, user_phoneNumber, user_img, user_homeTown_province, user_homeTown_city, user_homeTown_town,user_homeTown_district, user_homeTown_details))
                # cursor.execute(sql)
                print("已经插入", i, "条语句", "sql语句为:" + sql)
            except Exception as e:
                print(e)
    connection.commit()
except Exception as e:
    print("错误原因：", e)
finally:
    connection.close()