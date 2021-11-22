import random
import time
from mtcnn import MTCNN
import cv2

def get_time_now_milliseconds():
    return int(round(time.time() * 1000))
    
class Detection:
    def detect(self, frame):
        try: 
            detector = MTCNN()
            img = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
            result = detector.detect_faces(img)

            x, y, w, h = result[0]['box']
            roi_color = img[y:y + h, x:x + w]
            filename = 'Core/CameraRealTime/tmp/' + str(get_time_now_milliseconds()) + str(".jpg")
            cv2.imwrite(filename, cv2.cvtColor(roi_color, cv2.COLOR_RGB2BGR))

            bounding_box = result[0]['box']
            keypoints = result[0]['keypoints']

            
            cv2.rectangle(img,
              (bounding_box[0], bounding_box[1]),
              (bounding_box[0]+bounding_box[2], bounding_box[1] + bounding_box[3]),
              (0,155,255),
              2)
            cv2.circle(img,(keypoints['left_eye']), 2, (0,155,255), 2)
            cv2.circle(img,(keypoints['right_eye']), 2, (0,155,255), 2)
            cv2.circle(img,(keypoints['nose']), 2, (0,155,255), 2)
            cv2.circle(img,(keypoints['mouth_left']), 2, (0,155,255), 2)
            cv2.circle(img,(keypoints['mouth_right']), 2, (0,155,255), 2)
            print('Face')
            

            return [filename, img]
        except Exception as e:
                print(e)
