<?php

namespace app\admin\model;

use think\facade\Config;
use think\facade\Request;
use think\Model;
use think\facade\Session;

class Banner extends Model
{
    protected $pk = 'id';
    protected $table = 'tb_banner';
    // 定义时间戳字段名
    protected $createTime = 'createTime';
    protected $updateTime = 'updateTime';

    /**
     * 获取部门列表
     * @param array $req 请求数组
     * @return array mixed
     */
    public function getList()
    {
        $req = Request::param();
        $where = [];
        if (isset($req['bannerCategoryId']) && !empty($req['bannerCategoryId'])) {
            $where[] = ['b.bannerCategoryId', 'eq', $req['bannerCategoryId']];
        }
        if (isset($req['title']) && !empty($req['title'])) {
            $where[] = ['b.title', 'like', "%" . $req['title'] . "%"];
        }
        if (isset($req['stime']) && !empty($req['stime'])) {
            $where[] = ['b.createTime', 'egt', $req['stime']];
        }
        if (isset($req['etime']) && !empty($req['etime'])) {
            $where[] = ['b.createTime', 'elt', $req['etime']];
        }
        if (!isset($req['sort']) || empty($req['sort'])) {
            $req['sort'] = 'orderNo';
        }
        if (!isset($req['order']) || empty($req['order'])) {
            $req['order'] = 'desc';
        }
        $res['total'] = $this->alias('b')
            ->join('bannerCategory bc', 'b.bannerCategoryId = bc.id')
            ->where($where)
            ->count();
        $res['rows'] = $this->alias('b')
            ->join('bannerCategory bc', 'b.bannerCategoryId = bc.id')
            ->order('b.' . $req['sort'], $req['order'])
            ->field('b.id,b.title,b.image,b.orderNo,b.type,b.url,b.createTime,bc.categoryName')
            ->limit($req['offset'], $req['limit'])
            ->where($where)
            ->select();
        foreach ($res['rows'] as $key => &$value) {
            $head = $value['type'] == 1 ? $_SERVER['SERVER_NAME'] : '';
            $image = json_decode($value['image'], true);
            $res['rows'][$key]['image'] = '<img src="' . $image['pc'] . '" style="max-height: 80px;">';
            $res['rows'][$key]['type'] = Config::get('global.banner_type')[$value['type']];
            $urlAddres = '';
            $urlAddres = "<p>原始地址：" . $head . $image['pc'] . "</p>";
            $urlAddres .= "<p>手机地址：" . $head . $image['mobile'] . "</p>";
            $urlAddres .= "<p>链接地址：" . $value['url'] . "</p>";
            $res['rows'][$key]['urlAddress'] = $urlAddres;
            $temp = '';
            if (check_authority(Session::get('adminId'), 'admin/banner/edit')) {
                $temp .= '<a href="javascript:;" class="btn btn-warning btn-outline btn-sm edit" data-id="' . $value['id'] . '"><i class="fa fa-edit"></i> 编辑</a> ';
            }
            if (check_authority(Session::get('adminId'), 'admin/banner/delete')) {
                $temp .= '<a href="javascript:;" class="btn btn-danger btn-outline btn-sm delete" data-id="' . $value['id'] . '"><i class="fa fa-trash"></i> 删除</a> ';
            }
            $res['rows'][$key]['do'] = $temp;
        }
        return $res;
    }

    /**
     * 新增
     * @return bool|void
     * @author TFC
     */
    public function insertDb()
    {
        $req = Request::param();
        if ($req['type'] == 1) {
            $result = $this->insert([
                'title' => $req['title'],
                'image' => json_encode(['pc' => json_decode($req['pc'], true)['origin'], 'mobile' => json_decode($req['mobile'], true)['origin']]),
                'url' => $req['url'],
                'bannerCategoryId' => $req['bannerCategoryId'],
                'type' => $req['type'],
                'orderNo' => $req['orderNo'],
            ]);
        } elseif ($req['type'] == 2) {
            $result = $this->insert([
                'title' => $req['title'],
                'image' => json_encode(['pc' => $req['resourcePc'], 'mobile' => $req['resourceMobile']]),
                'url' => $req['url'],
                'bannerCategoryId' => $req['bannerCategoryId'],
                'type' => $req['type'],
                'orderNo' => $req['orderNo'],
            ]);
        }
        return $result ? true : false;
    }

    /**
     * 编辑
     * @return bool|void
     * @author TFC
     */
    public function updateDb()
    {
        $req = Request::param();
        if ($req['type'] == 1) {
            $result = $this->where('id', 'eq', $req['id'])->update([
                'title' => $req['title'],
                'image' => json_encode(['pc' => json_decode($req['pc'], true)['origin'], 'mobile' => json_decode($req['mobile'], true)['origin']]),
                'url' => $req['url'],
                'bannerCategoryId' => $req['bannerCategoryId'],
                'type' => $req['type'],
                'orderNo' => $req['orderNo'],
                'updateTime' => date("Y-m-d H:i:s"),
            ]);
        } elseif ($req['type'] == 2) {
            $result = $this->where('id', 'eq', $req['id'])->update([
                'title' => $req['title'],
                'image' => json_encode(['pc' => $req['resourcePc'], 'mobile' => $req['resourceMobile']]),
                'url' => $req['url'],
                'bannerCategoryId' => $req['bannerCategoryId'],
                'type' => $req['type'],
                'orderNo' => $req['orderNo'],
                'updateTime' => date("Y-m-d H:i:s"),
            ]);
        }
        return $result ? true : false;
    }


    /**
     * 删除
     * @return bool
     * @author TFC
     */
    public function deleteDb()
    {
        $req = Request::param();
        $result = $this->where('id', 'eq', $req['id'])->delete();
        return $result > 0 ? true : false;
    }

}