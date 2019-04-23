<?php

namespace app\admin\controller;

use app\common\controller\AdminBase;
use think\facade\Config;
use think\facade\Request;

class Privilege extends AdminBase
{
    /**
     * 菜单权限列表
     */
    public function index()
    {
        if (Request::isAjax()) {
            $result = $this->model->getList();
            return $result;
        }
        return $this->fetch('lst');
    }

    /**
     * 权限新增
     */
    public function add()
    {
        if (Request::isAjax()) {
            if (!$this->validate->scene('add')->check($this->req)) {
                return show(-1, $this->validate->getError());
            }
            if (true !== $this->model->insertDb()) {
                return show(-1, '操作失败');
            }
            return show(1, '操作成功');
        }
        return $this->fetch('add', [
            'privilegeType' => Config::get('global.privilege_type'),
            'parentId' => isset($this->req['parentId']) ? $this->req['parentId'] : 0,
        ]);
    }

    /**
     * 权限编辑
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
            'privilegeType' => Config::get('global.privilege_type'),
        ]);
    }

    /**
     * 删除
     */
    public function delete()
    {
        if (!$this->validate->scene('delete')->check($this->req)) {
            return show(-1, $this->validate->getError());
        }
        $result = $this->model->deleteDb();
        if (true !== $result) {
            return show(-1, $result);
        }
        return show(1, '操作成功');
    }

    /**
     * 获取权限列表
     */
    public function getPrivilegeList()
    {
        $result = $this->model->getPrivilegeList();
        if (false !== $result) {
            return show(1, '操作成功', $result);
        }
        return show(-1, '操作失败');
    }
}