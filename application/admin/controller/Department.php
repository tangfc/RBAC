<?php

namespace app\admin\controller;

use think\Facade\Request;
use app\admin\model\Admin as AdminModel;
use app\common\controller\AdminBase;

class Department extends AdminBase
{
    /**
     * 部门列表
     * @return array
     * @author TFC
     */
    public function lst()
    {
        if (Request::isAjax()) { // 请求数据
            return $this->model->getList();
        }
        return $this->fetch();
    }

    /**
     * 新增
     * @return mixed
     * @author TFC
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
        return $this->fetch();
    }

    /**
     * 部门编辑
     * @return array|mixed|void
     */
    public function edit()
    {
        $req = Request::param();
        if (Request::isAjax()) {
            if (!$this->validate->scene('edit')->check($req)) {
                return show('n', $this->validate->getError());
            }
            if (0 === $this->model->updateDb()) {
                return show(-1, '操作失败！');
            } else {
                return show(1, '操作成功！');
            }
        }
        $data = $this->model->find($req['id']);
        if (is_null($data)) {
            return show('n', '非法参数');
        }
        return $this->fetch('edit', [
            'data' => $data,
        ]);
    }

    /**
     * 上传图片
     */
    public function upload()
    {
        $file = Request::file('file');
        $filePath = DS . 'uploads' . DS . 'department' . DS;
        // 图片名称
        $result = upload_image($file, $filePath, md5(uniqid()), 1024 * 1024, ['image/png', 'image/jpeg']);
        if (true !== $result['status']) {
            return show(0, $result['info']);
        } else {
            return show(1, $result['info'], $result['data']);
        }
    }

    /**
     * 获取人员列表
     * @return array|mixed|void
     */
    public function adminList()
    {
        if (Request::isAjax()) {
            $amdinModel = new AdminModel;
            return $amdinModel->getList();
        }
        return $this->fetch('admin_list', [
            'id' => $this->req['id'],
        ]);
    }

}