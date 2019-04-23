<?php

namespace app\admin\controller;

use app\common\controller\AdminBase;
use think\Controller;
use think\facade\Request;

class AdminLoginLog extends AdminBase
{
    /**
     * 登录日志列表
     * @return mixed
     */
    public function lst()
    {
        if (Request::isAjax()) { // 请求数据
            return $this->model->getAdminLoginLog();
        }
        return $this->fetch();
    }

}