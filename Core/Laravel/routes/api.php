<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Api\{
    PeopleController,
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

Route::group(['' => ''], function () {
    ## People ##
    Route::group(['prefix' => 'people'] ,function(){
        Route::get('', [PeopleController::class, 'people']);
    });

    ## Students ##
    Route::group(['prefix' => 'students'] ,function(){
        Route::get('/', [StudentController::class, 'students']);
    });

    ## Cameras ##
    Route::group(['prefix' => 'cameras'] ,function(){
        Route::get('/', [CameraController::class , 'cameras']);
        Route::post('/state', [CameraController::class, 'camera_state']);
    });

    ## Trackings ##
    Route::group(['prefix' => 'tracking'] ,function(){
        Route::post('/new', [TrackingController::class, 'new_track']);
    });



    Route::post('person', [ApiController::class, 'person']);
    Route::get('not_trained_people', [ApiController::class, 'not_trained_people']);
    Route::post('people/new', [ApiController::class, 'new_person']);
    Route::post('app_restart', [ApiController::class, 'app_restart']);



    Route::get('sections', [ApiController::class, 'sections']);


    Route::get('stages', [ApiController::class, 'stages']);


    Route::get('units', [ApiController::class, 'units']);
});

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
