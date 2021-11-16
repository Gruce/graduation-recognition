from os import urandom
import cv2
import numpy as np

class Utilities:
    @staticmethod
    def search_id(id, list):
        for item in list:
            if (int(item['id']) == int(id)):
                return item
        return False