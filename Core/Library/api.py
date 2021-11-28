import json
import os
import requests
from requests.api import head
import cv2

api = 'http://192.168.99.249:8000/api/'
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
    def tracking(self, camera_id, people, image=None):
        files = {'image': open(os.path.normpath(image), 'rb')} if image else None

        x = requests.post(api + 'tracking/new', files=files, data={
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

    @staticmethod
    def if_directory_not_exists_create(directory):
        if not os.path.exists(directory):
            os.makedirs(directory)
        
    # New Person
    def new_person(self, name, total_faces, _type):        
        resp = requests.post(api + 'people/new', data={
            'name': name,
            'type': _type
        }, headers=self.headers)


        person_id = resp.json()['id']
        directory = 'Core/Laravel/storage/app/public/db/'
        print(person_id)
        self.if_directory_not_exists_create(directory + str(person_id))

        for (index, face) in enumerate(total_faces):
            # if(face is not None):
            print(face)
            cv2.imwrite(directory + str(person_id) + '/' + str(index) + '.jpg', face)

        os.remove(os.path.normpath(directory + 'representations_arcface.pkl')) if os.path.exists(directory + 'representations_arcface.pkl') else None

