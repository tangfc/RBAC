<?php

namespace app\admin\model;

use think\facade\Cache;
use think\facade\Request;
use think\Model;
use think\Db;

class Setting extends Model
{
    protected $pk = 'id';
    protected $table = 'tb_setting';
    protected $autoWriteTimestamp = 'datetime';

    // 定义时间戳字段名
    protected $createTime = 'createTime';
    protected $updateTime = 'updateTime';

    /**
     * 新增
     * @return bool|void
     * @author TFC
     */
    public function insertDb()
    {
        $req = Request::only(['siteName', 'title', 'keywords', 'description', 'copyright', 'recordNo', 'allowIps', 'allowLoginFailNo']);
        Db::startTrans();
        try {
            $this->allowField(true)->save($req);
            $this->setSettingCache();
            Db::commit();
            return true;
        } catch (\Exception $e) {
            Db::rollback();
            return false;
        }
    }

    /**
     * 编辑
     * @return bool|void
     * @author TFC
     */
    public function updateDb()
    {
        $req = Request::only(['id', 'title', 'siteName', 'keywords', 'description', 'copyright', 'recordNo', 'allowIps', 'allowLoginFailNo']);
        Db::startTrans();
        try {
            $this->allowField(true)->save($req, ['id' => $req['id']]);
            $this->setSettingCache();
            Db::commit();
            return true;
        } catch (\Exception $e) {
            Db::rollback();
            return false;
        }
    }

    /**
     * 设置配置项缓存
     * @return bool
     * @author TFC
     */
    public function setSettingCache()
    {
        return Cache::store('file')->set('systemSetting', get_table_find('setting')) ? true : false;
    }

}