<?php

namespace app\admin\controller;

use app\common\controller\AdminBase;
use think\facade\Config;
use think\facade\Request;

class Role extends AdminBase
{
    /**
     * 角色列表
     * @return mixed
     */
    public function index()
    {
        if (Request::isAjax()) {
            $result = $this->model->getList();
            return $result;
        }
        return $this->fetch('lst', [
            'roleStatus' => Config::get('global.role_status'),
        ]);
    }

    /**
     * 角色新增
     * @return mixed|void
     */
    public function add()
    {
        if (Request::isAjax()) {
            $req = Request::param();
            if (!$this->validate->scene('add')->check($req)) {
                return show(-1, $this->validate->getError());
            }
            if (true !== $this->model->insertDb()) {
                return show(-1, '操作失败');
            }
            return show(1, '操作成功');
        }
        return $this->fetch('add', [
            'roleStatus' => Config::get('global.role_status'),
        ]);
    }

    /**
     * 角色编辑
     * @return mixed
     */
    public function edit()
    {
        if (Request::isAjax()) {
            if (!$this->validate->scene('edit')->check($this->req)) {
                return show(-1, $this->validate->getError());
            }
            if (true !== $this->model->updateDb()) {
                return show(-1, '操作失败');
            }
            return show(1, '操作成功');
        }
        // 获取该角色数据
        $data = $this->model->getSingleInfo();
        return $this->fetch('edit', [
            'data' => $data,
            'roleStatus' => Config::get('global.role_status'),
        ]);
    }

    /**
     * 设置权限
     * @return mixed
     */
    public function setPrivilege()
    {
        $this->assign('roleId', $this->req['id']);
        return $this->fetch('setPrivilege');
    }

    /**
     * 设置权限
     * @return mixed
     */
    public function setPrivilegAction()
    {
        if (!$this->validate->scene('setPrivilegAction')->check($this->req)) {
            return show(-1, $this->validate->getError());
        }
        if (true !== $this->model->setPrivileg()) {
            return show(-1, '操作失败');
        }
        return show(1, '操作成功');
    }

}