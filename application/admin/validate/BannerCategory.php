<?php

namespace app\admin\validate;

use think\Validate;

class BannerCategory extends Validate
{
    // 验证规则
    protected $rule = [
        'id|主键' => 'require|number|egt:1',
        'categoryName|分类名称' => 'require|min:2|max:10',
        'orderNo|排序值' => 'require|number|between:0,9999',
        'type|类型' => 'require|number|between:1,2',
    ];

    // 验证提示语
    protected $message = [
        'id.require' => '主键必须',
        'id.number' => '主键必须是数字',
        'id.egt' => '主键必须必须大于等于1',
        'categoryName.require' => '分类名称必须',
        'categoryName.min' => '分类名称至少2个字符',
        'categoryName.max' => '分类名称至多18个字符',
        'orderNo.require' => '排序值必须',
        'orderNo.number' => '排序值必须是数字',
        'orderNo.between' => '排序值只能在0-9999之间',
        'type.require' => '类型必须',
        'type.number' => '类型必须是数字',
        'type.between' => '类型错误',
    ];

    // 验证场景
    protected $scene = [
        'add' => ['name', 'orderNo','type'],
        'edit' => ['id', 'name', 'orderNo','type'],
    ];

}