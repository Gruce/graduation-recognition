import os
from posixpath import normpath
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
from PIL import ImageFont
import arabic_reshaper
from bidi.algorithm import get_display


###########################################################################
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
    keep_all=False,
    device=device
).eval()

######################################################################################
db_path = Config.db_path

total_faces = []

fontpath = normpath("Core/Camera/JannaBold.ttf")

#########################################################################
############################ Functions ###############################
def get_milliseconds():
        return int(round(time.time() * 1000))

def if_directory_not_exists_create(directory):
    if not os.path.exists(directory):
        os.makedirs(directory)

def list_cameras():
    index = 0
    arr = []
    while True:
        cap = cv2.VideoCapture(index)
        if not cap.read()[0]:
            break
        else:
            arr.append(str(index))
        cap.release()
        index += 1
    return arr
#########################################################################
############################ API ###############################
from Core.Library.api import Auth

auth = Auth()


class CameraWidget(QtWidgets.QWidget):
    def __init__(self, width, height, stream_link="0", cameras=None, statue_label=None, name_edit=None, aspect_ratio=False, parent=None, deque_size=1):
        super(CameraWidget, self).__init__(parent)

        # Initialize deque used to store frames read from the stream
        self.deque = deque(maxlen=deque_size)

        # Slight offset is needed since PyQt layouts have a built in padding
        # So add offset to counter the padding 
        self.offset = 16
        self.screen_width = width - self.offset
        self.screen_height = height - self.offset
        self.maintain_aspect_ratio = aspect_ratio
        
        if (cameras is None):
            self.camera_stream_link = 0
        else:
            self.camera_stream_link = int(cameras.currentText())
            
        # Flag to check if camera is valid/working
        self.online = False
        self.capture = None
        self.video_frame = QtWidgets.QLabel()

        self.statueLabel = statue_label
        self.nameEdit = name_edit

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

    def refresh(self):
        total_faces.clear()
        self.statueLabel.setText("Waiting for a face...")
        self.update()
    
    def changeSource(self):
        self.camera_stream_link = int(cameras.currentText())
        self.load_network_stream()
        self.update()


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

    def get_frame(self):
        """Reads frame, resizes, and converts image to pixmap"""
        while True:
            try:
                if self.capture.isOpened() and self.online:
                    status, frame = self.capture.read()
                    if status:
                        # cv2.rectangle(frame, (0,0), (200,50), color=(0,0,0), thickness=-1)
                        rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
                        boxes, _ = mtcnn.detect(rgb)
                        # Draw faces
                        if boxes is not None:
                            for (x1, y1, x2, y2) in boxes:
                                image = numpy.array(frame[int(y1):int(y2), int(x1):int(x2)])

                                if len(total_faces) <= 5:
                                    if image.any():
                                        total_faces.append(image)
                                        self.statueLabel.setText("Captures: " + str(len(total_faces)))
                                else:
                                    self.statueLabel.setText("Done! Now press Train Person button.")

                                cv2.rectangle(frame, (int(x1), int(y1)), (int(x2), int(y2)), (0, 255, 0), 2)
                                if (self.nameEdit.text() != ""):
                                    try:
                                        text = self.nameEdit.text()
                                        reshaped_text = arabic_reshaper.reshape(text)
                                        bidi_text = get_display(reshaped_text) 
                                        img_pil = Image.fromarray(frame).convert('RGB')
                                        draw = ImageDraw.Draw(img_pil)
                                        fontTrueType = ImageFont.truetype(fontpath, 24)
                                        draw.text((int(x1),int(y2)), bidi_text,(0,255,0), font = fontTrueType)
                                        frame = numpy.array(img_pil)
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

            # Convert to pixmap and set to video frame
            self.img = QtGui.QImage(self.frame, self.frame.shape[1], self.frame.shape[0], QtGui.QImage.Format_RGB888).rgbSwapped()
            self.pix = QtGui.QPixmap.fromImage(self.img)
            self.video_frame.setPixmap(self.pix)

    def get_video_frame(self):
        return self.video_frame

    
    

