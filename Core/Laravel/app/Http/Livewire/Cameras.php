<?php

namespace App\Http\Livewire;

use Symfony\Component\Process\Process;
use Symfony\Component\Process\Exception\ProcessFailedException;

use Livewire\Component;
use App\Models\Camera;
use App\Models\User;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Http\Client\Socket\Client;
use Http\Message\RequestFactory;

class Cameras extends Component
{

    use LivewireAlert;
    
    private RequestFactory $requestFactory;

    public $selectedId = null;
    public $personId = null;
    public $all = false;

    public function state($id , $state){
        $camera = Camera::find($id);
        $camera->state = !$state;
        $camera->save();
        $msg = 'Camera ' . $camera->description . ' Turn ' ;
        $msg .= $state ? 'OFF' : 'ON' ;
        $this->alert('success', $msg);

        // $request = $this->requestFactory->createRequest('GET', 'http://httplug.io');
        $client = new Client('asd', ['remote_socket' => '127.0.0.1:8888']);
    }

    public function render()
    {
        $cameras = Camera::with('trackings')->get();
        $person = null;
        if ($this->personId)
            $person = User::find($this->personId);

        return view('livewire.cameras', [
            'cameras'       => $cameras,
            'selectedId'    => $this->selectedId,
            'personId'      => $this->personId,
            'person'        => $person,
            'all'           => $this->all
        ]);
    }
}
