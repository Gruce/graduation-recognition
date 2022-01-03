<div>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Hello 👋 {{auth()->user()->name}} 
        </h2>
    </x-slot>
    <div class="mt-3">
        @if($code_state)
            <section class="text-gray-600 body-font">
                <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">
                    <div class="flex justify-center">
                        <form wire:submit.prevent="save"
                        class="flex flex-col w-full mx-auto mb-4 transition duration-500 ease-in-out transform">
                        <div class="grid grid-cols-1 gap-4">
                            <div class="relative pt-4">
                                <label for="code" class="text-base leading-7 text-gray-600">
                                    Code
                                </label>
                                <input wire:model="code" type="text" placeholder="Enter Code"
                                    class="w-full px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                            </div>
                        </div>
                        <div class="flex items-center w-full pt-4 mb-4 mt-4">
                            <button type="submit"
                                class="w-full py-3 text-base text-white transition duration-500 ease-in-out transform bg-blue-600 border-blue-600 rounded-md focus:shadow-outline focus:outline-none focus:ring-2 ring-offset-current ring-offset-2 hover:bg-blue-800 ">
                                Change </button>
                        </div>
                    </form>
                    </div>
                </div>
            </section>
        @else 
            <section class="text-gray-600 body-font">
                <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">
                    <div class="flex justify-center">
                        <span>Oops No Code !</span>
                    </div>
                </div>
            </section>
        @endif
    </div>
</div>
