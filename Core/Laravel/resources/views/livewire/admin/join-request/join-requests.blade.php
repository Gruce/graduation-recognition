<div>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Join Requests
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
                                <th class="p-3 text-left">Name</th>
                                <th class="p-3 text-left">Email</th>
                                <th class="p-3 text-left">Date</th>
                                <th class="p-3 text-left">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($joinRequests as $i => $item)
                            <tr class="bg-gray-50">
                                <td class="p-3 text-center">
                                    {{ $loop->iteration }}
                                </td>
                                <td class="p-3">
                                    <div class="flex align-items-center">
                                        <div class="ml-3">
                                            <div>
                                                <span class="font-bold text-gray-500">
                                                    {{ $item->name }}
                                                </span>
                                            </div>
                                        </div>
                                </td>
                                <td class="p-3">
                                    <div>
                                        <span class="text-gray-500">
                                            {{ $item->email }}
                                        </span>
                                    </div>
                                </td>
                                <td class="p-3">
                                    <div>
                                        <span class="text-gray-500">
                                            {{ $item->created_at }}
                                        </span>
                                    </div>
                                </td>
                                <td>
                                    <button wire:click="add({{ $item->id}})" class="text-green-500 pr-4"> 
                                        <i class="material-icons text-base">group_add</i>
                                    </button>

                                    <button wire:click="delete('JoinRequest', '{{ $item->id}}')" class="text-red-500"> 
                                        <i class="material-icons text-base">delete</i>
                                    </button>
                                </td>
                            </tr>
                            @empty
                            <tr class="bg-red-100">
                                <td colspan="8" class="p-3 text-center">
                                    No Requests
                                </td>
                            </tr>
                            @endforelse

                        </tbody>
                    </table>
                </div>
                {{-- {{ $joinRequests->links() }} --}}
            </div>
        </section>

    </div>
</div>
