<?php

namespace app\admin\validate;

use think\Validate;

class Role extends Validate
{
    // 验证规则
    protected $rule = [
        'id|主键' => 'require|number|egt:1',
        'roleName|角色名称' => 'require|min:2|max:18',
        'orderNo|排序值' => 'require|number|between:0,9999',
        'roleId|角色ID' => 'require|number|egt:1',
        'privilegeIds|权限IDs' => 'checkPrivilege',
    ];

    // 验证提示语
    protected $message = [
        'id.require' => '主键必须',
        'id.number' => '主键必须是数字',
        'id.egt' => '主键必须必须大于等于1',
        'roleName.require' => '角色名称必须',
        'roleName.min' => '角色名称至少2个字符',
        'roleName.max' => '角色名称至多18个字符',
        'orderNo.require' => '排序值必须',
        'orderNo.number' => '排序值必须是数字',
        'orderNo.between' => '排序值只能在0-9999之间',
        'roleId.require' => '角色ID必须',
        'roleId.number' => '角色ID必须是数字',
        'roleId.egt' => '角色ID必须必须大于等于1',
    ];

    // 验证场景
    protected $scene = [
        'add' => ['roleName', 'orderNo'],
        'edit' => ['id', 'RoleName', 'orderNo'],
        'setPrivilegAction' => ['roleId', 'privilegeIds'],
    ];


    // 自定义验证规则
    protected function checkPrivilege($value, $rule, $data = [])
    {
        if (!is_array($value) || empty($value)) {
            return "权限数据错误!";
        }
        return true;
    }


}