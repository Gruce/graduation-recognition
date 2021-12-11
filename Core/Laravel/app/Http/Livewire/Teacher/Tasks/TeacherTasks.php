<?php

namespace App\Http\Livewire\Teacher\Tasks;

use Livewire\Component;
use Livewire\WithPagination;
use Jantinnerezo\LivewireAlert\LivewireAlert;

class TeacherTasks extends Component
{
    use WithPagination;
    use LivewireAlert;
    
    protected $listeners = ['$refresh', 'search'];

    public $search;

    public function search($text){
        $this->search = $text;
    }

    public function render()
    {
        $search = '%' . $this->search . '%';
        $teacher = auth()->user()->teacher()->first();
        $tasks = $teacher->tasks()->where('title' , 'LIKE' , $search)->paginate(15);
        return view('livewire.teacher.tasks.teacher-tasks' , ['tasks' => $tasks]);
    }
}
