<?php

namespace app\admin\model;

use think\facade\Request;
use think\Model;
use think\Db;

class AdminLoginLog extends Model
{
    protected $pk = 'id';
    protected $table = 'tb_admin_login_log';
    // 定义时间戳字段名
    protected $createTime = 'createTime';
    protected $updateTime = 'updateTime';

    /**
     * 处理登录日志列表数据
     * @param array $req 请求数组
     * @return array mixed
     */
    public function getAdminLoginLog()
    {
        $req = Request::param();
        $where = [];
        if (isset($req['username']) && !empty($req['username'])) {
            $where[] = ['a.username', 'like', "%" . $req['username'] . "%"];
        }
        if (isset($req['stime']) && !empty($req['stime'])) {
            $where[] = ['all.createTime', 'egt', $req['stime']];
        }
        if (isset($req['etime']) && !empty($req['etime'])) {
            $where[] = ['all.createTime', 'elt', $req['etime']];
        }
        if (isset($req['sort']) && !empty($req['sort']) && isset($req['order']) && !empty($req['order'])) {

        } else {
            $req['sort'] = 'id';
            $req['order'] = 'desc';
        }
        $res['total'] = Db::name('admin_login_log')->alias('all')
            ->join('admin a', 'all.adminId = a.id')
            ->where($where)
            ->field('a.username,all.id,all.ip,all.operator,all.country,all.province,all.city,all.county,all.area,all.createTime')
            ->count();
        $res['rows'] = Db::name('admin_login_log')->alias('all')
            ->join('admin a', 'all.adminId = a.id')
            ->where($where)
            ->field('a.username,all.id,all.ip,all.operator,all.country,all.province,all.city,all.county,all.area,all.createTime')
            ->order('all.' . $req['sort'], $req['order'])
            ->limit($req['offset'], $req['limit'])
            ->select();
        foreach ($res['rows'] as $key => &$value) {
            $res['rows'][$key]['ip'] = long2ip($res['rows'][$key]['ip']);
        }
        return $res;
    }


    /**
     * 登录日志入库
     * @param array $data 数据
     * @return bool
     */
    public function insertAdmijnLoginLog($data)
    {
        if (!is_array($data) || empty($data)) return false;
        $data = [
            'adminId' => session('adminId'),
            'ip' => ip2long($data['ip']),
            'operator' => $data['isp'],
            'country' => $data['country'],
            'province' => $data['region'],
            'city' => $data['city'],
            'county' => $data['county'],
            'area' => $data['area'],
        ];
        $ressult = Db::name('admin_login_log')->insert($data);
        return $ressult ?: false;
    }

    /**
     * 获取最后一次登录记录
     */
    public function getLastLoginInfo($adminId)
    {
        $result = Db::name('admin_login_log')->where('adminId', 'eq', $adminId)->order('id desc')->find();
        return $result;
    }


}