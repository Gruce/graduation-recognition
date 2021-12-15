<div>
    <div class="container items-center">
        <form wire:submit.prevent="save"
            class="flex flex-col w-full mx-auto mb-4 transition duration-500 ease-in-out transform">
            <div class="grid grid-cols-2 gap-4">
                <div class="relative pt-4">
                    <label class="text-base leading-7 text-gray-600">
                        Full Name
                    </label>
                    <input wire:model="user.name" type="text" placeholder="Full Name"
                        class="w-full px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                </div>
                <div class="relative pt-4">
                    <label class="text-base leading-7 text-gray-600">
                        Email
                    </label>
                    <input wire:model="user.email" type="email" placeholder="Email"
                        class="w-full px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                </div>
                <div class="relative pt-4">
                    <label class="text-base leading-7 text-gray-600">
                        Password
                    </label>
                    <input type="password" wire:model="password" placeholder="Password"
                        class="w-full px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                </div>
                <div class="relative pt-4">
                    <label for="name" class="text-base leading-7 text-gray-600">
                        Section
                    </label>
                    <select wire:model="student.section_id"
                        class="w-full px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                        <option value="">Please select</option>
                        @foreach ($sections as $section)
                            <option @if ($loop->index == 0) selected @endif value="{{ $section->id }}">{{ $section->name }}</option>
                        @endforeach
                    </select>
                </div>

                <div class="relative pt-4">
                    <label for="name" class="text-base leading-7 text-gray-600">
                        Stages
                    </label>
                    <select wire:model="student.stage_id"
                        class="w-full px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                        <option value="">Please select</option>
                        @foreach ($stages as $stage)
                            <option value="{{ $stage->id }}">{{ $stage->name }}</option>
                        @endforeach
                    </select>
                </div>

                <div class="relative pt-4">
                    <label for="name" class="text-base leading-7 text-gray-600">
                        Units
                    </label>
                    <select wire:model="student.unit_id"
                        class="w-full px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                        <option value="">Please select</option>
                        @foreach ($units as $unit)
                            <option value="{{ $unit->id }}">{{ $unit->name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>

            <div class="flex items-center w-full pt-4 mb-4 mt-4">
                <button wire:click="save" type="submit"
                    class="w-full py-3 text-base text-white transition duration-500 ease-in-out transform bg-blue-600 border-blue-600 rounded-md focus:shadow-outline focus:outline-none focus:ring-2 ring-offset-current ring-offset-2 hover:bg-blue-800 ">
                    Add </button>
            </div>
        </form>
    </div>
</div>
