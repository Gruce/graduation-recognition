import sys
import time
import os


from ..Library.deepface_thread import DeepFaceThread
from ..Library.api import Auth
from ..Library.config import Config

# Auth to API
auth = Auth()

#collected
collected_path = Config.collected_data_path

def get_directories_in_directory(dir):
    return [os.path.join(dir, f) for f in os.listdir(dir) if not f.startswith('.')]

def get_files_in_directory(dir):
    return [os.path.join(dir, f) for f in os.listdir(dir) if not f.startswith('.')]

threads = []

# Thread for each camera
# Initialize not trained people
people = auth.people()
if (len(people) <= 0):
    print("\n There is no people. Please add person in Laravel Web App.")
    sys.exit()

while (True):
    for camera in get_directories_in_directory(collected_path):
        if (len(get_files_in_directory(os.path.normpath(camera))) > 0):
            try:
                camera_id = camera.replace(collected_path, '')
                print("**Camera " + camera_id + " thread started!**")
                camera_thread = DeepFaceThread(camera_id, auth, people, collected_path)
                camera_thread.start()
                threads.append(camera_thread)
            except Exception as e:
                print (e)

    # Wait till they finish their job
    for t in threads:
        t.join()

    count = 1


    # Remove model for the reason of detecting new unkown / known person
    # try:
    #     os.remove(os.path.normpath('/storage/app/public/db/representations_arcface.pkl')) 
    # except Exception as e:
    #     print (e)
    # break
