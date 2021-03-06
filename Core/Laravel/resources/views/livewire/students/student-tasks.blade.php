<div>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Tasks
        </h2>
    </x-slot>
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
                                <th class="p-3 text-left">File</th>
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
</div>
