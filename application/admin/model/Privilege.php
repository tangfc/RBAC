<?php

namespace app\admin\model;

use think\facade\Config;
use think\facade\Request;
use think\facade\Session;
use think\Model;
use think\Db;

class Privilege extends Model
{
    protected $pk = 'id';
    protected $table = 'tb_privilege';
    // 定义时间戳字段名
    protected $createTime = 'createTime';
    protected $updateTime = 'updateTime';

    /**
     * 列表
     */
    public function getList()
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
        if (!isset($req['sort']) || empty($req['sort'])) {
            $req['sort'] = 'orderNo';
        }
        $result['total'] = $this->where($where)->count();
        $result['rows'] = $this
            ->where($where)
            ->order($req['sort'], $req['order'])
            ->select();

        $result['rows'] = get_tree($result['rows'], 0, 0, ['pid' => 'parentId', 'name' => 'privilegeName']);
        foreach ($result['rows'] as $key => &$value) {
            $value['type'] = Config::get('global.privilege_type')[$value['type']];
            $value['route'] = $value['model'] . '/' . $value['controller'] . '/' . $value['action'];
            $temp = '';
            if (check_authority(Session::get('adminId'), 'admin/privilege/edit')) {
                $temp .= '<a href="javascript:;" class="btn btn-outline btn-warning btn-sm edit" data-id="' . $value['id'] . '"><i class="fa fa-edit"></i> 编辑</a> ';
            }
            if (check_authority(Session::get('adminId'), 'admin/privilege/son')) {
                $temp .= '<a href="javascript:;" class="btn btn-outline btn-primary btn-sm son" data-id="' . $value['id'] . '"><i class="fa fa-plus"></i> 下级权限</a> ';
            }
            if (check_authority(Session::get('adminId'), 'admin/privilege/delete')) {
                $temp .= '<a href="javascript:;" class="btn btn-outline btn-danger btn-sm delete" data-id="' . $value['id'] . '"><i class="fa fa-remove"></i> 删除</a> ';
            }
            $result['rows'][$key]['do'] = $temp;
        }
        return $result;
    }

    /**
     * 角色单个
     * @return array|false|null|\PDOStatement|string|Model
     */
    public function getSingleInfo()
    {
        $req = Request::param();
        $result = $this->where('id', 'eq', $req['id'])->find();
        return $result;
    }

    /**
     * 权限新增
     * @return bool
     */
    public function insertDb()
    {
        $req = Request::param();
        $result = $this->strict(false)->insert($req);
        return $result > 0 ? true : false;
    }

    /**
     * 权限更新
     * @return bool
     */
    public function updateDb()
    {
        $req = Request::param();
        $req['updateTime'] = date('Y-m-d H:i:s');
        $result = $this->strict(false)->update($req);
        return $result > 0 ? true : false;
    }

    /**
     * 删除
     */
    public function deleteDb()
    {
        $req = Request::param();
        Db::startTrans();
        try {
            // 判断该权限是否有下级权限
            $count = $this->where('parentId', 'eq', $req['id'])->count();
            if ($count >= 1) {
                // 使用think自带异常类抛出异常
                throw new \think\Exception('该权限存在下级权限');
            }
            $this->delete($req['id']);
            Db::commit();
            return true;
        } catch (\Exception $e) {
            Db::rollback();
            return $e->getMessage();
        }
    }

    public function getPrivilegeList()
    {
        $req = Request::param();
        $privilegeList = $this->field('id,parentId,privilegeName,model,controller,action')->select();
        $privilegeList = get_tree_array($privilegeList, $pk = 'id', $pid = 'parentId', $child = 'nodes', $root = 0);
        // 获取该角色拥有权限IDs
        $rolePrivilege = Db::name('role_privilege')->field('privilegeId')->where('roleId', 'eq', $req['roleId'])->select();
        $havePrivilegeIds = array_column($rolePrivilege, 'privilegeId');
        // 处理权限
        $privilegeList = self::dealPrivilgeData($privilegeList, 'nodes', $havePrivilegeIds);
        return $privilegeList ?: false;
    }


    public function dealPrivilgeData($data, $child = '_child', $have = [])
    {
        $result = [];
        if (is_array($data)) {
            foreach ($data as $key => $value) {
                $temp = [];
                $temp['text'] = $value['privilegeName'];
                $temp['href'] = '#' . $value['privilegeName'];
                $temp['tags'] = [$value['id'], $value['parentId']];
                $temp['state'] = [
                    'checked' => in_array($value['id'], $have) ? true : false,
                    'expanded' => false,
                ];
                $result[$key] = $temp;
                if (isset($value['nodes']) && is_array($value['nodes'])) {
                    foreach ($value['nodes'] as $k1 => $v1) {
                        $temp = [];
                        $temp['text'] = $v1['privilegeName'];
                        $temp['href'] = '#' . $v1['privilegeName'];
                        $temp['tags'] = [$v1['id'], $v1['parentId']];
                        $temp['state'] = [
                            'checked' => in_array($v1['id'], $have) ? true : false,
                            'expanded' => false,
                        ];
                        $result[$key]['nodes'][$k1] = $temp;
                        if (isset($v1['nodes']) && is_array($v1['nodes'])) {
                            foreach ($v1['nodes'] as $k2 => $v2) {
                                $temp = [];
                                $temp['text'] = $v2['privilegeName'];
                                $temp['href'] = '#' . $v2['privilegeName'];
                                $temp['tags'] = [$v2['id'], $v2['parentId']];
                                $temp['state'] = [
                                    'checked' => in_array($v2['id'], $have) ? true : false,
                                    'expanded' => false,
                                ];
                                $result[$key]['nodes'][$k1]['nodes'][$k2] = $temp;

                            }
                        }

                    }
                }
            }
        }
        return $result;
    }


}