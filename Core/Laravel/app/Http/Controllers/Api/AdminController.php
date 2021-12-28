<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Teacher;

class AdminController extends Controller
{
    public function teachers()
    {
        $teachers = Teacher::with(
            [
                'section',
                'user:id,name,email',
                'units' => function($unit){
                    return $unit->with(
                        [
                            'section:id,name',
                            'stage:id,name'
                        ]
                    )->select();
                },
                'subjects:id,name',
                'get_lectures',
            ]
        )->get();


        return response()->json(['data' => $teachers], 200);

    }
}
