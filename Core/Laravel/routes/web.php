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
    UnkownPeople\UnkownPeople,
    Teachers\Teachers,
    Students\Students,
    Subjects\Subjects,
    Stages\Stages,
    Units\Units,
    Sections\Sections,
    Train\TrainNew,
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
        Route::get('/unkown-people', UnkownPeople::class)->name('unkown_people');
    });

    ## Teachers ##
    Route::group(['prefix' => 'teachers'] ,function(){
        Route::get('/', Teachers::class)->name('teachers');
    });

    ## Students ## 
    Route::group(['prefix' => 'students'] ,function(){
        Route::get('/', Students::class)->name('students');
    });


    ## Train ##
    Route::group(['prefix' => 'train'] ,function(){
        Route::get('/', TrainNew::class)->name('trainNew');
    });


    

    // Settings
    Route::group(['prefix' => 'settings'] ,function(){
        Route::get('/', Settings::class)->name('settings');

        ## Sections ## 
        Route::group(['prefix' => 'sections'] ,function(){
            Route::get('/', Sections::class)->name('sections');
        });
    
        ## Stages ## 
        Route::group(['prefix' => 'stages'] ,function(){
            Route::get('/', Stages::class)->name('stages');
        });
    
        ## Units ## 
        Route::group(['prefix' => 'units'] ,function(){
            Route::get('/', Units::class)->name('units');
        });
    
        ## Subjects ##
        Route::group(['prefix' => 'subjects'] ,function(){
            Route::get('/', Subjects::class)->name('subjects');
        });
    });

});

