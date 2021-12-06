<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

use App\Models\User;
use App\Models\Person;
use App\Models\Camera;
use App\Models\Tracking;
use App\Models\Setting;
use App\Models\Section;
use App\Models\Stage;
use App\Models\Unit;



class ApiController extends Controller
{

    // USER
    public function people(){
        return response()->json([
            'data' => Person::where('training_id', '!=', 0)->get(['id', 'name', 'training_id', 'type'])
        ], 200);
    }

    public function person(Request $req){
        $person = Person::with('trackings.camera')->find($req->id);

        $images = [];
        $image = '';
        
        foreach (glob(Storage::disk('public')->path('db/' . $person->id) . '/*.png') as $filename) {
            $filename = str_replace(Storage::disk('public')->path('db/' . $person->id) . '/', '', $filename);
            array_push($images, Storage::disk('public')->url('db/' . $person->id . '/' . $filename));
        }
        if (count($images) > 0)
            $image = $images[0];

        return response()->json([
            'data' => $person,
            'image' => $image
        ], 200);
    }

    public function not_trained_people(){
        return response()->json([
            'data' => Person::where('training_id', 0)->get(['id', 'name', 'training_id', 'type'])
        ], 200);
    }

    public function new_person(Request $req){
        $user = new Person;

        $user->name = $req->name;
        $user->training_id = 1;
        $user->type = $req->type;

        $user->save();

        return response()->json(['id' => $user->id], 200);
    }


    // CAMERA
    public function cameras(){
        return response()->json([
            'data' => Camera::where('state', '!=', 0)->get()
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
        $file = '';
        $name = '';
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

                $name = Person::find($person)->name;

                $file = $req->image->store('db/' . $user->id, 'public');
            } else {
                $name = Person::find($person)->name;
            }

            $track              = new Tracking;
            $track->person_id   = $person;
            $track->camera_id   = $req->id;
            $track->image_path  = $file;
            $track->save();
        }
        
        return response()->json(['data' => $name], 200);
    }

    public function get_statue(){
        $x = Setting::where('key' , 'app_restart')->first();
        return response()->json(['data' => $x->value], 200);
    }

    public function set_statue(){
        $x = Setting::where('key' , 'app_restart')->first();
        $x->update(['value' => '0']);
        return response()->json(['data' => 'Success'], 200);
    }


    public function sections(){
        return response()->json([
            'data' => Section::get(['id','name'])
        ], 200);
    }
    public function stages(){
        return response()->json([
            'data' => Stage::with('section:id,name')->get(['id','name','section_id'])
        ], 200);
    }
    public function units(){
        return response()->json([
            'data' => Unit::with(['section:id,name','stage:id,name,section_id'])->get(['id','name','section_id','stage_id'])
        ], 200);
    }
}
