<?php

namespace App\Http\Livewire\Teachers;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\WithPagination;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use App\Models\{
    Teacher,
};

class Teachers extends Component
{
    use LivewireAlert;
    use WithPagination;

    protected $listeners = ['$refresh' , 'search'];

    protected $rules = [
        'teachers.*.user.name' => 'required',
        'teachers.*.user.email' => 'required',
        'teachers.*.speciality' => 'required',
    ];

    public $teachers;
    public $search;

    private function paginate($items, $perPage = 5, $page = null, $options = [])
    {
        $page = $page ?: (Paginator::resolveCurrentPage() ?: 1);
        $items = $items instanceof Collection ? $items : Collection::make($items);
        return new LengthAwarePaginator($items->forPage($page, $perPage), $items->count(), $perPage, $page, $options);
    }

    public function link(Teacher $teacher){
        $person = Person::where('name', $teacher->user->name)->where('type', 2)->first();
        if ($person){
            $teacher = $this->teachers->find($teacher->id);
            $teacher->person_id = $person->id;
            $teacher->save();
            $this->emit('$refresh'); 
            $this->alert('success', "Success!");
        } else {
            $this->alert('error', 'Could not found a person with the same Name and Employer type!');
        }
    }

    public function save(){
        $this->validate();

        foreach($this->teachers as $teacher){
            $teacher->user->save();
            $teacher->save();
        }
        $this->alert('success', "Success!");
    }

    function search($text){
        $this->search = $text;
        $this->mount();
    }

    public function mount(){
        $search = '%' . $this->search . '%';
        $this->teachers = Teacher::whereHas('user' , function($q) use ($search){
            $q->where('name' , 'LIKE' , $search)->orWhere('email' , 'LIKE' , $search);
        })->with('user:id,name')
        ->orderBy('id', 'DESC')
        ->get();

        // $this->teachers = $this->paginate($this->teachers->toArray() , 2);

        // dd($this->teachers->toArray()['data'][0]['user']['id']);
    }

    public function render()
    {
        return view('livewire.teachers.teachers');
    }
}
