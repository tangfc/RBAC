<?php

namespace app\admin\model;

use think\facade\Request;
use think\Model;
use think\Db;
use think\facade\Session;

class Department extends Model
{
    // 设置当前模型对应的完整数据表名称
    protected $table = 'tb_department';

    // 默认主键为id，如果你没有使用id作为主键名，需要在模型中设置属性：
    protected $pk = 'id';

    // 定义时间戳字段名
    protected $createTime = 'createTime';
    protected $updateTime = 'updateTime';

    /**
     * 获取部门列表
     * @param array $req 请求数组
     * @return array mixed
     * @author TFC
     */
    public function getList()
    {
        $req = Request::param();
        $where = [];
        if (isset($req['departmentName']) && !empty($req['departmentName'])) {
            $where[] = ['d.departmentName', 'like', "%" . $req['departmentName'] . "%"];
        }
        if (isset($req['stime']) && !empty($req['stime'])) {
            $where[] = ['d.createTime', 'egt', $req['stime']];
        }
        if (isset($req['etime']) && !empty($req['etime'])) {
            $where[] = ['d.createTime', 'elt', $req['etime']];
        }
        if (!isset($req['sort']) || empty($req['sort'])) {
            $req['sort'] = 'orderNo';
        }
        $ressult['total'] = Db::name('department')->alias('d')
            ->where($where)
            ->count();
        $ressult['rows'] = Db::name('department')->alias('d')
            ->where($where)
            ->order('d.' . $req['sort'], $req['order'])
            ->limit($req['offset'], $req['limit'])
            ->select();
        foreach ($ressult['rows'] as $key => &$value) {
            $ressult['rows'][$key]['icon'] = '<img src="' . json_decode($value['icon'], true)['origin'] . '" width="80" height="80" >';
            $temp = '';
            if (check_authority(Session::get('adminId'), 'admin/department/edit')) {
                $temp .= '<a href="javascript:;" class="btn btn-outline btn-primary btn-sm edit" data-id="' . $value['id'] . '"><i class="fa fa-edit"></i> 编辑</a> ';
            }
            if (check_authority(Session::get('adminId'), 'admin/department/adminList')) {
                $temp .= '<a href="javascript:;" class="btn btn-outline btn-info btn-sm admin" data-id="' . $value['id'] . '"><i class="fa fa-list"></i> 人员</a> ';
            }
            $ressult['rows'][$key]['do'] = $temp;
        }
        return $ressult;
    }

    /**
     *  新增
     * @return bool
     * @author TFC
     */
    public function insertDb()
    {
        $req = Request::param();
        $result = $this->strict(false)->insert($req);
        return $result ? true : false;
    }

    /**
     * 编辑
     * @return int|string
     * @author TFC
     */
    public function updateDb()
    {
        $req = Request::param();
        $result = $this->where('id', 'eq', $req['id'])->update([
            'departmentName' => $req['departmentName'],
            'icon' => $req['icon'],
            'remark' => $req['remark'],
            'orderNo' => $req['orderNo'],
            'updateTime' => date('Y-m-d H:i:s'),
        ]);
        return $result ? true : false;
    }

}