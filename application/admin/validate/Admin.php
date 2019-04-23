<?php

namespace app\admin\validate;

use think\Validate;

class Admin extends Validate
{
    // 验证规则
    protected $rule = [
        'id|主键' => 'require|number|egt:1',
        'username|用户名称' => 'require|min:2|max:18',
        'password|密码' => 'require|min:6|max:18',
    ];

    // 验证提示语
    protected $message = [
        'id.require' => '主键必须',
        'id.number' => '主键必须是数字',
        'id.egt' => '主键必须必须大于等于1',
        'username.require' => '用户名称必须',
        'username.min' => '用户名称至少2个字符',
        'username.max' => '用户名称至多18个字符',
        'password.require' => '密码必须',
        'password.min' => '密码至少2个字符',
        'password.max' => '密码至多18个字符',
    ];

    // 验证场景
    protected $scene = [
        'getAdminByUsernamePassword' => ['username','password'],
    ];


}