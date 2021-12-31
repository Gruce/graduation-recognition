<div>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Hello 👋 {{auth()->user()->name}} 
        </h2>
    </x-slot>
    @if($current_lecture)
    <section class="text-gray-600 body-font">
        <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">

            <div class="flex justify-center">
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
        </div>
    </section>
    @endif

    <div class="mt-3">
        <section class="text-gray-600 body-font">
            <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">

                <div class="flex justify-center">
                    <table class="table text-gray-400 border-separate space-y-6 w-full text-sm">
                        <thead class="bg-gray-200 text-gray-500">
                            <tr>
                                <th class="p-3">#</th>
                                <th class="p-3 text-left">Subject Name</th>
                                <th class="p-3 text-left">Teacher Name</th>
                                <th class="p-3 text-left">Classroom</th>
                                <th class="p-3 text-left">Start - End</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($days as $day)
                                <tr class="bg-gray-100 text-gray-400">
                                    <th class="p-3" colspan="5">{{$day->name}}</th>
                                </tr>
                                
                                @forelse($lectures as $i => $lecture)
                                <tr class="@if(date('l') == $lecture->day->name) bg-blue-50 @else bg-gray-50 @endif">
                                    <td class="p-3 text-center">
                                        {{ $loop->iteration }}
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
                                        </div>
                                    </td>
                                    <td class="p-3">
                                        <div class="flex align-items-center">
                                            <div class="ml-3">
                                                <div>
                                                    <span class="font-bold text-gray-500">
                                                        {{ $lecture->teacher->user->name }}
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
                                                        {{ $lecture->classroom->name }}
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
                                                        {{date('h:i a', strtotime($lecture->start)) }} - {{date('h:i a', strtotime($lecture->end)) }}
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    {{-- <td class="p-3">
                                        <div>
                                            <span class="text-gray-500">
                                                {{ $task->body }} 
                                            </span>
                                        </div>
                                    </td>
                                    <td class="p-3">
                                        <div>
                                            <span class="text-gray-500">
                                                {{ $task->deadline }}
                                            </span>
                                        </div>
                                    </td>
                                    <td class="p-3">
                                        <div>
                                            <span class="text-gray-500">
                                                <button class="flex items-center text-white px-4 w-auto h-12 bg-blue-600 rounded hover:bg-blue-800 active:shadow-lg mouse shadow transition ease-in duration-200 focus:outline-none"> 
                                                    عرض
                                                </button>
                                            </span>
                                        </div>
                                    </td>  --}}
                                    {{-- <td class="p-3">
                                        <div x-data="{ show: false }">
                                            <span x-show="!show" @click="show = !show" class="text-gray-500">
                                                {{ $unit->stage->name }}
                                            </span>
                                            <div x-show="show">
                                                <div class="text-gray-600 focus-within:text-gray-400">
                                                    <select wire:keydown.enter="save()" wire:model="units.{{ $i }}.stage_id" class="py-3 block w-full text-sm text-gray-400 bg-gray-100 rounded-md px-5 focus:outline-none focus:bg-gray-50 focus:text-gray-900">
                                                        <option value="">Please select</option>
                                                        @foreach ($stages as $stage)
                                                        @if($stage->section_id == $unit->section_id)
                                                        <option value="{{$stage->id}}">{{$stage->name}}</option>
                                                        @endif
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="p-3">
                                        <div>
                                            <span class="text-gray-500">
                                                {{ $unit->students_count }}
                                            </span>
                                        </div>
                                    </td>
                                    <td>
                                    fh
                                    </td>
                                </tr>--}}
                                @empty
                                <tr class="bg-red-100">
                                    <td colspan="8" class="p-3 text-center">
                                        No lecture
                                    </td>
                                </tr>
                                @endforelse
                            @endforeach


                        </tbody>
                    </table>
                </div>
                {{-- {{ $units->links() }} --}}
            </div>
        </section>

    </div>

</div>
