<?php

namespace app\admin\validate;

use think\Validate;

class Login extends Validate
{
    // 当前的验证规则
    protected $rule = [
        'username|用户名称' => 'require|min:2|max:20',
        'password|密码' => 'require|min:6|max:20',
    ];

    protected $message = [
        'username.require' => '用户名称必须',
        'username.min' => '用户名至少2个字符',
        'username.max' => '用户名至多20个字符',
        'password.require' => '密码必须',
        'password.min' => '密码至少6个字符',
        'password.max' => '密码至多20个字符',
    ];

    // 验证场景
    protected $scene = [
        'login' => ['username', 'password'],
    ];
}