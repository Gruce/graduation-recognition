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
                'name' => 'Settings',
                'route' => 'settings',
                'active' => request()->routeIs('settings'),
            ],
        ];

        return $array;
    }