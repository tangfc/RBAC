<?php

namespace app\admin\validate;

use think\Validate;

class Department extends Validate
{
    // 验证规则
    protected $rule = [
        'id|主键' => 'require|number|egt:1',
        'icon|部门图标' => 'require',
        'departmentName|部门名称' => 'require|min:2|max:10',
        'orderNo|排序值' => 'require|number|between:,9999'
    ];

    // 验证提示语
    protected $message = [
        'id.require' => '主键必须',
        'id.number' => '主键必须是数字',
        'id.egt' => '主键必须必须大于等于1',
        'icon.req' => '部门图标必须',
        'departmentName.require' => '部门名称必须',
        'departmentName.min' => '部门名称至少2个字符',
        'departmentName.max' => '部门名称至多18个字符',
        'orderNo.require' => '排序值必须',
        'orderNo.number' => '排序值必须是数字',
        'orderNo.between' => '排序值只能在0-9999之间',
    ];

    // 验证场景
    protected $scene = [
        'add' => ['icon', 'departmentName', 'orderNo'],
        'edit' => ['id', 'icon', 'departmentName', 'orderNo'],
    ];

}