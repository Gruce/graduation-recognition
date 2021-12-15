<div>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Students
        </h2>
    </x-slot>
    @livewire('actions' , ['folder' => 'admin.students' , 'file' => 'student-add' , 'search' => 'Student name or email'])
    <div class="mt-3">
        <section class="text-gray-600 body-font">
            <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">

                {{-- <div class="w-full" wire:loading>
                    <div class="flex justify-center items-center">
                        <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-gray-300"></div>
                    </div>
                </div> --}}

                <div class="flex justify-center">
                    <table class="table text-gray-400 border-separate space-y-6 w-full text-sm">
                        <thead class="bg-gray-200 text-gray-500">
                            <tr>
                                <th class="p-3">#</th>
                                <th class="p-3 text-left">Name</th>
                                <th class="p-3 text-left">Section</th>
                                <th class="p-3 text-left">Stage</th>
                                <th class="p-3 text-left">Unit</th>
                                <th class="p-3 text-left">Actions </th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($students as $i => $student )
                            <tr class="bg-gray-50" wire:key="student-field-{{ $student->id }}">
                                <td class="p-3 text-center">
                                    {{ $loop->iteration }}
                                </td>
                                <td class="p-3">
                                    <div class="flex align-items-center">
                                        {{-- <img class="rounded-full h-12 w-12  object-cover" src="{{asset('storage/db/' . $teacher->user->id . '/1.jpg')}}" alt="unsplash image"> --}}
                                        <div class="ml-3">
                                            <div x-data="{ show: false }">
                                                <span x-show="!show" @click="show = !show" class="font-bold text-gray-500">
                                                    {{ $student->user->name }}
                                                </span>
                                                <div x-show="show">
                                                    <div class="text-gray-600 focus-within:text-gray-400">
                                                        <input wire:keydown.enter="save()" wire:model="students.{{ $i }}.user.name" class="p-0 block w-full text-sm text-gray-400 bg-gray-100 rounded-md focus:outline-none focus:bg-gray-50 focus:text-gray-900" placeholder="{{ $student->user->name }}" autocomplete="off">
                                                    </div>
                                                </div>
                                            </div>

                                            <div x-data="{ show: false }">
                                                <span x-show="!show" @click="show = !show" class="text-gray-500">
                                                    {{ $student->user->email }}
                                                </span>
                                                <div x-show="show">
                                                    <div class="mt-1 text-gray-600 focus-within:text-gray-400">
                                                        <input wire:keydown.enter="save()" type="email" wire:model="students.{{ $i }}.user.email" class="py-3 block w-full text-sm text-gray-400 bg-gray-100 rounded-md px-5 focus:outline-none focus:bg-gray-50 focus:text-gray-900" placeholder="{{ $student->user->email }}" autocomplete="off">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>

                                <td class="p-3">
                                    <div x-data="{ show: false }">
                                        <span x-show="!show" @click="show = !show" class="text-gray-500">
                                            {{ $student->section->name }}
                                        </span>
                                        <div x-show="show">
                                            <div class="text-gray-600 focus-within:text-gray-400">
                                                <select wire:keydown.enter="save()" wire:model="students.{{ $i }}.section_id" class="py-3 block w-full text-sm text-gray-400 bg-gray-100 rounded-md px-5 focus:outline-none focus:bg-gray-50 focus:text-gray-900">
                                                    <option value="">Please select</option>
                                                    @foreach ($sections as $section)
                                                    <option value="{{$section->id}}">{{$section->name}}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="p-3">
                                    <div x-data="{ show: false }">
                                        <span x-show="!show" @click="show = !show" class="text-gray-500">
                                            {{-- {{dd($student->stage->id , $student->section_id , $student->stage->section_id)}} --}}
                                            @if($student->section_id == $student->stage->section_id)
                                            {{ $student->stage->name }}
                                            @else
                                            <span class="text-red-500">Please select!</span>
                                            <input type="hidden" value="{{false}}" wire:model="isStage">
                                            @endif
                                        </span>
                                        <div x-show="show">
                                            <div class="text-gray-600 focus-within:text-gray-400">
                                                <select wire:keydown.enter="save()" wire:model="students.{{ $i }}.stage_id" class="py-3 block w-full text-sm text-gray-400 bg-gray-100 rounded-md px-5 focus:outline-none focus:bg-gray-50 focus:text-gray-900">
                                                    <option value="">Please select</option>
                                                    @foreach ($stages as $stage)
                                                    @if($stage->section_id == $student->section_id)
                                                    <option value="{{$stage->id}}">{{$stage->name}}</option>
                                                    @endif
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="p-3">
                                    <div x-data="{ show: false }">
                                        <span x-show="!show" @click="show = !show" class="text-gray-500">

                                            @if($student->stage_id == $student->unit->stage_id)
                                            {{ $student->unit->name }}
                                            @else
                                            <span class="text-red-500">Please select!</span>
                                            <input type="hidden" value="{{false}}" wire:model="isUnit">
                                            @endif
                                        </span>
                                        <div x-show="show">
                                            <div class="text-gray-600 focus-within:text-gray-400">
                                                <select wire:keydown.enter="save()" wire:model="students.{{ $i }}.unit_id" class="py-3 block w-full text-sm text-gray-400 bg-gray-100 rounded-md px-5 focus:outline-none focus:bg-gray-50 focus:text-gray-900">
                                                    <option>Please select</option>
                                                    @foreach ($units as $unit)
                                                    @if($unit->stage_id == $student->stage_id)
                                                    <option value="{{$unit->id}}">{{$unit->name}}</option>
                                                    @endif
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <button wire:click="delete('Student', '{{ $student->id}}')" class="text-red-500"> 
                                        <i class="material-icons text-base">delete</i>
                                    </button>
                                </td>
                            </tr>
                            @empty
                            <tr class="bg-red-100">
                                <td colspan="6" class="p-3 text-center">
                                    No Students
                                </td>
                            </tr>
                            @endforelse

                        </tbody>
                    </table>
                </div>
                {{-- {{ $students->links() }} --}}
            </div>
        </section>

    </div>

    <div class="fixed bottom-0 left-0 m-3">
        <button wire:click="save" class="flex items-center text-white px-4 w-auto h-12 bg-blue-600 rounded hover:bg-blue-800 active:shadow-lg mouse shadow transition ease-in duration-200 focus:outline-none">
            <span class="material-icons-outlined mr-3">
                save
            </span>
            <span>Save</span>
        </button>
    </div>
</div>

<script>
    function setup() {
        return {
        activeTab: -1,
        tabs: [
            '<span class="material-icons-outlined mr-2">add</span>New Student',
            '<span class="material-icons-outlined mr-2">search</span>Search',
        ]
        };
    };

</script>