import pickle
import struct
import glob 
import time

import cv2
import numpy


import socket
import os
from _thread import *

from ..Library.config import Config


ServerSocket = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
ServerSocket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

host = Config.host
port = Config.port

ThreadCount = 0
try:
    ServerSocket.bind((host, port))
except socket.error as e:
    print(str(e))

print('Waitiing for a Connection..')
ServerSocket.listen(5)


def current_milli_time():
    return round(time.time() * 1000)


def recvall(sock, count):
    buf = b''
    while count:
        newbuf = sock.recv(count)
        if not newbuf: return None
        buf += newbuf
        count -= len(newbuf)
    return buf

def if_directory_not_exist_create(directory):
    if not os.path.exists(directory):
        os.makedirs(directory)

def threaded_client(connection):
    connection.send(str.encode('Welcome to the Server'))
    payload_size = struct.calcsize(">L")
    data = b""
    print("payload_size: {}".format(payload_size))


    camera_id = -1
    face = True
    file_name = ""

    while True:
        quit = False
        if camera_id == -1:
            camera_id = int(connection.recv(1024).decode('utf-8'))
            print("camera_id: {}".format(camera_id))
        else: 
            while len(data) < payload_size:
                print("Recv: {}".format(len(data)))
                data += connection.recv(4096)
                if len(data) <= 0:
                    break
            print("Done Recv: {}".format(len(data)))

            try:
                packed_msg_size = data[:payload_size]
                data = data[payload_size:]
                msg_size = struct.unpack(">L", packed_msg_size)[0]
                print("msg_size: {}".format(msg_size))
                while len(data) < msg_size:
                    data += connection.recv(4096)
                frame_data = data[:msg_size]
                data = data[msg_size:]
                frame=pickle.loads(frame_data, fix_imports=True, encoding="bytes")

                frame = cv2.imdecode(frame, cv2.IMREAD_COLOR)
                # cv2.imshow('ImageWindow', frame)
                dir = Config.collected_data_path + str(camera_id)
                if_directory_not_exist_create(dir)

                if face:
                    file_name = dir + '/' + str(current_milli_time())
                    cv2.imwrite(str(file_name) + '_face.jpg', frame)
                    face = False
                else:
                    cv2.imwrite(str(file_name) + '.jpg', frame)
                    face = True

            except OSError as err:
                print("OS error: {0}".format(err))
                quit = True
            except ValueError:
                print("Could not convert data to an integer.")
            except BaseException as err:
                print(f"Unexpected {err=}, {type(err)=}")
                quit = True

        if quit:
            connection.close()
            break

        
    
    


while True:
    Client, address = ServerSocket.accept()
    print('Connected to: ' + address[0] + ':' + str(address[1]))
    start_new_thread(threaded_client, (Client, ))
    ThreadCount += 1
    print('Thread Number: ' + str(ThreadCount))
ServerSocket.close()











