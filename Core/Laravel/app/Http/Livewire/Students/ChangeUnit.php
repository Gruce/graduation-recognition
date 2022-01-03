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
            $update = $student->update(
                [
                    'section_id' => $unit->section_id,
                    'stage_id' => $unit->stage_id,
                    'unit_id' => $unit->id
                ]
            );
            $this->alert('success' , 'Done');
        } else {
            $this->alert('warning' , 'Code Not Working!');
        }
    }
    public function render()
    {
        $codes = Code::get();
        $code_state = count($codes) > 0 ? true : false;

        return view('livewire.students.change-unit' , ['code_state' => $code_state]);
    }
}
