<?php

namespace app\admin\model;

use think\facade\Config;
use think\facade\Request;
use think\facade\Session;
use think\Model;
use think\Db;

class BannerCategory extends Model
{
    protected $pk = 'id';
    protected $table = 'tb_banner_category';
    // 定义时间戳字段名
    protected $createTime = 'createTime';
    protected $updateTime = 'updateTime';

    /**
     * 列表
     * @return bool|void
     * @author TFC
     */
    public function getList()
    {
        $req = Request::param();
        $where = [];
        if (isset($req['categoryName']) && !empty($req['categoryName'])) {
            $where[] = ['categoryName', 'like', "%" . $req['categoryName'] . "%"];
        }
        if (isset($req['stime']) && !empty($req['stime'])) {
            $where[] = ['createTime', 'egt', $req['stime']];
        }
        if (isset($req['etime']) && !empty($req['etime'])) {
            $where[] = ['createTime', 'elt', $req['etime']];
        }
//        if (!isset($req['type']) || !empty($req['type'])) {
//            $where[] = ['type', 'eq', $req['type']];
//        }
        if (!isset($req['sort']) || empty($req['sort'])) {
            $req['sort'] = 'orderNo';
        }
        $result['total'] = $this->where($where)->count();
        $result['rows'] = $this->where($where)->order($req['sort'], $req['order'])->limit($req['offset'], $req['limit'])->select();
        foreach ($result['rows'] as $key => &$value) {
            $value['type'] = Config::get('global.banner_category_type')[$value['type']];
            $temp = '';
            if (check_authority(Session::get('adminId'), 'admin/bannerCategory/edit')) {
                $temp .= '<a href="javascript:;" class="btn btn-warning btn-outline btn-sm edit" data-id="' . $value['id'] . '"><i class="fa fa-edit"></i> 编辑</a> ';
            }
            if ($value['type'] == 2 && check_authority(Session::get('adminId'), 'admin/bannerCategory/delete') ) {
                $temp .= '<a href="javascript:;" class="btn btn-danger btn-outline btn-sm delete" data-id="' . $value['id'] . '"><i class="fa fa-trash"></i> 删除</a> ';
            }
            $result['rows'][$key]['do'] = $temp;
        }
        return $result;
    }

    /**
     * 新增
     * @return bool|void
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
     * @return bool
     * @author TFC
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
     * @return bool
     * @author TFC
     */
    public function deleteDb()
    {
        $req = Request::param();
        $where = [];
        $where[] = ['id', 'eq', $req['id']];
        $where[] = ['type', 'eq', 2];
        $result = $this->where($where)->delete();
        return $result > 0 ? true : false;
    }

    /**
     * 该分类下面是否还有banner
     * @return int|bool
     * @author TFC
     */
    public function getkBannerCountByBannerCategoryId()
    {
        $req = Request::param();
        $count = Db::name('banner')->where('bannerCategoryId', 'eq', $req['id'])->count();
        return $count ?: false;
    }
}