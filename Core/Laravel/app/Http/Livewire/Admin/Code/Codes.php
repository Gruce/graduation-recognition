<?php

namespace App\Http\Livewire\Admin\Code;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use App\Http\Controllers\{
    ActionController,
};
use App\Models\{
    Code,
    Unit
};

class Codes extends Component
{
    use LivewireAlert;

    protected $listeners = ['$refresh'];

    public function delete($model , $id){
        $response = ActionController::delete($model,$id);
        $alert = $response->getStatusCode() == 200 ? 'success' : 'warning';
        $this->alert($alert , $response->getData()->data);
        $this->emitTo('admin.code.codes', '$refresh');
    }

    public function delete_all(){
        $codes = Code::query()->delete();
        $this->alert('success' , 'Done');
        $this->emitTo('admin.code.codes', '$refresh');
    }
    
    public function new_codes(){
        Code::query()->delete();
        $units = Unit::get();

        foreach($units as $unit)
            $unit->code()->create(['code' => str_random(10)]);
        
        $this->alert('success' , 'Done');
        $this->emitTo('admin.code.codes', '$refresh');
    }

    public function render()
    {
        $codes = Code::with(
            [
                'unit' => function($unit){
                    return $unit->with(['section:id,name' , 'stage:id,name'])->get();
                }
            ]
        )->get();

        return view('livewire.admin.code.codes' , ['codes' => $codes]);
    }
}
