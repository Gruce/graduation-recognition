<div>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Codes
        </h2>
    </x-slot>
    <div class="mt-3">
        <section class="text-gray-600 body-font">
            <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">
                <div>
                    <button wire:click="new_codes" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full">
                        New Codes
                    </button>  
                    <button wire:click="delete_all" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded-full">
                        Delete All Codes 
                    </button>                      
                </div>
                <div class="flex justify-center">
                    <table class="table text-gray-400 border-separate space-y-6 w-full text-sm">
                        <thead class="bg-gray-200 text-gray-500">
                            <tr>
                                <th class="p-3">#</th>
                                <th class="p-3 text-left">Code</th>
                                <th class="p-3 text-left">Section - Stage - Unit</th>
                                <th class="p-3 text-left">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($codes as $i => $code)
                            <tr class="bg-gray-50">
                                <td class="p-3 text-center">
                                    {{ $loop->iteration }}
                                </td>
                                <td class="p-3">
                                    <div class="flex align-items-center">
                                        <div class="ml-3">
                                            <div>
                                                <span class="font-bold text-gray-500">
                                                    {{ $code->code }}
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="p-3">
                                    <div>
                                        <span class="text-gray-500">
                                            {{ $code->unit->section->name }} -
                                            {{ $code->unit->stage->name }} -
                                            {{ $code->unit->name }}
                                        </span>
                                    </div>
                                </td>
                                <td class="p-3">
                                    <button wire:click="delete('Code', '{{ $code->id}}')" class="text-red-500"> 
                                        <i class="material-icons text-base">delete</i>
                                    </button>
                                </td>
                            </tr>
                            @empty
                            <tr class="bg-red-100">
                                <td colspan="8" class="p-3 text-center">
                                    No Codes
                                </td>
                            </tr>
                            @endforelse

                        </tbody>
                    </table>
                </div>
            </div>
        </section>

    </div>
</div>
