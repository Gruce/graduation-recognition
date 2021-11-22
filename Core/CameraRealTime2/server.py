# import libraries
from vidgear.gears import NetGear
from vidgear.gears import CamGear
from vidgear.gears.helper import reducer

# Open suitable video stream (webcam on first index in our case)
stream = CamGear(source=1).start()

# activate multiserver_mode
options = {
    "multiserver_mode": True,
    # "jpeg_compression": True,
    # "jpeg_compression_quality": 90
}

server = NetGear(
    address="192.168.1.101", port="5566", protocol="tcp", pattern=1, **options
)

camera_id = 1

# loop over until Keyboard Interrupted
while True:

    try:
        # read frames from stream
        frame = stream.read()

        # check for frame if not None-type
        if frame is None:
            break

        # frame = reducer(frame, percentage=30)

        # {do something with the frame here}

        # send frame to server
        server.send(frame, message=camera_id)

    except KeyboardInterrupt:
        break

# safely close video stream
stream.stop()

# safely close server
server.close()