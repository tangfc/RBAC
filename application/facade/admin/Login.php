<?php

namespace app\facade\admin;

use think\Facade;

class Login extends Facade
{
    protected static function getFacadeClass()
    {
        return 'app\validate\admin\Login';
    }
}