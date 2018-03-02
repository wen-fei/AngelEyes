import cv2 as cv
import numpy as np

face_cascade = cv.CascadeClassifier('F://haarcascade_frontalface_default.xml')
eye_cascade = cv.CascadeClassifier('F://haarcascade_eye.xml')
img1 = cv.imread('F://2.png')
img = cv.cvtColor(img1, cv.COLOR_BGR2GRAY)   

faces = face_cascade.detectMultiScale(img, 1.3, 5)
for (x, y, w, h) in faces:
    img1 = cv.rectangle(img1, (x, y), (x+w, y+h), (255,0,0), 2)
    roi_gray = img[y:y+h, x:x+w]
    eyes = eye_cascade.detectMultiScale(roi_gray)
    for(ex, ey, ew, eh) in eyes:
        img1 = cv.rectangle(img1, (x+ex, y+ey),(x+ex+ew,y+ey+eh),(0,255,0),2)
cv.imshow('image', img1)
cv.waitKey(0)
cv.destroyAllWindows()
