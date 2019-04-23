<?php

namespace app\admin\controller;

use app\common\controller\AdminBase;
use think\Db;
use think\facade\Config;
use think\facade\Request;
use app\admin\model\Role as RoleModel;

class Admin extends AdminBase
{
    /**
     * 人员列表
     * @return mixed
     * @author TFC
     */
    public function lst()
    {
        if (Request::isAjax()) {
            try {
                $result = $this->model->getListData();
                return show(1, '获取数据成功', $result);
            } catch (\Exception $e) {
                return show(-1, '获取数据失败', $e);
            }
        } else {
            // 获取部门信息
            $department = get_table_select('department', [], 'id,departmentName');
            return $this->fetch('lst', ['department' => $department]);
        }
    }

    /**
     *人员新增
     */
    public function add()
    {
        if (Request::isAjax()) {
            if ($this->model->insertDb()) return show(1, '操作成功');
            return show(-1, '操作失败');
        } else {
            $data['id'] = '';
        }
        // 获取部门信息
        $department = Db::name('department')->field('id,departmentName')->select();
        $roleModel = new RoleModel;
        return $this->fetch('add', [
            'data' => $data,
            'department' => $department,
            'role' => $roleModel->getAllRole([], 'id,roleName'),
            'status' => Config::get('global.admin_status'),
        ]);
    }

    /**
     * 人员编辑
     */
    public function edit()
    {
        $req = Request::param();
        if (Request::isPost()) {
            if (true !== $this->model->updateDb()) {
                return show(-1, '操作失败');
            }
            return show(1, '操作成功');
        } else {
            $data = Db::name('admin')->where('id', 'eq', $req['id'])->find();
        }
        // 获取部门信息
        $department = Db::name('department')->field('id,departmentName')->select();
        // 获取该人员拥有的角色
        $haveRoles = Db::name('admin_role')->field('roleId')->where('adminId', 'eq', $req['id'])->select();
        $roleModel = new RoleModel;
        return $this->fetch('edit', [
            'data' => $data,
            'department' => $department,
            'role' => $roleModel->getAllRole([], 'id,roleName'),
            'adminRole' => array_column($haveRoles, 'roleId'),
            'status' => Config::get('global.admin_status'),
        ]);
    }

    /*
     * 核对昵称的唯一
     */
    public function checkFieldUnique()
    {
        $wherer = [];
        $info = [
            'username' => [
                'error' => '该昵称已存在',
            ],
            'mobile' => [
                'error' => '该手机号已存在',
            ]
        ];
        $req = Request::param();
        if (!isset($req['field']) || empty($req['field']) || !in_array($req['field'], ['username', 'mobile'])) {
            return show('n', '参数错误');
        }
        $where[] = [$req['field'],'eq',$req['param']];
        if (isset($req['id']) && !empty($req['id'])) {// 编辑状态
            $where[] = ['id','neq',$req['id']];
            $count = Db::name('admin')->where($where)->count();
        } else { // 新增状态
            $count = Db::name('admin')->where($where)->count();
        }
        return $count == 0 ? show('y') : show('n', $info[$req['field']]['error']);
    }

}