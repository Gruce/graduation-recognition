<?php

namespace App\Http\Livewire\Teachers;

use Livewire\Component;

class TeacherSearch extends Component
{
    public $search;
    protected $queryString = ['search'];

    public function render()
    {
        $this->emit('search', $this->search);
        return view('livewire.teachers.teacher-search');
    }
}
