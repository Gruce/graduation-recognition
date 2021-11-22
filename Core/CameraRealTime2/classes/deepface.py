import os
import threading
import time
import cv2
from deepface import DeepFace
from retinaface import RetinaFace
import matplotlib.pyplot as plt
from cv2 import countNonZero, threshold
from pathlib import Path

from ...Library.utilities import Utilities
from ...Library.config import Config
from ...Library.api import Auth
import numpy as np
import pandas as pd


def get_time_now_milliseconds():
    return int(round(time.time() * 1000))

class DeepFaceRecognition():
    db_path = Config.db_path
    print(db_path)
    
    def __init__(self, camera_id, image):
        self.camera_id = camera_id
        self.auth = Auth()
        self.people = self.auth.people()
        self.image = image

    def recognize(self):
        try:
            start = time.perf_counter()

            filename = 'Core/CameraRealTime/tmp/' + str(get_time_now_milliseconds()) + str(".jpg")

            cv2.imwrite(filename, self.image)

            df = DeepFace.find(
                img_path = filename,
                model_name = 'ArcFace',
                db_path = self.db_path,
                enforce_detection = False,
                detector_backend = 'retinaface',
                align=True
            )

            df.head()
            print(df.head())
            id = Path(str(df.iloc[0].identity)).parts[-2] 
            person = Utilities.search_id(id, self.people)
            print(person)
            
            # Remove from temp
            os.unlink(filename)

        except Exception as e:
            print(e)
            # self.auth.tracking(self.camera_id, [-1], os.path.normpath(full_images[index]))


    
        
        