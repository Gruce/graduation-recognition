# import required libraries
import os
from pathlib import Path
import time
import _thread
from numpy import e
from vidgear.gears import NetGear
from imutils import build_montages
from deepface import DeepFace

import random
import cv2

from ..Library.config import Config
from ..Library.api import Auth
from ..Library.utilities import Utilities


from Core.CameraRealTime.classes.detection import Detection

# activate multiserver_mode
options = {"multiserver_mode": True}

# Define NetGear Client at given IP address and assign list/tuple 
# of all unique Server((5566,5567) in our case) and other parameters
# !!! change following IP address '192.168.x.xxx' with yours !!!
client = NetGear(
    address="192.168.1.101",
    port=(5566, 5567),
    protocol="tcp",
    pattern=1,
    receive_mode=True,
    **options
)

# Define received frame dictionary
frame_dict = {}
count = 0

detection = Detection()
db_path = Config.db_path
auth = Auth()
people = auth.people()

def recognize(filename):
    print(filename)
    df = DeepFace.find(
        img_path = os.path.normpath(filename),
        model_name= 'ArcFace',
        db_path = db_path,
        enforce_detection = False,
        detector_backend = 'mtcnn',
        align=True,
    )

    df.head()
    print(df.head())

    os.unlink(filename)


def get_time_now_milliseconds():
    return int(round(time.time() * 1000))


# loop over until Keyboard Interrupted
while True:

    try:
        # receive data from network
        data = client.recv()

        # check if data received isn't None
        if data is None:
            break

        # extract unique port address and its respective frame
        unique_address, camera_id, frame = data
        # {do something with the extracted frame here}
        count += 1

        img = frame
        if (count >= 100):
            [filename, img] = detection.detect(frame)
            try:
                if filename:
                    _thread.start_new_thread( recognize, (filename, ) )
            except Exception as e:
                print(e)

            count = 0
        
        # get extracted frame's shape
        (h, w) = frame.shape[:2]

        # update the extracted frame in the received frame dictionary
        frame_dict[unique_address] = frame

        # build a montage using data dictionary
        montages = build_montages(frame_dict.values(), (w, h), (2, 1))

        
        # display the montage(s) on the screen
        for (i, montage) in enumerate(montages):
            
            cv2.imshow("Camera {}".format(camera_id), frame)

        # check for 'q' key if pressed
        key = cv2.waitKey(1) & 0xFF
        if key == ord("q"):
            break

    except KeyboardInterrupt:
        break

# close output window
cv2.destroyAllWindows()

# safely close client
client.close()