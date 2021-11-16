<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Person;
use Livewire\WithPagination;

class UnkownPeople extends Component
{
    
    public $people;

    protected $rules = [
        'people.*.name' => '',
    ];

    use WithPagination;

    public function mount(){
        $this->people = Person::where('type', '-1')
                        ->orderBy('id', 'DESC')
                        ->paginate(32);
    }

    public function merge(){
        $this->validate();
        
        dd($this->people);
        // foreach ($this->people as $person) {
        //     $person->save();
        // }
    }

    public function render()
    {
        

        return view('livewire.unkown-people', ['people' => $this->people]);
    }
}
