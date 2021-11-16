<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PeopleController extends Controller
{
    public function main(Request $req){
        $id = null;
        if ($req->id) $id = $req->id;
        
        return view('people', ['id' => $id]);
    }

    public function unkown(){
        return view('unkown-people');
    }

    
}
