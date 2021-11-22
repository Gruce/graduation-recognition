import os
import threading
import tkinter
import customtkinter  # <- import the CustomTkinter module
from ..Library.api import Auth

from ..CameraRealTime.classes.cam_thread import Camera

auth = Auth()

cameras = auth.cameras()

root_tk = tkinter.Tk()  # create the Tk window like you normally do
root_tk.geometry("800x400")
root_tk.title("Cameras")
# root_tk.resizable(0, 0)

root_tk.columnconfigure(0, weight=1)
root_tk.columnconfigure(1, weight=0)
root_tk.columnconfigure(2, weight=1)
customtkinter.set_appearance_mode("Light")

def refresh():
    root_tk.destroy()
    os.popen("py -m Core.Camera.clientApp")

def start_camera(id, source):
    camera_thread = Camera(id, source)
    camera_thread.start()

    root_tk.destroy()
    os.popen("py -m Core.Camera.clientApp")

counter = 1
for index, camera in enumerate(cameras):
    l = customtkinter.CTkLabel(master=root_tk,
                               text="Camera " + str(camera["id"]) + " ( " +
                               str(camera["description"]) + ")", text_font=("Arial", 16))
    l.grid(
        row=index,
        column=0,
        sticky="esw",
        pady=10,
    )

    c = customtkinter.CTkLabel(master=root_tk, text_color="red", text="●", text_font=("Arial", 30))

    if (camera["state"] == 1):
        l.configure(text_color="green")
        c.configure(text_color="green")
        
    c.grid(row=index, column=1, pady=10)

    b = customtkinter.CTkButton(
        master=root_tk,
        text='Start',
        command=lambda index=index: start_camera(cameras[index]["id"], cameras[index]["source"]),
        width=120,
        height=32,
        border_width=0,
        corner_radius=8,
        text_font=("Arial", 16))

    b.grid(row=index, column=2, pady=10)

    counter += 1



b = customtkinter.CTkButton(
        master=root_tk,
        text='🗘',
        command=refresh,
        width=120,
        height=64,
        border_width=0,
        text_font=("Arial", 46))

b.grid(row=counter, columnspan=3, pady=75)


root_tk.mainloop()

