<div>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            People
        </h2>
    </x-slot>
    @livewire('actions' , ['folder' => 'admin.schedule' , 'file' => 'schedule-add' , 'search' => 'Teacher name'])
    <div class="mt-3">
        <section class="text-gray-600 body-font">
            <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">
                <div class="w-full" wire:loading>
                    <div class="flex justify-center items-center">
                        <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-gray-300"></div>
                    </div>
                </div>
                <div> 
                    <select wire:model="section" class="px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                        <option value="0">Select Section</option>
                        @foreach ($sections as $section)
                            <option value="{{$section->id}}">{{$section->name}}</option>
                        @endforeach
                    </select>
                    <select wire:model="stage" class="px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                        <option value="0">Select stage</option>
                        @foreach ($stages as $stage)
                            <option value="{{$stage->id}}">{{$stage->name}}</option>
                        @endforeach
                    </select>
                    <select wire:model="unit" class="px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                        <option value="0">Select unit</option>
                        @foreach ($units as $unit)
                            <option value="{{$unit->id}}">{{$unit->name}}</option>
                        @endforeach
                    </select>
                    <select wire:model="dayName" class="px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                        <option value="0">Select day</option>
                        @foreach ($days as $day)
                            <option value="{{$day->name}}">{{$day->name}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="flex justify-center">
                    <table class="table text-gray-400 border-separate space-y-6 w-full text-sm">
                        <thead class="bg-gray-200 text-gray-500">
                            <tr>
                                <th class="p-3">#</th>
                                <th class="p-3 text-left">Section</th>
                                <th class="p-3 text-left">Stage</th>
                                <th class="p-3 text-left">Unit</th>
                                <th class="p-3 text-left">Classroom</th>
                                <th class="p-3 text-left">Teacher</th>
                                <th class="p-3 text-left">Name</th>
                                <th class="p-3 text-left">Day</th>
                                <th class="p-3 text-left">Start</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($days as $day)
                                <tr class="bg-gray-100 text-gray-400">
                                    <th class="p-3" colspan="9">{{$day->name}}</th>
                                </tr>
                                @forelse($lectures  as $i => $lecture)
                                    @if($day->name == $lecture->day->name)
                                        <tr class="@if(date('l') == $lecture->day->name) bg-red-50 @else bg-gray-50 @endif"  >
                                            <td class="p-3 text-center">
                                                {{ $loop->iteration }}
                                            </td>
                                            <td class="p-3">
                                                <div class="flex align-items-center">
                                                    <div class="ml-3">
                                                        <div>
                                                            <span class="font-bold text-gray-500">
                                                                {{ $lecture->unit->section->name }}
                                                            </span>
                                                        </div>
                                                    </div>
                                            </td>
                                            <td class="p-3">
                                                <div>
                                                    <span class="text-gray-500">
                                                        {{ $lecture->unit->stage->name }}
                                                    </span>
                                                </div>
                                            </td>
                                            <td class="p-3">
                                                <div>
                                                    <span class="text-gray-500">
                                                        {{ $lecture->unit->name }}
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
                                                        {{ $lecture->teacher->user->name }}
                                                    </span>
                                                </div>
                                            </td>
                                            <td class="p-3">
                                                <div>
                                                    <span class="text-gray-500">
                                                        {{ $lecture->subject->name }}
                                                    </span>
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
                                                        {{ date('h:i a', strtotime($lecture->start)) }}
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                    @endif
                                @empty
                                    <tr class="bg-red-100">
                                        <td colspan="9" class="p-3 text-center">
                                            No lectures
                                        </td>
                                    </tr>
                                @endforelse
                            @endforeach
                        </tbody>
                    </table>
                    </div>
                    {{-- {{ $people->links() }} --}}
                </div>
            </section>

        </div>
</div>

<script>
    function setup() {
        return {
        activeTab: -1,
        tabs: [
            '<span class="material-icons-outlined mr-2">add</span>Add Schedule',
            '<span class="material-icons-outlined mr-2">search</span>Search',
        ]
        };
    };
</script>

