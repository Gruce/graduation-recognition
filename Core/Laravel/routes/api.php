<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Api\{
    UserController,
    AdminController,
    LectureController,
    PeopleController,
    TeacherController,
    StudentController,
    CameraController,
    TrackingController,
};
use App\Http\Controllers\{
    AuthController,
    ApiController,
    Controller,
};

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['middleware' => 'api','prefix' => 'auth'], function ($router) {

    Route::post('login', [AuthController::class, 'login']);
    Route::post('logout', [AuthController::class, 'logout']);
    Route::post('refresh', [AuthController::class, 'refresh']);
    Route::post('me', [AuthController::class, 'me']);

});

Route::group(['middleware' => 'auth'], function () {
    #### ADMIN ####
    Route::group(['prefix' => 'admin' , 'middleware' => 'admin'] ,function(){
        ## Users ##
        Route::group(['prefix' => 'users'] ,function(){
            Route::get('/', [UserController::class, 'users']);
            Route::post('/new' , [UserController::class , 'new_user']);
        });

        ## END USER ##

        Route::get('/sections', [ApiController::class, 'sections']);
        Route::get('/stages', [ApiController::class, 'stages']);
        Route::get('/units', [ApiController::class, 'units']);
        Route::get('/classrooms', [ApiController::class, 'classroom']);

        ## lectures ##
        Route::group(['prefix' => 'lectures'] ,function(){
            Route::get('/days', [LectureController::class, 'days']);
            Route::get('/{day?}', [LectureController::class, 'lectures']);
        });

        ## end lectures ##

        ## Students ##
        Route::group(['prefix' => 'students'] ,function(){
            Route::get('/', [StudentController::class, 'students']);
        });

        ## End Students ##

        ## teachers ##
        Route::group(['prefix' => 'teachers'] ,function(){
            Route::get('/', [AdminController::class, 'teachers']);
        });

        ## End teachers ##

    });

    #### END ADMIN ####

    ## People ##
    // Route::group(['prefix' => 'people'] ,function(){
    //     Route::get('', [PeopleController::class, 'people']);
    // });


    #### Teachers ####
    Route::group(['prefix' => 'teacher' , 'middleware' => 'teacher'] ,function(){
        Route::get('/my-students', [TeacherController::class, 'my_students']);
        Route::get('/info', [TeacherController::class, 'info']);
        Route::get('/units', [TeacherController::class, 'units']);
        Route::get('/unit/{id}', [TeacherController::class, 'unit_student']);
        Route::get('/tasks' , [TeacherController::class, 'tasks']);
        Route::get('/lectures/{day?}' , [TeacherController::class, 'lectures']);
        Route::post('/send-task' , [TeacherController::class, 'send_task']);
    });

    #### END Teachers ####


    #### Student ####
    Route::group(['prefix' => 'student' , 'middleware' => 'student'] ,function(){
        Route::get('/subjects', [StudentController::class, 'subjects']);
        Route::get('/subject-tasks/{subject_id}/{teacher_id}', [StudentController::class, 'subject_tasks']);
        Route::get('/lectures/{today?}' , [StudentController::class, 'lectures']);
    });

    #### End Student ####


    ## Cameras ##
    Route::group(['prefix' => 'cameras'] ,function(){
        Route::get('/', [CameraController::class , 'cameras']);
        Route::post('/state', [CameraController::class, 'camera_state']);
    });


    ## Trackings ##
    Route::group(['prefix' => 'tracking'] ,function(){
        Route::post('/new', [TrackingController::class, 'new_track']);
    });

    // Route::post('person', [ApiController::class, 'person']);
    // Route::get('not_trained_people', [ApiController::class, 'not_trained_people']);
    // Route::post('people/new', [ApiController::class, 'new_person']);
    // Route::post('app_restart', [ApiController::class, 'app_restart']);

});

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
