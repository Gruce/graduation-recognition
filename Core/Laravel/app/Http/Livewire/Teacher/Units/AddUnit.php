<?php

namespace App\Http\Livewire\Teacher\Units;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use App\Models\{
    Stage,
    Unit,
};

class AddUnit extends Component
{
    use LivewireAlert;

    public $stageID , $unitID;
    public $ids = [];
    public $publucUnitsSelected;

    public function add(){
        $teacher = auth()->user()->teacher()->first();
        if(count($this->publucUnitsSelected->modelKeys()) > 0){
            $teacher->units()->syncWithoutDetaching($this->publucUnitsSelected->modelKeys());
            foreach($this->publucUnitsSelected as $unit)
                $teacher->stages()->syncWithoutDetaching($unit->stage_id);
            $this->alert('success' , 'Done');
        }else $this->alert('warning' , 'Error');
        
        $this->emitTo('teacher.units.teacher-units', '$refresh');

    }

    public function render()
    {

        $teacher = auth()->user()->teacher()->first();
        $stages = Stage::where('section_id' , $teacher->section_id)->get();
        $units = Unit::where('stage_id' , $this->stageID)->get(['id' , 'name']);
        

        $keys = array_keys($this->ids);	
        $values = array_values($this->ids);	

        $ids = [];
        foreach($keys as $count => $key)
            if($values[$count])
                array_push($ids , $key);
        
        $unitsSelected = Unit::whereIn('id' , $ids)->with('stage:id,name')->get(['id' , 'name' , 'stage_id']);
        $this->publucUnitsSelected = $unitsSelected;


        return view('livewire.teacher.units.add-unit' , 
            [
                'stages' => $stages,
                'units' => $units,
                'unitsSelected' => $unitsSelected,
            ]    
        );
    }
}
