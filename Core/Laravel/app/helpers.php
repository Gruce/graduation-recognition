<?php

    function navigation()
    {
        $array = [
            [
                'name' => 'Dashboard',
                'route' => 'dashboard',
                'active' => request()->routeIs('dashboard'),
            ],
            [
                'name' => 'Trackings',
                'route' => 'trackings',
                'active' => request()->routeIs('trackings'),
            ],
            [
                'name' => 'People',
                'route' => 'people',
                'active' => request()->routeIs('people'),
            ],
            [
                'name' => 'Unkown People',
                'route' => 'unkown_people',
                'active' => request()->routeIs('unkown_people'),
            ],
            [
                'name' => 'Teachers',
                'route' => 'teachers',
                'active' => request()->routeIs('teachers'),
            ],
            [
                'name' => 'Students',
                'route' => 'students',
                'active' => request()->routeIs('students'),
            ],
            [
                'name' => 'Settings',
                'route' => 'settings',
                'active' => request()->routeIs('settings'),
            ],
        ];

        return $array;
    }

    function settings(){
        $array = [
            [
                'name' => 'Subjects',
                'route' => 'subjects',
                'active' => request()->routeIs('subjects'),
            ],
        ];

        return $array ;
    }