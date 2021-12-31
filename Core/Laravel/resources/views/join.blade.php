<x-guest-layout>
    <div class="pt-4 bg-gray-100">
        <div class="min-h-screen flex flex-col items-center pt-6 sm:pt-0">
            <div>
                <x-jet-authentication-card-logo />
            </div>
            <div class="w-full sm:max-w-2xl mt-6 p-6 bg-white shadow-md overflow-hidden sm:rounded-lg prose">
                <div class="mt-10 sm:mt-0">
                    <div class="md:grid md:grid-cols-3 md:gap-6">
                        <div class="md:col-span-1">
                            <div class="px-4 sm:px-0">
                                <h3 class="text-lg font-medium leading-6 text-gray-900">Personal Information</h3>
                                <p class="mt-1 text-sm text-gray-600">
                                    Use a permanent address where you can receive mail.
                                </p>
                            </div>
                        </div>
                        <div class="mt-5 md:mt-0 md:col-span-2">
                            <div>
                                @if ($message = Session::get('success'))
                                    <div class="bg-teal-100 border-t-4 border-teal-500 rounded-b text-teal-900 px-4 py-3 shadow-md"
                                        role="alert">
                                        <div class="flex">
                                            <div class="py-1"><svg class="fill-current h-6 w-6 text-teal-500 mr-4"
                                                    xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                                    <path
                                                        d="M2.93 17.07A10 10 0 1 1 17.07 2.93 10 10 0 0 1 2.93 17.07zm12.73-1.41A8 8 0 1 0 4.34 4.34a8 8 0 0 0 11.32 11.32zM9 11V9h2v6H9v-4zm0-6h2v2H9V5z" />
                                                </svg></div>
                                            <div>
                                                <p class="font-bold">{{$message}}</p>
                                            </div>
                                        </div>
                                    </div>
                                @elseif($message = Session::get('error')) 
                                    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative"
                                        role="alert">
                                        <strong class="font-bold">Error</strong>
                                        <span class="block sm:inline">{{$message}}</span>
                                        <span class="absolute top-0 bottom-0 right-0 px-4 py-3">
                                            <svg class="fill-current h-6 w-6 text-red-500" role="button"
                                                xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                                <title>Close</title>
                                                <path
                                                    d="M14.348 14.849a1.2 1.2 0 0 1-1.697 0L10 11.819l-2.651 3.029a1.2 1.2 0 1 1-1.697-1.697l2.758-3.15-2.759-3.152a1.2 1.2 0 1 1 1.697-1.697L10 8.183l2.651-3.031a1.2 1.2 0 1 1 1.697 1.697l-2.758 3.152 2.758 3.15a1.2 1.2 0 0 1 0 1.698z" />
                                            </svg>
                                        </span>
                                    </div>
                                @endif
                            </div>
                            <form action="{{ route('join') }}" method="POST">
                                @csrf
                                <div class="shadow overflow-hidden sm:rounded-md">
                                    <div class="px-4 py-5 bg-gray sm:p-6">
                                        <div class="grid grid-cols-6 gap-6">
                                            <div class="col-span-6 sm:col-span-6">
                                                <label for="first-name"
                                                    class="block text-sm font-medium text-gray-700">First name</label>
                                                <input type="text" name="name" id="first-name" autocomplete="given-name"
                                                    class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                                            </div>

                                            <div class="col-span-6 sm:col-span-6">
                                                <label for="email-address"
                                                    class="block text-sm font-medium text-gray-700">Email
                                                    address</label>
                                                <input type="text" name="email" id="email-address" autocomplete="email"
                                                    class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                                            </div>
                                            <div class="col-span-6 sm:col-span-6">
                                                <label for="password"
                                                    class="block text-sm font-medium text-gray-700">Password</label>
                                                <input type="password" name="password" id="password"
                                                    autocomplete="email"
                                                    class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                                            </div>
                                        </div>
                                        <div class="col-span-6 sm:col-span-6">
                                            <label for="password"
                                                class="block text-sm font-medium text-gray-700">Password</label>
                                            
                                            <select name = "section_id" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                                                <option value="0" selected>Select Section</option>
                                                @forelse ($sections as $section)
                                                    <option value="{{$section->id}}">{{$section->name}}</option>
                                                @empty
                                                    <option value="0">No Section</option>
                                                @endforelse
                                            </select>
                                        </div>
                                    </div>
                                    <div class="px-4 py-3 bg-gray-50 text-right sm:px-6">
                                        <button
                                            class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                            Save
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-guest-layout>
