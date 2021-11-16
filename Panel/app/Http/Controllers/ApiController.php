<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

use App\Models\User;
use App\Models\Person;
use App\Models\Camera;
use App\Models\Tracking;

class ApiController extends Controller
{

    // USER
    public function people(){
        return response()->json([
            'data' => Person::where('training_id', '!=', 0)->get(['id', 'name', 'training_id', 'type'])
        ], 200);
    }

    public function not_trained_people(){
        return response()->json([
            'data' => Person::where('training_id', 0)->get(['id', 'name', 'training_id', 'type'])
        ], 200);
    }

    public function new_person(Request $req){
        $user = new Person;

        $user->name = $request->name;
        $user->training_id = $request->training_id;
        $user->type = $request->type;

        $user->save();

        return response()->json(['data' => 'Success.'], 200);
    }


    // CAMERA
    public function cameras(){
        return response()->json([
            'data' => Camera::get()
        ], 200);
    }

    public function camera_state(Request $req){
        $camera = Camera::find($req->id);
        $camera->update([
            'state' => $req->state
            // 'state' => !$camera->state
        ]);

        return response()->json(['data' => 'Success.'], 200);
    }

    // Tracking
    public function new_track(Request $req){
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
