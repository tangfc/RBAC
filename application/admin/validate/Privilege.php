<?php

namespace app\admin\validate;

use think\Validate;

class Privilege extends Validate
{
    // 验证规则
    protected $rule = [
        'id|主键' => 'require|number|egt:1',
        'parentId|父级ID' => 'require|number|egt:0',
        'privilegeName|菜单名称' => 'require|min:2|max:18',
        'orderNo|排序值' => 'require|number|between:1,9999',
        'model|模型名称' => 'require|min:2|max:18',
        'controller|控制器名称' => 'require|min:2|max:18',
        'action|方法名称' => 'require|min:2|max:18',
        'type|类型' => 'require|number|between:1,3',
    ];

    // 验证提示语
    protected $message = [
        'id.require' => '主键必须',
        'id.number' => '主键必须是数字',
        'id.egt' => '主键必须必须大于等于1',
        'parentId.require' => '父级ID必须',
        'parentId.number' => '父级ID必须是数字',
        'parentId.egt' => '父级ID必须必须大于等于0',
        'privilegeName.require' => '菜单名称必须',
        'privilegeName.min' => '菜单名称至少2个字符',
        'privilegeName.max' => '菜单名称至多18个字符',
        'orderNo.require' => '排序值必须',
        'orderNo.number' => '排序值必须是数字',
        'orderNo.between' => '排序值只能在1-9999之间',
        'model.require' => '模型名称必须',
        'model.min' => '模型名称至少2个字符',
        'model.max' => '模型名称至多18个字符',
        'controller.require' => '控制器名称必须',
        'controller.min' => '控制器名称至少2个字符',
        'controller.max' => '控制器名称至多18个字符',
        'action.require' => '方法名称称必须',
        'action.min' => '方法名称至少2个字符',
        'action.max' => '方法名称至多18个字符',
        'type.require' => '类型必须',
        'type.number' => '类型必须是数字',
        'type.between' => '类型非法参数',
    ];

    // 验证场景
    protected $scene = [
        'add' => ['privilegeName', 'orderNo','model','controller','action','type'],
        'edit' => ['id','privilegeName', 'orderNo','model','controller','action','type'],
        'delete' => ['id'],
    ];




}