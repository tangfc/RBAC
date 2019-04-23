<?php

namespace app\admin\model;

use think\facade\Request;
use think\Model;
use think\Db;


class Login extends Model
{
    protected $pk = 'id';
    protected $table = 'tb_privilege';
    // 定义时间戳字段名
    protected $createTime = 'createTime';
    protected $updateTime = 'updateTime';

}