<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            People
        </h2>
    </x-slot>

    <div class="py-12">

        <div class="flex justify-center items-center w-full">
            <!--actual component start-->
            <div class="flex-grow container px-5 mx-auto rounded-lg max-w-7xl sm:px-6 lg:px-8" x-data="setup()">
                <ul class="flex justify-left items-center my-4">
                    <template class="flex-grow" x-for="(tab, index) in tabs" :key="index">
                        <li class="cursor-pointer py-2 px-4 text-gray-500 border-b-8 flex"
                            :class="activeTab===index ? 'text-gray-500 border-gray-500' : ''" @click="activeTab = index"
                            x-html="tab"></li>
                    </template>
                </ul>

                <div x-show="activeTab!==-1">
                    <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">
                        <div x-show="activeTab===0">
                            <livewire:person-add />
                        </div>
                        <div x-show="activeTab===1">
                            <livewire:people-search />
                        </div>
                    </div>
                </div>
    
            </div>
            <!--actual component end-->
        </div>
        <livewire:people />
    </div>

    <script>
        function setup() {
            return {
            activeTab: -1,
            tabs: [
                '<span class="material-icons-outlined mr-2">add</span>New Person',
                '<span class="material-icons-outlined mr-2">search</span>Search',
            ]
            };
        };
    </script>
</x-app-layout>
