import threading
import cv2
import sys

import pickle
import struct
import time

from ..Library.api import Auth

# Socket Client
import socket

class Camera(threading.Thread):
    def __init__(self, id, source):
        threading.Thread.__init__(self)
        self.id = id
        self.source = source

    def run(self):
        # Camera
        camera_id = self.id

        ClientSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        host = '127.0.0.1'
        port = 1233
        print('Waiting for connection')
        try:
            ClientSocket.connect((host, port))
            connection = ClientSocket.makefile('wb')
        except socket.error as e:
            print(str(e))


        # Socket Properties
        Response = ClientSocket.recv(9000)
        ClientSocket.send(str.encode(str(camera_id)))
        encode_param = [int(cv2.IMWRITE_JPEG_QUALITY), 90]

        # Auth to API
        auth = Auth()
        auth.camera(camera_id, 1)

        cam = cv2.VideoCapture(self.source)

        face_detector = cv2.CascadeClassifier('../Library/Cascades/haarcascade_frontalface_default.xml')

        def current_milli_time():
            return round(time.time() * 1000)

        time_before = current_milli_time()

        while(True):
            ret, img = cam.read()
            img = cv2.flip(img, -1) # flip video image vertically

            gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

            faces = face_detector.detectMultiScale(
                gray,
                scaleFactor=1.3,
                minNeighbors=5,
                # minSize=(30, 30),
                flags=cv2.CASCADE_SCALE_IMAGE
            )

            # Face Detection
            if (len(faces) > 0):
                for (x, y, w, h) in faces:
                    roi_gray = gray[y:y + h, x:x + w]
                    roi_color = img[y:y + h, x:x + w]

                    gray_face = cv2.resize(roi_gray, (128, 128))

                    # Send image to socket server every 3 seconds
                    if ((current_milli_time() - time_before ) > 3000):
                        time_before = current_milli_time()

                        # Send Face to socket server
                        result, frame = cv2.imencode('.jpg', roi_color, encode_param)
                        data = pickle.dumps(frame, 0)
                        size = len(data)
                        # print("{}: {}".format(size))
                        ClientSocket.sendall(struct.pack(">L", size) + data)

                        # Send Full Image to the socket server
                        cv2.rectangle(img, (x, y), (x+w, y+h), (0, 255, 0), 2)
                        result_full, frame_full = cv2.imencode('.jpg', img, encode_param)
                        data_full = pickle.dumps(frame_full, 0)
                        size_full = len(data_full)
                        ClientSocket.sendall(struct.pack(">L", size_full) + data_full)

                    cv2.rectangle(img, (x, y), (x+w, y+h), (0, 255, 0), 2)

            h,w,c = img.shape
            cv2.putText(img, 'Camera ' + str(camera_id), (10, h-15), cv2.FONT_HERSHEY_SIMPLEX, 0.75, (0, 255, 0), 2)

            cv2.imshow('Camera ' + str(camera_id), img)

            k = cv2.waitKey(100) & 0xff # Press 'ESC' for exiting video
            if k == 27:
                break
                

        # Do a bit of cleanup
        print("\n [INFO] Exiting Program and cleanup stuff")
        try:
            auth.camera(camera_id, 0)
            cam.release()
            cv2.destroyWindow('Camera ' + str(camera_id))
        except Exception as e:
            print(e)

