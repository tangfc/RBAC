/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : waw

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-11-03 22:23:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_address`;
CREATE TABLE `tb_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '姓名',
  `mobile` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '电话',
  `province` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '省份',
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '城市',
  `area` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '区域',
  `address` text CHARACTER SET utf8 NOT NULL COMMENT '地址',
  `isdefault` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否默认地址',
  `member_id` bigint(11) NOT NULL COMMENT '会员id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '编辑',
  `isdel` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `mobile` (`mobile`),
  KEY `province` (`province`),
  KEY `city` (`city`),
  KEY `area` (`area`),
  KEY `isdefault` (`isdefault`),
  KEY `member_id` (`member_id`),
  KEY `createtime` (`create_time`),
  KEY `isdel` (`isdel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='收货地址';

-- ----------------------------
-- Records of tb_address
-- ----------------------------

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL COMMENT '账号',
  `password` char(32) NOT NULL COMMENT '密码',
  `mobile` int(11) NOT NULL COMMENT '手机号',
  `landline` varchar(15) DEFAULT NULL COMMENT '座机',
  `qq` varchar(15) NOT NULL COMMENT 'qq',
  `realname` varchar(255) NOT NULL COMMENT '真实姓名',
  `headimg` text COMMENT '头像地址',
  `departmentId` int(11) unsigned NOT NULL COMMENT '部门ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态  1在职 2冻结 3离职 ',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `department_id` (`departmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COMMENT='后台管理员';

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', '华哥', 'b8400559dc2ad671884c43a4c3c32aeb', '2147483647', '0533-7239861', '1234567890', '陈博华', '/uploads/admin/headimg/5ba2fc0dd3807.png', '1', '1', '', '2018-11-01 10:45:49', '2018-11-01 10:45:49');
INSERT INTO `tb_admin` VALUES ('2', '雪见', 'b8400559dc2ad671884c43a4c3c32aeb', '2147483647', '0533-7239861', '1013199614', '唐雪见', '/uploads/admin/headimg/5ba0f719bcb1a.png', '3', '1', '', '2018-09-18 21:04:11', '2018-09-18 21:04:11');
INSERT INTO `tb_admin` VALUES ('90', '夕瑶仙子', 'b8400559dc2ad671884c43a4c3c32aeb', '2147483647', '0533-7239861', '123123', '夕瑶', '/uploads/admin/headimg/5ba0f79697217.png', '5', '1', '', '2018-09-21 08:16:20', '2018-09-21 08:16:20');
INSERT INTO `tb_admin` VALUES ('91', '千年等待', 'b8400559dc2ad671884c43a4c3c32aeb', '2147483647', '0533-7239861', '888888888', '龙葵', '/uploads/admin/headimg/5ba0f98c88a7c.png', '6', '1', '', '2018-09-18 21:12:07', '2018-09-18 21:12:07');
INSERT INTO `tb_admin` VALUES ('92', '魔尊', 'b8400559dc2ad671884c43a4c3c32aeb', '2147483647', '0533-7239861', '12345678', '重楼', '/uploads/admin/headimg/5ba0faf39636d.png', '5', '1', '', '2018-09-18 21:17:39', null);
INSERT INTO `tb_admin` VALUES ('93', '白豆腐', 'b8400559dc2ad671884c43a4c3c32aeb', '2147483647', '0533-7239861', '12312312', '徐长卿', '/uploads/admin/headimg/5ba0fbdbcd758.png', '7', '1', '', '2018-09-18 21:21:31', null);

-- ----------------------------
-- Table structure for tb_admin_department
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_department`;
CREATE TABLE `tb_admin_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `authorizelist` text COMMENT '权限',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 平台 2系统隐藏',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `edittime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '编辑',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `creattime` (`createtime`),
  KEY `edittime` (`edittime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台部门';

-- ----------------------------
-- Records of tb_admin_department
-- ----------------------------

-- ----------------------------
-- Table structure for tb_admin_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_info`;
CREATE TABLE `tb_admin_info` (
  `tbid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `freeze_inte` int(11) NOT NULL DEFAULT '0' COMMENT '冻结积分',
  `integral` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '城市',
  `area` varchar(255) NOT NULL DEFAULT '' COMMENT '区域',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '入驻状态  1--等待审核   2--审核失败  3--审核通过',
  `contact_name` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `contact_mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人手机',
  `wechat` varchar(255) NOT NULL DEFAULT '' COMMENT '微信号',
  `c_province` varchar(255) NOT NULL DEFAULT '' COMMENT '省',
  `c_city` varchar(255) NOT NULL DEFAULT '' COMMENT '城市',
  `c_area` varchar(255) NOT NULL DEFAULT '' COMMENT '区域',
  `c_addr` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `com_name` varchar(255) NOT NULL DEFAULT '' COMMENT '公司名称',
  `com_url` varchar(255) NOT NULL DEFAULT '' COMMENT '公司网址',
  `wechat_pub` varchar(255) NOT NULL DEFAULT '' COMMENT '微信公众号',
  `legal_rep` varchar(255) NOT NULL DEFAULT '' COMMENT '法人代表',
  `business_scope` varchar(255) NOT NULL DEFAULT '' COMMENT '经营范围',
  `business_license` varchar(255) NOT NULL DEFAULT '' COMMENT '营业执照',
  `brand_auth` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌授权书',
  `cre_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `m_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '商户id',
  `isfreezed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否冻结',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1--现金商户   2--积分商户 ',
  `deal_admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '审核人id',
  `notice_power` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 默认开启   0 --关闭',
  `order_power` tinyint(1) NOT NULL DEFAULT '1' COMMENT '查看订单权限',
  `message_power` tinyint(1) NOT NULL DEFAULT '1' COMMENT '发送消息权限',
  `integral_warning` bigint(20) NOT NULL DEFAULT '1000' COMMENT '积分预警设置',
  `operate_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '运营状态  1--开启   0--关闭',
  `ratio` decimal(10,2) unsigned NOT NULL DEFAULT '5.00' COMMENT '充值比例',
  `shops_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '可开设店铺数',
  `refuse_reason` text COMMENT '审核拒绝理由',
  `mobile` varchar(20) DEFAULT '',
  PRIMARY KEY (`tbid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户管理员信息';

-- ----------------------------
-- Records of tb_admin_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_admin_login_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_login_log`;
CREATE TABLE `tb_admin_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adminId` int(11) unsigned NOT NULL COMMENT '管理员id',
  `ip` bigint(15) NOT NULL COMMENT 'IP地址',
  `operator` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '运营商',
  `country` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '国家',
  `province` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '省',
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '市',
  `county` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '区/县',
  `area` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '详细地址',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '登录状态 0--失败  1--成功 ',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '编辑',
  PRIMARY KEY (`id`),
  KEY `creattime` (`createTime`),
  KEY `edittime` (`updateTime`),
  KEY `ip` (`ip`),
  KEY `admin_member_id` (`adminId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='管理员登录记录';

-- ----------------------------
-- Records of tb_admin_login_log
-- ----------------------------
INSERT INTO `tb_admin_login_log` VALUES ('1', '1', '2130706433', '内网IP', 'XX', 'XX', '内网IP', '内网IP', '', '1', '2018-09-25 11:01:20', '0000-00-00 00:00:00');
INSERT INTO `tb_admin_login_log` VALUES ('2', '1', '2130706433', '内网IP', 'XX', 'XX', '内网IP', '内网IP', '', '1', '2018-09-26 18:52:29', '0000-00-00 00:00:00');
INSERT INTO `tb_admin_login_log` VALUES ('3', '1', '2130706433', '内网IP', 'XX', 'XX', '内网IP', '内网IP', '', '1', '2018-10-09 15:18:18', '0000-00-00 00:00:00');
INSERT INTO `tb_admin_login_log` VALUES ('4', '1', '2130706433', '内网IP', 'XX', 'XX', '内网IP', '内网IP', '', '1', '2018-10-11 16:51:38', '0000-00-00 00:00:00');
INSERT INTO `tb_admin_login_log` VALUES ('5', '1', '2130706433', '内网IP', 'XX', 'XX', '内网IP', '内网IP', '', '1', '2018-10-16 14:44:19', '0000-00-00 00:00:00');
INSERT INTO `tb_admin_login_log` VALUES ('6', '1', '2130706433', '内网IP', 'XX', 'XX', '内网IP', '内网IP', '', '1', '2018-10-24 14:52:40', '0000-00-00 00:00:00');
INSERT INTO `tb_admin_login_log` VALUES ('7', '1', '2130706433', '内网IP', 'XX', 'XX', '内网IP', '内网IP', '', '1', '2018-10-25 09:58:28', '0000-00-00 00:00:00');
INSERT INTO `tb_admin_login_log` VALUES ('8', '1', '2130706433', '内网IP', 'XX', 'XX', '内网IP', '内网IP', '', '1', '2018-10-26 16:27:49', '0000-00-00 00:00:00');
INSERT INTO `tb_admin_login_log` VALUES ('9', '1', '2130706433', '内网IP', 'XX', 'XX', '内网IP', '内网IP', '', '1', '2018-10-28 11:06:14', '0000-00-00 00:00:00');
INSERT INTO `tb_admin_login_log` VALUES ('10', '1', '2130706433', '内网IP', 'XX', 'XX', '内网IP', '内网IP', '', '1', '2018-10-28 13:52:44', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for tb_admin_operating_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_operating_detail`;
CREATE TABLE `tb_admin_operating_detail` (
  `tbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_member_operating_log_id` bigint(20) NOT NULL COMMENT '管理员id',
  `table` varchar(255) NOT NULL COMMENT '表名',
  `type` tinyint(20) NOT NULL COMMENT '1 编辑 2删除',
  `olddata` text COMMENT '操作前数据',
  `newdata` text COMMENT '操作后数据',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `edittime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '编辑',
  PRIMARY KEY (`tbid`),
  KEY `createtime` (`createtime`),
  KEY `edittime` (`edittime`),
  KEY `admin_member_operating_log_id` (`admin_member_operating_log_id`) USING BTREE,
  KEY `type` (`type`),
  KEY `table` (`table`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员操作记录详情';

-- ----------------------------
-- Records of tb_admin_operating_detail
-- ----------------------------

-- ----------------------------
-- Table structure for tb_admin_operating_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_operating_log`;
CREATE TABLE `tb_admin_operating_log` (
  `tbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_member_id` bigint(20) NOT NULL COMMENT '管理员id',
  `intro` varchar(255) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `edittime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '编辑',
  PRIMARY KEY (`tbid`),
  KEY `createtime` (`createtime`),
  KEY `edittime` (`edittime`),
  KEY `admin_member_id` (`admin_member_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员操作记录';

-- ----------------------------
-- Records of tb_admin_operating_log
-- ----------------------------

-- ----------------------------
-- Table structure for tb_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_role`;
CREATE TABLE `tb_admin_role` (
  `adminId` int(11) unsigned NOT NULL COMMENT '角色ID',
  `roleId` int(11) unsigned NOT NULL COMMENT '角色ID',
  `merchantId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商户ID 默认平台',
  `shopId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID 默认平台',
  `roleType` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admin_role
-- ----------------------------
INSERT INTO `tb_admin_role` VALUES ('2', '2', '0', '0', '0');
INSERT INTO `tb_admin_role` VALUES ('90', '3', '0', '0', '0');
INSERT INTO `tb_admin_role` VALUES ('91', '6', '0', '0', '0');
INSERT INTO `tb_admin_role` VALUES ('92', '7', '0', '0', '0');
INSERT INTO `tb_admin_role` VALUES ('93', '7', '0', '0', '0');
INSERT INTO `tb_admin_role` VALUES ('1', '10', '1', '1', '2');
INSERT INTO `tb_admin_role` VALUES ('95', '11', '1', '1', '2');

-- ----------------------------
-- Table structure for tb_banner
-- ----------------------------
DROP TABLE IF EXISTS `tb_banner`;
CREATE TABLE `tb_banner` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `pcImg` text NOT NULL COMMENT 'PC端图片',
  `mImg` text NOT NULL COMMENT '手机端图片',
  `pcUrl` varchar(255) DEFAULT '' COMMENT 'PC链接地址',
  `mUrl` varchar(255) DEFAULT NULL COMMENT '手机链接地址',
  `bannerCategoryId` int(11) unsigned NOT NULL COMMENT 'banner分类id',
  `type` tinyint(4) DEFAULT '1' COMMENT '类型 1--本地上传 2--远程资源',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '编辑时间',
  `orderNo` int(11) NOT NULL DEFAULT '100' COMMENT '排序值  数值越小，排序越靠前',
  `imageId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `banner_category_id` (`bannerCategoryId`),
  KEY `creattime` (`createTime`),
  KEY `edittime` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='banner';

-- ----------------------------
-- Records of tb_banner
-- ----------------------------
INSERT INTO `tb_banner` VALUES ('6', '度假胜地', '', '', 'http://www.baidu.com', null, '1', '2', null, '2018-09-16 17:59:36', '2018-10-17 17:07:25', '1000', '1');
INSERT INTO `tb_banner` VALUES ('8', '智慧天堂', '', '', 'http://www.baidu.com', null, '1', '2', null, '2018-09-16 18:24:04', '2018-10-17 17:08:03', '1000', '2');
INSERT INTO `tb_banner` VALUES ('9', '生命澎湃', '', '', 'http://www.baidu.com', null, '1', '2', null, '2018-10-16 14:46:34', '2018-10-17 17:10:27', '1000', '0');
INSERT INTO `tb_banner` VALUES ('11', '首页Banner--1', '\\uploads\\\\shop\\\\banner\\\\ea50903fbf83c641863d909fdd256513.jpg', '\\uploads\\shop\\\\banner\\2cab0953ffe09ae9ec90280d011c8b76.png', 'http://www.baidu.com', 'http://www.baidu.com', '54', '1', '', '2018-11-02 10:28:59', '0000-00-00 00:00:00', '1000', '0');
INSERT INTO `tb_banner` VALUES ('12', 'Banner -- 2', '\\uploads\\shop\\banner\\bfb132ed1b192d8118b5f25239e4db0c.png', '\\uploads\\shop\\banner\\eb4166694f9343e309e9b1f8eadc7bf1.png', '', '', '54', '1', '', '2018-11-03 20:23:43', '2018-11-03 21:49:02', '1000', '0');

-- ----------------------------
-- Table structure for tb_banner_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_banner_category`;
CREATE TABLE `tb_banner_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `merchantId` int(11) unsigned NOT NULL COMMENT '商户ID',
  `shopId` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `roleType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '角色类型',
  `categoryName` varchar(100) NOT NULL COMMENT '标题',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1--不可删',
  `orderNo` smallint(5) unsigned NOT NULL DEFAULT '1000' COMMENT '排序值',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '编辑时间',
  PRIMARY KEY (`id`),
  KEY `creattime` (`createTime`),
  KEY `edittime` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='banner分类表';

-- ----------------------------
-- Records of tb_banner_category
-- ----------------------------
INSERT INTO `tb_banner_category` VALUES ('1', '0', '0', '0', '首页Banner', '1', '9999', '', '2018-09-15 16:05:23', '2018-09-19 08:49:16');
INSERT INTO `tb_banner_category` VALUES ('51', '0', '0', '0', '合作伙伴', '2', '1000', '', '2018-09-15 17:08:38', '0000-00-00 00:00:00');
INSERT INTO `tb_banner_category` VALUES ('53', '0', '0', '0', '弹框广告图', '1', '1000', '', '2018-09-16 11:56:37', '0000-00-00 00:00:00');
INSERT INTO `tb_banner_category` VALUES ('54', '1', '1', '2', '首页Banner', '1', '1000', '', '2018-11-01 21:01:16', '2018-11-01 21:06:19');

-- ----------------------------
-- Table structure for tb_brand
-- ----------------------------
DROP TABLE IF EXISTS `tb_brand`;
CREATE TABLE `tb_brand` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `chinese` varchar(50) NOT NULL COMMENT '中文名称',
  `english` varchar(50) NOT NULL COMMENT '英文名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品牌表';

-- ----------------------------
-- Records of tb_brand
-- ----------------------------

-- ----------------------------
-- Table structure for tb_department
-- ----------------------------
DROP TABLE IF EXISTS `tb_department`;
CREATE TABLE `tb_department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `merchantId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商户ID',
  `shopId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `departmentName` varchar(50) NOT NULL COMMENT '部门名称',
  `icon` varchar(255) NOT NULL COMMENT '部门图标',
  `parentId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '部门等级',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `orderNo` int(11) unsigned NOT NULL DEFAULT '1000' COMMENT '排序值 大的排前面',
  `roleType` tinyint(1) unsigned NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_department
-- ----------------------------
INSERT INTO `tb_department` VALUES ('1', '0', '0', '管理部', '{\"origin\":\"\\\\uploads\\\\department\\\\c7646d6a87358075d24a201daed15694.png\"}', '0', '超级管理员所在部门', '1000', '0', '2018-09-18 18:55:49', '2018-09-18 18:55:49');
INSERT INTO `tb_department` VALUES ('2', '0', '0', '商务部', '{\"origin\":\"\\\\uploads\\\\department\\\\46f28f5966bfb55bddd759a4f375240a.png\"}', '0', '', '1000', '0', '2018-09-18 09:29:58', '2018-09-18 09:29:58');
INSERT INTO `tb_department` VALUES ('3', '0', '0', '财务部', '{\"origin\":\"\\\\uploads\\\\department\\\\da98a017730de9afadd32f81ef6e5e0a.png\"}', '0', '', '1000', '0', '2018-09-18 09:30:10', '2018-09-18 09:30:10');
INSERT INTO `tb_department` VALUES ('4', '0', '0', '技术部', '{\"origin\":\"\\\\uploads\\\\department\\\\f78d63862ae3e28d6751df4457df475c.png\"}', '0', '', '1000', '0', '2018-09-18 18:52:20', '2018-09-18 18:52:20');
INSERT INTO `tb_department` VALUES ('5', '0', '0', '产品部', '{\"origin\":\"\\\\uploads\\\\department\\\\d57576c9733bb1143b4716c3337125de.png\"}', '0', '', '1000', '0', '2018-09-18 21:05:14', null);
INSERT INTO `tb_department` VALUES ('6', '0', '0', '设计部', '{\"origin\":\"\\\\uploads\\\\department\\\\2cf7d381cb602b6c2fef12b23258ce9d.png\"}', '0', '', '1000', '0', '2018-09-18 21:08:46', null);
INSERT INTO `tb_department` VALUES ('7', '0', '0', '人事部', '{\"origin\":\"\\\\uploads\\\\department\\\\30b889f22b08bd207364933a8d0a7236.png\"}', '0', '', '1000', '0', '2018-09-18 21:19:05', null);

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '商品名称',
  `summary` varchar(255) NOT NULL COMMENT '简介',
  `image` text NOT NULL COMMENT '图片',
  `price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品价格（单位：分 ）',
  `discount` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '折扣 0--无折扣  其他折扣',
  `stock` int(11) unsigned NOT NULL DEFAULT '99' COMMENT '库存',
  `sales` int(11) NOT NULL DEFAULT '0' COMMENT '销售量',
  `clicks` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `origin` varchar(100) NOT NULL DEFAULT '' COMMENT '产地',
  `itemCode` varchar(50) NOT NULL DEFAULT '' COMMENT '商品编码',
  `weight` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '重量（单位g）',
  `brandId` int(11) NOT NULL COMMENT '品牌ID',
  `attribute` longtext COMMENT '属性',
  `content` longtext COMMENT '详情',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态   0下架1上架',
  `goodsCategoryId` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品类目id',
  `deliveryId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '快递模板id',
  `isRecommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐  0--不推荐  1--推荐',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '编辑时间',
  PRIMARY KEY (`id`),
  KEY `itemcode` (`itemCode`),
  KEY `state` (`status`),
  KEY `sales` (`sales`),
  KEY `origin` (`origin`),
  KEY `goods_category_id` (`goodsCategoryId`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `intro` (`summary`) USING BTREE,
  KEY `createtime` (`createTime`),
  KEY `edittime` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='商品';

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES ('1', '中长款双面呢拉夏贝尔2018秋冬新款秋赫本风呢子大衣毛呢外套女', '', 'https://img.alicdn.com/imgextra/i2/2382603663/O1CN011cvhFlQtBUifIoT_!!2382603663.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLZkqqVJUzDJ_!!2146742267.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg', '99900', '100', '100', '1', '8', '中国', '', '0.00', '1', null, '<p><img src=\"https://gdp.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLbh6HDXUtVz_!!2146742267.jpg\" title=\"1514969566157870.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLQ0UGeby6Be_!!2146742267.jpg\" title=\"1514969567904803.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLVXFy7OR6DZ_!!2146742267.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLcMZzie024u_!!2146742267.jpg\" title=\"1514969568488597.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i1/2146742267/O1CN011ScKLQuTYSQp6Kg_!!2146742267.jpg\" title=\"1514969569736584.jpg\"/>', '1', '0', '0', '1', '2018-01-04 10:32:11', null);
INSERT INTO `tb_goods` VALUES ('2', 'Y连帽面包羽绒服女装拉夏贝尔2018冬季新款韩版宽松中长过膝外套', '', 'https://img.alicdn.com/imgextra/i2/2382603663/O1CN011cvhFvbBClZ597L_!!0-item_pic.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLZkqqVJUzDJ_!!2146742267.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg', '123000', '95', '100', '0', '2', '中国', '', '0.00', '1', null, '<p><img src=\"https://gdp.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLbh6HDXUtVz_!!2146742267.jpg\" title=\"1514969566157870.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLQ0UGeby6Be_!!2146742267.jpg\" title=\"1514969567904803.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLVXFy7OR6DZ_!!2146742267.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLcMZzie024u_!!2146742267.jpg\" title=\"1514969568488597.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i1/2146742267/O1CN011ScKLQuTYSQp6Kg_!!2146742267.jpg\" title=\"1514969569736584.jpg\"/>', '1', '0', '0', '1', '2018-01-04 10:32:11', null);
INSERT INTO `tb_goods` VALUES ('3', '拉夏贝尔7m2018秋装新款韩版修身长袖上衣原宿bf风短款牛仔外套女', '', 'https://img.alicdn.com/imgextra/i4/2382603663/O1CN011cvhFsTHjxON5zK_!!0-item_pic.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLZkqqVJUzDJ_!!2146742267.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg', '99900', '80', '100', '7', '61', '中国', '', '0.00', '1', null, '<p><img src=\"https://gdp.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLbh6HDXUtVz_!!2146742267.jpg\" title=\"1514969566157870.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLQ0UGeby6Be_!!2146742267.jpg\" title=\"1514969567904803.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLVXFy7OR6DZ_!!2146742267.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLcMZzie024u_!!2146742267.jpg\" title=\"1514969568488597.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i1/2146742267/O1CN011ScKLQuTYSQp6Kg_!!2146742267.jpg\" title=\"1514969569736584.jpg\"/>', '1', '0', '0', '1', '2018-01-04 10:32:01', null);
INSERT INTO `tb_goods` VALUES ('4', '港味复古休闲纽扣短款牛仔外套女秋装2018新款宽松长袖牛仔衣夹克', '', 'https://img.alicdn.com/imgextra/i3/2382603663/O1CN011cvhFuxUyvWGp8c_!!0-item_pic.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLZkqqVJUzDJ_!!2146742267.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg', '88800', '60', '100', '0', '1', '中国', '', '0.00', '1', null, '<p><img src=\"https://gdp.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLbh6HDXUtVz_!!2146742267.jpg\" title=\"1514969566157870.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLQ0UGeby6Be_!!2146742267.jpg\" title=\"1514969567904803.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLVXFy7OR6DZ_!!2146742267.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLcMZzie024u_!!2146742267.jpg\" title=\"1514969568488597.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i1/2146742267/O1CN011ScKLQuTYSQp6Kg_!!2146742267.jpg\" title=\"1514969569736584.jpg\"/>', '1', '0', '0', '1', '2018-01-04 10:32:01', null);
INSERT INTO `tb_goods` VALUES ('5', '拉夏贝尔国内正品代购淑女2018秋装新款10018266中长款风衣外套女', '', 'https://img.alicdn.com/imgextra/i1/2382603663/O1CN011cvhFvAReRoKxtB_!!0-item_pic.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLZkqqVJUzDJ_!!2146742267.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg', '77700', '10', '100', '12', '70', '韩国', '', '0.00', '1', null, '<p><img src=\"https://gdp.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLbh6HDXUtVz_!!2146742267.jpg\" title=\"1514969566157870.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLQ0UGeby6Be_!!2146742267.jpg\" title=\"1514969567904803.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLVXFy7OR6DZ_!!2146742267.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLcMZzie024u_!!2146742267.jpg\" title=\"1514969568488597.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i1/2146742267/O1CN011ScKLQuTYSQp6Kg_!!2146742267.jpg\" title=\"1514969569736584.jpg\"/>', '1', '0', '0', '1', '2018-01-04 10:32:03', null);
INSERT INTO `tb_goods` VALUES ('6', 'II羽绒服女2018新款冬季短款时尚秋冬女士斗篷宽松学生外套面包服', '', 'https://img.alicdn.com/imgextra/i1/2382603663/O1CN011cvhFuJBIJYaBHX_!!0-item_pic.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLZkqqVJUzDJ_!!2146742267.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg', '77700', '100', '100', '0', '2', '韩国', '', '0.00', '1', null, '<p><img src=\"https://gdp.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLbh6HDXUtVz_!!2146742267.jpg\" title=\"1514969566157870.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLQ0UGeby6Be_!!2146742267.jpg\" title=\"1514969567904803.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLVXFy7OR6DZ_!!2146742267.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLcMZzie024u_!!2146742267.jpg\" title=\"1514969568488597.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i1/2146742267/O1CN011ScKLQuTYSQp6Kg_!!2146742267.jpg\" title=\"1514969569736584.jpg\"/>', '1', '0', '0', '1', '2018-01-04 10:32:03', null);
INSERT INTO `tb_goods` VALUES ('7', '连帽拼接连衣裙2018秋冬新款拉夏贝尔7m卡通印花长袖加厚针织卫衣\r\n', '', 'http://img02.tooopen.com/images/20150928/tooopen_sy_143912755726.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLZkqqVJUzDJ_!!2146742267.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg', '77700', '100', '100', '1', '1', '中国', '', '0.00', '1', null, '<p><img src=\"https://gdp.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLbh6HDXUtVz_!!2146742267.jpg\" title=\"1514969566157870.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLQ0UGeby6Be_!!2146742267.jpg\" title=\"1514969567904803.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLVXFy7OR6DZ_!!2146742267.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLcMZzie024u_!!2146742267.jpg\" title=\"1514969568488597.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i1/2146742267/O1CN011ScKLQuTYSQp6Kg_!!2146742267.jpg\" title=\"1514969569736584.jpg\"/>', '1', '0', '0', '1', '2018-01-04 11:44:23', null);
INSERT INTO `tb_goods` VALUES ('8', '韩版棉服女短款2018冬季新款连帽秋棉袄学生棉衣宽松加厚外套女士', '', 'https://img.alicdn.com/imgextra/i2/2382603663/O1CN011cvhFlQtBUifIoT_!!2382603663.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLZkqqVJUzDJ_!!2146742267.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg', '77700', '100', '100', '0', '1', '中国', '', '0.00', '1', null, '<p><img src=\"https://gdp.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLbh6HDXUtVz_!!2146742267.jpg\" title=\"1514969566157870.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLQ0UGeby6Be_!!2146742267.jpg\" title=\"1514969567904803.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLVXFy7OR6DZ_!!2146742267.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLcMZzie024u_!!2146742267.jpg\" title=\"1514969568488597.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i1/2146742267/O1CN011ScKLQuTYSQp6Kg_!!2146742267.jpg\" title=\"1514969569736584.jpg\"/>', '1', '0', '0', '1', '2018-01-04 11:44:23', null);
INSERT INTO `tb_goods` VALUES ('9', '轻薄羽绒服女士中长款2018新款韩版潮时尚过膝灰鸭绒冬季外套粉色', '', 'https://img.alicdn.com/imgextra/i2/2382603663/O1CN011cvhFvbBClZ597L_!!0-item_pic.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLZkqqVJUzDJ_!!2146742267.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg', '77700', '100', '100', '1', '3', '中国', '', '0.00', '1', null, '<p><img src=\"https://gdp.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLbh6HDXUtVz_!!2146742267.jpg\" title=\"1514969566157870.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLQ0UGeby6Be_!!2146742267.jpg\" title=\"1514969567904803.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLVXFy7OR6DZ_!!2146742267.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLcMZzie024u_!!2146742267.jpg\" title=\"1514969568488597.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i1/2146742267/O1CN011ScKLQuTYSQp6Kg_!!2146742267.jpg\" title=\"1514969569736584.jpg\"/>', '1', '0', '0', '1', '2018-01-04 11:44:25', null);
INSERT INTO `tb_goods` VALUES ('10', '针织衫女2018秋冬新款韩版学生长袖圆领露肩宽松套头打底上衣女装', '', 'https://img.alicdn.com/imgextra/i4/2382603663/O1CN011cvhFsTHjxON5zK_!!0-item_pic.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLZkqqVJUzDJ_!!2146742267.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg', '77700', '0', '100', '0', '0', '中国', '', '0.00', '1', null, '<p><img src=\"https://gdp.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLbh6HDXUtVz_!!2146742267.jpg\" title=\"1514969566157870.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLQ0UGeby6Be_!!2146742267.jpg\" title=\"1514969567904803.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLVXFy7OR6DZ_!!2146742267.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLcMZzie024u_!!2146742267.jpg\" title=\"1514969568488597.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i1/2146742267/O1CN011ScKLQuTYSQp6Kg_!!2146742267.jpg\" title=\"1514969569736584.jpg\"/>', '1', '0', '0', '1', '2018-01-04 11:44:25', null);
INSERT INTO `tb_goods` VALUES ('11', '韩版套头宽松毛针织衫女2018秋冬新款时尚长袖上衣毛衫百搭毛衣女', '', 'https://img.alicdn.com/imgextra/i3/2382603663/O1CN011cvhFuxUyvWGp8c_!!0-item_pic.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLZkqqVJUzDJ_!!2146742267.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg', '77700', '0', '100', '9', '154', '中国', '', '0.00', '1', null, '<p><img src=\"https://gdp.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLbh6HDXUtVz_!!2146742267.jpg\" title=\"1514969566157870.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLQ0UGeby6Be_!!2146742267.jpg\" title=\"1514969567904803.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLVXFy7OR6DZ_!!2146742267.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLcMZzie024u_!!2146742267.jpg\" title=\"1514969568488597.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i1/2146742267/O1CN011ScKLQuTYSQp6Kg_!!2146742267.jpg\" title=\"1514969569736584.jpg\"/>', '1', '0', '0', '1', '2018-01-04 11:44:27', null);
INSERT INTO `tb_goods` VALUES ('12', '针织衫女2018秋冬新款韩版学生长袖圆领露肩宽松套头打底上衣女装', '', 'https://img.alicdn.com/imgextra/i1/2382603663/O1CN011cvhFvAReRoKxtB_!!0-item_pic.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLZkqqVJUzDJ_!!2146742267.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg', '77700', '0', '100', '0', '0', '中国', '', '0.00', '1', null, '<p><img src=\"https://gdp.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLbh6HDXUtVz_!!2146742267.jpg\" title=\"1514969566157870.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLQ0UGeby6Be_!!2146742267.jpg\" title=\"1514969567904803.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLVXFy7OR6DZ_!!2146742267.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLcMZzie024u_!!2146742267.jpg\" title=\"1514969568488597.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i1/2146742267/O1CN011ScKLQuTYSQp6Kg_!!2146742267.jpg\" title=\"1514969569736584.jpg\"/>', '1', '0', '0', '1', '2018-01-04 11:44:27', null);
INSERT INTO `tb_goods` VALUES ('13', '2018秋冬新款韩版长袖针织衫潮学生套头高领宽松海马毛毛衣上衣女\r\n', '', 'https://img.alicdn.com/imgextra/i1/2382603663/O1CN011cvhFuJBIJYaBHX_!!0-item_pic.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLZkqqVJUzDJ_!!2146742267.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg', '77700', '90', '100', '14', '192', '中国', '', '0.00', '1', null, '<p><img src=\"https://gdp.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLbh6HDXUtVz_!!2146742267.jpg\" title=\"1514969566157870.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLQ0UGeby6Be_!!2146742267.jpg\" title=\"1514969567904803.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLVXFy7OR6DZ_!!2146742267.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLcMZzie024u_!!2146742267.jpg\" title=\"1514969568488597.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i1/2146742267/O1CN011ScKLQuTYSQp6Kg_!!2146742267.jpg\" title=\"1514969569736584.jpg\"/>', '1', '0', '0', '1', '2018-01-04 11:44:28', null);
INSERT INTO `tb_goods` VALUES ('14', '韩版马海毛纯色加厚2018秋冬装新款潮毛衣宽松套头半高领针织衫女\r\n', '', 'http://img02.tooopen.com/images/20150928/tooopen_sy_143912755726.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLZkqqVJUzDJ_!!2146742267.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg', '77700', '70', '100', '0', '0', '中国', '', '0.00', '1', null, '<p><img src=\"https://gdp.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLbh6HDXUtVz_!!2146742267.jpg\" title=\"1514969566157870.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLQ0UGeby6Be_!!2146742267.jpg\" title=\"1514969567904803.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLVXFy7OR6DZ_!!2146742267.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLcMZzie024u_!!2146742267.jpg\" title=\"1514969568488597.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i1/2146742267/O1CN011ScKLQuTYSQp6Kg_!!2146742267.jpg\" title=\"1514969569736584.jpg\"/>', '1', '0', '0', '1', '2018-01-04 11:44:28', null);
INSERT INTO `tb_goods` VALUES ('15', '拉夏贝尔2018冬装新款韩版大毛领中长款棉衣棉服外套女装', '', 'http://img02.tooopen.com/images/20150928/tooopen_sy_143912755726.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLZkqqVJUzDJ_!!2146742267.jpg_430x430q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg{|}https://img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i3/2146742267/O1CN011ScKLattm5tN64o_!!2146742267.jpg_60x60q90.jpg', '77700', '90', '100', '22', '114', '韩国', '', '0.00', '1', null, '<p><img src=\"https://gdp.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLbh6HDXUtVz_!!2146742267.jpg\" title=\"1514969566157870.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i4/2146742267/O1CN011ScKLQ0UGeby6Be_!!2146742267.jpg\" title=\"1514969567904803.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLVXFy7OR6DZ_!!2146742267.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/2146742267/O1CN011ScKLcMZzie024u_!!2146742267.jpg\" title=\"1514969568488597.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i1/2146742267/O1CN011ScKLQuTYSQp6Kg_!!2146742267.jpg\" title=\"1514969569736584.jpg\"/>', '1', '0', '0', '1', '2018-01-04 11:44:35', null);

-- ----------------------------
-- Table structure for tb_goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods_attribute`;
CREATE TABLE `tb_goods_attribute` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `merchantId` int(11) NOT NULL,
  `shopId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '类目名',
  `attribute` text COMMENT '属性',
  `orderNo` int(11) unsigned NOT NULL DEFAULT '1000' COMMENT '排序值',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '编辑时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `createtime` (`createTime`),
  KEY `edittime` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商品属性';

-- ----------------------------
-- Records of tb_goods_attribute
-- ----------------------------
INSERT INTO `tb_goods_attribute` VALUES ('1', '1', '1', '颜色', '[\"黑色\",\"白色\",\"土豪金\",\"粉色\",\"玫瑰金\"]', '1001', '2018-10-24 21:06:16', null);
INSERT INTO `tb_goods_attribute` VALUES ('2', '1', '1', '内存', '[\"16G\",\"32G\",\"64G\",\"128G\",\"256G\"]', '1000', '2018-10-24 21:32:37', null);

-- ----------------------------
-- Table structure for tb_goods_attributes
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods_attributes`;
CREATE TABLE `tb_goods_attributes` (
  `tbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `attribute` varchar(255) NOT NULL COMMENT 'sku',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `edittime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '编辑时间',
  PRIMARY KEY (`tbid`),
  KEY `createtime` (`createtime`),
  KEY `edittime` (`edittime`)
) ENGINE=InnoDB AUTO_INCREMENT=1464 DEFAULT CHARSET=utf8 COMMENT='商品关联属性';

-- ----------------------------
-- Records of tb_goods_attributes
-- ----------------------------
INSERT INTO `tb_goods_attributes` VALUES ('9', '正常规格', '2550', '2018-01-17 15:44:24', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('10', '正常规格', '2551', '2018-01-17 15:44:24', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('11', '正常规格', '2552', '2018-01-17 15:44:24', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('12', '正常规格', '2553', '2018-01-17 15:44:24', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('13', '正常规格', '2554', '2018-01-17 15:44:24', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('14', '正常规格', '2555', '2018-01-17 15:44:24', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('15', '正常规格', '2556', '2018-01-17 15:44:24', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('16', '正常规格', '2557', '2018-01-17 15:44:24', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('17', '正常规格', '2106', '2018-01-17 15:44:24', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('18', '正常规格', '2558', '2018-01-17 15:44:24', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('19', '正常规格', '2559', '2018-01-17 15:44:24', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('20', '正常规格', '2560', '2018-01-17 15:44:24', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('21', '正常规格', '2561', '2018-01-17 15:44:24', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('22', '正常规格', '2562', '2018-01-17 15:44:24', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('23', '正常规格', '2563', '2018-01-17 15:44:24', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('24', '正常规格', '2564', '2018-01-17 15:44:24', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('25', '正常规格', '2565', '2018-01-17 15:44:24', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('26', '正常规格', '2566', '2018-01-17 15:44:24', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('27', '正常规格', '1924', '2018-01-17 15:44:24', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('28', '正常规格', '2567', '2018-01-17 15:44:24', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('49', '正常规格', '2568', '2018-01-17 15:42:34', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('50', '正常规格', '2569', '2018-01-17 15:42:34', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('51', '正常规格', '2570', '2018-01-17 15:42:34', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('52', '正常规格', '2571', '2018-01-17 15:42:34', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('53', '正常规格', '2572', '2018-01-17 15:42:34', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('54', '正常规格', '2573', '2018-01-17 15:42:34', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('55', '正常规格', '2574', '2018-01-17 15:42:34', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('56', '正常规格', '2575', '2018-01-17 15:42:34', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('57', '正常规格', '2107', '2018-01-17 15:42:34', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('58', '正常规格', '2576', '2018-01-17 15:42:34', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('59', '正常规格', '2577', '2018-01-17 15:42:34', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('60', '正常规格', '2578', '2018-01-17 15:42:34', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('61', '正常规格', '2579', '2018-01-17 15:42:34', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('62', '正常规格', '2580', '2018-01-17 15:42:34', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('63', '正常规格', '2581', '2018-01-17 15:42:34', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('64', '正常规格', '2582', '2018-01-17 15:42:34', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('65', '正常规格', '2583', '2018-01-17 15:42:34', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('66', '正常规格', '2584', '2018-01-17 15:42:34', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('67', '正常规格', '1925', '2018-01-17 15:42:34', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('68', '正常规格', '2585', '2018-01-17 15:42:34', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('69', '正常规格', '2586', '2018-01-17 15:40:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('70', '正常规格', '2587', '2018-01-17 15:40:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('71', '正常规格', '2588', '2018-01-17 15:40:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('72', '正常规格', '2589', '2018-01-17 15:40:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('73', '正常规格', '2590', '2018-01-17 15:40:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('74', '正常规格', '2591', '2018-01-17 15:40:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('75', '正常规格', '2592', '2018-01-17 15:40:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('76', '正常规格', '2593', '2018-01-17 15:40:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('77', '正常规格', '2108', '2018-01-17 15:40:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('78', '正常规格', '2594', '2018-01-17 15:40:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('79', '正常规格', '2595', '2018-01-17 15:40:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('80', '正常规格', '2596', '2018-01-17 15:40:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('81', '正常规格', '2597', '2018-01-17 15:40:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('82', '正常规格', '2598', '2018-01-17 15:40:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('83', '正常规格', '2599', '2018-01-17 15:40:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('84', '正常规格', '2600', '2018-01-17 15:40:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('85', '正常规格', '2601', '2018-01-17 15:40:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('86', '正常规格', '2602', '2018-01-17 15:40:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('87', '正常规格', '1926', '2018-01-17 15:40:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('88', '正常规格', '2603', '2018-01-17 15:40:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('89', '正常规格', '2604', '2018-01-17 15:34:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('90', '正常规格', '2605', '2018-01-17 15:34:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('91', '正常规格', '2606', '2018-01-17 15:34:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('92', '正常规格', '2607', '2018-01-17 15:34:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('93', '正常规格', '2608', '2018-01-17 15:34:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('94', '正常规格', '2609', '2018-01-17 15:34:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('95', '正常规格', '2610', '2018-01-17 15:34:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('96', '正常规格', '2611', '2018-01-17 15:34:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('97', '正常规格', '2109', '2018-01-17 15:34:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('98', '正常规格', '2612', '2018-01-17 15:34:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('99', '正常规格', '2613', '2018-01-17 15:34:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('100', '正常规格', '2614', '2018-01-17 15:34:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('101', '正常规格', '2615', '2018-01-17 15:34:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('102', '正常规格', '2616', '2018-01-17 15:34:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('103', '正常规格', '2617', '2018-01-17 15:34:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('104', '正常规格', '2618', '2018-01-17 15:34:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('105', '正常规格', '2619', '2018-01-17 15:34:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('106', '正常规格', '2620', '2018-01-17 15:34:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('107', '正常规格', '1927', '2018-01-17 15:34:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('108', '正常规格', '2621', '2018-01-17 15:34:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('109', '正常规格', '2635', '2018-01-17 15:44:24', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('110', '正常规格', '2636', '2018-01-17 15:42:34', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('111', '正常规格', '2637', '2018-01-17 15:40:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('112', '正常规格', '2638', '2018-01-17 15:34:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('113', '76*76cm', '3577', '2018-02-02 17:14:50', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('114', '76*76cm', '3578', '2018-02-02 17:14:50', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('115', '76*76cm', '3579', '2018-02-02 17:14:50', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('116', '76*76cm', '3580', '2018-02-02 17:14:50', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('117', '76*76cm', '3581', '2018-02-02 17:14:50', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('118', '76*76cm', '3582', '2018-02-02 17:14:50', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('119', '76*76cm', '3583', '2018-02-02 17:14:50', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('120', '76*76cm', '3584', '2018-02-02 17:14:50', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('121', '76*76cm', '3585', '2018-02-02 17:14:50', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('122', '76*76cm', '3586', '2018-02-02 17:14:50', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('123', '76*76cm', '3587', '2018-02-02 17:14:50', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('124', '76*76cm', '3588', '2018-02-02 17:14:50', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('125', '76*76cm', '3589', '2018-02-02 17:14:50', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('126', '76*76cm', '3590', '2018-02-02 17:14:50', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('127', '76*76cm', '3591', '2018-02-02 17:14:50', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('128', '76*76cm', '3592', '2018-02-02 17:14:50', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('129', '76*76cm', '3593', '2018-02-02 17:14:50', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('130', '76*76cm', '3594', '2018-02-02 17:14:50', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('131', '76*76cm', '3595', '2018-02-02 17:14:50', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('132', '76*76cm', '3596', '2018-02-02 17:14:50', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('133', '76*76cm', '3597', '2018-02-02 17:14:50', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('134', '76*76cm', '3775', '2018-02-02 17:14:50', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('135', '正常规格', '3831', '2018-01-17 15:44:24', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('136', '正常规格', '3832', '2018-01-17 15:42:34', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('137', '正常规格', '3833', '2018-01-17 15:40:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('138', '正常规格', '3834', '2018-01-17 15:34:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('139', '正常规格', '4198', '2018-02-07 19:38:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('140', '正常规格', '4200', '2018-02-07 18:30:01', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('141', '正常规格', '4218', '2018-02-08 00:16:18', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('142', '正常规格', '4219', '2018-02-08 00:18:12', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('143', '正常规格', '4220', '2018-02-08 00:21:01', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('362', '黑色', '6163', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('363', '白色', '6163', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('364', '金色', '6163', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('365', '黑色', '6160', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('366', '白色', '6160', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('367', '金色', '6160', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('368', '黑色', '6164', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('369', '白色', '6164', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('370', '金色', '6164', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('371', '黑色', '6165', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('372', '白色', '6165', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('373', '金色', '6165', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('374', '黑色', '6166', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('375', '白色', '6166', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('376', '金色', '6166', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('377', '黑色', '6167', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('378', '白色', '6167', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('379', '金色', '6167', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('380', '黑色', '6168', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('383', '黑色', '6169', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('384', '白色', '6169', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('385', '金色', '6169', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('386', '黑色', '6170', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('387', '白色', '6170', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('388', '金色', '6170', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('389', '黑色', '6171', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('390', '白色', '6171', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('391', '金色', '6171', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('392', '黑色', '6172', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('393', '白色', '6172', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('394', '金色', '6172', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('395', '黑色', '6173', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('396', '白色', '6173', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('397', '金色', '6173', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('398', '黑色', '6174', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('399', '白色', '6174', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('400', '金色', '6174', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('401', '黑色', '6175', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('402', '白色', '6175', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('403', '金色', '6175', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('404', '黑色', '6176', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('405', '白色', '6176', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('406', '金色', '6176', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('407', '黑色', '6177', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('408', '白色', '6177', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('409', '金色', '6177', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('410', '黑色', '6178', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('411', '白色', '6178', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('412', '金色', '6178', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('413', '黑色', '6179', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('415', '金色', '6179', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('416', '黑色', '6180', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('418', '金色', '6180', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('419', '黑色', '6181', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('420', '白色', '6181', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('421', '金色', '6181', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('422', '黑色', '6182', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('423', '白色', '6182', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('424', '金色', '6182', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('425', '黑色', '6183', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('426', '白色', '6183', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('427', '金色', '6183', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('428', '黑色', '6184', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('429', '白色', '6184', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('431', '黑色', '6185', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('433', '金色', '6185', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('434', '黑色', '6186', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('435', '白色', '6186', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('436', '金色', '6186', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('437', '黑色', '6187', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('438', '白色', '6187', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('439', '金色', '6187', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('440', '黑色', '6188', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('441', '白色', '6188', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('442', '金色', '6188', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('443', '黑色', '6189', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('444', '白色', '6189', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('445', '金色', '6189', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('446', '黑色', '6190', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('447', '白色', '6190', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('448', '金色', '6190', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('450', '白色', '6191', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('451', '金色', '6191', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('452', '黑色', '6192', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('453', '白色', '6192', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('454', '金色', '6192', '2018-03-29 09:38:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('455', '黑色', '6256', '2018-03-29 15:58:54', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('456', '黑色', '6257', '2018-03-29 16:28:12', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('457', '白色', '6257', '2018-03-29 16:28:12', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('458', '金色', '6257', '2018-03-29 16:28:12', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('459', '黑色', '6258', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('460', '白色', '6258', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('461', '金色', '6258', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('465', '黑色', '6260', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('466', '白色', '6260', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('467', '金色', '6260', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('468', '黑色', '6261', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('469', '白色', '6261', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('470', '金色', '6261', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('471', '黑色', '6262', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('472', '白色', '6262', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('473', '金色', '6262', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('474', '黑色', '6263', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('475', '白色', '6263', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('476', '金色', '6263', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('477', '黑色', '6264', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('478', '白色', '6264', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('479', '金色', '6264', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('480', '黑色', '6265', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('481', '白色', '6265', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('482', '金色', '6265', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('483', '黑色', '6266', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('484', '白色', '6266', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('485', '金色', '6266', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('486', '黑色', '6267', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('487', '白色', '6267', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('488', '金色', '6267', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('489', '黑色', '6268', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('490', '白色', '6268', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('491', '金色', '6268', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('492', '黑色', '6269', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('493', '白色', '6269', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('494', '金色', '6269', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('495', '黑色', '6270', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('496', '白色', '6270', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('497', '金色', '6270', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('498', '黑色', '6271', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('499', '白色', '6271', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('500', '金色', '6271', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('501', '黑色', '6272', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('502', '白色', '6272', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('503', '金色', '6272', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('505', '白色', '6273', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('506', '金色', '6273', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('507', '黑色', '6274', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('508', '白色', '6274', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('509', '金色', '6274', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('510', '黑色', '6275', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('511', '白色', '6275', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('512', '金色', '6275', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('513', '黑色', '6276', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('514', '白色', '6276', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('515', '金色', '6276', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('516', '黑色', '6277', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('517', '白色', '6277', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('518', '金色', '6277', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('519', '黑色', '6278', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('520', '白色', '6278', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('521', '金色', '6278', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('522', '黑色', '6279', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('523', '白色', '6279', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('524', '金色', '6279', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('525', '黑色', '6280', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('526', '白色', '6280', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('527', '金色', '6280', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('528', '黑色', '6281', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('529', '白色', '6281', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('530', '金色', '6281', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('531', '黑色', '6282', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('532', '白色', '6282', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('533', '金色', '6282', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('534', '黑色', '6283', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('535', '白色', '6283', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('536', '金色', '6283', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('537', '黑色', '6284', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('538', '白色', '6284', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('539', '金色', '6284', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('540', '黑色', '6285', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('541', '白色', '6285', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('542', '金色', '6285', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('543', '黑色', '6286', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('544', '白色', '6286', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('545', '金色', '6286', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('546', '黑色', '6287', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('547', '白色', '6287', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('549', '黑色', '6288', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('550', '白色', '6288', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('551', '金色', '6288', '2018-03-29 16:31:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('552', '黑色', '6289', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('553', '白色', '6289', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('554', '金色', '6289', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('555', '黑色', '6290', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('556', '白色', '6290', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('557', '金色', '6290', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('558', '黑色', '6291', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('559', '白色', '6291', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('560', '金色', '6291', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('561', '黑色', '6292', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('562', '白色', '6292', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('563', '金色', '6292', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('564', '黑色', '6293', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('566', '金色', '6293', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('567', '黑色', '6294', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('568', '白色', '6294', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('569', '金色', '6294', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('570', '黑色', '6295', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('571', '白色', '6295', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('572', '金色', '6295', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('573', '黑色', '6296', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('574', '白色', '6296', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('575', '金色', '6296', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('576', '黑色', '6297', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('577', '白色', '6297', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('578', '金色', '6297', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('579', '黑色', '6298', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('580', '白色', '6298', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('581', '金色', '6298', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('582', '黑色', '6299', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('583', '白色', '6299', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('584', '金色', '6299', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('585', '黑色', '6300', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('586', '白色', '6300', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('587', '金色', '6300', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('588', '黑色', '6301', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('589', '白色', '6301', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('590', '金色', '6301', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('591', '黑色', '6302', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('592', '白色', '6302', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('593', '金色', '6302', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('594', '黑色', '6303', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('595', '白色', '6303', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('596', '金色', '6303', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('597', '黑色', '6304', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('598', '白色', '6304', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('599', '金色', '6304', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('600', '黑色', '6305', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('601', '白色', '6305', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('602', '金色', '6305', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('603', '黑色', '6306', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('604', '白色', '6306', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('605', '金色', '6306', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('606', '黑色', '6307', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('607', '白色', '6307', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('608', '金色', '6307', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('609', '黑色', '6308', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('610', '白色', '6308', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('611', '金色', '6308', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('612', '黑色', '6309', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('613', '白色', '6309', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('614', '金色', '6309', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('615', '黑色', '6310', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('616', '白色', '6310', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('617', '金色', '6310', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('618', '黑色', '6311', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('619', '白色', '6311', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('620', '金色', '6311', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('621', '黑色', '6312', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('622', '白色', '6312', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('623', '金色', '6312', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('624', '黑色', '6313', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('625', '白色', '6313', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('626', '金色', '6313', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('627', '黑色', '6314', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('628', '白色', '6314', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('629', '金色', '6314', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('630', '黑色', '6315', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('631', '白色', '6315', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('632', '金色', '6315', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('633', '黑色', '6316', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('634', '白色', '6316', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('635', '金色', '6316', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('636', '黑色', '6317', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('637', '白色', '6317', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('638', '金色', '6317', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('639', '黑色', '6318', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('640', '白色', '6318', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('641', '金色', '6318', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('642', '黑色', '6319', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('643', '白色', '6319', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('644', '金色', '6319', '2018-03-29 16:33:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('645', '黑色', '6320', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('646', '白色', '6320', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('647', '金色', '6320', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('648', '黑色', '6321', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('649', '白色', '6321', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('650', '金色', '6321', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('651', '黑色', '6322', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('652', '白色', '6322', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('653', '金色', '6322', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('654', '黑色', '6323', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('655', '白色', '6323', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('656', '金色', '6323', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('657', '黑色', '6324', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('658', '白色', '6324', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('659', '金色', '6324', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('660', '黑色', '6325', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('661', '白色', '6325', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('662', '金色', '6325', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('663', '黑色', '6326', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('664', '白色', '6326', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('665', '金色', '6326', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('666', '黑色', '6327', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('667', '白色', '6327', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('668', '金色', '6327', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('669', '黑色', '6328', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('670', '白色', '6328', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('671', '金色', '6328', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('672', '黑色', '6329', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('673', '白色', '6329', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('674', '金色', '6329', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('675', '黑色', '6330', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('676', '白色', '6330', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('677', '金色', '6330', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('678', '黑色', '6331', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('679', '白色', '6331', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('680', '金色', '6331', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('681', '黑色', '6332', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('682', '白色', '6332', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('683', '金色', '6332', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('684', '黑色', '6333', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('685', '白色', '6333', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('686', '金色', '6333', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('687', '黑色', '6334', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('688', '白色', '6334', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('689', '金色', '6334', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('690', '黑色', '6335', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('691', '白色', '6335', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('692', '金色', '6335', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('693', '黑色', '6336', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('694', '白色', '6336', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('695', '金色', '6336', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('696', '黑色', '6337', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('697', '白色', '6337', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('698', '金色', '6337', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('699', '黑色', '6338', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('700', '白色', '6338', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('701', '金色', '6338', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('702', '黑色', '6339', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('703', '白色', '6339', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('704', '金色', '6339', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('710', '金色', '6341', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('711', '黑色', '6342', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('712', '白色', '6342', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('713', '金色', '6342', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('714', '黑色', '6343', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('715', '白色', '6343', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('716', '金色', '6343', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('717', '黑色', '6344', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('718', '白色', '6344', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('719', '金色', '6344', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('720', '黑色', '6345', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('721', '白色', '6345', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('722', '金色', '6345', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('723', '黑色', '6346', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('724', '白色', '6346', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('725', '金色', '6346', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('726', '黑色', '6347', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('727', '白色', '6347', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('728', '金色', '6347', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('729', '黑色', '6348', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('730', '白色', '6348', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('731', '金色', '6348', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('732', '黑色', '6349', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('733', '白色', '6349', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('734', '金色', '6349', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('735', '黑色', '6350', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('736', '白色', '6350', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('737', '金色', '6350', '2018-03-29 16:35:33', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('738', '黑色', '6351', '2018-03-29 16:46:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('739', '白色', '6351', '2018-03-29 16:46:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('745', '黑色', '6685', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('746', '黑色', '6686', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('747', '黑色', '6687', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('748', '黑色', '6688', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('749', '黑色', '6689', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('750', '黑色', '6690', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('751', '黑色', '6691', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('752', '黑色', '6692', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('753', '黑色', '6693', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('754', '黑色', '6694', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('755', '黑色', '6695', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('756', '黑色', '6696', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('757', '黑色', '6697', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('758', '黑色', '6698', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('759', '黑色', '6699', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('760', '黑色', '6700', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('761', '黑色', '6701', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('762', '黑色', '6702', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('763', '黑色', '6703', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('764', '黑色', '6704', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('765', '黑色', '6705', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('766', '黑色', '6706', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('767', '黑色', '6707', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('768', '黑色', '6708', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('769', '黑色', '6709', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('770', '黑色', '6710', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('771', '黑色', '6711', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('772', '黑色', '6712', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('773', '黑色', '6713', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('774', '黑色', '6714', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('775', '黑色', '6715', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('776', '黑色', '6716', '2018-04-01 19:25:55', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('777', '黑色', '6717', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('779', '黑色', '6718', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('780', '白色', '6718', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('781', '黑色', '6719', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('782', '白色', '6719', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('783', '黑色', '6720', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('784', '白色', '6720', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('785', '黑色', '6721', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('786', '白色', '6721', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('787', '黑色', '6722', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('788', '白色', '6722', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('789', '黑色', '6723', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('790', '白色', '6723', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('791', '黑色', '6724', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('792', '白色', '6724', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('793', '黑色', '6725', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('794', '白色', '6725', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('795', '黑色', '6726', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('796', '白色', '6726', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('797', '黑色', '6727', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('798', '白色', '6727', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('799', '黑色', '6728', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('800', '白色', '6728', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('801', '黑色', '6729', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('802', '白色', '6729', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('803', '黑色', '6730', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('804', '白色', '6730', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('805', '黑色', '6731', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('806', '白色', '6731', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('807', '黑色', '6732', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('808', '白色', '6732', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('809', '黑色', '6733', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('810', '白色', '6733', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('811', '黑色', '6734', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('812', '白色', '6734', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('813', '黑色', '6735', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('814', '白色', '6735', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('815', '黑色', '6736', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('816', '白色', '6736', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('817', '黑色', '6737', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('818', '白色', '6737', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('819', '黑色', '6738', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('820', '白色', '6738', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('821', '黑色', '6739', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('822', '白色', '6739', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('823', '黑色', '6740', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('824', '白色', '6740', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('825', '黑色', '6741', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('826', '白色', '6741', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('827', '黑色', '6742', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('828', '白色', '6742', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('829', '黑色', '6743', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('831', '黑色', '6744', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('832', '白色', '6744', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('833', '黑色', '6745', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('834', '白色', '6745', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('835', '黑色', '6746', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('836', '白色', '6746', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('837', '黑色', '6747', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('838', '白色', '6747', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('839', '黑色', '6748', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('840', '白色', '6748', '2018-04-02 09:59:06', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('841', '黑色', '6749', '2018-04-02 10:04:45', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('842', '白色', '6749', '2018-04-02 10:04:45', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('907', '黑色', '6750', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('908', '白色', '6750', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('909', '黑色', '6751', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('910', '白色', '6751', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('911', '黑色', '6752', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('912', '白色', '6752', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('913', '黑色', '6753', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('914', '白色', '6753', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('915', '黑色', '6754', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('916', '白色', '6754', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('917', '黑色', '6755', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('918', '白色', '6755', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('919', '黑色', '6756', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('920', '白色', '6756', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('921', '黑色', '6757', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('922', '白色', '6757', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('923', '黑色', '6758', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('924', '白色', '6758', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('925', '黑色', '6759', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('926', '白色', '6759', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('927', '黑色', '6760', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('928', '白色', '6760', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('929', '黑色', '6761', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('930', '白色', '6761', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('931', '黑色', '6762', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('932', '白色', '6762', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('933', '黑色', '6763', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('934', '白色', '6763', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('935', '黑色', '6764', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('937', '黑色', '6765', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('938', '白色', '6765', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('939', '黑色', '6766', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('940', '白色', '6766', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('941', '黑色', '6767', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('942', '白色', '6767', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('943', '黑色', '6768', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('944', '白色', '6768', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('945', '黑色', '6769', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('946', '白色', '6769', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('947', '黑色', '6770', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('948', '白色', '6770', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('949', '黑色', '6771', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('950', '白色', '6771', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('951', '黑色', '6772', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('952', '白色', '6772', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('953', '黑色', '6773', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('954', '白色', '6773', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('955', '黑色', '6774', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('956', '白色', '6774', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('957', '黑色', '6775', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('958', '白色', '6775', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('959', '黑色', '6776', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('960', '白色', '6776', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('961', '黑色', '6777', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('962', '白色', '6777', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('963', '黑色', '6778', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('964', '白色', '6778', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('965', '黑色', '6779', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('966', '白色', '6779', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('967', '黑色', '6780', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('968', '白色', '6780', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('969', '黑色', '6781', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('970', '白色', '6781', '2018-04-02 10:22:03', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('971', '黑色', '6782', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('972', '白色', '6782', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('973', '黑色', '6783', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('974', '白色', '6783', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('975', '黑色', '6784', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('976', '白色', '6784', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('977', '黑色', '6785', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('978', '白色', '6785', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('979', '黑色', '6786', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('980', '白色', '6786', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('981', '黑色', '6787', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('982', '白色', '6787', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('983', '黑色', '6788', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('984', '白色', '6788', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('985', '黑色', '6789', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('986', '白色', '6789', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('987', '黑色', '6790', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('989', '黑色', '6791', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('990', '白色', '6791', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('991', '黑色', '6792', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('992', '白色', '6792', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('993', '黑色', '6793', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('994', '白色', '6793', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('995', '黑色', '6794', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('996', '白色', '6794', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('997', '黑色', '6795', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('998', '白色', '6795', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('999', '黑色', '6796', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1000', '白色', '6796', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1001', '黑色', '6797', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1002', '白色', '6797', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1003', '黑色', '6798', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1004', '白色', '6798', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1005', '黑色', '6799', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1006', '白色', '6799', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1007', '黑色', '6800', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1008', '白色', '6800', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1009', '黑色', '6801', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1010', '白色', '6801', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1011', '黑色', '6802', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1012', '白色', '6802', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1013', '黑色', '6803', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1014', '白色', '6803', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1015', '黑色', '6804', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1016', '白色', '6804', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1017', '黑色', '6805', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1018', '白色', '6805', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1019', '黑色', '6806', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1020', '白色', '6806', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1021', '黑色', '6807', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1022', '白色', '6807', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1023', '黑色', '6808', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1025', '黑色', '6809', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1026', '白色', '6809', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1028', '白色', '6810', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1029', '黑色', '6811', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1030', '白色', '6811', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1031', '黑色', '6812', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1032', '白色', '6812', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1033', '黑色', '6813', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1034', '白色', '6813', '2018-04-02 10:25:44', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1035', '黑色', '6814', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1036', '黑色', '6815', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1037', '黑色', '6816', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1038', '黑色', '6817', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1039', '黑色', '6818', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1040', '黑色', '6819', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1041', '黑色', '6820', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1042', '黑色', '6821', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1043', '黑色', '6822', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1044', '黑色', '6823', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1045', '黑色', '6824', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1046', '黑色', '6825', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1047', '黑色', '6826', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1048', '黑色', '6827', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1049', '黑色', '6828', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1050', '黑色', '6829', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1051', '黑色', '6830', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1052', '黑色', '6831', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1053', '黑色', '6832', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1055', '黑色', '6834', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1056', '黑色', '6835', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1057', '黑色', '6836', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1058', '黑色', '6837', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1059', '黑色', '6838', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1060', '黑色', '6839', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1061', '黑色', '6840', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1062', '黑色', '6841', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1063', '黑色', '6842', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1064', '黑色', '6843', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1065', '黑色', '6844', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1066', '黑色', '6845', '2018-04-02 10:33:51', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1067', '黑色', '6846', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1068', '白色', '6846', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1069', '黑色', '6847', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1070', '白色', '6847', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1071', '黑色', '6848', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1072', '白色', '6848', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1073', '黑色', '6849', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1074', '白色', '6849', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1075', '黑色', '6850', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1076', '白色', '6850', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1077', '黑色', '6851', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1078', '白色', '6851', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1079', '黑色', '6852', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1080', '白色', '6852', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1081', '黑色', '6853', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1082', '白色', '6853', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1083', '黑色', '6854', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1084', '白色', '6854', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1085', '黑色', '6855', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1086', '白色', '6855', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1087', '黑色', '6856', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1089', '黑色', '6857', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1090', '白色', '6857', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1091', '黑色', '6858', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1092', '白色', '6858', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1093', '黑色', '6859', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1094', '白色', '6859', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1095', '黑色', '6860', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1096', '白色', '6860', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1097', '黑色', '6861', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1098', '白色', '6861', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1099', '黑色', '6862', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1100', '白色', '6862', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1101', '黑色', '6863', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1102', '白色', '6863', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1103', '黑色', '6864', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1104', '白色', '6864', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1105', '黑色', '6865', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1106', '白色', '6865', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1107', '黑色', '6866', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1108', '白色', '6866', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1109', '黑色', '6867', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1110', '白色', '6867', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1111', '黑色', '6868', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1112', '白色', '6868', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1113', '黑色', '6869', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1114', '白色', '6869', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1115', '黑色', '6870', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1116', '白色', '6870', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1117', '黑色', '6871', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1118', '白色', '6871', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1119', '黑色', '6872', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1120', '白色', '6872', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1121', '黑色', '6873', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1123', '黑色', '6874', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1124', '白色', '6874', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1125', '黑色', '6875', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1126', '白色', '6875', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1127', '黑色', '6876', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1128', '白色', '6876', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1129', '黑色', '6877', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1130', '白色', '6877', '2018-04-02 15:15:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1131', '黑色', '6878', '2018-04-02 17:10:40', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1132', '黑色', '6879', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1133', '黑色', '6880', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1134', '黑色', '6881', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1135', '黑色', '6882', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1136', '黑色', '6883', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1137', '黑色', '6884', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1138', '黑色', '6885', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1139', '黑色', '6886', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1140', '黑色', '6887', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1141', '黑色', '6888', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1142', '黑色', '6889', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1143', '黑色', '6890', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1144', '黑色', '6891', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1145', '黑色', '6892', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1146', '黑色', '6893', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1147', '黑色', '6894', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1148', '黑色', '6895', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1149', '黑色', '6896', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1150', '黑色', '6897', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1151', '黑色', '6898', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1152', '黑色', '6899', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1153', '黑色', '6900', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1154', '黑色', '6901', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1155', '黑色', '6902', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1156', '黑色', '6903', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1157', '黑色', '6904', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1158', '黑色', '6905', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1159', '黑色', '6906', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1160', '黑色', '6907', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1161', '黑色', '6908', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1162', '黑色', '6909', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1163', '黑色', '6910', '2018-04-02 17:13:15', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1228', '黑色', '7007', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1229', '白色', '7007', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1230', '黑色', '7008', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1231', '白色', '7008', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1232', '黑色', '7009', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1233', '白色', '7009', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1234', '黑色', '7010', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1235', '白色', '7010', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1236', '黑色', '7011', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1237', '白色', '7011', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1238', '黑色', '7012', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1239', '白色', '7012', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1240', '黑色', '7013', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1241', '白色', '7013', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1242', '黑色', '7014', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1243', '白色', '7014', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1244', '黑色', '7015', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1245', '白色', '7015', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1246', '黑色', '7016', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1247', '白色', '7016', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1248', '黑色', '7017', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1249', '白色', '7017', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1250', '黑色', '7018', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1251', '白色', '7018', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1252', '黑色', '7019', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1253', '白色', '7019', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1254', '黑色', '7020', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1255', '白色', '7020', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1256', '黑色', '7021', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1257', '白色', '7021', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1258', '黑色', '7022', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1259', '白色', '7022', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1260', '黑色', '7023', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1261', '白色', '7023', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1262', '黑色', '7024', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1263', '白色', '7024', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1264', '黑色', '7025', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1265', '白色', '7025', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1266', '黑色', '7026', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1267', '白色', '7026', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1268', '黑色', '7027', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1269', '白色', '7027', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1270', '黑色', '7028', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1271', '白色', '7028', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1272', '黑色', '7029', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1273', '白色', '7029', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1274', '黑色', '7030', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1275', '白色', '7030', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1276', '黑色', '7031', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1277', '白色', '7031', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1278', '黑色', '7032', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1279', '白色', '7032', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1280', '黑色', '7033', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1281', '白色', '7033', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1282', '黑色', '7034', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1283', '白色', '7034', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1284', '黑色', '7035', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1285', '白色', '7035', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1286', '黑色', '7036', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1287', '白色', '7036', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1288', '黑色', '7037', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1289', '白色', '7037', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1290', '黑色', '7038', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1291', '白色', '7038', '2018-04-11 16:52:53', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1292', '黑色', '7039', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1293', '白色', '7039', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1294', '黑色', '7040', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1295', '白色', '7040', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1296', '黑色', '7041', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1297', '白色', '7041', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1298', '黑色', '7042', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1299', '白色', '7042', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1300', '黑色', '7043', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1301', '白色', '7043', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1302', '黑色', '7044', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1303', '白色', '7044', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1304', '黑色', '7045', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1305', '白色', '7045', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1306', '黑色', '7046', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1307', '白色', '7046', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1308', '黑色', '7047', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1309', '白色', '7047', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1310', '黑色', '7048', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1311', '白色', '7048', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1312', '黑色', '7049', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1313', '白色', '7049', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1314', '黑色', '7050', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1315', '白色', '7050', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1316', '黑色', '7051', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1317', '白色', '7051', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1318', '黑色', '7052', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1319', '白色', '7052', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1320', '黑色', '7053', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1321', '白色', '7053', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1322', '黑色', '7054', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1323', '白色', '7054', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1324', '黑色', '7055', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1325', '白色', '7055', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1326', '黑色', '7056', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1327', '白色', '7056', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1328', '黑色', '7057', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1329', '白色', '7057', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1330', '黑色', '7058', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1331', '白色', '7058', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1332', '黑色', '7059', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1333', '白色', '7059', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1334', '黑色', '7060', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1335', '白色', '7060', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1336', '黑色', '7061', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1337', '白色', '7061', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1338', '黑色', '7062', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1339', '白色', '7062', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1340', '黑色', '7063', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1341', '白色', '7063', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1342', '黑色', '7064', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1343', '白色', '7064', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1344', '黑色', '7065', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1345', '白色', '7065', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1346', '黑色', '7066', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1347', '白色', '7066', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1348', '黑色', '7067', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1349', '白色', '7067', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1350', '黑色', '7068', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1351', '白色', '7068', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1352', '黑色', '7069', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1353', '白色', '7069', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1354', '黑色', '7070', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1355', '白色', '7070', '2018-04-11 17:00:29', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1359', '黑色', '7071', '2018-04-13 16:05:54', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1360', '白色', '7071', '2018-04-13 16:05:54', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1361', '金色', '7071', '2018-04-13 16:05:54', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1362', '黑色', '7104', '2018-04-27 09:30:20', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1363', '黑色', '7106', '2018-04-28 09:29:59', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1364', '黑色', '7107', '2018-04-28 09:55:17', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1367', '白色', '7107', '2018-05-02 16:20:40', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1400', '黑色', '7108', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1401', '黑色', '7109', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1402', '黑色', '7110', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1403', '黑色', '7111', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1404', '黑色', '7112', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1405', '黑色', '7113', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1406', '黑色', '7114', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1407', '黑色', '7115', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1408', '黑色', '7116', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1409', '黑色', '7117', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1410', '黑色', '7118', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1411', '黑色', '7119', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1412', '黑色', '7120', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1413', '黑色', '7121', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1414', '黑色', '7122', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1415', '黑色', '7123', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1416', '黑色', '7124', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1417', '黑色', '7125', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1418', '黑色', '7126', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1419', '黑色', '7127', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1420', '黑色', '7128', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1421', '黑色', '7129', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1422', '黑色', '7130', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1423', '黑色', '7131', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1424', '黑色', '7132', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1425', '黑色', '7133', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1426', '黑色', '7134', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1427', '黑色', '7135', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1428', '黑色', '7136', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1429', '黑色', '7137', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1430', '黑色', '7138', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1431', '黑色', '7139', '2018-04-28 09:56:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1432', '黑色', '7140', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1433', '黑色', '7141', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1434', '黑色', '7142', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1435', '黑色', '7143', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1437', '黑色', '7145', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1438', '黑色', '7146', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1439', '黑色', '7147', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1440', '黑色', '7148', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1441', '黑色', '7149', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1442', '黑色', '7150', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1443', '黑色', '7151', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1444', '黑色', '7152', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1445', '黑色', '7153', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1446', '黑色', '7154', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1447', '黑色', '7155', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1448', '黑色', '7156', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1449', '黑色', '7157', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1450', '黑色', '7158', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1451', '黑色', '7159', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1452', '黑色', '7160', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1453', '黑色', '7161', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1454', '黑色', '7162', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1455', '黑色', '7163', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1456', '黑色', '7164', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1457', '黑色', '7165', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1458', '黑色', '7166', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1459', '黑色', '7167', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1460', '黑色', '7168', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1461', '黑色', '7169', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1462', '黑色', '7170', '2018-05-03 15:30:04', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_attributes` VALUES ('1463', '黑色', '7171', '2018-05-03 15:30:04', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for tb_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods_category`;
CREATE TABLE `tb_goods_category` (
  `tbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '类目名',
  `parnetId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID   0--表示最高级 ',
  `attribute` longtext COMMENT '属性',
  `sku` longtext COMMENT 'sku',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `orderNo` int(11) unsigned NOT NULL DEFAULT '1000' COMMENT '排序值',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '编辑时间',
  PRIMARY KEY (`tbid`),
  KEY `name` (`name`),
  KEY `isparent` (`parnetId`) USING BTREE,
  KEY `createtime` (`createTime`),
  KEY `edittime` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='商品类目';

-- ----------------------------
-- Records of tb_goods_category
-- ----------------------------
INSERT INTO `tb_goods_category` VALUES ('1', '运动户外', '1', '[{\"name\":\"颜色\",\"attributevalue\":[\"黑色\",\"白色\",\"金色\"],\"type\":\"2\"}]', '[{\"name\":\"颜色\",\"attributevalue\":[\"黑色\",\"白色\",\"金色\"]}]', 'uploads/category/1516674078166542.png', '105', '2017-11-15 13:41:02', '2018-01-23 10:21:21');
INSERT INTO `tb_goods_category` VALUES ('2', '汽车配饰', '0', '[{\"name\":\"颜色\",\"attributevalue\":[\"黑色\",\"白色\",\"金色\"],\"type\":\"2\"}]', '[]', 'uploads/category/1514807063212103.jpg', '100', '2017-11-15 13:41:48', '2018-01-01 19:44:35');
INSERT INTO `tb_goods_category` VALUES ('3', '汽车电子', '0', '[{\"name\":\"颜色\",\"attributevalue\":[\"黑色\",\"蓝色\",\"白色\"],\"type\":\"2\"}]', '[]', 'uploads/category/1514807044403083.jpg', '110', '2017-11-15 13:42:33', '2018-01-01 19:44:10');
INSERT INTO `tb_goods_category` VALUES ('4', '箱包配饰', '1', '[]', '[]', 'uploads/category/1516674067103972.png', '106', '2017-11-15 13:42:56', '2018-01-23 10:21:08');
INSERT INTO `tb_goods_category` VALUES ('5', '行李箱', '0', '[{\"name\":\"颜色\",\"attributevalue\":[\"银色\",\"玫瑰金\",\"钛金色\",\"蓝色\",\"大红色\",\"黑色\"],\"type\":\"1\"}]', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]},{\"name\":\"颜色分类\",\"attributevalue\":[\"银色\"]}]', 'uploads/category/1514806847301837.jpg', '100', '2017-11-15 13:43:03', '2018-01-05 09:59:30');
INSERT INTO `tb_goods_category` VALUES ('6', '休闲功能包', '0', '[]', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]}]', 'uploads/category/1514806866279867.jpg', '100', '2017-11-15 13:43:09', '2018-01-04 14:12:46');
INSERT INTO `tb_goods_category` VALUES ('7', '生活居家', '1', '[]', '[]', 'uploads/category/1516674050932735.png', '108', '2017-11-25 16:49:48', '2018-02-02 17:02:10');
INSERT INTO `tb_goods_category` VALUES ('8', '床品套件', '0', '[]', '[{\"name\":\"颜色\",\"attributevalue\":[\"黑色\"]},{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]}]', 'uploads/category/1514808865961427.jpg', '100', '2017-11-25 16:57:12', '2018-02-27 11:39:14');
INSERT INTO `tb_goods_category` VALUES ('9', '户外装备', '0', '[]', '[{\"name\":\"颜色\",\"attributevalue\":[\"黑色\"]},{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]}]', 'uploads/category/1514807091814502.jpg', '100', '2017-11-27 17:07:52', '2018-02-08 15:30:07');
INSERT INTO `tb_goods_category` VALUES ('10', '电器数码', '1', '[]', '[]', 'uploads/category/1516674093463310.png', '100', '2017-11-28 14:22:32', '2018-01-23 10:21:35');
INSERT INTO `tb_goods_category` VALUES ('11', '美妆个护', '1', '[]', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]}]', 'uploads/category/1516674147923782.png', '100', '2017-11-30 14:51:56', '2018-01-23 10:22:28');
INSERT INTO `tb_goods_category` VALUES ('12', '厨房餐饮', '1', '[]', '[]', 'uploads/category/1514447955696903.png', '100', '2017-11-30 14:52:28', '2018-01-30 15:18:57');
INSERT INTO `tb_goods_category` VALUES ('13', '婴童玩具', '1', '[]', '[]', 'uploads/category/1514448028229625.png', '100', '2017-11-30 14:52:48', '2017-12-28 16:00:31');
INSERT INTO `tb_goods_category` VALUES ('14', '饮食健康', '1', '[]', '[]', 'uploads/category/1514448043526787.png', '100', '2017-11-30 14:53:40', '2017-12-28 16:00:46');
INSERT INTO `tb_goods_category` VALUES ('15', '艺术生活', '1', '[]', '[]', 'uploads/category/1514448063395447.png', '100', '2017-11-30 14:54:04', '2017-12-28 16:01:05');
INSERT INTO `tb_goods_category` VALUES ('16', '厨房电器', '0', '[]', '[]', 'uploads/category/1514807188849204.jpg', '100', '2017-12-02 11:42:07', '2018-01-01 19:46:31');
INSERT INTO `tb_goods_category` VALUES ('17', '生活电器', '0', '[]', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]}]', 'uploads/category/1514807204184443.jpg', '100', '2017-12-02 11:42:18', '2018-01-04 20:26:26');
INSERT INTO `tb_goods_category` VALUES ('18', '服装服饰', '1', '[]', '[]', 'uploads/category/1514448074929822.png', '100', '2017-12-21 10:15:39', '2017-12-28 16:01:17');
INSERT INTO `tb_goods_category` VALUES ('19', '被枕', '0', '[]', '[]', 'uploads/category/1514808886408408.jpg', '100', '2017-12-26 14:08:59', '2018-01-01 20:14:51');
INSERT INTO `tb_goods_category` VALUES ('20', '家具', '0', '[]', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]},{\"name\":\"属性选项\",\"attributevalue\":[\"水晶绒\"]}]', 'uploads/category/1514808907774691.jpg', '100', '2017-12-26 14:09:38', '2018-02-06 12:13:04');
INSERT INTO `tb_goods_category` VALUES ('21', '收纳', '0', '[]', '[]', 'uploads/category/1514875993774746.jpg', '100', '2017-12-26 14:09:50', '2018-01-02 14:53:17');
INSERT INTO `tb_goods_category` VALUES ('22', '布艺软装', '0', '[]', '[{\"name\":\"颜色分类\",\"attributevalue\":[\"黄色\"]}]', 'uploads/category/1514808943443876.jpg', '100', '2017-12-26 14:10:04', '2018-01-08 10:50:45');
INSERT INTO `tb_goods_category` VALUES ('23', '家饰', '0', '[]', '[{\"name\":\"颜色\",\"attributevalue\":[\"黑色\"]},{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]}]', 'uploads/category/1514865435658304.jpg', '100', '2017-12-26 14:10:15', '2018-02-07 09:06:27');
INSERT INTO `tb_goods_category` VALUES ('24', '杂货', '0', '[]', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]}]', 'uploads/category/1514808977728075.jpg', '100', '2017-12-26 14:10:27', '2018-01-04 22:19:04');
INSERT INTO `tb_goods_category` VALUES ('25', '宠物用品', '0', '[]', '[]', 'uploads/category/1514809026969645.jpg', '100', '2017-12-26 14:10:39', '2018-01-01 20:17:09');
INSERT INTO `tb_goods_category` VALUES ('26', '时装包袋', '0', '[]', '[{\"name\":\"颜色\",\"attributevalue\":[\"雪花\",\"帆船\"]}]', 'uploads/category/1514806889243565.jpg', '100', '2017-12-26 14:11:53', '2018-01-03 16:47:45');
INSERT INTO `tb_goods_category` VALUES ('27', '鞋履', '0', '[]', '[]', 'uploads/category/1514806913309234.jpg', '100', '2017-12-26 14:12:02', '2018-01-01 19:41:56');
INSERT INTO `tb_goods_category` VALUES ('28', '围巾', '0', '[]', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]}]', 'uploads/category/1514806931967261.jpg', '100', '2017-12-26 14:12:12', '2018-01-04 15:20:23');
INSERT INTO `tb_goods_category` VALUES ('29', '眼镜', '0', '[]', '[]', 'uploads/category/1514806946143931.jpg', '100', '2017-12-26 14:12:28', '2018-01-01 19:42:29');
INSERT INTO `tb_goods_category` VALUES ('30', '珠宝配饰', '0', '[]', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]}]', 'uploads/category/1514806965616267.jpg', '100', '2017-12-26 14:13:45', '2018-01-04 19:25:10');
INSERT INTO `tb_goods_category` VALUES ('31', '香水彩妆', '0', '[]', '[]', 'uploads/category/1514807318869016.jpg', '100', '2017-12-26 14:14:30', '2018-01-01 19:48:42');
INSERT INTO `tb_goods_category` VALUES ('32', '面部护理', '0', '[]', '[]', 'uploads/category/1514807335170376.jpg', '100', '2017-12-26 14:14:39', '2018-01-01 19:48:58');
INSERT INTO `tb_goods_category` VALUES ('33', '身体护理', '0', '[]', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]}]', 'uploads/category/1515131951153903.jpg', '100', '2017-12-26 14:14:48', '2018-01-05 13:59:15');
INSERT INTO `tb_goods_category` VALUES ('34', '洗发护发', '0', '[]', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]}]', 'uploads/category/1515131934217910.jpg', '100', '2017-12-26 14:14:56', '2018-01-05 13:58:58');
INSERT INTO `tb_goods_category` VALUES ('35', '浴室用具', '0', '[]', '[]', 'uploads/category/1514807388597449.jpg', '100', '2017-12-26 14:15:04', '2018-01-01 19:49:52');
INSERT INTO `tb_goods_category` VALUES ('36', '个护健康', '0', '[]', '[]', 'uploads/category/1514807222143810.jpg', '100', '2017-12-26 14:16:34', '2018-01-01 19:47:05');
INSERT INTO `tb_goods_category` VALUES ('37', '数码配件', '0', '[]', '[]', 'uploads/category/1514807242458584.jpg', '100', '2017-12-26 14:16:44', '2018-01-01 19:47:28');
INSERT INTO `tb_goods_category` VALUES ('38', '影音娱乐', '0', '[]', '[]', 'uploads/category/1514807270178653.jpg', '100', '2017-12-26 14:16:54', '2018-01-01 19:47:53');
INSERT INTO `tb_goods_category` VALUES ('39', '户外穿戴', '0', '[]', '[]', 'uploads/category/1514807109203673.jpg', '100', '2017-12-26 14:29:44', '2018-01-01 19:45:12');
INSERT INTO `tb_goods_category` VALUES ('40', '运动鞋服', '0', '[]', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]},{\"name\":\"颜色分类\",\"attributevalue\":[\"深橄榄\"]}]', 'uploads/category/1514807128929510.jpg', '100', '2017-12-26 14:29:56', '2018-01-31 14:19:14');
INSERT INTO `tb_goods_category` VALUES ('41', '水具', '0', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"],\"type\":\"1\"}]', '[{\"name\":\"颜色分类\",\"attributevalue\":[\"黑色\"]}]', 'uploads/category/1514858039988394.jpg', '100', '2017-12-26 14:35:49', '2018-02-07 17:49:21');
INSERT INTO `tb_goods_category` VALUES ('42', '酒具', '0', '[]', '[]', 'uploads/category/1514858058291353.jpg', '100', '2017-12-26 14:35:56', '2018-01-02 09:54:21');
INSERT INTO `tb_goods_category` VALUES ('43', '锅具', '0', '[]', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]},{\"name\":\"颜色分类\",\"attributevalue\":[\"粉色\"]}]', 'uploads/category/1514858072278770.jpg', '100', '2017-12-26 14:36:04', '2018-01-31 13:43:53');
INSERT INTO `tb_goods_category` VALUES ('44', '餐具', '0', '[]', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]},{\"name\":\"颜色分类\",\"attributevalue\":[\"草绿\"]}]', 'uploads/category/1514858084986162.jpg', '100', '2017-12-26 14:46:30', '2018-01-06 14:59:41');
INSERT INTO `tb_goods_category` VALUES ('45', '功能厨具', '0', '[]', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]}]', 'uploads/category/1514858098244176.jpg', '100', '2017-12-26 14:46:42', '2018-01-05 18:47:56');
INSERT INTO `tb_goods_category` VALUES ('46', '茶具', '0', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"],\"type\":\"1\"}]', '[{\"name\":\"颜色\",\"attributevalue\":[\"黑色\",\"白色\",\"金色\"]}]', 'uploads/category/1514858112792219.jpg', '100', '2017-12-26 14:46:51', '2018-01-02 09:55:16');
INSERT INTO `tb_goods_category` VALUES ('47', '刀剪砧板', '0', '[]', '[]', 'uploads/category/1514858127641647.jpg', '100', '2017-12-26 14:47:00', '2018-01-02 09:55:31');
INSERT INTO `tb_goods_category` VALUES ('48', '咖啡具', '0', '[]', '[]', 'uploads/category/1514858141527549.jpg', '100', '2017-12-26 14:47:08', '2018-01-02 09:55:45');
INSERT INTO `tb_goods_category` VALUES ('49', '厨房清洁', '0', '[]', '[]', 'uploads/category/1514858156245219.jpg', '100', '2017-12-26 14:47:20', '2018-01-02 09:56:00');
INSERT INTO `tb_goods_category` VALUES ('50', '服饰配饰', '0', '[]', '[{\"name\":\"颜色\",\"attributevalue\":[\"黑色\"]},{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]}]', 'uploads/category/1514860641625325.jpg', '100', '2017-12-26 14:50:39', '2018-02-02 17:16:56');
INSERT INTO `tb_goods_category` VALUES ('51', '寝居', '0', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\",\"76*76cm\"],\"type\":\"1\"}]', '[{\"name\":\"颜色\",\"attributevalue\":[\"粉色\",\"蓝色\"]}]', 'uploads/category/1514860655688085.jpg', '100', '2017-12-26 14:50:46', '2018-02-02 17:12:15');
INSERT INTO `tb_goods_category` VALUES ('52', '宝妈用品', '0', '[]', '[]', 'uploads/category/1514860669864899.jpg', '100', '2017-12-26 14:50:53', '2018-01-02 10:37:53');
INSERT INTO `tb_goods_category` VALUES ('53', '玩具', '0', '[]', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]}]', 'uploads/category/1514860683647630.jpg', '100', '2017-12-26 14:51:01', '2018-01-04 22:41:29');
INSERT INTO `tb_goods_category` VALUES ('54', '洗护', '0', '[]', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]}]', 'uploads/category/1514860696318346.jpg', '100', '2017-12-26 14:51:09', '2018-01-04 17:14:46');
INSERT INTO `tb_goods_category` VALUES ('55', '喂养', '0', '[]', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]}]', 'uploads/category/1514860841241265.jpg', '100', '2017-12-26 14:51:17', '2018-01-04 19:07:13');
INSERT INTO `tb_goods_category` VALUES ('56', '出行', '0', '[]', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]},{\"name\":\"属性选项\",\"attributevalue\":[\"杏仁味\"]}]', 'uploads/category/1514860726180411.jpg', '100', '2017-12-26 14:51:25', '2018-01-30 13:28:21');
INSERT INTO `tb_goods_category` VALUES ('57', '酒水', '0', '[]', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]}]', 'uploads/category/1514861603827273.jpg', '100', '2017-12-26 14:52:04', '2018-01-04 16:08:39');
INSERT INTO `tb_goods_category` VALUES ('58', '食材', '0', '[{\"name\":\"内存容量\",\"attributevalue\":[\"2G+8G\",\"3G+16G\",\"3G+32G\",\"4G+64G\"],\"type\":\"1\"}]', '[{\"name\":\"包装\",\"attributevalue\":[\"木箱\",\"纸箱\",\"桶装\",\"散装\",\"其他\"]}]', 'uploads/category/1514875267618162.jpg', '100', '2017-12-26 14:52:12', '2018-03-05 10:50:05');
INSERT INTO `tb_goods_category` VALUES ('59', '零食', '0', '[]', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]},{\"name\":\"属性选项\",\"attributevalue\":[\"杏仁味\"]}]', 'uploads/category/1514861854609144.jpg', '100', '2017-12-26 14:52:21', '2018-01-12 17:10:50');
INSERT INTO `tb_goods_category` VALUES ('60', '茗茶', '0', '[]', '[]', 'uploads/category/1514862011445029.jpg', '100', '2017-12-26 14:53:24', '2018-01-02 11:00:15');
INSERT INTO `tb_goods_category` VALUES ('61', '生鲜', '0', '[{\"name\":\"食品产地\",\"attributevalue\":[\"种植产地\"],\"type\":\"1\"},{\"name\":\"重量\",\"attributevalue\":[\"1kg\",\"0.5kg\"],\"type\":\"1\"}]', '[]', 'uploads/category/1514862024518484.jpg', '100', '2017-12-26 14:53:35', '2018-01-20 13:47:23');
INSERT INTO `tb_goods_category` VALUES ('62', '特产', '0', '[]', '[]', 'uploads/category/1514862040406193.jpg', '100', '2017-12-26 14:53:43', '2018-01-02 11:00:45');
INSERT INTO `tb_goods_category` VALUES ('63', '水果', '0', '[]', '[]', 'uploads/category/1514862059728442.jpg', '100', '2017-12-26 14:53:52', '2018-01-02 11:01:04');
INSERT INTO `tb_goods_category` VALUES ('64', '保健品', '0', '[]', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]}]', 'uploads/category/1514862073843667.jpg', '100', '2017-12-26 14:54:00', '2018-01-16 09:48:10');
INSERT INTO `tb_goods_category` VALUES ('65', '字画', '0', '[]', '[{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]}]', 'uploads/category/1514862914973994.jpg', '100', '2017-12-26 14:54:41', '2018-02-07 16:18:43');
INSERT INTO `tb_goods_category` VALUES ('66', '书籍', '0', '[]', '[]', 'uploads/category/1514863896866377.jpg', '100', '2017-12-26 14:54:48', '2018-01-02 11:31:40');
INSERT INTO `tb_goods_category` VALUES ('67', '卡券', '0', '[]', '[]', 'uploads/category/1514863726962924.jpg', '100', '2017-12-26 14:54:56', '2018-01-02 11:28:49');
INSERT INTO `tb_goods_category` VALUES ('68', '旅行', '0', '[]', '[]', 'uploads/category/1514863740670594.jpg', '100', '2017-12-26 14:55:03', '2018-01-02 11:29:03');
INSERT INTO `tb_goods_category` VALUES ('69', '女装', '0', '[]', '[]', 'uploads/category/1514860515369701.jpg', '100', '2017-12-26 14:57:15', '2018-01-02 10:35:18');
INSERT INTO `tb_goods_category` VALUES ('70', '男装', '0', '[]', '[]', 'uploads/category/1514861005570454.jpg', '100', '2017-12-26 14:57:23', '2018-01-02 10:43:28');
INSERT INTO `tb_goods_category` VALUES ('71', '内衣', '0', '[]', '[]', 'uploads/category/1514862579357875.jpg', '100', '2017-12-26 14:57:32', '2018-01-02 11:09:41');
INSERT INTO `tb_goods_category` VALUES ('72', '居家服', '0', '[]', '[]', 'uploads/category/1514861808242835.jpg', '100', '2017-12-26 14:57:40', '2018-01-02 10:56:56');
INSERT INTO `tb_goods_category` VALUES ('73', '口腔护理', '0', '[]', '[{\"name\":\"颜色\",\"attributevalue\":[\"黑色\"]}]', 'uploads/category/1515131503168791.jpg', '100', '2018-01-03 15:45:07', '2018-02-06 09:38:08');
INSERT INTO `tb_goods_category` VALUES ('74', '手机数码', '0', '[]', '[{\"name\":\"机型\",\"attributevalue\":[\"10.5英寸显示屏\"]},{\"name\":\"颜色\",\"attributevalue\":[\"黑色\"]},{\"name\":\"规格\",\"attributevalue\":[\"正常规格\"]},{\"name\":\"连接\",\"attributevalue\":[\"无线网络机型\"]}]', 'uploads/category/1517626692251425.jpg', '106', '2018-02-03 10:58:14', '2018-02-06 11:41:34');

-- ----------------------------
-- Table structure for tb_goods_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods_evaluate`;
CREATE TABLE `tb_goods_evaluate` (
  `tbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `describe_score` int(11) NOT NULL DEFAULT '500' COMMENT '描述评分 0-500分',
  `logistics_score` int(11) NOT NULL DEFAULT '500' COMMENT '物流评分 0-500分',
  `attitude_score` int(11) NOT NULL DEFAULT '500' COMMENT '态度评分 0-500分',
  `ordernumber` varchar(255) NOT NULL COMMENT '订单号',
  `member_id` bigint(20) NOT NULL COMMENT '会员id',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `edittime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '编辑',
  PRIMARY KEY (`tbid`),
  KEY `describescore` (`describe_score`),
  KEY `logisticsscore` (`logistics_score`),
  KEY `attitudescore` (`attitude_score`),
  KEY `ordernumber` (`ordernumber`),
  KEY `member_id` (`member_id`),
  KEY `createtime` (`createtime`),
  KEY `edittime` (`edittime`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='订单评价';

-- ----------------------------
-- Records of tb_goods_evaluate
-- ----------------------------
INSERT INTO `tb_goods_evaluate` VALUES ('2', '1', '2', '2', 'OB105513894639375', '1', '2018-01-08 14:20:13', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('3', '3', '2', '2', 'OB108919721742843', '1', '2018-01-08 15:14:40', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('4', '5', '5', '5', 'OB131804914738566', '3', '2018-01-31 14:40:00', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('5', '4', '4', '4', 'OB201759904802025', '3', '2018-02-02 10:17:49', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('6', '5', '5', '5', 'OB202565395354689', '194', '2018-02-02 15:42:16', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('7', '5', '5', '5', 'OB202573341152725', '192', '2018-02-02 15:45:18', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('8', '5', '5', '5', 'OB202580986944597', '192', '2018-02-02 15:58:11', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('9', '5', '5', '5', 'OB202588090812259', '200', '2018-02-02 16:08:31', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('10', '5', '5', '5', 'OB202589028770438', '209', '2018-02-02 16:11:21', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('11', '5', '5', '5', 'OB202641658543272', '209', '2018-02-03 14:31:58', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('12', '5', '5', '5', 'OB205144336478156', '4', '2018-02-26 11:41:58', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('15', '5', '5', '5', 'OB320327096631033', '8', '2018-03-20 16:11:25', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('16', '2', '2', '2', 'OB105567151231590', '191', '2018-03-20 16:27:59', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('17', '5', '5', '5', 'OB320348347219174', '8', '2018-03-20 16:35:12', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('18', '3', '3', '3', 'OB106051124197969', '191', '2018-03-20 17:05:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('19', '2', '2', '2', 'OB106018682527997', '191', '2018-03-20 17:06:02', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('20', '5', '5', '5', 'OB321958506102449', '1283', '2018-03-21 09:32:32', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('21', '5', '3', '5', 'OB321229307066948', '8', '2018-03-21 17:02:57', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('22', '5', '4', '5', 'OB321237195141851', '8', '2018-03-21 17:27:27', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('23', '2', '3', '4', 'OB106018267238889', '191', '2018-03-22 09:52:12', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('24', '2', '2', '2', 'OB319474821987327', '191', '2018-03-22 10:00:13', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('25', '5', '5', '5', 'OB329880117151859', '1283', '2018-03-29 10:07:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('26', '5', '5', '5', 'OB329894007144376', '1283', '2018-03-29 10:10:48', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('27', '3', '4', '5', 'OB330802094808832', '191', '2018-03-30 11:24:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('28', '5', '5', '5', 'OB330806866108636', '191', '2018-03-30 13:40:36', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('29', '4', '5', '4', 'OB330890281994897', '1', '2018-03-30 13:54:00', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('30', '5', '5', '5', 'OB330917888406597', '1283', '2018-03-30 14:41:11', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('31', '5', '5', '5', 'OB330917497215910', '1283', '2018-03-30 14:43:09', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('33', '5', '5', '5', 'OB401609756346804', '2', '2018-04-01 19:27:28', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate` VALUES ('34', '5', '5', '5', 'OB425271639975815', '1645', '2018-04-25 11:33:18', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for tb_goods_evaluate_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods_evaluate_detail`;
CREATE TABLE `tb_goods_evaluate_detail` (
  `tbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` tinyint(4) NOT NULL COMMENT '评价等级 1好评 2中评 3差评',
  `images` text,
  `content` text COMMENT '内容',
  `ordernumber` varchar(255) NOT NULL COMMENT '订单编号',
  `isanonymous` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否匿名',
  `member_id` bigint(20) NOT NULL COMMENT '用户id',
  `goods_id` bigint(20) NOT NULL COMMENT '商品id',
  `order_goods_id` bigint(20) NOT NULL COMMENT '商品快照id',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `isclose` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否关闭  1--显示',
  `edittime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '编辑',
  PRIMARY KEY (`tbid`),
  KEY `level` (`level`),
  KEY `ordernumber` (`ordernumber`),
  KEY `isanonymous` (`isanonymous`),
  KEY `member_id` (`member_id`),
  KEY `goods_id` (`goods_id`),
  KEY `order_goods_id` (`order_goods_id`),
  KEY `createtime` (`createtime`),
  KEY `edittime` (`edittime`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='商品评价';

-- ----------------------------
-- Records of tb_goods_evaluate_detail
-- ----------------------------
INSERT INTO `tb_goods_evaluate_detail` VALUES ('2', '1', null, '123', 'OB105513894639375', '0', '1', '45', '83', '2018-01-08 14:20:13', '1', '2018-02-02 10:22:55');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('3', '2', null, '123', 'OB108919721742843', '0', '1', '297', '220', '2018-01-08 15:14:40', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('4', '1', null, '321', 'OB108919721742843', '0', '1', '297', '221', '2018-01-08 15:14:40', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('5', '1', null, 'OK', 'OB131804914738566', '0', '3', '2815', '874', '2018-01-31 14:40:00', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('6', '1', null, '超级划算！', 'OB201759904802025', '0', '3', '2815', '891', '2018-02-02 10:17:49', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('7', '1', null, '很好看', 'OB202565395354689', '0', '194', '3383', '901', '2018-02-02 15:42:16', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('8', '1', null, '好', 'OB202573341152725', '0', '192', '3383', '906', '2018-02-02 15:45:18', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('9', '1', null, '好评', 'OB202580986944597', '0', '192', '5', '907', '2018-02-02 15:58:11', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('10', '1', null, '相当不错', 'OB202588090812259', '0', '200', '3383', '909', '2018-02-02 16:08:31', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('11', '1', null, '流程都有微信端警告提示，感觉不是很好', 'OB202589028770438', '0', '209', '3383', '911', '2018-02-02 16:11:21', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('12', '1', null, '不错，很好用我老婆很喜欢', 'OB202641658543272', '0', '209', '1546', '917', '2018-02-03 14:31:58', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('13', '1', null, '还不错和京东买的一样', 'OB202641658543272', '0', '209', '1610', '918', '2018-02-03 14:31:58', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('14', '1', null, 'OK', 'OB205144336478156', '0', '4', '3409', '950', '2018-02-26 11:41:58', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('17', '1', 'uploads/goods/1/1515225300999173.jpg<{|}>uploads/goods/1/1515225300999173.jpg', 'Hao ', 'OB320327096631033', '0', '8', '548', '2472', '2018-03-20 16:11:25', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('18', '2', '', '111', 'OB105567151231590', '0', '191', '395', '98', '2018-03-20 16:27:59', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('19', '1', 'uploads/settle/8/0bc86e537e5f051979faf40127ac1843.jpg<{|}>uploads/settle/8/26f41342c47e316cd70489554fceadb8.jpg', 'Haha ', 'OB320348347219174', '0', '8', '548', '2473', '2018-03-20 16:35:12', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('20', '1', 'uploads/settle/191/f4ba732ec21c40956ec9e6f9aa1f695c.png', 'qqq', 'OB106051124197969', '0', '191', '387', '116', '2018-03-20 17:05:32', '0', '2018-03-21 09:59:31');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('21', '1', 'uploads/settle/191/e7266b38263bbda684d7bd63372434e3.png<{|}>uploads/settle/191/5a45b28d5947b93a0accb8519cc58811.png', '1111', 'OB106018682527997', '0', '191', '395', '112', '2018-03-20 17:06:02', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('22', '1', 'uploads/settle/1283/0406e8a908774ca01e1092044e78cb78.jpg<{|}>uploads/settle/1283/4e1f4be046533fc9fdf441f0c7fb61bd.jpg', '测试数据', 'OB321958506102449', '0', '1283', '344', '2477', '2018-03-21 09:32:32', '0', '2018-03-21 09:36:28');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('23', '1', '', 'Hahs \r\n', 'OB321229307066948', '0', '8', '344', '2479', '2018-03-21 17:02:57', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('24', '1', 'uploads/settle/8/a96798e123346bf837b01ce55dfdb943.jpg', 'Hdhwbe', 'OB321237195141851', '0', '8', '344', '2481', '2018-03-21 17:27:27', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('25', '2', 'uploads/settle/191/0d6d95d202936a0cc6712f7c195596f7.png<{|}>uploads/settle/191/8cd0869095a2c512a47c769a76b4629f.png<{|}>uploads/settle/191/3e41f0d7a103fb5c61265cf14c2c774d.png', '111', 'OB106018267238889', '0', '191', '395', '111', '2018-03-22 09:52:12', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('26', '2', 'uploads/settle/191/d4aaf3d2af8e148081d8f693bf64ff29.png<{|}>uploads/settle/191/5a0c3745df843f969fa8da22cc7631c7.png<{|}>uploads/settle/191/3c16285fe2a58ab2a05ccb1b1c5e2d6a.png', '大家昂首阔步大扫把是打算阿湿波差不传是把空间撒谎', 'OB319474821987327', '0', '191', '548', '2444', '2018-03-22 10:00:13', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('27', '1', 'uploads/settle/1283/dbf49e925706eba4ed7527752498c592.jpg<{|}>uploads/settle/1283/90e472c8460bdf0b9ba987c5db7eae81.jpg', '测试', 'OB329880117151859', '0', '1283', '6161', '2525', '2018-03-29 10:07:28', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('28', '1', 'uploads/settle/1283/dd3046578b920e5821c4983bf66efa8f.jpg', '测试', 'OB329894007144376', '0', '1283', '6160', '2526', '2018-03-29 10:10:48', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('29', '1', '', 'Dndnndnddjdnjd', 'OB330802094808832', '0', '191', '548', '2555', '2018-03-30 11:24:28', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('30', '1', 'uploads/settle/191/5767feb834a1b73704ebe591edcccdd5.png<{|}>uploads/settle/191/7c088c6555d8feeb30f5ca713415a37f.png<{|}>uploads/settle/191/ada01bd8446b7accef010afb76979e6b.png', '嗯 挺好的', 'OB330806866108636', '0', '191', '548', '2557', '2018-03-30 13:40:36', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('31', '1', 'uploads/settle/1/7aa37eb3772eaecc8213507daac93aa0.jpg<{|}>uploads/settle/1/736436ca64d3b781021cde699c13b4d9.jpg<{|}>uploads/settle/1/16450fb56a307686bfcba8a63a88c7e8.jpg', 'Bubbhh', 'OB330890281994897', '0', '1', '548', '2558', '2018-03-30 13:54:00', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('32', '1', 'uploads/settle/1283/558938a47cdf1b4ef7eb876ddd81ed06.jpg', '测试', 'OB330917888406597', '0', '1283', '6386', '2560', '2018-03-30 14:41:11', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('33', '1', '', 'ceshi', 'OB330917497215910', '0', '1283', '6386', '2559', '2018-03-30 14:43:09', '0', '2018-03-30 14:55:04');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('35', '1', 'uploads/settle/2/4c9562641184c067e65e53e422b02be6.png', '还是', 'OB401609756346804', '0', '2', '2307', '2577', '2018-04-01 19:27:28', '0', '0000-00-00 00:00:00');
INSERT INTO `tb_goods_evaluate_detail` VALUES ('36', '1', '', '很满意', 'OB425271639975815', '0', '1645', '7040', '2678', '2018-04-25 11:33:18', '0', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for tb_goods_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods_order`;
CREATE TABLE `tb_goods_order` (
  `tbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `ordernumber` varchar(255) NOT NULL COMMENT '订单号码',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '电话',
  `province` varchar(255) NOT NULL COMMENT '省份',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '城市',
  `area` varchar(255) NOT NULL DEFAULT '' COMMENT '区域',
  `address` text NOT NULL,
  `expresscompany` varchar(255) NOT NULL DEFAULT '' COMMENT '快递公司',
  `expressnumber` varchar(255) NOT NULL DEFAULT '' COMMENT '快递单号',
  `weight` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '重量',
  `sendcost` int(11) NOT NULL DEFAULT '0' COMMENT '邮费',
  `offer` int(11) NOT NULL DEFAULT '0' COMMENT '优惠',
  `totalintegral` int(11) NOT NULL DEFAULT '0' COMMENT '总积分',
  `shop_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `delivery_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '快递id',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `edittime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '编辑时间',
  `send_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1快递 2自提',
  `fetch_code` varchar(255) NOT NULL DEFAULT '' COMMENT '提货码',
  `give_sum` int(11) NOT NULL DEFAULT '0' COMMENT '购买赠送的积分',
  `send_admin_id` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '发货人ID',
  PRIMARY KEY (`tbid`),
  KEY `ordernumber` (`ordernumber`),
  KEY `name` (`name`),
  KEY `createtime` (`createtime`),
  KEY `edittime` (`edittime`),
  KEY `province` (`province`),
  KEY `city` (`city`),
  KEY `area` (`area`),
  KEY `expresscompany` (`expresscompany`),
  KEY `expressnumber` (`expressnumber`),
  KEY `mobile` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1590 DEFAULT CHARSET=utf8 COMMENT='订单';

-- ----------------------------
-- Records of tb_goods_order
-- ----------------------------
INSERT INTO `tb_goods_order` VALUES ('1', 'OB104368664179113', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.00', '0', '0', '1385', '0', '0', '2018-01-04 11:34:26', '2018-01-04 11:34:26', '1', '101969', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('2', 'OB104377509816724', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '2', 'dfdsfsdf', '0.00', '0', '0', '174', '0', '0', '2018-01-04 11:49:11', '2018-01-04 11:52:37', '1', '487054', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('3', 'OB104381822006125', '江泽军', '15167180435', '浙江省', '杭州市', '滨江区', '万福中心', '1', '31613314866', '0.00', '0', '0', '139', '0', '0', '2018-01-04 11:56:22', '2018-01-05 14:37:59', '1', '654190', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('4', 'OB104386988876230', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '2', '测试', '0.00', '0', '0', '1445', '0', '0', '2018-01-04 12:04:58', '2018-01-04 12:06:59', '1', '547191', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('5', 'OB104388030894663', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.05', '0', '0', '58', '21', '1', '2018-01-04 12:06:43', '2018-01-04 12:06:43', '1', '938487', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('6', 'OB104391416088628', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '0.05', '0', '0', '58', '21', '1', '2018-01-04 12:12:21', '2018-01-04 12:12:21', '1', '142293', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('7', 'OB104431446089559', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '3', '4745747', '0.12', '0', '0', '39', '21', '1', '2018-01-04 13:19:04', '2018-01-04 13:20:20', '1', '875629', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('8', 'OB104457204705847', '', '', '', '', '', '', '', '', '1.00', '0', '0', '1080', '21', '1', '2018-01-04 14:02:00', '2018-01-04 14:02:00', '2', '934363', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('9', 'OB104463371046844', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.50', '0', '0', '305', '21', '1', '2018-01-04 14:12:17', '2018-01-04 14:12:17', '1', '289293', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('10', 'OB104472842005796', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '0.00', '0', '0', '58', '0', '0', '2018-01-04 14:28:04', '2018-01-04 14:28:04', '2', '277688', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('11', 'OB104488008657827', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '178', '0', '0', '2018-01-04 14:53:20', '2018-01-04 14:53:20', '1', '134079', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('12', 'OB104488954723948', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '136', '0', '0', '2018-01-04 14:54:55', '2018-01-04 14:54:55', '1', '653575', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('13', 'OB104492910792022', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.05', '0', '0', '58', '21', '1', '2018-01-04 15:01:31', '2018-01-04 15:01:31', '1', '419230', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('14', 'OB104493015937308', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.05', '0', '0', '58', '21', '1', '2018-01-04 15:01:41', '2018-01-04 15:01:41', '1', '288463', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('15', 'OB104493379760772', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '58', '0', '0', '2018-01-04 15:02:17', '2018-01-04 15:02:17', '1', '146080', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('16', 'OB104494276842267', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '58', '0', '0', '2018-01-04 15:03:47', '2018-01-04 15:03:47', '1', '589572', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('17', 'OB104496230451377', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '97', '23', '0', '2018-01-04 15:07:03', '2018-01-04 15:07:03', '1', '581416', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('18', 'OB104510045498497', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '2', '123456', '0.00', '0', '0', '183', '0', '0', '2018-01-04 15:30:04', '2018-01-04 15:42:02', '1', '473591', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('19', 'OB104527961091884', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '1138', '0', '0', '2018-01-04 15:59:56', '2018-01-04 15:59:56', '1', '184828', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('20', 'OB104559074381886', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.05', '0', '0', '58', '21', '1', '2018-01-04 16:51:47', '2018-01-04 16:51:47', '1', '546346', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('21', 'OB104560000615595', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.00', '0', '0', '1119', '0', '0', '2018-01-04 16:53:20', '2018-01-04 16:53:20', '1', '700243', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('22', 'OB104561090582154', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '3', 'ABC123456789', '0.05', '0', '0', '58', '21', '1', '2018-01-04 16:55:09', '2018-01-04 16:58:11', '1', '551476', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('23', 'OB104563750642604', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '4', 'CBADE12345678', '0.00', '0', '0', '1219', '0', '0', '2018-01-04 16:59:35', '2018-01-04 17:00:18', '1', '527373', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('24', 'OB104587481946054', '', '', '', '', '', '', '', '', '0.10', '0', '0', '116', '21', '1', '2018-01-04 17:39:08', '2018-01-04 17:39:08', '2', '805041', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('25', 'OB104589255195694', '', '', '', '', '', '', '', '', '0.10', '0', '0', '116', '21', '1', '2018-01-04 17:42:05', '2018-01-04 17:42:05', '2', '657015', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('26', 'OB104597297225983', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.08', '0', '0', '38', '23', '1', '2018-01-04 17:55:29', '2018-01-04 17:55:29', '1', '139720', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('27', 'OB105173698542110', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '3743', '0', '0', '2018-01-05 09:56:09', '2018-01-05 09:56:09', '1', '758689', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('28', 'OB105175421368571', '', '', '', '', '', '', '', '', '0.05', '0', '0', '58', '21', '1', '2018-01-05 09:59:02', '2018-01-05 09:59:02', '2', '163441', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('29', 'OB105175472372667', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.05', '0', '0', '58', '21', '1', '2018-01-05 09:59:07', '2018-01-05 09:59:07', '1', '534288', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('30', 'OB105175637887380', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.05', '0', '0', '58', '21', '1', '2018-01-05 09:59:23', '2018-01-05 09:59:23', '1', '822240', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('31', 'OB105176036936809', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '58', '0', '0', '2018-01-05 10:00:03', '2018-01-05 10:00:03', '1', '589840', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('32', 'OB105178424358289', '', '', '', '', '', '', '', '', '0.10', '0', '0', '116', '21', '1', '2018-01-05 10:04:02', '2018-01-05 10:04:02', '2', '645750', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('33', 'OB105179685810948', '', '', '', '', '', '', '', '', '0.05', '0', '0', '58', '21', '1', '2018-01-05 10:06:08', '2018-01-05 10:06:08', '2', '966100', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('34', 'OB105186439899816', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.08', '0', '0', '38', '21', '1', '2018-01-05 10:17:23', '2018-01-05 10:17:23', '1', '587434', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('35', 'OB105191204488793', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '2', 'asd123456', '0.00', '0', '0', '283', '0', '0', '2018-01-05 10:25:20', '2018-01-05 10:30:31', '1', '220824', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('36', 'OB105193990043196', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '175', '0', '0', '2018-01-05 10:29:59', '2018-01-05 10:29:59', '1', '768228', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('37', 'OB105195550107862', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '108', '0', '0', '2018-01-05 10:32:35', '2018-01-05 10:32:35', '2', '347592', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('38', 'OB105195780264261', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '8', '123456asd', '0.05', '0', '0', '58', '21', '1', '2018-01-05 10:32:58', '2018-01-05 10:39:58', '1', '495176', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('39', 'OB105195883330147', '', '', '', '', '', '', '', '', '0.05', '0', '0', '58', '21', '1', '2018-01-05 10:33:08', '2018-01-05 10:33:08', '2', '233901', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('40', 'OB105200625198015', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '38', '0', '0', '2018-01-05 10:41:02', '2018-01-05 10:41:02', '1', '182697', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('41', 'OB105201249084685', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.05', '0', '0', '58', '21', '1', '2018-01-05 10:42:04', '2018-01-05 10:42:04', '1', '819279', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('42', 'OB105202949761430', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.05', '0', '0', '58', '21', '1', '2018-01-05 10:44:54', '2018-01-05 10:44:54', '1', '811042', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('43', 'OB105203282145629', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '38', '0', '0', '2018-01-05 10:45:28', '2018-01-05 10:45:28', '1', '114272', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('44', 'OB105204553761034', '', '', '', '', '', '', '', '', '0.05', '0', '0', '58', '21', '1', '2018-01-05 10:47:35', '2018-01-05 10:47:35', '2', '469051', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('45', 'OB105204619333223', '', '', '', '', '', '', '', '', '0.05', '0', '0', '58', '21', '1', '2018-01-05 10:47:41', '2018-01-05 10:47:41', '2', '948826', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('46', 'OB105206941071442', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '58', '0', '0', '2018-01-05 10:51:34', '2018-01-05 10:51:34', '2', '937128', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('47', 'OB105207021798865', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '5', 'sdafd', '4.00', '0', '0', '2780', '21', '1', '2018-01-05 10:51:42', '2018-01-05 10:53:26', '1', '548302', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('48', 'OB105214962239804', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '3.00', '0', '0', '2389', '21', '1', '2018-01-05 11:04:56', '2018-01-05 11:04:56', '1', '471541', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('49', 'OB105215973919846', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.08', '0', '0', '38', '21', '1', '2018-01-05 11:06:37', '2018-01-05 11:06:37', '1', '644000', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('50', 'OB105221002467201', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '5.40', '0', '0', '234', '23', '1', '2018-01-05 11:15:00', '2018-01-05 11:15:00', '1', '932048', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('51', 'OB105222927591573', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '1', '154685416', '1.80', '0', '0', '78', '21', '1', '2018-01-05 11:18:12', '2018-01-05 11:19:27', '1', '771725', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('52', 'OB105347129678918', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '0.00', '0', '0', '78', '0', '0', '2018-01-05 14:45:12', '2018-01-05 14:45:12', '1', '956158', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('53', 'OB105349897689810', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '0.00', '0', '0', '78', '0', '0', '2018-01-05 14:49:49', '2018-01-05 14:49:49', '1', '640434', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('54', 'OB105354161352064', '', '', '', '', '', '', '', '', '0.30', '0', '0', '50', '23', '1', '2018-01-05 14:56:56', '2018-01-05 14:56:56', '2', '804650', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('55', 'OB105358332165563', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '0.00', '0', '0', '116', '0', '0', '2018-01-05 15:03:53', '2018-01-05 15:03:53', '1', '517909', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('56', 'OB105461076639414', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '2', 'ABS123123123123', '0.00', '0', '0', '108', '0', '0', '2018-01-05 17:55:07', '2018-01-05 18:06:24', '1', '609619', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('57', 'OB105468748076281', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.02', '0', '0', '108', '21', '1', '2018-01-05 18:07:54', '2018-01-05 18:07:54', '1', '884975', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('58', 'OB105472287300528', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '1.50', '0', '0', '175', '21', '1', '2018-01-05 18:13:48', '2018-01-05 18:13:48', '1', '102076', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('59', 'OB105481685618096', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.12', '0', '0', '39', '21', '1', '2018-01-05 18:29:28', '2018-01-05 18:29:28', '1', '618120', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('60', 'OB105482924185337', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.00', '0', '0', '108', '0', '0', '2018-01-05 18:31:32', '2018-01-05 18:31:32', '1', '243342', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('61', 'OB105485795420479', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.12', '0', '0', '39', '21', '1', '2018-01-05 18:36:19', '2018-01-05 18:36:19', '1', '212780', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('62', 'OB105488307706200', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.00', '0', '0', '39', '0', '0', '2018-01-05 18:40:30', '2018-01-05 18:40:30', '1', '297424', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('63', 'OB105488672326170', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.00', '0', '0', '39', '0', '0', '2018-01-05 18:41:07', '2018-01-05 18:41:07', '1', '783057', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('64', 'OB105490929810101', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.00', '0', '0', '39', '0', '0', '2018-01-05 18:44:52', '2018-01-05 18:44:52', '1', '150662', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('65', 'OB105494200422470', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '0.35', '0', '0', '240', '23', '1', '2018-01-05 18:50:20', '2018-01-05 18:50:20', '1', '871325', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('66', 'OB105504965985808', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.05', '0', '0', '720', '23', '1', '2018-01-05 19:08:16', '2018-01-05 19:08:16', '1', '820573', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('67', 'OB105512121926306', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.00', '0', '0', '147', '0', '0', '2018-01-05 19:20:12', '2018-01-05 19:20:12', '1', '146039', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('68', 'OB105513894639375', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '3', '1212121212', '0.00', '0', '0', '139', '0', '0', '2018-01-05 19:23:09', '2018-01-05 19:23:53', '1', '971470', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('69', 'OB105539729028134', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '0', '0', '108', '21', '1', '2018-01-05 20:06:12', '2018-01-05 20:06:12', '1', '186988', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('70', 'OB105540757041164', '', '', '', '', '', '', '', '', '0.02', '0', '0', '108', '21', '1', '2018-01-05 20:07:55', '2018-02-23 08:56:42', '2', '531352', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('71', 'OB105541913805420', '', '', '', '', '', '', '', '', '0.02', '0', '0', '108', '21', '1', '2018-01-05 20:09:51', '2018-02-23 08:57:09', '2', '428747', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('72', 'OB105544191998471', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.00', '0', '0', '1280', '0', '0', '2018-01-05 20:13:39', '2018-01-05 20:13:39', '1', '885757', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('73', 'OB105554117619166', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.00', '0', '0', '677', '0', '0', '2018-01-05 20:30:11', '2018-01-05 20:30:11', '1', '560871', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('74', 'OB105556525235611', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.00', '0', '0', '108', '0', '0', '2018-01-05 20:34:12', '2018-01-05 20:34:12', '1', '204442', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('75', 'OB105558209895096', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.00', '0', '0', '39', '0', '0', '2018-01-05 20:37:01', '2018-01-05 20:37:01', '1', '962772', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('76', 'OB105561706433121', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.00', '0', '0', '39', '0', '0', '2018-01-05 20:42:50', '2018-01-05 20:42:50', '1', '291606', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('77', 'OB105563130439078', '', '', '', '', '', '', '', '', '0.12', '0', '0', '39', '21', '1', '2018-01-05 20:45:13', '2018-02-23 08:57:35', '2', '824746', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('78', 'OB105563650889061', '', '', '', '', '', '', '', '', '0.12', '0', '0', '39', '21', '1', '2018-01-05 20:46:05', '2018-02-23 08:57:58', '2', '255459', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('79', 'OB105564168388828', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '3', '214312312', '0.12', '0', '0', '39', '21', '1', '2018-01-05 20:46:56', '2018-01-05 21:04:57', '1', '970082', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('80', 'OB105564836335361', '', '', '', '', '', '', '4', '2E4123412312', '0.12', '0', '0', '39', '21', '1', '2018-01-05 20:48:03', '2018-01-05 20:52:50', '2', '815677', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('81', 'OB105565580904326', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.00', '0', '0', '39', '0', '0', '2018-01-05 20:49:18', '2018-01-05 20:49:18', '1', '247238', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('82', 'OB105567151231590', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '4', '2143132', '0.12', '0', '0', '39', '21', '1', '2018-01-05 20:51:55', '2018-01-05 21:03:21', '1', '593980', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('83', 'OB105569423160242', '', '', '', '', '', '', '', '', '0.12', '0', '0', '39', '21', '1', '2018-01-05 20:55:42', '2018-01-05 20:55:42', '2', '679059', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('84', 'OB105571666820110', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.12', '0', '0', '39', '21', '1', '2018-01-05 20:59:26', '2018-01-05 20:59:26', '1', '619680', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('85', 'OB105571748643938', '', '', '', '', '', '', '', '', '0.12', '0', '0', '39', '21', '1', '2018-01-05 20:59:34', '2018-01-05 20:59:34', '2', '915022', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('86', 'OB105572706588503', '', '', '', '', '', '', '', '', '0.12', '0', '0', '39', '21', '1', '2018-01-05 21:01:10', '2018-02-23 08:58:11', '2', '377555', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('87', 'OB105574990133142', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.00', '0', '0', '58', '0', '0', '2018-01-05 21:04:59', '2018-01-05 21:04:59', '1', '973907', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('88', 'OB105575950750801', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '5', 'ABC123123123', '0.00', '0', '0', '58', '0', '0', '2018-01-05 21:06:35', '2018-01-05 21:10:57', '1', '433493', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('89', 'OB105579703525925', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '4', '76548748', '0.12', '0', '0', '39', '21', '1', '2018-01-05 21:12:50', '2018-01-06 14:32:45', '1', '915421', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('90', 'OB105580723699292', '', '', '', '', '', '', '', '', '0.12', '0', '0', '39', '21', '1', '2018-01-05 21:14:32', '2018-02-23 08:58:44', '2', '714243', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('91', 'OB106008069234369', '', '', '', '', '', '', '', '', '0.04', '0', '0', '1360', '21', '1', '2018-01-06 09:06:46', '2018-01-06 09:06:46', '2', '534260', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('92', 'OB106010160234511', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.05', '0', '0', '58', '21', '1', '2018-01-06 09:10:16', '2018-01-06 09:10:16', '1', '454411', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('93', 'OB106010246686415', '', '', '', '', '', '', '', '', '0.05', '0', '0', '58', '21', '1', '2018-01-06 09:10:24', '2018-02-23 08:58:58', '2', '326606', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('94', 'OB106012269484040', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '3', '586585', '0.05', '0', '0', '58', '21', '1', '2018-01-06 09:13:46', '2018-01-06 14:32:35', '1', '431848', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('95', 'OB106018267238889', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '4', 'hfhgfjh', '0.12', '0', '0', '39', '21', '1', '2018-01-06 09:23:46', '2018-01-06 14:32:30', '1', '451409', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('96', 'OB106018682527997', '', '', '', '', '', '', '4', '85658', '0.12', '0', '0', '39', '21', '1', '2018-01-06 09:24:28', '2018-01-06 14:32:25', '2', '430317', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('97', 'OB106023658787479', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '3', '547754', '0.00', '0', '0', '260', '0', '0', '2018-01-06 09:32:45', '2018-01-06 14:32:18', '1', '653828', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('98', 'OB106024018413142', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.02', '0', '0', '108', '21', '1', '2018-01-06 09:33:21', '2018-01-06 09:33:21', '1', '857713', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('99', 'OB106024354347006', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '0.00', '0', '0', '2180', '0', '0', '2018-01-06 09:33:55', '2018-01-06 09:33:55', '1', '941945', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('100', 'OB106051124197969', '', '', '', '', '', '', '', '', '0.05', '0', '0', '58', '21', '1', '2018-01-06 10:18:32', '2018-02-23 09:01:03', '2', '327184', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('101', 'OB106080480083158', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '4', '54747', '5.00', '0', '0', '3998', '21', '1', '2018-01-06 11:07:28', '2018-01-06 14:31:51', '1', '732881', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('102', 'OB106122754565243', '廖水秀', '15067143639', '浙江省', '杭州市', '滨江区', '滨康路228号万福中心A座9楼', '', '', '0.00', '0', '0', '108', '0', '0', '2018-01-06 12:17:55', '2018-01-06 12:17:55', '1', '873553', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('103', 'OB106176092244623', '', '', '', '', '', '', '3', '54747', '0.12', '0', '0', '39', '21', '1', '2018-01-06 13:46:49', '2018-01-06 14:31:44', '2', '258386', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('104', 'OB106179180329451', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '2', 'qwe123', '0.00', '0', '0', '39', '0', '0', '2018-01-06 13:51:58', '2018-01-06 13:54:09', '1', '584667', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('105', 'OB106190629593973', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '4', 'fgdsg', '0.00', '0', '0', '1927', '0', '0', '2018-01-06 14:11:02', '2018-01-06 14:16:57', '1', '262893', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('106', 'OB106195624921395', '伊君', '13616818666', '浙江省', '杭州市', '西湖区', '文一路122号城市新宇2/2/1802', '4', '465363', '2.00', '0', '0', '1780', '21', '1', '2018-01-06 14:19:22', '2018-01-06 14:31:38', '1', '691346', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('107', 'OB106196608891507', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '6', '435653426', '0.02', '0', '0', '108', '21', '1', '2018-01-06 14:21:00', '2018-01-06 14:31:18', '1', '327321', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('108', 'OB106196946501476', '王成伟', '13168880743', '浙江省', '杭州市', '滨江区', '万福中心', '', '', '0.12', '0', '0', '39', '21', '1', '2018-01-06 14:21:34', '2018-01-06 14:21:34', '1', '638399', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('109', 'OB106197751614886', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '9', 'ffdh', '0.00', '0', '0', '1149', '0', '0', '2018-01-06 14:22:55', '2018-01-06 14:31:12', '1', '923092', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('110', 'OB106199345935493', '王成伟', '13168880743', '浙江省', '杭州市', '滨江区', '万福中心', '7', 'sdadad', '1.50', '0', '0', '450', '21', '1', '2018-01-06 14:25:34', '2018-01-06 14:31:04', '1', '719516', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('111', 'OB106199399533163', '谢冬梅', '17682347779', '浙江省', '杭州市', '滨江区', '中南公寓602', '8', 'dgfgdg', '3.00', '0', '0', '2389', '21', '1', '2018-01-06 14:25:39', '2018-01-06 14:30:55', '1', '273352', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('112', 'OB106199707766293', '唐', '13858026566', '浙江省', '杭州市', '滨江区', '万福中心A座9楼', '7', 'dsfdfsf', '0.00', '0', '0', '660', '0', '0', '2018-01-06 14:26:10', '2018-01-06 14:30:49', '1', '621309', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('113', 'OB106201100156869', '王成伟', '13168880743', '浙江省', '杭州市', '滨江区', '万福中心', '7', '56436546', '1.00', '0', '0', '1260', '21', '1', '2018-01-06 14:28:30', '2018-01-06 14:30:44', '1', '750437', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('114', 'OB106201824012847', '谢冬梅', '17682347779', '浙江省', '杭州市', '滨江区', '中南公寓602', '', '', '1.00', '0', '0', '1760', '24', '1', '2018-01-06 14:29:42', '2018-01-06 14:29:42', '1', '670259', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('115', 'OB106201888181060', '白天驰', '15168267026', '浙江省', '杭州市', '滨江区', '西兴街道春波南苑12幢1单元1001室', '4', 'ffsafsaf', '0.00', '0', '0', '1280', '0', '0', '2018-01-06 14:29:48', '2018-01-06 14:31:24', '1', '973197', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('116', 'OB106201947093585', '谢冬梅', '17682347779', '浙江省', '杭州市', '滨江区', '中南公寓602', '6', 'dfsd', '0.50', '0', '0', '880', '24', '1', '2018-01-06 14:29:54', '2018-01-06 14:30:37', '1', '458262', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('117', 'OB106204007540610', '肖小姐', '13735558157', '浙江省', '杭州市', '滨江区', '万福中心A座901室', '3', '32w52', '0.00', '0', '0', '1980', '0', '0', '2018-01-06 14:33:20', '2018-01-06 14:34:33', '1', '336522', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('118', 'OB106204793833627', '白天驰', '15168267026', '浙江省', '杭州市', '滨江区', '西兴街道春波南苑12幢1单元1001室', '2', '3235', '0.00', '0', '0', '188', '0', '0', '2018-01-06 14:34:39', '2018-01-06 14:36:06', '1', '432154', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('119', 'OB106205428463657', '钟一鸣', '17006422889', '浙江省', '杭州市', '滨江区', '滨河路万福中心', '2', '32532', '0.00', '0', '0', '709', '0', '0', '2018-01-06 14:35:42', '2018-01-06 14:36:12', '1', '152407', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('120', 'OB106210779366628', '刘泇成', '1850439399', '浙江省', '杭州市', '滨江区', '万福中心A座9楼', '1', '53252', '2.00', '0', '0', '1780', '21', '1', '2018-01-06 14:44:37', '2018-01-06 14:46:54', '1', '121820', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('121', 'OB106213850651824', '毛蔚苏', '13305711025', '浙江省', '杭州市', '滨江区', '滨康路万福中心A座九楼', '', '', '0.00', '0', '0', '1955', '0', '0', '2018-01-06 14:49:45', '2018-01-06 14:49:45', '1', '959565', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('122', 'OB106216965202017', '毛蔚苏', '13305711025', '浙江省', '杭州市', '滨江区', '滨康路万福中心A座九楼', '3', '64346363', '1.00', '0', '0', '1260', '21', '1', '2018-01-06 14:54:56', '2018-01-06 15:09:58', '1', '622233', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('123', 'OB106217343280517', '毛蔚苏', '13305711025', '浙江省', '杭州市', '滨江区', '滨康路万福中心A座九楼', '2', 'dfsfsf53245', '1.00', '0', '0', '350', '21', '1', '2018-01-06 14:55:34', '2018-01-06 15:09:47', '1', '887337', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('124', 'OB106218078930366', '毛蔚苏', '13305711025', '浙江省', '杭州市', '滨江区', '滨康路万福中心A座九楼', '', '', '0.05', '0', '0', '58', '21', '1', '2018-01-06 14:56:47', '2018-01-06 14:56:47', '1', '763602', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('125', 'OB106226468400414', '', '', '', '', '', '', '', '', '0.50', '0', '0', '325', '21', '1', '2018-01-06 15:10:46', '2018-01-06 15:10:46', '2', '481807', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('126', 'OB106235610095566', '杜亮', '15951085001', '浙江省', '杭州市', '滨江区', '西行路缤纷小区', '', '', '0.00', '0', '0', '1424', '0', '0', '2018-01-06 15:26:01', '2018-01-06 15:26:01', '1', '565480', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('127', 'OB106242036143955', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '39', '0', '0', '2018-01-06 15:36:43', '2018-01-06 15:36:43', '1', '287234', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('128', 'OB106242329986190', '', '', '', '', '', '', '', '', '0.12', '0', '0', '39', '21', '1', '2018-01-06 15:37:13', '2018-01-06 15:37:13', '2', '327990', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('129', 'OB106243746582128', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.12', '0', '0', '39', '21', '1', '2018-01-06 15:39:34', '2018-01-06 15:39:34', '1', '642515', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('130', 'OB106244539706153', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.12', '0', '0', '39', '21', '1', '2018-01-06 15:40:53', '2018-01-06 15:40:53', '1', '946327', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('131', 'OB106250611240497', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '0.00', '0', '0', '260', '0', '0', '2018-01-06 15:51:01', '2018-01-06 15:51:01', '1', '581367', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('132', 'OB106251682347945', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.00', '0', '0', '39', '0', '0', '2018-01-06 15:52:48', '2018-01-06 15:52:48', '1', '630291', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('133', 'OB106253367976307', '杨莎莎', '13567100751', '浙江省', '杭州市', '滨江区', '滨康路228号', '', '', '0.00', '0', '0', '1878', '0', '0', '2018-01-06 15:55:36', '2018-01-06 15:55:36', '1', '963522', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('134', 'OB106257029447779', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '0.46', '0', '0', '318', '21', '1', '2018-01-06 16:01:42', '2018-01-06 16:01:42', '1', '962408', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('135', 'OB106257620479117', '', '', '', '', '', '', '', '', '0.12', '0', '0', '39', '21', '1', '2018-01-06 16:02:42', '2018-01-06 16:02:42', '2', '161457', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('136', 'OB106264732086799', '孔灏', '13336150008', '浙江省', '杭州市', '西湖区', '留下街道西溪晴雪19幢4单元101室', '4', '888888', '0.00', '0', '0', '1644', '0', '0', '2018-01-06 16:14:33', '2018-01-06 16:15:23', '1', '865125', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('137', 'OB106283014027945', '郑赤萍', '18069892717', '浙江省', '杭州市', '上城区', '望江街道  望江新丰苑5-1-102', '', '', '0.00', '0', '0', '1260', '0', '0', '2018-01-06 16:45:01', '2018-01-06 16:45:01', '2', '777586', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('138', 'OB106285575926679', '郑赤萍', '18069892717', '浙江省', '杭州市', '上城区', '望江街道  望江新丰苑5-1-102', '', '', '0.25', '0', '0', '129', '21', '1', '2018-01-06 16:49:17', '2018-01-06 16:49:17', '1', '689991', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('139', 'OB106297100073959', '江泽军', '15167180435', '浙江省', '杭州市', '滨江区', '万福中心', '4', '6436363', '0.00', '0', '0', '6045', '0', '0', '2018-01-06 17:08:30', '2018-01-06 17:09:48', '1', '727659', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('140', 'OB106356758339819', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '3', '15648946545646654', '0.00', '0', '0', '147', '0', '0', '2018-01-06 18:47:55', '2018-01-06 18:48:18', '1', '507734', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('141', 'OB106470063042866', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '2', '测试', '0.00', '0', '0', '116', '0', '0', '2018-01-06 21:56:46', '2018-01-06 21:58:04', '1', '555469', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('142', 'OB108742690071620', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.02', '0', '0', '108', '21', '1', '2018-01-08 09:17:49', '2018-01-08 09:17:49', '1', '718099', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('143', 'OB108744210511838', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '3', 'asd23', '0.00', '0', '0', '238', '0', '0', '2018-01-08 09:20:21', '2018-01-08 09:21:57', '1', '755009', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('144', 'OB108744339246952', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.50', '0', '0', '260', '21', '1', '2018-01-08 09:20:33', '2018-01-08 09:20:33', '1', '274586', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('145', 'OB108744507889418', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.50', '0', '0', '260', '21', '1', '2018-01-08 09:20:50', '2018-01-08 09:20:50', '2', '345236', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('146', 'OB108747080885710', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '0.46', '0', '0', '318', '25', '1', '2018-01-08 09:25:08', '2018-01-08 09:25:08', '1', '295897', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('147', 'OB108748073940544', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '0.35', '0', '0', '240', '23', '1', '2018-01-08 09:26:47', '2018-01-08 09:26:47', '1', '662945', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('148', 'OB108750404174525', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.15', '0', '0', '39', '25', '1', '2018-01-08 09:30:40', '2018-01-08 09:30:40', '1', '890072', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('149', 'OB108762695455741', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '4', 'asd23', '0.00', '0', '0', '116', '0', '0', '2018-01-08 09:51:09', '2018-01-08 09:52:08', '1', '429755', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('150', 'OB108768778183637', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.15', '0', '0', '39', '21', '1', '2018-01-08 10:01:17', '2018-01-08 10:01:17', '2', '990187', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('151', 'OB108775119773050', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '108', '0', '0', '2018-01-08 10:11:51', '2018-01-08 10:11:51', '1', '872684', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('152', 'OB108776483895470', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.15', '0', '0', '39', '21', '1', '2018-01-08 10:14:08', '2018-01-08 10:14:08', '2', '980777', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('153', 'OB108777223416036', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.15', '0', '0', '39', '21', '1', '2018-01-08 10:15:22', '2018-01-08 10:15:22', '1', '531564', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('154', 'OB108780785862926', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.02', '0', '0', '108', '21', '1', '2018-01-08 10:21:18', '2018-01-08 10:21:18', '2', '666827', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('155', 'OB108781676286517', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '3', 'qwe123', '0.00', '0', '0', '39', '0', '0', '2018-01-08 10:22:47', '2018-01-08 10:25:20', '1', '241190', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('156', 'OB108784033182078', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.15', '0', '0', '39', '21', '1', '2018-01-08 10:26:43', '2018-01-08 10:26:43', '1', '678405', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('157', 'OB108784504143435', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '2', '123456', '0.00', '0', '0', '39', '0', '0', '2018-01-08 10:27:30', '2018-01-08 10:27:55', '1', '210865', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('158', 'OB108786530479262', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '108', '0', '0', '2018-01-08 10:30:53', '2018-01-08 10:30:53', '1', '424877', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('159', 'OB108809627253644', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '5', '测试', '0.00', '0', '0', '72', '0', '0', '2018-01-08 11:09:22', '2018-01-09 09:55:41', '2', '891073', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('160', 'OB108819406779904', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '4', '测试', '0.05', '0', '0', '58', '21', '1', '2018-01-08 11:25:40', '2018-01-09 09:55:35', '1', '879331', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('161', 'OB108919721742843', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '1', '156498465456485', '0.00', '0', '0', '216', '0', '0', '2018-01-08 14:12:52', '2018-01-08 14:14:31', '1', '988158', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('162', 'OB108982372375352', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '3', '测试', '0.00', '0', '0', '186', '0', '0', '2018-01-08 15:57:17', '2018-01-09 09:55:31', '1', '945823', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('163', 'OB108015742992857', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '3', '测试', '0.00', '0', '0', '186', '0', '0', '2018-01-08 16:52:54', '2018-01-09 09:55:26', '1', '547113', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('164', 'OB108018595047606', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '1', '测试', '0.02', '0', '0', '108', '21', '1', '2018-01-08 16:57:39', '2018-01-09 09:55:21', '1', '605441', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('165', 'OB108020209953061', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.00', '0', '0', '108', '0', '0', '2018-01-08 17:00:21', '2018-01-08 17:00:21', '1', '346852', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('166', 'OB108021924819884', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.00', '0', '0', '108', '0', '0', '2018-01-08 17:03:12', '2018-01-08 17:03:12', '1', '404036', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('167', 'OB108037389456252', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.02', '0', '0', '108', '21', '1', '2018-01-08 17:28:58', '2018-01-08 17:28:58', '1', '763020', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('168', 'OB108065434167567', '陈志平', '13333333333', '山西省', '晋城市', '陵川县', '叫姐姐', '', '', '5.00', '0', '0', '228', '23', '1', '2018-01-08 18:15:43', '2018-01-08 18:15:43', '1', '265061', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('169', 'OB108068010091720', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.00', '0', '0', '108', '0', '0', '2018-01-08 18:20:01', '2018-01-08 18:20:01', '1', '612704', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('170', 'OB108069129208058', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.00', '0', '0', '108', '0', '0', '2018-01-08 18:21:52', '2018-01-08 18:21:52', '1', '969358', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('171', 'OB108069946309612', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.00', '0', '0', '108', '0', '0', '2018-01-08 18:23:14', '2018-01-08 18:23:14', '1', '105766', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('172', 'OB108070470252529', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.00', '0', '0', '108', '0', '0', '2018-01-08 18:24:07', '2018-01-08 18:24:07', '1', '556816', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('173', 'OB108073157571230', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.00', '0', '0', '108', '0', '0', '2018-01-08 18:28:35', '2018-01-08 18:28:35', '1', '189404', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('174', 'OB108075012847837', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.00', '0', '0', '108', '0', '0', '2018-01-08 18:31:41', '2018-01-08 18:31:41', '1', '221055', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('175', 'OB108075952932153', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.02', '0', '0', '108', '21', '1', '2018-01-08 18:33:15', '2018-01-08 18:33:15', '1', '394806', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('176', 'OB108075952934465', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.02', '0', '0', '108', '21', '1', '2018-01-08 18:33:15', '2018-01-08 18:33:15', '1', '575674', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('177', 'OB108076266159697', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.02', '0', '0', '108', '21', '1', '2018-01-08 18:33:46', '2018-01-08 18:33:46', '1', '159457', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('178', 'OB108076694237585', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.02', '0', '0', '108', '21', '1', '2018-01-08 18:34:29', '2018-01-08 18:34:29', '1', '717916', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('179', 'OB108076807631942', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.02', '0', '0', '108', '21', '1', '2018-01-08 18:34:40', '2018-01-08 18:34:40', '1', '460229', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('180', 'OB108077153204762', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '3', '测试', '0.02', '0', '0', '108', '21', '1', '2018-01-08 18:35:15', '2018-01-09 09:55:05', '1', '777399', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('181', 'OB108096752446791', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '2', '测试', '0.02', '1000', '0', '108', '21', '1', '2018-01-08 19:07:55', '2018-01-09 09:55:01', '1', '555507', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('182', 'OB108097586009340', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '3', '测试', '1.00', '0', '0', '1260', '21', '1', '2018-01-08 19:09:18', '2018-01-09 09:54:56', '1', '812609', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('183', 'OB108098093558581', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.00', '1000', '0', '108', '0', '0', '2018-01-08 19:10:09', '2018-01-08 19:10:09', '1', '125952', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('184', 'OB108143504130645', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '1', '测试', '0.02', '1000', '0', '108', '21', '1', '2018-01-08 20:25:50', '2018-01-09 09:54:44', '1', '959293', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('185', 'OB108188772063115', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '7', '测试', '0.02', '1000', '0', '108', '21', '1', '2018-01-08 21:41:17', '2018-02-03 09:14:20', '1', '230145', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('186', 'OB108189093139749', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '7', '123456789', '0.02', '1000', '0', '108', '21', '1', '2018-01-08 21:41:49', '2018-02-02 16:32:23', '1', '705996', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('187', 'OB109611087928616', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-09 09:25:08', '2018-01-09 09:25:08', '1', '492485', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('188', 'OB109636169171625', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '1000', '0', '258', '0', '0', '2018-01-09 10:06:56', '2018-01-09 10:06:56', '1', '826832', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('189', 'OB109638416651640', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.40', '1000', '0', '150', '21', '1', '2018-01-09 10:10:41', '2018-01-09 10:10:41', '1', '214465', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('190', 'OB109647499903198', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.12', '1000', '0', '39', '21', '1', '2018-01-09 10:25:49', '2018-01-09 10:25:49', '1', '546227', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('191', 'OB109652554832231', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-09 10:34:15', '2018-01-09 10:34:15', '1', '825597', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('192', 'OB109660874712764', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '89', '0', '0', '2018-01-09 10:48:07', '2018-01-09 10:48:07', '2', '732549', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('193', 'OB109661276359177', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '1000', '0', '150', '0', '0', '2018-01-09 10:48:47', '2018-01-09 10:48:47', '1', '811564', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('194', 'OB109662011447480', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.40', '1000', '0', '150', '21', '1', '2018-01-09 10:50:01', '2018-01-09 10:50:01', '1', '150711', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('195', 'OB109663452095225', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '1000', '0', '150', '0', '0', '2018-01-09 10:52:25', '2018-01-09 10:52:25', '1', '443475', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('196', 'OB109675746504471', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '3', 'qwe123', '15.00', '0', '0', '72', '28', '1', '2018-01-09 11:12:54', '2018-01-09 11:14:32', '2', '423999', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('197', 'OB109678152629664', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '1', '测试', '15.00', '1000', '0', '72', '28', '1', '2018-01-09 11:16:55', '2018-01-31 10:06:01', '1', '161909', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('198', 'OB109681067774325', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '1', 'qwe123', '0.00', '1000', '0', '72', '0', '0', '2018-01-09 11:21:46', '2018-01-09 11:22:32', '1', '196083', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('199', 'OB109683359742195', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.50', '0', '0', '278', '23', '1', '2018-01-09 11:25:35', '2018-01-09 11:25:35', '2', '748914', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('200', 'OB109683913431857', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '15.00', '1000', '0', '72', '28', '1', '2018-01-09 11:26:31', '2018-01-09 11:26:31', '1', '433121', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('201', 'OB109688056915412', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '3', 'qwe123', '0.00', '1000', '0', '72', '0', '0', '2018-01-09 11:33:25', '2018-01-09 11:34:09', '1', '266734', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('202', 'OB109689244319601', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '1', '测试', '15.00', '1000', '0', '72', '28', '1', '2018-01-09 11:35:24', '2018-01-31 10:05:51', '1', '478684', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('203', 'OB109689302290368', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '1', 'qwe123', '15.00', '1000', '0', '72', '28', '1', '2018-01-09 11:35:30', '2018-01-09 11:36:12', '1', '356023', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('204', 'OB109696030637900', '王勇', '17816857090', '内蒙古自治区', '包头市', '东河区', '西溪湿地', '', '', '0.00', '1000', '0', '150', '0', '0', '2018-01-09 11:46:43', '2018-01-09 11:46:43', '1', '238081', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('205', 'OB109795633786220', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '1', '测试', '0.00', '1000', '0', '300', '0', '0', '2018-01-09 14:32:43', '2018-01-31 10:05:44', '1', '994382', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('206', 'OB109801939053013', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '1', '测试', '0.00', '1000', '0', '108', '21', '0', '2018-01-09 14:43:13', '2018-01-31 10:05:37', '1', '365038', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('207', 'OB109802231977002', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.02', '1000', '0', '85', '28', '1', '2018-01-09 14:43:43', '2018-01-09 14:43:43', '1', '911143', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('208', 'OB110679292589696', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '1000', '0', '159', '21', '0', '2018-01-10 15:05:29', '2018-01-10 15:05:29', '1', '221879', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('209', 'OB110682279370165', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.02', '0', '0', '108', '21', '1', '2018-01-10 15:10:27', '2018-01-10 15:10:27', '2', '149370', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('210', 'OB110683023607742', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '1', '测试', '0.00', '1000', '0', '72', '28', '0', '2018-01-10 15:11:42', '2018-01-31 10:05:30', '1', '352075', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('211', 'OB110782194109899', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-10 17:56:59', '2018-01-10 17:56:59', '1', '499858', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('212', 'OB110782696696507', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-10 17:57:49', '2018-01-10 17:57:49', '1', '588827', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('213', 'OB110782811092822', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-10 17:58:01', '2018-01-10 17:58:01', '1', '896789', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('214', 'OB110856876043660', '伟', '13735867728', '浙江省', '杭州市', '拱墅区', '文晖路419号', '', '', '0.40', '1000', '0', '89', '24', '1', '2018-01-10 20:01:27', '2018-01-10 20:01:27', '1', '138475', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('215', 'OB111365987011507', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:09:58', '2018-01-11 10:09:58', '1', '566925', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('216', 'OB111366016141215', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:01', '2018-01-11 10:10:01', '1', '403387', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('217', 'OB111366024921833', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:02', '2018-01-11 10:10:02', '1', '667181', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('218', 'OB111366032753910', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:03', '2018-01-11 10:10:03', '1', '836706', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('219', 'OB111366037722958', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:03', '2018-01-11 10:10:03', '1', '129886', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('220', 'OB111366043327874', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:04', '2018-01-11 10:10:04', '1', '555286', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('221', 'OB111366062762109', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:06', '2018-01-11 10:10:06', '1', '500906', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('222', 'OB111366070116590', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:07', '2018-01-11 10:10:07', '1', '989480', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('223', 'OB111366074769686', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:07', '2018-01-11 10:10:07', '1', '923063', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('224', 'OB111366093449705', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:09', '2018-01-11 10:10:09', '1', '146282', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('225', 'OB111366097275950', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:09', '2018-01-11 10:10:09', '1', '265923', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('226', 'OB111366101315128', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:10', '2018-01-11 10:10:10', '1', '231902', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('227', 'OB111366105442763', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:10', '2018-01-11 10:10:10', '1', '770303', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('228', 'OB111366109735410', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:10', '2018-01-11 10:10:10', '1', '705743', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('229', 'OB111366114332118', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:11', '2018-01-11 10:10:11', '1', '545943', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('230', 'OB111366117900902', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:11', '2018-01-11 10:10:11', '1', '340353', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('231', 'OB111366123791301', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:12', '2018-01-11 10:10:12', '1', '264943', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('232', 'OB111366127814160', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:12', '2018-01-11 10:10:12', '1', '416456', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('233', 'OB111366133778781', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:13', '2018-01-11 10:10:13', '1', '736583', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('234', 'OB111366140315317', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:14', '2018-01-11 10:10:14', '1', '462642', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('235', 'OB111366144280474', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:14', '2018-01-11 10:10:14', '1', '920467', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('236', 'OB111366152665490', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:15', '2018-01-11 10:10:15', '1', '852519', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('237', 'OB111366156920535', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:15', '2018-01-11 10:10:15', '1', '830693', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('238', 'OB111366160765182', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:16', '2018-01-11 10:10:16', '1', '300064', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('239', 'OB111366189609272', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:18', '2018-01-11 10:10:18', '1', '890194', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('240', 'OB111366195789027', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:19', '2018-01-11 10:10:19', '1', '306837', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('241', 'OB111366197452606', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:19', '2018-01-11 10:10:19', '1', '600533', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('242', 'OB111366201908237', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:20', '2018-01-11 10:10:20', '1', '727841', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('243', 'OB111366206250530', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:20', '2018-01-11 10:10:20', '1', '537402', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('244', 'OB111366388184397', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:38', '2018-01-11 10:10:38', '1', '760556', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('245', 'OB111366392648421', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:39', '2018-01-11 10:10:39', '1', '492867', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('246', 'OB111366396272527', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:39', '2018-01-11 10:10:39', '1', '177482', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('247', 'OB111366400460064', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:40', '2018-01-11 10:10:40', '1', '733116', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('248', 'OB111366404813403', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:40', '2018-01-11 10:10:40', '1', '587484', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('249', 'OB111366410145307', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:41', '2018-01-11 10:10:41', '1', '906668', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('250', 'OB111366421289105', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:42', '2018-01-11 10:10:42', '1', '838518', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('251', 'OB111366471629733', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:47', '2018-01-11 10:10:47', '1', '512573', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('252', 'OB111366476303644', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:47', '2018-01-11 10:10:47', '1', '604158', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('253', 'OB111366480490920', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:48', '2018-01-11 10:10:48', '1', '720465', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('254', 'OB111366485138468', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:48', '2018-01-11 10:10:48', '1', '497733', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('255', 'OB111366489176800', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:48', '2018-01-11 10:10:48', '1', '998749', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('256', 'OB111366493334920', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 10:10:49', '2018-01-11 10:10:49', '1', '508100', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('257', 'OB111494565184990', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:44:16', '2018-01-11 13:44:16', '1', '210761', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('258', 'OB111494583314105', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:44:18', '2018-01-11 13:44:18', '1', '578659', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('259', 'OB111494590842754', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:44:19', '2018-01-11 13:44:19', '1', '206422', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('260', 'OB111494591996416', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:44:19', '2018-01-11 13:44:19', '1', '460776', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('261', 'OB111494596646002', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:44:19', '2018-01-11 13:44:19', '1', '247448', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('262', 'OB111494601714499', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:44:20', '2018-01-11 13:44:20', '1', '225901', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('263', 'OB111494608712929', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:44:20', '2018-01-11 13:44:20', '1', '152403', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('264', 'OB111494613102536', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:44:21', '2018-01-11 13:44:21', '1', '234953', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('265', 'OB111494616479806', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:44:21', '2018-01-11 13:44:21', '1', '831404', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('266', 'OB111494710886209', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:44:31', '2018-01-11 13:44:31', '1', '491727', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('267', 'OB111494717733146', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:44:31', '2018-01-11 13:44:31', '1', '698452', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('268', 'OB111494720888913', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:44:32', '2018-01-11 13:44:32', '1', '374845', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('269', 'OB111495025594438', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.00', '600', '0', '0', '38', '0', '2018-01-11 13:45:02', '2018-01-11 13:45:02', '1', '367391', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('270', 'OB111495488489703', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:45:48', '2018-01-11 13:45:48', '1', '589357', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('271', 'OB111495495509148', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:45:49', '2018-01-11 13:45:49', '1', '502106', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('272', 'OB111495500910931', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:45:50', '2018-01-11 13:45:50', '1', '686921', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('273', 'OB111495507984884', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:45:50', '2018-01-11 13:45:50', '1', '904610', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('274', 'OB111495511777202', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:45:51', '2018-01-11 13:45:51', '1', '319913', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('275', 'OB111495514996670', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:45:51', '2018-01-11 13:45:51', '1', '486953', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('276', 'OB111495518223776', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:45:51', '2018-01-11 13:45:51', '1', '573981', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('277', 'OB111495520753707', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:45:52', '2018-01-11 13:45:52', '1', '654126', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('278', 'OB111498111711704', '123', '18857157068', '浙江省', '杭州市', '滨江区', '123', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:50:11', '2018-01-11 13:50:11', '1', '108068', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('279', 'OB111498118842561', '123', '18857157068', '浙江省', '杭州市', '滨江区', '123', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:50:11', '2018-01-11 13:50:11', '1', '139688', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('280', 'OB111498124974201', '123', '18857157068', '浙江省', '杭州市', '滨江区', '123', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:50:12', '2018-01-11 13:50:12', '1', '764388', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('281', 'OB111498128763137', '123', '18857157068', '浙江省', '杭州市', '滨江区', '123', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:50:12', '2018-01-11 13:50:12', '1', '110491', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('282', 'OB111498637768672', '123', '18857157068', '浙江省', '杭州市', '滨江区', '123', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:51:03', '2018-01-11 13:51:03', '1', '165020', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('283', 'OB111500332905068', '123', '18857157068', '浙江省', '杭州市', '滨江区', '123', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:53:53', '2018-01-11 13:53:53', '1', '402746', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('284', 'OB111500340521173', '123', '18857157068', '浙江省', '杭州市', '滨江区', '123', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:53:54', '2018-01-11 13:53:54', '1', '878293', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('285', 'OB111500349699953', '123', '18857157068', '浙江省', '杭州市', '滨江区', '123', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-11 13:53:54', '2018-01-11 13:53:54', '1', '345217', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('286', 'OB111509634016382', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '1', '测试', '15.00', '1000', '0', '72', '28', '1', '2018-01-11 14:09:23', '2018-01-31 10:05:23', '1', '967861', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('287', 'OB111514213229790', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '15.00', '1000', '0', '72', '28', '1', '2018-01-11 14:17:01', '2018-01-11 14:17:01', '1', '394863', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('288', 'OB111606677539874', '江泽军', '15167180435', '浙江省', '杭州市', '滨江区', '西行街道万福中心A座9楼', '', '', '2.00', '0', '0', '1280', '26', '1', '2018-01-11 16:51:07', '2018-01-11 16:51:07', '1', '522205', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('289', 'OB112490125942533', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-12 17:23:32', '2018-01-12 17:23:32', '1', '151712', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('290', 'OB112490158404168', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-12 17:23:35', '2018-01-12 17:23:35', '1', '743816', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('291', 'OB112490174316751', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-12 17:23:37', '2018-01-12 17:23:37', '1', '872760', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('292', 'OB112490176790796', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-12 17:23:37', '2018-01-12 17:23:37', '1', '990890', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('293', 'OB112490215658703', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-12 17:23:41', '2018-01-12 17:23:41', '1', '507939', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('294', 'OB112490221871643', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-12 17:23:42', '2018-01-12 17:23:42', '1', '454017', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('295', 'OB112490252867101', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-12 17:23:45', '2018-01-12 17:23:45', '1', '401811', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('296', 'OB112490311994372', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-12 17:23:51', '2018-01-12 17:23:51', '1', '704387', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('297', 'OB112490334674377', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-12 17:23:53', '2018-01-12 17:23:53', '1', '253360', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('298', 'OB112490493809149', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-12 17:24:09', '2018-01-12 17:24:09', '1', '130129', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('299', 'OB112490499524722', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-12 17:24:09', '2018-01-12 17:24:09', '1', '786540', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('300', 'OB112490509222326', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-12 17:24:10', '2018-01-12 17:24:10', '1', '474956', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('301', 'OB112490510794881', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-12 17:24:11', '2018-01-12 17:24:11', '1', '238360', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('302', 'OB112490519098806', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-12 17:24:11', '2018-01-12 17:24:11', '1', '261226', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('303', 'OB112490655334937', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-12 17:24:25', '2018-01-12 17:24:25', '1', '427962', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('304', 'OB112490656398428', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-12 17:24:25', '2018-01-12 17:24:25', '1', '982821', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('305', 'OB112609567534856', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '2.00', '0', '0', '1780', '21', '1', '2018-01-12 20:42:36', '2018-01-12 20:42:36', '1', '458948', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('306', 'OB112609971105638', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.50', '1000', '0', '260', '21', '1', '2018-01-12 20:43:17', '2018-01-12 20:43:17', '1', '942806', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('307', 'OB112613237149107', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '3.00', '1000', '0', '78', '21', '1', '2018-01-12 20:48:43', '2018-01-12 20:48:43', '1', '874935', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('308', 'OB113087999900497', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-13 09:59:59', '2018-01-13 09:59:59', '1', '929862', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('309', 'OB113091178603505', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.20', '1000', '0', '115', '31', '1', '2018-01-13 10:05:17', '2018-01-13 10:05:17', '1', '821258', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('310', 'OB113142188672538', '孙腾', '15862237780', '江苏省', '徐州市', '泉山区', '建国西路玉带西街绅士花园门口爱玛售后', '', '', '0.00', '1000', '0', '78', '26', '0', '2018-01-13 11:30:18', '2018-01-13 11:30:18', '1', '729651', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('311', 'OB113279572619718', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '1.00', '1000', '0', '350', '21', '1', '2018-01-13 15:19:17', '2018-01-13 15:19:17', '1', '681387', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('312', 'OB113279682189910', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '1.00', '1000', '0', '350', '21', '1', '2018-01-13 15:19:28', '2018-01-13 15:19:28', '1', '273114', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('313', 'OB113350784951154', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-13 17:17:58', '2018-01-13 17:17:58', '1', '444865', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('314', 'OB113351883845108', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-13 17:19:48', '2018-01-13 17:19:48', '1', '439969', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('315', 'OB113352001242945', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '0', '0', '108', '21', '1', '2018-01-13 17:20:00', '2018-01-13 17:20:00', '2', '557002', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('316', 'OB113384869943703', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-13 18:14:46', '2018-01-13 18:14:46', '1', '861111', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('317', 'OB113385419353320', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '1', '测试', '0.02', '0', '0', '108', '21', '1', '2018-01-13 18:15:41', '2018-01-31 10:05:14', '2', '653273', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('318', 'OB113423627415129', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '15.00', '1000', '0', '72', '28', '1', '2018-01-13 19:19:22', '2018-01-13 19:19:22', '1', '483141', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('319', 'OB113423692150722', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '15.00', '1000', '0', '72', '28', '1', '2018-01-13 19:19:29', '2018-01-13 19:19:29', '1', '813038', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('320', 'OB113423764732486', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '15.00', '1000', '0', '72', '28', '1', '2018-01-13 19:19:36', '2018-01-13 19:19:36', '1', '819539', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('321', 'OB113427978205358', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.00', '1000', '0', '499', '29', '1', '2018-01-13 19:26:37', '2018-01-13 19:26:37', '1', '166632', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('322', 'OB113428027652686', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.00', '1000', '0', '499', '29', '1', '2018-01-13 19:26:42', '2018-01-13 19:26:42', '1', '851124', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('323', 'OB113428398613362', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.00', '1000', '0', '499', '29', '1', '2018-01-13 19:27:19', '2018-01-13 19:27:19', '1', '644472', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('324', 'OB113428924326272', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.00', '1000', '0', '499', '29', '1', '2018-01-13 19:28:12', '2018-01-13 19:28:12', '1', '169704', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('325', 'OB113512075994079', '孙凤英', '13185083628', '浙江省', '杭州市', '下城区', '环城北路绿城兰园4号楼一单元1301室', '7', '539441036286', '3.00', '0', '0', '500', '34', '1', '2018-01-13 21:46:47', '2018-01-15 16:25:42', '1', '464538', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('326', 'OB113546761815802', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-13 22:44:36', '2018-01-13 22:44:36', '1', '915843', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('327', 'OB113546840973358', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-13 22:44:44', '2018-01-13 22:44:44', '1', '509865', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('328', 'OB113556927592460', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-13 23:01:32', '2018-01-13 23:01:32', '1', '292445', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('329', 'OB113557259450486', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-13 23:02:05', '2018-01-13 23:02:05', '1', '755383', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('330', 'OB115803663989347', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-15 09:39:26', '2018-01-15 09:39:26', '1', '396159', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('331', 'OB115866802494900', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-15 11:24:40', '2018-01-15 11:24:40', '1', '101443', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('332', 'OB115866817676312', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-15 11:24:41', '2018-01-15 11:24:41', '1', '612752', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('333', 'OB115048847294920', '唐', '13858026566', '浙江省', '杭州市', '滨江区', '万福中心A座9楼', '7', '内部兑换', '0.40', '0', '0', '399', '21', '1', '2018-01-15 16:28:04', '2018-01-15 17:14:07', '2', '255023', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('334', 'OB115207010329727', '张小丽', '13777865313', '浙江省', '杭州市', '上城区', '近江文华苑1-5-103', '7', '539441036316', '3.00', '0', '0', '500', '21', '1', '2018-01-15 20:51:41', '2018-01-16 10:40:08', '1', '371337', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('335', 'OB116685023526680', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.35', '1000', '0', '240', '23', '1', '2018-01-16 10:08:22', '2018-01-16 10:08:22', '1', '875105', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('336', 'OB116007873001262', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-16 19:06:27', '2018-01-16 19:06:27', '1', '165640', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('337', 'OB116008807314269', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-16 19:08:00', '2018-01-16 19:08:00', '1', '459970', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('338', 'OB116013294044522', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '3.00', '1000', '0', '78', '21', '1', '2018-01-16 19:15:29', '2018-01-16 19:15:29', '1', '949822', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('339', 'OB116013411385457', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '3.00', '1000', '0', '78', '21', '1', '2018-01-16 19:15:41', '2018-01-16 19:15:41', '1', '344133', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('340', 'OB116013806587103', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '3.00', '1000', '0', '78', '21', '1', '2018-01-16 19:16:20', '2018-01-16 19:16:20', '1', '726996', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('341', 'OB116014039309893', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '3.00', '1000', '0', '78', '21', '1', '2018-01-16 19:16:43', '2018-01-16 19:16:43', '1', '455882', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('342', 'OB116014824578489', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '3.00', '1000', '0', '78', '21', '1', '2018-01-16 19:18:02', '2018-01-16 19:18:02', '1', '331482', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('343', 'OB116015180861817', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '3.00', '1000', '0', '78', '21', '1', '2018-01-16 19:18:38', '2018-01-16 19:18:38', '1', '658228', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('344', 'OB116016445383621', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-16 19:20:44', '2018-01-16 19:20:44', '1', '306390', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('345', 'OB116016535943260', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-16 19:20:53', '2018-01-16 19:20:53', '1', '618182', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('346', 'OB116016814418138', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '3.00', '1000', '0', '78', '21', '1', '2018-01-16 19:21:21', '2018-01-16 19:21:21', '1', '439226', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('347', 'OB116018470809707', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-16 19:24:07', '2018-01-16 19:24:07', '1', '877676', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('348', 'OB116018488246470', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-16 19:24:08', '2018-01-16 19:24:08', '1', '310842', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('349', 'OB116018512946895', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-16 19:24:11', '2018-01-16 19:24:11', '1', '925314', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('350', 'OB116018598142045', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-16 19:24:19', '2018-01-16 19:24:19', '1', '818519', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('351', 'OB116023527972813', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '3.00', '1000', '0', '78', '21', '1', '2018-01-16 19:32:32', '2018-01-16 19:32:32', '1', '361308', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('352', 'OB116024913084199', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '3.00', '1000', '0', '78', '21', '1', '2018-01-16 19:34:51', '2018-01-16 19:34:51', '1', '345011', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('353', 'OB116025735056286', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '3.00', '1000', '0', '78', '21', '1', '2018-01-16 19:36:13', '2018-01-16 19:36:13', '1', '903381', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('354', 'OB116025935733454', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-16 19:36:33', '2018-01-16 19:36:33', '1', '667051', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('355', 'OB116026168579804', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-16 19:36:56', '2018-01-16 19:36:56', '1', '481024', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('356', 'OB116026833421390', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-16 19:38:03', '2018-01-16 19:38:03', '1', '969050', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('357', 'OB116029471877869', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '3.00', '1000', '0', '78', '21', '1', '2018-01-16 19:42:27', '2018-01-16 19:42:27', '1', '391434', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('358', 'OB116030414633669', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-16 19:44:01', '2018-01-16 19:44:01', '1', '398247', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('359', 'OB116030707943491', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-16 19:44:30', '2018-01-16 19:44:30', '1', '651566', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('360', 'OB116064425391529', '王先生', '15901311666', '浙江省', '杭州市', '余杭区', '乔司方桥美域高塑业1幢11楼欧亿服饰', '7', '539441036348', '3.00', '0', '0', '500', '34', '1', '2018-01-16 20:40:42', '2018-01-17 09:42:55', '1', '976136', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('361', 'OB116078174046925', '朱先生', '15868808589', '浙江省', '杭州市', '江干区', '白杨街道东郡国际嘉湾8幢', '7', '539441036355', '3.00', '0', '0', '500', '34', '1', '2018-01-16 21:03:37', '2018-01-17 09:43:22', '1', '679120', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('362', 'OB117517118573954', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-17 09:15:11', '2018-01-17 09:15:11', '1', '564816', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('363', 'OB117518960123119', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-17 09:18:16', '2018-01-17 09:18:16', '1', '157076', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('364', 'OB117519574509055', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-17 09:19:17', '2018-01-17 09:19:17', '1', '408514', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('365', 'OB117578567596924', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.55', '1000', '0', '158', '39', '1', '2018-01-17 10:57:36', '2018-01-17 10:57:36', '1', '288551', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('366', 'OB117578680668284', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.55', '1000', '0', '158', '39', '1', '2018-01-17 10:57:48', '2018-01-17 10:57:48', '1', '877428', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('367', 'OB117579618261868', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '1', '测试', '2.50', '0', '0', '500', '39', '1', '2018-01-17 10:59:21', '2018-01-31 10:05:06', '1', '860402', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('368', 'OB117580329759536', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '0.00', '1000', '0', '108', '21', '0', '2018-01-17 11:00:32', '2018-01-17 11:00:32', '1', '517204', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('369', 'OB117580766404663', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '1.00', '1000', '0', '499', '29', '1', '2018-01-17 11:01:16', '2018-01-17 11:01:16', '1', '564735', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('370', 'OB117580832678731', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '1.00', '1000', '0', '499', '29', '1', '2018-01-17 11:01:23', '2018-01-17 11:01:23', '1', '201304', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('371', 'OB117707605318455', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-17 14:32:40', '2018-01-17 14:32:40', '1', '699332', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('372', 'OB117708456512414', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-17 14:34:05', '2018-01-17 14:34:05', '1', '217848', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('373', 'OB117844589656036', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-17 18:20:58', '2018-01-17 18:20:58', '1', '343231', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('374', 'OB118449154882240', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '3.00', '1000', '0', '78', '21', '1', '2018-01-18 11:08:35', '2018-01-18 11:08:35', '1', '820524', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('375', 'OB118449867224531', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '15.00', '1000', '0', '72', '28', '1', '2018-01-18 11:09:46', '2018-01-18 11:09:46', '1', '714137', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('376', 'OB118589277070163', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.12', '1000', '0', '39', '21', '1', '2018-01-18 15:02:07', '2018-01-18 15:02:07', '1', '539157', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('377', 'OB118630461238418', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.12', '1000', '0', '39', '21', '1', '2018-01-18 16:10:46', '2018-01-18 16:10:46', '1', '832120', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('378', 'OB118647989905958', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.12', '1000', '0', '39', '21', '1', '2018-01-18 16:39:58', '2018-01-18 16:39:58', '1', '191076', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('379', 'OB119294436559601', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '15.00', '1000', '0', '72', '28', '1', '2018-01-19 10:37:23', '2018-01-19 10:37:23', '1', '461081', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('380', 'OB119298303458165', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '1', '测试', '15.00', '0', '0', '72', '28', '1', '2018-01-19 10:43:50', '2018-01-31 10:04:57', '2', '116572', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('381', 'OB119298323103834', '魏尚武', '18051066678', '江苏省', '徐州市', '云龙区', '建国东路43号', '', '', '2.50', '0', '0', '500', '26', '1', '2018-01-19 10:43:52', '2018-01-19 10:43:52', '1', '616167', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('382', 'OB119398603895056', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.12', '1000', '0', '39', '21', '1', '2018-01-19 13:31:00', '2018-01-19 13:31:00', '1', '611712', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('383', 'OB119398708493069', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.12', '1000', '0', '39', '21', '1', '2018-01-19 13:31:10', '2018-01-19 13:31:10', '1', '926634', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('384', 'OB119399357660621', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '3.00', '1000', '0', '78', '21', '1', '2018-01-19 13:32:15', '2018-01-19 13:32:15', '1', '102847', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('385', 'OB119478070887466', '江慧', '15957206248', '浙江省', '杭州市', '余杭区', '闲林街道何母桥全丰苑90号', '', '', '0.00', '0', '0', '1810', '21', '0', '2018-01-19 15:43:27', '2018-01-19 15:43:27', '1', '283612', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('386', 'OB119485422274696', '江慧', '15957206248', '浙江省', '杭州市', '余杭区', '闲林街道何母桥全丰苑90号', '', '', '0.00', '0', '0', '3739', '21', '0', '2018-01-19 15:55:42', '2018-01-19 15:55:42', '1', '222605', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('387', 'OB119498644537549', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.55', '1000', '0', '158', '21', '1', '2018-01-19 16:17:44', '2018-01-19 16:17:44', '1', '925257', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('388', 'OB119530721131276', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '15.00', '1000', '0', '72', '28', '1', '2018-01-19 17:11:12', '2018-01-19 17:11:12', '1', '320460', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('389', 'OB119531272034661', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '15.00', '1000', '0', '72', '28', '1', '2018-01-19 17:12:07', '2018-01-19 17:12:07', '1', '256473', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('390', 'OB119550706572466', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-19 17:44:30', '2018-01-19 17:44:30', '1', '397921', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('391', 'OB119550751488958', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-19 17:44:35', '2018-01-19 17:44:35', '1', '792440', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('392', 'OB119550897225578', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-19 17:44:49', '2018-01-19 17:44:49', '1', '736973', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('393', 'OB119551017962761', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '0', '0', '108', '21', '1', '2018-01-19 17:45:01', '2018-01-19 17:45:01', '2', '611208', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('394', 'OB119551111515385', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-19 17:45:11', '2018-01-19 17:45:11', '1', '621852', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('395', 'OB119570646755386', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.00', '1000', '0', '108', '21', '0', '2018-01-19 18:17:44', '2018-01-19 18:17:44', '1', '773818', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('396', 'OB119570816103671', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-19 18:18:01', '2018-01-19 18:18:01', '1', '881811', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('397', 'OB119571124016894', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-19 18:18:32', '2018-01-19 18:18:32', '1', '327598', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('398', 'OB119571204266023', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-19 18:18:40', '2018-01-19 18:18:40', '1', '528447', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('399', 'OB119638339578552', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-19 20:10:33', '2018-01-19 20:10:33', '1', '346677', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('400', 'OB120198053868870', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.50', '0', '0', '350', '41', '1', '2018-01-20 11:43:25', '2018-01-20 11:43:25', '1', '851621', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('401', 'OB120198679453010', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.50', '1000', '0', '160', '41', '1', '2018-01-20 11:44:27', '2018-01-20 11:44:27', '1', '665633', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('402', 'OB120202108822065', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 11:50:10', '2018-01-20 11:50:10', '1', '894393', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('403', 'OB120213023824524', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 12:08:22', '2018-01-20 12:08:22', '1', '847113', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('404', 'OB120214283316771', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 12:10:28', '2018-01-20 12:10:28', '1', '466672', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('405', 'OB120214329212354', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 12:10:32', '2018-01-20 12:10:32', '1', '627427', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('406', 'OB120214565163769', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 12:10:56', '2018-01-20 12:10:56', '1', '298109', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('407', 'OB120214584374838', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 12:10:58', '2018-01-20 12:10:58', '1', '610182', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('408', 'OB120214604155992', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 12:11:00', '2018-01-20 12:11:00', '1', '245509', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('409', 'OB120214621301682', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 12:11:02', '2018-01-20 12:11:02', '1', '652453', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('410', 'OB120214851320411', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 12:11:25', '2018-01-20 12:11:25', '1', '741608', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('411', 'OB120216694649268', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 12:14:29', '2018-01-20 12:14:29', '1', '983143', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('412', 'OB120218210514171', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 12:17:01', '2018-01-20 12:17:01', '1', '741107', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('413', 'OB120218603920968', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 12:17:40', '2018-01-20 12:17:40', '1', '361353', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('414', 'OB120219004609924', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 12:18:20', '2018-01-20 12:18:20', '1', '498105', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('415', 'OB120219006994648', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 12:18:20', '2018-01-20 12:18:20', '1', '267412', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('416', 'OB120219055275918', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 12:18:25', '2018-01-20 12:18:25', '1', '249478', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('417', 'OB120219114898594', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 12:18:31', '2018-01-20 12:18:31', '1', '944695', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('418', 'OB120219845472087', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 12:19:44', '2018-01-20 12:19:44', '1', '756002', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('419', 'OB120259089270114', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-20 13:25:08', '2018-01-20 13:25:08', '1', '141977', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('420', 'OB120259734892878', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '3.00', '1000', '0', '78', '21', '1', '2018-01-20 13:26:13', '2018-01-20 13:26:13', '1', '932647', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('421', 'OB120259792122932', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '3.00', '1000', '0', '78', '21', '1', '2018-01-20 13:26:19', '2018-01-20 13:26:19', '1', '677412', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('422', 'OB120260062973869', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '3.00', '1000', '0', '78', '21', '1', '2018-01-20 13:26:46', '2018-01-20 13:26:46', '1', '728540', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('423', 'OB120260461346339', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-20 13:27:26', '2018-01-20 13:27:26', '1', '269263', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('424', 'OB120260533630423', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-20 13:27:33', '2018-01-20 13:27:33', '1', '231498', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('425', 'OB120260584344471', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-20 13:27:38', '2018-01-20 13:27:38', '1', '589914', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('426', 'OB120260610133572', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-20 13:27:41', '2018-01-20 13:27:41', '1', '746600', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('427', 'OB120260630137922', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-20 13:27:43', '2018-01-20 13:27:43', '1', '639522', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('428', 'OB120260670318839', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-20 13:27:47', '2018-01-20 13:27:47', '1', '486364', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('429', 'OB120260712102739', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-20 13:27:51', '2018-01-20 13:27:51', '1', '707732', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('430', 'OB120269117003806', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 13:41:51', '2018-01-20 13:41:51', '1', '987557', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('431', 'OB120269166585601', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 13:41:56', '2018-01-20 13:41:56', '1', '907490', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('432', 'OB120269203353900', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 13:42:00', '2018-01-20 13:42:00', '1', '209297', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('433', 'OB120269826841428', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 13:43:02', '2018-01-20 13:43:02', '1', '184521', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('434', 'OB120269869368802', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 13:43:06', '2018-01-20 13:43:06', '1', '631599', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('435', 'OB120269875534415', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 13:43:07', '2018-01-20 13:43:07', '1', '732523', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('436', 'OB120269978003107', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 13:43:17', '2018-01-20 13:43:17', '1', '376365', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('437', 'OB120270292159716', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 13:43:49', '2018-01-20 13:43:49', '1', '914614', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('438', 'OB120270300315559', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 13:43:50', '2018-01-20 13:43:50', '1', '115070', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('439', 'OB120270304966146', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 13:43:50', '2018-01-20 13:43:50', '1', '175925', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('440', 'OB120270306627385', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 13:43:50', '2018-01-20 13:43:50', '1', '694730', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('441', 'OB120270308322754', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 13:43:50', '2018-01-20 13:43:50', '1', '240561', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('442', 'OB120270472926261', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 13:44:07', '2018-01-20 13:44:07', '1', '681221', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('443', 'OB120270544030204', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 13:44:14', '2018-01-20 13:44:14', '1', '783424', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('444', 'OB120270552198126', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 13:44:15', '2018-01-20 13:44:15', '1', '945897', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('445', 'OB120270557629291', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 13:44:15', '2018-01-20 13:44:15', '1', '815212', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('446', 'OB120270870855035', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 13:44:47', '2018-01-20 13:44:47', '1', '784756', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('447', 'OB120271750412792', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 13:46:15', '2018-01-20 13:46:15', '1', '883856', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('448', 'OB120272010247885', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 13:46:41', '2018-01-20 13:46:41', '1', '456506', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('449', 'OB120273233906519', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 13:48:43', '2018-01-20 13:48:43', '1', '918337', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('450', 'OB120273542987517', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 13:49:14', '2018-01-20 13:49:14', '1', '443175', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('451', 'OB120306134236032', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '0.00', '0', '0', '4835', '27', '0', '2018-01-20 14:43:33', '2018-01-20 14:43:33', '1', '209767', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('452', 'OB120335418111007', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '7', '全友年会兑换', '2.00', '0', '0', '1280', '27', '1', '2018-01-20 15:32:21', '2018-01-20 15:37:59', '1', '105388', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('453', 'OB120335758858198', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '7', '全友年会兑换', '2.50', '0', '0', '1195', '27', '1', '2018-01-20 15:32:55', '2018-01-20 15:37:31', '1', '871752', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('454', 'OB120336989687221', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '7', '全友年会兑换', '5.00', '0', '0', '1880', '27', '1', '2018-01-20 15:34:58', '2018-01-20 15:37:00', '1', '403561', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('455', 'OB120338022167462', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '3.00', '0', '0', '1494', '27', '1', '2018-01-20 15:36:42', '2018-01-20 15:36:42', '1', '280909', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('456', 'OB120338676873357', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '7', '全友年会兑换', '3.00', '0', '0', '1494', '27', '1', '2018-01-20 15:37:47', '2018-01-20 15:38:28', '1', '798772', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('457', 'OB120339292410086', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '0.50', '0', '0', '398', '27', '1', '2018-01-20 15:38:49', '2018-01-20 15:38:49', '1', '196683', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('458', 'OB120355291096265', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:05:29', '2018-01-20 16:05:29', '1', '836276', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('459', 'OB120355983279049', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:06:38', '2018-01-20 16:06:38', '1', '251964', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('460', 'OB120356638923575', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:07:43', '2018-01-20 16:07:43', '1', '939110', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('461', 'OB120356754545831', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:07:55', '2018-01-20 16:07:55', '1', '465973', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('462', 'OB120356870180796', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:08:07', '2018-01-20 16:08:07', '1', '926326', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('463', 'OB120357960077386', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:09:56', '2018-01-20 16:09:56', '1', '159129', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('464', 'OB120358027341173', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:10:02', '2018-01-20 16:10:02', '1', '514181', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('465', 'OB120358614567300', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:11:01', '2018-01-20 16:11:01', '1', '806665', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('466', 'OB120360139916696', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:13:33', '2018-01-20 16:13:33', '1', '794173', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('467', 'OB120360487566354', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:14:08', '2018-01-20 16:14:08', '1', '530792', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('468', 'OB120360743069030', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:14:34', '2018-01-20 16:14:34', '1', '892468', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('469', 'OB120361815500089', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:16:21', '2018-01-20 16:16:21', '1', '940505', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('470', 'OB120362453095711', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:17:25', '2018-01-20 16:17:25', '1', '898559', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('471', 'OB120363238028496', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:18:43', '2018-01-20 16:18:43', '1', '543349', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('472', 'OB120363728638810', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:19:32', '2018-01-20 16:19:32', '1', '670630', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('473', 'OB120363880161216', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:19:48', '2018-01-20 16:19:48', '1', '183840', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('474', 'OB120364655218966', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.50', '1000', '0', '280', '21', '1', '2018-01-20 16:21:05', '2018-01-20 16:21:05', '1', '450974', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('475', 'OB120364851344523', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.50', '1000', '0', '280', '21', '1', '2018-01-20 16:21:25', '2018-01-20 16:21:25', '1', '568652', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('476', 'OB120365125100573', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:21:52', '2018-01-20 16:21:52', '1', '867972', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('477', 'OB120365293413041', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:22:09', '2018-01-20 16:22:09', '1', '187525', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('478', 'OB120365838709257', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:23:03', '2018-01-20 16:23:03', '1', '742678', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('479', 'OB120365908322484', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:23:10', '2018-01-20 16:23:10', '1', '380538', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('480', 'OB120366677021487', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:24:27', '2018-01-20 16:24:27', '1', '593212', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('481', 'OB120366750589042', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:24:35', '2018-01-20 16:24:35', '1', '707649', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('482', 'OB120366828446880', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:24:42', '2018-01-20 16:24:42', '1', '508525', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('483', 'OB120366855942572', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:24:45', '2018-01-20 16:24:45', '1', '316258', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('484', 'OB120366876796050', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:24:47', '2018-01-20 16:24:47', '1', '879012', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('485', 'OB120367061697595', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:25:06', '2018-01-20 16:25:06', '1', '448320', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('486', 'OB120367087673388', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:25:08', '2018-01-20 16:25:08', '1', '908924', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('487', 'OB120367164433636', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:25:16', '2018-01-20 16:25:16', '1', '420580', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('488', 'OB120367792556463', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 16:26:19', '2018-01-20 16:26:19', '1', '418931', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('489', 'OB120368583153510', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '2.50', '0', '0', '500', '21', '1', '2018-01-20 16:27:38', '2018-01-20 16:27:38', '1', '248819', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('490', 'OB120368923822200', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.55', '1000', '0', '158', '21', '1', '2018-01-20 16:28:12', '2018-01-20 16:28:12', '1', '389360', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('491', 'OB120369542532883', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '3.00', '1000', '0', '78', '21', '1', '2018-01-20 16:29:14', '2018-01-20 16:29:14', '1', '180050', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('492', 'OB120384107499238', '王爱华', '18758051021', '浙江省', '杭州市', '拱墅区', '石祥路196号夹板市场2楼A区全友家居', '7', '539441036394', '0.00', '0', '0', '398', '21', '0', '2018-01-20 16:53:30', '2018-01-23 15:58:38', '1', '370504', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('493', 'OB120384403853347', '王爱华', '18758051021', '浙江省', '杭州市', '拱墅区', '石祥路196号夹板市场2楼A区全友家居', '', '', '0.00', '1000', '0', '150', '27', '0', '2018-01-20 16:54:00', '2018-01-20 16:54:00', '1', '841567', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('494', 'OB120388049026695', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '3.00', '1000', '0', '78', '21', '1', '2018-01-20 17:00:04', '2018-01-20 17:00:04', '1', '934559', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('495', 'OB120388465100360', '王爱华', '18758051021', '浙江省', '杭州市', '拱墅区', '石祥路196号夹板市场2楼A区全友家居', '', '', '0.40', '1000', '0', '150', '27', '1', '2018-01-20 17:00:46', '2018-01-20 17:00:46', '1', '181503', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('496', 'OB120388520010491', '王爱华', '18758051021', '浙江省', '杭州市', '拱墅区', '石祥路196号夹板市场2楼A区全友家居', '', '', '0.40', '1000', '0', '150', '27', '1', '2018-01-20 17:00:52', '2018-01-20 17:00:52', '1', '303146', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('497', 'OB120388617196629', '王爱华', '18758051021', '浙江省', '杭州市', '拱墅区', '石祥路196号夹板市场2楼A区全友家居', '', '', '0.40', '1000', '0', '150', '27', '1', '2018-01-20 17:01:01', '2018-01-20 17:01:01', '1', '184024', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('498', 'OB120388622492445', '王爱华', '18758051021', '浙江省', '杭州市', '拱墅区', '石祥路196号夹板市场2楼A区全友家居', '', '', '0.40', '1000', '0', '150', '27', '1', '2018-01-20 17:01:02', '2018-01-20 17:01:02', '1', '541663', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('499', 'OB120388748753101', '王爱华', '18758051021', '浙江省', '杭州市', '拱墅区', '石祥路196号夹板市场2楼A区全友家居', '', '', '0.40', '1000', '0', '150', '27', '1', '2018-01-20 17:01:14', '2018-01-20 17:01:14', '1', '551541', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('500', 'OB120388864982073', '王爱华', '18758051021', '浙江省', '杭州市', '拱墅区', '石祥路196号夹板市场2楼A区全友家居', '7', '539441036394', '0.40', '0', '0', '150', '27', '1', '2018-01-20 17:01:26', '2018-01-23 15:58:48', '2', '270653', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('501', 'OB120396770882075', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 17:14:37', '2018-01-20 17:14:37', '1', '390725', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('502', 'OB120396809266214', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 17:14:40', '2018-01-20 17:14:40', '1', '396747', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('503', 'OB120420634229629', '江慧', '15957206248', '浙江省', '杭州市', '余杭区', '闲林街道何母桥全丰苑90号', '7', '539441036463', '2.40', '0', '0', '2100', '33', '1', '2018-01-20 17:54:23', '2018-01-23 16:36:27', '1', '691269', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('504', 'OB120421435255024', '江慧', '15957206248', '浙江省', '杭州市', '余杭区', '闲林街道何母桥全丰苑90号', '', '', '0.40', '1000', '0', '150', '33', '1', '2018-01-20 17:55:43', '2018-01-20 17:55:43', '1', '180572', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('505', 'OB120427387122634', '江慧', '15957206248', '浙江省', '杭州市', '余杭区', '闲林街道何母桥全丰苑90号', '7', '539441036463', '0.00', '0', '0', '1274', '33', '0', '2018-01-20 18:05:38', '2018-01-23 16:36:10', '1', '767931', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('506', 'OB120446947353352', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-20 18:38:14', '2018-01-20 18:38:14', '1', '484802', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('507', 'OB120555795984753', '林虹', '15988136815', '浙江省', '杭州市', '拱墅区', '文一路34-1号', '7', '539441036370', '0.50', '0', '0', '1280', '33', '1', '2018-01-20 21:39:39', '2018-01-22 13:02:44', '1', '564500', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('508', 'OB121003465183995', '余明敏', '13806805139', '安徽省', '六安市', '霍邱县', '锦绣公馆16-2-2704', '7', '539441036506', '0.00', '0', '0', '1194', '27', '0', '2018-01-21 10:05:46', '2018-01-24 17:26:43', '1', '626586', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('509', 'OB121216132248203', '王文波', '13813479772', '江苏省', '徐州市', '云龙区', '青年路老公安局大院', '7', '539441036387', '0.00', '0', '0', '998', '26', '0', '2018-01-21 16:00:13', '2018-01-23 16:00:15', '1', '178530', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('510', 'OB122846040494428', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-22 09:30:04', '2018-01-22 09:30:04', '1', '394295', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('511', 'OB122857162316613', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '50.00', '0', '0', '0', '38', '2', '2018-01-22 09:48:36', '2018-01-22 09:48:36', '1', '360885', '11499', '1');
INSERT INTO `tb_goods_order` VALUES ('512', 'OB122857320581269', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '50.00', '0', '0', '0', '38', '2', '2018-01-22 09:48:52', '2018-01-22 09:48:52', '1', '117682', '11499', '1');
INSERT INTO `tb_goods_order` VALUES ('513', 'OB122858541181447', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '50.00', '0', '0', '0', '38', '2', '2018-01-22 09:50:54', '2018-01-22 09:50:54', '1', '118084', '11499', '1');
INSERT INTO `tb_goods_order` VALUES ('514', 'OB122858928538178', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '50.00', '0', '0', '0', '38', '2', '2018-01-22 09:51:32', '2018-01-22 09:51:32', '1', '426201', '11499', '1');
INSERT INTO `tb_goods_order` VALUES ('515', 'OB122859332031851', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '50.00', '0', '0', '0', '38', '2', '2018-01-22 09:52:13', '2018-01-22 09:52:13', '1', '318314', '11499', '1');
INSERT INTO `tb_goods_order` VALUES ('516', 'OB122859942998998', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '50.00', '0', '0', '0', '38', '2', '2018-01-22 09:53:14', '2018-01-22 09:53:14', '1', '629059', '11499', '1');
INSERT INTO `tb_goods_order` VALUES ('517', 'OB122862775448812', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-22 09:57:57', '2018-01-22 09:57:57', '1', '999309', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('518', 'OB122863641456790', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.20', '1000', '0', '168', '21', '1', '2018-01-22 09:59:24', '2018-01-22 09:59:24', '1', '461850', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('519', 'OB122865411934587', '曹荣美', '18357027157', '北京市', '市辖区', '西城区', 'MVP魔音突进突破母乳库提要求', '', '', '0.00', '0', '0', '1148', '21', '0', '2018-01-22 10:02:21', '2018-01-22 10:02:21', '2', '834793', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('520', 'OB122881085543903', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-22 10:28:28', '2018-01-22 10:28:28', '1', '119545', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('521', 'OB122881122726091', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-22 10:28:32', '2018-01-22 10:28:32', '1', '846897', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('522', 'OB122881172580127', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-22 10:28:37', '2018-01-22 10:28:37', '1', '261750', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('523', 'OB122902103015290', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.20', '1000', '0', '168', '21', '1', '2018-01-22 11:03:30', '2018-01-22 11:03:30', '1', '597160', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('524', 'OB122902385626756', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-22 11:03:58', '2018-01-22 11:03:58', '1', '739019', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('525', 'OB122902410708757', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-22 11:04:01', '2018-01-22 11:04:01', '1', '697430', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('526', 'OB122903111297343', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-22 11:05:11', '2018-01-22 11:05:11', '1', '991730', '2299', '1');
INSERT INTO `tb_goods_order` VALUES ('527', 'OB122903163124948', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-22 11:05:16', '2018-01-22 11:05:16', '1', '730920', '2299', '1');
INSERT INTO `tb_goods_order` VALUES ('528', 'OB122903695536362', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-22 11:06:09', '2018-01-22 11:06:09', '1', '832851', '2299', '1');
INSERT INTO `tb_goods_order` VALUES ('529', 'OB122008992558792', '赵艳', '13989499545', '浙江省', '杭州市', '江干区', '龙湖名景台8幢', '7', '539441036449', '0.00', '0', '0', '460', '21', '0', '2018-01-22 14:01:39', '2018-01-23 16:14:15', '1', '207658', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('530', 'OB122013258504542', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '0.02', '1000', '0', '108', '21', '1', '2018-01-22 14:08:45', '2018-01-22 14:08:45', '1', '955726', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('531', 'OB122013337354440', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '0.02', '0', '0', '108', '21', '1', '2018-01-22 14:08:53', '2018-01-22 14:08:53', '2', '756706', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('532', 'OB122015382451601', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '1', '测试', '0.05', '0', '0', '58', '21', '1', '2018-01-22 14:12:18', '2018-01-31 10:04:47', '2', '307902', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('533', 'OB123847077667064', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-23 13:18:27', '2018-01-23 13:18:27', '1', '665882', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('534', 'OB123847113860317', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-23 13:18:31', '2018-01-23 13:18:31', '1', '272715', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('535', 'OB123847158176119', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-23 13:18:35', '2018-01-23 13:18:35', '1', '986310', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('536', 'OB123909302660161', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.20', '1000', '0', '168', '28', '1', '2018-01-23 15:02:10', '2018-01-23 15:02:10', '1', '322144', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('537', 'OB123967997797447', '蒋红平', '15957155885', '浙江省', '杭州市', '余杭区', '五常街道文一社区西溪北苑16幢2单元702室', '7', '539441036488', '3.00', '0', '0', '500', '34', '1', '2018-01-23 16:39:59', '2018-01-25 15:19:58', '1', '773528', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('538', 'OB123977339751143', '李秋艳', '18626879467', '浙江省', '杭州市', '余杭区', '乔司街道金地艺境一期4幢2单元301室', '7', '539441036518', '0.00', '0', '0', '888', '27', '0', '2018-01-23 16:55:34', '2018-01-25 15:19:04', '1', '806727', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('539', 'OB124577318883326', '袁莹莹', '15757175225', '浙江省', '杭州市', '江干区', '丁桥镇同协雅苑9幢1单元1602', '7', '539441036633', '0.00', '0', '0', '500', '27', '0', '2018-01-24 09:35:31', '2018-01-31 15:48:11', '1', '340571', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('540', 'OB124582222893697', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-24 09:43:42', '2018-01-24 09:43:42', '1', '953428', '2599', '1');
INSERT INTO `tb_goods_order` VALUES ('541', 'OB124582294436655', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-24 09:43:49', '2018-01-24 09:43:49', '1', '789292', '2599', '1');
INSERT INTO `tb_goods_order` VALUES ('542', 'OB124582350101548', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-24 09:43:55', '2018-01-24 09:43:55', '1', '492071', '2599', '1');
INSERT INTO `tb_goods_order` VALUES ('543', 'OB124924864830827', '江慧', '15957206248', '浙江省', '杭州市', '余杭区', '闲林街道何母桥全丰苑90号', '', '', '0.00', '0', '0', '2284', '33', '0', '2018-01-24 19:14:46', '2018-01-24 19:14:46', '1', '694294', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('544', 'OB124053665113767', '江慧', '15957206248', '浙江省', '杭州市', '余杭区', '闲林街道何母桥全丰苑90号', '7', '539441036571', '0.00', '0', '0', '1703', '33', '0', '2018-01-24 22:49:26', '2018-01-26 15:02:05', '1', '247148', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('545', 'OB125460559702470', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '7', '全友兑换', '2.50', '0', '0', '1400', '27', '1', '2018-01-25 10:07:35', '2018-01-25 10:17:33', '1', '547490', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('546', 'OB125469329748135', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '7', '全友兑换年会', '0.50', '0', '0', '398', '27', '1', '2018-01-25 10:22:12', '2018-01-25 10:26:18', '1', '105656', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('547', 'OB125470001015517', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '1.25', '1000', '0', '298', '27', '1', '2018-01-25 10:23:20', '2018-01-25 10:23:20', '1', '524765', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('548', 'OB125470062228250', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '1.25', '1000', '0', '298', '27', '1', '2018-01-25 10:23:26', '2018-01-25 10:23:26', '1', '498537', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('549', 'OB125470102323153', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '1.25', '1000', '0', '298', '27', '1', '2018-01-25 10:23:30', '2018-01-25 10:23:30', '1', '188407', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('550', 'OB125470111588587', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '1.25', '1000', '0', '298', '27', '1', '2018-01-25 10:23:31', '2018-01-25 10:23:31', '1', '268240', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('551', 'OB125470120119487', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '1.25', '1000', '0', '298', '27', '1', '2018-01-25 10:23:32', '2018-01-25 10:23:32', '1', '192342', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('552', 'OB125470143279524', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '1.25', '1000', '0', '298', '27', '1', '2018-01-25 10:23:34', '2018-01-25 10:23:34', '1', '476276', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('553', 'OB125473462530322', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '1.25', '1000', '0', '298', '27', '1', '2018-01-25 10:29:06', '2018-01-25 10:29:06', '1', '902289', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('554', 'OB125473514573042', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '1.25', '1000', '0', '298', '27', '1', '2018-01-25 10:29:11', '2018-01-25 10:29:11', '1', '970728', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('555', 'OB125473527280404', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '1.25', '1000', '0', '298', '27', '1', '2018-01-25 10:29:12', '2018-01-25 10:29:12', '1', '336994', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('556', 'OB125473532227143', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '1.25', '1000', '0', '298', '27', '1', '2018-01-25 10:29:13', '2018-01-25 10:29:13', '1', '859647', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('557', 'OB125473534088843', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '1.25', '1000', '0', '298', '27', '1', '2018-01-25 10:29:13', '2018-01-25 10:29:13', '1', '685229', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('558', 'OB125473535581267', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '1.25', '1000', '0', '298', '27', '1', '2018-01-25 10:29:13', '2018-01-25 10:29:13', '1', '248579', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('559', 'OB125473536768949', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '1.25', '1000', '0', '298', '27', '1', '2018-01-25 10:29:13', '2018-01-25 10:29:13', '1', '594815', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('560', 'OB125473542911765', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '1.25', '1000', '0', '298', '27', '1', '2018-01-25 10:29:14', '2018-01-25 10:29:14', '1', '542702', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('561', 'OB125473544313411', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '1.25', '1000', '0', '298', '27', '1', '2018-01-25 10:29:14', '2018-01-25 10:29:14', '1', '766149', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('562', 'OB125473545863776', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '1.25', '1000', '0', '298', '27', '1', '2018-01-25 10:29:14', '2018-01-25 10:29:14', '1', '655084', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('563', 'OB125473547528831', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '1.25', '1000', '0', '298', '27', '1', '2018-01-25 10:29:14', '2018-01-25 10:29:14', '1', '717038', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('564', 'OB125473549255858', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '1.25', '1000', '0', '298', '27', '1', '2018-01-25 10:29:14', '2018-01-25 10:29:14', '1', '360004', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('565', 'OB125474607456078', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '1.25', '1000', '0', '298', '27', '1', '2018-01-25 10:31:00', '2018-01-25 10:31:00', '1', '527353', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('566', 'OB125474701050748', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '1.25', '1000', '0', '298', '27', '1', '2018-01-25 10:31:10', '2018-01-25 10:31:10', '1', '536726', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('567', 'OB125474720271241', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '1.25', '1000', '0', '298', '27', '1', '2018-01-25 10:31:12', '2018-01-25 10:31:12', '1', '195950', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('568', 'OB125474868440496', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.20', '1000', '0', '168', '21', '1', '2018-01-25 10:31:26', '2018-01-25 10:31:26', '1', '130497', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('569', 'OB125475058399484', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.20', '1000', '0', '168', '21', '1', '2018-01-25 10:31:45', '2018-01-25 10:31:45', '1', '596001', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('570', 'OB125475313215990', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '', '', '1.25', '1000', '0', '298', '27', '1', '2018-01-25 10:32:11', '2018-01-25 10:32:11', '1', '365284', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('571', 'OB125475465223888', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.20', '1000', '0', '168', '21', '1', '2018-01-25 10:32:26', '2018-01-25 10:32:26', '1', '746518', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('572', 'OB125476255411893', '陆军', '15157195711', '浙江省', '杭州市', '拱墅区', '夹板市场二楼', '7', '全友年会订单', '1.25', '0', '0', '298', '27', '1', '2018-01-25 10:33:45', '2018-01-25 10:34:45', '2', '679492', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('573', 'OB125485941890819', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '15.00', '0', '0', '0', '38', '2', '2018-01-25 10:49:54', '2018-01-25 10:49:54', '1', '799491', '799', '1');
INSERT INTO `tb_goods_order` VALUES ('574', 'OB125485962904620', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '15.00', '0', '0', '0', '38', '2', '2018-01-25 10:49:56', '2018-01-25 10:49:56', '1', '721940', '799', '1');
INSERT INTO `tb_goods_order` VALUES ('575', 'OB125620762119115', '赵海霞', '18858283695', '浙江省', '杭州市', '拱墅区', '石祥路196好，夹板市场全友家居', '', '', '0.00', '0', '0', '500', '21', '0', '2018-01-25 14:34:36', '2018-01-25 14:34:36', '1', '932252', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('576', 'OB125621432512532', '赵海霞', '18858283695', '浙江省', '杭州市', '拱墅区', '石祥路196好，夹板市场全友家居', '7', '539441036557', '1.00', '0', '0', '500', '27', '1', '2018-01-25 14:35:43', '2018-01-26 13:51:33', '1', '644269', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('577', 'OB126578235753610', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-26 17:10:23', '2018-01-26 17:10:23', '1', '765140', '2599', '1');
INSERT INTO `tb_goods_order` VALUES ('578', 'OB126578273591349', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-26 17:10:27', '2018-01-26 17:10:27', '1', '297621', '2599', '1');
INSERT INTO `tb_goods_order` VALUES ('579', 'OB126799172548722', '郑文祥', '18767137680', '浙江省', '杭州市', '滨江区', '长河路和瑞科技园S5东二楼', '', '', '0.50', '1000', '0', '280', '32', '1', '2018-01-26 23:18:37', '2018-01-26 23:18:37', '1', '732964', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('580', 'OB126799365396690', '郑文祥', '18767137680', '浙江省', '杭州市', '滨江区', '长河路和瑞科技园S5东二楼', '', '', '0.50', '1000', '0', '280', '32', '1', '2018-01-26 23:18:56', '2018-01-26 23:18:56', '1', '112865', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('581', 'OB126799425572863', '郑文祥', '18767137680', '浙江省', '杭州市', '滨江区', '长河路和瑞科技园S5东二楼', '', '', '0.50', '1000', '0', '280', '32', '1', '2018-01-26 23:19:02', '2018-01-26 23:19:02', '1', '492796', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('582', 'OB126799534293135', '郑文祥', '18767137680', '浙江省', '杭州市', '滨江区', '长河路和瑞科技园S5东二楼', '', '', '0.50', '1000', '0', '280', '32', '1', '2018-01-26 23:19:13', '2018-01-26 23:19:13', '1', '232426', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('583', 'OB126799610164456', '郑文祥', '18767137680', '浙江省', '杭州市', '滨江区', '长河路和瑞科技园S5东二楼', '', '', '0.50', '1000', '0', '280', '32', '1', '2018-01-26 23:19:21', '2018-01-26 23:19:21', '1', '356188', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('584', 'OB127187818477359', '孙先生', '15905819206', '浙江省', '杭州市', '余杭区', '西溪花城27幢2单元201', '7', '539441036697', '0.00', '0', '0', '2496', '33', '0', '2018-01-27 10:06:21', '2018-01-31 16:57:05', '1', '950507', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('585', 'OB127218220768683', '吴岳', '15858127939', '浙江省', '杭州市', '余杭区', '星桥街道藕花州西段456号', '7', '手链无货，通知客户重新兑换，由于不能取消订单先点发货，后台返还客户积分', '0.00', '0', '0', '1534', '21', '0', '2018-01-27 10:57:02', '2018-01-30 13:51:34', '1', '858170', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('586', 'OB127549948525716', '顾希俊', '15868144349', '浙江省', '杭州市', '余杭区', '高教路华东园小区5-2-602', '7', '539441036658', '0.00', '0', '0', '995', '33', '0', '2018-01-27 20:09:54', '2018-01-31 16:21:45', '1', '122678', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('587', 'OB129132052792158', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-29 16:06:45', '2018-01-29 16:06:45', '1', '931393', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('588', 'OB129133615976229', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.00', '800', '0', '499', '29', '1', '2018-01-29 16:09:21', '2018-01-29 16:09:21', '1', '387147', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('589', 'OB129133667392569', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.00', '800', '0', '499', '29', '1', '2018-01-29 16:09:26', '2018-01-29 16:09:26', '1', '217153', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('590', 'OB129133691929691', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.00', '800', '0', '499', '29', '1', '2018-01-29 16:09:29', '2018-01-29 16:09:29', '1', '592682', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('591', 'OB129133710076448', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.00', '800', '0', '499', '29', '1', '2018-01-29 16:09:31', '2018-01-29 16:09:31', '1', '339072', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('592', 'OB129133729077807', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.00', '800', '0', '499', '29', '1', '2018-01-29 16:09:32', '2018-01-29 16:09:32', '1', '610090', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('593', 'OB129133762318962', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.00', '800', '0', '499', '29', '1', '2018-01-29 16:09:36', '2018-01-29 16:09:36', '1', '444448', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('594', 'OB129133903925434', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.00', '800', '0', '499', '29', '1', '2018-01-29 16:09:50', '2018-01-29 16:09:50', '1', '823235', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('595', 'OB129133993027390', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.00', '800', '0', '499', '29', '1', '2018-01-29 16:09:59', '2018-01-29 16:09:59', '1', '451152', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('596', 'OB129134084204239', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.00', '800', '0', '499', '29', '1', '2018-01-29 16:10:08', '2018-01-29 16:10:08', '1', '206879', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('597', 'OB129134104125765', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.00', '800', '0', '499', '29', '1', '2018-01-29 16:10:10', '2018-01-29 16:10:10', '1', '434202', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('598', 'OB129134140575825', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.00', '800', '0', '499', '29', '1', '2018-01-29 16:10:14', '2018-01-29 16:10:14', '1', '223074', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('599', 'OB129134388111860', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.00', '800', '0', '499', '29', '1', '2018-01-29 16:10:38', '2018-01-29 16:10:38', '1', '229558', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('600', 'OB129134513055519', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.00', '800', '0', '499', '29', '1', '2018-01-29 16:10:51', '2018-01-29 16:10:51', '1', '723628', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('601', 'OB129134544250245', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.00', '800', '0', '499', '29', '1', '2018-01-29 16:10:54', '2018-01-29 16:10:54', '1', '484556', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('602', 'OB129134589588595', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.00', '800', '0', '499', '29', '1', '2018-01-29 16:10:58', '2018-01-29 16:10:58', '1', '169737', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('603', 'OB129134741621120', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 16:11:14', '2018-01-29 16:11:14', '1', '672117', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('604', 'OB129135100425891', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 16:11:50', '2018-01-29 16:11:50', '1', '290402', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('605', 'OB129137022870577', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 16:15:02', '2018-01-29 16:15:02', '1', '627032', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('606', 'OB129137525478837', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 16:15:52', '2018-01-29 16:15:52', '1', '677470', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('607', 'OB129137607271706', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 16:16:00', '2018-01-29 16:16:00', '1', '240923', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('608', 'OB129137666563681', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 16:16:06', '2018-01-29 16:16:06', '1', '202978', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('609', 'OB129138923130905', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 16:18:12', '2018-01-29 16:18:12', '1', '708921', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('610', 'OB129138976141110', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 16:18:17', '2018-01-29 16:18:17', '1', '437466', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('611', 'OB129140121091309', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 16:20:12', '2018-01-29 16:20:12', '1', '550391', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('612', 'OB129140167174891', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 16:20:16', '2018-01-29 16:20:16', '1', '405657', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('613', 'OB129140623641487', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 16:21:02', '2018-01-29 16:21:02', '1', '431244', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('614', 'OB129142443042465', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 16:24:04', '2018-01-29 16:24:04', '1', '177356', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('615', 'OB129144741397869', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 16:27:54', '2018-01-29 16:27:54', '1', '412130', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('616', 'OB129145954013788', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 16:29:55', '2018-01-29 16:29:55', '1', '127589', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('617', 'OB129146015968300', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 16:30:01', '2018-01-29 16:30:01', '1', '621198', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('618', 'OB129147810661443', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 16:33:01', '2018-01-29 16:33:01', '1', '583932', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('619', 'OB129147937859472', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 16:33:13', '2018-01-29 16:33:13', '1', '664689', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('620', 'OB129148627851171', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 16:34:22', '2018-01-29 16:34:22', '1', '782699', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('621', 'OB129148654477959', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 16:34:25', '2018-01-29 16:34:25', '1', '547607', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('622', 'OB129150945283730', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.00', '800', '0', '258', '21', '0', '2018-01-29 16:38:14', '2018-01-29 16:38:14', '1', '143611', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('623', 'OB129156107238808', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '0', '0', '108', '21', '1', '2018-01-29 16:46:50', '2018-01-29 16:46:50', '2', '950666', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('624', 'OB129171808111937', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '1', '测试', '0.00', '0', '0', '72', '28', '0', '2018-01-29 17:13:00', '2018-01-31 10:04:37', '2', '726596', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('625', 'OB129185103931797', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '0.20', '800', '0', '168', '21', '1', '2018-01-29 17:35:10', '2018-01-29 17:35:10', '1', '331626', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('626', 'OB129185135488144', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '0.20', '800', '0', '168', '21', '1', '2018-01-29 17:35:13', '2018-01-29 17:35:13', '1', '568024', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('627', 'OB129187315669001', '齐先生', '13099188881', '甘肃省', '兰州市', '城关区', '南滨河路', '', '', '0.50', '800', '0', '125', '21', '1', '2018-01-29 17:38:51', '2018-01-29 17:38:51', '1', '258097', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('628', 'OB129187319681697', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 17:38:51', '2018-01-29 17:38:51', '1', '845356', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('629', 'OB129187442900678', '齐先生', '13099188881', '甘肃省', '兰州市', '城关区', '南滨河路', '', '', '0.50', '800', '0', '125', '21', '1', '2018-01-29 17:39:04', '2018-01-29 17:39:04', '1', '621692', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('630', 'OB129189148963434', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '50.00', '0', '0', '0', '38', '2', '2018-01-29 17:41:54', '2018-01-29 17:41:54', '1', '985630', '7099', '1');
INSERT INTO `tb_goods_order` VALUES ('631', 'OB129189675603463', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '50.00', '0', '0', '0', '38', '2', '2018-01-29 17:42:47', '2018-01-29 17:42:47', '1', '769588', '7099', '1');
INSERT INTO `tb_goods_order` VALUES ('632', 'OB129189840806750', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '50.00', '0', '0', '0', '38', '2', '2018-01-29 17:43:04', '2018-01-29 17:43:04', '1', '981864', '7099', '1');
INSERT INTO `tb_goods_order` VALUES ('633', 'OB129190141254258', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '50.00', '0', '0', '0', '38', '2', '2018-01-29 17:43:34', '2018-01-29 17:43:34', '1', '325569', '7099', '1');
INSERT INTO `tb_goods_order` VALUES ('634', 'OB129190471939668', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-29 17:44:07', '2018-01-29 17:44:07', '1', '831911', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('635', 'OB129190882490408', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-29 17:44:48', '2018-01-29 17:44:48', '1', '856633', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('636', 'OB129193545250013', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 17:49:14', '2018-01-29 17:49:14', '1', '241669', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('637', 'OB129193671443977', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 17:49:27', '2018-01-29 17:49:27', '1', '139490', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('638', 'OB129193807048856', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 17:49:40', '2018-01-29 17:49:40', '1', '840273', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('639', 'OB129194805897552', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-29 17:51:20', '2018-01-29 17:51:20', '1', '449793', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('640', 'OB129195938727180', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-29 17:53:13', '2018-01-29 17:53:13', '1', '312548', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('641', 'OB129196102038742', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 17:53:30', '2018-01-29 17:53:30', '1', '135609', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('642', 'OB129196234668476', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 17:53:43', '2018-01-29 17:53:43', '1', '252831', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('643', 'OB129203946513577', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-29 18:06:34', '2018-01-29 18:06:34', '1', '142702', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('644', 'OB129203960544854', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-29 18:06:36', '2018-01-29 18:06:36', '1', '288924', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('645', 'OB129203989752512', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-29 18:06:38', '2018-01-29 18:06:38', '1', '614605', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('646', 'OB129205803058326', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-29 18:09:40', '2018-01-29 18:09:40', '1', '986837', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('647', 'OB129206106637313', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-29 18:10:10', '2018-01-29 18:10:10', '1', '149043', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('648', 'OB129208540307884', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-29 18:14:14', '2018-01-29 18:14:14', '1', '850320', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('649', 'OB129208982712090', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-29 18:14:58', '2018-01-29 18:14:58', '1', '680881', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('650', 'OB129209201594231', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-29 18:15:20', '2018-01-29 18:15:20', '1', '984547', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('651', 'OB129209267849601', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-29 18:15:26', '2018-01-29 18:15:26', '1', '540659', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('652', 'OB129209593421603', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-29 18:15:59', '2018-01-29 18:15:59', '1', '345920', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('653', 'OB129209891690458', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 18:16:29', '2018-01-29 18:16:29', '1', '514732', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('654', 'OB129210400691719', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-29 18:17:20', '2018-01-29 18:17:20', '1', '195797', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('655', 'OB129210933107323', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-29 18:18:13', '2018-01-29 18:18:13', '1', '314586', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('656', 'OB129211956922589', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-29 18:19:55', '2018-01-29 18:19:55', '1', '598527', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('657', 'OB129212399804482', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-29 18:20:39', '2018-01-29 18:20:39', '1', '151124', '2599', '1');
INSERT INTO `tb_goods_order` VALUES ('658', 'OB130749308649953', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-30 09:15:30', '2018-01-30 09:15:30', '1', '417299', '2599', '1');
INSERT INTO `tb_goods_order` VALUES ('659', 'OB130749344142853', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-30 09:15:34', '2018-01-30 09:15:34', '1', '818921', '2599', '1');
INSERT INTO `tb_goods_order` VALUES ('660', 'OB130750905538143', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-30 09:18:10', '2018-01-30 09:18:10', '1', '934054', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('661', 'OB130784438913451', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-30 10:14:03', '2018-01-30 10:14:03', '1', '206782', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('662', 'OB130784468180860', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-30 10:14:06', '2018-01-30 10:14:06', '1', '542345', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('663', 'OB130785302894149', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '99999999.99', '600', '0', '0', '38', '2', '2018-01-30 10:15:30', '2018-01-30 10:15:30', '1', '755912', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('664', 'OB130786335171911', '123', '18857157068', '浙江省', '杭州市', '滨江区', '123', '', '', '99999999.99', '1', '0', '0', '38', '2', '2018-01-30 10:17:13', '2018-01-30 10:17:13', '1', '184030', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('665', 'OB130786388613533', '123', '18857157068', '浙江省', '杭州市', '滨江区', '123', '1', '测试', '99999999.99', '1', '0', '0', '38', '2', '2018-01-30 10:17:18', '2018-01-31 10:04:29', '1', '588673', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('666', 'OB130791796939390', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-30 10:26:19', '2018-01-30 10:26:19', '1', '362746', '2599', '1');
INSERT INTO `tb_goods_order` VALUES ('667', 'OB130791993930771', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '1', '0', '0', '38', '2', '2018-01-30 10:26:39', '2018-01-30 10:26:39', '1', '421751', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('668', 'OB130792305904394', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '1', '0', '0', '38', '2', '2018-01-30 10:27:10', '2018-01-30 10:27:10', '1', '912155', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('669', 'OB130792704237826', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '1', '0', '0', '38', '2', '2018-01-30 10:27:50', '2018-01-30 10:27:50', '1', '208149', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('670', 'OB130793743828058', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '50.00', '0', '0', '0', '38', '2', '2018-01-30 10:29:34', '2018-01-30 10:29:34', '1', '556607', '2599', '1');
INSERT INTO `tb_goods_order` VALUES ('671', 'OB130794025453164', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '30.00', '0', '0', '0', '38', '2', '2018-01-30 10:30:02', '2018-01-30 10:30:02', '1', '926092', '399', '1');
INSERT INTO `tb_goods_order` VALUES ('672', 'OB130796708863317', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '1', '0', '0', '38', '2', '2018-01-30 10:34:30', '2018-01-30 10:34:30', '1', '480090', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('673', 'OB130827300785896', '裘百灵', '13957168980', '浙江省', '杭州市', '江干区', '四季青街道', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-30 11:25:30', '2018-01-30 11:25:30', '1', '703201', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('674', 'OB130827438871295', '裘百灵', '13957168980', '浙江省', '杭州市', '江干区', '四季青街道', '', '', '0.02', '800', '0', '108', '21', '1', '2018-01-30 11:25:43', '2018-01-30 11:25:43', '1', '471478', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('675', 'OB130919591026409', '吴岳', '15858127939', '浙江省', '杭州市', '余杭区', '星桥街道藕花州西段456号', '', '', '0.00', '0', '0', '2180', '33', '0', '2018-01-30 13:59:19', '2018-01-30 13:59:19', '1', '643201', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('676', 'OB130922037824308', '吴岳', '15858127939', '浙江省', '杭州市', '余杭区', '星桥街道藕花州西段456号', '', '', '0.00', '0', '0', '2072', '33', '0', '2018-01-30 14:03:23', '2018-01-30 14:03:23', '1', '547731', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('677', 'OB130922389000436', '吴岳', '15858127939', '浙江省', '杭州市', '余杭区', '星桥街道藕花州西段456号', '', '', '2.50', '0', '0', '1630', '33', '1', '2018-01-30 14:03:58', '2018-01-30 14:03:58', '1', '216172', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('678', 'OB130923403840071', '吴岳', '15858127939', '浙江省', '杭州市', '余杭区', '星桥街道藕花州西段456号', '', '', '0.00', '0', '0', '567', '33', '0', '2018-01-30 14:05:40', '2018-01-30 14:05:40', '1', '773487', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('679', 'OB130923899024027', '吴岳', '15858127939', '浙江省', '杭州市', '余杭区', '星桥街道藕花州西段456号', '', '', '0.00', '0', '0', '2013', '33', '0', '2018-01-30 14:06:29', '2018-01-30 14:06:29', '1', '834648', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('680', 'OB130924476721157', '吴岳', '15858127939', '浙江省', '杭州市', '余杭区', '星桥街道藕花州西段456号', '', '', '0.00', '0', '0', '1984', '33', '0', '2018-01-30 14:07:27', '2018-01-30 14:07:27', '1', '653015', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('681', 'OB130924691890717', '吴岳', '15858127939', '浙江省', '杭州市', '余杭区', '星桥街道藕花州西段456号', '2', '100798200723', '2.50', '0', '0', '1630', '33', '1', '2018-01-30 14:07:49', '2018-02-01 08:57:45', '1', '636121', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('682', 'OB130925750442098', '吴岳', '15858127939', '浙江省', '杭州市', '余杭区', '星桥街道藕花州西段456号', '', '', '0.00', '0', '0', '677', '33', '0', '2018-01-30 14:09:35', '2018-01-30 14:09:35', '1', '190007', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('683', 'OB130943742431457', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '15.00', '0', '0', '72', '28', '1', '2018-01-30 14:39:34', '2018-01-30 14:39:34', '2', '210361', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('684', 'OB130943743694170', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '1', '测试', '15.00', '0', '0', '72', '28', '1', '2018-01-30 14:39:34', '2018-01-31 10:04:18', '2', '163463', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('685', 'OB130947628070034', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '25.00', '0', '0', '0', '38', '2', '2018-01-30 14:46:02', '2018-01-30 14:46:02', '1', '856443', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('686', 'OB130974456464087', '钟先生', '15988817020', '浙江省', '杭州市', '萧山区', '城厢街道湘湖美地19幢1单元501', '', '', '0.00', '800', '0', '305', '27', '0', '2018-01-30 15:30:45', '2018-01-30 15:30:45', '1', '774250', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('687', 'OB130230039201263', '王丽娜', '13092311866', '江苏省', '徐州市', '云龙区', '宣武路1-1号海关宿舍楼5单元601室', '', '', '0.00', '0', '0', '980', '26', '0', '2018-01-30 22:36:43', '2018-01-30 22:36:43', '1', '177612', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('688', 'OB130232532303589', '王丽娜', '13092311866', '江苏省', '徐州市', '云龙区', '宣武路1-1号海关宿舍楼5单元601室', '', '', '0.00', '0', '0', '980', '26', '0', '2018-01-30 22:40:53', '2018-01-30 22:40:53', '1', '540473', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('689', 'OB130237108496777', '王丽娜', '13092311866', '江苏省', '徐州市', '云龙区', '宣武路1-1号海关宿舍楼5单元601室', '7', '539441036710', '0.00', '0', '0', '980', '26', '0', '2018-01-30 22:48:30', '2018-01-31 17:10:31', '1', '671029', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('690', 'OB131613988533335', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.50', '800', '0', '89', '29', '1', '2018-01-31 09:16:38', '2018-01-31 09:16:38', '1', '705119', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('691', 'OB131614031312083', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.50', '800', '0', '89', '29', '1', '2018-01-31 09:16:43', '2018-01-31 09:16:43', '1', '421488', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('692', 'OB131614905783627', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '0.40', '0', '0', '399', '21', '1', '2018-01-31 09:18:10', '2018-01-31 09:18:10', '1', '854922', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('693', 'OB131616360363895', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '0.40', '0', '0', '399', '21', '1', '2018-01-31 09:20:36', '2018-01-31 09:20:36', '1', '165687', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('694', 'OB131786313303338', '常智伟', '15252090812', '江苏省', '徐州市', '鼓楼区', '丰财街道 长征路 三角线米线对面羊肉馆', '7', '539441036741', '0.50', '0', '0', '359', '26', '1', '2018-01-31 14:03:51', '2018-02-01 17:10:28', '1', '448552', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('695', 'OB131787739168877', '常智伟', '15252090812', '江苏省', '徐州市', '鼓楼区', '丰财街道 长征路 三角线米线对面羊肉馆', '', '', '1.50', '800', '0', '128', '26', '1', '2018-01-31 14:06:13', '2018-01-31 14:06:13', '1', '367097', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('696', 'OB131787806591955', '常智伟', '15252090812', '江苏省', '徐州市', '鼓楼区', '丰财街道 长征路 三角线米线对面羊肉馆', '', '', '1.50', '800', '0', '128', '26', '1', '2018-01-31 14:06:20', '2018-01-31 14:06:20', '1', '979284', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('697', 'OB131789031012931', '常智伟', '15252090812', '江苏省', '徐州市', '鼓楼区', '丰财街道 长征路 三角线米线对面羊肉馆', '', '', '1.00', '0', '0', '500', '26', '1', '2018-01-31 14:08:23', '2018-01-31 14:08:23', '1', '621983', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('698', 'OB131804914738566', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '1', 'test', '99999999.99', '1', '0', '0', '38', '2', '2018-01-31 14:34:51', '2018-01-31 14:37:03', '1', '217902', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('699', 'OB131844388993998', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '1', '测试', '99999999.99', '1', '0', '0', '38', '2', '2018-01-31 15:40:38', '2018-01-31 15:48:59', '1', '565056', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('700', 'OB131846401196450', '常智伟', '15252090812', '江苏省', '徐州市', '鼓楼区', '丰财街道 长征路 三角线米线对面羊肉馆', '7', '539441036734', '1.00', '0', '0', '500', '26', '1', '2018-01-31 15:44:00', '2018-02-01 17:10:13', '1', '120889', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('701', 'OB131902222780024', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '30.00', '0', '0', '0', '38', '2', '2018-01-31 17:17:02', '2018-01-31 17:17:02', '1', '484197', '399', '1');
INSERT INTO `tb_goods_order` VALUES ('702', 'OB131904044446023', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '40.00', '0', '0', '0', '38', '2', '2018-01-31 17:20:04', '2018-01-31 17:20:04', '1', '541963', '8899', '1');
INSERT INTO `tb_goods_order` VALUES ('703', 'OB131905088466571', '金慧阳', '18867916698', '浙江省', '杭州市', '拱墅区', '湖州街168号美好国际大厦12楼', '', '', '0.00', '0', '0', '458', '21', '0', '2018-01-31 17:21:48', '2018-01-31 17:21:48', '1', '277977', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('704', 'OB131905635022051', '金慧阳', '18867916698', '浙江省', '杭州市', '拱墅区', '湖州街168号美好国际大厦12楼', '7', '539441036759', '5.00', '0', '0', '458', '34', '1', '2018-01-31 17:22:43', '2018-02-01 17:09:07', '1', '684231', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('705', 'OB201487214966311', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '30.00', '0', '0', '0', '38', '2', '2018-02-01 09:32:01', '2018-02-01 09:32:01', '1', '957558', '8399', '1');
INSERT INTO `tb_goods_order` VALUES ('706', 'OB201488497566172', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '50.00', '0', '0', '0', '38', '2', '2018-02-01 09:34:09', '2018-02-01 09:34:09', '1', '687483', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('707', 'OB201520638317312', '吴岳', '15858127939', '浙江省', '杭州市', '余杭区', '星桥街道藕花州西段456号', '', '', '0.00', '0', '0', '802', '33', '0', '2018-02-01 10:27:43', '2018-02-01 10:27:43', '1', '427567', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('708', 'OB201590590969215', '谢彤', '13605807009', '浙江省', '杭州市', '萧山区', '闻堰镇湘湖路3001号湘湖壹号御湖苑1-1号', '7', '539441036766', '3.00', '0', '0', '500', '34', '1', '2018-02-01 12:24:19', '2018-02-02 12:57:44', '1', '434227', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('709', 'OB201758786696873', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '1', '0', '0', '38', '2', '2018-02-01 17:04:38', '2018-02-01 17:04:38', '1', '273731', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('710', 'OB201758871664526', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '1', '0', '0', '38', '2', '2018-02-01 17:04:47', '2018-02-01 17:04:47', '1', '390380', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('711', 'OB201759904802025', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '1', '测试', '99999999.99', '1', '0', '0', '38', '2', '2018-02-01 17:06:30', '2018-02-01 17:09:39', '1', '573183', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('712', 'OB202352142164262', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '99999999.99', '1', '0', '0', '38', '2', '2018-02-02 09:33:34', '2018-02-02 09:33:34', '1', '605528', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('713', 'OB202352182091592', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '7', '123456789', '99999999.99', '1', '0', '0', '38', '2', '2018-02-02 09:33:38', '2018-02-02 16:32:46', '1', '437892', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('714', 'OB202352323424962', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '99999999.99', '1', '0', '0', '38', '2', '2018-02-02 09:33:52', '2018-02-02 09:33:52', '1', '761288', '1', '1');
INSERT INTO `tb_goods_order` VALUES ('715', 'OB202434715268677', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.02', '800', '0', '108', '21', '1', '2018-02-02 11:51:11', '2018-02-02 11:51:11', '1', '203779', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('716', 'OB202434830839622', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.02', '800', '0', '108', '21', '1', '2018-02-02 11:51:23', '2018-02-02 11:51:23', '1', '486011', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('717', 'OB202436572334748', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.02', '800', '0', '108', '21', '1', '2018-02-02 11:54:17', '2018-02-02 11:54:17', '1', '702038', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('718', 'OB202506989117033', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '2', '6+', '5.00', '1', '0', '0', '38', '2', '2018-02-02 13:51:38', '2018-02-02 13:52:10', '1', '836695', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('719', 'OB202508688028739', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '5.00', '1', '0', '0', '38', '2', '2018-02-02 13:54:28', '2018-02-02 13:54:28', '1', '882657', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('720', 'OB202565039584743', '白天驰', '15168267026', '浙江省', '杭州市', '滨江区', '西兴街道春波南苑12幢1单元1001室', '', '', '1.00', '0', '0', '0', '38', '2', '2018-02-02 15:28:23', '2018-02-02 15:28:23', '2', '485901', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('721', 'OB202565395354689', '白天驰', '15168267026', '浙江省', '杭州市', '滨江区', '西兴街道春波南苑12幢1单元1001室', '2', '8888888', '1.00', '1', '0', '0', '38', '2', '2018-02-02 15:28:59', '2018-02-02 15:32:21', '1', '580411', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('722', 'OB202569536438637', '白天驰', '15168267026', '浙江省', '杭州市', '滨江区', '西兴街道春波南苑12幢1单元1001室', '', '', '0.00', '0', '0', '348', '21', '0', '2018-02-02 15:35:53', '2018-02-02 15:35:53', '1', '371949', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('723', 'OB202569919100788', '白天驰', '15168267026', '浙江省', '杭州市', '滨江区', '西兴街道春波南苑12幢1单元1001室', '', '', '0.00', '0', '0', '418', '21', '0', '2018-02-02 15:36:31', '2018-02-02 15:36:31', '1', '180057', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('724', 'OB202571942882235', '白天驰', '15168267026', '浙江省', '杭州市', '滨江区', '西兴街道春波南苑12幢1单元1001室', '7', '123456789', '1.00', '0', '0', '350', '21', '1', '2018-02-02 15:39:54', '2018-02-02 16:31:47', '1', '324805', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('725', 'OB202573262978120', '廖水秀', '15067143639', '浙江省', '杭州市', '滨江区', '滨康路228号万福中心A座9楼', '', '', '1.00', '1', '0', '0', '38', '2', '2018-02-02 15:42:06', '2018-02-02 15:42:06', '1', '994971', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('726', 'OB202573341152725', '廖水秀', '15067143639', '浙江省', '杭州市', '滨江区', '滨康路228号万福中心A座9楼', '7', '测试', '1.00', '1', '0', '0', '38', '2', '2018-02-02 15:42:14', '2018-02-02 15:44:19', '1', '259475', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('727', 'OB202580986944597', '廖水秀', '15067143639', '浙江省', '杭州市', '滨江区', '滨康路228号万福中心A座9楼', '7', '测试', '1.00', '0', '0', '320', '21', '1', '2018-02-02 15:54:58', '2018-02-02 15:57:51', '1', '415554', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('728', 'OB202587907840420', '阿丿', '18768231555', '浙江省', '杭州市', '滨江区', '滨康路228号万福中心A座9楼', '', '', '1.00', '0', '0', '0', '38', '2', '2018-02-02 16:06:30', '2018-02-02 16:06:30', '2', '305289', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('729', 'OB202588090812259', '阿丿', '18768231555', '浙江省', '杭州市', '滨江区', '滨康路228号万福中心A座9楼', '7', '测试', '1.00', '0', '0', '0', '38', '2', '2018-02-02 16:06:49', '2018-02-02 16:07:59', '2', '559684', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('730', 'OB202588921238494', '黄腾飞', '17681855353', '浙江省', '杭州市', '滨江区', '万福中心A座', '', '', '1.00', '1', '0', '0', '38', '2', '2018-02-02 16:08:12', '2018-02-02 16:08:12', '1', '566979', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('731', 'OB202589028770438', '黄腾飞', '17681855353', '浙江省', '杭州市', '滨江区', '万福中心A座', '3', '6546', '1.00', '1', '0', '0', '38', '2', '2018-02-02 16:08:22', '2018-02-02 16:10:23', '1', '188675', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('732', 'OB202592306979721', '阿丿', '18768231555', '浙江省', '杭州市', '滨江区', '滨康路228号万福中心A座9楼', '', '', '0.00', '0', '0', '320', '21', '0', '2018-02-02 16:13:50', '2018-02-02 16:13:50', '1', '971276', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('733', 'OB202593365722678', '阿丿', '18768231555', '浙江省', '杭州市', '滨江区', '滨康路228号万福中心A座9楼', '7', '1123456789', '0.00', '0', '0', '320', '21', '0', '2018-02-02 16:15:36', '2018-02-02 16:31:35', '1', '678811', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('734', 'OB202598393254674', '肖小姐', '13735558157', '浙江省', '杭州市', '滨江区', '万福中心A座901室', '', '', '1.00', '0', '0', '350', '21', '1', '2018-02-02 16:23:59', '2018-02-02 16:23:59', '1', '196673', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('735', 'OB202641658543272', '黄腾飞', '17681855353', '浙江省', '杭州市', '滨江区', '万福中心A座', '7', '123456789', '0.00', '0', '0', '711', '21', '0', '2018-02-02 17:36:05', '2018-02-02 17:41:13', '1', '982372', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('736', 'OB203220192461381', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '0', '0', '108', '21', '1', '2018-02-03 09:40:19', '2018-02-03 09:40:19', '2', '855023', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('737', 'OB203233994196942', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.00', '800', '0', '58', '21', '0', '2018-02-03 10:03:19', '2018-02-03 10:03:19', '1', '487571', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('738', 'OB203244417391990', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '1.40', '0', '0', '1179', '21', '1', '2018-02-03 10:20:41', '2018-02-03 10:20:41', '1', '757224', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('739', 'OB203251927839037', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '1.00', '0', '0', '0', '38', '2', '2018-02-03 10:33:12', '2018-02-03 10:33:12', '2', '204782', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('740', 'OB203252012167388', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '1.00', '0', '0', '0', '38', '2', '2018-02-03 10:33:21', '2018-02-03 10:33:21', '2', '220763', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('741', 'OB203252071825382', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.02', '0', '0', '108', '21', '1', '2018-02-03 10:33:27', '2018-02-03 10:33:27', '2', '757179', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('742', 'OB203274692964436', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '3', '111', '15.00', '0', '0', '72', '28', '1', '2018-02-03 11:11:09', '2018-02-03 11:12:39', '2', '868355', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('743', 'OB203277983705832', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '1.00', '0', '0', '0', '38', '2', '2018-02-03 11:16:38', '2018-02-03 11:17:23', '2', '482906', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('744', 'OB203283853345968', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '1.00', '0', '0', '0', '38', '2', '2018-02-03 11:26:25', '2018-02-03 11:26:25', '2', '782488', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('745', 'OB203284250136081', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '1.00', '0', '0', '0', '38', '2', '2018-02-03 11:27:05', '2018-02-03 11:27:05', '2', '870350', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('746', 'OB203284645379586', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '1.00', '1', '0', '0', '38', '2', '2018-02-03 11:27:44', '2018-02-03 11:27:44', '1', '268537', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('747', 'OB203284732236950', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '1.00', '0', '0', '0', '38', '2', '2018-02-03 11:27:53', '2018-02-03 11:27:53', '2', '443396', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('748', 'OB203288831661501', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '1.00', '0', '0', '0', '38', '2', '2018-02-03 11:34:43', '2018-02-03 11:34:43', '2', '891542', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('749', 'OB203292903569928', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.05', '0', '0', '58', '21', '1', '2018-02-03 11:41:30', '2018-02-03 11:41:30', '2', '225428', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('750', 'OB203293803743565', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '1.00', '0', '0', '0', '38', '2', '2018-02-03 11:43:00', '2018-02-03 11:53:04', '2', '592491', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('751', 'OB203320203881872', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '', '', '1.00', '1', '0', '0', '38', '2', '2018-02-03 12:27:00', '2018-02-03 12:27:00', '1', '334225', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('752', 'OB203320270132883', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '7', '测试', '1.00', '1', '0', '0', '38', '2', '2018-02-03 12:27:07', '2018-02-03 14:20:29', '1', '615534', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('753', 'OB203391321061872', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '1', '测试', '1.00', '1', '0', '0', '38', '2', '2018-02-03 14:25:32', '2018-02-03 14:56:51', '1', '677357', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('754', 'OB203401797520271', '徐林东', '15990163040', '浙江省', '杭州市', '萧山区', '高运', '', '', '1.00', '1', '0', '0', '38', '2', '2018-02-03 14:42:59', '2018-02-03 14:42:59', '1', '453646', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('755', 'OB203401843976665', '徐林东', '15990163040', '浙江省', '杭州市', '萧山区', '高运', '1', '测', '1.00', '1', '0', '0', '38', '2', '2018-02-03 14:43:04', '2018-02-03 14:56:41', '1', '274154', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('756', 'OB203402879244729', '徐林东', '15990163040', '浙江省', '杭州市', '萧山区', '高运', '1', '测试', '0.80', '0', '0', '318', '21', '1', '2018-02-03 14:44:47', '2018-02-03 14:56:31', '1', '506404', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('757', 'OB203407009538676', '黄腾飞', '17681855353', '浙江省', '杭州市', '滨江区', '万福中心A座', '', '', '25.00', '0', '0', '0', '38', '2', '2018-02-03 14:51:40', '2018-02-03 14:51:40', '1', '490570', '8299', '1');
INSERT INTO `tb_goods_order` VALUES ('758', 'OB203413977642126', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '20.00', '0', '0', '0', '38', '2', '2018-02-03 15:03:17', '2018-02-03 15:03:17', '1', '250361', '1999', '1');
INSERT INTO `tb_goods_order` VALUES ('759', 'OB203503326692790', '常智伟', '15252090812', '江苏省', '徐州市', '鼓楼区', '丰财街道 长征路 三角线米线对面羊肉馆', '', '', '1.00', '800', '0', '128', '26', '1', '2018-02-03 17:32:12', '2018-02-03 17:32:12', '1', '860515', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('760', 'OB203503425370717', '常智伟', '15252090812', '江苏省', '徐州市', '鼓楼区', '丰财街道 长征路 三角线米线对面羊肉馆', '7', '53944103816', '1.00', '800', '0', '128', '26', '1', '2018-02-03 17:32:22', '2018-02-05 14:42:15', '1', '834147', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('761', 'OB204334543094623', '吴清', '13805725235', '浙江省', '杭州市', '江干区', '笕桥镇', '', '', '2.00', '0', '0', '768', '21', '1', '2018-02-04 16:37:34', '2018-02-04 16:37:34', '1', '753813', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('762', 'OB205953891052813', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '1.00', '0', '0', '0', '38', '2', '2018-02-05 09:49:49', '2018-02-05 09:49:49', '2', '506506', '320', '1');
INSERT INTO `tb_goods_order` VALUES ('763', 'OB205003908688514', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.00', '0', '0', '500', '21', '0', '2018-02-05 11:13:10', '2018-02-05 11:13:10', '1', '717225', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('764', 'OB205004553505091', '王勇', '17816857090', '河北省', '唐山市', '路北区', '西溪湿地', '', '', '0.00', '800', '0', '108', '21', '0', '2018-02-05 11:14:15', '2018-02-05 11:14:15', '1', '385709', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('765', 'OB205142768431421', '白天驰', '15168267026', '浙江省', '杭州市', '滨江区', '西兴街道春波南苑12幢1单元1001室', '7', '年终福利内部兑换赠送', '0.00', '0', '0', '608', '21', '0', '2018-02-05 15:04:36', '2018-02-06 17:56:06', '1', '310669', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('766', 'OB205144336478156', '江泽军', '15167180435', '浙江省', '杭州市', '滨江区', '西行街道万福中心A座9楼', '7', '内部兑换', '10.00', '0', '0', '3588', '21', '1', '2018-02-05 15:07:13', '2018-02-06 18:01:15', '1', '657219', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('767', 'OB205146614949518', '江泽军', '15167180435', '浙江省', '杭州市', '滨江区', '西行街道万福中心A座9楼', '', '', '0.00', '800', '0', '280', '21', '0', '2018-02-05 15:11:01', '2018-02-05 15:11:01', '1', '115084', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('768', 'OB205149101598546', '付金莲', '15868183932', '浙江省', '杭州市', '临安市', '於潜镇建设银行对面丽人轩', '', '', '10.00', '0', '0', '3588', '21', '1', '2018-02-05 15:15:10', '2018-02-05 15:15:10', '1', '768667', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('769', 'OB205149102213491', '付金莲', '15868183932', '浙江省', '杭州市', '临安市', '於潜镇建设银行对面丽人轩', '', '', '10.00', '0', '0', '3588', '21', '1', '2018-02-05 15:15:10', '2018-02-05 15:15:10', '1', '732862', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('770', 'OB205149102676533', '付金莲', '15868183932', '浙江省', '杭州市', '临安市', '於潜镇建设银行对面丽人轩', '', '', '10.00', '0', '0', '3588', '21', '1', '2018-02-05 15:15:10', '2018-02-05 15:15:10', '1', '214051', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('771', 'OB205149103149672', '付金莲', '15868183932', '浙江省', '杭州市', '临安市', '於潜镇建设银行对面丽人轩', '7', '内部兑换', '10.00', '0', '0', '3588', '21', '1', '2018-02-05 15:15:10', '2018-02-06 18:01:03', '1', '343972', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('772', 'OB205158167158999', '白天驰', '15168267026', '浙江省', '杭州市', '滨江区', '西兴街道春波南苑12幢1单元1001室', '7', '年终福利内部兑换赠送', '1.00', '0', '0', '1280', '21', '1', '2018-02-05 15:30:16', '2018-02-06 17:55:43', '1', '282012', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('773', 'OB205160670246234', '钱坤', '18857157068', '浙江省', '杭州市', '萧山区', '建设二路', '7', '内部兑换', '20.00', '0', '0', '7176', '21', '1', '2018-02-05 15:34:27', '2018-02-06 18:00:54', '1', '430194', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('774', 'OB205170940233479', '黄腾飞', '17681855353', '浙江省', '杭州市', '滨江区', '万福中心A座', '', '', '10.00', '0', '0', '3588', '21', '1', '2018-02-05 15:51:34', '2018-02-05 15:51:34', '2', '156922', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('775', 'OB206791336504515', '付金莲', '15868183932', '浙江省', '杭州市', '临安市', '於潜镇建设银行对面丽人轩', '7', '内部兑换', '2.25', '0', '0', '832', '21', '1', '2018-02-06 09:05:33', '2018-02-06 18:00:46', '1', '106072', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('776', 'OB206807732093253', '付金莲', '15868183932', '浙江省', '杭州市', '临安市', '於潜镇建设银行对面丽人轩', '7', '年终福利内部员工领取', '3.00', '0', '0', '500', '21', '1', '2018-02-06 09:32:53', '2018-02-06 10:39:31', '1', '780299', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('777', 'OB206832237143779', '黄腾飞', '17681855353', '浙江省', '杭州市', '滨江区', '万福中心A座', '7', '内部兑换 ', '0.00', '0', '0', '4132', '21', '0', '2018-02-06 10:13:43', '2018-02-06 18:00:36', '1', '438249', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('778', 'OB207650085944145', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '10.00', '0', '0', '3588', '28', '1', '2018-02-07 08:56:48', '2018-02-08 11:34:42', '2', '487178', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('779', 'OB207683045929458', '平红红', '18967113628', '浙江省', '杭州市', '滨江区', '万福中心', '', '', '1.00', '0', '0', '500', '21', '1', '2018-02-07 09:51:44', '2018-02-07 09:51:44', '1', '995964', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('780', 'OB207683825171823', '平红红', '18967113628', '浙江省', '杭州市', '滨江区', '万福中心', '', '', '1.00', '0', '0', '500', '21', '1', '2018-02-07 09:53:02', '2018-02-24 17:52:40', '2', '766617', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('781', 'OB207700186276226', '谢冬梅', '17682347779', '浙江省', '杭州市', '滨江区', '中南公寓602', '1', '内部兑换', '0.00', '0', '0', '1137', '21', '0', '2018-02-07 10:20:18', '2018-02-24 16:01:14', '1', '129698', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('782', 'OB207700672845989', '姚子云', '18605523480', '浙江省', '杭州市', '滨江区', '万福中心A座9楼', '1', '自提', '10.00', '0', '0', '3588', '21', '1', '2018-02-07 10:21:07', '2018-02-10 14:23:12', '1', '265947', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('783', 'OB207759288257330', '余雪芬', '18368167368', '浙江省', '杭州市', '滨江区', '自提', '2', '自提', '10.00', '0', '0', '3588', '21', '1', '2018-02-07 11:58:48', '2018-02-10 14:23:02', '1', '880681', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('784', 'OB207764865574329', '余雪芬', '18368167368', '浙江省', '杭州市', '滨江区', '自提', '', '', '2.25', '0', '0', '832', '21', '1', '2018-02-07 12:08:06', '2018-02-07 12:08:06', '1', '207276', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('785', 'OB207765291345988', '余雪芬', '18368167368', '浙江省', '杭州市', '滨江区', '自提', '1', '内部兑换', '2.25', '0', '0', '832', '21', '1', '2018-02-07 12:08:49', '2018-02-23 09:32:09', '1', '258802', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('786', 'OB208513137427243', '汪小艺', '15990049499', '浙江省', '杭州市', '滨江区', '万福中心', '7', '内部兑换', '0.00', '0', '0', '3588', '21', '0', '2018-02-08 08:55:13', '2018-02-23 09:31:58', '1', '705571', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('787', 'OB208555279803847', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '15.00', '0', '0', '72', '28', '1', '2018-02-08 10:05:27', '2018-02-08 10:06:08', '2', '751886', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('788', 'OB208725700523918', '徐晔', '13757126650', '浙江省', '杭州市', '滨江区', '万福中心A座9楼', '', '', '0.00', '0', '0', '1664', '21', '0', '2018-02-08 14:49:30', '2018-02-24 15:58:26', '2', '160602', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('789', 'OB208818407056667', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '15.00', '0', '0', '72', '28', '1', '2018-02-08 17:24:00', '2018-02-08 17:24:00', '2', '810910', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('790', 'OB208856758441824', '崔松林', '13588090904', '浙江省', '杭州市', '滨江区', '万福中心9楼', '', '', '2.50', '0', '0', '1518', '21', '1', '2018-02-08 18:27:55', '2018-02-08 18:27:55', '1', '456630', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('791', 'OB208857445505697', '崔松林', '13588090904', '浙江省', '杭州市', '滨江区', '万福中心9楼', '', '', '2.50', '0', '0', '799', '21', '1', '2018-02-08 18:29:04', '2018-02-08 18:29:04', '1', '452434', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('792', 'OB209111590076075', '夏薇薇', '18072708123', '浙江省', '杭州市', '滨江区', '春波南苑18幢2单元102室', '', '', '1.00', '0', '0', '690', '34', '1', '2018-02-09 01:32:39', '2018-02-09 01:32:39', '1', '704513', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('793', 'OB210345650463656', '陈珂', '13817661207', '浙江省', '杭州市', '萧山区', '场景科技谷', '', '', '0.00', '0', '0', '5002', '21', '0', '2018-02-10 11:49:25', '2018-02-10 11:49:25', '1', '150557', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('794', 'OB210347614156303', '徐谢亮', '13758102186', '浙江省', '杭州市', '萧山区', '场景科技谷', '', '', '0.00', '0', '0', '4984', '21', '0', '2018-02-10 11:52:41', '2018-02-10 11:52:41', '1', '852678', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('795', 'OB210358047913348', '张帆', '18047512461', '浙江省', '杭州市', '萧山区', '场景科技谷', '', '', '0.00', '0', '0', '4990', '21', '0', '2018-02-10 12:10:04', '2018-02-10 12:10:04', '1', '584032', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('796', 'OB210366092593831', '张帆', '18047512461', '浙江省', '杭州市', '萧山区', '场景科技谷', '', '', '0.00', '0', '0', '4833', '21', '0', '2018-02-10 12:23:29', '2018-02-10 12:23:29', '1', '477853', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('797', 'OB210374574265899', '张帆', '18047512461', '浙江省', '杭州市', '萧山区', '场景科技谷', '', '', '0.00', '0', '0', '4974', '21', '0', '2018-02-10 12:37:37', '2018-02-10 12:37:37', '1', '265437', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('798', 'OB210396399653934', '俞枫伟', '13606717058', '浙江省', '杭州市', '萧山区', '建设三路733号场景科技谷', '', '', '0.00', '0', '0', '4953', '21', '0', '2018-02-10 13:14:00', '2018-02-10 13:14:00', '2', '604549', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('799', 'OB210424742094722', '周', '13588022325', '北京市', '市辖区', '西城区', '刚刚好还回家', '', '', '0.40', '0', '0', '399', '21', '1', '2018-02-10 14:01:14', '2018-02-10 14:01:14', '1', '632527', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('800', 'OB210426921889792', '周', '13588022325', '北京市', '市辖区', '西城区', '刚刚好还回家', '', '', '0.40', '0', '0', '399', '21', '1', '2018-02-10 14:04:52', '2018-02-10 14:04:52', '1', '450871', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('801', 'OB210459333041330', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '0.02', '0', '0', '108', '21', '1', '2018-02-10 14:58:53', '2018-02-10 14:58:53', '2', '986789', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('802', 'OB210481944595990', '测试', '18758253247', '北京市', '市辖区', '东城区', '测试n', '', '', '0.02', '0', '0', '108', '21', '1', '2018-02-10 15:36:34', '2018-02-10 15:36:34', '2', '501739', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('803', 'OB210495300189023', 'wangyong ', '17816857090', '辽宁省', '本溪市', '南芬区', 'xixishidi', '', '', '0.02', '0', '0', '108', '21', '1', '2018-02-10 15:58:50', '2018-02-10 15:58:50', '2', '124174', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('804', 'OB210495501464608', 'wangyong ', '17816857090', '辽宁省', '本溪市', '南芬区', 'xixishidi', '', '', '0.05', '800', '0', '58', '21', '1', '2018-02-10 15:59:10', '2018-02-10 15:59:10', '1', '544251', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('805', 'OB210495885232162', 'wangyong ', '17816857090', '辽宁省', '本溪市', '南芬区', 'xixishidi', '', '', '0.05', '0', '0', '58', '21', '1', '2018-02-10 15:59:48', '2018-02-10 15:59:48', '2', '729535', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('806', 'OB211515558869728', '罗青东', '13967123609', '浙江省', '杭州市', '西湖区', '古墩路71号修舍健康酒店前台', '', '', '1.50', '0', '0', '0', '38', '2', '2018-02-11 20:19:15', '2018-02-11 20:19:15', '1', '810488', '2944', '1');
INSERT INTO `tb_goods_order` VALUES ('807', 'OB211515664199177', '罗青东', '13967123609', '浙江省', '杭州市', '西湖区', '古墩路71号修舍健康酒店前台', '', '', '1.50', '0', '0', '0', '38', '2', '2018-02-11 20:19:26', '2018-02-11 20:19:26', '1', '563609', '2944', '1');
INSERT INTO `tb_goods_order` VALUES ('808', 'OB211529522937143', '孙莹', '18857199216', '浙江省', '杭州市', '滨江区', '长河街道', '', '', '0.00', '0', '0', '5626', '21', '0', '2018-02-11 20:42:32', '2018-02-11 20:42:32', '1', '434629', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('809', 'OB211531889266931', '徐女士', '18768182455', '浙江省', '杭州市', '萧山区', '建设三路733号', '', '', '1.50', '0', '0', '0', '38', '2', '2018-02-11 20:46:28', '2018-02-11 20:46:28', '1', '784146', '2944', '1');
INSERT INTO `tb_goods_order` VALUES ('810', 'OB211531973648961', '徐女士', '18768182455', '浙江省', '杭州市', '萧山区', '建设三路733号', '', '', '1.50', '0', '0', '0', '38', '2', '2018-02-11 20:46:37', '2018-02-11 20:46:37', '1', '212878', '2944', '1');
INSERT INTO `tb_goods_order` VALUES ('811', 'OB211532613663034', '吴烨', '13567145406', '浙江省', '杭州市', '萧山区', '城厢镇文澜苑5幢2单元602室', '', '', '0.30', '0', '0', '0', '38', '2', '2018-02-11 20:47:41', '2018-02-11 20:47:41', '1', '603730', '790', '1');
INSERT INTO `tb_goods_order` VALUES ('812', 'OB211532704079250', '吴烨', '13567145406', '浙江省', '杭州市', '萧山区', '城厢镇文澜苑5幢2单元602室', '', '', '0.30', '0', '0', '0', '38', '2', '2018-02-11 20:47:50', '2018-02-11 20:47:50', '1', '827808', '790', '1');
INSERT INTO `tb_goods_order` VALUES ('813', 'OB211532987670825', '徐女士', '18768182455', '浙江省', '杭州市', '萧山区', '建设三路733号', '', '', '0.20', '800', '0', '58', '21', '1', '2018-02-11 20:48:18', '2018-02-11 20:48:18', '1', '880474', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('814', 'OB211572939068703', '陈韩', '18767127845', '浙江省', '杭州市', '江干区', '三里家园二小区5幢1单元1402', '', '', '3.60', '0', '0', '0', '38', '2', '2018-02-11 21:54:54', '2018-02-11 21:54:54', '1', '198789', '700', '1');
INSERT INTO `tb_goods_order` VALUES ('815', 'OB211573107716561', '陈韩', '18767127845', '浙江省', '杭州市', '江干区', '三里家园二小区5幢1单元1402', '', '', '3.60', '0', '0', '0', '38', '2', '2018-02-11 21:55:10', '2018-02-11 21:55:10', '1', '944428', '700', '1');
INSERT INTO `tb_goods_order` VALUES ('816', 'OB211577021765323', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼七楼', '', '', '1.50', '0', '0', '0', '38', '2', '2018-02-11 22:01:42', '2018-02-11 22:01:42', '1', '373305', '2944', '1');
INSERT INTO `tb_goods_order` VALUES ('817', 'OB211577232011747', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼七楼', '', '', '1.50', '0', '0', '0', '38', '2', '2018-02-11 22:02:03', '2018-02-11 22:02:03', '1', '913224', '2944', '1');
INSERT INTO `tb_goods_order` VALUES ('818', 'OB211578575671200', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼七楼', '', '', '1.50', '0', '0', '0', '38', '2', '2018-02-11 22:04:17', '2018-02-11 22:04:17', '1', '328843', '2944', '1');
INSERT INTO `tb_goods_order` VALUES ('819', 'OB211578805813415', '段振强', '15237455032', '河南省', '许昌市', '禹州市', '方岗镇石灰赵村1组', '', '', '7.50', '0', '0', '0', '38', '2', '2018-02-11 22:04:40', '2018-02-11 22:04:40', '1', '149157', '1250', '1');
INSERT INTO `tb_goods_order` VALUES ('820', 'OB211578910951399', '段振强', '15237455032', '河南省', '许昌市', '禹州市', '方岗镇石灰赵村1组', '', '', '7.50', '0', '0', '0', '38', '2', '2018-02-11 22:04:51', '2018-02-11 22:04:51', '1', '493796', '1250', '1');
INSERT INTO `tb_goods_order` VALUES ('821', 'OB211584161821906', '刘金霞', '18968070480', '浙江省', '杭州市', '拱墅区', '都市水乡水滟苑103室', '', '', '0.25', '800', '0', '129', '21', '1', '2018-02-11 22:13:36', '2018-02-11 22:13:36', '1', '535621', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('822', 'OB211585753347873', '方逍然', '15967771069', '浙江省', '温州市', '乐清市', '乐湖路4号A幢801', '', '', '0.00', '0', '0', '0', '38', '0', '2018-02-11 22:16:15', '2018-02-11 22:16:15', '1', '736003', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('823', 'OB211595366847343', '王平', '13575454660', '浙江省', '杭州市', '西湖区', '三墩镇都市阳光华苑4幢1406', '', '', '0.00', '0', '0', '3649', '21', '0', '2018-02-11 22:32:17', '2018-02-11 22:32:17', '1', '161239', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('824', 'OB211599887011211', '王平', '13575454660', '浙江省', '杭州市', '西湖区', '三墩镇都市阳光华苑4幢1406', '', '', '0.00', '800', '0', '29', '21', '0', '2018-02-11 22:39:48', '2018-02-11 22:39:48', '1', '338041', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('825', 'OB211600417087083', '王平', '13575454660', '浙江省', '杭州市', '西湖区', '三墩镇都市阳光华苑4幢1406', '', '', '0.00', '0', '0', '500', '21', '0', '2018-02-11 22:40:41', '2018-02-11 22:40:41', '1', '467937', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('826', 'OB211600720540142', '李颖', '13738012023', '浙江省', '杭州市', '西湖区', '文新街道登新公寓1幢3单元401', '', '', '0.20', '0', '0', '1490', '21', '1', '2018-02-11 22:41:12', '2018-02-11 22:41:12', '1', '599534', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('827', 'OB211601003956265', '李颖', '13738012023', '浙江省', '杭州市', '西湖区', '文新街道登新公寓1幢3单元401', '', '', '0.03', '800', '0', '186', '21', '1', '2018-02-11 22:41:40', '2018-02-11 22:41:40', '1', '576555', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('828', 'OB211601048392623', '李颖', '13738012023', '浙江省', '杭州市', '西湖区', '文新街道登新公寓1幢3单元401', '', '', '0.03', '800', '0', '186', '21', '1', '2018-02-11 22:41:44', '2018-02-11 22:41:44', '1', '869547', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('829', 'OB211601314730269', '卢丙江', '15868806856', '浙江省', '杭州市', '余杭区', '浙江省杭州市余杭区闲林街道闲富中路166号林溪闲庭4-1-902室', '', '', '50.00', '0', '0', '16000', '21', '1', '2018-02-11 22:42:11', '2018-02-11 22:42:11', '1', '687484', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('830', 'OB211601323345703', '李颖', '13738012023', '浙江省', '杭州市', '西湖区', '文新街道登新公寓1幢3单元401', '', '', '0.03', '800', '0', '186', '21', '1', '2018-02-11 22:42:12', '2018-02-11 22:42:12', '1', '135965', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('831', 'OB211601577702666', '段振强', '15237455032', '河南省', '许昌市', '禹州市', '方岗镇石灰赵村1组', '', '', '0.00', '0', '0', '832', '21', '0', '2018-02-11 22:42:37', '2018-02-11 22:42:37', '1', '555365', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('832', 'OB211601587728816', '李颖', '13738012023', '浙江省', '杭州市', '西湖区', '文新街道登新公寓1幢3单元401', '', '', '0.40', '0', '0', '558', '21', '1', '2018-02-11 22:42:38', '2018-02-11 22:42:38', '1', '884688', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('833', 'OB211602200897800', '李颖', '13738012023', '浙江省', '杭州市', '西湖区', '文新街道登新公寓1幢3单元401', '', '', '2.50', '0', '0', '799', '21', '1', '2018-02-11 22:43:40', '2018-02-11 22:43:40', '1', '455314', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('834', 'OB211602425558114', '段永泉', '15168109543', '江西省', '九江市', '都昌县', '中馆镇友谊村', '', '', '1.25', '800', '0', '298', '21', '1', '2018-02-11 22:44:02', '2018-02-11 22:44:02', '1', '794985', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('835', 'OB211602476066717', '段永泉', '15168109543', '江西省', '九江市', '都昌县', '中馆镇友谊村', '', '', '1.25', '800', '0', '298', '21', '1', '2018-02-11 22:44:07', '2018-02-11 22:44:07', '1', '803182', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('836', 'OB211602897373958', '冯建良', '18657205713', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼8楼', '', '', '0.20', '800', '0', '168', '21', '1', '2018-02-11 22:44:49', '2018-02-11 22:44:49', '1', '588913', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('837', 'OB211603116602316', '李颖', '13738012023', '浙江省', '杭州市', '西湖区', '文新街道登新公寓1幢3单元401', '', '', '0.03', '800', '0', '186', '21', '1', '2018-02-11 22:45:11', '2018-02-11 22:45:11', '1', '895777', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('838', 'OB211603573555744', '段振强', '15237455032', '河南省', '许昌市', '禹州市', '方岗镇石灰赵村1组', '', '', '0.00', '0', '0', '2780', '21', '0', '2018-02-11 22:45:57', '2018-02-11 22:45:57', '1', '546249', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('839', 'OB211604916217443', '段留志', '15968198975', '浙江省', '杭州市', '西湖区', '天目山路古翠路交叉口新亚科技大楼7楼视科传媒', '', '', '0.00', '0', '0', '2780', '21', '0', '2018-02-11 22:48:11', '2018-02-11 22:48:11', '1', '584794', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('840', 'OB211605037963449', '汪佳丽', '13588822649', '浙江省', '杭州市', '西湖区', '古荡湾新村9幢204', '', '', '0.20', '0', '0', '1490', '21', '1', '2018-02-11 22:48:23', '2018-02-11 22:48:23', '1', '612112', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('841', 'OB211605472364949', '黄凡芸', '13588859513', '浙江省', '杭州市', '西湖区', '文二西路丰潭路口世纪新城西区33幢704', '', '', '0.00', '0', '0', '7626', '21', '0', '2018-02-11 22:49:07', '2018-02-11 22:49:07', '1', '354495', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('842', 'OB211608012516586', '汪佳丽', '13588822649', '浙江省', '杭州市', '西湖区', '古荡湾新村9幢204', '', '', '0.20', '0', '0', '1490', '21', '1', '2018-02-11 22:53:21', '2018-02-11 22:53:21', '1', '906764', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('843', 'OB211608188387886', '李颖', '13738012023', '浙江省', '杭州市', '西湖区', '文新街道登新公寓1幢3单元401', '', '', '0.20', '800', '0', '115', '21', '1', '2018-02-11 22:53:38', '2018-02-11 22:53:38', '1', '648719', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('844', 'OB211609724151337', '黄凡芸', '13588859513', '浙江省', '杭州市', '西湖区', '文二西路丰潭路口世纪新城西区33幢704', '', '', '0.00', '0', '0', '9444', '21', '0', '2018-02-11 22:56:12', '2018-02-11 22:56:12', '1', '508711', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('845', 'OB211610329836255', '段留志', '15968198975', '浙江省', '杭州市', '西湖区', '天目山路古翠路交叉口新亚科技大楼7楼视科传媒', '', '', '0.00', '800', '0', '29', '21', '0', '2018-02-11 22:57:13', '2018-02-11 22:57:13', '1', '213827', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('846', 'OB211610783171119', '黄凡芸', '13588859513', '浙江省', '杭州市', '西湖区', '文二西路丰潭路口世纪新城西区33幢704', '', '', '0.40', '0', '0', '558', '21', '1', '2018-02-11 22:57:58', '2018-02-11 22:57:58', '1', '780359', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('847', 'OB211610962364031', '黄凡芸', '13588859513', '浙江省', '杭州市', '西湖区', '文二西路丰潭路口世纪新城西区33幢704', '', '', '0.40', '0', '0', '558', '21', '1', '2018-02-11 22:58:16', '2018-02-11 22:58:16', '1', '702637', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('848', 'OB211611095620865', '黄凡芸', '13588859513', '浙江省', '杭州市', '西湖区', '文二西路丰潭路口世纪新城西区33幢704', '', '', '0.40', '0', '0', '558', '21', '1', '2018-02-11 22:58:29', '2018-02-11 22:58:29', '1', '684958', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('849', 'OB211612606991779', '黄凡芸', '13588859513', '浙江省', '杭州市', '西湖区', '文二西路丰潭路口世纪新城西区33幢704', '', '', '4.00', '0', '0', '3380', '21', '1', '2018-02-11 23:01:00', '2018-02-11 23:01:00', '1', '247458', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('850', 'OB211612904578611', '黄凡芸', '13588859513', '浙江省', '杭州市', '西湖区', '文二西路丰潭路口世纪新城西区33幢704', '', '', '0.20', '0', '0', '1490', '21', '1', '2018-02-11 23:01:30', '2018-02-11 23:01:30', '1', '619697', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('851', 'OB211613087689025', '黄凡芸', '13588859513', '浙江省', '杭州市', '西湖区', '文二西路丰潭路口世纪新城西区33幢704', '', '', '0.20', '0', '0', '1490', '21', '1', '2018-02-11 23:01:48', '2018-02-11 23:01:48', '1', '972242', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('852', 'OB211616082396070', '黄凡芸', '13588859513', '浙江省', '杭州市', '西湖区', '文二西路丰潭路口世纪新城西区33幢704', '', '', '0.20', '0', '0', '1490', '21', '1', '2018-02-11 23:06:48', '2018-02-11 23:06:48', '1', '525750', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('853', 'OB211618527393176', '胡文群', '13958052169', '浙江省', '杭州市', '西湖区', '西湖区西溪诚园明礼苑12-2-701', '', '', '0.00', '0', '0', '1490', '21', '0', '2018-02-11 23:10:52', '2018-02-11 23:10:52', '1', '111809', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('854', 'OB211619069892763', '黄凡芸', '13588859513', '浙江省', '杭州市', '西湖区', '文二西路丰潭路口世纪新城西区33幢704', '', '', '1.00', '0', '0', '1260', '21', '1', '2018-02-11 23:11:46', '2018-02-11 23:11:46', '1', '183545', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('855', 'OB211619567766057', '阿宁', '15967248401', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.00', '0', '0', '558', '21', '0', '2018-02-11 23:12:36', '2018-02-11 23:12:36', '1', '635323', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('856', 'OB211620950491394', '舒剑阳', '13336102588', '浙江省', '杭州市', '余杭区', '余杭街道凤联社区澜山公馆19-1-601', '', '', '4.00', '0', '0', '3380', '21', '1', '2018-02-11 23:14:55', '2018-02-11 23:14:55', '1', '256141', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('857', 'OB211626177829446', '周佳', '13123939332', '江西省', '上饶市', '上饶县', '石人乡毛宅村吴家100号', '', '', '0.00', '0', '0', '3250', '21', '0', '2018-02-11 23:23:37', '2018-02-11 23:23:37', '1', '289850', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('858', 'OB211626812651140', '赵浪', '13958045488', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.50', '0', '0', '880', '21', '1', '2018-02-11 23:24:41', '2018-02-11 23:24:41', '1', '279003', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('859', 'OB211627584125592', '胡文群', '13958052169', '浙江省', '杭州市', '西湖区', '西湖区西溪诚园明礼苑12-2-701', '', '', '0.00', '0', '0', '9581', '21', '0', '2018-02-11 23:25:58', '2018-02-11 23:25:58', '1', '888746', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('860', 'OB211628914705149', '周佳', '13123939332', '江西省', '上饶市', '上饶县', '石人乡毛宅村吴家100号', '', '', '0.00', '0', '0', '3250', '21', '0', '2018-02-11 23:28:11', '2018-02-11 23:28:11', '1', '350998', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('861', 'OB211629492721480', '周佳', '13123939332', '江西省', '上饶市', '上饶县', '石人乡毛宅村吴家100号', '', '', '0.20', '0', '0', '1490', '21', '1', '2018-02-11 23:29:09', '2018-02-11 23:29:09', '1', '773507', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('862', 'OB211633651632716', '胡文群', '13958052169', '浙江省', '杭州市', '西湖区', '西湖区西溪诚园明礼苑12-2-701', '', '', '0.00', '0', '0', '9250', '21', '0', '2018-02-11 23:36:05', '2018-02-11 23:36:05', '1', '941096', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('863', 'OB211637448575366', '徐俊毅', '13675842161', '浙江省', '杭州市', '西湖区', '古翠路6号 新亚科技大楼8楼 视科工程部', '', '', '0.00', '0', '0', '3611', '21', '0', '2018-02-11 23:42:24', '2018-02-11 23:42:24', '1', '256170', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('864', 'OB211641209186005', '徐俊毅', '13675842161', '浙江省', '杭州市', '西湖区', '古翠路6号 新亚科技大楼8楼 视科工程部', '', '', '0.00', '0', '0', '3633', '21', '0', '2018-02-11 23:48:41', '2018-02-11 23:48:41', '1', '519179', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('865', 'OB211642309924683', '冯建良', '18657205713', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼8楼', '', '', '0.00', '0', '0', '383', '21', '0', '2018-02-11 23:50:31', '2018-02-11 23:50:31', '1', '826535', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('866', 'OB211644082630426', '徐俊毅', '13675842161', '浙江省', '杭州市', '西湖区', '古翠路6号 新亚科技大楼8楼 视科工程部', '', '', '0.00', '0', '0', '3634', '21', '0', '2018-02-11 23:53:28', '2018-02-11 23:53:28', '1', '696378', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('867', 'OB211647288421072', '徐俊毅', '13675842161', '浙江省', '杭州市', '西湖区', '古翠路6号 新亚科技大楼8楼 视科工程部', '', '', '0.00', '0', '0', '3608', '21', '0', '2018-02-11 23:58:48', '2018-02-11 23:58:48', '1', '583579', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('868', 'OB212649528358477', '阿宁', '15967248401', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.00', '0', '0', '3656', '21', '0', '2018-02-12 00:02:32', '2018-02-12 00:02:32', '1', '317890', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('869', 'OB212661781877014', '周良', '13957100159', '浙江省', '杭州市', '下城区', '环城西路20号人民日报浙江分社', '', '', '0.00', '0', '0', '1490', '21', '0', '2018-02-12 00:22:58', '2018-02-12 00:22:58', '1', '807597', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('870', 'OB212689155211127', '李颖', '13738012023', '浙江省', '杭州市', '西湖区', '文新街道登新公寓1幢3单元401', '', '', '1.00', '0', '0', '1260', '21', '1', '2018-02-12 01:08:35', '2018-02-12 01:08:35', '1', '496509', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('871', 'OB212872277896942', '陈卓', '15858197374', '浙江省', '杭州市', '西湖区', '文新街道', '', '', '1.60', '0', '0', '516', '21', '1', '2018-02-12 06:13:47', '2018-02-12 06:13:47', '1', '305289', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('872', 'OB212873103148958', '舒剑阳', '13336102588', '浙江省', '杭州市', '余杭区', '余杭街道凤联社区澜山公馆19-1-601', '', '', '50.00', '0', '0', '16000', '21', '1', '2018-02-12 06:15:10', '2018-02-12 06:15:10', '1', '155205', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('873', 'OB212874295791589', '潘永杰', '18258124000', '浙江省', '杭州市', '拱墅区', '三宝新村19栋302', '', '', '1.60', '0', '0', '516', '21', '1', '2018-02-12 06:17:09', '2018-02-12 06:17:09', '1', '414476', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('874', 'OB212881477332644', '舒剑阳', '13336102588', '浙江省', '杭州市', '余杭区', '余杭街道凤联社区澜山公馆19-1-601', '', '', '0.40', '0', '0', '399', '21', '1', '2018-02-12 06:29:07', '2018-02-12 06:29:07', '1', '388496', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('875', 'OB212917523716215', '金艳', '15988409351', '浙江省', '杭州市', '余杭区', '教工宿舍通济路7-1-402', '', '', '0.00', '0', '0', '3656', '21', '0', '2018-02-12 07:29:12', '2018-02-12 07:29:12', '1', '220816', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('876', 'OB212919510822445', '王平', '13575454660', '浙江省', '杭州市', '西湖区', '三墩镇都市阳光华苑4幢1406', '', '', '0.20', '800', '0', '58', '21', '1', '2018-02-12 07:32:31', '2018-02-12 07:32:31', '1', '801211', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('877', 'OB212922943321761', '周佳', '13123939332', '江西省', '上饶市', '上饶县', '石人乡毛宅村吴家100号', '', '', '2.00', '0', '0', '1760', '21', '1', '2018-02-12 07:38:14', '2018-02-12 07:38:14', '1', '995132', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('878', 'OB212937117776438', '潘明月', '18875895580', '浙江省', '杭州市', '西湖区', '西溪花园红柿苑6幢', '', '', '0.00', '0', '0', '4270', '21', '0', '2018-02-12 08:01:51', '2018-02-12 08:01:51', '1', '490609', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('879', 'OB212940727979074', '潘明月', '18875895580', '浙江省', '杭州市', '西湖区', '西溪花园红柿苑6幢', '', '', '0.00', '0', '0', '3380', '21', '0', '2018-02-12 08:07:52', '2018-02-12 08:07:52', '1', '513558', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('880', 'OB212942375005848', '舒剑阳', '13336102588', '浙江省', '杭州市', '余杭区', '余杭街道凤联社区澜山公馆19-1-601', '', '', '0.50', '800', '0', '280', '21', '1', '2018-02-12 08:10:37', '2018-02-12 08:10:37', '1', '153626', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('881', 'OB212942491659581', '舒剑阳', '13336102588', '浙江省', '杭州市', '余杭区', '余杭街道凤联社区澜山公馆19-1-601', '', '', '0.50', '800', '0', '280', '21', '1', '2018-02-12 08:10:49', '2018-02-12 08:10:49', '1', '334160', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('882', 'OB212943474166802', '舒剑阳', '13336102588', '浙江省', '杭州市', '余杭区', '余杭街道凤联社区澜山公馆19-1-601', '', '', '0.50', '800', '0', '280', '21', '1', '2018-02-12 08:12:27', '2018-02-12 08:12:27', '1', '915513', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('883', 'OB212955526272558', '周佳', '13123939332', '江西省', '上饶市', '上饶县', '石人乡毛宅村吴家100号', '', '', '0.20', '0', '0', '1490', '21', '1', '2018-02-12 08:32:32', '2018-02-12 08:32:32', '1', '724215', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('884', 'OB212958885197169', '吴丹', '15857117099', '浙江省', '杭州市', '西湖区', '古荡街道古墩路71号修舍酒店前台', '', '', '0.40', '800', '0', '159', '21', '1', '2018-02-12 08:38:08', '2018-02-12 08:38:08', '1', '207959', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('885', 'OB212958930697744', '吴丹', '15857117099', '浙江省', '杭州市', '西湖区', '古荡街道古墩路71号修舍酒店前台', '', '', '0.40', '800', '0', '159', '21', '1', '2018-02-12 08:38:13', '2018-02-12 08:38:13', '1', '387597', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('886', 'OB212959655984594', '罗青东', '13967123609', '浙江省', '杭州市', '西湖区', '古墩路71号修舍健康酒店前台', '', '', '8.00', '0', '0', '16080', '21', '1', '2018-02-12 08:39:25', '2018-02-12 08:39:25', '1', '846129', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('887', 'OB212974447285466', '刘兴香', '15314619817', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技9楼', '', '', '0.00', '0', '0', '3647', '21', '0', '2018-02-12 09:04:05', '2018-02-12 09:04:05', '1', '930697', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('888', 'OB212977399580993', '王平', '13575454660', '浙江省', '杭州市', '西湖区', '三墩镇都市阳光华苑4幢1406', '', '', '0.20', '800', '0', '58', '21', '1', '2018-02-12 09:08:59', '2018-02-12 09:08:59', '1', '178383', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('889', 'OB212977827867862', '任延红', '18554873211', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大厦9楼', '', '', '0.05', '800', '0', '58', '21', '1', '2018-02-12 09:09:42', '2018-02-12 09:09:42', '1', '815352', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('890', 'OB212977942925047', '任延红', '18554873211', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大厦9楼', '', '', '0.05', '800', '0', '58', '21', '1', '2018-02-12 09:09:54', '2018-02-12 09:09:54', '1', '702011', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('891', 'OB212978502122139', '李颖', '13738012023', '浙江省', '杭州市', '西湖区', '文新街道登新公寓1幢3单元401', '', '', '0.03', '800', '0', '186', '21', '1', '2018-02-12 09:10:50', '2018-02-12 09:10:50', '1', '604637', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('892', 'OB212978544602033', '李颖', '13738012023', '浙江省', '杭州市', '西湖区', '文新街道登新公寓1幢3单元401', '', '', '0.03', '800', '0', '186', '21', '1', '2018-02-12 09:10:54', '2018-02-12 09:10:54', '1', '790753', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('893', 'OB212982671120434', '詹艳婷', '13757132032', '浙江省', '杭州市', '西湖区', '古墩路71号修舍健康酒店8楼总经办', '', '', '0.00', '0', '0', '1490', '21', '0', '2018-02-12 09:17:47', '2018-02-12 09:17:47', '1', '230478', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('894', 'OB212985358982749', '阿宁', '15967248401', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.00', '0', '0', '3653', '21', '0', '2018-02-12 09:22:16', '2018-02-12 09:22:16', '1', '685955', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('895', 'OB212986024280039', '勼爷', '18969090205', '浙江省', '杭州市', '江干区', '同协雅苑4-1-1301', '', '', '1.50', '0', '0', '0', '38', '2', '2018-02-12 09:23:22', '2018-02-12 09:23:22', '1', '845133', '2944', '1');
INSERT INTO `tb_goods_order` VALUES ('896', 'OB212986167317476', '勼爷', '18969090205', '浙江省', '杭州市', '江干区', '同协雅苑4-1-1301', '', '', '1.50', '0', '0', '0', '38', '2', '2018-02-12 09:23:36', '2018-02-12 09:23:36', '1', '249128', '2944', '1');
INSERT INTO `tb_goods_order` VALUES ('897', 'OB212989197351283', '李颖', '13738012023', '浙江省', '杭州市', '西湖区', '文新街道登新公寓1幢3单元401', '', '', '0.03', '800', '0', '186', '21', '1', '2018-02-12 09:28:39', '2018-02-12 09:28:39', '1', '511170', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('898', 'OB212992292074545', '勼爷', '18969090205', '浙江省', '杭州市', '江干区', '同协雅苑4-1-1301', '', '', '1.50', '0', '0', '0', '38', '2', '2018-02-12 09:33:49', '2018-02-12 09:33:49', '1', '324508', '2944', '1');
INSERT INTO `tb_goods_order` VALUES ('899', 'OB212996953801595', '赵浪', '13958045488', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.00', '0', '0', '3783', '21', '0', '2018-02-12 09:41:35', '2018-02-12 09:41:35', '1', '871703', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('900', 'OB212002283877227', '陈蕾', '13588850055', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼视科传媒', '', '', '0.00', '0', '0', '3325', '21', '0', '2018-02-12 09:50:28', '2018-02-12 09:50:28', '1', '392700', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('901', 'OB212003097329978', '赵浪', '13958045488', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.00', '0', '0', '1681', '21', '0', '2018-02-12 09:51:49', '2018-02-12 09:51:49', '1', '753503', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('902', 'OB212006302403370', '姜红', '13516704997', '浙江省', '杭州市', '余杭区', '景瑞御蓝湾6幢2单元204室', '', '', '0.00', '0', '0', '16000', '21', '0', '2018-02-12 09:57:10', '2018-02-12 09:57:10', '1', '127281', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('903', 'OB212006853556545', '姜红', '13516704997', '浙江省', '杭州市', '余杭区', '景瑞御蓝湾6幢2单元204室', '', '', '0.00', '0', '0', '5769', '21', '0', '2018-02-12 09:58:05', '2018-02-12 09:58:05', '1', '744564', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('904', 'OB212007383303354', '姜红', '13516704997', '浙江省', '杭州市', '余杭区', '景瑞御蓝湾6幢2单元204室', '', '', '4.00', '0', '0', '3380', '21', '1', '2018-02-12 09:58:58', '2018-02-12 09:58:58', '1', '582720', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('905', 'OB212007935182563', '姜红', '13516704997', '浙江省', '杭州市', '余杭区', '景瑞御蓝湾6幢2单元204室', '', '', '3.00', '0', '0', '2389', '21', '1', '2018-02-12 09:59:53', '2018-02-12 09:59:53', '1', '708956', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('906', 'OB212008569458992', '姜红', '13516704997', '浙江省', '杭州市', '余杭区', '景瑞御蓝湾6幢2单元204室', '', '', '1.00', '0', '0', '3698', '21', '1', '2018-02-12 10:00:56', '2018-02-12 10:00:56', '1', '737587', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('907', 'OB212009728857905', '姜红', '13516704997', '浙江省', '杭州市', '余杭区', '景瑞御蓝湾6幢2单元204室', '', '', '50.00', '0', '0', '16000', '21', '1', '2018-02-12 10:02:52', '2018-02-12 10:02:52', '1', '743265', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('908', 'OB212015794283281', '张晓娇', '15268190993', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店前台', '', '', '0.00', '0', '0', '3176', '21', '0', '2018-02-12 10:12:59', '2018-02-12 10:12:59', '1', '846348', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('909', 'OB212016170823888', '罗青东', '13967123609', '浙江省', '杭州市', '西湖区', '古墩路71号修舍健康酒店前台', '', '', '0.00', '0', '0', '20793', '21', '0', '2018-02-12 10:13:37', '2018-02-12 10:13:37', '1', '453795', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('910', 'OB212017151651237', '张晓娇', '15268190993', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店前台', '', '', '1.00', '0', '0', '1698', '21', '1', '2018-02-12 10:15:15', '2018-02-12 10:15:15', '1', '273427', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('911', 'OB212017317257933', '方逍然', '15967771069', '浙江省', '温州市', '乐清市', '乐湖路4号A幢801', '', '', '0.00', '0', '0', '3652', '21', '0', '2018-02-12 10:15:31', '2018-02-12 10:15:31', '1', '758039', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('912', 'OB212018273184567', '于秀庆', '13792837277', '山东省', '青岛市', '崂山区', '海尔路19号甲北村小区天林家园4号楼3单元102', '', '', '4.00', '0', '0', '2780', '21', '1', '2018-02-12 10:17:07', '2018-02-12 10:17:07', '1', '798450', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('913', 'OB212018681693583', '张晓娇', '15268190993', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店前台', '', '', '0.50', '0', '0', '398', '21', '1', '2018-02-12 10:17:48', '2018-02-12 10:17:48', '1', '845445', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('914', 'OB212019153429216', '张晓娇', '15268190993', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店前台', '', '', '1.00', '0', '0', '499', '21', '1', '2018-02-12 10:18:35', '2018-02-12 10:18:35', '1', '419815', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('915', 'OB212020042959358', '梅珏', '15257265520', '浙江省', '湖州市', '安吉县', '下扇新村56号', '', '', '0.00', '0', '0', '3644', '21', '0', '2018-02-12 10:20:04', '2018-02-12 10:20:04', '1', '993834', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('916', 'OB212020240176021', '阿宁', '15967248401', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.00', '0', '0', '3653', '21', '0', '2018-02-12 10:20:24', '2018-02-12 10:20:24', '1', '190904', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('917', 'OB212021049795719', '李嘉宁', '18868180060', '浙江省', '杭州市', '西湖区', '文新街道文三路香樟公寓27-1-702', '', '', '0.00', '0', '0', '3655', '21', '0', '2018-02-12 10:21:45', '2018-02-12 10:21:45', '1', '291321', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('918', 'OB212021438654976', '张晓娇', '15268190993', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店前台', '', '', '0.02', '0', '0', '416', '21', '1', '2018-02-12 10:22:23', '2018-02-12 10:22:23', '1', '489745', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('919', 'OB212022724251836', '方逍然', '15967771069', '浙江省', '温州市', '乐清市', '乐湖路4号A幢801', '', '', '0.00', '0', '0', '3660', '21', '0', '2018-02-12 10:24:32', '2018-02-12 10:24:32', '1', '954090', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('920', 'OB212022748399960', '李嘉宁', '18868180060', '浙江省', '杭州市', '西湖区', '文新街道文三路香樟公寓27-1-702', '', '', '0.00', '0', '0', '3655', '21', '0', '2018-02-12 10:24:34', '2018-02-12 10:24:34', '1', '374186', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('921', 'OB212022962703507', '李嘉宁', '18868180060', '浙江省', '杭州市', '西湖区', '文新街道文三路香樟公寓27-1-702', '', '', '0.03', '800', '0', '186', '21', '1', '2018-02-12 10:24:56', '2018-02-12 10:24:56', '1', '331254', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('922', 'OB212023309212418', '李嘉宁', '18868180060', '浙江省', '杭州市', '西湖区', '文新街道文三路香樟公寓27-1-702', '', '', '4.00', '0', '0', '3380', '21', '1', '2018-02-12 10:25:30', '2018-02-12 10:25:30', '1', '699035', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('923', 'OB212023469680534', '张晓娇', '15268190993', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店前台', '', '', '0.50', '800', '0', '29', '21', '1', '2018-02-12 10:25:46', '2018-02-12 10:25:46', '1', '262308', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('924', 'OB212023819878050', '李嘉宁', '18868180060', '浙江省', '杭州市', '西湖区', '文新街道文三路香樟公寓27-1-702', '', '', '0.50', '800', '0', '89', '21', '1', '2018-02-12 10:26:21', '2018-02-12 10:26:21', '1', '220118', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('925', 'OB212024629924891', '张晓娇', '15268190993', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店前台', '', '', '0.50', '800', '0', '260', '21', '1', '2018-02-12 10:27:42', '2018-02-12 10:27:42', '1', '116975', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('926', 'OB212024771861620', '吴庆', '13919761296', '甘肃省', '兰州市', '城关区', '拱星墩街道焦家湾南路225号中国兵器集团北方机械厂', '', '', '0.00', '0', '0', '3698', '21', '0', '2018-02-12 10:27:57', '2018-02-12 10:27:57', '1', '803283', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('927', 'OB212025036042569', '张晓娇', '15268190993', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店前台', '', '', '0.50', '800', '0', '260', '21', '1', '2018-02-12 10:28:23', '2018-02-12 10:28:23', '1', '614457', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('928', 'OB212025440339419', '吴庆', '13919761296', '甘肃省', '兰州市', '城关区', '拱星墩街道焦家湾南路225号中国兵器集团北方机械厂', '', '', '0.00', '0', '0', '3698', '21', '0', '2018-02-12 10:29:04', '2018-02-12 10:29:04', '1', '477442', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('929', 'OB212025606822359', '方逍然', '15967771069', '浙江省', '温州市', '乐清市', '乐湖路4号A幢801', '', '', '0.00', '0', '0', '3660', '21', '0', '2018-02-12 10:29:21', '2018-02-12 10:29:21', '1', '249904', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('930', 'OB212027305820864', '张晓娇', '15268190993', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店前台', '', '', '3.00', '0', '0', '768', '21', '1', '2018-02-12 10:32:10', '2018-02-12 10:32:10', '1', '924326', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('931', 'OB212030922026500', '冯冰冰', '13588185664', '浙江省', '杭州市', '西湖区', '古墩路71号杭州修舍健康酒店8楼', '', '', '0.00', '0', '0', '3659', '21', '0', '2018-02-12 10:38:12', '2018-02-12 10:38:12', '1', '943583', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('932', 'OB212030982371943', '可乐', '18268139210', '浙江省', '杭州市', '余杭区', '乔司镇永西村二组60号2楼', '', '', '0.00', '0', '0', '2817', '21', '0', '2018-02-12 10:38:18', '2018-02-12 10:38:18', '1', '575235', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('933', 'OB212035644866326', '吴丹', '15857117099', '浙江省', '杭州市', '西湖区', '古荡街道古墩路71号修舍酒店前台', '', '', '0.00', '0', '0', '5967', '21', '0', '2018-02-12 10:46:04', '2018-02-12 10:46:04', '1', '476472', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('934', 'OB212035838149641', '罗青东', '13967123609', '浙江省', '金华市', '东阳市', '横店镇南江名郡66栋一单元402室', '', '', '50.00', '0', '0', '16000', '21', '1', '2018-02-12 10:46:23', '2018-02-12 10:46:23', '1', '643042', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('935', 'OB212036373205088', '张晓娇', '15268190993', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店前台', '', '', '5.00', '800', '0', '228', '21', '1', '2018-02-12 10:47:17', '2018-02-12 10:47:17', '1', '897823', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('936', 'OB212038039139757', '张晓娇', '15268190993', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店前台', '', '', '0.01', '800', '0', '29', '21', '1', '2018-02-12 10:50:03', '2018-02-12 10:50:03', '1', '356588', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('937', 'OB212041882584993', '应芳琴', '18767153827', '浙江省', '杭州市', '拱墅区', '古荡街道古墩路71号修舍酒店8楼客房部', '', '', '1.00', '0', '0', '3698', '21', '1', '2018-02-12 10:56:28', '2018-02-12 10:56:28', '1', '541844', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('938', 'OB212043495133602', '周恒', '13750800459', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.00', '0', '0', '5605', '21', '0', '2018-02-12 10:59:09', '2018-02-12 10:59:09', '1', '631953', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('939', 'OB212044565381420', '应芳琴', '18767153827', '浙江省', '杭州市', '拱墅区', '古荡街道古墩路71号修舍酒店8楼客房部', '', '', '0.40', '0', '0', '499', '21', '1', '2018-02-12 11:00:56', '2018-02-12 11:00:56', '1', '782976', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('940', 'OB212045425313912', '周恒', '13750800459', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.00', '0', '0', '5490', '21', '0', '2018-02-12 11:02:22', '2018-02-12 11:02:22', '1', '404184', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('941', 'OB212046490233523', '周恒', '13750800459', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.20', '800', '0', '115', '21', '1', '2018-02-12 11:04:09', '2018-02-12 11:04:09', '1', '747446', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('942', 'OB212046678668579', '周恒', '13750800459', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.00', '800', '0', '230', '21', '0', '2018-02-12 11:04:27', '2018-02-12 11:04:27', '1', '884710', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('943', 'OB212047547623857', '周恒', '13750800459', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.50', '0', '0', '1280', '21', '1', '2018-02-12 11:05:54', '2018-02-12 11:05:54', '1', '616270', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('944', 'OB212047619074396', '应芳琴', '18767153827', '浙江省', '杭州市', '拱墅区', '古荡街道古墩路71号修舍酒店8楼客房部', '', '', '0.02', '0', '0', '680', '21', '1', '2018-02-12 11:06:01', '2018-02-12 11:06:01', '1', '652935', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('945', 'OB212047881361467', '周恒', '13750800459', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '4.00', '0', '0', '3980', '21', '1', '2018-02-12 11:06:28', '2018-02-12 11:06:28', '1', '164230', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('946', 'OB212048356459303', '应芳琴', '18767153827', '浙江省', '杭州市', '拱墅区', '古荡街道古墩路71号修舍酒店8楼客房部', '', '', '0.10', '0', '0', '980', '21', '1', '2018-02-12 11:07:15', '2018-02-12 11:07:15', '1', '957922', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('947', 'OB212048560125538', '周恒', '13750800459', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.40', '800', '0', '230', '21', '1', '2018-02-12 11:07:36', '2018-02-12 11:07:36', '1', '288601', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('948', 'OB212048962872885', '周恒', '13750800459', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.40', '800', '0', '230', '21', '1', '2018-02-12 11:08:16', '2018-02-12 11:08:16', '1', '451222', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('949', 'OB212050787853857', '吴丹', '15857117099', '浙江省', '杭州市', '西湖区', '古荡街道古墩路71号修舍酒店前台', '', '', '0.00', '800', '0', '273', '21', '0', '2018-02-12 11:11:18', '2018-02-12 11:11:18', '1', '671153', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('950', 'OB212051455751259', '应芳琴', '18767153827', '浙江省', '杭州市', '拱墅区', '古荡街道古墩路71号修舍酒店8楼客房部', '', '', '0.00', '0', '0', '3036', '21', '0', '2018-02-12 11:12:25', '2018-02-12 11:12:25', '1', '331359', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('951', 'OB212053201083341', '周恒', '13750800459', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '2.50', '0', '0', '500', '21', '1', '2018-02-12 11:15:20', '2018-02-12 11:15:20', '1', '713700', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('952', 'OB212056093674732', '杨洋', '15168383481', '浙江省', '杭州市', '西湖区', '政苑小区c区', '', '', '4.00', '0', '0', '3980', '21', '1', '2018-02-12 11:20:09', '2018-02-12 11:20:09', '1', '207491', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('953', 'OB212056347722716', '冯献花', '15906630973', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店八楼人事行政', '', '', '0.00', '0', '0', '3657', '21', '0', '2018-02-12 11:20:34', '2018-02-12 11:20:34', '1', '743797', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('954', 'OB212061476039297', '应芳琴', '18767153827', '浙江省', '杭州市', '拱墅区', '古荡街道古墩路71号修舍酒店8楼客房部', '', '', '10.00', '0', '0', '456', '21', '1', '2018-02-12 11:29:07', '2018-02-12 11:29:07', '1', '997734', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('955', 'OB212062099236069', '应芳琴', '18767153827', '浙江省', '杭州市', '拱墅区', '古荡街道古墩路71号修舍酒店8楼客房部', '', '', '1.00', '0', '0', '500', '21', '1', '2018-02-12 11:30:09', '2018-02-12 11:30:09', '1', '857646', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('956', 'OB212062715502020', '应芳琴', '18767153827', '浙江省', '杭州市', '拱墅区', '古荡街道古墩路71号修舍酒店8楼客房部', '', '', '2.00', '0', '0', '768', '21', '1', '2018-02-12 11:31:11', '2018-02-12 11:31:11', '1', '402751', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('957', 'OB212065561241269', '应芳琴', '18767153827', '浙江省', '杭州市', '拱墅区', '古荡街道古墩路71号修舍酒店8楼客房部', '', '', '2.00', '0', '0', '1390', '21', '1', '2018-02-12 11:35:56', '2018-02-12 11:35:56', '1', '262208', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('958', 'OB212066159687968', '应芳琴', '18767153827', '浙江省', '杭州市', '拱墅区', '古荡街道古墩路71号修舍酒店8楼客房部', '', '', '2.50', '0', '0', '1630', '21', '1', '2018-02-12 11:36:55', '2018-02-12 11:36:55', '1', '177423', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('959', 'OB212067134568727', '应芳琴', '18767153827', '浙江省', '杭州市', '拱墅区', '古荡街道古墩路71号修舍酒店8楼客房部', '', '', '0.00', '800', '0', '246', '21', '0', '2018-02-12 11:38:33', '2018-02-12 11:38:33', '1', '753149', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('960', 'OB212075207561793', '姚军', '18758293423', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店9楼', '', '', '0.00', '0', '0', '3649', '21', '0', '2018-02-12 11:52:00', '2018-02-12 11:52:00', '1', '155415', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('961', 'OB212075742530661', '姜红', '13516704997', '浙江省', '杭州市', '余杭区', '景瑞御蓝湾6幢2单元204室', '', '', '0.00', '0', '0', '3374', '21', '0', '2018-02-12 11:52:54', '2018-02-12 11:52:54', '1', '789676', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('962', 'OB212077131922480', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '三墩镇金厦公寓5幢2单元202室', '', '', '0.00', '0', '0', '26405', '21', '0', '2018-02-12 11:55:13', '2018-02-12 11:55:13', '1', '834534', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('963', 'OB212080938229723', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '三墩镇金厦公寓5幢2单元202室', '', '', '0.00', '0', '0', '11272', '21', '0', '2018-02-12 12:01:34', '2018-02-12 12:01:34', '1', '792321', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('964', 'OB212082255486167', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '三墩镇金厦公寓5幢2单元202室', '', '', '5.00', '0', '0', '3036', '21', '1', '2018-02-12 12:03:45', '2018-02-12 12:03:45', '1', '929633', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('965', 'OB212082736890376', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '三墩镇金厦公寓5幢2单元202室', '', '', '5.00', '0', '0', '3260', '21', '1', '2018-02-12 12:04:33', '2018-02-12 12:04:33', '1', '579339', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('966', 'OB212083023218713', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '三墩镇金厦公寓5幢2单元202室', '', '', '0.40', '800', '0', '150', '21', '1', '2018-02-12 12:05:02', '2018-02-12 12:05:02', '1', '433814', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('967', 'OB212083220948641', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '三墩镇金厦公寓5幢2单元202室', '', '', '0.40', '800', '0', '150', '21', '1', '2018-02-12 12:05:22', '2018-02-12 12:05:22', '1', '774395', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('968', 'OB212083744160767', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '三墩镇金厦公寓5幢2单元202室', '', '', '4.00', '0', '0', '3380', '21', '1', '2018-02-12 12:06:14', '2018-02-12 12:06:14', '1', '877034', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('969', 'OB212084406904119', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '三墩镇金厦公寓5幢2单元202室', '', '', '2.50', '0', '0', '500', '21', '1', '2018-02-12 12:07:20', '2018-02-12 12:07:20', '1', '199855', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('970', 'OB212085175259026', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '三墩镇金厦公寓5幢2单元202室', '', '', '1.00', '0', '0', '460', '21', '1', '2018-02-12 12:08:37', '2018-02-12 12:08:37', '1', '851835', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('971', 'OB212085497931429', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '三墩镇金厦公寓5幢2单元202室', '', '', '3.00', '0', '0', '500', '21', '1', '2018-02-12 12:09:09', '2018-02-12 12:09:09', '1', '480494', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('972', 'OB212086025917046', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '三墩镇金厦公寓5幢2单元202室', '', '', '1.50', '800', '0', '128', '21', '1', '2018-02-12 12:10:02', '2018-02-12 12:10:02', '1', '436904', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('973', 'OB212088206600522', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '三墩镇金厦公寓5幢2单元202室', '', '', '4.00', '0', '0', '873', '21', '1', '2018-02-12 12:13:40', '2018-02-12 12:13:40', '1', '726846', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('974', 'OB212088917205636', '方逍然', '15967771069', '浙江省', '温州市', '乐清市', '乐湖路4号A幢801', '', '', '0.00', '0', '0', '3660', '21', '0', '2018-02-12 12:14:52', '2018-02-12 12:14:52', '1', '395571', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('975', 'OB212089586763487', '吴佳孺', '18215108780', '浙江省', '杭州市', '拱墅区', '康桥康盛苑小区13幢1单元1902室', '', '', '0.00', '0', '0', '4094', '21', '0', '2018-02-12 12:15:58', '2018-02-12 12:15:58', '1', '245829', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('976', 'OB212089789989277', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '三墩镇金厦公寓5幢2单元202室', '', '', '1.25', '800', '0', '298', '21', '1', '2018-02-12 12:16:19', '2018-02-12 12:16:19', '1', '624262', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('977', 'OB212090078077742', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '三墩镇金厦公寓5幢2单元202室', '', '', '0.40', '0', '0', '1539', '21', '1', '2018-02-12 12:16:47', '2018-02-12 12:16:47', '1', '200097', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('978', 'OB212090866916283', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '三墩镇金厦公寓5幢2单元202室', '', '', '1.00', '800', '0', '110', '21', '1', '2018-02-12 12:18:06', '2018-02-12 12:18:06', '1', '689028', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('979', 'OB212091290526067', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '三墩镇金厦公寓5幢2单元202室', '', '', '0.50', '800', '0', '188', '21', '1', '2018-02-12 12:18:49', '2018-02-12 12:18:49', '1', '590536', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('980', 'OB212093457721385', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '三墩镇金厦公寓5幢2单元202室', '', '', '2.00', '0', '0', '768', '21', '1', '2018-02-12 12:22:25', '2018-02-12 12:22:25', '1', '702479', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('981', 'OB212094229666097', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '三墩镇金厦公寓5幢2单元202室', '', '', '3.00', '0', '0', '418', '21', '1', '2018-02-12 12:23:42', '2018-02-12 12:23:42', '1', '238308', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('982', 'OB212094329313728', '朱月洪', '13600539339', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.00', '0', '0', '18389', '21', '0', '2018-02-12 12:23:53', '2018-02-12 12:23:53', '1', '317180', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('983', 'OB212096290870922', '周恒', '13750800459', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '2.50', '0', '0', '1518', '21', '1', '2018-02-12 12:27:09', '2018-02-12 12:27:09', '1', '919204', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('984', 'OB212097180063880', '周恒', '13750800459', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '3.00', '800', '0', '178', '21', '1', '2018-02-12 12:28:38', '2018-02-12 12:28:38', '1', '846096', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('985', 'OB212097222284286', '周恒', '13750800459', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '3.00', '800', '0', '178', '21', '1', '2018-02-12 12:28:42', '2018-02-12 12:28:42', '1', '238939', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('986', 'OB212097686483433', '周恒', '13750800459', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.80', '800', '0', '178', '21', '1', '2018-02-12 12:29:28', '2018-02-12 12:29:28', '1', '935350', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('987', 'OB212098066578216', '周恒', '13750800459', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '2.00', '800', '0', '118', '21', '1', '2018-02-12 12:30:06', '2018-02-12 12:30:06', '1', '156445', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('988', 'OB212106711088985', '朱月洪', '13600539339', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.00', '0', '0', '6978', '21', '0', '2018-02-12 12:44:31', '2018-02-12 12:44:31', '1', '916427', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('989', 'OB212107586103332', '姜红', '13516704997', '浙江省', '杭州市', '余杭区', '景瑞御蓝湾6幢2单元204室', '', '', '0.00', '0', '0', '2373', '21', '0', '2018-02-12 12:45:58', '2018-02-12 12:45:58', '1', '137042', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('990', 'OB212107929145536', '罗青东', '13967123609', '浙江省', '杭州市', '西湖区', '古墩路71号修舍健康酒店前台', '', '', '0.20', '0', '0', '1490', '21', '1', '2018-02-12 12:46:32', '2018-02-12 12:46:32', '1', '656726', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('991', 'OB212109272178259', '周恒', '13750800459', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '4.00', '0', '0', '3980', '21', '1', '2018-02-12 12:48:47', '2018-02-12 12:48:47', '1', '213080', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('992', 'OB212112176875272', '罗青东', '13967123609', '浙江省', '杭州市', '西湖区', '古墩路71号修舍健康酒店前台', '', '', '0.03', '800', '0', '87', '21', '1', '2018-02-12 12:53:37', '2018-02-12 12:53:37', '1', '726810', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('993', 'OB212112225028974', '罗青东', '13967123609', '浙江省', '杭州市', '西湖区', '古墩路71号修舍健康酒店前台', '', '', '0.03', '800', '0', '87', '21', '1', '2018-02-12 12:53:42', '2018-02-12 12:53:42', '1', '211714', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('994', 'OB212116204002883', '毛阳胜', '13357006309', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店8楼', '', '', '0.00', '0', '0', '3657', '21', '0', '2018-02-12 13:00:20', '2018-02-12 13:00:20', '1', '461748', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('995', 'OB212116284512021', '于秀庆', '13792837277', '山东省', '青岛市', '崂山区', '海尔路19号甲北村小区天林家园4号楼3单元102', '', '', '1.00', '0', '0', '500', '21', '1', '2018-02-12 13:00:28', '2018-02-12 13:00:28', '1', '462177', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('996', 'OB212116322513260', '舒剑阳', '13336102588', '浙江省', '杭州市', '余杭区', '余杭街道凤联社区澜山公馆19-1-601', '', '', '5.00', '0', '0', '3260', '21', '1', '2018-02-12 13:00:32', '2018-02-12 13:00:32', '1', '921803', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('997', 'OB212121271261037', '冯献花', '15906630973', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店八楼人事行政', '', '', '0.00', '0', '0', '3660', '21', '0', '2018-02-12 13:08:47', '2018-02-12 13:08:47', '1', '705865', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('998', 'OB212146389819390', '周恒', '13750800459', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.50', '0', '0', '880', '21', '1', '2018-02-12 13:50:38', '2018-02-12 13:50:38', '1', '978691', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('999', 'OB212219538688445', '何铖丽', '18658888762', '浙江省', '杭州市', '西湖区', '古墩路71号修正大厦9楼', '', '', '0.00', '0', '0', '1490', '21', '0', '2018-02-12 15:52:33', '2018-02-12 15:52:33', '1', '119069', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1000', 'OB212219745225111', '何铖丽', '18658888762', '浙江省', '杭州市', '西湖区', '古墩路71号修正大厦9楼', '', '', '0.20', '0', '0', '1490', '21', '1', '2018-02-12 15:52:54', '2018-02-12 15:52:54', '1', '489027', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1001', 'OB212275699084385', '勼爷', '18969090205', '浙江省', '杭州市', '江干区', '同协雅苑4-1-1301', '', '', '0.00', '0', '0', '3228', '21', '0', '2018-02-12 17:26:09', '2018-02-12 17:26:09', '1', '108100', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1002', 'OB212277603119468', '勼爷', '18969090205', '浙江省', '杭州市', '江干区', '同协雅苑4-1-1301', '', '', '10.00', '0', '0', '456', '21', '1', '2018-02-12 17:29:20', '2018-02-12 17:29:20', '1', '300168', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1003', 'OB212284832536355', '舒剑阳', '13336102588', '浙江省', '杭州市', '余杭区', '余杭街道凤联社区澜山公馆19-1-601', '', '', '1.00', '0', '0', '796', '21', '1', '2018-02-12 17:41:23', '2018-02-12 17:41:23', '1', '893514', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1004', 'OB212286384784896', '舒剑阳', '13336102588', '浙江省', '杭州市', '余杭区', '余杭街道凤联社区澜山公馆19-1-601', '', '', '2.40', '0', '0', '2100', '21', '1', '2018-02-12 17:43:58', '2018-02-12 17:43:58', '1', '161608', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1005', 'OB212288847978890', '任延红', '18554873211', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大厦9楼', '', '', '0.20', '0', '0', '1490', '21', '1', '2018-02-12 17:48:04', '2018-02-12 17:48:04', '1', '986749', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1006', 'OB212306744050901', '朱月洪', '13600539339', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.00', '0', '0', '4470', '21', '0', '2018-02-12 18:17:54', '2018-02-12 18:17:54', '1', '226269', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1007', 'OB212316944548698', '舒剑阳', '13336102588', '浙江省', '杭州市', '余杭区', '余杭街道凤联社区澜山公馆19-1-601', '', '', '15.00', '0', '0', '684', '21', '1', '2018-02-12 18:34:54', '2018-02-12 18:34:54', '1', '983474', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1008', 'OB212318346423255', '舒剑阳', '13336102588', '浙江省', '杭州市', '余杭区', '余杭街道凤联社区澜山公馆19-1-601', '', '', '5.00', '0', '0', '458', '21', '1', '2018-02-12 18:37:14', '2018-02-12 18:37:14', '1', '156237', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1009', 'OB212318941911252', '舒剑阳', '13336102588', '浙江省', '杭州市', '余杭区', '余杭街道凤联社区澜山公馆19-1-601', '', '', '1.00', '0', '0', '500', '21', '1', '2018-02-12 18:38:14', '2018-02-12 18:38:14', '1', '253124', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1010', 'OB212320314951203', '舒剑阳', '13336102588', '浙江省', '杭州市', '余杭区', '余杭街道凤联社区澜山公馆19-1-601', '', '', '5.00', '0', '0', '628', '21', '1', '2018-02-12 18:40:31', '2018-02-12 18:40:31', '1', '492601', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1011', 'OB212322405987968', '舒剑阳', '13336102588', '浙江省', '杭州市', '余杭区', '余杭街道凤联社区澜山公馆19-1-601', '', '', '0.50', '0', '0', '305', '21', '1', '2018-02-12 18:44:00', '2018-02-12 18:44:00', '1', '336371', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1012', 'OB212323965983561', '应芳琴', '18767153827', '浙江省', '杭州市', '拱墅区', '古荡街道古墩路71号修舍酒店8楼客房部', '', '', '0.00', '0', '0', '7980', '21', '0', '2018-02-12 18:46:36', '2018-02-12 18:46:36', '1', '878449', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1013', 'OB212330533449081', '谈金梅', '15158115009', '浙江省', '杭州市', '余杭区', '浙江省杭州市余杭区中泰街道幸福河社区恒厚阳光城13幢2单元301室光', '', '', '2.50', '0', '0', '1630', '21', '1', '2018-02-12 18:57:33', '2018-02-12 18:57:33', '1', '255360', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1014', 'OB212331051380878', '谈金梅', '15158115009', '浙江省', '杭州市', '余杭区', '浙江省杭州市余杭区中泰街道幸福河社区恒厚阳光城13幢2单元301室光', '', '', '2.50', '0', '0', '1630', '21', '1', '2018-02-12 18:58:25', '2018-02-12 18:58:25', '1', '722306', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1015', 'OB212395390819678', '汪佳丽', '13588822649', '浙江省', '绍兴市', '柯桥区', '兰亭镇兰渚山薛家坝', '', '', '1.00', '0', '0', '1260', '21', '1', '2018-02-12 20:45:39', '2018-02-12 20:45:39', '1', '568761', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1016', 'OB212411151353580', '孙江飞', '13588187176', '浙江省', '杭州市', '下城区', '东新路九龙仓君玺5幢1单元402', '', '', '0.00', '0', '0', '3658', '21', '0', '2018-02-12 21:11:55', '2018-02-12 21:11:55', '1', '170973', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1017', 'OB212413118223557', '孙江飞', '13588187176', '浙江省', '杭州市', '下城区', '东新路九龙仓君玺5幢1单元402', '', '', '0.00', '0', '0', '3658', '21', '0', '2018-02-12 21:15:11', '2018-02-12 21:15:11', '1', '156640', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1018', 'OB212413898207326', '孙江飞', '13588187176', '浙江省', '杭州市', '下城区', '东新路九龙仓君玺5幢1单元402', '', '', '4.00', '0', '0', '3380', '21', '1', '2018-02-12 21:16:29', '2018-02-12 21:16:29', '1', '248419', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1019', 'OB212414496856009', '孙江飞', '13588187176', '浙江省', '杭州市', '下城区', '东新路九龙仓君玺5幢1单元402', '', '', '0.50', '800', '0', '239', '21', '1', '2018-02-12 21:17:29', '2018-02-12 21:17:29', '1', '665243', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1020', 'OB212415101588744', '孙江飞', '13588187176', '浙江省', '杭州市', '下城区', '东新路九龙仓君玺5幢1单元402', '', '', '0.50', '0', '0', '359', '21', '1', '2018-02-12 21:18:30', '2018-02-12 21:18:30', '1', '960030', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1021', 'OB212416500351842', '孙江飞', '13588187176', '浙江省', '杭州市', '下城区', '东新路九龙仓君玺5幢1单元402', '', '', '0.00', '800', '0', '280', '21', '0', '2018-02-12 21:20:50', '2018-02-12 21:20:50', '1', '970594', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1022', 'OB212441818837581', '谈金梅', '15158115009', '浙江省', '杭州市', '余杭区', '浙江省杭州市余杭区中泰街道幸福河社区恒厚阳光城13幢2单元301室光', '', '', '1.50', '800', '0', '128', '21', '1', '2018-02-12 22:03:01', '2018-02-12 22:03:01', '1', '519662', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1023', 'OB212442100513544', '谈金梅', '15158115009', '浙江省', '杭州市', '余杭区', '浙江省杭州市余杭区中泰街道幸福河社区恒厚阳光城13幢2单元301室光', '', '', '1.50', '800', '0', '128', '21', '1', '2018-02-12 22:03:30', '2018-02-12 22:03:30', '1', '707084', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1024', 'OB212443402438059', '谈金梅', '15158115009', '浙江省', '杭州市', '余杭区', '浙江省杭州市余杭区中泰街道幸福河社区恒厚阳光城13幢2单元301室光', '', '', '0.50', '800', '0', '199', '21', '1', '2018-02-12 22:05:40', '2018-02-12 22:05:40', '1', '676237', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1025', 'OB213806707368365', '杨洋', '15168383481', '浙江省', '杭州市', '西湖区', '政苑小区c区', '', '', '0.00', '0', '0', '3649', '21', '0', '2018-02-13 08:11:10', '2018-02-13 08:11:10', '1', '673698', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1026', 'OB213821012658997', '陈玉', '18857168998', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '4.00', '0', '0', '3380', '21', '1', '2018-02-13 08:35:01', '2018-02-13 08:35:01', '1', '552938', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1027', 'OB213840364014520', '陆月婷', '18626868509', '浙江省', '杭州市', '拱墅区', '教工路550号塘河新村22幢一单元404室', '', '', '0.00', '0', '0', '8065', '21', '0', '2018-02-13 09:07:16', '2018-02-13 09:07:16', '1', '951048', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1028', 'OB213851887288897', '任延红', '18554873211', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大厦9楼', '', '', '0.00', '0', '0', '1630', '21', '0', '2018-02-13 09:26:28', '2018-02-13 09:26:28', '1', '258304', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1029', 'OB213852244658529', '任延红', '18554873211', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大厦9楼', '', '', '2.50', '0', '0', '1630', '21', '1', '2018-02-13 09:27:04', '2018-02-13 09:27:04', '1', '820260', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1030', 'OB213854062215971', '陆月婷', '18626868509', '浙江省', '杭州市', '拱墅区', '教工路550号塘河新村22幢一单元404室', '', '', '4.00', '0', '0', '3980', '21', '1', '2018-02-13 09:30:06', '2018-02-13 09:30:06', '1', '734849', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1031', 'OB213854514926562', '陆月婷', '18626868509', '浙江省', '杭州市', '拱墅区', '教工路550号塘河新村22幢一单元404室', '', '', '0.00', '0', '0', '6369', '21', '0', '2018-02-13 09:30:51', '2018-02-13 09:30:51', '1', '586996', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1032', 'OB213854981404807', '陆月婷', '18626868509', '浙江省', '杭州市', '拱墅区', '教工路550号塘河新村22幢一单元404室', '', '', '3.00', '0', '0', '2389', '21', '1', '2018-02-13 09:31:38', '2018-02-13 09:31:38', '1', '541156', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1033', 'OB213855328856533', '陆月婷', '18626868509', '浙江省', '杭州市', '拱墅区', '教工路550号塘河新村22幢一单元404室', '', '', '4.00', '0', '0', '3980', '21', '1', '2018-02-13 09:32:12', '2018-02-13 09:32:12', '1', '549773', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1034', 'OB213856101006470', '陆月婷', '18626868509', '浙江省', '杭州市', '拱墅区', '教工路550号塘河新村22幢一单元404室', '', '', '0.40', '0', '0', '558', '21', '1', '2018-02-13 09:33:30', '2018-02-13 09:33:30', '1', '690003', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1035', 'OB213856329059217', '陆月婷', '18626868509', '浙江省', '杭州市', '拱墅区', '教工路550号塘河新村22幢一单元404室', '', '', '1.00', '0', '0', '500', '21', '1', '2018-02-13 09:33:52', '2018-02-13 09:33:52', '1', '297381', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1036', 'OB213889541862153', '梅珏', '15257265520', '浙江省', '湖州市', '安吉县', '下扇新村56号', '', '', '0.00', '0', '0', '3644', '21', '0', '2018-02-13 10:29:14', '2018-02-13 10:29:14', '1', '820227', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1037', 'OB213889757836461', '赵浪', '13958045488', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.50', '0', '0', '305', '21', '1', '2018-02-13 10:29:35', '2018-02-13 10:29:35', '1', '345436', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1038', 'OB213891425886089', '梅珏', '15257265520', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼9楼前台', '', '', '0.20', '0', '0', '1490', '21', '1', '2018-02-13 10:32:22', '2018-02-13 10:32:22', '1', '402767', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1039', 'OB213891781271606', '梅珏', '15257265520', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼9楼前台', '', '', '0.46', '0', '0', '318', '21', '1', '2018-02-13 10:32:58', '2018-02-13 10:32:58', '1', '161461', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1040', 'OB213892105317969', '梅珏', '15257265520', '浙江省', '湖州市', '安吉县', '下扇新村56号', '', '', '1.50', '800', '0', '128', '21', '1', '2018-02-13 10:33:30', '2018-02-13 10:33:30', '1', '579128', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1041', 'OB213892372442438', '梅珏', '15257265520', '浙江省', '湖州市', '安吉县', '下扇新村56号', '', '', '4.50', '0', '0', '384', '21', '1', '2018-02-13 10:33:57', '2018-02-13 10:33:57', '1', '802478', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1042', 'OB213892646442480', '梅珏', '15257265520', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼9楼前台', '', '', '0.03', '800', '0', '186', '21', '1', '2018-02-13 10:34:24', '2018-02-13 10:34:24', '1', '639271', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1043', 'OB213893356397016', '梅珏', '15257265520', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼9楼前台', '', '', '0.00', '0', '0', '354', '21', '0', '2018-02-13 10:35:35', '2018-02-13 10:35:35', '1', '426627', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1044', 'OB213895142521790', '阿宁', '15967248401', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.40', '0', '0', '558', '21', '1', '2018-02-13 10:38:34', '2018-02-13 10:38:34', '1', '269217', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1045', 'OB213895289081863', '梅珏', '15257265520', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼9楼前台', '', '', '0.40', '0', '0', '558', '21', '1', '2018-02-13 10:38:48', '2018-02-13 10:38:48', '1', '385720', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1046', 'OB213895471813834', '阿宁', '15967248401', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '1.00', '0', '0', '1260', '21', '1', '2018-02-13 10:39:07', '2018-02-13 10:39:07', '1', '109413', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1047', 'OB213896282844672', '阿宁', '15967248401', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '3.00', '0', '0', '500', '21', '1', '2018-02-13 10:40:28', '2018-02-13 10:40:28', '1', '795467', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1048', 'OB213897363636827', '阿宁', '15967248401', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '3.00', '0', '0', '348', '21', '1', '2018-02-13 10:42:16', '2018-02-13 10:42:16', '1', '983757', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1049', 'OB213898418867272', '梅珏', '15257265520', '浙江省', '湖州市', '安吉县', '下扇新村56号', '', '', '0.00', '0', '0', '648', '21', '0', '2018-02-13 10:44:01', '2018-02-13 10:44:01', '1', '707492', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1050', 'OB213899467524094', '梅珏', '15257265520', '浙江省', '湖州市', '安吉县', '下扇新村56号', '', '', '0.00', '0', '0', '540', '21', '0', '2018-02-13 10:45:46', '2018-02-13 10:45:46', '1', '919605', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1051', 'OB213918171738738', '陈玉', '18857168998', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.00', '800', '0', '126', '21', '0', '2018-02-13 11:16:57', '2018-02-13 11:16:57', '1', '739569', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1052', 'OB213976218883887', '杨婷婷', '15990001218', '浙江省', '杭州市', '余杭区', '文一西路833号大华西溪风情二期58-2', '', '', '0.00', '0', '0', '500', '21', '0', '2018-02-13 12:53:41', '2018-02-13 12:53:41', '1', '351484', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1053', 'OB213980143578308', '黄凡芸', '13588859513', '浙江省', '杭州市', '西湖区', '文二西路丰潭路口世纪新城西区33幢704', '', '', '0.00', '0', '0', '2618', '21', '0', '2018-02-13 13:00:14', '2018-02-13 13:00:14', '1', '922094', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1054', 'OB213021085833663', '阿宁', '15967248401', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.50', '0', '0', '880', '21', '1', '2018-02-13 14:08:28', '2018-02-13 14:08:28', '1', '166264', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1055', 'OB213022069165016', '阿宁', '15967248401', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.00', '800', '0', '117', '21', '0', '2018-02-13 14:10:06', '2018-02-13 14:10:06', '1', '348920', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1056', 'OB213022417680403', '阿宁', '15967248401', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '0.25', '800', '0', '129', '21', '1', '2018-02-13 14:10:41', '2018-02-13 14:10:41', '1', '855559', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1057', 'OB213024676009018', '阿宁', '15967248401', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼7楼', '', '', '1.00', '800', '0', '110', '21', '1', '2018-02-13 14:14:27', '2018-02-13 14:14:27', '1', '430889', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1058', 'OB213026279957493', '马丽娟', '15856946309', '安徽省', '亳州市', '谯城区', '淝河镇武步口', '', '', '1.60', '0', '0', '356', '21', '1', '2018-02-13 14:17:07', '2018-02-13 14:17:07', '1', '319366', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1059', 'OB213180827826387', '叶开开', '18758405007', '浙江省', '宁波市', '慈溪市', '坎墩街道坎东村担山北路2100号', '', '', '0.00', '0', '0', '2980', '21', '0', '2018-02-13 18:34:42', '2018-02-13 18:34:42', '1', '988764', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1060', 'OB213182875055683', '叶开开', '18758405007', '浙江省', '宁波市', '慈溪市', '坎墩街道坎东村担山北路2100号', '', '', '0.20', '0', '0', '1490', '21', '1', '2018-02-13 18:38:07', '2018-02-13 18:38:07', '1', '499613', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1061', 'OB213183601020314', '叶开开', '18758405007', '浙江省', '宁波市', '慈溪市', '坎墩街道坎东村担山北路2100号', '', '', '0.20', '0', '0', '1490', '21', '1', '2018-02-13 18:39:20', '2018-02-13 18:39:20', '1', '431288', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1062', 'OB213302673166721', '王平', '13575454660', '浙江省', '杭州市', '西湖区', '三墩镇都市阳光华苑4幢1406', '', '', '0.50', '800', '0', '260', '21', '1', '2018-02-13 21:57:47', '2018-02-13 21:57:47', '1', '539567', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1063', 'OB213308536772311', '王平', '13575454660', '浙江省', '杭州市', '西湖区', '三墩镇都市阳光华苑4幢1406', '', '', '0.00', '0', '0', '1213', '21', '0', '2018-02-13 22:07:33', '2018-02-13 22:07:33', '1', '246999', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1064', 'OB213310232010096', '王平', '13575454660', '浙江省', '杭州市', '西湖区', '三墩镇都市阳光华苑4幢1406', '', '', '0.00', '0', '0', '343', '21', '0', '2018-02-13 22:10:23', '2018-02-13 22:10:23', '1', '506457', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1065', 'OB213311131377011', '王平', '13575454660', '浙江省', '杭州市', '西湖区', '三墩镇都市阳光华苑4幢1406', '', '', '0.00', '800', '0', '254', '21', '0', '2018-02-13 22:11:53', '2018-02-13 22:11:53', '1', '619179', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1066', 'OB213349151264594', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼七楼', '', '', '0.20', '0', '0', '1490', '21', '1', '2018-02-13 23:15:15', '2018-02-13 23:15:15', '1', '473217', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1067', 'OB213353119744752', '左美英', '13788737930', '广西壮族自治区', '桂林市', '恭城瑶族自治县', '栗木镇高岭村17号.', '', '', '2.50', '0', '0', '1518', '21', '1', '2018-02-13 23:21:51', '2018-02-13 23:21:51', '1', '658846', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1068', 'OB214778273982619', '杨洋', '15168383481', '浙江省', '杭州市', '西湖区', '政苑小区c区', '', '', '0.00', '0', '0', '3638', '21', '0', '2018-02-14 11:10:27', '2018-02-14 11:10:27', '1', '834696', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1069', 'OB214780873226857', '杨洋', '15168383481', '浙江省', '杭州市', '西湖区', '政苑小区c区', '', '', '0.80', '0', '0', '1116', '21', '1', '2018-02-14 11:14:47', '2018-02-14 11:14:47', '1', '767375', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1070', 'OB214785353285861', '杨洋', '15168383481', '浙江省', '杭州市', '西湖区', '政苑小区c区', '', '', '1.00', '0', '0', '500', '21', '1', '2018-02-14 11:22:15', '2018-02-14 11:22:15', '1', '715673', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1071', 'OB214785598566055', '杨洋', '15168383481', '浙江省', '杭州市', '西湖区', '政苑小区c区', '', '', '0.50', '0', '0', '398', '21', '1', '2018-02-14 11:22:39', '2018-02-14 11:22:39', '1', '509876', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1072', 'OB214785928668047', '杨洋', '15168383481', '浙江省', '杭州市', '西湖区', '政苑小区c区', '', '', '2.50', '0', '0', '500', '21', '1', '2018-02-14 11:23:12', '2018-02-14 11:23:12', '1', '994875', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1073', 'OB214786249264376', '杨洋', '15168383481', '浙江省', '杭州市', '西湖区', '政苑小区c区', '', '', '1.00', '0', '0', '498', '21', '1', '2018-02-14 11:23:44', '2018-02-14 11:23:44', '1', '463909', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1074', 'OB214789976252244', '杨洋', '15168383481', '浙江省', '杭州市', '西湖区', '政苑小区c区', '', '', '2.00', '0', '0', '656', '21', '1', '2018-02-14 11:29:57', '2018-02-14 11:29:57', '1', '746257', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1075', 'OB214795475461118', '杨洋', '15168383481', '浙江省', '杭州市', '西湖区', '政苑小区c区', '', '', '5.00', '0', '0', '458', '21', '1', '2018-02-14 11:39:07', '2018-02-14 11:39:07', '1', '717475', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1076', 'OB214040834661559', '雷晓燕', '15889075102', '山西省', '运城市', '永济市', '南转盘豪鑫苑东二号', '', '', '0.00', '0', '0', '3646', '21', '0', '2018-02-14 18:28:03', '2018-02-14 18:28:03', '1', '871870', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1077', 'OB214043436181697', '陈曼曼', '17816099232', '浙江省', '杭州市', '西湖区', '留下街道西溪路896号万向职业学院', '', '', '0.00', '0', '0', '2987', '21', '0', '2018-02-14 18:32:23', '2018-02-14 18:32:23', '2', '417190', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1078', 'OB218676441005918', '马宏宇', '13966518760', '安徽省', '亳州市', '涡阳县', '阳光花园一期五栋二单元601', '', '', '0.00', '0', '0', '1490', '21', '0', '2018-02-18 23:27:24', '2018-02-18 23:27:24', '1', '726080', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1079', 'OB218677549872056', '马宏宇', '13966518760', '安徽省', '亳州市', '涡阳县', '阳光花园一期五栋二单元601', '', '', '0.20', '0', '0', '1490', '21', '1', '2018-02-18 23:29:14', '2018-02-18 23:29:14', '1', '545984', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1080', 'OB219876801412009', '马丽娟', '15856946309', '安徽省', '亳州市', '谯城区', '淝河镇武步口', '', '', '0.40', '0', '0', '1539', '21', '1', '2018-02-19 05:01:20', '2018-02-19 05:01:20', '1', '354436', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1081', 'OB219876967737319', '马丽娟', '15856946309', '安徽省', '亳州市', '谯城区', '淝河镇武步口', '', '', '0.40', '0', '0', '1539', '21', '1', '2018-02-19 05:01:36', '2018-02-19 05:01:36', '1', '210998', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1082', 'OB219145295884672', '马丽娟', '15856946309', '安徽省', '亳州市', '谯城区', '淝河镇武步口', '', '', '2.50', '0', '0', '500', '21', '1', '2018-02-19 12:28:49', '2018-02-19 12:28:49', '1', '501049', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1083', 'OB219295356723126', '马丽娟', '15856946309', '安徽省', '亳州市', '谯城区', '淝河镇武步口', '', '', '0.00', '0', '0', '592', '21', '0', '2018-02-19 16:38:55', '2018-02-19 16:38:55', '1', '917092', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1084', 'OB219299330604844', '马丽娟', '15856946309', '安徽省', '亳州市', '谯城区', '淝河镇武步口', '', '', '0.00', '800', '0', '294', '21', '0', '2018-02-19 16:45:33', '2018-02-19 16:45:33', '1', '125099', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1085', 'OB219452676872521', '金晶', '13868234935', '浙江省', '杭州市', '余杭区', '教工宿舍通济路7-1-402', '', '', '0.00', '0', '0', '3592', '21', '0', '2018-02-19 21:01:07', '2018-02-19 21:01:07', '1', '553967', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1086', 'OB220415831809366', '黄月梅', '15656876775', '安徽省', '亳州市', '涡阳县', '三星大道化肥厂家属院对面体育彩票店', '', '', '0.20', '0', '0', '1490', '21', '1', '2018-02-20 23:46:23', '2018-02-20 23:46:23', '1', '599691', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1087', 'OB221036446101784', '陈佼佼', '15967151109', '浙江省', '杭州市', '上城区', '望江家园东园18幢1单元601', '', '', '0.00', '0', '0', '3649', '21', '0', '2018-02-21 17:00:44', '2018-02-21 17:00:44', '1', '570441', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1088', 'OB221189681960530', '韩磊', '13731883252', '安徽省', '宣城市', '宣州区', '飞彩办事处希达小区c12幢506室', '', '', '0.50', '800', '0', '168', '21', '1', '2018-02-21 21:16:08', '2018-02-21 21:16:08', '1', '939416', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1089', 'OB221214777972207', '勼爷', '18969090205', '浙江省', '杭州市', '江干区', '同协雅苑4-1-1301', '', '', '1.50', '0', '0', '0', '38', '2', '2018-02-21 21:57:57', '2018-02-21 21:57:57', '1', '834865', '2944', '1');
INSERT INTO `tb_goods_order` VALUES ('1090', 'OB222722740259969', '阿丿', '18768231555', '浙江省', '杭州市', '滨江区', '滨康路228号万福中心A座9楼', '', '', '4.50', '0', '0', '1664', '21', '1', '2018-02-22 12:04:34', '2018-02-23 10:27:46', '2', '525258', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('1091', 'OB222121601272201', '陈韩', '18767127845', '浙江省', '杭州市', '江干区', '三里家园二小区5幢1单元1402', '', '', '0.00', '0', '0', '3659', '21', '0', '2018-02-22 23:09:20', '2018-02-22 23:09:20', '1', '182053', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1092', 'OB223247271725538', '万军', '18957102153', '浙江省', '杭州市', '西湖区', '香樟公寓42幢一单元101室', '', '', '0.00', '0', '0', '10169', '21', '0', '2018-02-23 02:38:47', '2018-02-23 02:38:47', '1', '950932', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1093', 'OB223501935808446', '黄凡芸', '13588859513', '浙江省', '杭州市', '西湖区', '文二西路丰潭路口世纪新城西区33幢704', '', '', '1.00', '0', '0', '460', '21', '1', '2018-02-23 09:43:13', '2018-02-23 09:43:13', '1', '725739', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1094', 'OB223502105390116', '余雪芬', '18368167368', '浙江省', '杭州市', '滨江区', '自提', '1', '内部兑换', '2.25', '0', '0', '832', '21', '1', '2018-02-23 09:43:30', '2018-02-23 10:06:27', '1', '332374', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('1095', 'OB223502807796084', '余雪芬', '18368167368', '浙江省', '杭州市', '滨江区', '自提', '1', '内部兑换', '2.25', '0', '0', '3300', '21', '1', '2018-02-23 09:44:40', '2018-02-23 10:06:17', '1', '669382', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('1096', 'OB223505277501333', '汪小艺', '15990049499', '浙江省', '杭州市', '滨江区', '万福中心', '', '', '0.00', '0', '0', '6092', '21', '0', '2018-02-23 09:48:47', '2018-02-24 15:54:48', '2', '410975', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('1097', 'OB223575693582185', '陆敏凯', '15306525632', '浙江省', '杭州市', '市辖区', '万福', '2', '内部兑换', '14.00', '0', '0', '3588', '21', '1', '2018-02-23 11:46:09', '2018-02-23 18:16:59', '1', '168965', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('1098', 'OB223578385775273', '杨莎莎', '13567100751', '浙江省', '杭州市', '滨江区', '滨康路228号', '1', '内部兑换', '14.00', '0', '0', '3588', '21', '1', '2018-02-23 11:50:38', '2018-02-24 08:50:06', '1', '614775', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('1099', 'OB223589750644066', '廖水秀', '15067143639', '浙江省', '杭州市', '滨江区', '滨康路228号万福中心A座9楼', '1', '内部兑换', '28.00', '0', '0', '7176', '21', '1', '2018-02-23 12:09:35', '2018-02-23 18:12:32', '1', '262967', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('1100', 'OB223641359680828', '何成丽', '18658888762', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店9楼', '', '', '0.00', '0', '0', '4470', '21', '0', '2018-02-23 13:35:36', '2018-02-23 13:35:36', '1', '793262', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1101', 'OB223642643707446', '何成丽', '18658888762', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店9楼', '', '', '0.00', '0', '0', '4470', '21', '0', '2018-02-23 13:37:44', '2018-02-23 13:37:44', '1', '699394', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1102', 'OB223642973505280', '何成丽', '18658888762', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店9楼', '', '', '0.40', '0', '0', '2980', '21', '1', '2018-02-23 13:38:17', '2018-02-23 13:38:17', '1', '113247', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1103', 'OB223643259463734', '何成丽', '18658888762', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店9楼', '', '', '0.20', '0', '0', '1490', '21', '1', '2018-02-23 13:38:45', '2018-02-23 13:38:45', '1', '893602', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1104', 'OB223735926533136', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '14.00', '0', '0', '3588', '21', '1', '2018-02-23 16:13:12', '2018-02-23 16:14:07', '2', '482503', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1105', 'OB223807254414858', '覃文豪', '13588353105', '浙江省', '杭州市', '西湖区', '古墩路71号修舍健康酒店前台', '', '', '0.40', '0', '0', '558', '21', '1', '2018-02-23 18:12:05', '2018-02-23 18:12:05', '1', '979311', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1106', 'OB223881831132445', '谢冬梅', '17682347779', '浙江省', '杭州市', '滨江区', '中南公寓602', '', '', '0.20', '0', '0', '1490', '21', '1', '2018-02-23 20:16:23', '2018-02-23 20:16:23', '1', '655521', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1107', 'OB224274931226023', '何成丽', '18658888762', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店9楼', '', '', '8.00', '0', '0', '5260', '21', '1', '2018-02-24 07:11:33', '2018-02-24 07:11:33', '1', '859189', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1108', 'OB224279899813702', '管兴标', '13646753808', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店9楼', '', '', '8.00', '0', '0', '5260', '21', '1', '2018-02-24 07:19:49', '2018-02-24 07:19:49', '1', '660798', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1109', 'OB224351049205339', '田媛媛', '13606631008', '浙江省', '杭州市', '萧山区', '瓜沥镇三盈村一组万盈路10号', '', '', '4.00', '0', '0', '3980', '21', '1', '2018-02-24 09:18:24', '2018-02-24 09:18:24', '1', '836652', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1110', 'OB224359153790527', '田媛媛', '13606631008', '浙江省', '杭州市', '萧山区', '瓜沥镇三盈村一组万盈路10号', '', '', '0.00', '0', '0', '3666', '21', '0', '2018-02-24 09:31:55', '2018-02-24 09:31:55', '1', '402786', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1111', 'OB224360853878395', '田媛媛', '13606631008', '浙江省', '杭州市', '萧山区', '瓜沥镇三盈村一组万盈路10号', '', '', '0.00', '0', '0', '3647', '21', '0', '2018-02-24 09:34:45', '2018-02-24 09:34:45', '1', '754486', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1112', 'OB224413635806306', '王迪帆', '13958174929', '浙江省', '杭州市', '江干区', '闸弄口新村10幢2单元402', '', '', '0.00', '0', '0', '899', '21', '0', '2018-02-24 11:02:43', '2018-02-24 11:02:43', '1', '941039', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1113', 'OB224441593894064', '刘金霞', '18968070480', '浙江省', '杭州市', '拱墅区', '都市水乡水滟苑103室', '', '', '0.00', '0', '0', '585', '21', '0', '2018-02-24 11:49:19', '2018-02-24 11:49:19', '1', '896926', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1114', 'OB224449830796746', '朱小燕', '18758159857', '浙江省', '杭州市', '西湖区', '北山街32-33号保俶塔前山路3号小巷酒窖', '', '', '0.00', '800', '0', '225', '21', '0', '2018-02-24 12:03:03', '2018-02-24 12:03:03', '1', '258737', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1115', 'OB224463164455998', '刘金霞', '18968070480', '浙江省', '杭州市', '拱墅区', '都市水乡水滟苑103室', '', '', '0.00', '0', '0', '1130', '21', '0', '2018-02-24 12:25:16', '2018-02-24 12:25:16', '1', '397026', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1116', 'OB224463704072503', '刘金霞', '18968070480', '浙江省', '杭州市', '拱墅区', '都市水乡水滟苑103室', '', '', '1.00', '0', '0', '500', '21', '1', '2018-02-24 12:26:10', '2018-02-24 12:26:10', '1', '804664', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1117', 'OB224486805191173', '管兴标', '13646753808', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店9楼', '', '', '2.00', '0', '0', '1380', '21', '1', '2018-02-24 13:04:40', '2018-02-24 13:04:40', '1', '505980', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1118', 'OB224517053316021', '黄腾飞', '17681855353', '浙江省', '杭州市', '滨江区', '万福中心A座', '1', '内部兑换', '14.00', '0', '0', '3588', '21', '1', '2018-02-24 13:55:05', '2018-02-26 08:44:35', '1', '147954', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('1119', 'OB224518732426173', '梁放', '15306530676', '浙江省', '杭州市', '滨江区', '滨康路228号万福中心A座9楼', '', '', '14.00', '0', '0', '3588', '21', '1', '2018-02-24 13:57:53', '2018-02-24 13:57:53', '1', '483725', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1120', 'OB224540863568994', '梁QQ', '15306530676', '浙江省', '杭州市', '滨江区', '滨康路228号万福中心A座9楼', '', '', '0.00', '0', '0', '345', '21', '0', '2018-02-24 14:34:46', '2018-02-24 14:34:46', '1', '815432', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1121', 'OB224543011036614', '刘金霞', '18968070480', '浙江省', '杭州市', '拱墅区', '都市水乡水滟苑103室', '', '', '0.50', '0', '0', '1280', '21', '1', '2018-02-24 14:38:21', '2018-02-24 14:38:21', '1', '356211', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1122', 'OB224545711901320', '汪佳丽', '13588822649', '浙江省', '绍兴市', '柯桥区', '兰亭镇兰渚山薛家坝', '', '', '1.00', '0', '0', '500', '21', '1', '2018-02-24 14:42:51', '2018-02-24 14:42:51', '1', '643630', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1123', 'OB224548909951332', '王生满', '18757213928', '安徽省', '池州市', '贵池区', '墩上办事处社区居委会', '', '', '0.00', '0', '0', '10245', '21', '0', '2018-02-24 14:48:11', '2018-02-24 14:48:11', '1', '102424', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1124', 'OB224549714814443', '刘金霞', '18968070480', '浙江省', '杭州市', '拱墅区', '都市水乡水滟苑103室', '', '', '1.00', '0', '0', '460', '21', '1', '2018-02-24 14:49:31', '2018-02-24 14:49:31', '1', '175325', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1125', 'OB224550043929096', '汪佳丽', '13588822649', '浙江省', '绍兴市', '柯桥区', '兰亭镇兰渚山薛家坝', '', '', '0.50', '0', '0', '398', '21', '1', '2018-02-24 14:50:04', '2018-02-24 14:50:04', '1', '864100', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1126', 'OB224550293386187', '吴庆', '13919761296', '甘肃省', '兰州市', '城关区', '拱星墩街道焦家湾南路225号中国兵器集团北方机械厂', '', '', '0.00', '0', '0', '3380', '21', '0', '2018-02-24 14:50:29', '2018-02-24 14:50:29', '1', '405009', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1127', 'OB224554659271453', '刘金霞', '18968070480', '浙江省', '杭州市', '拱墅区', '都市水乡水滟苑103室', '', '', '0.20', '0', '0', '1980', '21', '1', '2018-02-24 14:57:45', '2018-02-24 14:57:45', '1', '145091', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1128', 'OB224556379336434', '刘金霞', '18968070480', '浙江省', '杭州市', '西湖区', '古墩路71号修正大厦9楼', '', '', '0.00', '0', '0', '571', '21', '0', '2018-02-24 15:00:38', '2018-02-24 15:00:38', '1', '216377', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1129', 'OB224556650781620', '汪佳丽', '13588822649', '浙江省', '绍兴市', '柯桥区', '兰亭镇兰渚山薛家坝', '', '', '50.00', '0', '0', '16000', '21', '1', '2018-02-24 15:01:05', '2018-02-24 15:01:05', '1', '324138', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1130', 'OB224564406245029', '刘金霞', '18968070480', '浙江省', '杭州市', '西湖区', '古墩路71号修正大厦9楼', '', '', '0.50', '0', '0', '305', '21', '1', '2018-02-24 15:14:00', '2018-02-24 15:14:00', '1', '112687', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1131', 'OB224571486308690', '蒋照', '13588822649', '浙江省', '杭州市', '西湖区', '古墩路71号修正大厦9楼', '', '', '2.00', '0', '0', '1760', '21', '1', '2018-02-24 15:25:48', '2018-02-24 15:25:48', '1', '553221', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1132', 'OB224572531546854', '何铖丽', '18658888762', '浙江省', '杭州市', '西湖区', '古墩路71号修正大厦9楼', '', '', '0.50', '0', '0', '305', '21', '1', '2018-02-24 15:27:33', '2018-02-24 15:27:33', '1', '966957', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1133', 'OB224574270963928', '梁QQ', '15306530676', '浙江省', '杭州市', '滨江区', '滨康路228号万福中心A座9楼', '', '', '0.00', '0', '0', '345', '21', '0', '2018-02-24 15:30:27', '2018-02-24 15:30:27', '1', '312389', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1134', 'OB224575367658212', '梁QQ', '15306530676', '浙江省', '杭州市', '滨江区', '滨康路228号万福中心A座9楼', '', '', '0.00', '800', '0', '35', '21', '0', '2018-02-24 15:32:16', '2018-02-24 15:32:16', '1', '327545', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1135', 'OB224578148147174', '何铖丽', '18658888762', '浙江省', '杭州市', '西湖区', '古墩路71号修正大厦9楼', '', '', '0.00', '0', '0', '1946', '21', '0', '2018-02-24 15:36:55', '2018-02-24 15:36:55', '1', '533825', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1136', 'OB224587020726526', '管兴标', '13646753808', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店9楼', '', '', '0.50', '0', '0', '1280', '21', '1', '2018-02-24 15:51:42', '2018-02-24 15:51:42', '1', '480445', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1137', 'OB224588056475453', '管兴标', '13646753808', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店9楼', '', '', '2.50', '0', '0', '1518', '21', '1', '2018-02-24 15:53:25', '2018-02-24 15:53:25', '1', '872663', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1138', 'OB224591183583176', '管兴标', '13646753808', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店9楼', '', '', '0.00', '800', '0', '267', '21', '0', '2018-02-24 15:58:38', '2018-02-24 15:58:38', '1', '557721', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1139', 'OB224626529931829', '莎莎', '13968005769', '浙江省', '杭州市', '滨江区', '迎春路迎春小区一幢二单元502', '', '', '0.00', '0', '0', '3786', '21', '0', '2018-02-24 16:57:33', '2018-02-24 16:57:33', '1', '108533', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1140', 'OB224631715330041', '莎莎', '13968005769', '浙江省', '杭州市', '滨江区', '迎春路迎春小区一幢二单元502', '', '', '0.00', '0', '0', '3664', '21', '0', '2018-02-24 17:06:11', '2018-02-24 17:06:11', '1', '153652', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1141', 'OB224640002845736', '莎莎', '13968005769', '浙江省', '杭州市', '滨江区', '迎春路迎春小区一幢二单元502', '', '', '0.00', '0', '0', '3635', '21', '0', '2018-02-24 17:20:00', '2018-02-24 17:20:00', '1', '890949', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1142', 'OB224711169533460', '可乐', '18268139210', '浙江省', '杭州市', '余杭区', '乔司镇永西村二组60号2楼', '', '', '0.00', '0', '0', '760', '21', '0', '2018-02-24 19:18:37', '2018-02-24 19:18:37', '1', '639536', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1143', 'OB224732342474902', '谈金梅', '15158115009', '浙江省', '杭州市', '余杭区', '浙江省杭州市余杭区中泰街道幸福河社区恒厚阳光城13幢2单元301室光', '', '', '0.50', '0', '0', '880', '21', '1', '2018-02-24 19:53:54', '2018-02-24 19:53:54', '1', '681412', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1144', 'OB224735220141880', '谈金梅', '15158115009', '浙江省', '杭州市', '余杭区', '浙江省杭州市余杭区中泰街道幸福河社区恒厚阳光城13幢2单元301室光', '', '', '1.40', '0', '0', '1179', '21', '1', '2018-02-24 19:58:42', '2018-02-24 19:58:42', '1', '560312', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1145', 'OB224740187609032', '谈金梅', '15158115009', '浙江省', '杭州市', '余杭区', '浙江省杭州市余杭区中泰街道幸福河社区恒厚阳光城13幢2单元301室光', '', '', '1.20', '0', '0', '399', '21', '1', '2018-02-24 20:06:58', '2018-02-24 20:06:58', '1', '965019', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1146', 'OB224756867735597', '琴琴', '13970419135', '江西省', '抚州市', '临川区', '瑶坪南路城中雅苑5栋501室', '7', '539441038226', '0.00', '0', '0', '2268', '21', '0', '2018-02-24 20:34:46', '2018-02-26 08:56:53', '1', '439930', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('1147', 'OB224762999825331', '于丽娜', '13460977827', '河南省', '安阳市', '汤阴县', '宜沟镇圆通快递旁边华中装饰', '7', '539441038206', '0.00', '0', '0', '1000', '21', '0', '2018-02-24 20:45:00', '2018-02-26 08:56:35', '1', '637589', '0', '102');
INSERT INTO `tb_goods_order` VALUES ('1148', 'OB224763518325190', '管兴标', '13646753808', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店9楼', '', '', '1.00', '0', '0', '500', '21', '1', '2018-02-24 20:45:51', '2018-02-24 20:45:51', '1', '665851', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1149', 'OB224768670951327', '郑宇', '15105817925', '浙江省', '杭州市', '拱墅区', '信义坊1幢2单元102室', '', '', '1.00', '0', '0', '3698', '21', '1', '2018-02-24 20:54:27', '2018-02-24 20:54:27', '1', '126222', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1150', 'OB224773079118470', '郑宇', '15105817925', '浙江省', '杭州市', '拱墅区', '信义坊1幢2单元102室', '', '', '1.50', '0', '0', '799', '21', '1', '2018-02-24 21:01:47', '2018-02-24 21:01:47', '1', '582954', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1151', 'OB224783091331926', '管兴标', '13646753808', '浙江省', '杭州市', '西湖区', '古墩路71号修舍酒店9楼', '', '', '0.00', '0', '0', '6597', '21', '0', '2018-02-24 21:18:29', '2018-02-24 21:18:29', '1', '750106', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1152', 'OB224785195703833', '黄月梅', '15656876775', '安徽省', '亳州市', '涡阳县', '三星大道化肥厂家属院对面体育彩票店', '', '', '0.40', '800', '0', '150', '21', '1', '2018-02-24 21:21:59', '2018-02-24 21:21:59', '1', '287155', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1153', 'OB224785311826957', '黄月梅', '15656876775', '安徽省', '亳州市', '涡阳县', '三星大道化肥厂家属院对面体育彩票店', '', '', '0.40', '800', '0', '150', '21', '1', '2018-02-24 21:22:11', '2018-02-24 21:22:11', '1', '278910', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1154', 'OB224785786972006', '黄月梅', '15656876775', '安徽省', '亳州市', '涡阳县', '三星大道化肥厂家属院对面体育彩票店', '', '', '0.40', '800', '0', '150', '21', '1', '2018-02-24 21:22:58', '2018-02-24 21:22:58', '1', '237728', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1155', 'OB224814633259645', '马洪刚', '13819123785', '浙江省', '杭州市', '西湖区', '三墩镇金厦公寓5幢2单元202室', '', '', '1.00', '0', '0', '3698', '21', '1', '2018-02-24 22:11:03', '2018-02-24 22:11:03', '1', '581977', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1156', 'OB224852240351152', '吴烨', '13567145406', '浙江省', '杭州市', '萧山区', '城厢镇文澜苑5幢2单元602室', '', '', '0.00', '0', '0', '3669', '21', '0', '2018-02-24 23:13:44', '2018-02-24 23:13:44', '1', '831734', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1157', 'OB225048198316523', '勼爷', '18969090205', '浙江省', '杭州市', '江干区', '同协雅苑4-1-1301', '', '', '0.50', '800', '0', '280', '21', '1', '2018-02-25 04:40:19', '2018-02-25 04:40:19', '1', '961217', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1158', 'OB225049383404232', '勼爷', '18969090205', '浙江省', '杭州市', '江干区', '同协雅苑4-1-1301', '', '', '2.50', '0', '0', '1630', '21', '1', '2018-02-25 04:42:18', '2018-02-25 04:42:18', '1', '817038', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1159', 'OB225260331622372', '麻忠贤', '15058036746', '浙江省', '杭州市', '萧山区', '杭州场景科技谷运营管理有限公司', '', '', '0.00', '0', '0', '1992', '21', '0', '2018-02-25 10:33:53', '2018-02-25 10:33:53', '2', '957478', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1160', 'OB225303220243223', '谢晨涛', '18020117257', '浙江省', '杭州市', '萧山区', '建设三路733号中国场景科技谷', '', '', '0.00', '0', '0', '5204', '21', '0', '2018-02-25 11:45:22', '2018-02-25 11:45:22', '1', '570816', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1161', 'OB225303389495752', '孙松', '15268124366', '浙江省', '杭州市', '余杭区', '良渚街道北软路越秀星汇尚城7幢501', '', '', '0.00', '0', '0', '1991', '21', '0', '2018-02-25 11:45:39', '2018-02-25 11:45:39', '1', '973072', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1162', 'OB225315983983807', '谢晨涛', '18020117257', '浙江省', '杭州市', '萧山区', '建设三路733号中国场景科技谷', '', '', '0.00', '0', '0', '2280', '21', '0', '2018-02-25 12:06:38', '2018-02-25 12:06:38', '1', '521760', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1163', 'OB225316257905143', '谢晨涛', '18020117257', '浙江省', '杭州市', '萧山区', '建设三路733号中国场景科技谷', '', '', '0.20', '0', '0', '2280', '21', '1', '2018-02-25 12:07:05', '2018-02-25 12:07:05', '1', '855032', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1164', 'OB225316785093569', '谢晨涛', '18020117257', '浙江省', '杭州市', '萧山区', '建设三路733号中国场景科技谷', '', '', '0.50', '800', '0', '239', '21', '1', '2018-02-25 12:07:58', '2018-02-25 12:07:58', '1', '694518', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1165', 'OB225316975462047', '谢晨涛', '18020117257', '浙江省', '杭州市', '萧山区', '建设三路733号中国场景科技谷', '', '', '0.50', '800', '0', '239', '21', '1', '2018-02-25 12:08:17', '2018-02-25 12:08:17', '1', '405220', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1166', 'OB225317117615113', '谢晨涛', '18020117257', '浙江省', '杭州市', '萧山区', '建设三路733号中国场景科技谷', '', '', '0.50', '0', '0', '239', '21', '1', '2018-02-25 12:08:31', '2018-02-25 12:08:31', '2', '785017', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1167', 'OB225317629735619', '谢晨涛', '18020117257', '浙江省', '杭州市', '萧山区', '建设三路733号中国场景科技谷', '', '', '0.00', '0', '0', '598', '21', '0', '2018-02-25 12:09:23', '2018-02-25 12:09:23', '2', '312605', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1168', 'OB225319544835731', '谢晨涛', '18020117257', '浙江省', '杭州市', '萧山区', '建设三路733号中国场景科技谷', '', '', '0.00', '0', '0', '2087', '21', '0', '2018-02-25 12:12:34', '2018-02-25 12:12:34', '2', '961563', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1169', 'OB225322153928262', '焦雪丽', '18758899164', '浙江省', '杭州市', '西湖区', '古荡新村东区10幢3单元603', '', '', '0.00', '0', '0', '500', '21', '0', '2018-02-25 12:16:55', '2018-02-25 12:16:55', '1', '905336', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1170', 'OB225331780530442', '刘金霞', '18968070480', '浙江省', '杭州市', '西湖区', '古墩路71号修正大厦9楼', '', '', '0.20', '0', '0', '1980', '21', '1', '2018-02-25 12:32:58', '2018-02-25 12:32:58', '1', '761762', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1171', 'OB225359818772997', '张劲峰', '13958109123', '浙江省', '杭州市', '上城区', '紫阳街道金狮苑6-1-502', '', '', '25.00', '0', '0', '1140', '21', '1', '2018-02-25 13:19:41', '2018-02-25 13:19:41', '1', '997934', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1172', 'OB225479611550503', '张劲峰', '13958109123', '浙江省', '杭州市', '上城区', '紫阳街道金狮苑6-1-502', '', '', '0.00', '0', '0', '7276', '21', '0', '2018-02-25 16:39:21', '2018-02-25 16:39:21', '1', '786828', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1173', 'OB225553296431442', '朱晓东', '18210752789', '浙江省', '杭州市', '下城区', '焦家里1弄文源电商创意产业园2幢113室客如云股份有限公司l', '', '', '0.50', '0', '0', '880', '21', '1', '2018-02-25 18:42:09', '2018-02-25 18:42:09', '1', '588437', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1174', 'OB225577769005466', '沈巧', '15824408123', '浙江省', '杭州市', '西湖区', '修舍酒店前台古墩路71号', '', '', '4.00', '0', '0', '3380', '21', '1', '2018-02-25 19:22:56', '2018-02-25 19:22:56', '1', '281860', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1175', 'OB225586161899940', '阴玲玲', '15988121971', '浙江省', '杭州市', '西湖区', '古荡街道益乐新村北五区74号', '', '', '4.00', '0', '0', '3380', '21', '1', '2018-02-25 19:36:56', '2018-02-25 19:36:56', '1', '168989', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1176', 'OB225658407696390', '吴烨', '13567145406', '浙江省', '杭州市', '萧山区', '城厢镇文澜苑5幢2单元602室', '', '', '0.00', '0', '0', '3655', '21', '0', '2018-02-25 21:37:20', '2018-02-25 21:37:20', '1', '767828', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1177', 'OB225720814880806', '黄开会', '13865690024', '浙江省', '杭州市', '萧山区', '新塘街道大通路96号合丰商务楼', '', '', '0.00', '0', '0', '1500', '21', '0', '2018-02-25 23:21:21', '2018-02-25 23:21:21', '1', '743329', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1178', 'OB226070018790369', '张静', '13735865245', '浙江省', '杭州市', '拱墅区', '祥符街道 阳光郡9栋2702', '', '', '1.00', '0', '0', '3698', '21', '1', '2018-02-26 09:03:21', '2018-02-26 09:03:21', '1', '795982', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1179', 'OB226071414024376', '张静', '13735865245', '浙江省', '杭州市', '拱墅区', '祥符街道 阳光郡9栋2702', '', '', '1.00', '0', '0', '3698', '21', '1', '2018-02-26 09:05:41', '2018-02-26 09:05:41', '1', '264920', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1180', 'OB226133026496454', '肖林玉', '13631786034', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼9楼', '', '', '0.00', '0', '0', '3653', '21', '0', '2018-02-26 10:48:23', '2018-02-26 10:48:23', '1', '140023', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1181', 'OB226141736507081', '肖林玉', '13631786034', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼9楼', '', '', '0.00', '0', '0', '3656', '21', '0', '2018-02-26 11:02:54', '2018-02-26 11:02:54', '1', '803452', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1182', 'OB226144147032929', '肖林玉', '13631786034', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼9楼', '', '', '0.00', '0', '0', '1655', '21', '0', '2018-02-26 11:06:55', '2018-02-26 11:06:55', '1', '480973', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1183', 'OB226145556091532', '肖林玉', '13631786034', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼9楼', '', '', '0.00', '0', '0', '455', '21', '0', '2018-02-26 11:09:15', '2018-02-26 11:09:15', '1', '948638', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1184', 'OB226147250215696', '肖林玉', '13631786034', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼9楼', '', '', '0.00', '0', '0', '982', '21', '0', '2018-02-26 11:12:05', '2018-02-26 11:12:05', '1', '386366', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1185', 'OB226149880545897', '肖林玉', '13631786034', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼9楼', '', '', '0.00', '0', '0', '1262', '21', '0', '2018-02-26 11:16:28', '2018-02-26 11:16:28', '1', '863114', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1186', 'OB226152681472345', '肖林玉', '13631786034', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼9楼', '', '', '0.00', '0', '0', '1405', '21', '0', '2018-02-26 11:21:08', '2018-02-26 11:21:08', '1', '974565', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1187', 'OB226173695835175', '孙涛', '13735568082', '浙江省', '杭州市', '拱墅区', '瓜山东苑160号', '', '', '1.00', '0', '0', '3698', '21', '1', '2018-02-26 11:56:09', '2018-02-26 11:56:09', '1', '518086', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1188', 'OB226177921311665', '段永泉', '15168109543', '浙江省', '杭州市', '西湖区', '留下街道屏峰新村272号', '', '', '0.00', '0', '0', '2441', '21', '0', '2018-02-26 12:03:12', '2018-02-26 12:03:12', '1', '538486', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1189', 'OB226217224539173', '任四香', '15256345712', '安徽省', '宣城市', '旌德县', '三溪镇大礼堂小学附近', '', '', '0.00', '800', '0', '208', '21', '0', '2018-02-26 13:08:42', '2018-02-26 13:08:42', '1', '988690', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1190', 'OB226304529150593', '姜虹', '13429691406', '浙江省', '杭州市', '江干区', '华家池13号1幢1单元301室', '', '', '0.00', '800', '0', '3637', '21', '0', '2018-02-26 15:34:13', '2018-02-26 15:34:13', '1', '410100', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1191', 'OB226306013284283', '姜虹', '13429691406', '浙江省', '杭州市', '江干区', '华家池13号1幢1单元301室', '', '', '0.00', '800', '0', '3637', '21', '0', '2018-02-26 15:36:41', '2018-02-26 15:36:41', '1', '874737', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1192', 'OB226307827486040', '姜虹', '13429691406', '浙江省', '杭州市', '江干区', '华家池13号1幢1单元301室', '', '', '0.00', '800', '0', '3637', '21', '0', '2018-02-26 15:39:42', '2018-02-26 15:39:42', '1', '457858', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1193', 'OB226308011162085', '陈聪', '15757187237', '浙江省', '杭州市', '萧山区', '金城路333号加州阳光单身公寓2314号', '', '', '0.00', '0', '0', '33660', '21', '0', '2018-02-26 15:40:01', '2018-02-26 15:40:01', '1', '470350', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1194', 'OB226315245412076', '何士涛', '13588731984', '浙江省', '杭州市', '滨江区', '滨盛路明豪大厦706', '', '', '0.00', '800', '0', '106', '21', '0', '2018-02-26 15:52:04', '2018-02-26 15:52:04', '1', '644359', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1195', 'OB226318264412005', '张军', '13958069235', '浙江省', '杭州市', '西湖区', '双浦镇东江嘴村桥头25号', '', '', '0.00', '800', '0', '780', '21', '0', '2018-02-26 15:57:06', '2018-02-26 15:57:06', '1', '335285', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1196', 'OB226319881010918', '张军', '13958069235', '浙江省', '杭州市', '西湖区', '双浦镇东江嘴村桥头25号', '', '', '0.00', '800', '0', '520', '21', '0', '2018-02-26 15:59:48', '2018-02-26 15:59:48', '1', '643578', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1197', 'OB226320852117123', '张军', '13958069235', '浙江省', '杭州市', '西湖区', '双浦镇东江嘴村桥头25号', '', '', '1.50', '800', '0', '780', '21', '1', '2018-02-26 16:01:25', '2018-02-26 16:01:25', '1', '484097', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1198', 'OB226322971286892', '张军', '13958069235', '浙江省', '杭州市', '西湖区', '双浦镇东江嘴村桥头25号', '', '', '0.04', '800', '0', '90', '21', '1', '2018-02-26 16:04:57', '2018-02-26 16:04:57', '1', '769479', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1199', 'OB226322971748687', '吴彦彬', '18367603778', '浙江省', '嘉兴市', '平湖市', '林埭镇陈匠村  公交205终点站  往南300米世纪联华', '', '', '0.00', '800', '0', '1105', '21', '0', '2018-02-26 16:04:57', '2018-02-26 16:04:57', '1', '864184', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1200', 'OB226329675642205', '俞懿倍', '13967230805', '浙江省', '舟山市', '定海区', '临城街道海力生路85号', '', '', '0.00', '0', '0', '7360', '21', '0', '2018-02-26 16:16:07', '2018-02-26 16:16:07', '1', '324967', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1201', 'OB226331395569502', '张军', '13958069235', '浙江省', '杭州市', '西湖区', '双浦镇东江嘴村桥头25号', '', '', '0.00', '800', '0', '1892', '21', '0', '2018-02-26 16:18:59', '2018-02-26 16:18:59', '1', '418845', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1202', 'OB226341030880666', '吴彦彬', '18367603778', '浙江省', '杭州市', '西湖区', '蒋村街道  西溪花园-红柿苑25幢二单元602', '', '', '0.00', '800', '0', '3641', '21', '0', '2018-02-26 16:35:03', '2018-02-26 16:35:03', '1', '625934', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1203', 'OB226350396549498', '陈曼曼', '17816099232', '浙江省', '杭州市', '西湖区', '留下街道西溪路896号万向职业学院', '', '', '0.00', '800', '0', '2587', '21', '0', '2018-02-26 16:50:39', '2018-02-26 16:50:39', '1', '681821', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1204', 'OB226379776160059', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '50.00', '0', '0', '16000', '21', '1', '2018-02-26 17:39:37', '2018-02-26 17:39:37', '1', '749406', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1205', 'OB226382797680768', '徐金丹', '13429077744', '浙江省', '金华市', '婺城区', '三江街道华园小区1-1-302', '', '', '0.00', '800', '0', '3644', '21', '0', '2018-02-26 17:44:39', '2018-02-26 17:44:39', '1', '521131', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1206', 'OB226387298887143', '崔松林', '13588090904', '浙江省', '杭州市', '滨江区', '万福中心9楼', '', '', '0.00', '800', '0', '2600', '21', '0', '2018-02-26 17:52:09', '2018-02-26 17:52:09', '1', '657820', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1207', 'OB226390075761680', '崔松林', '13588090904', '浙江省', '杭州市', '滨江区', '万福中心9楼', '', '', '0.00', '0', '0', '2600', '21', '0', '2018-02-26 17:56:47', '2018-02-26 17:56:47', '2', '625216', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1208', 'OB226390836380797', '姜虹', '13429691406', '浙江省', '杭州市', '江干区', '华家池13号1幢1单元301室', '', '', '0.00', '800', '0', '3637', '21', '0', '2018-02-26 17:58:03', '2018-02-26 17:58:03', '1', '404528', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1209', 'OB226393871164665', '崔松林', '13588090904', '浙江省', '杭州市', '滨江区', '万福中心9楼', '', '', '3.00', '800', '0', '500', '21', '1', '2018-02-26 18:03:07', '2018-02-26 18:03:07', '1', '584342', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1210', 'OB226394355193608', '崔松林', '13588090904', '浙江省', '杭州市', '滨江区', '万福中心9楼', '', '', '0.00', '800', '0', '500', '21', '0', '2018-02-26 18:03:55', '2018-02-26 18:03:55', '1', '575511', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1211', 'OB226395394051607', '崔松林', '13588090904', '浙江省', '杭州市', '滨江区', '万福中心9楼', '', '', '0.00', '800', '0', '500', '21', '0', '2018-02-26 18:05:39', '2018-02-26 18:05:39', '1', '214112', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1212', 'OB226411254049857', '徐金丹', '13429077744', '浙江省', '金华市', '婺城区', '三江街道华园小区1-1-302', '', '', '0.00', '800', '0', '3663', '21', '0', '2018-02-26 18:32:05', '2018-02-26 18:32:05', '1', '703487', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1213', 'OB226412024367383', '徐金丹', '13429077744', '浙江省', '金华市', '婺城区', '三江街道华园小区1-1-302', '', '', '2.40', '800', '0', '2100', '21', '1', '2018-02-26 18:33:22', '2018-02-26 18:33:22', '1', '639027', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1214', 'OB226414577809199', '徐金丹', '13429077744', '浙江省', '金华市', '婺城区', '三江街道华园小区1-1-302', '', '', '1.50', '800', '0', '799', '21', '1', '2018-02-26 18:37:37', '2018-02-26 18:37:37', '1', '297839', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1215', 'OB226416356723275', '李红玲', '13567235314', '浙江省', '湖州市', '长兴县', '茗桂华庭21-2-302', '', '', '0.00', '800', '0', '1561', '21', '0', '2018-02-26 18:40:35', '2018-02-26 18:40:35', '1', '981397', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1216', 'OB226417784923624', '李红玲', '13567235314', '浙江省', '湖州市', '长兴县', '茗桂华庭21-2-302', '', '', '2.00', '800', '0', '1250', '21', '1', '2018-02-26 18:42:58', '2018-02-26 18:42:58', '1', '557581', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1217', 'OB226418122055261', '李红玲', '13567235314', '浙江省', '湖州市', '长兴县', '茗桂华庭21-2-302', '', '', '2.00', '800', '0', '1250', '21', '1', '2018-02-26 18:43:32', '2018-02-26 18:43:32', '1', '553662', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1218', 'OB226418743387009', '李红玲', '13567235314', '浙江省', '湖州市', '长兴县', '茗桂华庭21-2-302', '', '', '0.03', '800', '0', '186', '21', '1', '2018-02-26 18:44:34', '2018-02-26 18:44:34', '1', '953616', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1219', 'OB226419143948803', '李红玲', '13567235314', '浙江省', '湖州市', '长兴县', '茗桂华庭21-2-302', '', '', '0.06', '800', '0', '372', '21', '1', '2018-02-26 18:45:14', '2018-02-26 18:45:14', '1', '677680', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1220', 'OB226420757786820', '李红玲', '13567235314', '浙江省', '湖州市', '长兴县', '茗桂华庭21-2-302', '', '', '1.00', '800', '0', '1260', '21', '1', '2018-02-26 18:47:55', '2018-02-26 18:47:55', '1', '843740', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1221', 'OB226422076412752', '徐金丹', '13429077744', '浙江省', '金华市', '婺城区', '三江街道华园小区1-1-302', '', '', '0.00', '800', '0', '757', '21', '0', '2018-02-26 18:50:07', '2018-02-26 18:50:07', '1', '521583', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1222', 'OB226422174055502', '瞿俊俊', '15257385368', '浙江省', '嘉兴市', '海宁市', '长安镇中街116长安五金店', '', '', '2.40', '800', '0', '780', '21', '1', '2018-02-26 18:50:17', '2018-02-26 18:50:17', '1', '316148', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1223', 'OB226423424350792', '瞿俊俊', '15257385368', '浙江省', '嘉兴市', '海宁市', '长安镇中街116长安五金店', '', '', '2.40', '800', '0', '780', '21', '1', '2018-02-26 18:52:22', '2018-02-26 18:52:22', '1', '793162', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1224', 'OB226424522758374', '瞿俊俊', '15257385368', '浙江省', '嘉兴市', '海宁市', '长安镇中街116长安五金店', '', '', '1.80', '800', '0', '585', '21', '1', '2018-02-26 18:54:12', '2018-02-26 18:54:12', '1', '982804', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1225', 'OB226424614734968', '瞿俊俊', '15257385368', '浙江省', '嘉兴市', '海宁市', '长安镇中街116长安五金店', '', '', '1.80', '800', '0', '585', '21', '1', '2018-02-26 18:54:21', '2018-02-26 18:54:21', '1', '352536', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1226', 'OB226426283234576', '李红玲', '13567235314', '浙江省', '湖州市', '长兴县', '茗桂华庭21-2-302', '', '', '0.40', '800', '0', '150', '21', '1', '2018-02-26 18:57:08', '2018-02-26 18:57:08', '1', '973269', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1227', 'OB226521783481557', '吴相庭', '13738014058', '浙江省', '杭州市', '西湖区', '古翠路6号8楼', '', '', '0.00', '800', '0', '2280', '21', '0', '2018-02-26 21:36:18', '2018-02-26 21:36:18', '1', '468074', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1228', 'OB227620293181612', '夏剑雷', '18668080112', '浙江省', '杭州市', '萧山区', '城厢街道文澜苑5幢2单元602室', '', '', '0.00', '800', '0', '3657', '21', '0', '2018-02-27 00:20:29', '2018-02-27 00:20:29', '1', '846669', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1229', 'OB227952505142997', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '1.00', '800', '0', '345', '21', '1', '2018-02-27 09:34:10', '2018-02-27 09:34:10', '1', '909459', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1230', 'OB227952556984685', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '1.00', '800', '0', '345', '21', '1', '2018-02-27 09:34:15', '2018-02-27 09:34:15', '1', '822790', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1231', 'OB227952787970682', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '1.00', '800', '0', '345', '21', '1', '2018-02-27 09:34:38', '2018-02-27 09:34:38', '1', '914610', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1232', 'OB227953129959007', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.00', '800', '0', '345', '21', '0', '2018-02-27 09:35:13', '2018-02-27 09:35:13', '1', '595804', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1233', 'OB227953489249067', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.00', '800', '0', '3588', '21', '0', '2018-02-27 09:35:48', '2018-02-27 09:35:48', '1', '527454', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1234', 'OB227954278379267', '梁先生', '13065711711', '浙江省', '杭州市', '上城区', '庆春路100号', '', '', '0.00', '800', '0', '228', '21', '0', '2018-02-27 09:37:07', '2018-02-27 09:37:07', '1', '517793', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1235', 'OB227976828206168', '张女士', '13706878206', '浙江省', '杭州市', '西湖区', '留下街道留和路石马社区', '', '', '0.00', '800', '0', '748', '21', '0', '2018-02-27 10:14:43', '2018-02-27 10:14:43', '1', '892100', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1236', 'OB227994318214874', '吴佳孺', '18215108780', '浙江省', '杭州市', '拱墅区', '康桥康盛苑小区13幢1单元1902室', '', '', '0.00', '800', '0', '930', '21', '0', '2018-02-27 10:43:51', '2018-02-27 10:43:51', '1', '370614', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1237', 'OB227998070920339', '朱小燕', '18758159857', '浙江省', '杭州市', '西湖区', '北山街32-33号保俶塔前山路3号小巷酒窖', '', '', '0.00', '0', '0', '16000', '21', '0', '2018-02-27 10:50:07', '2018-02-27 10:50:07', '1', '151508', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1238', 'OB227060043746539', '任四香', '15256345712', '安徽省', '宣城市', '旌德县', '三溪镇大礼堂小学附近', '', '', '0.00', '800', '0', '1163', '21', '0', '2018-02-27 12:33:24', '2018-02-27 12:33:24', '1', '705078', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1239', 'OB227093848701422', '赖羊艳', '15384017362', '浙江省', '杭州市', '滨江区', '浦沿街道火炬大道中兴和园茗馨苑3-3-601', '', '', '0.00', '800', '0', '3655', '21', '0', '2018-02-27 13:29:45', '2018-02-27 13:29:45', '1', '244172', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1240', 'OB227099376768922', '郑宇', '15105817925', '浙江省', '杭州市', '拱墅区', '信义坊1幢2单元102室', '', '', '0.00', '800', '0', '3148', '21', '0', '2018-02-27 13:38:57', '2018-02-27 13:38:57', '1', '571289', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1241', 'OB227099780257400', '朱小燕', '18758159857', '江西省', '赣州市', '瑞金市', '壬田镇老桥头往前100米左拐', '', '', '0.00', '800', '0', '3260', '21', '0', '2018-02-27 13:39:38', '2018-02-27 13:39:38', '1', '431061', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1242', 'OB227099921902425', '朱小燕', '18758159857', '江西省', '赣州市', '瑞金市', '壬田镇老桥头往前100米左拐', '', '', '0.00', '800', '0', '1824', '21', '0', '2018-02-27 13:39:52', '2018-02-27 13:39:52', '1', '409310', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1243', 'OB227100026863849', '王诗洁', '15879911019', '江西省', '鹰潭市', '月湖区', '海亮首府5栋1单元701', '', '', '0.00', '0', '0', '7726', '21', '0', '2018-02-27 13:40:02', '2018-02-27 13:40:02', '1', '420099', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1244', 'OB227102042797861', '任延红', '18554873211', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大厦9楼', '', '', '1.00', '800', '0', '500', '21', '1', '2018-02-27 13:43:24', '2018-02-27 13:43:24', '1', '963057', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1245', 'OB227103192016041', '赖羊艳', '15384017362', '浙江省', '杭州市', '滨江区', '浦沿街道火炬大道中兴和园茗馨苑3-3-601', '', '', '1.00', '800', '0', '1698', '21', '1', '2018-02-27 13:45:19', '2018-02-27 13:45:19', '1', '924432', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1246', 'OB227103714598250', '王诗洁', '15879911019', '江西省', '鹰潭市', '月湖区', '海亮首府5栋1单元701', '', '', '0.00', '0', '0', '7156', '21', '0', '2018-02-27 13:46:11', '2018-02-27 13:46:11', '1', '550269', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1247', 'OB227104921788892', '王诗洁', '15879911019', '江西省', '鹰潭市', '月湖区', '海亮首府5栋1单元701', '', '', '1.00', '800', '0', '3698', '21', '1', '2018-02-27 13:48:12', '2018-02-27 13:48:12', '1', '702229', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1248', 'OB227105553814074', '王诗洁', '15879911019', '江西省', '鹰潭市', '月湖区', '海亮首府5栋1单元701', '', '', '0.00', '800', '0', '1760', '21', '0', '2018-02-27 13:49:15', '2018-02-27 13:49:15', '1', '654440', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1249', 'OB227105915662167', '朱小燕', '18758159857', '江西省', '赣州市', '瑞金市', '壬田镇老桥头往前100米左拐', '', '', '0.00', '800', '0', '417', '21', '0', '2018-02-27 13:49:51', '2018-02-27 13:49:51', '1', '741684', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1250', 'OB227106051758715', '王诗洁', '15879911019', '江西省', '鹰潭市', '月湖区', '海亮首府5栋1单元701', '', '', '1.00', '800', '0', '3698', '21', '1', '2018-02-27 13:50:05', '2018-02-27 13:50:05', '1', '608844', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1251', 'OB227106403776536', '王诗洁', '15879911019', '江西省', '鹰潭市', '月湖区', '海亮首府5栋1单元701', '', '', '1.00', '800', '0', '3698', '21', '1', '2018-02-27 13:50:40', '2018-02-27 13:50:40', '1', '835439', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1252', 'OB227107747522095', '王诗洁', '15879911019', '江西省', '鹰潭市', '月湖区', '海亮首府5栋1单元701', '', '', '0.00', '800', '0', '2536', '21', '0', '2018-02-27 13:52:54', '2018-02-27 13:52:54', '1', '346174', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1253', 'OB227109264972274', '王诗洁', '15879911019', '江西省', '鹰潭市', '月湖区', '海亮首府5栋1单元701', '', '', '0.00', '800', '0', '3711', '21', '0', '2018-02-27 13:55:26', '2018-02-27 13:55:26', '1', '763266', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1254', 'OB227109544302991', '朱小燕', '18758159857', '江西省', '赣州市', '瑞金市', '壬田镇老桥头往前100米左拐', '', '', '0.00', '800', '0', '3036', '21', '0', '2018-02-27 13:55:54', '2018-02-27 13:55:54', '1', '146193', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1255', 'OB227109652716322', '朱小燕', '18758159857', '江西省', '赣州市', '瑞金市', '壬田镇老桥头往前100米左拐', '', '', '0.00', '800', '0', '413', '21', '0', '2018-02-27 13:56:05', '2018-02-27 13:56:05', '1', '865405', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1256', 'OB227111440088924', '吴菲', '15067157370', '浙江省', '杭州市', '西湖区', '转塘家园17幢3单元701', '', '', '0.20', '800', '0', '2280', '21', '1', '2018-02-27 13:59:04', '2018-02-27 13:59:04', '1', '396637', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1257', 'OB227111496334917', '吴菲', '15067157370', '浙江省', '杭州市', '西湖区', '转塘家园17幢3单元701', '', '', '0.20', '800', '0', '2280', '21', '1', '2018-02-27 13:59:09', '2018-02-27 13:59:09', '1', '776164', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1258', 'OB227111763058598', '吴菲', '15067157370', '浙江省', '杭州市', '西湖区', '转塘家园17幢3单元701', '', '', '0.20', '800', '0', '2280', '21', '1', '2018-02-27 13:59:36', '2018-02-27 13:59:36', '1', '494490', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1259', 'OB227112844704207', '吴菲', '15067157370', '浙江省', '杭州市', '西湖区', '转塘家园17幢3单元701', '', '', '0.00', '800', '0', '1268', '21', '0', '2018-02-27 14:01:24', '2018-02-27 14:01:24', '1', '751675', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1260', 'OB227113214014801', '吴菲', '15067157370', '浙江省', '杭州市', '西湖区', '转塘家园17幢3单元701', '', '', '2.00', '800', '0', '698', '21', '1', '2018-02-27 14:02:01', '2018-02-27 14:02:01', '1', '495336', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1261', 'OB227113621805434', '吴菲', '15067157370', '浙江省', '杭州市', '西湖区', '转塘家园17幢3单元701', '', '', '0.00', '800', '0', '1396', '21', '0', '2018-02-27 14:02:42', '2018-02-27 14:02:42', '1', '137298', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1262', 'OB227115796841959', '王诗洁', '15879911019', '江西省', '鹰潭市', '月湖区', '海亮首府5栋1单元701', '', '', '1.00', '800', '0', '750', '21', '1', '2018-02-27 14:06:19', '2018-02-27 14:06:19', '1', '220535', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1263', 'OB227117139901565', '王诗洁', '15879911019', '江西省', '鹰潭市', '月湖区', '海亮首府5栋1单元701', '', '', '0.00', '800', '0', '1095', '21', '0', '2018-02-27 14:08:34', '2018-02-27 14:08:34', '1', '316892', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1264', 'OB227138024373227', '任四香', '15256345712', '安徽省', '宣城市', '旌德县', '三溪镇大礼堂小学附近', '', '', '0.00', '800', '0', '298', '21', '0', '2018-02-27 14:43:22', '2018-02-27 14:43:22', '1', '889447', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1265', 'OB227138870576331', '任四香', '15256345712', '安徽省', '宣城市', '旌德县', '三溪镇大礼堂小学附近', '', '', '0.00', '800', '0', '1010', '21', '0', '2018-02-27 14:44:47', '2018-02-27 14:44:47', '1', '700119', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1266', 'OB227141134725314', '姚子云', '18605523480', '浙江省', '杭州市', '滨江区', '万福中心A座9楼', '', '', '1.20', '800', '0', '399', '21', '1', '2018-02-27 14:48:33', '2018-02-27 14:48:33', '1', '973029', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1267', 'OB227141174015031', '姚子云', '18605523480', '浙江省', '杭州市', '滨江区', '万福中心A座9楼', '', '', '1.20', '800', '0', '399', '21', '1', '2018-02-27 14:48:37', '2018-02-27 14:48:37', '1', '863442', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1268', 'OB227141296011960', '覃文豪', '13588353105', '浙江省', '杭州市', '西湖区', '古墩路71号修舍健康酒店前台', '', '', '4.00', '800', '0', '3380', '21', '1', '2018-02-27 14:48:49', '2018-02-27 14:48:49', '1', '487502', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1269', 'OB227141391841676', '姚子云', '18605523480', '浙江省', '杭州市', '滨江区', '万福中心A座9楼', '', '', '1.20', '0', '0', '399', '21', '1', '2018-02-27 14:48:59', '2018-02-27 14:48:59', '2', '687949', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1270', 'OB227141454177236', '覃文豪', '13588353105', '浙江省', '杭州市', '西湖区', '古墩路71号修舍健康酒店前台', '', '', '4.00', '800', '0', '3380', '21', '1', '2018-02-27 14:49:05', '2018-02-27 14:49:05', '1', '628874', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1271', 'OB227143273648279', '周扬', '13868047087', '浙江省', '杭州市', '江干区', '三里家园二小区5-2-901', '', '', '0.00', '0', '0', '3588', '21', '0', '2018-02-27 14:52:07', '2018-02-27 14:52:07', '2', '706977', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1272', 'OB227144686082521', '小方', '13666613124', '浙江省', '杭州市', '西湖区', '古翠路6号新亚科技大楼九楼', '', '', '0.00', '800', '0', '2159', '21', '0', '2018-02-27 14:54:28', '2018-02-27 14:54:28', '1', '229776', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1273', 'OB227150225173527', '覃文豪', '13588353105', '浙江省', '杭州市', '西湖区', '古墩路71号修舍健康酒店前台', '', '', '4.00', '800', '0', '3380', '21', '1', '2018-02-27 15:03:42', '2018-02-27 15:03:42', '1', '479057', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1274', 'OB227182634062845', '吴庆', '13919761296', '甘肃省', '兰州市', '城关区', '拱星墩街道焦家湾南路225号中国兵器集团北方机械厂', '', '', '0.00', '0', '0', '20904', '21', '0', '2018-02-27 15:57:43', '2018-02-27 15:57:43', '1', '823423', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1275', 'OB227197619550545', '朱昱', '13735553173', '浙江省', '杭州市', '西湖区', '紫荆花路88号嘉禾花苑12幢', '', '', '0.00', '800', '0', '2895', '21', '0', '2018-02-27 16:22:42', '2018-02-27 16:22:42', '1', '457060', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1276', 'OB227197991766008', '孙松', '15268124366', '浙江省', '杭州市', '余杭区', '良渚街道北软路越秀星汇尚城7幢501', '', '', '0.00', '800', '0', '1132', '21', '0', '2018-02-27 16:23:19', '2018-02-27 16:23:19', '1', '238468', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1277', 'OB227200135278231', '任四香', '15256345712', '安徽省', '宣城市', '旌德县', '三溪镇大礼堂小学附近', '', '', '0.00', '800', '0', '115', '21', '0', '2018-02-27 16:26:53', '2018-02-27 16:26:53', '1', '161847', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1278', 'OB227201802070048', '吴佳孺', '18215108780', '浙江省', '杭州市', '拱墅区', '康桥康盛苑小区13幢1单元1902室', '', '', '0.00', '800', '0', '653', '21', '0', '2018-02-27 16:29:40', '2018-02-27 16:29:40', '1', '958319', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1279', 'OB227202033351036', '朱昱', '13735553173', '浙江省', '杭州市', '西湖区', '紫荆花路88号嘉禾花苑12幢', '', '', '0.00', '800', '0', '3642', '21', '0', '2018-02-27 16:30:03', '2018-02-27 16:30:03', '1', '729246', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1280', 'OB227205928703158', '任四香', '15256345712', '安徽省', '宣城市', '旌德县', '三溪镇大礼堂小学附近', '', '', '0.00', '800', '0', '1466', '21', '0', '2018-02-27 16:36:33', '2018-02-27 16:36:33', '1', '792553', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1281', 'OB227206552229929', '李翔', '15988840741', '浙江省', '杭州市', '西湖区', '古墩路71号修正大厦一楼总台', '', '', '0.00', '800', '0', '1293', '21', '0', '2018-02-27 16:37:35', '2018-02-27 16:37:35', '1', '460651', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1282', 'OB227211775947095', '许冰阳', '15158013133', '浙江省', '杭州市', '余杭区', '闲林街道民丰村大许家埭东89号', '', '', '4.00', '800', '0', '3380', '21', '1', '2018-02-27 16:46:17', '2018-02-27 16:46:17', '1', '126956', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1283', 'OB227211904635265', '许冰阳', '15158013133', '浙江省', '杭州市', '余杭区', '闲林街道民丰村大许家埭东89号', '', '', '4.00', '800', '0', '3380', '21', '1', '2018-02-27 16:46:30', '2018-02-27 16:46:30', '1', '427731', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1284', 'OB227213195824724', '许冰阳', '15158013133', '浙江省', '杭州市', '余杭区', '闲林街道民丰村大许家埭东89号', '', '', '4.00', '800', '0', '3380', '21', '1', '2018-02-27 16:48:39', '2018-02-27 16:48:39', '1', '678569', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1285', 'OB227236982095638', '郑宇', '15105817925', '浙江省', '杭州市', '拱墅区', '信义坊1幢2单元102室', '', '', '50.00', '0', '0', '16000', '21', '1', '2018-02-27 17:28:18', '2018-02-27 17:28:18', '1', '872273', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1286', 'OB227249315774541', '徐明海', '13777560482', '浙江省', '杭州市', '西湖区', '北山街保俶塔前山路3号小巷酒窖', '', '', '0.00', '0', '0', '6793', '21', '0', '2018-02-27 17:48:51', '2018-02-27 17:48:51', '1', '769432', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1287', 'OB227308895856699', '徐明海', '13777560482', '浙江省', '杭州市', '西湖区', '北山街保俶塔前山路3号小巷酒窖', '', '', '0.00', '0', '0', '15940', '21', '0', '2018-02-27 19:28:09', '2018-02-27 19:28:09', '1', '803132', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1288', 'OB227315177215362', '冯宪鹏', '13735831026', '浙江省', '杭州市', '拱墅区', '文晖路448号星都宾馆4楼爱情故事', '', '', '0.20', '800', '0', '35', '34', '1', '2018-02-27 19:38:37', '2018-02-27 19:38:37', '1', '282205', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1289', 'OB227315254971077', '冯宪鹏', '13735831026', '浙江省', '杭州市', '拱墅区', '文晖路448号星都宾馆4楼爱情故事', '', '', '0.20', '800', '0', '35', '34', '1', '2018-02-27 19:38:45', '2018-02-27 19:38:45', '1', '776787', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1290', 'OB227315600590822', '冯宪鹏', '13735831026', '浙江省', '杭州市', '拱墅区', '文晖路448号星都宾馆4楼爱情故事', '', '', '0.20', '800', '0', '58', '34', '1', '2018-02-27 19:39:20', '2018-02-27 19:39:20', '1', '538044', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1291', 'OB227316106525454', '冯宪鹏', '13735831026', '浙江省', '杭州市', '拱墅区', '文晖路448号星都宾馆4楼爱情故事', '', '', '0.20', '800', '0', '2280', '34', '1', '2018-02-27 19:40:10', '2018-02-27 19:40:10', '1', '493424', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1292', 'OB227341125308317', '朱小燕', '18758159857', '江西省', '赣州市', '瑞金市', '壬田镇老桥头往前100米左拐', '', '', '0.00', '800', '0', '3612', '21', '0', '2018-02-27 20:21:52', '2018-02-27 20:21:52', '1', '612791', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1293', 'OB227351990793583', '朱小燕', '18758159857', '江西省', '赣州市', '瑞金市', '壬田镇老桥头往前100米左拐', '', '', '0.00', '800', '0', '1701', '21', '0', '2018-02-27 20:39:59', '2018-02-27 20:39:59', '1', '463143', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1294', 'OB227353488176074', '叶开开', '18758405007', '浙江省', '宁波市', '慈溪市', '坎墩街道坎东村担山北路2100号', '', '', '1.00', '800', '0', '498', '21', '1', '2018-02-27 20:42:28', '2018-02-27 20:42:28', '1', '470595', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1295', 'OB227353574072549', '叶开开', '18758405007', '浙江省', '宁波市', '慈溪市', '坎墩街道坎东村担山北路2100号', '', '', '1.00', '800', '0', '498', '21', '1', '2018-02-27 20:42:37', '2018-02-27 20:42:37', '1', '654290', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1296', 'OB227401005583987', '孙晓伟', '13635670366', '安徽省', '亳州市', '涡阳县', '经开区乐行路与兴业路交叉口修正产业园', '', '', '0.00', '800', '0', '4355', '21', '0', '2018-02-27 22:01:40', '2018-02-27 22:01:40', '1', '130793', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1297', 'OB227406511425402', '余国华', '13837209257', '浙江省', '杭州市', '拱墅区', '田园9栋1单元602', '', '', '0.00', '800', '0', '912', '21', '0', '2018-02-27 22:10:51', '2018-02-27 22:10:51', '1', '154547', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1298', 'OB227411141102726', '木易', '15958030675', '浙江省', '杭州市', '西湖区', '浙江省 杭州市 西湖区 竞舟路 荷花苑165号', '', '', '0.00', '800', '0', '880', '21', '0', '2018-02-27 22:18:34', '2018-02-27 22:18:34', '1', '812870', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1299', 'OB227412421365580', '木易', '15958030675', '浙江省', '杭州市', '西湖区', '浙江省 杭州市 西湖区 竞舟路 荷花苑165号', '', '', '0.50', '800', '0', '880', '21', '1', '2018-02-27 22:20:42', '2018-02-27 22:20:42', '1', '406367', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1300', 'OB227414788366477', '木易', '15958030675', '浙江省', '杭州市', '西湖区', '浙江省 杭州市 西湖区 竞舟路 荷花苑165号', '', '', '0.09', '800', '0', '860', '21', '1', '2018-02-27 22:24:38', '2018-02-27 22:24:38', '1', '465805', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1301', 'OB228790173312089', '舒剑阳', '13336102588', '浙江省', '杭州市', '余杭区', '余杭街道凤联社区澜山公馆19-1-601', '', '', '2.50', '800', '0', '500', '21', '1', '2018-02-28 08:50:17', '2018-02-28 08:50:17', '1', '953684', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1302', 'OB228792078834740', '舒剑阳', '13336102588', '浙江省', '杭州市', '余杭区', '余杭街道凤联社区澜山公馆19-1-601', '', '', '0.50', '800', '0', '298', '21', '1', '2018-02-28 08:53:27', '2018-02-28 08:53:27', '1', '441562', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1303', 'OB228793338176824', '舒剑阳', '13336102588', '浙江省', '杭州市', '余杭区', '余杭街道凤联社区澜山公馆19-1-601', '', '', '0.50', '800', '0', '118', '21', '1', '2018-02-28 08:55:33', '2018-02-28 08:55:33', '1', '735175', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1304', 'OB308034848639375', '测试1', '14792011789', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '72', '23', '0', '2018-03-08 18:04:44', '2018-03-08 18:04:44', '1', '983768', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1305', 'OB314097092744557', 'wangyong ', '17816857090', '辽宁省', '本溪市', '南芬区', 'xixishidi', '', '', '0.50', '0', '0', '160', '21', '1', '2018-03-14 14:41:49', '2018-03-14 14:41:49', '1', '530925', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1306', 'OB314099093185123', 'wangyong ', '17816857090', '辽宁省', '本溪市', '南芬区', 'xixishidi', '2', '123456', '0.50', '0', '0', '160', '21', '1', '2018-03-14 14:45:09', '2018-03-14 15:12:04', '1', '469354', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1307', 'OB317717649956104', '测试', '14792011789', '河北省', '唐山市', '路南区', '街道', '', '', '0.08', '0', '0', '38', '21', '1', '2018-03-17 15:29:25', '2018-03-17 15:29:25', '1', '721875', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1308', 'OB317718254056592', '测试', '14792011789', '河北省', '唐山市', '路南区', '街道', '', '', '0.08', '0', '0', '38', '21', '1', '2018-03-17 15:30:25', '2018-03-17 15:30:25', '1', '453557', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1309', 'OB317718386996840', '测试', '14792011789', '河北省', '唐山市', '路南区', '街道', '1', '12', '0.08', '0', '0', '38', '21', '1', '2018-03-17 15:30:38', '2018-03-19 10:36:51', '1', '960287', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1310', 'OB319469167763498', 'wangyong ', '17816857090', '辽宁省', '本溪市', '南芬区', 'xixishidi', '', '', '5.00', '0', '0', '228', '21', '1', '2018-03-19 16:08:36', '2018-03-19 16:08:36', '1', '420702', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1311', 'OB319474821987327', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '2', '111111', '5.00', '0', '0', '228', '21', '1', '2018-03-19 16:18:02', '2018-03-22 09:59:36', '1', '744510', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1312', 'OB319485138405548', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '0', '0', '108', '21', '1', '2018-03-19 16:35:13', '2018-03-19 16:35:13', '1', '494407', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1313', 'OB319522107932658', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.02', '0', '0', '108', '21', '1', '2018-03-19 17:36:50', '2018-03-19 17:36:50', '1', '604733', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1314', 'OB319522345607093', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '4', '4555', '0.00', '0', '0', '660', '21', '0', '2018-03-19 17:37:14', '2018-03-26 10:55:15', '1', '232277', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1315', 'OB319523673714776', '12', '13333810611', '北京市', '市辖区', '东城区', '122456', '', '', '0.00', '0', '0', '108', '21', '0', '2018-03-19 17:39:27', '2018-03-19 17:39:27', '1', '193291', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1316', 'OB319525962746204', 'wangyong ', '17816857090', '辽宁省', '本溪市', '南芬区', 'xixishidi', '', '', '5.00', '0', '0', '228', '21', '1', '2018-03-19 17:43:16', '2018-03-19 17:43:16', '1', '232056', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1317', 'OB319526207224374', 'wangyong ', '17816857090', '辽宁省', '本溪市', '南芬区', 'xixishidi', '', '', '5.00', '0', '0', '228', '21', '1', '2018-03-19 17:43:40', '2018-03-19 17:43:40', '1', '732067', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1318', 'OB319526856215018', 'wangyong ', '17816857090', '辽宁省', '本溪市', '南芬区', 'xixishidi', '', '', '0.00', '0', '0', '228', '21', '0', '2018-03-19 17:44:45', '2018-03-19 17:44:45', '1', '911584', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1319', 'OB319527895194526', 'wangyong ', '17816857090', '辽宁省', '本溪市', '南芬区', 'xixishidi', '', '', '0.00', '0', '0', '228', '21', '0', '2018-03-19 17:46:29', '2018-03-19 17:46:29', '1', '697366', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1320', 'OB320148892664926', '12', '13333810611', '天津市', '市辖区', '河东区', '111', '', '', '0.00', '0', '0', '228', '21', '0', '2018-03-20 11:01:29', '2018-03-20 11:01:29', '1', '649187', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1321', 'OB320159637772583', '我', '13333810611', '河南省', '郑州市', '中原区', '我们都在', '', '', '0.00', '0', '0', '10', '25', '0', '2018-03-20 11:19:23', '2018-03-20 11:19:23', '1', '543093', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1322', 'OB320159918756967', '我', '13333810611', '河南省', '郑州市', '中原区', '我们都在', '', '', '0.02', '0', '0', '108', '21', '1', '2018-03-20 11:19:51', '2018-03-20 11:19:51', '1', '281855', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1323', 'OB320160001984775', '我', '13333810611', '河南省', '郑州市', '中原区', '我们都在', '', '', '0.02', '0', '0', '108', '21', '1', '2018-03-20 11:20:00', '2018-03-20 11:20:00', '1', '270466', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1324', 'OB320176598814967', 'wq', '13333810611', '天津市', '市辖区', '河西区', '111', '', '', '0.00', '0', '0', '228', '21', '0', '2018-03-20 11:47:39', '2018-03-20 11:47:39', '1', '279525', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1325', 'OB320177306293943', 'wangyong ', '17816857090', '辽宁省', '本溪市', '南芬区', 'xixishidi', '', '', '0.00', '0', '0', '456', '21', '0', '2018-03-20 11:48:50', '2018-03-20 11:48:50', '1', '424979', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1326', 'OB320181983545072', 'wowoo', '13333789856', '天津市', '市辖区', '和平区', '123', '', '', '0.02', '0', '0', '686', '21', '1', '2018-03-20 11:56:38', '2018-03-20 11:56:38', '1', '846975', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1327', 'OB320182547971380', '我们', '13333810611', '天津市', '市辖区', '河东区', '。h h hj', '', '', '0.00', '0', '0', '108', '21', '0', '2018-03-20 11:57:34', '2018-03-20 11:57:34', '1', '220671', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1328', 'OB320183126493852', 'wq', '13333810611', '天津市', '市辖区', '河西区', '111', '', '', '0.00', '0', '0', '228', '21', '0', '2018-03-20 11:58:32', '2018-03-20 11:58:32', '1', '146328', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1329', 'OB320184458529938', 'wq', '13333810611', '天津市', '市辖区', '河西区', '111', '1', '11', '0.00', '0', '0', '228', '21', '0', '2018-03-20 12:00:45', '2018-03-26 10:30:31', '1', '197481', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1330', 'OB320248275916990', '王雪峰', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街199号', '2', '253846', '1.80', '0', '0', '78', '23', '1', '2018-03-20 13:47:07', '2018-03-20 14:03:39', '1', '281877', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1331', 'OB320248580852816', '王雪峰', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街199号', '', '', '1.80', '0', '0', '78', '23', '1', '2018-03-20 13:47:38', '2018-03-20 13:47:38', '1', '290144', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1332', 'OB320248615232864', '王雪峰', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街199号', '', '', '1.80', '0', '0', '78', '23', '1', '2018-03-20 13:47:41', '2018-03-20 13:47:41', '1', '257042', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1333', 'OB320262130657943', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '78', '23', '0', '2018-03-20 14:10:13', '2018-03-20 14:10:13', '1', '770724', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1334', 'OB320264124383538', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '10', '23', '0', '2018-03-20 14:13:32', '2018-03-20 14:13:32', '1', '388844', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1335', 'OB320264423486967', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.35', '0', '0', '240', '23', '1', '2018-03-20 14:14:02', '2018-03-20 14:14:02', '1', '689493', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1336', 'OB320264544565098', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '1', '123456', '0.00', '0', '0', '240', '23', '0', '2018-03-20 14:14:14', '2018-03-20 14:57:05', '1', '449847', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1337', 'OB320265786962203', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '1', '123456', '15.00', '0', '0', '10', '23', '1', '2018-03-20 14:16:18', '2018-03-20 14:16:40', '1', '475647', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1338', 'OB320327096631033', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '2', '165465165416351', '5.00', '0', '0', '228', '21', '1', '2018-03-20 15:58:29', '2018-03-20 16:09:24', '1', '852777', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1339', 'OB320348347219174', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '4', '2894186168166', '5.00', '0', '0', '228', '21', '1', '2018-03-20 16:33:54', '2018-03-20 16:34:22', '1', '793178', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1340', 'OB320394988678957', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.02', '0', '0', '108', '21', '1', '2018-03-20 17:51:38', '2018-03-20 17:51:38', '1', '445006', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1341', 'OB320400058582545', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '336', '21', '0', '2018-03-20 18:00:05', '2018-03-20 18:00:05', '1', '563389', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1342', 'OB321958506102449', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '2', '12345647878798', '0.35', '0', '0', '240', '23', '1', '2018-03-21 09:30:50', '2018-03-21 09:31:12', '1', '852181', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1343', 'OB321966197247008', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.35', '0', '0', '240', '23', '1', '2018-03-21 09:43:39', '2018-03-21 09:43:39', '1', '105053', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1344', 'OB321229307066948', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '3', '12347', '0.35', '0', '0', '240', '23', '1', '2018-03-21 17:02:10', '2018-03-21 17:02:23', '1', '898658', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1345', 'OB321230041258010', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '4', '134678', '0.35', '0', '0', '240', '23', '1', '2018-03-21 17:03:24', '2018-03-21 17:03:35', '1', '145216', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1346', 'OB321237195141851', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '1', '32112', '0.35', '0', '0', '240', '23', '1', '2018-03-21 17:15:19', '2018-03-21 17:16:10', '1', '434709', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1347', 'OB322806241735584', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '2', '1234546', '1.80', '0', '0', '78', '23', '1', '2018-03-22 09:03:44', '2018-03-22 09:25:12', '1', '520730', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1348', 'OB322863915329587', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '2', '2134123', '2.00', '0', '0', '1496', '25', '1', '2018-03-22 10:39:51', '2018-03-22 10:40:29', '1', '276461', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1349', 'OB322868455564610', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '2', '122312312312312312', '2.00', '0', '0', '1496', '25', '1', '2018-03-22 10:47:25', '2018-03-22 10:47:44', '1', '698083', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1350', 'OB322109248284718', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '3', '32435', '1.80', '0', '0', '78', '23', '1', '2018-03-22 17:28:44', '2018-03-22 17:29:03', '1', '111320', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1351', 'OB322148474975099', '我', '13333810611', '河北省', '秦皇岛市', '山海关区', '我们', '', '', '0.00', '0', '0', '456', '21', '0', '2018-03-22 18:34:07', '2018-03-22 18:34:07', '1', '337573', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1352', 'OB323838852170180', '基地', '18758253247', '天津市', '市辖区', '和平区', '测试', '', '', '0.00', '0', '0', '139', '28', '0', '2018-03-23 13:44:45', '2018-03-23 13:44:45', '1', '457437', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1353', 'OB323839131868097', '基地', '18758253247', '天津市', '市辖区', '和平区', '测试', '', '', '0.00', '0', '0', '115', '28', '0', '2018-03-23 13:45:13', '2018-03-23 13:45:13', '2', '555452', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1354', 'OB323852958762862', '基地', '18758253247', '天津市', '市辖区', '和平区', '测试', '', '', '0.00', '0', '0', '800', '28', '0', '2018-03-23 14:08:15', '2018-03-23 14:08:15', '1', '249114', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1355', 'OB323864312048476', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '1.80', '1100', '0', '78', '23', '1', '2018-03-23 14:27:11', '2018-03-23 14:27:11', '1', '627802', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1356', 'OB323864443762487', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '1.80', '1100', '0', '78', '23', '1', '2018-03-23 14:27:24', '2018-03-23 14:27:24', '1', '613197', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1357', 'OB324786508475134', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.12', '0', '0', '39', '23', '1', '2018-03-24 16:04:10', '2018-03-24 16:04:10', '2', '585688', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1358', 'OB324787153686604', 'wod', '13333810611', '天津市', '市辖区', '河北区', 'hahahahha', '', '', '0.00', '0', '0', '2280', '21', '0', '2018-03-24 16:05:15', '2018-03-24 16:05:15', '1', '923990', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1359', 'OB327224553864432', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '0.35', '1100', '0', '240', '23', '1', '2018-03-27 11:47:35', '2018-03-27 11:47:35', '1', '907183', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1360', 'OB327224614114480', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '0.35', '1100', '0', '240', '23', '1', '2018-03-27 11:47:41', '2018-03-27 11:47:41', '1', '831688', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1361', 'OB327345696250045', '软件', '18758253247', '北京市', '市辖区', '东城区', '基地', '', '', '0.00', '0', '0', '2440', '28', '0', '2018-03-27 15:09:29', '2018-03-27 15:09:29', '1', '611488', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1362', 'OB327399777752624', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '1.80', '0', '0', '78', '23', '1', '2018-03-27 16:39:37', '2018-03-27 16:39:59', '2', '820466', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1363', 'OB327401244309723', 'wod', '13333810611', '天津市', '市辖区', '河北区', 'hahahahha', '', '', '5.00', '0', '0', '228', '21', '1', '2018-03-27 16:42:04', '2018-03-27 16:43:02', '2', '686412', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1364', 'OB327405300491800', 'wod', '13333810611', '天津市', '市辖区', '河北区', 'hahahahha', '', '', '0.20', '0', '0', '2280', '21', '1', '2018-03-27 16:48:50', '2018-03-27 16:48:50', '1', '236346', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1365', 'OB327407488013518', 'wod', '13333810611', '天津市', '市辖区', '河北区', 'hahahahha', '', '', '0.20', '0', '0', '1980', '21', '1', '2018-03-27 16:52:28', '2018-03-27 16:52:28', '1', '609311', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1366', 'OB327408353397899', 'wod', '13333810611', '天津市', '市辖区', '河北区', 'hahahahha', '1', '111', '0.20', '0', '0', '2280', '21', '1', '2018-03-27 16:53:55', '2018-03-27 16:54:15', '1', '777560', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1367', 'OB327408887166788', 'wod', '13333810611', '天津市', '市辖区', '河北区', 'hahahahha', '', '', '5.00', '0', '0', '228', '21', '1', '2018-03-27 16:54:48', '2018-03-27 16:55:04', '2', '332551', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1368', 'OB327423273506478', '软件', '18758253247', '北京市', '市辖区', '东城区', '基地', '', '', '2.00', '0', '0', '768', '28', '1', '2018-03-27 17:18:47', '2018-03-27 17:18:47', '1', '302304', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1369', 'OB327423435426184', '软件', '18758253247', '北京市', '市辖区', '东城区', '基地', '', '', '0.08', '0', '0', '800', '28', '1', '2018-03-27 17:19:03', '2018-03-27 17:19:03', '1', '907829', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1370', 'OB328993315686131', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.20', '0', '0', '2280', '23', '1', '2018-03-28 09:08:51', '2018-03-28 09:08:51', '1', '382182', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1371', 'OB328993768884161', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.35', '0', '0', '240', '23', '1', '2018-03-28 09:09:36', '2018-03-28 09:14:36', '2', '635534', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1372', 'OB328013790264181', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '1', '543624', '2.25', '0', '0', '559', '23', '1', '2018-03-28 09:42:59', '2018-03-28 09:49:10', '1', '434651', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1373', 'OB328014097137046', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '4.00', '0', '0', '873', '23', '1', '2018-03-28 09:43:29', '2018-03-28 09:43:29', '1', '270228', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1374', 'OB328014416977788', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '3', '12435', '12.60', '0', '0', '546', '23', '1', '2018-03-28 09:44:01', '2018-03-28 09:48:12', '1', '631454', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1375', 'OB328038095173719', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.80', '1100', '0', '78', '23', '1', '2018-03-28 10:23:29', '2018-03-28 10:23:29', '1', '483364', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1376', 'OB328038129766827', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.80', '1100', '0', '78', '23', '1', '2018-03-28 10:23:32', '2018-03-28 10:23:32', '1', '533811', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1377', 'OB328038227845251', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.80', '1100', '0', '78', '23', '1', '2018-03-28 10:23:42', '2018-03-28 10:23:42', '1', '184467', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1378', 'OB328038305387786', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '1.80', '1100', '0', '78', '23', '1', '2018-03-28 10:23:50', '2018-03-28 10:23:50', '1', '541602', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1379', 'OB328038827825768', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.35', '0', '0', '240', '23', '1', '2018-03-28 10:24:42', '2018-03-28 10:24:42', '2', '882218', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1380', 'OB328039046807521', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '0.35', '1100', '0', '240', '23', '1', '2018-03-28 10:25:04', '2018-03-28 10:25:04', '1', '130011', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1381', 'OB328039660665938', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '0.35', '1100', '0', '240', '23', '1', '2018-03-28 10:26:06', '2018-03-28 10:26:06', '1', '691351', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1382', 'OB328040020377147', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '0.35', '0', '0', '240', '23', '1', '2018-03-28 10:26:42', '2018-03-28 10:26:42', '2', '879951', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1383', 'OB328040194515545', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '0.35', '1100', '0', '240', '23', '1', '2018-03-28 10:26:59', '2018-03-28 10:26:59', '1', '399926', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1384', 'OB328040525833734', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '0.35', '0', '0', '240', '23', '1', '2018-03-28 10:27:32', '2018-03-28 10:27:32', '2', '147404', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1385', 'OB328073674213228', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.35', '0', '0', '240', '23', '1', '2018-03-28 11:22:47', '2018-03-28 11:22:47', '2', '954348', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1386', 'OB328074842908354', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.35', '1100', '0', '240', '23', '1', '2018-03-28 11:24:44', '2018-03-28 11:24:44', '1', '407127', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1387', 'OB329880117151859', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '10', '23', '0', '2018-03-29 09:46:51', '2018-03-29 09:49:14', '2', '107689', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1388', 'OB329894007144376', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '1.00', '0', '0', '1', '23', '1', '2018-03-29 10:10:00', '2018-03-29 10:10:19', '2', '858669', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1389', 'OB329899056342699', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '1.80', '1100', '0', '78', '23', '1', '2018-03-29 10:18:25', '2018-03-29 10:18:25', '1', '581064', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1390', 'OB329899146598671', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '1.80', '0', '0', '78', '23', '1', '2018-03-29 10:18:34', '2018-03-29 10:18:34', '2', '709191', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1391', 'OB329905893801675', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '1200', '23', '0', '2018-03-29 10:29:49', '2018-03-29 10:29:49', '1', '515955', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1392', 'OB329906312873085', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.20', '0', '0', '2280', '23', '1', '2018-03-29 10:30:31', '2018-03-29 10:30:31', '1', '846917', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1393', 'OB329906516231658', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '2280', '23', '0', '2018-03-29 10:30:51', '2018-03-29 10:30:51', '1', '174631', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1394', 'OB329911811862336', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '1.00', '0', '0', '1', '23', '1', '2018-03-29 10:39:41', '2018-03-29 10:40:21', '2', '516473', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1395', 'OB329917485323748', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.35', '0', '0', '240', '23', '1', '2018-03-29 10:49:08', '2018-03-29 10:49:08', '2', '160294', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1396', 'OB329917610628156', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.35', '0', '0', '240', '23', '1', '2018-03-29 10:49:21', '2018-03-29 10:49:21', '2', '237989', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1397', 'OB329962579124437', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '0.35', '0', '0', '240', '23', '1', '2018-03-29 12:04:17', '2018-03-29 12:04:17', '2', '577665', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1398', 'OB329034208065910', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '0.35', '0', '0', '240', '23', '1', '2018-03-29 14:03:40', '2018-03-29 14:03:40', '2', '593422', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1399', 'OB329034787315459', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '0.35', '0', '0', '240', '23', '1', '2018-03-29 14:04:38', '2018-03-29 14:04:38', '2', '258298', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1400', 'OB329084557928613', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.12', '1100', '0', '39', '23', '1', '2018-03-29 15:27:35', '2018-03-29 15:27:35', '1', '682617', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1401', 'OB329086717110650', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.12', '1100', '0', '39', '23', '1', '2018-03-29 15:31:11', '2018-03-29 15:31:11', '1', '954742', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1402', 'OB329094965876172', 'wod', '13333810611', '天津市', '市辖区', '河北区', 'hahahahha', '', '', '0.00', '0', '0', '1980', '21', '0', '2018-03-29 15:44:56', '2018-03-29 15:44:56', '1', '212811', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1403', 'OB329113680147199', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.50', '1100', '0', '10', '23', '1', '2018-03-29 16:16:08', '2018-03-29 16:16:08', '1', '488681', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1404', 'OB329113832358959', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.50', '0', '0', '10', '23', '1', '2018-03-29 16:16:23', '2018-03-29 16:16:23', '2', '196089', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1405', 'OB329142964904074', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.50', '0', '0', '10', '23', '1', '2018-03-29 17:04:56', '2018-03-29 17:04:56', '2', '233770', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1406', 'OB329144188533763', '唐唐', '13157175989', '浙江省', '杭州市', '下城区', '金色意义', '', '', '5.00', '0', '0', '100', '23', '1', '2018-03-29 17:06:58', '2018-03-29 17:06:58', '2', '978933', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1407', 'OB330721971996023', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '1.80', '1100', '0', '78', '23', '1', '2018-03-30 09:09:57', '2018-03-30 09:09:57', '1', '590700', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1408', 'OB330722072127613', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '1.80', '0', '0', '78', '23', '1', '2018-03-30 09:10:07', '2018-03-30 09:10:07', '2', '988468', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1409', 'OB330768547626641', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.50', '0', '0', '188', '23', '1', '2018-03-30 10:27:34', '2018-03-30 10:27:34', '2', '774685', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1410', 'OB330768611628455', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.50', '0', '0', '188', '23', '1', '2018-03-30 10:27:41', '2018-03-30 10:27:41', '2', '852404', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1411', 'OB330768934533947', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.50', '1100', '0', '188', '23', '1', '2018-03-30 10:28:13', '2018-03-30 10:28:13', '1', '755830', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1412', 'OB330782247994639', 'wod', '13333810611', '天津市', '市辖区', '河北区', 'hahahahha', '', '', '0.00', '0', '0', '9900', '21', '0', '2018-03-30 10:50:24', '2018-03-30 10:50:24', '1', '914254', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1413', 'OB330783170323744', 'wod', '13333810611', '天津市', '市辖区', '河北区', 'hahahahha', '', '', '0.00', '0', '0', '9900', '21', '0', '2018-03-30 10:51:57', '2018-03-30 10:51:57', '1', '572497', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1414', 'OB330783356287983', 'wod', '13333810611', '天津市', '市辖区', '河北区', 'hahahahha', '', '', '0.00', '1100', '0', '108', '21', '0', '2018-03-30 10:52:15', '2018-03-30 10:52:15', '1', '909907', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1415', 'OB330784731805861', 'wod', '13333810611', '天津市', '市辖区', '河北区', 'hahahahha', '', '', '0.50', '1100', '0', '188', '21', '1', '2018-03-30 10:54:33', '2018-03-30 10:54:33', '1', '106625', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1416', 'OB330785108665043', '软件', '18758253247', '北京市', '市辖区', '东城区', '基地', '', '', '0.00', '1100', '0', '228', '28', '0', '2018-03-30 10:55:10', '2018-03-30 10:55:10', '1', '126137', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1417', 'OB330802094808832', 'wod', '13333810611', '天津市', '市辖区', '河北区', 'hahahahha', '', '', '5.00', '0', '0', '228', '21', '1', '2018-03-30 11:23:29', '2018-03-30 11:24:01', '2', '532283', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1418', 'OB330806725348691', 'wod', '13333810611', '天津市', '市辖区', '河北区', 'hahahahha', '', '', '5.00', '1100', '0', '228', '21', '1', '2018-03-30 11:31:12', '2018-03-30 11:31:12', '1', '189281', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1419', 'OB330806866108636', 'wod', '13333810611', '天津市', '市辖区', '河北区', 'hahahahha', '', '', '5.00', '0', '0', '228', '21', '1', '2018-03-30 11:31:26', '2018-03-30 11:31:42', '2', '109229', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1420', 'OB330890281994897', '我们', '13333810611', '天津市', '市辖区', '河东区', '。h h hj', '', '', '5.00', '0', '0', '228', '21', '1', '2018-03-30 13:50:28', '2018-03-30 13:52:01', '2', '609855', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1421', 'OB330917497215910', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.50', '0', '0', '188', '23', '1', '2018-03-30 14:35:49', '2018-03-30 14:42:34', '2', '204610', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1422', 'OB330917888406597', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.50', '0', '0', '188', '23', '1', '2018-03-30 14:36:28', '2018-03-30 14:38:48', '2', '671082', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1423', 'OB330924286502024', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.00', '0', '0', '10', '23', '0', '2018-03-30 14:47:08', '2018-03-30 14:47:08', '2', '935134', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1424', 'OB330930715875609', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.50', '0', '0', '188', '23', '1', '2018-03-30 14:57:51', '2018-03-30 14:57:51', '2', '121287', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1425', 'OB330931214726407', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.50', '0', '0', '188', '23', '1', '2018-03-30 14:58:41', '2018-03-30 14:58:41', '2', '381305', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1426', 'OB330952518398676', 'wod', '13333810611', '天津市', '市辖区', '河北区', 'hahahahha', '', '', '5.00', '1100', '0', '228', '21', '1', '2018-03-30 15:34:11', '2018-03-30 15:34:11', '1', '897373', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1427', 'OB330952611113859', 'wod', '13333810611', '天津市', '市辖区', '河北区', 'hahahahha', '', '', '5.00', '0', '0', '228', '21', '1', '2018-03-30 15:34:21', '2018-03-30 15:34:59', '2', '816568', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1428', 'OB330973579145242', '软件', '18758253247', '北京市', '市辖区', '东城区', '基地', '', '', '0.00', '1100', '0', '152', '28', '0', '2018-03-30 16:09:18', '2018-03-30 16:09:18', '1', '630162', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1429', 'OB330978593925271', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '0.00', '0', '0', '980', '23', '0', '2018-03-30 16:17:39', '2018-03-30 16:17:39', '2', '769751', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1430', 'OB331662768494337', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '0.50', '1100', '0', '10', '23', '1', '2018-03-31 11:17:56', '2018-03-31 11:17:56', '1', '565772', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1431', 'OB331662887725570', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '0.50', '0', '0', '10', '23', '1', '2018-03-31 11:18:08', '2018-03-31 11:18:08', '2', '332691', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1432', 'OB331663484863585', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '0.50', '1100', '0', '10', '23', '1', '2018-03-31 11:19:08', '2018-03-31 11:19:08', '1', '401737', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1433', 'OB331663570306316', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '0.50', '0', '0', '10', '23', '1', '2018-03-31 11:19:17', '2018-03-31 11:19:17', '2', '370334', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1434', 'OB331666762198775', 'wod', '13333810611', '天津市', '市辖区', '河北区', 'hahahahha', '', '', '5.00', '0', '0', '228', '21', '1', '2018-03-31 11:24:36', '2018-03-31 11:24:36', '2', '461041', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1435', 'OB331667626635482', '我们', '13333810611', '天津市', '市辖区', '河东区', '。h h hj', '', '', '5.00', '0', '0', '228', '21', '1', '2018-03-31 11:26:02', '2018-03-31 11:26:02', '2', '611777', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1436', 'OB331671821085356', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '0.50', '0', '0', '10', '23', '1', '2018-03-31 11:33:02', '2018-03-31 11:33:02', '2', '305888', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1437', 'OB331672731064231', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '0.50', '1100', '0', '10', '23', '1', '2018-03-31 11:34:33', '2018-03-31 11:34:33', '1', '287550', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1438', 'OB331672798425577', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '0.50', '0', '0', '10', '23', '1', '2018-03-31 11:34:39', '2018-03-31 11:34:39', '2', '143459', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1439', 'OB401609756346804', '软件', '18758253247', '北京市', '市辖区', '东城区', '基地', '3', '12', '0.08', '0', '0', '800', '28', '1', '2018-04-01 13:36:15', '2018-04-01 19:21:14', '1', '764895', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1440', 'OB401612503804885', '软件', '18758253247', '北京市', '市辖区', '东城区', '基地', '', '', '0.08', '0', '0', '800', '28', '1', '2018-04-01 13:40:50', '2018-04-01 13:40:50', '1', '514775', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1441', 'OB402326007654881', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.08', '0', '0', '800', '23', '1', '2018-04-02 09:30:00', '2018-04-02 09:30:00', '1', '377866', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1442', 'OB402339250324707', '王雪', '18629604556', '浙江省', '杭州市', '西湖区', '双龙街', '', '', '0.08', '0', '0', '800', '23', '1', '2018-04-02 09:52:05', '2018-04-02 09:52:05', '1', '719214', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1443', 'OB402388221567746', '我们', '13333810611', '天津市', '市辖区', '河东区', '。h h hj', '', '', '0.08', '0', '0', '800', '23', '1', '2018-04-02 11:13:42', '2018-04-02 11:13:42', '1', '790678', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1444', 'OB402388782257681', '软件', '18758253247', '北京市', '市辖区', '东城区', '基地', '', '', '0.16', '0', '0', '1600', '28', '1', '2018-04-02 11:14:38', '2018-04-02 11:14:38', '1', '586127', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1445', 'OB402407660024772', 'wod', '13333810611', '北京市', '市辖区', '丰台区', 'hahahahha', '', '', '0.00', '1100', '0', '39', '23', '0', '2018-04-02 11:46:06', '2018-04-02 11:46:06', '1', '210447', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1446', 'OB402409963190516', '王雪峰', '18629604556', '浙江省', '杭州市', '西湖区', '金色西溪商务中心1号楼', '', '', '0.00', '0', '0', '78', '23', '0', '2018-04-02 11:49:56', '2018-04-02 11:49:56', '2', '481989', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1447', 'OB402533896078521', '王雪峰', '18629604556', '浙江省', '杭州市', '西湖区', '金色西溪商务中心1号楼', '', '', '1.00', '0', '0', '12', '23', '1', '2018-04-02 15:16:29', '2018-04-02 15:16:29', '2', '185351', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1448', 'OB402534547905479', '王雪峰', '18629604556', '浙江省', '杭州市', '西湖区', '金色西溪商务中心1号楼', '', '', '0.00', '0', '0', '12', '23', '0', '2018-04-02 15:17:34', '2018-04-02 15:17:57', '2', '237382', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1449', 'OB402537145493022', '软件', '18758253247', '北京市', '市辖区', '东城区', '基地', '', '', '0.00', '0', '0', '4800', '28', '0', '2018-04-02 15:21:54', '2018-04-02 15:21:54', '1', '370121', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1450', 'OB402578408947828', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '5.00', '0', '0', '10', '23', '1', '2018-04-02 16:30:40', '2018-04-02 16:30:40', '2', '946217', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1451', 'OB402600410929607', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '0.00', '0', '0', '10', '23', '0', '2018-04-02 17:07:21', '2018-04-02 17:08:40', '2', '678241', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1452', 'OB402603210067707', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '5.00', '0', '0', '10', '23', '1', '2018-04-02 17:12:01', '2018-04-02 17:12:01', '2', '771974', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1453', 'OB402604553281812', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '0.00', '0', '0', '10', '23', '0', '2018-04-02 17:14:15', '2018-04-02 17:15:26', '2', '278736', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1454', 'OB402605963288889', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '5.00', '0', '0', '10', '23', '1', '2018-04-02 17:16:36', '2018-04-02 17:16:36', '2', '134329', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1455', 'OB402615553400724', '软件', '18758253247', '天津市', '市辖区', '河东区', '基地。', '', '', '0.08', '0', '0', '800', '28', '1', '2018-04-02 17:32:35', '2018-04-02 17:32:35', '1', '669913', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1456', 'OB402636655116354', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '5.00', '0', '0', '10', '23', '1', '2018-04-02 18:07:45', '2018-04-02 18:07:45', '2', '219923', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1457', 'OB402636966557989', '软件', '18758253247', '天津市', '市辖区', '河东区', '基地。', '', '', '0.08', '0', '0', '800', '28', '1', '2018-04-02 18:08:16', '2018-04-02 18:08:16', '1', '271396', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1458', 'OB402637611585801', '软件', '18758253247', '天津市', '市辖区', '河东区', '基地。', '', '', '0.08', '0', '0', '800', '28', '1', '2018-04-02 18:09:21', '2018-04-02 18:09:21', '1', '123089', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1459', 'OB402638123827195', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '0.10', '0', '0', '38', '72', '1', '2018-04-02 18:10:12', '2018-04-02 18:10:12', '2', '826010', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1460', 'OB402638322901996', '软件', '18758253247', '天津市', '市辖区', '河东区', '基地。', '', '', '0.00', '0', '0', '752', '28', '0', '2018-04-02 18:10:32', '2018-04-02 18:10:32', '1', '410466', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1461', 'OB402638841161617', '软件', '18758253247', '天津市', '市辖区', '河东区', '基地。', '', '', '1.00', '0', '0', '1', '28', '1', '2018-04-02 18:11:24', '2018-04-02 18:11:24', '2', '541146', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1462', 'OB402641070834045', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '5.00', '0', '0', '228', '21', '1', '2018-04-02 18:15:07', '2018-04-02 18:15:07', '2', '706555', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1463', 'OB402641106816930', '软件', '18758253247', '天津市', '市辖区', '河东区', '基地。', '', '', '0.08', '0', '0', '800', '28', '1', '2018-04-02 18:15:10', '2018-04-02 18:15:10', '1', '538172', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1464', 'OB402641635897407', '软件', '18758253247', '天津市', '市辖区', '河东区', '基地。', '', '', '0.08', '0', '0', '800', '28', '1', '2018-04-02 18:16:03', '2018-04-02 18:16:03', '1', '806761', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1465', 'OB411386188702489', '软件', '18758253247', '天津市', '市辖区', '河东区', '基地。', '', '', '0.20', '1100', '0', '115', '28', '1', '2018-04-11 17:23:38', '2018-04-11 17:23:38', '1', '809454', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1466', 'OB411387379984181', '软件', '18758253247', '天津市', '市辖区', '河东区', '基地。', '', '', '0.20', '1100', '0', '115', '28', '1', '2018-04-11 17:25:38', '2018-04-11 17:25:38', '1', '247235', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1467', 'OB411390390991185', '史超', '15005811687', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '0.00', '1', '0', '11', '71', '0', '2018-04-11 17:30:39', '2018-04-11 17:30:39', '1', '561115', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1468', 'OB411390739372818', '史超', '15005811687', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '11.00', '1', '0', '11', '71', '2', '2018-04-11 17:31:13', '2018-04-11 17:31:13', '1', '539666', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1469', 'OB411390803717922', '史超', '15005811687', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '11.00', '1', '0', '11', '71', '2', '2018-04-11 17:31:20', '2018-04-11 17:31:20', '1', '759890', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1470', 'OB411390999308395', '史超', '15005811687', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '11.00', '1', '0', '11', '71', '2', '2018-04-11 17:31:39', '2018-04-11 17:31:39', '1', '252814', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1471', 'OB411391004351079', '史超', '15005811687', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '11.00', '1', '0', '11', '71', '2', '2018-04-11 17:31:40', '2018-04-11 17:31:40', '1', '587537', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1472', 'OB411391011196148', '史超', '15005811687', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '11.00', '1', '0', '11', '71', '2', '2018-04-11 17:31:41', '2018-04-11 17:31:41', '1', '311222', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1473', 'OB411391706429830', '史超', '15005811687', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '11.00', '1', '0', '11', '71', '2', '2018-04-11 17:32:50', '2018-04-11 17:32:50', '1', '954113', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1474', 'OB411391905826666', '史超', '15005811687', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '11.00', '1', '0', '11', '71', '2', '2018-04-11 17:33:10', '2018-04-11 17:33:10', '1', '548703', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1475', 'OB411393178056797', '史超', '15005811687', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '11.00', '1', '0', '11', '71', '2', '2018-04-11 17:35:17', '2018-04-11 17:35:17', '1', '430841', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1476', 'OB411393409393749', '史超', '15005811687', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '11.00', '1', '0', '11', '71', '2', '2018-04-11 17:35:40', '2018-04-11 17:35:40', '1', '442765', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1477', 'OB411393843758973', '史超', '15005811687', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '11.00', '1', '0', '11', '71', '2', '2018-04-11 17:36:24', '2018-04-11 17:36:24', '1', '382184', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1478', 'OB411394294848505', '软件', '18758253247', '天津市', '市辖区', '河东区', '基地。', '', '', '0.20', '1100', '0', '115', '28', '1', '2018-04-11 17:37:09', '2018-04-11 17:37:09', '1', '844034', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1479', 'OB411394516737691', '软件', '18758253247', '天津市', '市辖区', '河东区', '基地。', '', '', '0.00', '1100', '0', '115', '28', '0', '2018-04-11 17:37:31', '2018-04-11 17:37:31', '1', '966475', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1480', 'OB413068463199160', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '123.00', '0', '0', '0', '38', '2', '2018-04-13 16:07:26', '2018-04-13 16:07:26', '2', '412058', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1481', 'OB413074141864060', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '1.80', '1100', '0', '78', '23', '1', '2018-04-13 16:16:54', '2018-04-13 16:16:54', '1', '658057', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1482', 'OB413074424182806', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '1.80', '0', '0', '78', '23', '1', '2018-04-13 16:17:22', '2018-04-13 16:17:22', '2', '251401', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1483', 'OB415041558912013', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '0.00', '0', '0', '1980', '21', '0', '2018-04-15 22:55:55', '2018-04-15 22:55:55', '1', '143811', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1484', 'OB416407473163755', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '2.50', '0', '0', '1518', '21', '1', '2018-04-16 09:05:47', '2018-04-16 09:05:47', '1', '124522', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1485', 'OB416408049874273', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '0.80', '1100', '0', '218', '21', '1', '2018-04-16 09:06:44', '2018-04-16 09:06:44', '1', '508044', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1486', 'OB416410153439048', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '0.20', '1100', '0', '115', '21', '1', '2018-04-16 09:10:15', '2018-04-16 09:10:15', '1', '978002', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1487', 'OB416596476588550', '软件', '18758253247', '天津市', '市辖区', '河东区', '基地。', '', '', '0.20', '1100', '0', '115', '28', '1', '2018-04-16 14:20:47', '2018-04-16 14:20:47', '1', '692910', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1488', 'OB416596754019817', '软件', '18758253247', '天津市', '市辖区', '河东区', '基地。', '', '', '0.20', '1100', '0', '115', '28', '1', '2018-04-16 14:21:15', '2018-04-16 14:21:15', '1', '822947', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1489', 'OB416695974006884', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '0.50', '0', '0', '10', '23', '1', '2018-04-16 17:06:37', '2018-04-16 17:06:37', '2', '776651', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1490', 'OB416696567403253', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '0.50', '0', '0', '188', '23', '1', '2018-04-16 17:07:36', '2018-04-16 17:07:36', '2', '923738', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1491', 'OB417291301483470', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '123.00', '0', '0', '0', '38', '2', '2018-04-17 09:38:50', '2018-04-17 09:38:50', '2', '128115', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1492', 'OB417301321188878', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '123.00', '1', '0', '0', '38', '2', '2018-04-17 09:55:32', '2018-04-17 09:55:32', '1', '340885', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1493', 'OB417481042324113', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '123.00', '1', '0', '0', '38', '2', '2018-04-17 14:55:04', '2018-04-17 14:55:04', '1', '191691', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1494', 'OB417487945078376', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '123.00', '1', '0', '0', '38', '2', '2018-04-17 15:06:34', '2018-04-17 15:06:34', '1', '294484', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1495', 'OB417506947128476', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '12.50', '0', '0', '8150', '21', '1', '2018-04-17 15:38:14', '2018-04-17 15:38:14', '2', '949100', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1496', 'OB417511538783191', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '123.00', '1', '0', '0', '38', '2', '2018-04-17 15:45:53', '2018-04-17 15:45:53', '1', '957476', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1497', 'OB417513048082270', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '0.00', '0', '0', '1630', '21', '0', '2018-04-17 15:48:24', '2018-04-17 15:48:24', '1', '797787', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1498', 'OB417516580219092', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '0.00', '0', '0', '5280', '23', '0', '2018-04-17 15:54:18', '2018-04-17 15:54:18', '1', '892201', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1499', 'OB417521238486669', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '123.00', '1', '0', '0', '38', '2', '2018-04-17 16:02:03', '2018-04-17 16:02:03', '1', '679632', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1500', 'OB417522285014481', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '123.00', '1', '0', '0', '38', '2', '2018-04-17 16:03:48', '2018-04-17 16:03:48', '1', '776887', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1501', 'OB417532090294376', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '1.80', '0', '0', '78', '23', '1', '2018-04-17 16:20:09', '2018-04-17 16:20:09', '2', '921897', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1502', 'OB417532867474908', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '1.80', '1100', '0', '78', '23', '1', '2018-04-17 16:21:26', '2018-04-17 16:21:26', '1', '527555', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1503', 'OB417532961270736', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '1.80', '0', '0', '78', '23', '1', '2018-04-17 16:21:36', '2018-04-17 16:21:36', '2', '453759', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1504', 'OB417535869980072', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '0.50', '0', '0', '10', '23', '1', '2018-04-17 16:26:27', '2018-04-17 16:26:27', '2', '370207', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1505', 'OB417546230790340', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '123.00', '1', '0', '0', '38', '2', '2018-04-17 16:43:43', '2018-04-17 16:43:43', '1', '450624', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1506', 'OB417550383595266', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '0.50', '1100', '0', '10', '23', '1', '2018-04-17 16:50:38', '2018-04-17 16:50:38', '1', '700431', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1507', 'OB417550456673820', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '0.50', '0', '0', '10', '23', '1', '2018-04-17 16:50:45', '2018-04-17 16:50:45', '2', '330420', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1508', 'OB417562048994411', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '123.00', '1', '0', '0', '38', '2', '2018-04-17 17:10:04', '2018-04-17 17:10:04', '1', '789465', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1509', 'OB417565698496230', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '123.00', '1', '0', '0', '38', '2', '2018-04-17 17:16:09', '2018-04-17 17:16:09', '1', '271290', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1510', 'OB417567944100691', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '123.00', '1', '0', '0', '38', '2', '2018-04-17 17:19:54', '2018-04-17 17:19:54', '1', '901708', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1511', 'OB417568902281991', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '123.00', '1', '0', '0', '38', '2', '2018-04-17 17:21:30', '2018-04-17 17:21:30', '1', '327111', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1512', 'OB417570097061914', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '123.00', '1', '0', '0', '38', '2', '2018-04-17 17:23:29', '2018-04-17 17:23:29', '1', '624758', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1513', 'OB417570795832612', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '123.00', '1', '0', '0', '38', '2', '2018-04-17 17:24:39', '2018-04-17 17:24:39', '1', '953343', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1514', 'OB417571833107717', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '123.00', '1', '0', '0', '38', '2', '2018-04-17 17:26:23', '2018-04-17 17:26:23', '1', '170014', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1515', 'OB417575308900492', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '123.00', '0', '0', '0', '38', '2', '2018-04-17 17:32:10', '2018-04-17 17:32:10', '2', '939071', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1516', 'OB417577432260368', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '123.00', '1', '0', '0', '38', '2', '2018-04-17 17:35:43', '2018-04-17 17:35:43', '1', '658994', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1517', 'OB417578318897782', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '123.00', '1', '0', '0', '38', '2', '2018-04-17 17:37:11', '2018-04-17 17:37:11', '1', '646564', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1518', 'OB417578465330609', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '123.00', '0', '0', '0', '38', '2', '2018-04-17 17:37:26', '2018-04-17 17:37:26', '2', '978907', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1519', 'OB417579031442790', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '123.00', '1', '0', '0', '38', '2', '2018-04-17 17:38:23', '2018-04-17 17:38:23', '1', '192208', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1520', 'OB417579094280631', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '123.00', '1', '0', '0', '38', '2', '2018-04-17 17:38:29', '2018-04-17 17:38:29', '1', '835180', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1521', 'OB417587033464427', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '123.00', '0', '0', '0', '38', '2', '2018-04-17 17:51:43', '2018-04-17 17:51:43', '2', '119689', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1522', 'OB418407013485051', '软件', '18758253247', '天津市', '市辖区', '河东区', '基地。', '', '', '11.00', '1', '0', '11', '28', '2', '2018-04-18 16:38:21', '2018-04-18 16:38:21', '1', '920107', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1523', 'OB421956174340350', '软件', '18758253247', '天津市', '市辖区', '河东区', '基地。', '', '', '246.00', '1', '0', '0', '38', '2', '2018-04-21 15:26:57', '2018-04-21 15:26:57', '1', '579276', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1524', 'OB423523142453784', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '0.00', '0', '0', '889', '23', '0', '2018-04-23 10:58:34', '2018-04-23 10:58:34', '1', '257742', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1525', 'OB423523686711025', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '0.02', '1100', '0', '108', '21', '1', '2018-04-23 10:59:28', '2018-04-23 10:59:28', '1', '533187', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1526', 'OB424371235499770', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '2', '123456', '1.80', '0', '0', '78', '23', '1', '2018-04-24 10:32:03', '2018-04-24 10:32:31', '1', '377742', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1527', 'OB424372686139610', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '0.50', '0', '0', '10', '23', '1', '2018-04-24 10:34:28', '2018-04-24 10:34:28', '1', '390725', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1528', 'OB424529717761858', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '0.02', '0', '0', '108', '21', '1', '2018-04-24 14:56:11', '2018-04-24 14:56:11', '2', '706138', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1529', 'OB424531434359670', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '2', '123456', '1.80', '0', '0', '78', '23', '1', '2018-04-24 14:59:03', '2018-04-24 14:59:30', '1', '923519', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1530', 'OB424561179592947', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '0.50', '0', '0', '10', '23', '1', '2018-04-24 15:48:37', '2018-04-24 15:48:37', '1', '586628', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1531', 'OB424566553545766', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '123.00', '0', '0', '0', '38', '2', '2018-04-24 15:57:35', '2018-04-24 15:57:35', '1', '528424', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1532', 'OB424567177098541', '王艳娇', '13624211562', '浙江省', '杭州市', '西湖区', '金色西溪', '', '', '0.02', '0', '0', '108', '21', '1', '2018-04-24 15:58:37', '2018-04-24 15:58:37', '1', '732249', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1533', 'OB424567583623264', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '123.00', '0', '0', '0', '38', '2', '2018-04-24 15:59:18', '2018-04-24 15:59:18', '1', '325894', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1534', 'OB424569114228179', '王雪峰', '18629604556', '', '', '', '金色西溪商务中心1号楼哦哦', '', '', '123.00', '0', '0', '0', '38', '2', '2018-04-24 16:01:51', '2018-04-24 16:01:51', '1', '362730', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1535', 'OB424593599148104', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '0.50', '0', '0', '10', '23', '1', '2018-04-24 16:42:39', '2018-04-24 16:42:39', '2', '390602', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1536', 'OB424596707151914', 'wod', '13333810611', '', '', '', 'hahahahha', '2', '12346', '0.00', '0', '0', '123', '21', '0', '2018-04-24 16:47:50', '2018-04-24 17:08:40', '1', '153853', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1537', 'OB424599152920623', 'wod', '13333810611', '', '', '', 'hahahahha', '3', '12346', '11.00', '0', '0', '11', '21', '2', '2018-04-24 16:51:55', '2018-04-24 17:09:13', '1', '907185', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1538', 'OB424611682836202', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '5.00', '0', '0', '228', '21', '1', '2018-04-24 17:12:48', '2018-04-24 17:12:48', '1', '890720', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1539', 'OB425270395405520', '湖人总冠军', '14792011789', '河北省', '唐山市', '路南区', '南路', '3', '134567', '0.50', '0', '0', '10', '23', '1', '2018-04-25 11:30:39', '2018-04-25 11:31:10', '1', '414793', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1540', 'OB425271639975815', '湖人总冠军', '14792011789', '河北省', '唐山市', '路南区', '南路', '5', '12345678', '0.50', '0', '0', '10', '23', '1', '2018-04-25 11:32:44', '2018-04-25 11:33:01', '1', '682953', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1541', 'OB425287380275038', '湖人总冠军', '14792011789', '河北省', '唐山市', '路南区', '南路', '', '', '369.00', '0', '0', '0', '38', '2', '2018-04-25 11:58:58', '2018-04-25 11:58:58', '1', '626148', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1542', 'OB425359016544701', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:21', '2018-04-25 13:58:21', '1', '718489', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1543', 'OB425359061757162', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:26', '2018-04-25 13:58:26', '1', '731417', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1544', 'OB425359111049877', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:31', '2018-04-25 13:58:31', '1', '836961', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1545', 'OB425359115438138', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:31', '2018-04-25 13:58:31', '1', '655068', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1546', 'OB425359118537567', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:31', '2018-04-25 13:58:31', '1', '729822', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1547', 'OB425359153940751', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:35', '2018-04-25 13:58:35', '1', '114721', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1548', 'OB425359155763731', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:35', '2018-04-25 13:58:35', '1', '967044', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1549', 'OB425359248834850', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:44', '2018-04-25 13:58:44', '1', '906461', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1550', 'OB425359264094121', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:46', '2018-04-25 13:58:46', '1', '467931', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1551', 'OB425359264275235', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:46', '2018-04-25 13:58:46', '1', '977242', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1552', 'OB425359265124850', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:46', '2018-04-25 13:58:46', '1', '532866', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1553', 'OB425359267329877', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:46', '2018-04-25 13:58:46', '1', '508150', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1554', 'OB425359267604346', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:46', '2018-04-25 13:58:46', '1', '960698', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1555', 'OB425359267976627', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:46', '2018-04-25 13:58:46', '1', '484661', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1556', 'OB425359267977754', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:46', '2018-04-25 13:58:46', '1', '685212', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1557', 'OB425359268245284', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:46', '2018-04-25 13:58:46', '1', '784934', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1558', 'OB425359268283462', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:46', '2018-04-25 13:58:46', '1', '686457', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1559', 'OB425359269494630', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:46', '2018-04-25 13:58:46', '1', '164621', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1560', 'OB425359288135826', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:48', '2018-04-25 13:58:48', '1', '420562', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1561', 'OB425359290383244', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:49', '2018-04-25 13:58:49', '1', '131402', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1562', 'OB425359298262845', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:49', '2018-04-25 13:58:49', '1', '776746', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1563', 'OB425359298265565', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:49', '2018-04-25 13:58:49', '1', '197451', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1564', 'OB425359299300901', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:49', '2018-04-25 13:58:49', '1', '282847', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1565', 'OB425359299302495', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:49', '2018-04-25 13:58:49', '1', '860670', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1566', 'OB425359302015584', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 13:58:50', '2018-04-25 13:58:50', '1', '373026', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1567', 'OB425360472969942', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-25 14:00:47', '2018-04-25 14:00:47', '1', '300299', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1568', 'OB425365605533776', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '123.00', '0', '0', '0', '38', '2', '2018-04-25 14:09:20', '2018-04-25 14:09:20', '1', '404218', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1569', 'OB425385676894631', 'wod', '13333810611', '', '', '', 'hahahahha', '', '', '0.00', '0', '0', '0', '38', '0', '2018-04-25 14:42:47', '2018-04-25 14:42:47', '1', '984073', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1570', 'OB425468159315273', '湖人总冠军', '14792011789', '河北省', '唐山市', '路南区', '南路', '', '', '1.80', '0', '0', '78', '23', '1', '2018-04-25 17:00:15', '2018-04-25 17:00:15', '1', '356397', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1571', 'OB426241663136444', '湖人总冠军', '14792011789', '河北省', '唐山市', '路南区', '南路', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-26 14:29:26', '2018-04-26 14:29:26', '1', '677740', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1572', 'OB426241901676175', '湖人总冠军', '14792011789', '河北省', '唐山市', '路南区', '南路', '', '', '123.00', '0', '0', '0', '38', '2', '2018-04-26 14:29:50', '2018-04-26 14:29:50', '1', '737239', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1573', 'OB426376090329649', '软件', '18758253247', '天津市', '市辖区', '河东区', '基地。', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-26 18:13:29', '2018-04-26 18:13:29', '1', '699019', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1574', 'OB426376188953986', '软件', '18758253247', '天津市', '市辖区', '河东区', '基地。', '', '', '246.00', '0', '0', '0', '38', '2', '2018-04-26 18:13:38', '2018-04-26 18:13:38', '1', '486021', '100', '1');
INSERT INTO `tb_goods_order` VALUES ('1575', 'OB521883985902345', '软件', '18758253247', '天津市', '市辖区', '河东区', '基地。', '', '', '0.08', '0', '0', '800', '28', '1', '2018-05-21 15:39:58', '2018-05-21 15:39:58', '1', '983307', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1576', 'OB521884252784841', '软件', '18758253247', '天津市', '市辖区', '河东区', '基地。', '', '', '11.00', '0', '0', '1', '28', '2', '2018-05-21 15:40:25', '2018-05-21 15:40:25', '1', '205157', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1577', 'OB521884537030005', '软件', '18758253247', '天津市', '市辖区', '河东区', '基地。', '', '', '11.00', '0', '0', '1', '28', '2', '2018-05-21 15:40:53', '2018-05-21 15:40:53', '1', '450861', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1578', 'OB521884960862151', '软件', '18758253247', '天津市', '市辖区', '河东区', '基地。', '', '', '11.00', '0', '0', '1', '28', '2', '2018-05-21 15:41:36', '2018-05-21 15:41:36', '1', '448494', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1579', 'OB628714891796973', '站我跟', '18672131252', '山西省', '太原市', '市辖区', '111', '', '', '0.60', '0', '0', '398', '21', '1', '2018-06-28 15:38:09', '2018-06-28 15:38:09', '1', '698862', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1580', 'OB629419970781994', '站我跟', '18672131252', '山西省', '太原市', '市辖区', '111', '', '', '0.60', '0', '0', '398', '21', '1', '2018-06-29 11:13:17', '2018-06-29 11:13:17', '1', '103774', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1581', 'OB629472115742596', '站我跟', '18672131252', '山西省', '太原市', '市辖区', '111', '', '', '0.60', '0', '0', '398', '21', '1', '2018-06-29 12:40:11', '2018-06-29 12:40:11', '2', '392604', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1582', 'OB629542603559016', '站我跟', '18672131252', '山西省', '太原市', '市辖区', '111', '', '', '0.60', '0', '0', '398', '21', '1', '2018-06-29 14:37:40', '2018-06-29 14:37:40', '2', '281885', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1583', 'OB711756622869385', '站我跟', '18672131252', '山西省', '太原市', '市辖区', '111', '', '', '0.60', '0', '0', '398', '21', '1', '2018-07-11 10:21:02', '2018-07-11 10:21:02', '1', '223254', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1584', 'OB711758389274172', '站我跟', '18672131252', '山西省', '太原市', '市辖区', '111', '', '', '0.60', '0', '0', '398', '21', '1', '2018-07-11 10:23:58', '2018-07-11 10:23:58', '1', '812504', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1585', 'OB711765592673542', '站我跟', '18672131252', '山西省', '太原市', '市辖区', '111', '', '', '0.60', '0', '0', '398', '21', '1', '2018-07-11 10:35:59', '2018-07-11 10:35:59', '1', '703495', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1586', 'OB711772386710896', '站我跟', '18672131252', '山西省', '太原市', '市辖区', '111', '', '', '0.20', '0', '0', '58', '21', '1', '2018-07-11 10:47:18', '2018-07-11 10:47:18', '1', '596902', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1587', 'OB718069808102269', '站我跟', '18672131252', '山西省', '太原市', '市辖区', '111', '', '', '0.02', '0', '0', '108', '21', '1', '2018-07-18 17:43:00', '2018-07-18 17:43:00', '1', '745284', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1588', 'OB718070128596048', '站我跟', '18672131252', '山西省', '太原市', '市辖区', '111', '', '', '0.02', '0', '0', '108', '21', '1', '2018-07-18 17:43:32', '2018-07-18 17:43:32', '1', '454678', '0', '1');
INSERT INTO `tb_goods_order` VALUES ('1589', 'OB718189353734522', '站我跟', '18672131252', '山西省', '太原市', '市辖区', '111', '', '', '0.02', '0', '0', '108', '21', '1', '2018-07-18 21:02:15', '2018-07-18 21:02:15', '1', '266045', '0', '1');

-- ----------------------------
-- Table structure for tb_image
-- ----------------------------
DROP TABLE IF EXISTS `tb_image`;
CREATE TABLE `tb_image` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_image
-- ----------------------------
INSERT INTO `tb_image` VALUES ('1', '123');
INSERT INTO `tb_image` VALUES ('2', '234');

-- ----------------------------
-- Table structure for tb_login_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_login_log`;
CREATE TABLE `tb_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adminId` int(11) unsigned NOT NULL COMMENT '管理员id',
  `merchantId` int(11) unsigned NOT NULL COMMENT '商户Id ',
  `shopId` int(11) unsigned NOT NULL COMMENT '店铺ID ',
  `ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'IP地址',
  `operator` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '运营商',
  `country` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '国家',
  `province` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '省',
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '市',
  `county` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '区/县',
  `area` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '详细地址',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '登录状态 0--失败  1--成功 ',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1--商户 2--店铺',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '编辑',
  PRIMARY KEY (`id`),
  KEY `creattime` (`createTime`),
  KEY `edittime` (`updateTime`),
  KEY `ip` (`ip`),
  KEY `admin_member_id` (`adminId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='管理员登录记录';

-- ----------------------------
-- Records of tb_login_log
-- ----------------------------
INSERT INTO `tb_login_log` VALUES ('1', '1', '1', '1', '221.12.12.47', '联通', '中国', '浙江', '杭州', 'XX', '', '1', '2', '2018-10-28 12:56:30', '0000-00-00 00:00:00');
INSERT INTO `tb_login_log` VALUES ('2', '1', '1', '1', '221.12.12.47', '联通', '中国', '浙江', '杭州', 'XX', '', '1', '2', '2018-10-28 12:56:53', '0000-00-00 00:00:00');
INSERT INTO `tb_login_log` VALUES ('3', '1', '1', '1', '127.0.0.1', '内网IP', 'XX', 'XX', '内网IP', '内网IP', '', '1', '2', '2018-10-28 13:01:04', '0000-00-00 00:00:00');
INSERT INTO `tb_login_log` VALUES ('4', '1', '1', '1', '127.0.0.1', '内网IP', 'XX', 'XX', '内网IP', '内网IP', '', '1', '2', '2018-10-28 13:03:53', '0000-00-00 00:00:00');
INSERT INTO `tb_login_log` VALUES ('5', '1', '1', '1', '127.0.0.1', '内网IP', 'XX', 'XX', '内网IP', '内网IP', '', '1', '2', '2018-10-28 13:04:53', '0000-00-00 00:00:00');
INSERT INTO `tb_login_log` VALUES ('6', '1', '1', '1', '221.12.12.47', '221.12.12.47', '联通', '中国', '浙江', '杭州', 'XX', '0', '1', '0000-00-00 00:00:00', '2018-10-28 12:56:30');
INSERT INTO `tb_login_log` VALUES ('7', '1', '1', '1', '221.12.12.47', '221.12.12.47', '联通', '中国', '浙江', '杭州', 'XX', '0', '2', '0000-00-00 00:00:00', '2018-10-28 12:56:53');
INSERT INTO `tb_login_log` VALUES ('11', '1', '1', '1', '127.0.0.1', '内网IP', 'XX', 'XX', '内网IP', '内网IP', '', '1', '2', '2018-10-28 13:53:42', '0000-00-00 00:00:00');
INSERT INTO `tb_login_log` VALUES ('12', '1', '1', '1', '127.0.0.1', '内网IP', 'XX', 'XX', '内网IP', '内网IP', '', '1', '2', '2018-10-30 16:56:10', '0000-00-00 00:00:00');
INSERT INTO `tb_login_log` VALUES ('13', '1', '1', '1', '127.0.0.1', '内网IP', 'XX', 'XX', '内网IP', '内网IP', '', '1', '2', '2018-11-01 10:12:49', '0000-00-00 00:00:00');
INSERT INTO `tb_login_log` VALUES ('14', '1', '1', '1', '127.0.0.1', '内网IP', 'XX', 'XX', '内网IP', '内网IP', '', '1', '2', '2018-11-03 22:20:36', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for tb_merchant
-- ----------------------------
DROP TABLE IF EXISTS `tb_merchant`;
CREATE TABLE `tb_merchant` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '商户名称',
  `realname` varchar(50) NOT NULL COMMENT '申请人姓名',
  `mobile` char(11) NOT NULL COMMENT '手机',
  `landline` char(12) DEFAULT NULL COMMENT '座机',
  `province` varchar(30) NOT NULL COMMENT '省',
  `city` varchar(30) NOT NULL COMMENT '市',
  `county` varchar(30) NOT NULL,
  `area` varchar(50) NOT NULL COMMENT '地址',
  `license` varchar(150) DEFAULT NULL COMMENT '营业执照',
  `scope` varchar(255) DEFAULT NULL COMMENT '经营范围',
  `IDPositive` varchar(150) NOT NULL COMMENT '省份证正面',
  `IDNegative` varchar(150) NOT NULL COMMENT '身份证反面',
  `IDCard` varchar(20) DEFAULT NULL COMMENT '省份证号码',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1--个人  2--商户【店面】 3--企业',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1--待审核 2--审核失败  3--审核通过',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商户表';

-- ----------------------------
-- Records of tb_merchant
-- ----------------------------
INSERT INTO `tb_merchant` VALUES ('1', 'ammas', '李四', '19900000000', '005-7239861', '安徽省', '芜湖市', '弋江区', '利民路999号', '\\uploads\\merchant\\checkin\\timg.jpg', '电子商务', '\\uploads\\merchant\\checkin\\idp.jpg', '\\uploads\\merchant\\checkin\\idp.jpg', '340222199202016616', '1', '3', '材料齐全', '2018-10-27 18:24:49', '2018-10-27 17:59:25');
INSERT INTO `tb_merchant` VALUES ('2', 'gedi', '王虎', '19900000000', '005-7239861', '安徽省', '芜湖市', '弋江区', '利民路999号', '\\uploads\\merchant\\checkin\\timg.jpg', '电子商务', '\\uploads\\merchant\\checkin\\idp.jpg', '\\uploads\\merchant\\checkin\\idp.jpg', '340222199202016616', '3', '1', '材料齐全', '2018-10-28 10:14:13', '2018-10-27 17:59:25');
INSERT INTO `tb_merchant` VALUES ('3', 'ammas', '李四', '19900000000', '005-7239861', '山西省', '长治市', '城区', '利民路999号', '\\uploads\\merchant\\checkin\\timg.jpg', '电子商务', '\\uploads\\merchant\\checkin\\idp.jpg', '\\uploads\\merchant\\checkin\\idp.jpg', '340222199202016616', '2', '2', '材料齐全', '2018-10-28 10:14:05', '2018-10-27 17:59:25');

-- ----------------------------
-- Table structure for tb_merchant_verify_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_merchant_verify_record`;
CREATE TABLE `tb_merchant_verify_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `merchantId` int(11) unsigned NOT NULL COMMENT '商户ID ',
  `adminId` int(11) unsigned NOT NULL COMMENT '操作人ID',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1--待审核 2--审核失败  3--审核通过',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1--个人  2--商户【店面】 3--企业',
  `createTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_merchant_verify_record
-- ----------------------------
INSERT INTO `tb_merchant_verify_record` VALUES ('3', '1', '1', '省份证不侵袭', '2', '1', '2018-10-27 18:19:59');
INSERT INTO `tb_merchant_verify_record` VALUES ('4', '1', '1', '材料齐全', '3', '1', '2018-10-27 18:19:51');
INSERT INTO `tb_merchant_verify_record` VALUES ('5', '3', '1', '材料齐全', '3', '1', '2018-10-27 18:30:25');
INSERT INTO `tb_merchant_verify_record` VALUES ('6', '3', '1', '材料齐全', '2', '1', '2018-10-27 18:31:02');
INSERT INTO `tb_merchant_verify_record` VALUES ('7', '3', '1', '材料齐全', '2', '1', '2018-10-27 18:32:40');
INSERT INTO `tb_merchant_verify_record` VALUES ('8', '3', '1', '材料齐全', '2', '2', '2018-10-28 10:14:05');
INSERT INTO `tb_merchant_verify_record` VALUES ('9', '2', '1', '材料齐全', '1', '3', '2018-10-28 10:14:13');

-- ----------------------------
-- Table structure for tb_position
-- ----------------------------
DROP TABLE IF EXISTS `tb_position`;
CREATE TABLE `tb_position` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `positionName` varchar(50) NOT NULL COMMENT '职位名称',
  `positionCode` varchar(7) NOT NULL COMMENT '职位代码 ',
  `parentId` int(11) unsigned NOT NULL DEFAULT '0',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_position
-- ----------------------------

-- ----------------------------
-- Table structure for tb_privilege
-- ----------------------------
DROP TABLE IF EXISTS `tb_privilege`;
CREATE TABLE `tb_privilege` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `merchantId` int(11) unsigned NOT NULL COMMENT '商户ID',
  `shopId` int(11) unsigned NOT NULL COMMENT '店铺ID ',
  `roleType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1--商户  2--店铺',
  `privilegeName` varchar(50) NOT NULL COMMENT '权限名称',
  `privilegeCode` char(7) NOT NULL COMMENT '权限代码 ',
  `parentId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `controller` varchar(50) NOT NULL COMMENT '控制器名称',
  `model` varchar(50) NOT NULL COMMENT '模型名称',
  `action` varchar(50) NOT NULL COMMENT '方法名称',
  `parameter` varchar(255) NOT NULL COMMENT '参数',
  `orderNo` mediumint(6) unsigned NOT NULL DEFAULT '1',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型  1|菜单 2| 权限 3|菜单+权限',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间 ',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_privilege
-- ----------------------------
INSERT INTO `tb_privilege` VALUES ('1', '0', '0', '0', '后台首页', '', '0', 'default', 'admin', 'default', '', '9999', '1', '任何可以登录后台的人员必须拥有该权限', '2018-09-19 20:13:51', '2018-09-19 20:13:51');
INSERT INTO `tb_privilege` VALUES ('2', '0', '0', '0', '管理控制台', '', '1', 'index', 'admin', 'index', '', '999', '2', '任何可以登录后台的人员必须拥有该权限', '2018-09-19 20:11:38', '2018-09-19 20:11:38');
INSERT INTO `tb_privilege` VALUES ('3', '0', '0', '0', '权限管理', '', '0', 'privilege', 'admin', 'default', '', '1000', '1', '', '2018-09-17 09:24:48', '2018-09-17 09:24:48');
INSERT INTO `tb_privilege` VALUES ('5', '0', '0', '0', '角色管理', '', '3', 'role', 'admin', 'index', '', '1000', '3', '', '2018-09-17 09:21:59', '2018-09-17 09:21:59');
INSERT INTO `tb_privilege` VALUES ('6', '0', '0', '0', '菜单权限', '', '3', 'privilege', 'admin', 'index', '', '999', '1', '', '2018-08-29 17:34:32', '2018-08-29 17:34:32');
INSERT INTO `tb_privilege` VALUES ('8', '0', '0', '0', '角色新增', '', '5', 'role', 'admin', 'add', '', '1001', '2', '', '2018-09-06 14:31:16', '2018-09-06 14:31:16');
INSERT INTO `tb_privilege` VALUES ('9', '0', '0', '0', '角色编辑', '', '5', 'role', 'admin', 'edit', '', '1000', '2', '', '2018-09-06 14:31:23', '2018-09-06 14:31:23');
INSERT INTO `tb_privilege` VALUES ('10', '0', '0', '0', '设置权限', '', '5', 'role', 'admin', 'setPrivilege', '', '1000', '2', '', '2018-09-11 19:40:49', '2018-09-06 14:31:30');
INSERT INTO `tb_privilege` VALUES ('11', '0', '0', '0', '权限新增', '', '6', 'privilege', 'admin', 'add', '', '1000', '2', '', '2018-09-06 14:54:38', '2018-09-06 14:54:38');
INSERT INTO `tb_privilege` VALUES ('12', '0', '0', '0', '权限编辑', '', '6', 'privilege', 'admin', 'edit', '', '1000', '2', '', '2018-09-06 14:54:43', '2018-09-06 14:54:43');
INSERT INTO `tb_privilege` VALUES ('13', '0', '0', '0', '下级权限', '', '6', 'privilege', 'admin', 'son', '', '1000', '2', '', '2018-09-06 14:54:21', '2018-09-06 14:54:20');
INSERT INTO `tb_privilege` VALUES ('14', '0', '0', '0', '权限删除', '', '6', 'privilege', 'admin', 'delete', '', '1000', '2', '', '2018-09-06 14:54:27', '2018-09-06 14:54:27');
INSERT INTO `tb_privilege` VALUES ('15', '0', '0', '0', '站长工具', '', '0', 'default', 'admin', 'default', '', '1000', '1', '', '2018-09-17 09:23:05', '2018-09-17 09:23:05');
INSERT INTO `tb_privilege` VALUES ('16', '0', '0', '0', '登录日志', '', '15', 'adminLoginLog', 'admin', 'lst', '', '1000', '3', '', '2018-09-17 09:25:48', '2018-09-17 09:25:48');
INSERT INTO `tb_privilege` VALUES ('17', '0', '0', '0', '人员管理', '', '0', 'default', 'admin', 'default', '', '1000', '1', '', '2018-09-17 09:23:35', '2018-09-17 09:23:35');
INSERT INTO `tb_privilege` VALUES ('18', '0', '0', '0', '人员管理', '', '17', 'admin', 'admin', 'lst', '', '1000', '3', '', '2018-09-17 09:23:56', '2018-09-17 09:23:56');
INSERT INTO `tb_privilege` VALUES ('19', '0', '0', '0', '人员新增', '', '18', 'admin', 'admin', 'add', '', '1000', '2', '', '2018-09-06 15:01:34', '2018-09-06 15:01:34');
INSERT INTO `tb_privilege` VALUES ('20', '0', '0', '0', '人员编辑', '', '18', 'admin', 'admin', 'edit', '', '1000', '1', '', '2018-09-06 15:02:09', null);
INSERT INTO `tb_privilege` VALUES ('21', '0', '0', '0', '部门管理', '', '17', 'department', 'admin', 'lst', '', '1000', '3', '', '2018-09-17 09:24:35', '2018-09-17 09:24:35');
INSERT INTO `tb_privilege` VALUES ('24', '0', '0', '0', '部门新增', '', '21', 'department', 'admin', 'add', '', '1000', '2', '', '2018-09-06 15:15:04', '2018-09-06 15:15:04');
INSERT INTO `tb_privilege` VALUES ('25', '0', '0', '0', '部门编辑', '', '21', 'department', 'admin', 'edit', '', '1000', '2', '', '2018-09-06 15:25:42', null);
INSERT INTO `tb_privilege` VALUES ('26', '0', '0', '0', '个人中心 ', '', '0', 'default', 'admin', 'default', '', '9998', '1', '', '2018-09-11 19:25:30', '2018-09-11 19:25:30');
INSERT INTO `tb_privilege` VALUES ('27', '0', '0', '0', '个人资料', '', '26', 'personal', 'admin', 'profile', '', '1000', '2', '', '2018-09-11 19:23:56', null);
INSERT INTO `tb_privilege` VALUES ('29', '0', '0', '0', '人员列表', '', '21', 'department', 'admin', 'adminList', '', '1000', '2', '', '2018-09-12 09:02:32', null);
INSERT INTO `tb_privilege` VALUES ('30', '0', '0', '0', 'Banner管理', '', '0', 'default', 'banner', 'default', '', '1000', '1', '', '2018-09-17 09:25:16', '2018-09-17 09:25:16');
INSERT INTO `tb_privilege` VALUES ('32', '0', '0', '0', 'Banner分类新增', '', '34', 'bannerCategory', 'admin', 'add', '', '1000', '2', '', '2018-09-12 19:43:51', null);
INSERT INTO `tb_privilege` VALUES ('33', '0', '0', '0', 'Banner分类编辑', '', '34', 'bannerCategory', 'admin', 'edit', '', '1000', '2', '', '2018-09-12 19:43:51', null);
INSERT INTO `tb_privilege` VALUES ('34', '0', '0', '0', 'Banner分类', '', '30', 'bannerCategory', 'admin', 'lst', '', '1000', '3', '', '2018-09-17 09:25:25', '2018-09-17 09:25:25');
INSERT INTO `tb_privilege` VALUES ('35', '0', '0', '0', 'Banner管理', '', '30', 'banner', 'admin', 'lst', '', '1000', '2', '', '2018-09-12 19:47:39', null);
INSERT INTO `tb_privilege` VALUES ('36', '0', '0', '0', 'Banner新增', '', '35', 'banner', 'admin', 'add', '', '1000', '2', '', '2018-09-12 19:49:03', null);
INSERT INTO `tb_privilege` VALUES ('37', '0', '0', '0', 'Banner编辑', '', '35', 'Banner', 'admin', 'edit', '', '1000', '2', '', '2018-09-12 19:51:20', null);
INSERT INTO `tb_privilege` VALUES ('38', '0', '0', '0', 'Banner分类删除', '', '34', 'bannerCategory', 'admin', 'delete', '', '1000', '2', '', '2018-09-15 18:59:09', '2018-09-15 18:59:09');
INSERT INTO `tb_privilege` VALUES ('39', '0', '0', '0', 'Banner删除', '', '35', 'banner', 'admin', 'delete', '', '1000', '2', '', '2018-09-19 15:36:33', null);
INSERT INTO `tb_privilege` VALUES ('40', '0', '0', '0', '系统设置', '', '0', 'default', 'admin', 'default', '', '1000', '1', '', '2018-09-19 20:18:45', null);
INSERT INTO `tb_privilege` VALUES ('41', '0', '0', '0', '系统设置', '', '40', 'setting', 'admin', 'lst', '', '1000', '2', '', '2018-09-20 14:18:19', '2018-09-20 14:18:19');
INSERT INTO `tb_privilege` VALUES ('42', '0', '0', '0', '修改密码', '', '26', 'personal', 'admin', 'password', '', '1000', '3', '', '2018-09-20 19:45:11', '2018-09-20 19:45:11');
INSERT INTO `tb_privilege` VALUES ('43', '0', '0', '0', '商品管理', '', '0', 'goods', 'admin', 'default', '', '1000', '1', '', '2018-10-24 18:34:33', null);
INSERT INTO `tb_privilege` VALUES ('44', '0', '0', '0', '属性管理', '', '43', 'goodsAttribute', 'admin', 'lst', '', '1000', '2', '', '2018-10-24 19:45:41', '2018-10-24 19:45:41');
INSERT INTO `tb_privilege` VALUES ('46', '0', '0', '0', '属性新增', '', '44', 'goodsAttribute', 'admin', 'add', '', '1000', '2', '', '2018-10-24 19:45:58', '2018-10-24 19:45:58');
INSERT INTO `tb_privilege` VALUES ('47', '0', '0', '0', '属性编辑', '', '44', 'goodsAttribute', 'admin', 'edit', '', '1000', '2', '', '2018-10-24 19:46:06', '2018-10-24 19:46:06');
INSERT INTO `tb_privilege` VALUES ('48', '0', '0', '0', '属性删除', '', '44', 'goodsAttribute', 'admin', 'delete', '', '1000', '2', '', '2018-10-24 19:46:34', '2018-10-24 19:46:34');
INSERT INTO `tb_privilege` VALUES ('49', '0', '0', '0', '商户管理', '', '0', 'Merchant', 'admin', 'default', '', '1000', '3', '', '2018-10-26 16:58:45', null);
INSERT INTO `tb_privilege` VALUES ('50', '0', '0', '0', '商户管理', '', '49', 'Merchant', 'admin', 'lst', '', '1000', '3', '', '2018-10-26 16:59:59', null);
INSERT INTO `tb_privilege` VALUES ('51', '0', '0', '0', '入住申请', '', '49', 'Merchant', 'admin', 'checkin', '', '1000', '2', '', '2018-10-26 17:22:56', null);
INSERT INTO `tb_privilege` VALUES ('52', '0', '0', '0', '申请审核', '', '51', 'merchant', 'admin', 'verify', '', '1000', '2', '', '2018-10-26 17:24:04', '2018-10-26 17:24:04');
INSERT INTO `tb_privilege` VALUES ('54', '0', '0', '0', '商户详细', '', '50', 'merchant', 'admin', 'info', '', '1000', '2', '', '2018-10-27 19:04:03', null);
INSERT INTO `tb_privilege` VALUES ('55', '1', '1', '2', '主控制台', '', '0', 'index', 'shop', 'index', '', '1000', '3', '所有人都分配该权限', '2018-10-31 20:02:01', '2018-10-31 20:02:01');
INSERT INTO `tb_privilege` VALUES ('56', '1', '1', '2', '权限管理', '', '0', 'default', 'shop', 'default', '', '1000', '1', '', '2018-10-30 09:33:41', null);
INSERT INTO `tb_privilege` VALUES ('57', '1', '1', '2', '角色管理', '', '56', 'role', 'shop', 'index', '', '1000', '3', '', '2018-10-30 09:35:58', null);
INSERT INTO `tb_privilege` VALUES ('58', '1', '1', '2', '角色管理', '', '57', 'role', 'shop', 'add', '', '1000', '2', '', '2018-10-30 09:37:33', null);
INSERT INTO `tb_privilege` VALUES ('59', '1', '1', '2', '角色编辑', '', '57', 'role', 'shop', 'edit', '', '1000', '2', '', '2018-10-30 09:38:00', null);
INSERT INTO `tb_privilege` VALUES ('60', '1', '1', '2', '权限管理', '', '56', 'privilege', 'shop', 'index', '', '1000', '3', '', '2018-10-30 09:38:54', null);
INSERT INTO `tb_privilege` VALUES ('61', '1', '1', '2', '权限新增', '', '60', 'privilege', 'shop', 'add', '', '1000', '2', '', '2018-10-30 10:02:54', '2018-10-30 10:02:54');
INSERT INTO `tb_privilege` VALUES ('62', '1', '1', '2', '权限编辑', '', '60', 'privilege', 'shop', 'edit', '', '1000', '2', '', '2018-10-30 09:40:11', null);
INSERT INTO `tb_privilege` VALUES ('63', '1', '1', '2', '权限删除', '', '60', 'privilege', 'shop', 'delete', '', '1000', '2', '', '2018-10-30 09:41:46', null);
INSERT INTO `tb_privilege` VALUES ('64', '1', '1', '2', '人员管理', '', '0', 'default', 'shop', 'default', '', '1000', '1', '', '2018-10-30 18:25:24', '2018-10-30 18:25:24');
INSERT INTO `tb_privilege` VALUES ('65', '1', '1', '2', '部门管理', '', '64', 'department', 'shop', 'lst', '', '1000', '3', '', '2018-10-30 18:27:47', '2018-10-30 18:27:47');
INSERT INTO `tb_privilege` VALUES ('66', '1', '1', '2', '部门新增', '', '65', 'department', 'shop', 'add', '', '1000', '2', '', '2018-10-30 18:28:28', null);
INSERT INTO `tb_privilege` VALUES ('67', '1', '1', '2', '部门编辑', '', '65', 'department', 'shop', 'edit', '', '1000', '2', '', '2018-10-30 18:28:48', null);
INSERT INTO `tb_privilege` VALUES ('68', '1', '1', '2', '人员管理', '', '64', 'admin', 'shop', 'lst', '', '1000', '3', '', '2018-10-30 18:29:29', '2018-10-30 18:29:29');
INSERT INTO `tb_privilege` VALUES ('69', '1', '1', '2', '人员新增', '', '68', 'admin', 'shop', 'add', '', '1000', '2', '', '2018-10-30 18:30:00', null);
INSERT INTO `tb_privilege` VALUES ('70', '1', '1', '2', '人员编辑', '', '68', 'admin', 'shop', 'edit', '', '1000', '2', '', '2018-10-30 18:30:32', null);
INSERT INTO `tb_privilege` VALUES ('71', '1', '1', '2', '设置权限', '', '57', 'role', 'shop', 'setPrivilege', '', '1000', '2', '', '2018-10-31 19:58:14', null);
INSERT INTO `tb_privilege` VALUES ('72', '1', '1', '2', '人员列表', '', '65', 'department', 'shop', 'adminList', '', '1000', '2', '', '2018-10-31 20:45:01', null);
INSERT INTO `tb_privilege` VALUES ('73', '1', '1', '2', 'Banner管理', '', '0', 'default', 'shop', 'default', '', '1000', '3', '', '2018-11-01 20:11:40', '2018-11-01 20:11:40');
INSERT INTO `tb_privilege` VALUES ('74', '1', '1', '2', 'Banner分类', '', '73', 'bannerCategory', 'shop', 'lst', '', '1000', '3', '', '2018-11-01 20:12:24', null);
INSERT INTO `tb_privilege` VALUES ('75', '1', '1', '2', '分类新增', '', '74', 'bannerCategory', 'shop', 'add', '', '1000', '2', '', '2018-11-01 20:12:54', null);
INSERT INTO `tb_privilege` VALUES ('76', '1', '1', '2', '分类编辑', '', '74', 'bannerCategory', 'shop', 'edit', '', '1000', '2', '', '2018-11-01 20:13:36', null);
INSERT INTO `tb_privilege` VALUES ('77', '1', '1', '2', 'Banner管理', '', '73', 'banner', 'shop', 'lst', '', '1000', '3', '', '2018-11-01 20:14:03', null);
INSERT INTO `tb_privilege` VALUES ('78', '1', '1', '2', 'Banner新增', '', '77', 'banner', 'shop', 'add', '', '1000', '2', '', '2018-11-01 20:14:26', null);
INSERT INTO `tb_privilege` VALUES ('79', '1', '1', '2', 'Banner编辑', '', '77', 'banner', 'shop', 'edit', '', '1000', '2', '', '2018-11-01 20:14:49', null);
INSERT INTO `tb_privilege` VALUES ('80', '1', '1', '2', 'Banner删除', '', '77', 'banner', 'shop', 'delete', '', '1000', '2', '', '2018-11-03 21:56:48', null);

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `merchantId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商户ID',
  `shopId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `roleName` varchar(50) NOT NULL COMMENT '角色名称',
  `orderNo` smallint(6) unsigned NOT NULL DEFAULT '1000' COMMENT '排序值',
  `roleCode` char(10) NOT NULL DEFAULT '' COMMENT '角色代码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态  0--删除 1--正常 2--冻结',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `roleType` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT ' 0--平台 1--商户  2--店铺',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('1', '0', '0', '超级管理', '9999', '', '1', '', '0', '2018-10-28 14:30:21', '2018-09-19 19:55:27');
INSERT INTO `tb_role` VALUES ('2', '0', '0', '财务主管', '999', '', '1', null, '0', '2018-10-28 14:30:21', null);
INSERT INTO `tb_role` VALUES ('3', '0', '0', '产品主管', '1000', '', '1', '', '0', '2018-10-28 14:30:21', null);
INSERT INTO `tb_role` VALUES ('4', '0', '0', '运营主管', '998', '', '1', '', '0', '2018-10-28 14:30:21', null);
INSERT INTO `tb_role` VALUES ('5', '0', '0', '技术主管', '1000', '', '1', '', '0', '2018-10-28 14:30:21', null);
INSERT INTO `tb_role` VALUES ('6', '0', '0', '设计主管', '1000', '', '1', '', '0', '2018-10-28 14:30:21', null);
INSERT INTO `tb_role` VALUES ('7', '0', '0', '人事主管', '1000', '', '1', '', '0', '2018-10-28 14:30:21', null);
INSERT INTO `tb_role` VALUES ('10', '1', '1', '店长', '1000', '', '1', '', '2', '2018-10-30 18:14:28', '2018-10-30 18:14:28');
INSERT INTO `tb_role` VALUES ('11', '1', '1', '店员', '1000', '', '1', '', '2', '2018-10-30 18:14:35', '2018-10-30 18:14:35');

-- ----------------------------
-- Table structure for tb_role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_privilege`;
CREATE TABLE `tb_role_privilege` (
  `roleId` int(11) unsigned NOT NULL COMMENT '角色ID',
  `privilegeId` int(11) unsigned NOT NULL COMMENT '权限ID ',
  `merchantId` int(11) unsigned NOT NULL DEFAULT '0',
  `shopId` int(11) unsigned NOT NULL DEFAULT '0',
  `roleType` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role_privilege
-- ----------------------------
INSERT INTO `tb_role_privilege` VALUES ('3', '1', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('3', '2', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('3', '3', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('3', '5', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('3', '8', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('3', '9', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('3', '10', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('3', '6', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('3', '11', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('3', '12', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('3', '13', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('3', '14', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('5', '1', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('5', '2', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('5', '3', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('5', '5', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('5', '8', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('5', '9', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('5', '10', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('5', '6', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('5', '11', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('5', '12', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('5', '13', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('5', '14', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('5', '15', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('5', '16', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '1', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '2', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '3', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '5', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '8', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '9', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '10', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '6', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '11', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '12', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '13', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '14', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '15', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '16', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '17', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '18', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '19', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '20', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '21', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '24', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '25', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '29', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '26', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '27', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '42', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '30', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '34', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '32', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '33', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '38', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '35', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '36', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '37', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '39', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '40', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '41', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '43', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '44', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '46', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '47', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '48', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '49', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '50', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '54', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '51', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('1', '52', '0', '0', '0');
INSERT INTO `tb_role_privilege` VALUES ('10', '55', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '56', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '57', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '58', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '59', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '71', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '60', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '61', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '62', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '63', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '64', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '65', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '66', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '67', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '72', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '68', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '69', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '70', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '73', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '74', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '75', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '76', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '77', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '78', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '79', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('10', '80', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('11', '56', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('11', '57', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('11', '58', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('11', '59', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('11', '71', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('11', '60', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('11', '61', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('11', '62', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('11', '63', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('11', '64', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('11', '65', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('11', '66', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('11', '67', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('11', '72', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('11', '68', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('11', '69', '1', '1', '2');
INSERT INTO `tb_role_privilege` VALUES ('11', '70', '1', '1', '2');

-- ----------------------------
-- Table structure for tb_setting
-- ----------------------------
DROP TABLE IF EXISTS `tb_setting`;
CREATE TABLE `tb_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `siteName` varchar(50) NOT NULL COMMENT '网站名称',
  `keywords` varchar(255) NOT NULL COMMENT '关键词 ',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `copyright` varchar(50) NOT NULL COMMENT '版权信息',
  `recordNo` varchar(50) NOT NULL COMMENT '备案号',
  `allowLoginFailNo` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT ' 后台允许最大登录失败次数',
  `allowIps` text NOT NULL COMMENT '允许的IP地址，英文逗号隔开',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of tb_setting
-- ----------------------------
INSERT INTO `tb_setting` VALUES ('1', '南唐科技 -- 后台管理 ', '南唐信息科技有限公司', 'Thinkphp5.1,PHP7+,响应式后台,PHP7+', '采用最新Thinkphp5.1框架的主题后台，优美的交互界面，主流的左右两栏式，完全完全响应式布局，严格的前后端验证和提示，让网站更加安全！', '© 2019 tfc.babytime.vip', '京ICP备00000000号', '5', '*', '2018-09-21 08:17:14', '2018-09-21 08:17:14');

-- ----------------------------
-- Table structure for tb_shop
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop`;
CREATE TABLE `tb_shop` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `merchantId` int(11) unsigned NOT NULL COMMENT '商户ID ',
  `username` varchar(18) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `name` varchar(50) NOT NULL COMMENT '店铺名称',
  `mobile` char(11) NOT NULL COMMENT '手机',
  `landline` char(12) DEFAULT NULL COMMENT '座机',
  `province` varchar(30) NOT NULL COMMENT '省',
  `city` varchar(30) NOT NULL COMMENT '市',
  `county` varchar(30) NOT NULL,
  `area` varchar(50) NOT NULL COMMENT '地址',
  `license` varchar(150) DEFAULT NULL COMMENT '营业执照',
  `scope` varchar(255) DEFAULT NULL COMMENT '经营范围',
  `IDPositive` varchar(150) NOT NULL COMMENT '省份证正面',
  `IDNegative` varchar(150) NOT NULL COMMENT '身份证反面',
  `IDCard` varchar(20) DEFAULT NULL COMMENT '省份证号码',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1--个人  2--商户 3--企业',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1--正常 2--冻结  3--删除',
  `deleteTime` datetime DEFAULT NULL COMMENT '删除时间',
  `createTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='店铺表';

-- ----------------------------
-- Records of tb_shop
-- ----------------------------
INSERT INTO `tb_shop` VALUES ('1', '1', 'NTKJ_abcdc_0000001', 'e10adc3949ba59abbe56e057f20f883e', '芜湖银泰ammas店', '19910101010', '0553-7239861', '安徽省', '芜湖市', '弋江区', '利民路999号', null, null, '', '', null, '1', '1', null, '2018-10-28 10:54:20', null);

-- ----------------------------
-- Table structure for tb_shop_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_admin`;
CREATE TABLE `tb_shop_admin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `merchantId` int(11) unsigned NOT NULL COMMENT '商户ID',
  `shopId` int(11) unsigned NOT NULL COMMENT '店铺ID ',
  `username` varchar(30) NOT NULL COMMENT '账号',
  `password` char(32) NOT NULL COMMENT '密码',
  `mobile` char(11) NOT NULL COMMENT '手机号',
  `landline` varchar(15) DEFAULT NULL COMMENT '座机',
  `qq` varchar(15) NOT NULL COMMENT 'qq',
  `realname` varchar(255) NOT NULL COMMENT '真实姓名',
  `headimg` text COMMENT '头像地址',
  `departmentId` int(11) unsigned NOT NULL COMMENT '部门ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态  1在职 2冻结 3离职 ',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `department_id` (`departmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='后台管理员';

-- ----------------------------
-- Records of tb_shop_admin
-- ----------------------------
INSERT INTO `tb_shop_admin` VALUES ('1', '1', '1', '华哥', 'b8400559dc2ad671884c43a4c3c32aeb', '19912345678', '0533-7239861', '1234567890', '陈博华', '/uploads/admin/headimg/5ba2fc0dd3807.png', '1', '1', '', '2018-11-01 21:29:51', '2018-11-01 21:29:51');
INSERT INTO `tb_shop_admin` VALUES ('95', '1', '1', '晴晴', 'b8400559dc2ad671884c43a4c3c32aeb', '13157175989', '0533-7239861', '123456', '慕容雨晴', '/uploads/shop/admin/headimg/5bdaea3742876.png', '3', '1', '', '2018-11-01 21:29:56', '2018-11-01 21:29:56');

-- ----------------------------
-- Table structure for tb_shop_department
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_department`;
CREATE TABLE `tb_shop_department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `merchantId` int(11) unsigned NOT NULL COMMENT '商户ID',
  `shopId` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `departmentName` varchar(50) NOT NULL COMMENT '部门名称',
  `icon` varchar(255) NOT NULL COMMENT '部门图标',
  `parentId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '部门等级',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `orderNo` int(11) unsigned NOT NULL DEFAULT '1000' COMMENT '排序值 大的排前面',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_shop_department
-- ----------------------------
INSERT INTO `tb_shop_department` VALUES ('1', '1', '1', '管理部', '{\"origin\":\"\\\\uploads\\\\department\\\\c7646d6a87358075d24a201daed15694.png\"}', '0', '超级管理员所在部门', '1000', '2018-10-31 20:43:20', '2018-10-31 20:43:20');
INSERT INTO `tb_shop_department` VALUES ('2', '1', '1', '财务部', '{\"origin\":\"\\\\uploads\\\\department\\\\46f28f5966bfb55bddd759a4f375240a.png\"}', '0', '', '1000', '2018-11-01 21:12:26', '2018-09-18 09:29:58');
INSERT INTO `tb_shop_department` VALUES ('3', '1', '1', '财务部', '{\"origin\":\"\\\\uploads\\\\department\\\\da98a017730de9afadd32f81ef6e5e0a.png\"}', '0', '', '1000', '2018-11-01 19:59:07', '2018-09-18 09:30:10');

-- ----------------------------
-- Table structure for tb_theme
-- ----------------------------
DROP TABLE IF EXISTS `tb_theme`;
CREATE TABLE `tb_theme` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(10) NOT NULL COMMENT '名称',
  `orderNo` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `max` tinyint(4) unsigned NOT NULL DEFAULT '10' COMMENT '最大展示件数',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `mode` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '展示模式 1--1行1张  2--1行2张  3--1行3张 4--1行4张',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 0--删除 1--正常  2--推荐',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `deleteTime` datetime DEFAULT NULL COMMENT '删除时间 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主题表';

-- ----------------------------
-- Records of tb_theme
-- ----------------------------
INSERT INTO `tb_theme` VALUES ('1', '精选专区', '1', '10', null, '2', '2', '2018-10-18 11:05:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tb_theme` VALUES ('2', '新品专区', '2', '10', null, '1', '2', '2018-10-18 11:09:31', '0000-00-00 00:00:00', null);
INSERT INTO `tb_theme` VALUES ('3', '混搭专区', '3', '10', null, '0', '2', '2018-10-17 20:09:29', '0000-00-00 00:00:00', null);

-- ----------------------------
-- Table structure for tb_theme_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_theme_goods`;
CREATE TABLE `tb_theme_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `themeId` int(11) unsigned NOT NULL COMMENT '主题ID',
  `goodsId` int(11) unsigned NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='主题商品表';

-- ----------------------------
-- Records of tb_theme_goods
-- ----------------------------
INSERT INTO `tb_theme_goods` VALUES ('1', '1', '1');
INSERT INTO `tb_theme_goods` VALUES ('2', '1', '2');
INSERT INTO `tb_theme_goods` VALUES ('3', '1', '3');
INSERT INTO `tb_theme_goods` VALUES ('4', '1', '4');
INSERT INTO `tb_theme_goods` VALUES ('5', '1', '5');
INSERT INTO `tb_theme_goods` VALUES ('6', '1', '6');
INSERT INTO `tb_theme_goods` VALUES ('7', '2', '7');
INSERT INTO `tb_theme_goods` VALUES ('8', '2', '8');
INSERT INTO `tb_theme_goods` VALUES ('9', '2', '9');
INSERT INTO `tb_theme_goods` VALUES ('10', '3', '10');
INSERT INTO `tb_theme_goods` VALUES ('11', '3', '11');
INSERT INTO `tb_theme_goods` VALUES ('12', '3', '12');
INSERT INTO `tb_theme_goods` VALUES ('13', '3', '13');
INSERT INTO `tb_theme_goods` VALUES ('14', '3', '14');
INSERT INTO `tb_theme_goods` VALUES ('15', '3', '15');
