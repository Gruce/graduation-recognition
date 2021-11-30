<?php

namespace App\Http\Livewire\Subjects;

use Livewire\Component;

class SubjectSearch extends Component
{
    public $search;
    protected $queryString = ['search'];

    public function render()
    {
        $this->emit('search', $this->search);
        return view('livewire.subjects.subject-search');
    }
}
