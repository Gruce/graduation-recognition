import os
import threading
from PyQt5 import QtCore, QtGui, QtWidgets
import numpy
import qdarkstyle
from threading import Thread
from collections import deque
from datetime import datetime
import time
import sys
import cv2
import imutils
import math
import _thread
import aiofiles



##########################  Face Detection  ###############################
from facenet_pytorch import MTCNN, InceptionResnetV1, extract_face
from PIL import Image, ImageDraw
import torch
import glob

from Core.Library.config import Config

device = 'cuda' if torch.cuda.is_available() else 'cpu'

mtcnn = MTCNN(
    margin=14,
    factor=0.3,
    keep_all=True,
    device=device
).eval()
###########################################################################
##########################  Face Recognition : deepface  #############################
from deepface import DeepFace
import pandas as pd

db_path = Config.db_path
collected_data_path = Config.collected_data_path
cascade_path = Config.cascade_path + 'haarcascade_frontalface_default.xml'

ArcFace = DeepFace.build_model('ArcFace')
VGGFace = DeepFace.build_model('VGG-Face')

class RecognizeThread(threading.Thread):
    def __init__(self, camera_id, total_faces):
        threading.Thread.__init__(self)
        self.faces = total_faces
        self.camera_id = camera_id

    def run(self):
        print("Faces recognizing " + str(len(self.faces)))
        count = 0
        try:
            for filename in self.faces:
                print("Recognizing face " + str(count))
                count += 1
                df = DeepFace.find(
                    img_path = filename,
                    model_name= 'ArcFace',
                    model = ArcFace,
                    db_path = db_path,
                    enforce_detection = False,
                    detector_backend = 'mtcnn',
                    align=True,
                )

                if df.shape[0] > 0:
                    id = df.iloc[0]['identity'].split('/')[-2].split('/')[0]
                    print("Found on " + str(id))
                else:
                    print("Not found.")
            
        except Exception as e:
            print(e)
#########################################################################

def if_directory_not_exists_create(directory):
    if not os.path.exists(directory):
        os.makedirs(directory)


from Core.Library.api import Auth

auth = Auth()
cameras = auth.cameras()

