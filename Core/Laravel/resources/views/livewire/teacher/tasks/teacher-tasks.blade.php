<div>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Tasks
        </h2>
    </x-slot>
    @livewire('actions' , ['folder' => 'teacher.tasks' , 'file' => 'task-send' , 'search' => 'Task title'])
    <div class="mt-3">
        <section class="text-gray-600 body-font">
            <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">
                <div class="flex justify-center">
                    <table class="table text-gray-400 border-separate space-y-6 w-full text-sm">
                        <thead class="bg-gray-200 text-gray-500">
                            <tr>
                                <th class="p-3">#</th>
                                <th class="p-3 text-left">Title</th>
                                <th class="p-3 text-left">Body</th>
                                <th class="p-3 text-left">Section - Stage - Unit</th>
                                <th class="p-3 text-left">File</th>
                                <th class="p-3 text-left">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($tasks as $i => $task)
                            <tr class="bg-gray-50">
                                <td class="p-3 text-center">
                                    {{ $loop->iteration }}
                                </td>
                                <td class="p-3">
                                    <div class="flex align-items-center">
                                        <div class="ml-3">
                                            <div>
                                                <span class="font-bold text-gray-500">
                                                    {{ $task->title }}
                                                </span>
                                            </div>
                                        </div>
                                </td>
                                <td class="p-3">
                                    <div>
                                        <span class="text-gray-500">
                                            {{ $task->body }}
                                        </span>
                                    </div>
                                </td>
                                <td class="p-3">
                                    <div>
                                        <span class="text-gray-500">
                                            {{$task->units[0]->section->name}} - 
                                            {{$task->units[0]->stage->name}} - [
                                                @foreach ($task->units as $unit)
                                                    {{ $unit->name }} ,
                                                @endforeach
                                            ]
                                        </span>
                                    </div>
                                </td>
                                <td class="p-3">
                                    <div>
                                        <span class="text-gray-500">
                                            @if(count($task->files) > 0 )
                                                <a href="{{route('task_show' , ['task_id' => $task->id])}}" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full">
                                                    Show Files
                                                </a>
                                            @else 
                                                No File
                                            @endif
                                        </span>
                                    </div>
                                </td>
                                <td>
                                    <button wire:click="delete('Task', '{{ $task->id}}')" class="text-red-500"> 
                                        <i class="material-icons text-base">delete</i>
                                    </button>
                                </td>
                            </tr>
                            @empty
                            <tr class="bg-red-100">
                                <td colspan="8" class="p-3 text-center">
                                    No Tasks
                                </td>
                            </tr>
                            @endforelse

                        </tbody>
                    </table>
                </div>
                {{ $tasks->links() }}
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
            '<span class="material-icons-outlined mr-2">add</span>New Task',
            '<span class="material-icons-outlined mr-2">search</span>Search',
        ]
        };
    };
</script>