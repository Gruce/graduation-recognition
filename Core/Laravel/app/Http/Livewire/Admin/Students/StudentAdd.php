<?php

namespace App\Http\Livewire\Admin\Students;

use Livewire\Component;
use Illuminate\Validation\Rules\Password;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Hash;
use App\Models\{
    User,
    Student,
    Section,
    Stage,
    Unit,
};

class StudentAdd extends Component
{
    use LivewireAlert;

    public Student $student;
    public User $user;
    public $password;


    protected $rules = [
        'user.name' => 'required|string|min:3',
        'user.email' => 'required|string',
        'student.section_id' => 'required',
        'student.stage_id' => 'required',
        'student.unit_id' => 'required',
    ];

    public function save(){
        $this->validate();
        $this->user->type = 'Student';
        $this->user->password = Hash::make($this->password);
        $user = $this->user->save();

        if ($user){
            $this->student->user_id = $this->user->id;
            $this->student->save();
            $this->student = new Student();
            $this->user = new User();
            $this->alert('success', "Success!");
            $this->emitTo('students.students', '$refresh');
        } else $this->alert('error', "Please check details.");
    }


    public function mount(){
        $this->student = new Student();
        $this->user = new User();
    }

    public function render()
    {
        $sections = Section::get(['id' , 'name']);
        $stages = Stage::where('section_id' , $this->student->section_id)->get(['id' , 'section_id' , 'name']);
        // $this->stage_id = $stages[0]->id;
        $units = Unit::where('stage_id' , $this->student->stage_id)->get(['id' , 'stage_id' , 'name']);
        // $this->unit_id = $units[0]->id;

        return view('livewire.admin.students.student-add' , [
            'sections' => $sections ,
            'stages' => $stages ,
            'units' => $units
            ]
        );
    }
}
