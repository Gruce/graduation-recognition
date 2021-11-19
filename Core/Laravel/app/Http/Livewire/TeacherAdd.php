<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\User;
use App\Models\Teacher;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;

class TeacherAdd extends Component
{
    public Teacher $teacher;
    public User $user;
    public $password;


    protected $rules = [
        'user.name' => 'required|string|min:3',
        'user.email' => 'required|string',
        'teacher.speciality' => 'required',
    ];

    public function save(){
        $this->validate();
        $this->user->type = 'Lecturer';
        $this->user->password = Hash::make($this->password);

        $user = $this->user->save();
        if ($user){
            $this->teacher->user_id = $user->id;
            $this->teacher->save();
            $this->teacher = new Teacher();
            $this->user = new User();
            $this->alert('success', "Success!");
            $this->emitTo('teachers-show', '$refresh');
        } else $this->alert('error', "Please check details.");
    }

    public function mount(){
        $this->teacher = new Teacher();
        $this->user = new User();
    }

    public function render(){
        return view('livewire.teacher-add');
    }
}
