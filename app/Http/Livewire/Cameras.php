<?php

namespace App\Http\Livewire;

use Symfony\Component\Process\Process;
use Symfony\Component\Process\Exception\ProcessFailedException;

use Livewire\Component;
use App\Models\Camera;
use App\Models\Person;

class Cameras extends Component
{
    public $selectedId = null;
    public $personId = null;
    public $all = false;

    public function render()
    {
        $cameras = Camera::with('trackings')->get();
        $person = null;
        if ($this->personId)
            $person = Person::find($this->personId);

        return view('livewire.cameras', [
            'cameras'       => $cameras,
            'selectedId'    => $this->selectedId,
            'personId'      => $this->personId,
            'person'        => $person,
            'all'           => $this->all
        ]);
    }
}
