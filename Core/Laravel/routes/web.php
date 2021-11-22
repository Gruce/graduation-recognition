<?php

use Illuminate\Support\Facades\Route;

## Controllers ## 
use App\Http\Controllers\{
    TrackingController,
    PeopleController,
};

## Livewire ##
use App\Http\Livewire\{
    People\People,
    Teachers\Teachers,
    Settings,
};

Route::group(['middleware' => ['auth:sanctum', 'verified']], function () {
    Route::view('/', 'dashboard')->name('dashboard');

    // Trackings
    Route::get('/trackings/{id?}/{person?}', [TrackingController::class, 'main'])->name('trackings');

    ## People ##
    Route::group(['prefix' => 'people'] ,function(){
        Route::get('/', People::class)->name('people');
        Route::get('/unkown', [PeopleController::class, 'unkown'])->name('unkown_people');
    });

    ## Teachers ##
    Route::group(['prefix' => 'teachers'] ,function(){
        Route::get('/', Teachers::class)->name('teachers');
    });


    Route::get('/settings', Settings::class)->name('settings');

});

