<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use App\Models\Teacher;
use App\Models\User;
use App\Models\Person;

class TeachersShow extends Component
{
    use LivewireAlert;

    public $teachers;

    protected $listeners = ['$refresh'];

    protected $rules = [
        'teachers.*.user.name' => 'required',
        'teachers.*.user.email' => 'required',
        'teachers.*.speciality' => 'required',
    ];

    public function link(Teacher $teacher){
        $person = Person::where('name', $teacher->user->name)->where('type', 2)->first();
        if ($person){
            $teacher = $this->teachers->find($teacher->id);
            $teacher->person_id = $person->id;
            $teacher->save();
            $this->emit('$refresh'); 
            $this->alert('success', "Success!");
        } else {
            $this->alert('error', 'Could not found a person with the same Name and Employer type!');
        }
    }

    public function save(){
        $this->validate();

        foreach($this->teachers as $teacher){
            $teacher->user->save();
            $teacher->save();
        }
        $this->alert('success', "Success!");
    }

    public function mount(){
        $this->teachers = Teacher::all();
    }

    public function render(){
        return view('livewire.teachers-show');
    }
}
