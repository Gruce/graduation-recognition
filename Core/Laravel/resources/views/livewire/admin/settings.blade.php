
<div>
    
    <div class="py-12">
        <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-5xl sm:px-6 lg:px-8">
            <form wire:submit.prevent="save">
                @forelse ($settings as $i => $setting)
                    <div class="flex items-center" wire:key="setting-field-{{ $setting->id }}">
                        <div class="flex-1">
                            <label for="">{{$setting->title}}</label>
                        </div>
                        <div class="flex-1 relative text-gray-600 focus-within:text-gray-400">
                            <input wire:model="settings.{{ $i }}.value" class="py-3 block w-full text-sm text-gray-400 bg-gray-100 rounded-md px-5 focus:outline-none focus:bg-gray-50 focus:text-gray-900" placeholder="{{ $setting->value }}" autocomplete="off">
                        </div>
                    </div>
                @empty
                    No Settings
                @endforelse

                <div class="mt-10">
                    <button wire:click="save" type="button" class="w-full py-3 text-base text-white transition duration-500 ease-in-out transform bg-blue-600 border-blue-600 rounded-md focus:shadow-outline focus:outline-none focus:ring-2 ring-offset-current ring-offset-2 hover:bg-blue-800 "> Save </button>
                </div>
            </form>
        </div>
    </div>

</div>



<script>
    function setup() {
        return {
        activeTab: -1,
        tabs: [
            '<span class="material-icons-outlined mr-2">add</span>New Student',
            '<span class="material-icons-outlined mr-2">search</span>Search',
        ]
        };
    };

</script>

