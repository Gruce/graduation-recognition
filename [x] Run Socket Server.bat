:: Name:     Run Socket Server
:: Purpose:  Starting Socket Server
:: Author:   gruceing@gmail.com
:: Revision: Novemeber 2021 - initial version

@echo off

ECHO Socket Server Starting...

python -m Core.Camera.server

pause