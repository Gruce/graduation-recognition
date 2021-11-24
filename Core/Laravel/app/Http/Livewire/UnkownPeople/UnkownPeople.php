<?php

namespace App\Http\Livewire\UnkownPeople;

use Livewire\Component;
use App\Models\{
    Person,
};

class UnkownPeople extends Component
{
    public function render()
    {
        $people = Person::where('type' , -1)->get();
        return view('livewire.unkown-people.unkown-people' , ['peopel' => $people]);
    }
}
