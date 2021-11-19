<?php

namespace App\Http\Livewire;

use Illuminate\Http\Request;
use Livewire\Component;
use App\Models\Teacher;

class Teachers extends Component
{
    public function render(){
        return view('livewire.teachers')->layout('layouts.app');
    }
}
