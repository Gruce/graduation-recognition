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
        $teacher = auth()->user()->teacher()->first();

        $units_lectures = $teacher->get_lectures()->get();

        return view('livewire.teacher.index' , ['units_lectures' => $units_lectures]);
    }
}
