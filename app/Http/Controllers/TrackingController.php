<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TrackingController extends Controller
{
    public function main(Request $req){
        $id = null;
        $person_id = null;
        if ($req->id) $id = $req->id;
        if ($req->person) $person_id = $req->person;
        
        return view('trackings', ['id' => $id, 'person_id' => $person_id]);
    }
}