def exit_application():
    """Exit program event handler"""

    sys.exit(1)

@QtCore.pyqtSlot()
def repeat(cam):
    cam.refresh()

@QtCore.pyqtSlot()
def changeSource(cam):
    cam.changeSource()

@QtCore.pyqtSlot()
def train(cam, name, _type):
    auth.new_person(name, total_faces, _type)
    cam.refresh()

    

    
if __name__ == '__main__':

    # Create main application window
    app = QtWidgets.QApplication([])
    app.setStyleSheet(qdarkstyle.load_stylesheet_pyqt())
    app.setStyle(QtWidgets.QStyleFactory.create("Cleanlooks"))
    mw = QtWidgets.QMainWindow()
    mw.setWindowTitle('Camera GUI')
    # mw.setWindowFlags(QtCore.Qt.FramelessWindowHint)

    ml = QtWidgets.QGridLayout()
    cw = QtWidgets.QWidget()
    cw.setLayout(ml)
    mw.setCentralWidget(cw)
    # mw.showMaximized()

    # Dynamically determine screen width/height
    screen_width = QtWidgets.QApplication.desktop().screenGeometry().width()
    screen_height = QtWidgets.QApplication.desktop().screenGeometry().height()


    name = QtWidgets.QLabel('Name')
    name.setFont(QtGui.QFont('Arial', 20))

    statueLabel = QtWidgets.QLabel('Waiting for a face...')
    statueLabel.setFont(QtGui.QFont('Arial', 20))
    repeatButton = QtWidgets.QPushButton('Repeat', )
    font = repeatButton.font()
    font.setPointSize(20)
    repeatButton.setFont(font) 


    nameEdit = QtWidgets.QLineEdit()
    font = nameEdit.font()
    font.setPointSize(20)
    nameEdit.setFont(font) 


    trainButton = QtWidgets.QPushButton('Train Person', )
    font = trainButton.font()
    font.setPointSize(20)
    trainButton.setFont(font) 


    sourceLabel = QtWidgets.QLabel('Camera Source: ')
    sourceLabel.setFont(QtGui.QFont('Arial', 20))

    cameras = QtWidgets.QComboBox() 
    cameras.addItems(list_cameras())
    font = cameras.font()
    font.setPointSize(20)
    cameras.setFont(font) 

    changeSourceButton = QtWidgets.QPushButton('Change', )
    font = changeSourceButton.font()
    font.setPointSize(20)
    changeSourceButton.setFont(font) 
    changeSourceButton.clicked.connect(lambda: changeSource(cam))


    cam = CameraWidget(screen_width//2, screen_height//2, cameras, statue_label=statueLabel, name_edit=nameEdit)

    repeatButton.clicked.connect(lambda: repeat(cam))

    typeComboBox = QtWidgets.QComboBox() 
    typeComboBox.addItems(['Visitor', 'Student', 'Teacher'])
    font = typeComboBox.font()
    font.setPointSize(20)
    typeComboBox.setFont(font) 



    trainButton.clicked.connect(lambda: train(cam, nameEdit.text(), str(typeComboBox.currentIndex())))


    ml.addWidget(sourceLabel, 1, 0, 1, 1)
    ml.addWidget(cameras, 1, 1, 1, 2)
    ml.addWidget(changeSourceButton, 1, 3, 1, 1)
    


    ml.addWidget(statueLabel, 2, 0, 1, 3)
    ml.addWidget(repeatButton, 2, 3, 1, 1)

    ml.addWidget(name, 3, 0)
    ml.addWidget(nameEdit, 3, 1)
    ml.addWidget(typeComboBox, 3, 2)
    ml.addWidget(trainButton, 3, 3)


    ml.addWidget(cam.get_video_frame(), 0, 0, 1, 4)

    mw.show()

    QtWidgets.QShortcut(QtGui.QKeySequence('Ctrl+Q'), mw, exit_application)

    if(sys.flags.interactive != 1) or not hasattr(QtCore, 'PYQT_VERSION'):
        QtWidgets.QApplication.instance().exec_()