<?php

namespace App\Http\Livewire\Sections;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use App\Models\{
    Section,
};

class SectionAdd extends Component
{
    use LivewireAlert;
    public Section $section;

    protected $rules = [
        'section.name' => 'required|string|min:3',
    ];

    public function save(){
        $this->validate();
        $this->section->save();
        $this->alert('success', "Success!");
        $this->emitTo('sections.sections', '$refresh');
    }

    public function mount(){
        $this->section = new Section();
    }

    public function render()
    {
        return view('livewire.sections.section-add');
    }
}
