<?php

namespace App\Http\Livewire\Teacher\Tasks;

use Livewire\Component;
use Livewire\WithPagination;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use App\Http\Controllers\ActionController;

class TeacherTasks extends Component
{
    use WithPagination;
    use LivewireAlert;
    
    protected $listeners = ['$refresh', 'search'];

    public $search;

    public function search($text){
        $this->search = $text;
    }

    public function delete($model , $id){
        $response = ActionController::delete($model,$id);
        $alert = $response->getStatusCode() == 200 ? 'success' : 'warning';
        $this->alert($alert , $response->getData()->data);
        $this->emitTo('teacher.tasks.teacher-tasks', '$refresh');
    }

    public function render()
    {
        $search = '%' . $this->search . '%';
        $teacher = auth()->user()->teacher()->first();
        $tasks = $teacher->tasks()->with(
            [
                'files',
                'units' => function($unit) {
                    return $unit->with(['section:id,name' , 'stage:id,name']);
                }
            ]
        )->where('title' , 'LIKE' , $search)->paginate(15);

        return view('livewire.teacher.tasks.teacher-tasks' , ['tasks' => $tasks]);
    }
}
