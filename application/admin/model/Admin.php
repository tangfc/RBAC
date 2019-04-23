<?php

namespace app\admin\model;

use think\facade\Config;
use think\facade\Request;
use think\Model;
use think\Db;

class Admin extends Model
{
    protected $pk = 'id';
    protected $table = 'tb_admin';
    // 定义时间戳字段名
    protected $createTime = 'createTime';
    protected $updateTime = 'updateTime';


    /**
     * 获取用户信息
     * @param string $username 用户名
     * @param string $password 密码
     */
    public function getAdminByUsernamePassword($username, $password)
    {
        $ressult = Db::name('admin')->where([
            'username' => $username,
            'password' => get_encrypt_password($password),
            'status' => 1, // 状态正常
        ])->find();
        return $ressult ?: false;
    }

    /**
     * 获取人员列表数据
     * @return array|false
     */
    public function getListData()
    {
        $req = Request::post();
        $where = [];
        if (isset($req['departmentId']) && !empty($req['departmentId'])) {
            $where[] = ['a.departmentId', 'eq', $req['departmentId']];
        }
        if (isset($req['username']) && !empty($req['username'])) {
            $where[] = ['a.username', 'like', "%" . $req['username'] . "%"];
        }
        if (isset($req['realname']) && !empty($req['realname'])) {
            $where[] = ['a.realname', 'like', "%" . $req['realname'] . "%"];
        }
        if (isset($req['qq']) && !empty($req['qq'])) {
            $where[] = ['a.qq', 'like', "%" . $req['qq'] . "%"];
        }
        if (isset($req['stime']) && !empty($req['stime'])) {
            $where[] = ['a.createTime', 'egt', $req['stime']];
        }
        if (isset($req['etime']) && !empty($req['etime'])) {
            $where[] = ['a.createTime', 'elt', $req['etime']];
        }
        $field = "a.id,a.username,a.realname,a.mobile,a.qq,a.headimg,a.departmentId,a.status,a.createTime,d.departmentName";
        $result = Db::name('admin')
            ->alias('a')
            ->join('department d', 'a.departmentId = d.id')
            ->field($field)
            ->where($where)
            ->select();
        if ($result) {
            foreach ($result as $key => &$value) {
                $adminLoginLog = Db::name('admin_login_log')->field('createTime')->where('adminId', 'eq', $value['id'])->find();
                $value['last_login_time'] = $adminLoginLog['createTime'] ?: '暂无最近一次登陆时间';
            }
        }
        return $result;
    }

    /**
     * 获取人员列表
     * @return mixed
     */
    public function getList()
    {
        $req = Request::param();
        $where = [];
        if (isset($req['username']) && !empty($req['username'])) {
            $where[] = ['a.username', 'like', "%" . $req['username'] . "%"];
        }
        if (isset($req['stime']) && !empty($req['stime'])) {
            $where[] = ['a.createTime', 'egt', $req['stime']];
        }
        if (isset($req['etime']) && !empty($req['etime'])) {
            $where[] = ['a.createTime', 'elt', $req['etime']];
        }
        $where[] = ['a.departmentId', 'eq', $req['id']];

        if (isset($req['sort']) && !empty($req['sort']) && isset($req['order']) && !empty($req['order'])) {
        } else {
            $req['sort'] = 'id';
            $req['order'] = 'desc';
        }
        $result['total'] = Db::name('admin')
            ->alias('a')
            ->join('department d', 'd.id = a.departmentId')
            ->where($where)
            ->count();
        $result['rows'] = Db::name('admin')
            ->alias('a')
            ->join('department d', 'd.id = a.departmentId')
            ->where($where)
            ->order('a.' . $req['sort'], $req['order'])
            ->limit($req['offset'], $req['limit'])
            ->field('a.id,a.username,a.qq,a.realname,a.landline,a.headimg,a.status,a.remark,a.createTime,d.departmentName')
            ->select();
        foreach ($result['rows'] as $key => &$value) {
            $result['rows'][$key]['headimg'] = '<img src="' . $value['headimg'] . '" width="80" height="80" >';
            $result['rows'][$key]['status'] = Config::get('global.admin_status')[$value['status']];
        }
        return $result;
    }


    /**
     * 人员新增
     * @return bool|void
     */
    public function insertDb()
    {
        $req = Request::param();
        if ($req['password'] !== $req['repassword']) return show('n', '两次密码不一致');
        $req['password'] = get_encrypt_password($req['password']);
        $req['headimg'] = base64_upload(Request::param('headimg'), 'uploads/admin/headimg/', 'post');
        $adminRoleArr = [];
        Db::startTrans();
        try {
            $req['id'] = $this->strict(false)->insertGetId($req);
            foreach ($req['roleIds'] as $key => $value) {
                $adminRoleArr[] = [
                    'adminId' => $req['id'],
                    'roleId' => $value,
                ];
            }
            Db::name('admin_role')->insertAll($adminRoleArr);
            Db::commit();
            return true;
        } catch (\Exception $e) {
            Db::rollback();
            return false;
        }
    }


    /**
     * 人员编辑
     * @return bool|void
     */
    public function updateDb()
    {
        $req = Request::param();
        if ($req['password'] !== $req['repassword']) return show('n', '两次密码不一致');
        if (isset($req['password']) && !empty($req['password'])) $req['password'] = get_encrypt_password($req['password']);
        else unset($req['password']);
        if ($req['headimg']) $req['headimg'] = base64_upload(Request::param('headimg'), 'uploads/admin/headimg/', 'post');
        else unset($req['headimg']);
        $req['updateTime'] = date('Y-m-d H:i:s', time());
        $adminRoleArr = [];
        foreach ($req['roleIds'] as $key => $value) {
            $adminRoleArr[] = [
                'adminId' => $req['id'],
                'roleId' => $value,
            ];
        }
        Db::startTrans();
        try {
            Db::name('admin')->strict(false)->update($req);
            Db::name('admin_role')->where('adminId', 'eq', $req['id'])->delete();
            Db::name('admin_role')->insertAll($adminRoleArr);
            Db::commit();
            return true;
        } catch (\Exception $e) {
            Db::rollback();
            return false;
        }
    }

    /**
     * 核对密码是否正确
     * @param int $adminId 人员ID
     * @param string $password
     * @return bool
     * @author TFC
     */
    public function checkPassword($adminId, $password)
    {
        $where = [];
        $where = ['id', 'eq', $adminId];
        $where = ['password', 'eq', get_encrypt_password($password)];
        $result = Db::name('admin')->where($where)->count();
        return $result > 0 ? true : false;
    }


}