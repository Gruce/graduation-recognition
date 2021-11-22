<?php

namespace App\Http\Livewire\People;

use Livewire\Component;
use App\Models\Person;

class PeopleAdd extends Component
{
    public Person $person;
    public $personAdded = null;

    protected $rules = [
        'person.name' => 'required|string|min:3',
        'person.type' => 'max:2',
    ];

    public function save(){
        $this->validate();
        if ($this->person->type == null)
            $this->person->type = 0;

        if ($this->person->save()){
            $this->personAdded = $this->person->name;
            $this->person = new Person();
        }
        $this->emit('reRenderParent');
    }

    public function mount(){
        $this->person = new Person();
    }

    public function render()
    {
        return view('livewire.people.people-add');
    }
}
