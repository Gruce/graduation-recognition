<?php

namespace App\Http\Livewire\People;

use Livewire\Component;

class PeopleSearch extends Component
{
    public $search;
    protected $queryString = ['search'];

    public function render()
    {
        $this->emit('search', $this->search);
        return view('livewire.people.people-search');
    }
}
