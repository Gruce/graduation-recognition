<?php

namespace App\Http\Livewire\Students;

use Livewire\Component;
use App\Http\Controllers\Api\StudentController;
use App\Models\Day;
class StudentIndex extends Component
{
    public function render()
    {
        $response = StudentController::lectures();
        $lectures = $response->getData()->data;
        $days = Day::get(['id' , 'name']);

        $response = StudentController::current_lecture();
        if($response->getStatusCode() == 200)
            $current_lecture = $response->getData()->data;
        else $current_lecture = [];

        return view('livewire.students.student-index' , 
            [
                'lectures' => $lectures,
                'days' => $days,
                'current_lecture' => $current_lecture
            ]
        );
    }
}
