<?php

namespace App\Http\Livewire\Students;

use Livewire\Component;
use Livewire\WithPagination;


class StudentTasks extends Component
{
    use WithPagination;

    public function render()
    {
        $student = auth()->user()->student()->first();
        $unit = $student->unit()->first();
        $tasks = $unit->tasks()->with('files')->paginate(15);

        return view('livewire.students.student-tasks' , ['tasks' => $tasks]);
    }
}
