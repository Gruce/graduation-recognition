<?php

namespace App\Http\Livewire\Students;

use Livewire\Component;

class StudentSearch extends Component
{
    public $search;
    protected $queryString = ['search'];

    public function render()
    {
        $this->emit('search', $this->search);
        return view('livewire.students.student-search');
    }
}
