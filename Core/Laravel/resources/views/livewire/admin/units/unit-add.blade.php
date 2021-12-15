<div>
    <div class="container items-center">
        <form wire:submit.prevent="save" class="flex flex-col w-full mx-auto mb-4 transition duration-500 ease-in-out transform">
            <div class="grid grid-cols-4 gap-4">
                <div class="relative pt-4">
                    <label class="text-base leading-7 text-gray-600">
                        Unit Name
                    </label>
                    <input wire:model="unit.name" type="text" placeholder="Unit Name" class="w-full px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                </div>
            </div>
            <div class="grid grid-cols-4 gap-4">
                <label for="name" class="text-base leading-7 text-gray-600">
                    Section
                </label>
                <select wire:model="unit.section_id" class="w-full px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                    <option value="">Please select</option>
                    @foreach ($sections as $section)
                        <option value="{{$section->id}}">{{$section->name}}</option>
                    @endforeach
                </select>
            </div>
            <div class="grid grid-cols-4 gap-4">
                <label for="name" class="text-base leading-7 text-gray-600">
                    Stage
                </label>
                <select wire:model="unit.stage_id" class="w-full px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                    <option value="">Please select</option>
                    @foreach ($stages as $stage)
                        @if($stage->section_id == $unit->section_id)
                            <option value="{{$stage->id}}">{{$stage->name}}</option>
                        @endif
                    @endforeach
                </select>
            </div>
            <div class="flex items-center w-full pt-4 mb-4 mt-4">
                <button wire:click="save" type="submit" class="w-full py-3 text-base text-white transition duration-500 ease-in-out transform bg-blue-600 border-blue-600 rounded-md focus:shadow-outline focus:outline-none focus:ring-2 ring-offset-current ring-offset-2 hover:bg-blue-800 "> Add </button>
            </div>
        </form>
    </div>
</div>
