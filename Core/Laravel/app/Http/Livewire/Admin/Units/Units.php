<?php

namespace App\Http\Livewire\Admin\Units;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\WithPagination;
use App\Models\{
    Stage,
    Section,
    Unit,
};

class Units extends Component
{
    use LivewireAlert;
    use WithPagination;

    protected $listeners = ['$refresh' , 'search'];
    protected $rules = [
        'units.*.name' => 'required|string|min:1',
        'units.*.section_id' => 'required',
        'units.*.stage_id' => 'required',
    ];

    public $search;
    public $units;
    public $sections;
    public $stages;

    public function search($text){
        $this->search = $text;
        $this->mount();
    }

    public function save(){
        $this->validate();

        foreach($this->units as $unit){
            $array = ['section_id' => $unit->section_id , 'stage_id' => $unit->stage_id];
            $unit->students()->update($array);
            $unit->save();
        }
        $this->alert('success', "Success!");
    }

    public function mount(){
        $search = '%' . $this->search . '%';
        $this->units = Unit::where('name' , 'LIKE' , $search)->withCount(['students'])->with(
            [
                'section:id,name',
                'stage:id,name'
            ]
        )->get(['id' , 'name' , 'section_id' , 'stage_id']);

        $this->sections = Section::get(['id' , 'name']);
        $this->stages = Stage::get(['id' , 'name' , 'section_id']);
    }

    public function render()
    {
        return view('livewire.admin.units.units');
    }
}
