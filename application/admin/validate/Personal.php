<?php

namespace app\admin\validate;

use think\facade\Request;
use think\Validate;
use think\Db;

class Personal extends Validate
{
    // 验证规则
    protected $rule = [
        'id|主键' => 'require|number|egt:1',
        'username|用户名称' => 'require|min:2|max:18',
        'password|密码' => 'require|min:6|max:18',
        'oldPassword|原密码' => 'require|min:6|max:18|checkOldPassword',
        'repassword|确认密码' => 'require|min:6|max:18',
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
        'password.min' => '密码至少6个字符',
        'password.max' => '密码至多18个字符',
        'oldPassword.require' => '原密码必须',
        'oldPassword.min' => '原密码至少6个字符',
        'oldPassword.max' => '原密码至多18个字符',
        'repassword.require' => '确认密码必须',
        'repassword.min' => '确认密码至少6个字符',
        'repassword.max' => '确认密码至多18个字符',
    ];

    // 验证场景
    protected $scene = [
        'getAdminByUsernamePassword' => ['username', 'password'],
        'password' => ['id', 'oldPassword', 'password', 'repassword'],
    ];


    // 自定义验证规则
    protected function checkOldPassword($value, $rule, $data = [])
    {
        $req = Request::only('id,oldPassword,password,repassword');
        if ($req['password'] !== $req['repassword']) {
            return '此次密码不一致';
        }
        $where[] = ['id', 'eq', $req['id']];
        $where[] = ['password', 'eq', get_encrypt_password($req['password'])];
        $count = Db::name('admin')->where($where)->count();
        return $count != 1 ? '原密码错误' : true;
    }


}