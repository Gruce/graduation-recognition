<?php

namespace App\Http\Livewire\Admin\People;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Illuminate\Http\Request;

use App\Http\Controllers\{
    Api\UserController,
};

class PeopleAdd extends Component
{
    use LivewireAlert;

    public $name ;
    public $type = 0 ;
    public $email;
    public $password;

    public function save()
    {
        $data = [
            'name' => $this->name,
            'type' => $this->type,
            'email' => $this->email,
            'password' => $this->password,
            'livewire' => true,
        ];

        $response = UserController::new_user(new Request($data));
        $status = $response->getStatusCode() ;
        $rspData = $response->getData();

        $alert = 'success';
        $msg = 'Done';
        if($status != 200){
            $alert = 'warning';
            $msg = $rspData->data;
        }

        $this->alert($alert , $msg);
        $this->emitTo('livewire.admin.people.people', '$refresh');
    }
    public function render()
    {
        return view('livewire.admin.people.people-add');
    }
}




