<?php

namespace App\Http\Livewire\Stages;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use App\Models\{
    Stage,
    Section,
};

class StageAdd extends Component
{
    use LivewireAlert;
    public Stage $stage;
    public $sections;

    protected $rules = [
        'stage.name' => 'required|string|min:3',
        'stage.section_id' => 'required',
    ];

    public function save(){
        $this->validate();
        $this->stage->save();
        $this->alert('success', "Success!");
        $this->emitTo('stages.stages', '$refresh');
    }

    public function mount(){
        $this->stage = new Stage();
        $this->sections = Section::get(['id' , 'name']);
    }


    public function render()
    {
        return view('livewire.stages.stage-add');
    }
}
