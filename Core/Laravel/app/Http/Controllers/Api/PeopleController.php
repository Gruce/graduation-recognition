<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\{
    Person,
};

class PeopleController extends Controller
{
    public function people(){
        $people = Person::where('training_id', '!=', 0)->with(['trackings' => function($q){
            return $q->with('camera:id,description,source,state')->select('id' , 'person_id' , 'camera_id' , 'seen')->latest()->take(1);
        } , 'user'])->get(
            [
                'id',
                'user_id',
                'name',
                'training_id',
                'type'
            ]
        );

        return response()->json(['data' => $people]);
    }
}
