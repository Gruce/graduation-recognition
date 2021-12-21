<?php

namespace App\Http\Livewire\Teacher;

use Livewire\Component;

class Index extends Component
{
    public $current_lecture;
    public function start(){
        dd('fd');
    }
    
    public function render()
    {
        $teacher = auth()->user()->teacher()->first();

        $units_lectures = $teacher->get_lectures()->get();

        $current_lecture = $teacher->current_lecture()->get(); // true for current lecture // 

        foreach($current_lecture as $lecture)
            if($lecture->lectures->toArray()){
                $this->current_lecture = $lecture;
                $current_lecture = $lecture->toArray();
            }

        return view('livewire.teacher.index' , 
            [
                'units_lectures' => $units_lectures,
                'current_lecture' => $current_lecture,
            ]
        );
    }
}
