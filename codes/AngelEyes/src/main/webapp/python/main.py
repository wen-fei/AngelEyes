from face_recognition import compare_feature, get_image
from sys import argv
import sys
# reolad(sys)
# sys.setdefaultencoding("utf-8")

script, fileName = argv
name, sim = compare_feature(fileName)
img = get_image(name)
print(img)
print(sim[0][0])
