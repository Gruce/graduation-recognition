<?php

namespace App\Http\Livewire\Admin\Subjects;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\WithPagination;
use App\Models\{
    Subject,
    Section,
    Stage,
};

class Subjects extends Component
{

    use LivewireAlert;
    use WithPagination;

    protected $listeners = ['$refresh' , 'search'];

    protected $rules = [
        'subjects.*.name' => 'required',
        'subjects.*.section_id' => 'required',
        'subjects.*.stage_id' => 'required',
    ];

    public $subjects;
    public $sections;
    public $stages;
    public $search;

    public function save(){
        $this->validate();
        $msg = 'Success!';
        $alert = 'success';

        foreach($this->subjects as $subject)
                $subject->save();

        $this->alert($alert, $msg);
    }

    function search($text){
        $this->search = $text;
        $this->mount();
    }

    public function mount(){
        $search = '%' . $this->search . '%';

        $this->subjects = Subject::where('name' , 'LIKE' , $search)->withCount('teachers')->with(['section:id,name','stage:id,name,section_id'])->get(
            [
                'id',
                'name',
                'section_id',
                'stage_id'
            ]
        );

        $this->sections = Section::get(['id' , 'name']);
        $this->stages = Stage::get(['id' , 'section_id' , 'name']);
    }
    public function render()
    {
        return view('livewire.admin.subjects.subjects');
    }
}
