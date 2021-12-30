<?php

namespace App\Http\Livewire\Teacher;

use Livewire\Component;

class AbsenceStudent extends Component
{
    protected $listeners = ['$refresh', 'getStudentsAbsence'];

    public function getStudentsAbsence($students_absence){
        dd($students_absence);
    }
    public function render()
    {
        return view('livewire.teacher.absence-student');
    }
}
