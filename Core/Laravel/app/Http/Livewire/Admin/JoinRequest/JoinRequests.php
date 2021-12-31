<?php

namespace App\Http\Livewire\Admin\JoinRequest;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\WithPagination;
use App\Models\{
    JoinRequest,
    User,
    Teacher
};

use App\Http\Controllers\{
    ActionController,
};
use Str;

class JoinRequests extends Component
{

    use WithPagination;
    use LivewireAlert;

    protected $listeners = ['$refresh', 'search'];

    public function add($id){
        $join = JoinRequest::find($id);
        $alert = 'success' ;
        $msg = 'Done';
        if($join){
            $data = [
                'name' => $join->name,
                'email' => $join->email,
                'email_verified_at' => now(),
                'password' => bcrypt($join->password),
                'remember_token' => Str::random(10),
                'type' => 2,
            ];
            $user = User::create($data);
            $teacher = Teacher::create(['user_id' => $user->id , 'section_id' => $join->section_id]);
            $join->delete();
        } else { $alert = 'warning' ; $msg = 'error';}

        $this->alert($alert , $msg);
        $this->emitTo('admin.join-request.join-requests', '$refresh');
    }
    public function delete($model , $id){
        $response = ActionController::delete($model,$id);
        $alert = $response->getStatusCode() == 200 ? 'success' : 'warning';
        $this->alert($alert , $response->getData()->data);
        $this->emitTo('admin.join-request.join-requests', '$refresh');
    }

    public function render()
    {
        $joinRequests = JoinRequest::get();
        return view('livewire.admin.join-request.join-requests' , 
            [
                'joinRequests' => $joinRequests,
            ]
        );
    }
}
