<?php

namespace App\Http\Livewire;

use Livewire\Component;

class Join extends Component
{
    public $name;
    public $email;
    public $password;

    public function send(){
        dd($this->name);
    }

    public function render()
    {
        return view('livewire.join');
    }
}
