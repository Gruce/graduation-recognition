:: Name:     Reset Database
:: Purpose:  Resetting database and reseeding it with default values
:: Author:   gruceing@gmail.com
:: Revision: Novemeber 2021 - initial version

@echo off

ECHO Laravel Starting...
cd Core
cd Laravel

set ip_address_string="IPv4 Address"
for /f "usebackq tokens=2 delims=:" %%f in (`ipconfig ^| findstr /c:%ip_address_string%`) do php artisan serve --host %%f





pause