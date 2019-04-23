<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

use think\facade\Route;

Route::get('api/:version/banner/:id', 'api/:version.Banner/getBanner');
Route::post('api/:version/token/user', 'api/:version.Token/getToken');
Route::get('api/:version/theme', 'api/:version.Theme/getTheme');

Route::get('api/:version/goodsDetail/:id', 'api/:version.Goods/getGoodsDetailById');