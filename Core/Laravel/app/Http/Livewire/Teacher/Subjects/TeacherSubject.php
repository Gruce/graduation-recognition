<?php

namespace App\Http\Livewire\Teacher\Subjects;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;

class TeacherSubject extends Component
{
    use LivewireAlert;
    protected $listeners = ['$refresh', 'search'];

    public $search;
    public function search($text){
        $this->search = $text;
    }

    public function delete($id){
        $teacher = auth()->user()->teacher()->first();
        $teacher->subjects()->detach($id);
        $this->alert('success' , 'Done');
        $this->emitTo('teacher.subjects.teacher-subject', '$refresh');
    }

    public function render()
    {
        $search = '%' . $this->search . '%';
        $teacher = auth()->user()->teacher()->first();
        $subjects = $teacher->subjects()->where('name' , 'LIKE' , $search)->with('stage:id,name')->get();

        return view('livewire.teacher.subjects.teacher-subject' , 
            [
                'subjects' => $subjects,
            ]
        );
    }
}
