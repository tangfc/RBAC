<?php

namespace app\admin\model;

use think\facade\Config;
use think\facade\Request;
use think\facade\Session;
use think\Model;
use think\Db;

class Role extends Model
{
    protected $pk = 'id';
    protected $table = 'tb_role';
    // 定义时间戳字段名
    protected $createTime = 'createTime';
    protected $updateTime = 'updateTime';

    /**
     * 角色列表
     */
    public function getList()
    {
        $req = Request::param();
        $where = [];
        if (isset($req['roleName']) && !empty($req['roleName'])) {
            $where[] = ['roleName', 'like', "%" . $req['roleName'] . "%"];
        }
        if (isset($req['stime']) && !empty($req['stime'])) {
            $where[] = ['createTime', 'egt', $req['stime']];
        }
        if (isset($req['etime']) && !empty($req['etime'])) {
            $where[] = ['createTime', 'elt', $req['etime']];
        }
        if (!isset($req['status']) || !empty($req['status'])) {
            $where[] = ['status', 'eq', $req['status']];
        }
        if (!isset($req['sort']) || empty($req['sort'])) {
            $req['sort'] = 'orderNo';
        }
        $result['total'] = $this->where($where)->count();
        $result['rows'] = $this
            ->where($where)
            ->order($req['sort'], $req['order'])
            ->limit($req['offset'], $req['limit'])
            ->select();
        foreach ($result['rows'] as $key => &$value) {
            $value['status'] = Config::get('global.role_status')[$value['status']];
            $temp = '';
            if(check_authority(Session::get('adminId'),'admin/role/edit')){
                $temp .= '<a href="javascript:;" class="btn btn-outline btn-primary btn-sm edit" data-id="' . $value['id'] . '"><i class="fa fa-edit"></i> 编辑</a> ';
            }
            if(check_authority(Session::get('adminId'),'admin/role/setPrivilege')){
                $temp .= '<a href="javascript:;" class="btn btn-outline btn-warning btn-sm setPrivilge" data-id="' . $value['id'] . '"><i class="fa fa-edit"></i> 设置权限</a> ';
            }
            $result['rows'][$key]['do'] = $temp;
        }
        return $result;
    }

    /**
     * 角色单个
     * @return array|false|null|\PDOStatement|string|Model
     */
    public function getSingleInfo()
    {
        $req = Request::param();
        $result = $this->where('id', 'eq', $req['id'])->find();
        return $result;
    }

    /**
     * 角色新增
     * @return bool
     */
    public function insertDb()
    {
        $req = Request::param();
        $result = $this->strict(false)->insert($req);
        return $result > 0 ? true : false;
    }

    /**
     * 角色更新
     * @return bool
     */
    public function updateDb()
    {
        $req = Request::param();
        $req['updateTime'] = date('Y-m-d H:i:s');
        $result = $this->strict(false)->update($req);
        return $result > 0 ? true : false;
    }

    /**
     * 设置权限
     * @return bool
     */
    public function setPrivileg()
    {
        $req = Request::param();
        $data = [];
        foreach ($req['privilegeIds'] as $key => $value) {
            $data[$key]['roleId'] = $req['roleId'];
            $data[$key]['privilegeId'] = $value;
        }
        Db::startTrans();
        try {
            Db::name('role_privilege')->where('roleId', 'eq', $req['roleId'])->delete();
            Db::name('role_privilege')->insertAll($data);
            Db::commit();
            return true;
        } catch (\Exception $e) {
            Db::rollback();
            return false;
        }
    }

    /**
     * 获取角色
     * @param string $filed 字段
     * @return bool
     */
    public function getAllRole($ids = [], $filed = "*")
    {
        $where = [];
        if (!empty($id)) {
            $where = ['id', 'in', $ids];
        }
        $result = $this->where($where)->field($filed)->select();
        return $result ?: false;
    }

}