import cv2
import os
import sys
from imutils import face_utils
import numpy as np


from lib.api import Auth
from lib.utilities import Utilities


# Auth to API
auth = Auth()

# Utilities
util = Utilities()

# Initialize not trained people
people = auth.not_trained_people()

def search_id(id):
    for person in people:
        if (person['id'] == id):
            return True
    return False

if (len(people) <= 0):
    print("\n There is no people. Please add person in Laravel Web App.")
    sys.exit()

print("\n People Found: ")
for person in people:
    print("\n[" + str(person['id']) + "] " + str(person['name']))

person_id = int(input('\n Enter number: '))

if (not search_id(person_id)):
    print("\n This number is not found.")
    sys.exit()




font = cv2.FONT_HERSHEY_SIMPLEX

cam = cv2.VideoCapture(1)

def if_directory_not_exist_create(directory):
    if not os.path.exists(directory):
        os.makedirs(directory)


count = 1

face_detector = cv2.CascadeClassifier('storage/haarcascade_frontalface_default.xml')


while(True):
    ret, img = cam.read()
    img = cv2.flip(img, -1) # flip video image vertically

    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    faces = face_detector.detectMultiScale(
        gray,
        scaleFactor=1.2,
        minNeighbors=5,
        minSize=(30, 30),
        # flags=cv2.cv.CV_HAAR_SCALE_IMAGE
        flags=cv2.CASCADE_SCALE_IMAGE
    )

    # Face Detection
    if (len(faces) > 0):
        for (x, y, w, h) in faces:
            roi_gray = gray[y:y + h, x:x + w]
            roi_color = img[y:y + h, x:x + w]

            gray_face = cv2.resize(roi_gray, (128, 128))

            dir = "storage/app/public/db/" + str(person_id)
            if_directory_not_exist_create(dir)

            cv2.imwrite(dir + '/' + str(count) + ".jpg", img[y:y+h,x:x+w])

            cv2.rectangle(img, (x, y), (x+w, y+h), (0, 255, 0), 2)
            
            count += 1


    cv2.imshow('camera', img)

    k = cv2.waitKey(100) & 0xff # Press 'ESC' for exiting video
    if k == 27:
        break
    elif count >= 10: # Take 10 face sample and stop video
         break



print("\n Success")
cam.release()
cv2.destroyAllWindows()