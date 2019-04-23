<?php

namespace app\common\controller;

use think\Controller;
use think\facade\Request;
use think\Db;

class Privilege extends Controller
{
    /**
     * 人员ID
     * @var int
     */
    protected $adminId = null;

    /**
     * 权限规则
     * @var string
     */
    protected $rule;

    /**
     * 核对权限
     * @param string $rule 权限规则
     * @param int $adminId 人员ID
     * @return bool
     * @author TFC
     */
    public function check($rule, $adminId)
    {
        if (!isset($rule) || !isset($adminId) || !is_string($rule) || !is_numeric($adminId)) {
            return false;
        }
        $this->adminId = $adminId;
        $this->rule = $rule;
        $havePrivileges = $this->getAllPrivilege();
        $havePrivileges = $this->dealRule($havePrivileges);
        if (in_array(strtolower($this->rule), $havePrivileges)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 获取该人员拥有角色的权限
     * @return mixed
     */
    protected function getAllPrivilege()
    {
        $result = Db::name('role_privilege')
            ->alias('rp')
            ->join('admin_role ar', 'ar.roleId = rp.roleId')
            ->join('privilege p', 'p.id = rp.privilegeId')
            ->where('ar.adminId', 'eq', $this->adminId)
            ->field('p.model,p.controller,p.action')
            ->select();
        return $result;
    }

    /**
     * 处理权限
     * @param array $ruleArr 权限数组
     * @return array
     */
    protected function dealRule($ruleArr = [])
    {
        if (empty($ruleArr) || !is_array($ruleArr)) {
            return $ruleArr;
        }
        $result = [];
        foreach ($ruleArr as $key => $value) {
            $result[] = strtolower($value['model'] . DS . $value['controller'] . DS . $value['action']);
        }
        return $result;
    }

}