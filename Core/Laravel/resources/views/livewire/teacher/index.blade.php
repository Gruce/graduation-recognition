<div class="mt-3" wire:poll.750ms>
    <section class="text-gray-600 body-font">
        @livewire('actions' , ['folder' => 'teacher' , 'file' => 'add-lecture' , 'search' => 'Subject Name'])
        @if($current_lecture && !$absence)
            <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">
                <table class="table text-gray-400 border-separate space-y-6 w-full text-sm">
                    <thead class="bg-gray-200 text-gray-500">
                        <tr>
                            <th class="p-3 text-left">Subject Name</th>
                            <th class="p-3 text-left">Teacher Name</th>
                            <th class="p-3 text-left">Classroom</th>
                            <th class="p-3 text-left">Start - End</th>
                        </tr>
                    </thead>
                    <tbody>
                        <td class="p-3">
                            <div class="flex align-items-center">
                                <div class="ml-3">
                                    <div>
                                        <span class="font-bold text-gray-500">
                                            {{ $current_lecture->subject->name }}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td class="p-3">
                            <div class="flex align-items-center">
                                <div class="ml-3">
                                    <div>
                                        <span class="font-bold text-gray-500">
                                            {{ $current_lecture->teacher->user->name }}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td class="p-3">
                            <div class="flex align-items-center">
                                <div class="ml-3">
                                    <div>
                                        <span class="font-bold text-gray-500">
                                            {{ $current_lecture->classroom->name }}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td class="p-3">
                            <div class="flex align-items-center">
                                <div class="ml-3">
                                    <div>
                                        <span class="font-bold text-gray-500">
                                            {{date('h:i a', strtotime($current_lecture->start)) }} - {{date('h:i a', strtotime($current_lecture->end)) }}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tbody>
                </table> 
            </div>
            <br>
            <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">
                <div class="flex flex-wrap">
                    <button wire:click="start({{$current_lecture->id}})" type="button" class="w-full py-3 text-base text-white transition duration-500 ease-in-out transform bg-blue-600 border-blue-600 rounded-md focus:shadow-outline focus:outline-none focus:ring-2 ring-offset-current ring-offset-2 hover:bg-blue-800 "> Start  </button>
                </div>
            </div>
        @else
            <h1>No lecture</h1>
        @endif
        <br>
    </section>
    @if($absence)
        <section class="text-gray-600 body-font">
            <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">
                <div class="flex justify-center">
                    <table class="table text-gray-400 border-separate space-y-6 w-full text-sm">
                        <thead class="bg-gray-200 text-gray-500">
                            <tr>
                                <th class="p-3">#</th>
                                <th class="p-3 text-left">Name</th>
                                <th class="p-3 text-left">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($students as $student)
                                <tr class="@if(in_array($student->id , $studentsAbsenceId)) bg-red-50 @else bg-gray-50 @endif" >
                                    <td class="p-3 text-center">
                                        {{$loop->index + 1}}
                                    </td>
                                    <td class="p-3">
                                        <div class="flex align-items-center">
                                            <div class="ml-3">
                                                <div>
                                                    <span class="font-bold text-gray-500">
                                                        {{ $student->user->name }}
                                                    </span>
                                                </div>
                                            </div>
                                    </td>
                                    <td class="p-3">
                                        <div>
                                            <span class="text-gray-500">
                                                <input type="checkbox" id="studentID-{{$student->id}}" wire:model="studentID.{{$student->id}}">
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                            @empty

                            @endforelse
                    </tbody>
                </table>
                </div>
                <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">
                    <div class="flex flex-wrap">
                        <button wire:click="save({{$current_lecture->id}})" type="button" class="w-full py-3 text-base text-white transition duration-500 ease-in-out transform bg-blue-600 border-blue-600 rounded-md focus:shadow-outline focus:outline-none focus:ring-2 ring-offset-current ring-offset-2 hover:bg-blue-800 "> Save  </button>
                    </div>
                </div>
            </div>
        </section>
        <br>
    @endif
    <section class="text-gray-600 body-font">
        <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">
            <div class="flex justify-center">
                <table class="table text-gray-400 border-separate space-y-6 w-full text-sm">
                    <thead class="bg-gray-200 text-gray-500">
                        <tr>
                            <th class="p-3">#</th>
                            <th class="p-3 text-left">Name</th>
                            <th class="p-3 text-left">Day</th>
                            <th class="p-3 text-left">Start - End</th>
                            <th class="p-3 text-left">Classroom</th>
                            <th class="p-3 text-left">Stage</th>
                            <th class="p-3 text-left">Unit</th>
                            <th class="p-3 text-left">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($units_lectures  as $i => $unit_lectures)
                            @forelse ($unit_lectures->lectures as $j => $lecture)
                            <tr class="@if(date('l') == $lecture->day->name) bg-blue-50 @else bg-gray-50 @endif"  >
                                <td class="p-3 text-center">
                                    #
                                </td>
                                <td class="p-3">
                                    <div class="flex align-items-center">
                                        <div class="ml-3">
                                            <div>
                                                <span class="font-bold text-gray-500">
                                                    {{ $lecture->subject->name }}
                                                </span>
                                            </div>
                                        </div>
                                </td>
                                <td class="p-3">
                                    <div>
                                        <span class="text-gray-500">
                                            {{ $lecture->day->name }}
                                        </span>
                                    </div>
                                </td>
                                <td class="p-3">
                                    <div>
                                        <span class="text-gray-500">
                                            {{ date('h:i a', strtotime($lecture->start)) }} - {{ date('h:i a', strtotime($lecture->end)) }}
                                        </span>
                                    </div>
                                </td>
                                <td class="p-3">
                                    <div>
                                        <span class="text-gray-500">
                                            {{ $lecture->classroom->name }}
                                        </span>
                                    </div>
                                </td>
                                <td class="p-3">
                                    <div>
                                        <span class="text-gray-500">
                                            {{ $unit_lectures->stage->name }}
                                        </span>
                                    </div>
                                </td>
                                <td class="p-3">
                                    <div>
                                        <span class="text-gray-500">
                                            {{ $unit_lectures->name }}
                                        </span>
                                    </div>
                                </td>
                                <td>
                                    <button wire:click="delete('Lecture', '{{ $lecture->id}}')" class="text-red-500"> 
                                        <i class="material-icons text-base">delete</i>
                                    </button>
                                </td>
                            </tr>
                            @empty
                                {{-- <tr class="bg-red-100">
                                    <td colspan="8" class="p-3 text-center">
                                        No lectures
                                    </td>
                                </tr> --}}
                            @endforelse
                        @empty
                            <tr class="bg-red-100">
                                <td colspan="8" class="p-3 text-center">
                                    No Units
                                </td>
                            </tr>
                        @endforelse

                    </tbody>
                </table>
            </div>
        </div>
    </section>
</div>
<script>
    function setup() {
        return {
        activeTab: -1,
        tabs: [
            '<span class="material-icons-outlined mr-2">add</span>New Lecture',
            // '<span class="material-icons-outlined mr-2">search</span>Search',
        ]
        };
    };
</script>