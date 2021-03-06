<?php

use Illuminate\Support\Facades\Route;

###### Controllers ###### 
use App\Http\Controllers\{
    TrackingController,
    PeopleController,
    ActionController,
};

###### End Controllers ######

###### Livewire ######
    ## ADMIN ##
use App\Http\Livewire\Admin\{
    People\People,
    Schedule\Schedules,
    UnkownPeople\UnkownPeople,
    Teachers\Teachers,
    Students\Students,
    Subjects\Subjects,
    Stages\Stages,
    Units\Units,
    Sections\Sections,
    Train\TrainNew,
    Settings,
    JoinRequest\JoinRequests,
    Code\Codes,
};
    ## END ADMIN ##

    ## TEACHER ##
use App\Http\Livewire\Teacher\{
    Index,
    Students\TeacherStudents,
    Units\TeacherUnits,
    Tasks\TeacherTasks,
    Tasks\TaskSend,
    Tasks\TaskShow,
    Subjects\TeacherSubject,
};
    ## END TEACHER ##

    ## STUDENT ##
use App\Http\Livewire\Students\{
    StudentIndex,
    StudentTasks,
    StudentTaskShow,
    StudentAbsences,
    ChangeUnit,
};
    ## END STUDENT ##

use App\Http\Livewire\Admin\Join;
###### End Livewire ######

Route::group(['middleware' => ['auth:sanctum', 'verified']], function () {

    Route::view('/', 'dashboard')->name('dashboard');
    Route::get('/delete/{model}/{id}', [ActionController::class , 'delete'])->name('delete'); // main delete
    
    #### ADMIN ####
    Route::group(['prefix' => 'admin' , 'middleware' => 'admin'] ,function(){
         // Trackings
        Route::get('/trackings/{id?}/{person?}', [TrackingController::class, 'main'])->name('trackings');

        ## People ##
        Route::group(['prefix' => 'people'] ,function(){
            Route::get('/', People::class)->name('people');
            Route::get('/unkown-people', UnkownPeople::class)->name('unkown_people');
        });
        ## End People ##

        ## Teachers ##
        Route::group(['prefix' => 'teachers'] ,function(){
            Route::get('/', Teachers::class)->name('teachers');
        });
        ## End Teachers ##

        ## Students ## 
        Route::group(['prefix' => 'students'] ,function(){
            Route::get('/', Students::class)->name('students');
        });
        ## End Students ## 

        ## Train ##
        Route::group(['prefix' => 'train'] ,function(){
            Route::get('/', TrainNew::class)->name('trainNew');
        });
        ## End Train ##

        ## Settings ##
        Route::group(['prefix' => 'settings' , 'middleware' => 'admin'] ,function(){
            Route::get('/', Settings::class)->name('settings');
    
            # Sections # 
            Route::group(['prefix' => 'sections'] ,function(){
                Route::get('/', Sections::class)->name('sections');
            });
        
            # Stages # 
            Route::group(['prefix' => 'stages'] ,function(){
                Route::get('/', Stages::class)->name('stages');
            });
        
            # Units # 
            Route::group(['prefix' => 'units'] ,function(){
                Route::get('/', Units::class)->name('units');
            });
        
            # Subjects #
            Route::group(['prefix' => 'subjects'] ,function(){
                Route::get('/', Subjects::class)->name('subjects');
            });

            # schedule #
            Route::group(['prefix' => 'schedule'] ,function(){
                Route::get('/', Schedules::class)->name('schedule');
            });

            # schedule #
            Route::group(['prefix' => 'codes'] ,function(){
                Route::get('/', Codes::class)->name('codes');
            });
        });

        ## End Settings ##

        # JoinRequests #
        Route::group(['prefix' => 'join'] ,function(){
            Route::get('/requests', JoinRequests::class)->name('join_requests');
        });
    });
    #### END ADMIN ####

    ################################################################

    #### TEACHER ####

    Route::group(['prefix' => 'teacher' , 'middleware' => 'teacher'] ,function(){
        Route::get('/students/{unitID?}', TeacherStudents::class)->name('teacher_students');
        Route::get('/units', TeacherUnits::class)->name('teacher_unit');
        Route::get('/subjects', TeacherSubject::class)->name('teacher_subjects');
        Route::get('/tasks', TeacherTasks::class)->name('teacher_task');
        Route::get('/task-Show/{task_id}', TaskShow::class)->name('teacher_task_show');
    });

    #### END TEACHER ####

    ################################################################

    #### STUDENT ####

    Route::group(['prefix' => 'student' , 'middleware' => 'student'] ,function(){
        Route::get('/tasks', StudentTasks::class)->name('student_task');
        Route::get('/change-unit', ChangeUnit::class)->name('change_unit');
        Route::get('/task-Show/{task_id}', StudentTaskShow::class)->name('task_show');
        Route::get('/absences', StudentAbsences::class)->name('student_absences');
    });

    #### END STUDENT ####

});


Route::get('/join', [ActionController::class, 'join_req'])->name('join-req');
Route::post('/join-send', [ActionController::class, 'join'])->name('join');


