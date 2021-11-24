<?php

namespace App\Http\Livewire\Students;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\WithPagination;
use App\Models\{
    Student,
    Section,
    Stage,
    Unit,
};

class Students extends Component
{
    use LivewireAlert;
    use WithPagination;

    protected $listeners = ['$refresh' , 'search'];
    // protected $paginationTheme = 'bootstrap';
    
    protected $rules = [
        'students.*.user.name' => 'required',
        'students.*.user.email' => 'required',
        'students.*.section_id' => 'required',
        'students.*.stage_id' => 'required',
        'students.*.unit_id' => 'required',
    ];

    public $students;
    public $sections;
    public $stages;
    public $units;
    public $search;
    

    function search($text){
        $this->search = $text;
        $this->mount();
    }

    public function save(){
        $this->validate();

        foreach($this->students as $student){
            $student->user->save();
            $student->save();
        }
        $this->alert('success', "Success!");
    }

    public function mount(){
        $search = '%' . $this->search . '%';

        $this->students = Student::whereHas('user' , function($q) use ($search){
            $q->where('name' , 'LILE' , $search)->orWhere('email' , 'LIKE' , $search);
        })->with(['user:id,name,email' , 'section:id,name' , 'stage:id,name' , 'unit:id,name'])->orderBy('id' , 'DESC')->get();

        $this->sections = Section::get(['id' , 'name']);
        $this->stages = Stage::get(['id' , 'section_id' , 'name']);
        $this->units = Unit::get(['id' , 'stage_id' , 'name']);

        $this->emitTo('studentDetails', $this->sections);

    }

    public function render()
    {
        // $this->students = Student::with(['user:id,name,email' , 'stage' => function($q) {
        //     return $q->with('section')->get();
        // } , 'unit:id,name'])->get();

        // dd($this->students);
        return view('livewire.students.students');
    }
}
