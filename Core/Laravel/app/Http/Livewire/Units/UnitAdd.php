<?php

namespace App\Http\Livewire\Units;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use App\Models\{
    Stage,
    Section,
    Unit,
};

class UnitAdd extends Component
{
    use LivewireAlert;
    public Unit $unit;
    public $sections;
    public $stages;

    protected $rules = [
        'unit.name' => 'required|string|min:1',
        'unit.section_id' => 'required',
        'unit.stage_id' => 'required',
    ];

    public function save(){
        $this->validate();
        $this->unit->save();
        $this->alert('success', "Success!");
        $this->emitTo('units.units', '$refresh');
    }

    public function mount(){
        $this->unit = new Unit();
        $this->sections = Section::get(['id' , 'name']);
        $this->stages = Stage::get(['id' , 'name' , 'section_id']);
    }

    public function render()
    {
        return view('livewire.units.unit-add');
    }
}
