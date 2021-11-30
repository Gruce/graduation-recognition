<?php

namespace App\Http\Livewire\Subjects;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use App\Models\{
    Subject,
    Section,
    Stage,
};

class SubjectAdd extends Component
{

    use LivewireAlert;

    public Subject $subject;
    public $section;
    public $stages;

    protected $rules = [
        'subject.name' => 'required|string|min:3',
        'subject.section_id' => 'required',
        'subject.stage_id' => 'required',
    ];

    public function save(){
        $this->validate();
        $this->subject->save();
        $this->alert('success', "Success!");
        $this->emitTo('subjects.subjects', '$refresh');
    }

    public function mount(){
        $this->subject = new Subject();
        $this->sections = Section::get(['id' , 'name']);
        $this->stages = Stage::get(['id','name','section_id']);
    }
    public function render()
    {
        return view('livewire.subjects.subject-add');
    }
}
