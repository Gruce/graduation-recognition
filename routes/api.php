<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\AuthController;
use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;

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
    // People
    Route::get('people', [ApiController::class, 'people']);
    Route::get('not_trained_people', [ApiController::class, 'not_trained_people']);
    
    Route::post('people/new', [ApiController::class, 'new_person']);

    // Cameras
    Route::get('cameras', [ApiController::class, 'cameras']);
    Route::post('cameras/state', [ApiController::class, 'camera_state']);

    // Trackings
    Route::post('tracking/new', [ApiController::class, 'new_track']);
});

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
