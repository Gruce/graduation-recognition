<?php

namespace App\Http\Livewire\Teacher\Units;

use Livewire\Component;

class TeacherUnits extends Component
{
    protected $listeners = ['$refresh', 'search'];

    public $search;
    
    public function search($text){
        $this->search = $text;
    }

    public function getUnitStudents($id){
        $this->emit('unitID', $id);
    }

    public function delete($id)
    {
        $teacher = auth()->user()->teacher()->first();
        $teacherID = $teacher->id;
        $unit = $teacher->units()->wherePivot('unit_id' , $id)->first();
        $tasks = $unit->tasks()->where('teacher_id' , $teacherID)->get();

        foreach($tasks as $task)
            if(count($task->units()->get()->toArray()) == 1) 
                $task->delete();
            else $task->units()->detach($id);

        $unit = $teacher->units()->detach($id);
        
        $this->emitTo('teacher.tasks.teacher-tasks', '$refresh');
    }

    public function render()
    {
        $search = '%' . $this->search . '%';
        $teacher = auth()->user()->teacher()->first();
        $units = $teacher->units()
                ->withCount('students')
                ->with(['section:id,name' , 'stage:id,name'])
                ->where('name' , 'LIKE' , $search)
                ->get();

        return view('livewire.teacher.units.teacher-units' , ['units' => $units]);
    }
}
