<?php

namespace app\admin\controller;

use think\Controller;
use think\facade\Cache;
use think\facade\Request;
use think\facade\Session;
use app\admin\model\Admin as AdminModel;
use app\admin\model\AdminLoginLog as AdminLoginLogModel;
use app\admin\validate\Login as LoginValidate;
use app\admin\validate\Admin as AdminValidate;

class Login extends Controller
{
    protected function initialize()
    {
        parent::initialize();
        $this->assign('systemSetting', Cache::store('file')->has('systemSetting') ? Cache::store('file')->get('systemSetting') : get_table_find('setting'));
    }

    /**
     * 登录页面
     * @return mixed
     */
    public function index()
    {
        return $this->fetch('lst');
    }

    /**
     * 用户登录
     * @return array|void
     */
    public function login()
    {
        $req = Request::param();
        $loginValidata = new LoginValidate;
        if (!$loginValidata->scene('login')->check($req)) {
            return show(-1, $loginValidata->getError());
        }
        $adminValidate = new AdminValidate;
        if (!$adminValidate->scene('getAdminByUsernamePassword')->check($req)) {
            return show(-1, $adminValidate->getError());
        }
        $adminModel = new AdminModel;
        $adminInfo = $adminModel->getAdminByUsernamePassword($req['username'], $req['password']);
        if (false === $adminInfo) {
            return show(-1, '用户名或则密码错误');
        }
        Session::set('username', $adminInfo['username']);
        Session::set('realname', $adminInfo['realname']);
        Session::set('adminId', $adminInfo['id']);

        // 记录登录日志
        $ip = get_client_ip(0, true);
        @$data = get_ip_info($ip);
        Session::set('loginInfo', $data);

        // 获取上次登录日志
        $adminLoginLog = new AdminLoginLogModel;
        @$lastLoginLog = $adminLoginLog->getLastLoginInfo($adminInfo['id']);
        Session::set('lastLoginLog', $lastLoginLog);

        // 存储日志
        @$adminLoginLog->insertAdmijnLoginLog($data);
        return show(1, '登录成功', ['url' => 'main']);
    }

    /*
     * 退出登录
     */
    public function logout()
    {
        Session::clear();
        return redirect('index');
    }

}