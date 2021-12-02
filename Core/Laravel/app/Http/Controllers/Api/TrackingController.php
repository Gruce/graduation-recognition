<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\{
    Tracking,
    Person,
};

class TrackingController extends Controller
{
    public function new_track(Request $req){
        $file = '';

        if ($req->image)
            $file = $req->image->store('tracking/' . date("Y-m-d"), 'public');

        foreach (json_decode($req->people) as $person){
            if ($person == -1){
                $user = new Person;
                $user->name = '';
                $user->training_id = 1;
                $user->type = -1;
                $user->save();
                $user->name = 'Unkown ' . $user->id;
                $user->save();
                $person = $user->id;
                
                $file = $req->image->store('db/' . $user->id, 'public');
            }

            $track              = new Tracking;
            $track->person_id   = $person;
            $track->camera_id   = $req->id;
            $track->image_path  = $file;
            $track->save();
        }
        
        return response()->json(['data' => 'Success.'], 200);
    }
}
