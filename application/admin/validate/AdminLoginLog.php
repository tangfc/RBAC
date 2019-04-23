<?php

namespace app\admin\validate;

use think\Validate;

class AdminLoginLog extends Validate
{
    // 当前的验证规则
    protected $rule = [
        'username|用户名称' => 'require|min:5|max:20',
        'password|密码' => 'require|min:6|max:20',
    ];

    protected $message = [
        'username.require' => '用户名称必须',
        'username.min' => '用户名至少5个字符',
        'username.max' => '用户名至多20个字符',
        'password.require' => '密码必须',
        'password.min' => '密码至少6个字符',
        'password.max' => '密码至多20个字符',
    ];

    // 验证场景
    protected $scene = [
        'login' => ['username', 'password'],
    ];

    // 自定义验证规则
//    protected function checkName($value,$rule,$data=[])
//    {
//        return $rule == $value ? true : '名称错误';
//    }

}