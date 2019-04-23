<?php

namespace app\admin\controller;

use think\Db;
use think\facade\Config;
use think\facade\Request;
use app\common\controller\AdminBase;
use app\admin\model\Role as RoleModel;

class Banner extends AdminBase
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
        return $this->fetch('lst',[
            'bannerCategory' => get_table_select('banner_category', [], '*'),
        ]);
    }

    /**
     * 新增
     * @return mixed
     * @author TFC
     */
    public function add()
    {
        if (Request::isPost()) {
            $scene = 'addTypeOne'; // 类型为1
            if ($this->req['type'] == 2) $scene = 'addTypeTwo';
            if (!$this->validate->scene($scene)->check($this->req)) {
                return show(-1, $this->validate->getError());
            }
            if (true !== $this->model->insertDb()) {
                return show(-1, '操作失败');
            }
            return show(1, '操作成功');
        }
        // 获取分类
        return $this->fetch('add', [
            'bannerCategory' => get_table_select('bannerCategory', [], '*'),
            'bannerType' => Config::get('global.banner_type'),
        ]);
    }

    /**
     * 编辑
     * @return bool
     * @author TFC
     */
    public function edit()
    {
        if (Request::isPost()) {
            $scene = 'editTypeOne'; // 类型为1
            if ($this->req['type'] == 2) $scene = 'editTypeTwo';
            if (!$this->validate->scene($scene)->check($this->req)) {
                return show(-1, $this->validate->getError());
            }
            if (true !== $this->model->updateDb()) {
                return show(-1, '操作失败');
            }
            return show(1, '操作成功');
        }
        $data = get_table_find('banner', [['id', 'eq', $this->req['id']]], '*');
        $data['image'] = json_decode($data['image'],true);
        $data['pc'] = json_encode(['origin' => $data['image']['pc']]);
        $data['mobile'] = json_encode(['origin' => $data['image']['mobile']]);
        return $this->fetch('edit', [
            'data' => $data,
            'bannerCategory' => get_table_select('banner_category', [], '*'),
            'bannerType' => Config::get('global.banner_type'),
            'id' => $this->req['id'],
        ]);
    }

    /**
     * 删除
     * @return bool
     * @author TFC
     */
    public function delete()
    {
        if (Request::isAjax()) {
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

    /**
     * 上传图片
     * @return int|void
     * @author TFC
     */
    public function upload()
    {
        $file = Request::file('file');
        $filePath = DS . 'uploads' . DS . 'banner' . DS;
        // 图片名称
        $result = upload_image($file, $filePath, md5(uniqid()), 1024 * 1024, ['image/png', 'image/jpeg']);
        if (true !== $result['status']) {
            return show(0, $result['info']);
        } else {
            return show(1, '', $result['data']);
        }
    }

}