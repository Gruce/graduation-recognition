<?php

namespace App\Http\Livewire\Students;

use Livewire\Component;
use App\Models\Task;

class StudentTaskShow extends Component
{
    public $task_id;

    public function mount($task_id)
    {
        $this->task_id = $task_id;
    }

    public function render()
    {
        $task = Task::with([
            'files',
            'units' => function($unit){
                return $unit->with(['section:id,name' , 'stage:id,name'])->get();
            }
        ])->findOrFail($this->task_id);

        return view('livewire.students.student-task-show' , ['task' => $task]);
    }
}
