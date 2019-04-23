<?php

namespace app\admin\validate;

use think\Validate;

class Setting extends Validate
{
    // 验证规则
    protected $rule = [
        'id|主键' => 'require|number|egt:1',
        'siteName|网站名称' => 'require|min:2|max:50',
        'keywords|关键词' => 'require|min:2|max:100',
        'description|描述' => 'require|min:2|max:250',
        'copyright|版权信息' => 'require|min:2|max:50',
        'recordNo|备案号' => 'require',
    ];

    // 验证提示语
    protected $message = [
        'id.require' => '主键必须',
        'id.number' => '主键必须是数字',
        'id.egt' => '主键必须必须大于等于1',
        'siteName.require' => '标题名称必须',
        'siteName.min' => '标题至少2个字符',
        'siteName.max' => '标题至多50个字符',
        'keywords.require' => '关键词必须',
        'keywords.min' => '关键词至少2个字符',
        'keywords.max' => '关键词至多100个字符',
        'description.require' => '描述必须',
        'description.min' => '描述至少2个字符',
        'description.max' => '描述至多250个字符',
        'copyright.require' => '版权信息必须',
        'copyright.min' => '版权信息至少2个字符',
        'copyright.max' => '版权信息至多50个字符',
        'recordNo.require' => '备案号必须',
    ];

    // 验证场景
    protected $scene = [
        'add' => ['siteName', 'keywords', 'description', 'copyright', 'recordNo'],
        'edit' => ['id', 'siteName', 'keywords', 'description', 'copyright', 'recordNo'],
    ];

}