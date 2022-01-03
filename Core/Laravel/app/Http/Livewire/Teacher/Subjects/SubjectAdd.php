<?php

namespace App\Http\Livewire\Teacher\Subjects;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use App\Models\{
    Stage,
    Subject,
};

class SubjectAdd extends Component
{
    use LivewireAlert;

    public $stageID;
    public $subjectID;

    public function add()
    {
        $teacher = auth()->user()->teacher()->first();
        $teacher->subjects()->syncWithoutDetaching($this->subjectID);
        $this->alert('success' , 'Done');
        $this->emitTo('teacher.subjects.teacher-subject', '$refresh');
    }

    public function render()
    {
        $teacher = auth()->user()->teacher()->first();

        $stages = Stage::where('section_id' , $teacher->section_id)->get();
        $subjects = Subject::where('stage_id' , $this->stageID)->get();

        return view('livewire.teacher.subjects.subject-add' , 
            [
                'stages' => $stages,
                'subjects' => $subjects,
            ]
        );
    }
}
