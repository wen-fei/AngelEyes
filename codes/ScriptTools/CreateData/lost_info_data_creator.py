# Created by Landuy at 2018/2/28
#!/usr/bin/python
# -*- coding: UTF-8 -*-
from faker import Faker
import pymysql.cursors
faker = Faker('zh_CN')
from random import choice

connection = pymysql.connect(host='localhost',
                             user='root',
                             password='123456',
                             db='angeleyes',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)
try:
    with connection.cursor() as cursor:
        for i in range(1, 20000):
            family_name = faker.name()
            family_phone = faker.phone_number()
            sql = "UPDATE `lost_person_info` " \
                  " SET `lost_person_family_name` = '%s', `lost_person_family_phone` = '%s' where `lost_person_id` = %d" % (family_name, family_phone, int(i))
            try:
                print("sql is : " + sql)
                cursor.execute(sql)
                print("已经插入", i, "条语句", "sql语句为:" + sql)
            except Exception as e:
                print(e)
    connection.commit()
except Exception as e:
    print("错误原因：", e)
finally:
    connection.close()