<?php

namespace App\Http\Livewire\Teacher\Tasks;

use Livewire\Component;

class TeacherTasks extends Component
{
    public function render()
    {
        $teacher = auth()->user()->teacher()->first();
        $tasks = $teacher->tasks()->get();
        return view('livewire.teacher.tasks.teacher-tasks' , ['tasks' => $tasks]);
    }
}
