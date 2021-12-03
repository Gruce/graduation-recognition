<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Camera;

class CameraController extends Controller
{
    public function cameras(){
        return response()->json([
            'data' => Camera::where('state', '!=', 0)->get()
        ], 200);
    }

    public function camera_state(Request $req){
        $camera = Camera::find($req->id);
        $camera->update([
            'state' => $req->state
        ]);

        return response()->json(['data' => 'Success.'], 200);
    }
}
