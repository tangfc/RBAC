<?php

namespace app\admin\controller;


use think\facade\Request;
use think\facade\Session;
use think\Db;
use think\facade\Config;
use app\common\controller\AdminBase;
use app\admin\model\Admin as AdminModel;
use app\admin\model\Personal as PersonalModel;

class Personal extends AdminBase
{
    /**
     * 个人资料
     */
    public function profile()
    {
        if (Request::isAjax()) {
            // 更新数据\
            $personalModel = new PersonalModel;
            if (true !== $personalModel->updateDb()) {
                return show(-1, '操作失败');
            }
            return show(1, '操作成功');
        } else {
            $data = Db::name('admin')->where('id', 'eq', Session::get('adminId'))->find();
            $data['status'] = Config::get('global.admin_status')[$data['status']];
            $department = Db::name('department')->field('departmentName')->where('id', 'eq', $data['departmentId'])->find();
            $data['departmentName'] = $department['departmentName'];
            // 获取该人员拥有的角色
            $haveRoleIds = Db::name('admin_role')->field('roleId')->where('adminId', 'eq', Session::get('adminId'))->select();
            $haveRoleIds = array_column($haveRoleIds, 'roleId');
            $roleNames = Db::name('role')->field('roleName')->where('id', 'in', $haveRoleIds)->select();
            $data['role'] = array_column($roleNames, 'roleName');
            return $this->fetch('profile', [
                'data' => $data,
            ]);
        }
    }

    /**
     * 修改密码
     * @return mixed|void
     * @author TFC
     */
    public function password()
    {
        if (Request::isAjax()) {
            if (!$this->validate->scene('password')->check($this->req)) {
                return show(-1, $this->validate->getError());
            }
            // 修改密码
            if (true == $this->model->password()) {
                return show(-1);
            }
            return show(1);
        }
        return $this->fetch();
    }

}