import pymysql.cursors

connection = pymysql.connect(host='localhost',
                             user='root',
                             password='123456',
                             db='angeleyes',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)

try:
    with connection.cursor() as cursor:
        # for i in range(1, 20000):
            sql_img = "select img_id, img_url from img_sources"
            try:
                cursor_result = cursor.execute(sql_img)
                img_urls = cursor.fetchall()
                print(img_urls)
                for url_dict in img_urls:
                    # print("url is :" + str(url["img_url"]))
                    id = int(url_dict["img_id"])
                    url = str(url_dict["img_url"])
                    loster_no_temp = url.split("/")[-1].split("jpg")[0]
                    if loster_no_temp != "none-120-150.":
                        loster_no = loster_no_temp.split("_")[1][:-1]
                    else:
                        loster_no = loster_no_temp
                    # 得到图像对应的走失人员信息
                    # print("loster_no is:  " + loster_no)
                    sql_update = "update lost_person_info set lost_person_img_id = %d where lost_person_no = '%s' " % (id, loster_no)
                    print(sql_update)
                    try:
                        cursor.execute(sql_update)
                        pass
                    except Exception as e:
                        print(e)
                        # print("已经执行" "条语句", "sql语句为:" + sql_img)
            except Exception as e:
                print(e)
    connection.commit()
except Exception as e:
    print("错误原因：", e)
finally:
    connection.close()