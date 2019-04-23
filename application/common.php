<?php
// 应用公共文件
use think\facade\Config;
use think\Db;

if (!function_exists('show')) {
    /**
     * @param string|int $status 返回类型 'n' 返回失败 'y' 返回成功
     * @param string $message 提示语
     * @param array $data 返回数据
     * @author TFC
     */
    function show($status, $info = '', $data = [])
    {
        $result = array(
            'status' => $status,
            'info' => $info,
            'data' => $data,
        );
        exit(json_encode($result));
    }
}

if (!function_exists('get_client_ip')) {
    /**
     * 获取客户端IP地址
     * @param integer $type 返回类型 0 返回IP地址 1 返回IPV4地址数字
     * @param boolean $adv 是否进行高级模式获取（有可能被伪装）
     * @return mixed
     * @author TFC
     */
    function get_client_ip($type = 0, $adv = false)
    {
        $type = $type ? 1 : 0;
        static $ip = NULL;
        if ($ip !== NULL) return $ip[$type];
        if ($adv) {
            if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
                $arr = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
                $pos = array_search('unknown', $arr);
                if (false !== $pos) unset($arr[$pos]);
                $ip = trim($arr[0]);
            } elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
                $ip = $_SERVER['HTTP_CLIENT_IP'];
            } elseif (isset($_SERVER['REMOTE_ADDR'])) {
                $ip = $_SERVER['REMOTE_ADDR'];
            }
        } elseif (isset($_SERVER['REMOTE_ADDR'])) {
            $ip = $_SERVER['REMOTE_ADDR'];
        }
        // IP地址合法验证
        $long = sprintf("%u", ip2long($ip));
        $ip = $long ? array($ip, $long) : array('0.0.0.0', 0);
        return $ip[$type];
    }
}


if (!function_exists('get_encrypt_password')) {
    /**
     * 获取加密之后的密码
     * @param string $pwd 密码
     * @author TFC
     */
    function get_encrypt_password($pwd)
    {
        return md5($pwd . Config::get('global.salt'));
    }
}

if (!function_exists('get_ip_info')) {

    /**
     * IP地址对应的地址
     * @param string $ip ip地址
     * @return bool
     * @author TFC
     */
    function get_ip_info($ip)
    {
        $res = curl_request('http://ip.taobao.com//service/getIpInfo.php?ip=' . $ip);
        $res = json_decode($res, true);
        if ($res['code'] != 0) return false;
        return $res['data'];
    }
}

if (!function_exists('curl_request')) {
    /**
     * curl请求
     * @param string $url 请求地址
     * @param array $data 请求数据
     * @param string $method get post
     * @return mixed|string
     * @author TFC
     */
    function curl_request($url, $data = [], $method = 'get')
    {
        $curl = curl_init(); // 启动一个CURL会话
        curl_setopt($curl, CURLOPT_URL, $url); // 要访问的地址
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0); // 对认证证书来源的检查
        curl_setopt($curl, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']); // 模拟用户使用的浏览器
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1); // 使用自动跳转
        curl_setopt($curl, CURLOPT_AUTOREFERER, 1); // 自动设置Referer
        curl_setopt($curl, CURLOPT_TIMEOUT, 30); // 设置超时限制防止死循环
        curl_setopt($curl, CURLOPT_HEADER, 0); // 显示返回的Header区域内容
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1); // 获取的信息以文件流的形式返回
        if ($method == 'post') {
            curl_setopt($curl, CURLOPT_POST, 1);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        }
        $output = curl_exec($curl);
        if (curl_error($curl)) {
            curl_close($curl);
            return curl_error($curl);
        } else {
            curl_close($curl);
            return $output;
        }
    }
}


