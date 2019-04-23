<?php

namespace app\admin\controller;

use think\facade\Request;
use app\common\controller\AdminBase;
use app\admin\model\BannerCategory as BannerCategoryModel;

class BannerCategory extends AdminBase
{
    /**
     * 列表
     * @return mixed
     * @author TFC
     */
    public function lst()
    {
        if (Request::isAjax()) {
            $result = $this->model->getList();
            return $result;
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
     * 编辑
     * @return bool
     * @author TFC
     */
    public function edit()
    {
        if (Request::isAjax()) {
            if (!$this->validate->scene('add')->check($this->req)) {
                return show(-1, $this->validate->getError());
            }
            if (true !== $this->model->updateDb()) {
                return show(-1);
            }
            return show(1);
        }
        // 获取此分类信息
        $data = get_table_find('banner_category', [['id', 'eq', $this->req['id']]], '*');
        return $this->fetch('edit', ['data' => $data,]);
    }

    /**
     * 删除
     * @return bool
     * @author TFC
     */
    public function delete()
    {
        if (Request::isPost()) {
            if (true !== $this->model->deleteDb()) {
                return show(-1, '操作失败');
            }
            return show(1, '操作成功');
        }
        return show(-1, '非法操作');
    }

    /**
     *该分类下banner数
     * @return bool
     * @author TFC
     */
    public function isHaveBannerCountByBannerCategoryId()
    {
        if (Request::isPost()) {
            if ($this->model->getkBannerCountByBannerCategoryId() >= 1) {
                return show(1, '该Banner分类下还有baneer,确定后这些banner也会删除', ['postCheck' => true]);
            }
            return show(1, '该Banner分类下无baneer', ['postCheck' => false]);
        }
        return show(-1, '非法操作');
    }
}