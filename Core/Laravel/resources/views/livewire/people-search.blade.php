<div>
    <div class="relative text-gray-600 focus-within:text-gray-400">
      <span class="absolute inset-y-0 left-0 flex items-center pl-2">
        <button type="submit" class="p-1 focus:outline-none focus:shadow-outline flex">
          <span class="material-icons-outlined">
              search
          </span>
        </button>
      </span>
      <input wire:model="search" type="search" name="q" class="py-3 block w-full text-sm text-gray-400 bg-gray-100 rounded-md pl-10 focus:outline-none focus:bg-gray-50 focus:text-gray-900" placeholder="Search by person name..." autocomplete="off">
    </div>
</div>
