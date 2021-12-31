<?php

namespace App\Http\Livewire\Teacher;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use App\Models\{
    Classroom,
    Day
};

class AddLecture extends Component
{
    use LivewireAlert;
    

    public $dayID;
    public $stageID;
    public $unitID;
    public $subjectID;
    public $classroomID;
    public $start;
    public $end;

    public function add(){
        $teacher = auth()->user()->teacher()->first();
        $data = [
            'subject_id' => $this->subjectID,
            'unit_id' => $this->unitID,
            'classroom_id' => $this->classroomID,
            'day_id' => $this->dayID,
            'start' => $this->start,
            'end' => $this->end,
        ];
        $lecture = $teacher->lectures()->create($data);
        $this->alert('success' , 'Done');
        $this->emitTo('livewire.teacher.index', '$refresh');
    }
    public function render()
    {
        $teacher = auth()->user()->teacher()->first();
        $stages = $teacher->stages()->get();
        $units = $teacher->units()->where('stage_id' , $this->stageID)->get();
        $subjects = $teacher->subjects()->where('stage_id' , $this->stageID)->get();
        $days = Day::get();
        $classrooms = Classroom::get();

        return view('livewire.teacher.add-lecture' , 
            [
                'stages' => $stages,
                'units' => $units,
                'subjects' => $subjects,
                'days' => $days,
                'classrooms' => $classrooms,
            ]
        );
    }
}