class CameraWidget(QtWidgets.QWidget):
    def __init__(self, width, height, description, camera_id, stream_link=0, aspect_ratio=False, parent=None, deque_size=1):
        super(CameraWidget, self).__init__(parent)

        # Initialize deque used to store frames read from the stream
        self.deque = deque(maxlen=deque_size)

        # Slight offset is needed since PyQt layouts have a built in padding
        # So add offset to counter the padding 
        self.offset = 16
        self.screen_width = width - self.offset
        self.screen_height = height - self.offset
        self.maintain_aspect_ratio = aspect_ratio

        if stream_link.isdecimal():
            self.camera_stream_link = int(stream_link)
        else:
            self.camera_stream_link = stream_link
            
        self.camera_id = camera_id
        self.description = description

        self.total_faces = []

        # Flag to check if camera is valid/working
        self.online = False
        self.capture = None
        self.video_frame = QtWidgets.QLabel()

        self.load_network_stream()

        # Start background frame grabbing
        self.get_frame_thread = Thread(target=self.get_frame, args=())
        self.get_frame_thread.daemon = True
        self.get_frame_thread.start()

        # Periodically set video frame to display
        self.timer = QtCore.QTimer()
        self.timer.timeout.connect(self.set_frame)
        self.timer.start(0.5)

        print('Started camera: {}'.format(self.camera_stream_link))

    def load_network_stream(self):
        """Verifies stream link and open new stream if valid"""

        def load_network_stream_thread():
            if self.verify_network_stream(self.camera_stream_link):
                self.capture = cv2.VideoCapture(self.camera_stream_link)
                self.capture.set(cv2.CAP_PROP_FPS, 1)
                self.online = True
        self.load_stream_thread = Thread(target=load_network_stream_thread, args=())
        self.load_stream_thread.daemon = True
        self.load_stream_thread.start()

    def verify_network_stream(self, link):
        """Attempts to receive a frame from given link"""

        cap = cv2.VideoCapture(link)
        if not cap.isOpened():
            return False
        cap.release()
        return True

    def detect(self, frame, type=0):
        try:
            if type == 0:
                rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
                boxes, _ = mtcnn.detect(rgb)
                return boxes
            elif type == 1:
                cascade = cv2.CascadeClassifier(cascade_path)
                gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
                boxes = cascade.detectMultiScale(gray, 1.2, 5)
                return boxes
        except Exception as e:
            print(e)

    def get_frame(self):
        """Reads frame, resizes, and converts image to pixmap"""

        while True:
            try:
                if self.capture.isOpened() and self.online:
                    # Read next frame from stream and insert into deque
                    status, frame = self.capture.read()
                    if status:
                        # Any modifications to frame
                        
                        # type = 0 : FastMTCNN
                        # type = 1 : HaarCascade
                        boxes = self.detect(frame, type=0)

                        # Draw faces
                        if boxes is not None:
                            for (x1, y1, x2, y2) in boxes:
                                # x1, y1, x2, y2 = box.astype(int)

                                image = numpy.array(frame[int(y1):int(y2), int(x1):int(x2)])

                                if not self.isFaceAdded(image):
                                    self.total_faces.append(image)
                                    print('Camera ' + str(self.camera_id) + 'New face detected')
                                    
                                cv2.rectangle(frame, (int(x1), int(y1)), (int(x2), int(y2)), (0, 255, 0), 2)
                    
                        if len(self.total_faces) >= 5:
                            try:
                                print('Camera ' + str(self.camera_id) + "Recognizing Thread is starting...")
                                thread = RecognizeThread(self.camera_id, self.total_faces)
                                thread.start()
                                time.sleep(0.1)
                                self.total_faces.clear()
                            except Exception as e:
                                print(e)

                        self.deque.append(frame)
                    else:
                        self.capture.release()
                        self.online = False
                else:
                    # Attempt to reconnect
                    print('attempting to reconnect', self.camera_stream_link)
                    self.load_network_stream()
                    self.spin(2)
                self.spin(.001)
            except AttributeError:
                pass

    def spin(self, seconds):
        """Pause for set amount of seconds, replaces time.sleep so program doesnt stall"""

        time_end = time.time() + seconds
        while time.time() < time_end:
            QtWidgets.QApplication.processEvents()

    def set_frame(self):
        """Sets pixmap image to video frame"""

        if not self.online:
            self.spin(1)
            return

        if self.deque and self.online:
            # Grab latest frame
            frame = self.deque[-1]

            # Keep frame aspect ratio
            if self.maintain_aspect_ratio:
                self.frame = imutils.resize(frame, width=self.screen_width)
            # Force resize
            else:
                self.frame = cv2.resize(frame, (self.screen_width, self.screen_height))

            # Add Camera Description Rectangular Box
            cv2.rectangle(self.frame, (self.screen_width-220,0), (self.screen_width,50), color=(0,0,0), thickness=-1)

            # Camera Description
            cv2.putText(self.frame, self.description, (10,40), cv2.FONT_HERSHEY_SIMPLEX, 1.2, (255,255,255), lineType=cv2.LINE_AA)

            # Camera id
            cv2.putText(self.frame, "Camera " + str(self.camera_id), (self.screen_width-200,40), cv2.FONT_HERSHEY_SIMPLEX, 1.2, (255,255,255), lineType=cv2.LINE_AA)

            # Convert to pixmap and set to video frame
            self.img = QtGui.QImage(self.frame, self.frame.shape[1], self.frame.shape[0], QtGui.QImage.Format_RGB888).rgbSwapped()
            self.pix = QtGui.QPixmap.fromImage(self.img)
            self.video_frame.setPixmap(self.pix)

    def get_video_frame(self):
        return self.video_frame

    def isFaceAdded(self, face):
        for _face in self.total_faces:
            try:
                result = DeepFace.verify(
                        img1_path   = face,
                        img2_path   = _face,
                        model_name  = 'ArcFace',
                        model = ArcFace,
                        enforce_detection=False,
                        detector_backend = 'opencv',
                        align=True,
                    )
                if result['verified']:
                    return True
            except Exception as e:
                continue
        return False

    
    def get_milliseconds(self):
        return int(round(time.time() * 1000))

def exit_application():
    """Exit program event handler"""

    sys.exit(1)
if __name__ == '__main__':

    # Create main application window
    app = QtWidgets.QApplication([])
    app.setStyleSheet(qdarkstyle.load_stylesheet_pyqt())
    app.setStyle(QtWidgets.QStyleFactory.create("Cleanlooks"))
    mw = QtWidgets.QMainWindow()
    mw.setWindowTitle('Camera GUI')
    # mw.setWindowFlags(QtCore.Qt.FramelessWindowHint)

    cw = QtWidgets.QWidget()
    ml = QtWidgets.QGridLayout()
    cw.setLayout(ml)
    mw.setCentralWidget(cw)
    mw.showMaximized()

    # Dynamically determine screen width/height
    screen_width = QtWidgets.QApplication.desktop().screenGeometry().width()
    screen_height = QtWidgets.QApplication.desktop().screenGeometry().height()

    cameras_count = len(cameras)
    columns = math.ceil(cameras_count/2)
    row = 0
    column = 0
    for (index, camera) in enumerate(cameras):
        # Create camera widgets
        print('Creating Camera Widgets...')
        cam = CameraWidget(screen_width//columns, screen_height//columns, stream_link=camera['source'], camera_id=camera['id'], description=camera['description'])
        # Camera Thread for recognition

        # Add widgets to layout
        print('Adding widgets to layout...')
        ml.addWidget(cam.get_video_frame(), row, column, 1, 1)
        column += 1
        if (column == columns):
            row += 1
            column = 0

    print('Verifying camera credentials...')

    mw.show()

    QtWidgets.QShortcut(QtGui.QKeySequence('Ctrl+Q'), mw, exit_application)

    if(sys.flags.interactive != 1) or not hasattr(QtCore, 'PYQT_VERSION'):
        QtWidgets.QApplication.instance().exec_()