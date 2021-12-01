<?php

namespace App\Http\Livewire;

use Livewire\Component;

class Actions extends Component
{
    public $folder;
    public $file;
    public $search;

    public function render()
    {
        return view('livewire.actions');
    }
}
