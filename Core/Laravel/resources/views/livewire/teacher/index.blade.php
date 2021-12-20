<div class="mt-3" >
    <section class="text-gray-600 body-font">
        <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">
            <div class="flex flex-wrap">
                <button wire:click="start" type="button" class="w-full py-3 text-base text-white transition duration-500 ease-in-out transform bg-blue-600 border-blue-600 rounded-md focus:shadow-outline focus:outline-none focus:ring-2 ring-offset-current ring-offset-2 hover:bg-blue-800 "> Start  </button>
            </div>
        </div>
    </section>
    <section class="text-gray-600 body-font">
        <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">
            <div class="flex justify-center">
                <table class="table text-gray-400 border-separate space-y-6 w-full text-sm">
                    <thead class="bg-gray-200 text-gray-500">
                        <tr>
                            <th class="p-3">#</th>
                            <th class="p-3 text-left">Name</th>
                            <th class="p-3 text-left">Day</th>
                            <th class="p-3 text-left">Start</th>
                            <th class="p-3 text-left">Classroom</th>
                            <th class="p-3 text-left">Stage</th>
                            <th class="p-3 text-left">Unit</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($units_lectures  as $i => $unit_lectures)
                            @forelse ($unit_lectures->lectures as $j => $lecture)
                            <tr class="@if('Sunday' == $lecture->day->name) bg-red-50 @else bg-gray-50 @endif"  >
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
                                            {{ $lecture->start }}
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
                            </tr>
                            @empty
                                <tr class="bg-red-100">
                                    <td colspan="8" class="p-3 text-center">
                                        No lectures
                                    </td>
                                </tr>
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
            {{-- {{ $tasks->links() }} --}}
        </div>
    </section>
</div>
