<?php

namespace app\facade\admin;

use think\Facade;

class Department extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\validate\admin\Department';
    }
}