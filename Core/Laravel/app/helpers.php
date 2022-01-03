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
                    // [
                    //     'name' => 'Unkown People',
                    //     'route' => 'unkown_people',
                    //     'active' => isRoute('unkown_people'),
                    // ],
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
                        'name' => 'Join Requests',
                        'route' => 'join_requests',
                        'active' => isRoute('join_requests'),
                    ],
                    [
                        'name' => 'Settings',
                        'route' => 'settings',
                        'active' => isRoute('settings'),
                    ],
                ];
            } break;

            ################################################################

            case 2:{
                $array = [
                    [
                        'name' => 'Dashboard',
                        'route' => 'dashboard',
                        'active' => isRoute('dashboard'),
                    ],
                    [
                        'name' => 'Subjects',
                        'route' => 'teacher_subjects',
                        'active' => isRoute('teacher_subjects'),
                    ],
                    [
                        'name' => 'Students',
                        'route' => 'teacher_students',
                        'active' => isRoute('teacher_students'),
                    ],
                    [
                        'name' => 'Units',
                        'route' => 'teacher_unit',
                        'active' => isRoute('teacher_unit'),
                    ],
                    [
                        'name' => 'Task',
                        'route' => 'teacher_task',
                        'active' => isRoute('teacher_task'),
                    ],
                ];
            } break;

            ################################################################

            case 3:{
                $array = [
                    [
                        'name' => 'Dashboard',
                        'route' => 'dashboard',
                        'active' => isRoute('dashboard'),
                    ],
                    [
                        'name' => 'Tasks',
                        'route' => 'student_task',
                        'active' => isRoute('student_task'),
                    ],
                    [
                        'name' => 'Absences',
                        'route' => 'student_absences',
                        'active' => isRoute('student_absences'),
                    ],
                    [
                        'name' => 'Change Unit',
                        'route' => 'change_unit',
                        'active' => isRoute('change_unit'),
                    ],
                ];
            } break;
            
            default:
                $array = [[]];
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
                    [
                        'name' => 'Schedule',
                        'route' => 'schedule',
                        'active' => isRoute('schedule'),
                    ],
                    [
                        'name' => 'Codes',
                        'route' => 'codes',
                        'active' => isRoute('codes'),
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

    function dg($data){
        \Debugbar::info($data);
    }