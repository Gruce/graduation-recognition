ECHO Flutter Cleaning

cd Core
cd MobApp
set ip_address_string="IPv4 Address"
for /f "usebackq tokens=2 delims=:" %%f in (`ipconfig ^| findstr /c:%ip_address_string%`) do flutter run -d chrome --web-port 9387 --web-hostname %%f --no-sound-null-safety 


pause