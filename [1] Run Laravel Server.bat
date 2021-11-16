:: Name:     Run Laravel Server
:: Purpose:  Starting Laravel Server
:: Author:   gruceing@gmail.com
:: Revision: Novemeber 2021 - initial version


@echo off

cd Core
cd Laravel

ECHO Laravel reseting database...
php artisan migrate:reset

ECHO Laravel generating tables...
php artisan migrate

ECHO Laravel seeding database...
php artisan db:seed

pause