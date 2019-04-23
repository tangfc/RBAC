<?php

namespace app\admin\controller;

use think\Controller;
use think\facade\Config;
use think\Db;
use app\admin\model;

use app\validate\User as ValidateUser;

//use app\facade\User as ValidateUser;

class User extends Controller
{
    public function index()
    {
        $data = Db::table('tb_admin')->paginate('2');
        $this->assign('data', $data);
        return $this->fetch();
    }

    public function dsn()
    {
        $dsn = 'mysql://root:123456@localhost:3306/demo#utf8';
        return Db::connect($dsn)
            ->table('tb_admin')
            ->where('id', '1')
            ->value('nickname');
    }

    public function user()
    {
        $this->fetch();
    }

    public function test()
    {
        $data = [
            'name' => 'Peter',
            'email' => 'ass@qq.com',
            'password' => '123fdsf32',
            'mobile' => '13057485123',
            'age' => 'tfc',
        ];
        //
        $validate = new ValidateUser;

//        if( !ValidateUser::check($data) ){
//            return ValidateUser::getError();
//        }else{
//            return "验证通过";
//        }

        if (!$validate->check($data)) {
            return $validate->getError();
        } else {
            return "验证成功";
        }

    }


}