if (!function_exists('base64_upload')) {
    /**
     * base64上传图片
     * @param string $base64 数据流
     * @param string $path 路径
     * @param string $method 上传方式
     * @return bool|string
     * @author TFC
     */
    function base64_upload($base64, $path, $method = 'post')
    {
        if ($method == 'post') { // post的数据里面，加号会被替换为空格，需要重新替换回来
            $base64 = str_replace(' ', '+', $base64);
        }
        //匹配出图片的格式
        if (preg_match('/^(data:\s*image\/(\w+);base64,)/', $base64, $result)) {
            $imageName = uniqid() . '.' . $result[2];
            if (substr($path, -1) != '/') {
                $path = $path . '/';
            }
            if (!is_dir($path)) {
                mkdir($path, 0777, true);
            }
            if (file_put_contents($path . $imageName, base64_decode(str_replace($result[1], '', $base64)))) {
                return '/' . $path . $imageName;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
}

if (!function_exists('file_to_base64')) {
    /**
     * 文件转base64输出
     * @param string $file 文件路径
     * @return string
     * @author TFC
     */
    function file_to_base64($file)
    {
        $base64_file = '';
        if (file_exists($file)) {
            $mime_type = mime_content_type($file);
            $base64_data = base64_encode(file_get_contents($file));
            $base64_file = 'data:' . $mime_type . ';base64,' . $base64_data;
        }
        return $base64_file;
    }
}


if (!function_exists('upload_image')) {
    /**
     * 图片上传
     * @param object $file 上传对象
     * @param string $filePath 文件存储路径
     * @param bool $savename 文件名称  false|名称即上传文件名称 true|自生成文件名称且加上时间目录  否则就是自己传文件名称和目录
     * @param int $size 文件大小（单位：B）
     * @param array $mime 文件类型
     * @param array $thumb 缩略图大小和名称前缀
     * @param int $type 缩略图样式 1|标识缩略图等比例缩放类型 2|标识缩略图缩放后填充类型 3|标识缩略图居中裁剪类型 4|标识缩略图左上角裁剪类型 5|标识缩略图右下角裁剪类型 6|标识缩略图固定尺寸缩放类型
     * @param bool $replace 同名文件是否覆盖
     * @return array
     * @author TFC
     */
    function upload_image($file, $filePath, $savename = true, $size, $mime = [], $thumb = [], $type = 1, $replace = false)
    {
        if (empty($file)) {
            return ['status' => false, 'info' => '非法参数'];
        }
        // 判断类型是否合法
        if (!$file->checkMime($mime)) {
            return ['status' => false, 'info' => "文件类型不合法！"];
        }
        // 判断大小是否合法
        if (!$file->checkSize($size)) {
            return ['status' => false, 'info' => "文件大小超出！"];
        }
        // 移动到$filePath目录下
        $info = $file->move(ltrim($filePath, DS), $savename);
        if ($info) {
            $imagePath = $info->getSaveName();
            // 定义存储图片地址的数组
            $imageUrl = [];
            // array_push($imageUrl, $filePath . $imagePath);
            $imageUrl['origin'] = $filePath . $imagePath;
            if (!empty($thumb) && is_array($thumb)) {
                $image = \think\Image::open(ltrim($filePath . $imagePath, DS));
                // 将图片路径转为数组
                $route = $previs = explode(DS, $imagePath);
                // 去掉数组最后一个
                unset($previs[count($previs) - 1]);
                $front = count($route) == 1 ? implode(DS, $previs) : implode(DS, $previs) . DS;
                $later = $route[count($route) - 1];
                foreach ($thumb as $key => $value) {
                    $imageRoute = ltrim($filePath . $front . $value[2] . '_' . $later, DS);
                    try {
                        // 按照原图的比例生成一个最大为$width*$height的缩略图并保存为thumb.png
                        $image->thumb($value[0], $value[1], $type)->save($imageRoute);
                        // array_push($imageUrl, $imageRoute);
                        $imageUrl[$value[2]] = DS . $imageRoute;
                    } catch (\Exception $e) {
                        return ['status' => false, 'info' => $e->getMessage()];
                    }
                }
            }
            return ['status' => true, 'info' => '文件上传成功！', 'data' => $imageUrl];;
        } else {
            // 上传失败获取错误信息
            return ['status' => false, 'info' => $file->getError()];
        }
    }

    if (!function_exists('get_tree')) {
        /**
         * 获取树形列表
         * @param array $list 处理数据
         * @param int $parentId 父级ID
         * @param int $step 第几层
         * @param array $param 第几层
         * @return array
         * @author TFC
         */
        function get_tree($list, $parentId, $step, $param = [])
        {
            global $tree;
            foreach ($list as $key => $val) {
                if ($val[$param['pid']] == $parentId) {
                    $flg = str_repeat('├─────', $step);
                    $val[$param['name']] = $flg . $val[$param['name']];
                    $tree[] = $val;
                    get_tree($list, $val['id'], $step + 1, $param);
                }
            }
            return $tree;
        }
    }

    if (!function_exists('get_tree_array')) {
        /**
         * 获取无限极数组
         * @param array $data 无限极分类数组
         * @param string $pk 主键名称
         * @param string $pid 父级ID名称
         * @param string $child 子集键名
         * @param int $root 顶级值
         * @return array
         * @author TFC
         */
        function get_tree_array($data, $pk = 'id', $pid = 'parentId', $child = '_childen', $root = 0)
        {
            $tree = [];
            foreach ($data as $key => $val) {
                if ($val[$pid] == $root) {
                    //获取当前$pid所有子类
                    unset($data[$key]);
                    if (!empty($data)) {
                        $childData = get_tree_array($data, $pk, $pid, $child, $val[$pk]);
                        if (!empty($childData)) {
                            $val[$child] = $childData;
                        }
                    }
                    $tree[] = $val;
                }
            }
            return $tree;
        }
    }

    if (!function_exists('get_table_find')) {
        /**
         * 查询特定表单条数据
         * @param string $table 数据表名
         * @param array $where 条件
         * @param string $field 字段
         * @param bool $column 是否转换
         * @return bool
         */
        function get_table_find($table = '', $where = [], $field = '*', $column = false)
        {
            if (empty($table)) {
                return false;
            }
            try {
                $result = Db::name($table)->where($where)->find();
            } catch (\Exception $e) {
                return false;
            }
            // 没有查询到数据
            if (is_null($result)) {
                return $result;
            }

            $fieldCount = explode(',', $field);
            if (true === $column && 1 === count($fieldCount) && $field !== '*') {
                return $result[$field];
            }
            return $result;
        }
    }

    if (!function_exists('get_table_select')) {
        /**
         * 查询特定表多条数据
         * @param string $table 数据表名
         * @param array $where 条件
         * @param string $field 字段
         * @param bool $column 是否转换
         * @param null $indexKey 返回数组的索引/键的列
         * @return bool
         */
        function get_table_select($table = '', $where = [], $field = '*', $column = false, $indexKey = null)
        {
            if (empty($table)) {
                return false;
            }
            try {
                $result = Db::name($table)->where($where)->select();
            } catch (\Exception $e) {
                return false;
            }
            // 没有查询到数据
            if (is_null($result)) {
                return $result;
            }

            $fieldCount = explode(',', $field);
            if (true === $column && 1 === count($fieldCount) && $field !== '*') {
                return array_column($result, $field, $indexKey);
            }
            return $result;
        }
    }

    if (!function_exists('check_authority')) {
        /**
         * 核对该登录人员是否拥有权限
         * @param integer $admin_id 管理员ID
         * @param string $rule 访问规则  eg: admin/index/index
         * @param bool $cahce 缓存
         * @return bool
         * @author TFC
         */
        function check_authority($adminTd, $rule, $cahce = true)
        {
            if (!is_numeric($adminTd) || empty($rule)) return false;
            if ($adminTd == 1) return true;
            // 获取角色IDs
            $ruleArr = Db::name('privilege')->alias('p')
                ->join('role_privilege rp', 'p.id = rp.privilegeId')
                ->join('role r', 'rp.roleId = r.id')
                ->join('admin_role ar', 'r.id = ar.roleId')
                ->where('ar.adminId', 'eq', $adminTd)
                ->field("concat_ws('/', p.model, p.controller, p.action) AS rule")
                ->select();
            if (!$ruleArr) return false;
            // 获取该管理员的权限
            return in_array($rule, array_column($ruleArr, 'rule')) ? true : false;
        }
    }


    if (!function_exists('get_rand_chars')) {
        /**
         * 随机获取指定长度的字符串
         * @param int $length 指定长度
         * @return null|string
         * @author TFC
         */
        function get_rand_chars($length)
        {
            $str = null;
            $strPol = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
            $max = strlen($strPol) - 1;
            for ($i = 0;
                 $i < $length;
                 $i++) {
                $str .= $strPol[rand(0, $max)];
            }
            return $str;
        }
    }

}


