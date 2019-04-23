<?php

namespace app\admin\controller;

use think\facade\Request;
use app\common\controller\AdminBase;

class Setting extends AdminBase
{
    /**
     * 设置
     * @return mixed
     * @author TFC
     */
    public function lst()
    {
        if (Request::isAjax()) {
            if (isset($this->req['id']) && !empty($this->req['id'])) { // 编辑
                $scene = 'edit';
            } else {
                $scene = 'add';
            }
            // 后端验证
            if (!$this->validate->scene($scene)->check($this->req)) {
                return show(-1, $this->validate->getError());
            }
            if ($scene == 'edit') {
                if (true !== $this->model->updateDb()) {
                    return show(-1);
                }
            } else {
                if (true !== $this->model->insertDb()) {
                    return show(-1);
                }
            }
            return show(1);
        }
        return $this->fetch('lst', [
            'data' => get_table_find('setting'), // 获取设置信息
        ]);
    }

}