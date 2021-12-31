<?php

namespace App\Http\Livewire\Students;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use App\Models\{
    Code,
    Unit,
};

class ChangeUnit extends Component
{
    use LivewireAlert;

    public $code;

    public function save(){
        $code = $this->code;
        $unit = Unit::whereHas('code' , function($q) use ($code){
            return $q->where('code' , $code);
        })->first();

        if($unit){
            $student = auth()->user()->student()->first();
            $update = $student->update(['unit_id' => $unit->id]);
            $this->alert('success' , 'Done');
        } else {
            $this->alert('warning' , 'Code Not Working!');
        }
    }
    public function render()
    {
        return view('livewire.students.change-unit');
    }
}
