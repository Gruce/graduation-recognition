import os
import threading
import time
import cv2
import deepface
from deepface import DeepFace
from retinaface import RetinaFace
import matplotlib.pyplot as plt
from cv2 import countNonZero, threshold
from pathlib import Path
import pandas as pd


from Core.Camera.lib.utilities import Utilities
from Core.Camera.lib.config import Config

ArcFace = DeepFace.build_model('ArcFace')


class DeepFaceThread(threading.Thread):
    db_path = Config.db_path
    
    def __init__(self, camera_id, auth, people, collected_path):
        threading.Thread.__init__(self)
        self.camera_id = camera_id
        self.auth = auth
        self.people = people
        self.collected_path = collected_path

    @staticmethod
    def get_images_in_dir(dir):
        return [os.path.join(dir, f) for f in os.listdir(dir)]
    

    def run(self):
        try:
            print("[Recognition] Camera " + str(self.camera_id) + " started.")

            start = time.perf_counter()
            counter = 1
            
            images = DeepFaceThread.get_images_in_dir(os.path.join(self.collected_path, str(self.camera_id)))

            for index, image in enumerate(images):
                print('[Recognition] Camera ' + str(self.camera_id) + ' - ', 'Image', counter)
                image_path = image
                df = DeepFace.find(
                    img_path = os.path.normpath(image),
                    model_name = 'ArcFace',
                    model = ArcFace,
                    db_path = self.db_path,
                    enforce_detection = False,
                    detector_backend = 'retinaface',
                    align=True
                )

                try:
                    df.head()

                    id = Path(str(df.iloc[0].identity)).parts[-2] 
                    person = Utilities.search_id(id, self.people)
                    if (person):
                        self.auth.tracking(self.camera_id, [person['id']])
                        print('[Recognition] Camera ' + str(self.camera_id) + ' - ' + " Person found: " + str(counter) + ", id = " + id)
                    else:
                        self.auth.tracking(self.camera_id, [-1], os.path.normpath(images[index]))
                        print('[Recognition] Camera ' + str(self.camera_id) + ' - ' + " Not found in the database: " + str(counter))


                except:
                    print('[Recognition] Camera ' + str(self.camera_id) + ' - ' + " Not found in the database: " + str(counter))
                    self.auth.tracking(self.camera_id, [-1], os.path.normpath(images[index]))

                # Remove Images
                my_dir = os.path.normpath(os.path.join(self.collected_path, str(self.camera_id)))
                for fname in os.listdir(my_dir):
                    if fname.startswith(os.path.basename(images[index].replace('\\',os.sep)).split('.')[0]):
                        os.remove(os.path.join(my_dir, fname))

                counter += 1
            end = time.perf_counter()
            print('[Recognition] Camera ' + str(self.camera_id), f' Finished in {round(end-start, 2)} second(s)')
        except Exception as e:
            print(e)
    
    
        
        