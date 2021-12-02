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
            return $q->with('camera:id,description')->select('id' , 'camera_id' , 'person_id' , 'last_seen');
        } , 'user:id,email'])->get(
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
