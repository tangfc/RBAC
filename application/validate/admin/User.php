<?php

namespace app\validate;

use think\Validate;

class User extends Validate
{
    // 当前的验证规则
    protected $rule = [
        'name|姓名' => [
            'require' => 'require',
            'min' => 5,
            'max' => 20
        ],
        'email|邮箱' => [
            'require' => 'require',
            'email' => 'email',
            'min' => 5,
            'max' => 12,
//            'alphaNum' => 'alphaNum'
        ],
        'mobile|手机' => [
            'require' => 'require',
            'mobile' => 'mobile'
        ],
        'age|年龄' => [
            'require' => 'require',
            'number' => 'number',
            'between'   => '1,120',
        ]
    ];

    protected $message = [
        [
            'name.require' => '请输入姓名',
            'name.mix' => '名称最少5个字符',
            'name.max' => '名称最多20个字符'
        ]
    ];
}