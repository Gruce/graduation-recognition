<?php

namespace App\Http\Livewire\Students;

use Livewire\Component;
use App\Http\Controllers\Api\StudentController;

class StudentAbsences extends Component
{
    public function render()
    {
        $response = StudentController::absences();
        $subjects = $response->getData()->data;
        
        return view('livewire.students.student-absences' , ['subjects' => $subjects]);
    }
}
