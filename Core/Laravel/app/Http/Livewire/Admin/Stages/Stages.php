<?php

namespace App\Http\Livewire\Admin\Stages;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\WithPagination;
use App\Models\{
    Stage,
    Section,
};

class Stages extends Component
{
    use LivewireAlert;
    use WithPagination;

    protected $listeners = ['$refresh' , 'search'];
    protected $rules = [
        'stages.*.name' => 'required|string|min:3',
        'stages.*.section_id' => 'required',
    ];

    public $search;
    public $sections;

    public function search($text){
        $this->search = $text;
        $this->mount();
    }

    public function save(){
        $this->validate();

        foreach($this->stages as $stage){
            $array = ['section_id' => $stage->section_id];
            $stage->units()->update($array);
            $stage->subjects()->update($array);
            $stage->students()->update($array);
            $stage->save();
        }
        $this->alert('success', "Success!");
    }

    public function mount(){
        $search = '%' . $this->search . '%';
        $this->stages = Stage::where('name' , 'LIKE' , $search)->withCount(
            [
                'units',
                'subjects',
                'students'
            ]
        )->with('section:id,name')->get(['id' , 'name' , 'section_id']);

        $this->sections = Section::get(['id' , 'name']);
    }
    public function render()
    {
        return view('livewire.admin.stages.stages');
    }
}
