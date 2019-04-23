<?php

namespace app\admin\model;

use think\facade\Request;
use think\Model;
use think\Db;

class Personal extends Model
{
    protected $pk = 'id';
    protected $table = 'tb_admin';
    // 定义时间戳字段名
    protected $createTime = 'createTime';
    protected $updateTime = 'updateTime';

    /**
     * 个人资料编辑
     * @return bool|void
     * @author TFC
     */
    public function updateDb()
    {
        $req = Request::param();
        if ($req['headimg']) $req['headimg'] = base64_upload(Request::param('headimg'), 'uploads/admin/headimg/', 'post');
        else unset($req['headimg']);
        $req['updateTime'] = date('Y-m-d H:i:s', time());
        $result = Db::name('admin')->strict(false)->update($req);
        return $result ? true : false;
    }

    /**
     * 修改密码
     * @return bool
     * @author TFCpasssword
     */
    public function password()
    {
        $req = Request::only('id,password,oldPassword,repassword');
        if ($req['password'] !== $req['repassword'] || empty($req['id'])) {
            return false;
        }
        $where[] = ['password', 'eq', get_encrypt_password($req['oldPassword'])];
        $where[] = ['id', 'eq', $req['id']];
        $result = Db::name('admin')->where($where)->update(['password' => get_encrypt_password($req['password'])]);
        return $result > 0 ? true : false;

    }

}