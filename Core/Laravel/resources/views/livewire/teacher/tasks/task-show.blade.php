<div>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Show Task
        </h2>
    </x-slot>
    <div class="mt-3">
        <section class="text-gray-600 body-font">
            <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">
                <div class="flex justify-center">
                    <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">
                        <table class="table text-gray-400 border-separate space-y-6 w-full text-sm">
                            <thead class="bg-gray-200 text-gray-500">
                                <tr>
                                    <th class="p-3 text-left">Title</th>
                                    <th class="p-3 text-left">Body</th>
                                    <th class="p-3 text-left">Section - Stage - Units</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="p-3">
                                        <div class="flex align-items-center">
                                            <div class="ml-3">
                                                <div>
                                                    <span class="font-bold text-gray-500">
                                                        {{ $task->title }}
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
                                                        {{ $task->body }}
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
                                                        {{ $task->units[0]->section->name }} - 
                                                        {{ $task->units[0]->stage->name }} - [
                                                        @foreach($task->units as $unit)
                                                            {{$unit->name}} ,
                                                        @endforeach
                                                        ]
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table> 
                    </div>
                </div>
            </div>
        </section>
        <section class="py-8 px-4">
            <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">
                <div class="flex justify-center">
                    
                    @foreach($task->files as $file)
                        @if(substr($file->file_path , strlen($file->file_path) - 3) != 'pdf')
                            <div class="md:w-1/2 px-4 mb-8 md:mb-0">
                                <img class="rounded shadow-md" src="{{asset($file->file_path)}}" alt="{{$task->title}}">
                            </div>
                        @endif
                    @endforeach
                </div>
            </div>
        </section>
        <section class="py-8 px-4">
            <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">
                <div class="flex justify-center">
                    @foreach($task->files as $file)
                        @if(substr($file->file_path , strlen($file->file_path) - 3) == 'pdf')
                            <div class="md:w-1/2 px-4 mb-8 md:mb-0">
                                <a href="{{asset($file->file_path)}}" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full"> Download pdf {{$loop->iteration}}</a>
                            </div>
                        @endif
                    @endforeach
                </div>
            </div>
        </section>
        {{-- <img src="{{asset($task->files[0]->file_path)}}"> --}}
    </div>

</div>
