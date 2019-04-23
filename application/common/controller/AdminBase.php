<?php

namespace app\common\controller;

use think\facade\Cache;
use think\facade\Cookie;
use think\facade\Request;
use think\facade\Session;
use app\common\controller\Privilege as PrivilegeCommon;

class AdminBase extends Base
{
    /**
     * 验证类
     * @var null
     */
    protected $validate = null;

    /**
     * 模型
     */
    protected $model = null;

    /**
     * 模块名
     * @var null
     */
    protected $module = null;

    /**
     * 控制器名
     * @var null
     */
    protected $controller = null;

    /**
     * 方法名
     * @var null
     */
    protected $action = null;

    /**
     * 请求参数
     */
    protected $req = null;

    /**
     * 免验证权限列表
     */
    protected $privilge_arr = [
        'admin' . DS . 'index' . DS . 'main', // 首页主题
        'admin' . DS . 'admin' . DS . 'checkfieldunique', // 核对员工
        'admin' . DS . 'privilege' . DS . 'getprivilegelist', // 获取权限列表
        'admin' . DS . 'role' . DS . 'setprivilegaction', // 设置权限提交
        'admin' . DS . 'admin' . DS . 'checkfieldunique', // 核对唯一性
        'admin' . DS . 'bannercategory' . DS . 'ishavebannercountbybannercategoryid', // 删除核对banenr分类下面是否存在banner
        'admin' . DS . 'banner' . DS . 'upload', // 上传图片
        'admin' . DS . 'department' . DS . 'upload', // 上传图片
    ];

    /**
     * 初始化
     */
    protected function initialize()
    {
        parent::initialize();

        // 判断是否登录
        if (!Session::has('adminId')) {
            return $this->error('请先登陆', 'admin/login/index');
        }

        $this->module = Request::module();
        $this->controller = Request::controller();
        $this->action = Request::action();

        $rule = strtolower($this->module . DS . $this->controller . DS . $this->action);

        // 判断是否是否有权限
        $privilegeCommon = new PrivilegeCommon;
        if (!in_array($rule, $this->privilge_arr, false) && true !== $privilegeCommon->check($rule, Session::get('adminId'))) {
            if ($rule === 'admin' . DS . 'index' . DS . 'main') {
                $this->error('您没有权限访问', 'admin/login/index');
            } else {
                $this->error('您没有权限访问', 'admin/index/main');
            }
        }

        // 接受参数
        $this->req = Request::param();

        // 实例化验证类
        if (!in_array($this->action, ['index'])) {
            $validateRoute = '\app\\' . $this->module . '\validate\\' . $this->controller;
            $this->validate = new $validateRoute;
        }

        // 实例化模型
        if (!in_array($this->action, [])) {
            $modelRoute = '\app\\' . $this->module . '\model\\' . $this->controller;
            $this->model = new $modelRoute;
        }

        // 系统设置
        if (Cache::store('file')->has('systemSetting')) {
            $systemSetting = Cache::store('file')->get('systemSetting');
        } else {
            $systemSetting = get_table_find('setting');
        }
        $this->assign('systemSetting', $systemSetting);
    }


}

