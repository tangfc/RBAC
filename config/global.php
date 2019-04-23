<?php

return [
    'salt' => 'china', // 密钥
    'paginate' => [
        'pageSize' => 15,
    ],
    // 角色状态
    'role_status' => [
        0 => '删除',
        1 => '正常',
        2 => '冻结',
    ],
    // 菜单权限类型
    'privilege_type' => [
        1 => '菜单',
        2 => '权限',
        3 => '菜单+权限',
    ],
    // 人员状态
    'admin_status' => [
        1 => '在职',
        2 => '冻结',
        3 => '离职',
    ],
    // bannerCategory类型
    'banner_category_type' => [
        1 => '系统', // 不可删除
        2 => '自添', // 可以删除
    ],
    // banner类型
    'banner_type' => [
        1 => '本地上传',
        2 => '远程资源',
    ],
];