class Config:
    # def __init__(self):
    ## Socket ##
    host = '192.168.0.111'
    port = 1233

    admin_email = 'gruceing@gmail.com'
    admin_password = '123456'

    ## Camera ##
    collected_data_path = 'Core/Laravel/storage/app/public/collected/' # Collected images path from cameras

    ## Database ##
    db_path = 'Core/Laravel/storage/app/public/db/' # Database path for regonized faces
    
    ## Cascade ##
    cascade_path = 'Core/Library/Cascades/' # Cascade path for face detection
