<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TrackingController;
use App\Http\Controllers\PeopleController;
use App\Http\Livewire\Teachers;
use App\Http\Livewire\Settings;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::group(['middleware' => ['auth:sanctum', 'verified']], function () {
    Route::get('/dashboard', function () { return view('dashboard'); })->name('dashboard');
    
    // Trackings
    Route::get('/trackings/{id?}/{person?}', [TrackingController::class, 'main'])->name('trackings');

    // People
    Route::get('/people/{id?}', [PeopleController::class, 'main'])->name('people');

    // Unkown people
    Route::get('/peopleUnkown', [PeopleController::class, 'unkown'])->name('unkown_people');

    // Teachers
    Route::get('/teachers/{id?}', Teachers::class)->name('teachers');

    // Settings
    Route::get('/settings', Settings::class)->name('settings');
});

