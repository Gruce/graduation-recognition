<?php

namespace App\Http\Livewire;

use Livewire\Component;

class Search extends Component
{
    public $search;
    public $parameters;
    protected $queryString = ['search'];

    public function render()
    {
        $this->emit('search', $this->search);
        return view('livewire.search');
    }
}
