<?php

namespace App\Http\Livewire\Admin\People;

use Livewire\Component;
use App\Models\Person;

class PeopleEdit extends Component
{
    public Person $person;
    public $personId;
    public $personEdited;

    protected $rules = [
        'person.name' => 'required|string|min:6',
        'person.type' => 'required|max:2',
    ];
    
    public function mount(){
        $this->person = new Person();
        $this->person = $this->person->find($this->personId);
    }

    public function save(){
        $this->validate();
        if ($this->person->save()){
            $this->personEdited = true;
        }
        $this->emit('reRenderParent');
    }
    
    public function render()
    {
        return view('livewire.admin.people.people-edit');
    }
}

