<?php

namespace App\Http\Livewire\Admin\Teachers;

use Livewire\Component;
use Illuminate\Validation\Rules\Password;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Hash;

use App\Models\{
    User,
    Teacher,
    Section,
    Subject,
};

class TeacherAdd extends Component
{
    use LivewireAlert;

    public Teacher $teacher;
    public User $user;
    public $password;
    public $sections;
    public $subjects;
    public $subjectID = [];

    protected $rules = [
        'user.name' => 'required|string|min:3',
        'user.email' => 'required|string',
        'teacher.speciality' => 'required',
        'teacher.section_id' => 'required',
    ];

    public function save(){
        $this->validate();
        $subjectID = array_keys($this->subjectID);
        $this->user->type = 'Lecturer';
        $this->user->password = Hash::make($this->password);

        $user = $this->user->save();

        if ($user){
            $this->teacher->user_id = $this->user->id;
            $this->teacher->save();
            $this->teacher->subjects()->attach($subjectID);
            $this->teacher = new Teacher();
            $this->user = new User();
            $this->alert('success', "Success!");
            $this->emitTo('teachers.teachers', '$refresh');
        } else $this->alert('error', "Please check details.");

        // $this->reset();
    }

    public function mount(){
        $this->teacher = new Teacher();
        $this->user = new User();
        $this->sections = Section::get(['id' , 'name']);
        $this->subjects = Subject::get(['id' , 'name' , 'section_id']);
        // $this->reset();
    }

    public function render()
    {
        return view('livewire.admin.teachers.teacher-add');
    }
}
