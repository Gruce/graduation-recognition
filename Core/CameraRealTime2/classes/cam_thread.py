import os
import pathlib
import threading
import cv2
import sys

import pickle
import struct
import time
import math

from ...Library.api import Auth
from ...Library.config import Config
from ...CameraRealTime.classes.FrameSegment import FrameSegment

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

        ClientSocket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        # ClientSocket.setsockopt(socket.SOL_SOCKET, socket.SO_SNDBUF, 10000000)

        host = Config.host
        port = Config.port
        print('Waiting for connection')
        # try:
        #     ClientSocket.connect((host, port))
        #     connection = ClientSocket.makefile('wb')
        # except socket.error as e:
        #     print(str(e))


        # Socket Properties
        # Response = ClientSocket.recv(9000)
        # ClientSocket.send(str.encode(str(camera_id)))
        # encode_param = [int(cv2.IMWRITE_JPEG_QUALITY), 60]

        # Auth to API
        auth = Auth()
        auth.camera(camera_id, 1)

        # print(pathlib.Path(Config.cascade_path + 'haarcascade_frontalface_default.xml').absolute())

        # cam = cv2.VideoCapture(self.source)
        cap = cv2.VideoCapture('http://192.168.1.102:4747/video?640x480')
        
        fs = FrameSegment(ClientSocket, port)
        while (cap.isOpened()):
            _, frame = cap.read()
        fs.udp_frame(frame)
        
        cap.release()
        cv2.destroyAllWindows()
        s.close()
                        

        # Do a bit of cleanup
        print("\n [INFO] Exiting Program and cleanup stuff")
        try:
            auth.camera(camera_id, 0)
            cam.release()
            cv2.destroyWindow('Camera ' + str(camera_id))
        except Exception as e:
            print(e)

