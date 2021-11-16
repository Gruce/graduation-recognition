import json
import os
import requests
from requests.api import head
import cv2

api = 'http://127.0.0.1:8000/api/'
email = 'gruceing@gmail.com'
password = '123456'


class Auth:
    jwt = ''
    headers = ''

    def __init__(self):
        x = requests.post(api + 'auth/login', data={
            'email'     : email,
            'password'  : password
        })

        if x.status_code == 200:
            self.jwt = x.json()['access_token']
            self.headers = {
                'Authorization' : 'Bearer ' + self.jwt,
                # 'Content-Type'  : 'application/json',
                # 'Accept'        : 'application/json'
            }
            

    # Camera
    def camera(self, camera_id, state):
        requests.post(api + 'cameras/state', data={
            'id'    : camera_id,
            'state' : state
        }, headers=self.headers)

    def cameras(self):
        res = requests.get(api + 'cameras', headers=self.headers)
        if res.status_code == 200:
            return res.json()["data"]
        else:
            return "error"


    # Tracking
    def tracking(self, camera_id, people, image):
        x = requests.post(api + 'tracking/new', files={
            'image': open(os.path.normpath(image), 'rb')
        }, data={
            'id'    : camera_id,
            'people': json.dumps(people),
        }, headers=self.headers)
        print("Tracked Uploaded.")


    # People
    def people(self):
        res = requests.get(api + 'people', headers=self.headers)
        if res.status_code == 200:
            return res.json()["data"]

    # Not Trained People
    def not_trained_people(self):
        res = requests.get(api + 'not_trained_people', headers=self.headers)
        if res.status_code == 200:
            return res.json()["data"]

    # New Person
    def new_person(self, people):
        x = requests.post(api + 'person/new', files={
            'image': open('tmp/camera_' + '.jpg', 'rb')
        }, data={
            'people': json.dumps(people),
        }, headers=self.headers)
        print("Tracked Uploaded.")

