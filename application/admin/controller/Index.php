<?php

namespace app\admin\controller;

use app\common\controller\AdminBase;
use think\facade\Session;
use think\Db;


class Index extends AdminBase
{
    public function index()
    {
        $admin = Db::name('admin')->where('id','eq',Session::get('adminId'))->find();
        return $this->fetch('lst',[
            'admin' => $admin,
        ]);
    }

    public function main()
    {
        return $this->fetch();
    }
}