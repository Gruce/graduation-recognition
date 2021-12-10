<?php

namespace App\Http\Livewire\Teacher;

use Livewire\Component;

class Index extends Component
{
    public function start(){
        dd('fd');
    }
    
    public function render()
    {
        return view('livewire.teacher.index');
    }
}
