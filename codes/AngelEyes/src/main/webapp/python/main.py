from face_recognition import compare_feature, get_image
from sys import argv

if __name__ == '__mian__':
    script, fileName = argv
    name, sim = compare_feature(fileName)
    img = get_image(name)
    print(img, ',', sim[0][0])
