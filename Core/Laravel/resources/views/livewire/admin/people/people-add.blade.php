<div>
    <div class="container items-center">
        <form wire:submit.prevent="save"
            class="flex flex-col w-full mx-auto mb-4 transition duration-500 ease-in-out transform">
            <div class="grid grid-cols-2 gap-4">
                <div class="relative pt-4">
                    <label for="name" class="text-base leading-7 text-gray-600">
                        Full Name
                    </label>
                    <input wire:model="name" type="text" placeholder="Full Name"
                        class="w-full px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                </div>
                <div class="relative mt-4">
                    <label for="name" class="text-base leading-7 text-gray-600">
                        Type
                    </label>
                    <select wire:model="type"
                        class="w-full px-4 py-2 mt-2 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                        <option value="0" selected>User</option>
                        <option value="1" selected>Admin</option>
                        <option value="2" selected>Teacher</option>
                        <option value="3">Student</option>
                    </select>
                </div>
                <div class="relative mt-4">
                    <label for="name" class="text-base leading-7 text-gray-600">
                        Email
                    </label>
                    <input wire:model="email" type="email" placeholder="Full Name"
                        class="w-full px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                </div>
                <div class="relative mt-4">
                    <label for="name" class="text-base leading-7 text-gray-600">
                        Password
                    </label>
                    <input wire:model="password" type="password" placeholder="Full Name"
                        class="w-full px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                </div>
            </div>

            <div class="flex items-center w-full pt-4 mb-4 mt-4">
                <button type="submit"
                    class="w-full py-3 text-base text-white transition duration-500 ease-in-out transform bg-blue-600 border-blue-600 rounded-md focus:shadow-outline focus:outline-none focus:ring-2 ring-offset-current ring-offset-2 hover:bg-blue-800 ">
                    Add </button>
            </div>
        </form>
    </div>
</div>
