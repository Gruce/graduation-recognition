import os
import subprocess
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
from termcolor import cprint

###########################################################################
##########################  Face Detection  ###############################
from facenet_pytorch import MTCNN, InceptionResnetV1, extract_face
from PIL import Image, ImageDraw
from lib.config import Config
import torch
device = 'cuda' if torch.cuda.is_available() else 'cpu'

mtcnn = MTCNN(
    margin=14,
    factor=0.3,
    keep_all=False,
    device=device
).eval()

######################################################################################
##########################  Face Recognition : deepface  #############################
from lib.deepface_thread import DeepFaceThread
from deepface import DeepFace
import pandas as pd

db_path = Config.db_path
collected_data_path = Config.collected_data_path
cascade_path = Config.cascade_path + 'haarcascade_frontalface_default.xml'

ArcFace = DeepFace.build_model('ArcFace')

#########################################################################
############################ Functions ###############################
def get_milliseconds():
        return int(round(time.time() * 1000))

def if_directory_not_exists_create(directory):
    if not os.path.exists(directory):
        os.makedirs(directory)

def get_directories_in_directory(dir):
    return [os.path.join(dir, f) for f in os.listdir(dir) if not f.startswith('.')]

def get_files_in_directory(dir):
    return [os.path.join(dir, f) for f in os.listdir(dir) if not f.startswith('.')]

def save_array_of_images(images, camera_id):
    directory = collected_data_path + str(camera_id) + '/'
    if_directory_not_exists_create(directory)
    for i, image in enumerate(images):
        cv2.imwrite(directory + str(get_milliseconds()) + '.jpg', image)

#########################################################################
############################ API ###############################
from lib.api import Auth

auth = Auth()
cameras = auth.cameras()

people = auth.people()
if (len(people) <= 0):
    cprint("\n There is no people. Please add person in Laravel Web App.", 'red')
    sys.exit()

# RECOGNITION Class
class Recognition(threading.Thread):
    def __init__(self, statueLabel=None):
        threading.Thread.__init__(self)
        self.threads = []
        self.statueLabel = statueLabel

    def run(self):
        cprint("Recognition thread is started.", 'blue')
        while (True):
            for camera in get_directories_in_directory(collected_data_path):
                if (len(get_files_in_directory(os.path.normpath(camera))) > 0):
                    try:
                        camera_id = camera.replace(collected_data_path, '')
                        cprint("[Recognition] Camera " + camera_id + " starting...", 'blue')
                        camera_thread = DeepFaceThread(camera_id, auth, people, collected_data_path, self.statueLabel)
                        # camera_thread.daemon = True
                        camera_thread.start()
                        self.threads.append(camera_thread)
                    except Exception as e:
                        print (e)

            # Wait till they finish their job
            for t in self.threads:
                t.join()

            count = 1


# CAMERA Class
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

        cprint('[Detection] Camera: {} started.'.format(self.camera_stream_link), 'green')

    def load_network_stream(self):
        """Verifies stream link and open new stream if valid"""

        def load_network_stream_thread():
            if self.verify_network_stream(self.camera_stream_link):
                self.capture = cv2.VideoCapture(self.camera_stream_link)
                self.capture.set(cv2.CAP_PROP_FPS, 1)
                self.fps = self.capture.get(cv2.CAP_PROP_FPS)
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
                frameId = self.capture.get(1)

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

                                if (frameId % math.floor(self.fps)*2 == 0):
                                    image = numpy.array(frame[int(y1):int(y2), int(x1):int(x2)])
                                    if image.any():
                                        cprint("[Detection] Camera " + str(self.camera_id) + " Collecting facing", 'green')
                                        if self.isFaceAdded(image):
                                            cprint('[Detection] Camera ' + str(self.camera_id) + ' No new Faces', 'green')
                                        else:
                                            self.total_faces.append(image)
                                            cprint('[Detection] Camera ' + str(self.camera_id) + ' New face detected. Total faces collected: ' + str(len(self.total_faces)), 'green')
                               
                                    
                                cv2.rectangle(frame, (int(x1), int(y1)), (int(x2), int(y2)), (0, 255, 0), 2)
                        if (frameId % math.floor(self.fps*4) == 0) or len(self.total_faces) >= 5:
                            if len(self.total_faces) >= 1:
                                try:
                                    cprint('[Detection] Camera ' + str(self.camera_id) + " Saving collected faces images to collected path.", 'green')
                                    save_array_of_images(self.total_faces, self.camera_id)
                                    self.total_faces.clear()
                                except Exception as e:
                                    print(e)

                        self.deque.append(frame)
                    else:
                        self.capture.release()
                        self.online = False
                else:
                    # Attempt to reconnect
                    cprint('attempting to reconnect' + str(self.camera_stream_link), 'green')
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

    

def restart_application():
    cmd = 'python -m Core.Camera.cameras'
    os.system(cmd)
    time.sleep(0.2)
    quit()
   

def exit_application():
    """Exit program event handler"""

    sys.exit(1)

def isMustRestart():
    """Checks if application must restart"""
    if auth.isMustRestart():
        auth.setMustRestart()
        time.sleep(0.5)
        restart_application()



row = 1
def set_cameras_on_layout(row):
    cameras_count = len(cameras)
    columns = math.ceil(cameras_count/2)
    column = 0
    for (index, camera) in enumerate(cameras):
        # Create camera widgets
        cam = CameraWidget(screen_width//columns, (screen_height-100)//columns, stream_link=camera['source'], camera_id=camera['id'], description=camera['description'])
        # Camera Thread for recognition

        # Add widgets to layout
        ml.addWidget(cam.get_video_frame(), row, column, 1, 1)

        column += 1
        if (column >= cameras_count/2):
            row += 1
            column = 0


ml = QtWidgets.QGridLayout()

if __name__ == '__main__':

    threading.Timer(5.0, isMustRestart).start()


    # Create main application window
    app = QtWidgets.QApplication([])
    app.setStyleSheet(qdarkstyle.load_stylesheet_pyqt())
    app.setStyle(QtWidgets.QStyleFactory.create("Cleanlooks"))
    mw = QtWidgets.QMainWindow()
    mw.setWindowTitle('Camera GUI')
    # mw.setWindowFlags(QtCore.Qt.FramelessWindowHint)


    cw = QtWidgets.QWidget()
    cw.setLayout(ml)
    mw.setCentralWidget(cw)
    mw.showMaximized()


    # Dynamically determine screen width/height
    screen_width = QtWidgets.QApplication.desktop().screenGeometry().width()
    screen_height = QtWidgets.QApplication.desktop().screenGeometry().height()

    set_cameras_on_layout(row)
    
    statueLabel = QtWidgets.QLabel('No face recognized yet.')
    statueLabel.setFont(QtGui.QFont('Arial', 20))

    ml.addWidget(statueLabel, row+2, 0, 1, 2)


    mw.show()

    recognition = Recognition(statueLabel)
    recognition.daemon = True
    recognition.start()

    QtWidgets.QShortcut(QtGui.QKeySequence('Ctrl+Q'), mw, exit_application)

    if(sys.flags.interactive != 1) or not hasattr(QtCore, 'PYQT_VERSION'):
        QtWidgets.QApplication.instance().exec_()
