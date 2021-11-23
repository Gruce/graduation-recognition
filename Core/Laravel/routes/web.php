<?php

use Illuminate\Support\Facades\Route;

## Controllers ## 
use App\Http\Controllers\{
    TrackingController,
    PeopleController,
    ActionController,
};

## Livewire ##
use App\Http\Livewire\{
    People\People,
    Teachers\Teachers,
    Students\Students,
    Settings,
};

Route::group(['middleware' => ['auth:sanctum', 'verified']], function () {
    Route::view('/', 'dashboard')->name('dashboard');
    Route::get('/delete/{model}/{id}', [ActionController::class , 'delete'])->name('delete');
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

    ## Students ## 
    Route::group(['prefix' => 'students'] ,function(){
        Route::get('/', Students::class)->name('students');
    });


    Route::get('/settings', Settings::class)->name('settings');

});

