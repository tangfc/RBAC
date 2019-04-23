<?php

namespace app\admin\validate;

use think\Validate;

class Banner extends Validate
{
    // 验证规则
    protected $rule = [
        'id|主键' => 'require|number|egt:1',
        'orderNo|排序值' => 'require|number|between:0,9999',
        'title|标题' => 'require|min:2|max:100',
        'bannerCategoryId|banner分类' => 'require|number',
        'type|类型' => 'require|number|between:1,2',
        'pc|banner【pc】' => 'require',
        'mobile|banner【mobile】' => 'require',
        'url|链接地址' => 'require|url',
        'resourcePc|资源地址【PC】' => 'require|url',
        'resourceMobile|资源地址【Mobile】' => 'require|url',
    ];

    // 验证提示语
    protected $message = [
        'id.require' => '主键必须',
        'id.number' => '主键必须是数字',
        'id.egt' => '主键必须必须大于等于1',
        'orderNo.require' => '排序值必须',
        'orderNo.number' => '排序值必须是数字',
        'orderNo.between' => '排序值只能在0-9999之间',
        'title.require' => '标题名称必须',
        'title.min' => '标题至少2个字符',
        'title.max' => '标题至多100个字符',
        'bannerCategoryId.require' => 'banner分类必须',
        'bannerCategoryId.number' => 'banner分类必须是数字',
        'type.require' => 'banner分类必须',
        'type.number' => 'banner分类必须是数字',
        'type.between' => '类型错误',
        'pc.require' => 'banner【PC】必须',
        'mobile.require' => 'banner【Mobile】必须',
        'url.require' => '链接地址必须',
        'url.url' => '链接地址错误',
        'resourcePc.require' => '资源地址【PC】必须',
        'resourcePc.url' => '资源地址【PC】错误',
        'resourceMobile.require' => '资源地址【Mobile】必须',
        'resourceMobile.url' => '资源地址【Mobile】错误',
    ];

    // 验证场景
    protected $scene = [
        'addTypeOne' => ['title', 'bannerCategoryId', 'orderNo', 'type', 'pc', 'mobile','url'],
        'addTypeTwo' => ['title', 'bannerCategoryId', 'orderNo', 'type', 'resourceMobile', 'resourcePc', 'url'],
        'editTypeOne' => ['id', 'title', 'bannerCategoryId', 'orderNo', 'type','pc', 'mobile', 'url'],
        'editTypeTwo' => ['id', 'title', 'bannerCategoryId', 'orderNo', 'type', 'resourceMobile', 'resourcePc', 'url'],
    ];

}