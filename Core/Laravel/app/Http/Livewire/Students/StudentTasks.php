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
        $unit = $student->unit()->with(['tasks' => function ($task){
            return $task->with('files')->paginate(10);
        }])->first();

        return view('livewire.students.student-tasks' , ['units' => $unit]);
    }
}
