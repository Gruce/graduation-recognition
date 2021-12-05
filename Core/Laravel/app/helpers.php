<?php

    function navigation()
    {
        $array = [] ;
        switch (auth()->user()->type) {
            case 1:{
                $array = [
                    [
                        'name' => 'Dashboard',
                        'route' => 'dashboard',
                        'active' => isRoute('dashboard'),
                    ],
                    [
                        'name' => 'Trackings',
                        'route' => 'trackings',
                        'active' => isRoute('trackings'),
                    ],
                    [
                        'name' => 'People',
                        'route' => 'people',
                        'active' => isRoute('people'),
                    ],
                    [
                        'name' => 'Unkown People',
                        'route' => 'unkown_people',
                        'active' => isRoute('unkown_people'),
                    ],
                    [
                        'name' => 'Teachers',
                        'route' => 'teachers',
                        'active' => isRoute('teachers'),
                    ],
                    [
                        'name' => 'Students',
                        'route' => 'students',
                        'active' => isRoute('students'),
                    ],
                    [
                        'name' => 'Train New',
                        'route' => 'trainNew',
                        'active' => isRoute('trainNew'),
                    ],
                    [
                        'name' => 'Settings',
                        'route' => 'settings',
                        'active' => isRoute('settings'),
                    ],
                ];
            } break;
            
            default:
                # code...
                break;
        }

        return $array;
    }

    function settings(){
        $array = [];
        switch (auth()->user()->type) {
            case 1:{
                $array = [
                    [
                        'name' => 'Sections',
                        'route' => 'sections',
                        'active' => isRoute('sections'),
                    ],
                    [
                        'name' => 'Stages',
                        'route' => 'stages',
                        'active' => isRoute('stages'),
                    ],
                    [
                        'name' => 'Units',
                        'route' => 'units',
                        'active' => isRoute('units'),
                    ],
                    [
                        'name' => 'Subjects',
                        'route' => 'subjects',
                        'active' => isRoute('subjects'),
                    ],
                ];
            }break;

            default:
                # code...
                break;
        }

        return $array ;
    }


    function isRoute($route){
        return str_contains(Route::getCurrentRoute()->getPrefix(), $route);
    }