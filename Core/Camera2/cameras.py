import os
from PyQt5 import QtCore, QtGui, QtWidgets
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
    factor=0.5,
    keep_all=True,
    device=device
).eval()
###########################################################################
##########################  Face Recognition : deepface  #############################
from deepface import DeepFace
from deepface.basemodels import ArcFace, Facenet512
import pandas as pd

db_path = Config.db_path

def verify(faces, face):
    try: 
        for _face in faces:
            result = DeepFace.verify(img1_path = _face, img2_path = face, model_name= 'Facenet512', model = Facenet512,)
            return result[0]
    except Exception as e:
        return True


def recognize(filenames):
    try:
        for filename in filenames:
            df = DeepFace.find(
                img_path = os.path.normpath(filename),
                model_name= 'ArcFace',
                # distance_metric='cosine',
                db_path = db_path,
                enforce_detection = False,
                detector_backend = 'mtcnn',
                align=True,
            )
            df.head()
            os.remove(filename)
            return df.iloc[0].identity
    except Exception as e:
        print(e)
    # if df.shape[0] > 0:
    #     match = df.iloc[0].identity
    #     print(match)
    #     return match
    # else:
    #     return "Unkown"

##########################  Face Recognition : pytorch  #############################
# resnet = InceptionResnetV1(pretrained='vggface2', device=device).eval()

#########################################################################

def if_directory_not_exists_create(directory):
    """Create directory if it doesn't exist"""

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
                    # Read next frame from stream and insert into deque
                    status, frame = self.capture.read()
                    if status:
                        # # # Any modifications to frame
                        try:
                            frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
                            # # Detect faces
                            boxes, _ = mtcnn.detect(frame)
                            frame = cv2.cvtColor(frame, cv2.COLOR_RGB2BGR)
                            # # Draw faces
                            if boxes is not None:
                                for box in boxes:
                                    x1, y1, x2, y2 = box.astype(int)
                                    dir = 'Core/Camera2/tmp/' + str(self.camera_id)
                                    
                                    if_directory_not_exists_create(dir)
                                    filename = dir + '/' + str(datetime.now().microsecond) + '.jpg'
                                    cv2.imwrite(filename, frame[y1:y2, x1:x2])

                                    if verify(self.total_faces, filename):
                                        try:
                                            os.remove(filename)
                                        except OSError as e:
                                            print ("Error code:"), e.code 
                                    else:
                                        self.total_faces.append(filename)
                                        print('New face detected')
                                        print(len(self.total_faces))
                                    
                                        
                                    cv2.rectangle(frame, (x1, y1), (x2, y2), (0, 255, 0), 2)
                        except Exception as e:
                            print(e)

                        if len(self.total_faces) >= 1:
                            try:
                                _thread.start_new_thread(recognize, (self.total_faces,))
                            except Exception as e:
                                print(e)
                            self.total_faces.clear()

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