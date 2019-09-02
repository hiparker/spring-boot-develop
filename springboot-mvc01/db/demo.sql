/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : demo

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 02/09/2019 10:37:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10, 0) NOT NULL COMMENT '排序',
  `href` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '链接',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图标',
  `is_show` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0:功能菜单  1：菜单  2：按钮  3：数据权限',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_menu_parent_id`(`parent_id`) USING BTREE,
  INDEX `sys_menu_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('06bb3441e0c44a43820133107d6e0489', 'e222ad2cd87542bfb1cc562ac0121ce8', '0,1,27,e222ad2cd87542bfb1cc562ac0121ce8,', '导入', 150, NULL, NULL, NULL, '0', 'sys:file:import', '1', '2018-01-20 23:53:42', '1', '2018-01-20 23:53:42', NULL, '0', '1');
INSERT INTO `sys_menu` VALUES ('0aa3712414d049a6a24e8bcddeae509a', '27', '0,1,27,', '我的日程', 100, '/iim/myCalendar', '', '', '1', '', '1', '2016-04-21 21:52:06', '1', '2018-10-11 17:01:52', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('0f15ff2ad08e4f31ab7d504e90040a00', '1', '0,1,', '机票订购', 200, '', '', 'fa fa-plane', '1', '', '1', '2019-01-11 11:10:58', '1', '2019-01-11 11:13:35', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '功能菜单', 0, NULL, NULL, 'fa fa-home', '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0', '1');
INSERT INTO `sys_menu` VALUES ('10', '3', '0,1,3,', '字典管理', 60, '/sys/dict/', '', '', '1', 'sys:dict:list', '1', '2013-05-27 08:00:00', '1', '2017-04-11 16:45:55', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('10a0b87c918a48d18d5080177973918a', '9e01c22444ce4ffca35911daae45d58a', '0,1,67,9e01c22444ce4ffca35911daae45d58a,', '删除', 60, NULL, NULL, NULL, '0', 'monitor:scheduleJob:del', '1', '2017-02-02 22:25:10', '1', '2017-02-02 22:25:10', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('11', '10', '0,1,3,10,', '查看', 30, NULL, NULL, NULL, '0', 'sys:dict:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('11178aea9b8e4c94a90f19724676e60a', '5656904d00864e1c80b370e6a4b17dd6', '0,1,3,321395ef27f04ba9abc15c0b43064ffb,5656904d00864e1c80b370e6a4b17dd6,', '导出', 180, '', '', '', '0', 'params:config:baseParamsConfig:export', '1', '2018-07-04 12:11:31', '1', '2018-07-04 12:11:31', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('1168be17cc3348e7b7a85b7482eb7127', '20', '0,1,3,20,', '删除', 190, '', '', '', '0', 'sys:user:del', '2731f0f021c44a069664c7e665f66e1a', '2018-09-29 11:26:15', '2731f0f021c44a069664c7e665f66e1a', '2018-09-29 11:28:15', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('12', '10', '0,1,3,10,', '修改', 40, NULL, NULL, NULL, '0', 'sys:dict:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('14', '3', '0,1,3,', '区域管理', 50, '/sys/area/', '', '', '1', 'sys:area:list', '1', '2013-05-27 08:00:00', '1', '2017-04-11 16:45:48', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('1498dccc73b949439439c002cb8f502f', '5656904d00864e1c80b370e6a4b17dd6', '0,1,3,321395ef27f04ba9abc15c0b43064ffb,5656904d00864e1c80b370e6a4b17dd6,', '删除', 120, '', '', '', '0', 'params:config:baseParamsConfig:del', '1', '2018-07-04 12:10:54', '1', '2018-07-04 12:10:54', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('15', '14', '0,1,3,14,', '查看', 30, NULL, NULL, NULL, '0', 'sys:area:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('16', '14', '0,1,3,14,', '修改', 40, NULL, NULL, NULL, '0', 'sys:area:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('17', '3', '0,1,3,', '机构管理', 40, '/sys/office/list', '', '', '1', 'sys:office:list', '1', '2013-05-27 08:00:00', '1', '2017-04-11 16:45:30', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('18', '17', '0,1,3,17,', '查看', 30, NULL, NULL, NULL, '0', 'sys:office:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('19', '17', '0,1,3,17,', '修改', 40, NULL, NULL, NULL, '0', 'sys:office:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('1cc330aded2b47f3abbd1204da404548', 'e222ad2cd87542bfb1cc562ac0121ce8', '0,1,27,e222ad2cd87542bfb1cc562ac0121ce8,', '删除', 60, NULL, NULL, NULL, '0', 'sys:file:del', '1', '2018-01-20 23:53:42', '1', '2018-01-20 23:53:42', NULL, '0', '1');
INSERT INTO `sys_menu` VALUES ('20', '3', '0,1,3,', '用户管理', 30, '/sys/user/index', '', '', '1', 'sys:user:index', '1', '2013-05-27 08:00:00', '1', '2017-04-11 16:45:18', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('21', '20', '0,1,3,20,', '查看', 30, NULL, NULL, NULL, '0', 'sys:user:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('22', '20', '0,1,3,20,', '修改', 40, NULL, NULL, NULL, '0', 'sys:user:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('25ea548a9c5d4e7daf35aec33fd6538c', '5656904d00864e1c80b370e6a4b17dd6', '0,1,3,321395ef27f04ba9abc15c0b43064ffb,5656904d00864e1c80b370e6a4b17dd6,', '编辑', 90, '', '', '', '0', 'params:config:baseParamsConfig:edit', '1', '2018-07-04 12:10:35', '1', '2018-07-04 12:10:35', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('26bc80de0c684b9d9543dfa9dac87112', '8f04795ac7b1499aa9232ee96adc74a9', '0,1,784b307d09b24c32b3d871733b33a498,8f04795ac7b1499aa9232ee96adc74a9,', '查看', 120, NULL, NULL, NULL, '0', 'base:airport:baseAirportManagement:view', '1', '2019-01-11 11:17:31', '1', '2019-01-11 11:17:31', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('27', '1', '0,1,', '个人中心', 10, '', '', 'fa fa-columns', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-08-21 14:27:08', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('28abe4b0cb3b4c8480f84c07a5dfaf06', '90', '0,1,27,90,', '增加', 60, '', '', '', '0', 'oa:oaNotify:add', '1', '2015-12-29 21:15:22', '1', '2015-12-29 21:15:22', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('29', '27', '0,1,27,', '个人信息', 90, '/sys/user/info', '', '', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-06-10 13:23:45', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('29668d1a79cd4d08b7f469194799f426', '48518888b5a7430ea4da74679a1c06f8', '0,1,784b307d09b24c32b3d871733b33a498,48518888b5a7430ea4da74679a1c06f8,', '增加', 30, NULL, NULL, NULL, '0', 'base:aircraft:baseAircraftManagement:add', '1', '2019-01-11 13:37:38', '1', '2019-01-11 13:37:38', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('2a0f940fbe304a05a6b4040ddf6df279', '20', '0,1,3,20,', '增加', 70, '', '', '', '0', 'sys:user:add', '1', '2015-12-19 21:47:00', '1', '2015-12-19 21:47:00', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('2c6f45ffc0d546498a64a2f6ec55bd7f', '48518888b5a7430ea4da74679a1c06f8', '0,1,784b307d09b24c32b3d871733b33a498,48518888b5a7430ea4da74679a1c06f8,', '编辑', 90, NULL, NULL, NULL, '0', 'base:aircraft:baseAircraftManagement:edit', '1', '2019-01-11 13:37:38', '1', '2019-01-11 13:37:38', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('3', '1', '0,1,', '系统设置', 40, '', '', 'fa fa-gear', '1', '', '1', '2013-05-27 08:00:00', '1', '2017-04-04 22:20:53', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('30b58767a99544209f7021655ca9352a', '9e01c22444ce4ffca35911daae45d58a', '0,1,67,9e01c22444ce4ffca35911daae45d58a,', '暂停', 120, '', '', '', '0', 'monitor:scheduleJob:stop', '1', '2017-02-02 22:25:10', '1', '2017-02-05 10:27:31', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('321395ef27f04ba9abc15c0b43064ffb', '3', '0,1,3,', '参数列表', 90, '', '', '', '1', '', '1', '2018-07-04 12:09:12', '1', '2018-07-04 12:09:12', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('37f3def08e51423ba8babc074d28bc8c', '5656904d00864e1c80b370e6a4b17dd6', '0,1,3,321395ef27f04ba9abc15c0b43064ffb,5656904d00864e1c80b370e6a4b17dd6,', '增加', 60, '', '', '', '0', 'params:config:baseParamsConfig:add', '1', '2018-07-04 12:10:15', '1', '2018-07-04 12:10:15', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('3c1c639c76f14f6f9903b0143371ea09', '7', '0,1,3,7,', '添加', 70, '', '', '', '0', 'sys:role:add', '1', '2015-12-23 21:35:08', '1', '2015-12-23 21:36:18', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('3c31d591703a44f2b76c9ad3f3328b89', '46f71295583644d99ed95b5ecb4e269d', '0,1,3,321395ef27f04ba9abc15c0b43064ffb,46f71295583644d99ed95b5ecb4e269d,', '编辑', 90, '', '', '', '0', 'params:params:baseParams:edit', '1', '2018-07-04 13:35:51', '1', '2018-07-04 13:35:51', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,1,3,', '菜单管理', 30, '/sys/menu/', '', '', '1', 'sys:menu:list', '1', '2013-05-27 08:00:00', '1', '2017-03-26 18:09:50', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('46f71295583644d99ed95b5ecb4e269d', '321395ef27f04ba9abc15c0b43064ffb', '0,1,3,321395ef27f04ba9abc15c0b43064ffb,', '参数字典配置', 60, '/params/params/baseParams', '', '', '1', 'params:params:baseParams:list', '1', '2018-07-04 13:34:54', '1', '2018-07-04 13:34:54', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('48518888b5a7430ea4da74679a1c06f8', '784b307d09b24c32b3d871733b33a498', '0,1,784b307d09b24c32b3d871733b33a498,', '飞机管理', 60, '/base/aircraft/baseAircraftManagement', NULL, '', '1', 'base:aircraft:baseAircraftManagement:list', '1', '2019-01-11 13:37:38', '1', '2019-01-11 13:37:38', NULL, '0', '1');
INSERT INTO `sys_menu` VALUES ('4ac53ecdbac647fb8551cec5b1c50dda', '46f71295583644d99ed95b5ecb4e269d', '0,1,3,321395ef27f04ba9abc15c0b43064ffb,46f71295583644d99ed95b5ecb4e269d,', '查看', 30, '', '', '', '0', 'params:params:baseParams:view', '1', '2018-07-04 13:35:14', '1', '2018-07-04 13:35:14', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('4f51b2fa967a4a7b86d4abc9e0fd5f7d', '4', '0,1,3,4,', '数据规则', 190, '', '', '', '0', 'sys:role:datarule', '1', '2017-04-08 21:59:25', '1', '2017-04-09 17:36:41', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('5', '4', '0,1,3,4,', '增加', 30, '', '', '', '0', 'sys:menu:add', '1', '2013-05-27 08:00:00', '1', '2015-12-20 19:00:22', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('5239527958e94d418997b584b85d8b80', '14', '0,1,3,14,', '删除', 100, '', '', '', '0', 'sys:area:del', '1', '2015-12-24 21:37:13', '1', '2015-12-24 21:37:13', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('54f0af83c8404dcfa0bd7138d665172e', '46f71295583644d99ed95b5ecb4e269d', '0,1,3,321395ef27f04ba9abc15c0b43064ffb,46f71295583644d99ed95b5ecb4e269d,', '导入', 150, '', '', '', '0', 'params:params:baseParams:import', '1', '2018-07-04 13:36:23', '1', '2018-07-04 13:36:23', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('5656904d00864e1c80b370e6a4b17dd6', '321395ef27f04ba9abc15c0b43064ffb', '0,1,3,321395ef27f04ba9abc15c0b43064ffb,', '参数配置', 30, '/params/config/baseParamsConfig', '', '', '1', 'params:config:baseParamsConfig:list', '1', '2018-07-04 12:09:30', '1', '2018-07-04 12:12:30', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('57f1f00d6cb14819bef388acd10e6f5a', '68', '0,1,67,68,', '删除', 60, '', '', '', '0', 'sys:log:del', '1', '2015-12-25 20:25:55', '1', '2015-12-25 20:25:55', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('5b4da11906b842b5a22f80d79471ed43', 'c9ff56de3caf4a5c85b0ec3e37fa4fde', '0,1,0f15ff2ad08e4f31ab7d504e90040a00,c9ff56de3caf4a5c85b0ec3e37fa4fde,', '导出', 30, '', '', '', '1', '', 'Edwin', '2019-08-30 19:28:36', 'Edwin', '2019-08-30 19:28:36', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('6', '4', '0,1,3,4,', '修改', 40, NULL, NULL, NULL, '0', 'sys:menu:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('6509eed6eb634030a46723a18814035c', '7', '0,1,3,7,', '分配用户', 100, '', '', '', '0', 'sys:role:assign', '1', '2015-12-23 21:35:37', '1', '2015-12-23 21:53:23', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('655f1349122c4fdfaf29a3f7c5aa5706', '48518888b5a7430ea4da74679a1c06f8', '0,1,784b307d09b24c32b3d871733b33a498,48518888b5a7430ea4da74679a1c06f8,', '删除', 60, NULL, NULL, NULL, '0', 'base:aircraft:baseAircraftManagement:del', '1', '2019-01-11 13:37:38', '1', '2019-01-11 13:37:38', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('67', '1', '0,1,', '系统监控', 140, '', '', 'fa fa-video-camera', '1', '', '1', '2013-06-03 08:00:00', '1', '2018-09-13 09:42:40', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('68', '67', '0,1,67,', '日志查询', 30, '/sys/log', '', '', '1', 'sys:log:list', '1', '2013-06-03 08:00:00', '1', '2017-04-11 16:46:10', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('68f9151151174868ab436e11e03bf548', '4', '0,1,3,4,', '删除', 70, '', '', '', '0', 'sys:menu:del', '1', '2015-12-20 19:01:16', '1', '2015-12-20 19:03:05', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('69bda8d397694f0082f390fde96ee38f', '46f71295583644d99ed95b5ecb4e269d', '0,1,3,321395ef27f04ba9abc15c0b43064ffb,46f71295583644d99ed95b5ecb4e269d,', '导出', 180, '', '', '', '0', 'params:params:baseParams:export', '1', '2018-07-04 13:36:43', '1', '2018-07-04 13:36:43', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('6c672b854d2b4821b89297640df5fc26', '82', '0,1,79,82,', '同步数据库', 180, '', '', '', '0', 'gen:genTable:synchDb', '1', '2016-01-07 11:31:00', '1', '2017-04-11 09:46:32', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('6d3a6777693f47c98e9b3051cacbcfdb', '10', '0,1,3,10,', '增加', 70, '', '', '', '0', 'sys:dict:add', '1', '2015-12-24 22:23:39', '1', '2015-12-24 22:24:22', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,1,3,', '角色管理', 50, '/sys/role/', '', '', '1', 'sys:role:list', '1', '2013-05-27 08:00:00', '1', '2017-04-11 16:45:39', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('75dc45d47e8d4227a9fe185fa4f8e704', 'e0bc7a8afafd44ff987bb34f276f3ccc', '0,1,0f15ff2ad08e4f31ab7d504e90040a00,e0bc7a8afafd44ff987bb34f276f3ccc,', '查看', 120, NULL, NULL, NULL, '0', 'order:flightorder:baseFlightManagement:view', '1', '2019-01-11 14:25:46', '1', '2019-01-11 14:25:46', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('784b307d09b24c32b3d871733b33a498', '1', '0,1,', '基础档案', 170, '', '', 'fa fa-calendar', '1', '', '1', '2019-01-11 11:10:44', '1', '2019-01-11 11:13:00', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('79', '1', '0,1,', '开发工具', 50, '', '', 'fa fa-th', '1', '', '1', '2013-10-16 08:00:00', '1', '2018-07-04 09:08:46', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('79f0ffa47dbe43ffa8824d97612d344f', '4', '0,1,3,4,', '保存排序', 100, '', '', '', '0', 'sys:menu:updateSort', '1', '2015-12-20 19:02:08', '1', '2015-12-20 19:02:08', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('8', '7', '0,1,3,7,', '查看', 30, NULL, NULL, NULL, '0', 'sys:role:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('8157ef05480942e6870fde0f7e77e454', 'e0bc7a8afafd44ff987bb34f276f3ccc', '0,1,0f15ff2ad08e4f31ab7d504e90040a00,e0bc7a8afafd44ff987bb34f276f3ccc,', '订票', 150, '', '', '', '0', 'order:flightorder:baseFlightManagement:order', '1', '2019-01-11 15:32:38', '1', '2019-01-11 15:32:38', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('82', '79', '0,1,79,', '表单配置', 20, '/gen/genTable', '', '', '1', 'gen:genTable:list', '1', '2013-10-16 08:00:00', '1', '2017-03-17 22:26:25', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('84', '67', '0,1,67,', '连接池监视', 40, '/../druid', NULL, NULL, '1', NULL, '1', '2013-10-18 08:00:00', '1', '2013-10-18 08:00:00', NULL, '0', '1');
INSERT INTO `sys_menu` VALUES ('84fe3a4b0c174ecabf2559792f9eed0c', 'b1fb2d274db542c3af65f05645129bc6', '0,1,0f15ff2ad08e4f31ab7d504e90040a00,b1fb2d274db542c3af65f05645129bc6,', '查看', 120, NULL, NULL, NULL, '0', 'order:ticket:airlineTicketOrder:view', '1', '2019-01-11 17:33:52', '1', '2019-01-11 17:33:52', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('864dd45b673545cda5722a81f2d8c64d', '9e01c22444ce4ffca35911daae45d58a', '0,1,67,9e01c22444ce4ffca35911daae45d58a,', '编辑', 90, NULL, NULL, NULL, '0', 'monitor:scheduleJob:edit', '1', '2017-02-02 22:25:10', '1', '2017-02-02 22:25:10', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('89', '27', '0,1,27,', '我的通告', 10000, '/oa/oaNotify/self', '', '', '1', '', '1', '2013-11-08 08:00:00', '1', '2018-10-11 17:02:01', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('8930e4aad1ba4a1c958d303968d8c442', '17', '0,1,3,17,', '删除', 100, '', '', '', '0', 'sys:office:del', '1', '2015-12-20 21:19:16', '1', '2015-12-20 21:19:16', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('8e01a74a9ca94a26a5263769c354afb9', '67', '0,1,67,', '系统配置', 100, '/sys/systemConfig', '', '', '1', 'sys:systemConfig:index', '1', '2016-02-07 16:25:22', '1', '2016-02-07 16:25:22', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('8f04795ac7b1499aa9232ee96adc74a9', '784b307d09b24c32b3d871733b33a498', '0,1,784b307d09b24c32b3d871733b33a498,', '机场管理', 30, '/base/airport/baseAirportManagement', NULL, '', '1', 'base:airport:baseAirportManagement:list', '1', '2019-01-11 11:17:31', '1', '2019-01-11 11:17:31', NULL, '0', '1');
INSERT INTO `sys_menu` VALUES ('9', '7', '0,1,3,7,', '修改', 40, NULL, NULL, NULL, '0', 'sys:role:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('90', '27', '0,1,27,', '通告管理', 120, '/oa/oaNotify', '', '', '1', 'oa:oaNotify:list', '1', '2013-11-08 08:00:00', '1', '2018-10-11 17:01:55', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('90b0b138bad0492d84fe09b91e410a09', '9e01c22444ce4ffca35911daae45d58a', '0,1,67,9e01c22444ce4ffca35911daae45d58a,', '增加', 30, NULL, NULL, NULL, '0', 'monitor:scheduleJob:add', '1', '2017-02-02 22:25:10', '1', '2017-02-02 22:25:10', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('91aa429a6cdc4a9b954d84ff1456934b', '68', '0,1,67,68,', '查看', 30, '', '', '', '0', 'sys:log:view', '1', '2015-12-25 20:25:25', '1', '2015-12-25 20:25:25', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('91d2f5900de046218237147b4bcae805', '5656904d00864e1c80b370e6a4b17dd6', '0,1,3,321395ef27f04ba9abc15c0b43064ffb,5656904d00864e1c80b370e6a4b17dd6,', '查看', 30, '', '', '', '0', 'params:config:baseParamsConfig:view', '1', '2018-07-04 12:09:56', '1', '2018-07-04 12:09:56', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('95a6a82dc5fc4d07b46e5df57a0606a3', '27', '0,1,27,', '信箱', 30, '/iim/mailBox/list?orderBy=sendtime desc', '', '', '1', '', '1', '2015-11-14 11:14:30', '1', '2018-10-11 17:01:42', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('976fa9d206b44865a7a3d595dad86f7d', '5656904d00864e1c80b370e6a4b17dd6', '0,1,3,321395ef27f04ba9abc15c0b43064ffb,5656904d00864e1c80b370e6a4b17dd6,', '导入', 150, '', '', '', '0', 'params:config:baseParamsConfig:import', '1', '2018-07-04 12:11:13', '1', '2018-07-04 12:11:13', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('9bc1aa1053144a608b73f6fbd841d1c6', '10', '0,1,3,10,', '删除', 100, '', '', '', '0', 'sys:dict:del', '1', '2015-12-24 22:24:04', '1', '2015-12-24 22:24:31', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('9c9af7f7e7e54c3988a7d81df332cb9f', 'e0bc7a8afafd44ff987bb34f276f3ccc', '0,1,0f15ff2ad08e4f31ab7d504e90040a00,e0bc7a8afafd44ff987bb34f276f3ccc,', '删除', 60, NULL, NULL, NULL, '0', 'order:flightorder:baseFlightManagement:del', '1', '2019-01-11 14:25:46', '1', '2019-01-11 14:25:46', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('9e01c22444ce4ffca35911daae45d58a', '67', '0,1,67,', '定时任务', 130, '/monitor/scheduleJob', NULL, '', '1', 'monitor:scheduleJob:list', '1', '2017-02-02 22:25:10', '1', '2017-02-02 22:25:10', NULL, '0', '1');
INSERT INTO `sys_menu` VALUES ('a49d6b19fff2440388712b0fe6cfdaff', '9e01c22444ce4ffca35911daae45d58a', '0,1,67,9e01c22444ce4ffca35911daae45d58a,', '立即执行一次', 180, '', '', '', '0', 'monitor:scheduleJob:startNow', '1', '2017-02-02 22:25:10', '1', '2017-02-05 10:28:15', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('a4c3dcee6cbc4fc6a0bf617d8619edf3', '17', '0,1,3,17,', '增加', 70, '', '', '', '0', 'sys:office:add', '1', '2015-12-20 21:18:52', '1', '2015-12-20 21:18:52', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('a7fc28e4cb344d5fb32ab0d331059783', 'e222ad2cd87542bfb1cc562ac0121ce8', '0,1,27,e222ad2cd87542bfb1cc562ac0121ce8,', '查看', 120, NULL, NULL, NULL, '0', 'sys:file:view', '1', '2018-01-20 23:53:42', '1', '2018-01-20 23:53:42', NULL, '0', '1');
INSERT INTO `sys_menu` VALUES ('ae8d0bb4f4154d348e8b95e4496e838a', '9e01c22444ce4ffca35911daae45d58a', '0,1,67,9e01c22444ce4ffca35911daae45d58a,', '恢复', 150, '', '', '', '0', 'monitor:scheduleJob:resume', '1', '2017-02-02 22:25:10', '1', '2017-02-05 10:27:50', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('af0a174b4f424bc09a8cc0db83a64105', '27', '0,1,27,', '通讯录', 50, '/iim/contact/index', '', '', '1', '', '1', '2015-11-11 16:49:02', '1', '2018-10-11 17:01:47', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('b1fb2d274db542c3af65f05645129bc6', '0f15ff2ad08e4f31ab7d504e90040a00', '0,1,0f15ff2ad08e4f31ab7d504e90040a00,', '机票管理', 60, '/order/ticket/airlineTicketOrder/list', '', '', '1', 'order:ticket:airlineTicketOrder:list', '1', '2019-01-11 17:33:52', '1', '2019-01-11 20:49:17', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('b34596dbfdeb4235951844f505116991', '8f04795ac7b1499aa9232ee96adc74a9', '0,1,784b307d09b24c32b3d871733b33a498,8f04795ac7b1499aa9232ee96adc74a9,', '删除', 60, NULL, NULL, NULL, '0', 'base:airport:baseAirportManagement:del', '1', '2019-01-11 11:17:31', '1', '2019-01-11 11:17:31', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('b39a29d8483740be934a6a81dba1453a', '48518888b5a7430ea4da74679a1c06f8', '0,1,784b307d09b24c32b3d871733b33a498,48518888b5a7430ea4da74679a1c06f8,', '查看', 120, NULL, NULL, NULL, '0', 'base:aircraft:baseAircraftManagement:view', '1', '2019-01-11 13:37:38', '1', '2019-01-11 13:37:38', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('b9a776f5d7194406bb466388e3af9d08', '20', '0,1,3,20,', '导出', 160, '', '', '', '0', 'sys:user:export', '1', '2015-12-19 21:48:34', '1', '2015-12-19 21:48:34', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('ba1352ccd4ce4c25994cddefc50ce2ee', '8f04795ac7b1499aa9232ee96adc74a9', '0,1,784b307d09b24c32b3d871733b33a498,8f04795ac7b1499aa9232ee96adc74a9,', '增加', 30, NULL, NULL, NULL, '0', 'base:airport:baseAirportManagement:add', '1', '2019-01-11 11:17:31', '1', '2019-01-11 11:17:31', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('bb6c1e914b5d46c7a6450f21815c15b5', 'e0bc7a8afafd44ff987bb34f276f3ccc', '0,1,0f15ff2ad08e4f31ab7d504e90040a00,e0bc7a8afafd44ff987bb34f276f3ccc,', '增加', 30, NULL, NULL, NULL, '0', 'order:flightorder:baseFlightManagement:add', '1', '2019-01-11 14:25:46', '1', '2019-01-11 14:25:46', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('c128193d83d047af80a2082c0ebb2cdc', '46f71295583644d99ed95b5ecb4e269d', '0,1,3,321395ef27f04ba9abc15c0b43064ffb,46f71295583644d99ed95b5ecb4e269d,', '删除', 120, '', '', '', '0', 'params:params:baseParams:del', '1', '2018-07-04 13:36:08', '1', '2018-07-04 13:36:08', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('c3de25a76785419b8a6820db3935941d', '82', '0,1,79,82,', '导入', 150, '', '', '', '0', 'gen:genTable:importDb', '1', '2016-01-07 11:30:25', '1', '2017-04-11 09:46:27', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('c6e0080e06014abd9240f870aadf3200', '14', '0,1,3,14,', '增加', 70, '', '', '', '0', 'sys:area:add', '1', '2015-12-24 21:35:39', '1', '2015-12-24 21:35:39', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('c7fa36c7142f481397c2cc12e2bc828a', '90', '0,1,27,90,', '修改', 90, '', '', '', '0', 'oa:oaNotify:edit', '1', '2015-12-29 21:15:50', '1', '2015-12-29 21:15:50', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('c9ff56de3caf4a5c85b0ec3e37fa4fde', '0f15ff2ad08e4f31ab7d504e90040a00', '0,1,0f15ff2ad08e4f31ab7d504e90040a00,', '测试', 30, '/params/config/baseParamsConfig', '', '', '1', '', 'Edwin', '2019-08-30 19:28:14', 'Edwin', '2019-08-30 19:28:26', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('cc35512634c6414fb9809b3065f131e2', '8f04795ac7b1499aa9232ee96adc74a9', '0,1,784b307d09b24c32b3d871733b33a498,8f04795ac7b1499aa9232ee96adc74a9,', '编辑', 90, NULL, NULL, NULL, '0', 'base:airport:baseAirportManagement:edit', '1', '2019-01-11 11:17:31', '1', '2019-01-11 11:17:31', NULL, '0', '2');
INSERT INTO `sys_menu` VALUES ('d3f1b6f292904ef5b95f7800cc777a48', '82', '0,1,79,82,', '查看', 30, '', '', '', '0', 'gen:genTable:view,gen:genTableColumn:view', '1', '2016-01-07 11:26:42', '1', '2017-04-11 09:46:03', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('d3f97e17e17d44f7b4a8f772e1d1d312', '0f15ff2ad08e4f31ab7d504e90040a00', '0,1,0f15ff2ad08e4f31ab7d504e90040a00,', '我的机票', 90, '/order/ticket/airlineTicketOrder/melist', '', '', '1', 'order:ticket:airlineTicketOrder:list', '1', '2019-01-11 20:45:51', 'Edwin', '2019-08-30 19:19:55', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('d64d25d7b3014f9ba7736867cb2ffc43', '82', '0,1,79,82,', '生成代码', 210, '', '', '', '0', 'gen:genTable:genCode', '1', '2016-01-07 11:31:24', '1', '2017-04-11 09:46:38', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('d75f64438d994fc4830b1b3d138cde32', '82', '0,1,79,82,', '删除', 120, '', '', '', '0', 'gen:genTable:del', '1', '2016-01-07 11:29:23', '1', '2017-04-11 09:46:22', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('de5e6e3017ba4cdb9f9f34621cb4651e', 'e222ad2cd87542bfb1cc562ac0121ce8', '0,1,27,e222ad2cd87542bfb1cc562ac0121ce8,', '增加', 30, NULL, NULL, NULL, '0', 'sys:file:add', '1', '2018-01-20 23:53:42', '1', '2018-01-20 23:53:42', NULL, '0', '1');
INSERT INTO `sys_menu` VALUES ('de7c50d276454f80881c41a096ecf55c', '7', '0,1,3,7,', '删除', 160, '', '', '', '0', 'sys:role:del', '1', '2015-12-23 21:59:46', '1', '2015-12-23 21:59:46', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('df71255f662b419ba3fbde01b531ebb9', 'e222ad2cd87542bfb1cc562ac0121ce8', '0,1,27,e222ad2cd87542bfb1cc562ac0121ce8,', '编辑', 90, NULL, NULL, NULL, '0', 'sys:file:edit', '1', '2018-01-20 23:53:42', '1', '2018-01-20 23:53:42', NULL, '0', '1');
INSERT INTO `sys_menu` VALUES ('e03f8b6a5e454addb04fc08033b6f60b', '82', '0,1,79,82,', '增加', 90, '', '', '', '0', 'gen:genTable:add', '1', '2016-01-07 11:28:59', '1', '2017-04-11 09:46:17', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('e0bc7a8afafd44ff987bb34f276f3ccc', '0f15ff2ad08e4f31ab7d504e90040a00', '0,1,0f15ff2ad08e4f31ab7d504e90040a00,', '航班查询', 30, '/order/flightorder/baseFlightManagement', NULL, '', '1', 'order:flightorder:baseFlightManagement:list', '1', '2019-01-11 14:25:46', '1', '2019-01-11 14:25:46', NULL, '0', '1');
INSERT INTO `sys_menu` VALUES ('e0f7075146464cd0b9672e49b2f17e2f', 'e222ad2cd87542bfb1cc562ac0121ce8', '0,1,27,e222ad2cd87542bfb1cc562ac0121ce8,', '导出', 180, NULL, NULL, NULL, '0', 'sys:file:export', '1', '2018-01-20 23:53:42', '1', '2018-01-20 23:53:42', NULL, '0', '1');
INSERT INTO `sys_menu` VALUES ('e222ad2cd87542bfb1cc562ac0121ce8', '27', '0,1,27,', '文件管理', 10030, '/sys/file', '', '', '1', 'sys:file:list', '1', '2018-01-20 23:53:42', '1', '2018-10-11 17:02:05', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('e2efcf80fc3747329fe02d489dbfda95', '90', '0,1,27,90,', '删除', 120, '', '', '', '0', 'oa:oaNotify:del', '1', '2015-12-29 21:16:14', '1', '2015-12-29 21:16:14', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('e824b7c20bb34c9ca9ad023e8873e67b', '82', '0,1,79,82,', '编辑', 60, '', '', '', '0', 'gen:genTable:edit,gen:genTableColumn:edit', '1', '2016-01-07 11:27:55', '1', '2017-04-11 09:46:11', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('e9abec7303204a399c469b07ed9338f8', 'b1fb2d274db542c3af65f05645129bc6', '0,1,0f15ff2ad08e4f31ab7d504e90040a00,b1fb2d274db542c3af65f05645129bc6,', '改签', 90, '', '', '', '0', 'order:ticket:airlineTicketOrder:ticketChanges', '1', '2019-01-11 17:33:52', '1', '2019-01-11 20:45:38', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('ec7cf7a144a440cab217aabd4ffb7788', '4', '0,1,3,4,', '查看', 130, '', '', '', '0', 'sys:menu:view', '1', '2015-12-20 19:02:54', '1', '2015-12-20 19:02:54', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('f18fac5c4e6145528f3c1d87dbcb37d5', '67', '0,1,67,', '系统监控管理', 70, '/monitor/info', '', '', '1', '', '1', '2016-02-02 22:49:07', '1', '2016-02-02 23:15:07', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('f34887a78fa245c1977603ca7dc98e11', '20', '0,1,3,20,', '导入', 130, '', '', '', '0', 'sys:user:import', '1', '2015-12-19 21:48:13', '1', '2015-12-19 21:48:44', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('f5b2028cfad9470085c7c846de33193a', '90', '0,1,27,90,', '查看', 30, '', '', '', '0', 'oa:oaNotify:view', '1', '2015-12-29 21:14:46', '1', '2015-12-29 21:14:46', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('f93f9a3a2226461dace3b8992cf055ba', '7', '0,1,3,7,', '权限设置', 130, '', '', '', '0', 'sys:role:auth', '1', '2015-12-23 21:36:06', '1', '2015-12-23 21:36:06', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('f9c1f6dd1cb64ed2ba56c6c0473a9caf', '46f71295583644d99ed95b5ecb4e269d', '0,1,3,321395ef27f04ba9abc15c0b43064ffb,46f71295583644d99ed95b5ecb4e269d,', '增加', 60, '', '', '', '0', 'params:params:baseParams:add', '1', '2018-07-04 13:35:34', '1', '2018-07-04 13:35:34', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('fc583429d3c94f15bb2d64e045d3ac72', 'e0bc7a8afafd44ff987bb34f276f3ccc', '0,1,0f15ff2ad08e4f31ab7d504e90040a00,e0bc7a8afafd44ff987bb34f276f3ccc,', '编辑', 90, NULL, NULL, NULL, '0', 'order:flightorder:baseFlightManagement:edit', '1', '2019-01-11 14:25:46', '1', '2019-01-11 14:25:46', NULL, '0', '2');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_useable` smallint(6) NULL DEFAULT NULL,
  `sysversion` int(11) NOT NULL,
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_date` datetime(0) NOT NULL,
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_date` datetime(0) NOT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '张三', '123', 'edwin1', '123456', '15321010110', 1, 1, 'edwin', '2019-08-23 01:37:59', 'Edwin', '2019-08-29 14:30:07', '', '0');
INSERT INTO `sys_user` VALUES ('2', '李四', '123', 'edwin2', '123456', '15321010110', 1, 1, 'edwin', '2019-08-23 01:37:59', 'Edwin', '2019-08-29 14:30:12', '', '0');
INSERT INTO `sys_user` VALUES ('4', '赵六', '123', 'edwin3', '123456', '15321010110', 1, 1, 'edwin', '2019-08-23 01:37:59', 'Edwin', '2019-08-29 14:30:17', '', '0');
INSERT INTO `sys_user` VALUES ('df3fcfc7c5024801b163539c56c0707b', '王帅', '100', '1678618797', '557967DDC0B5428138ADDBE752020E61', '15321010110', NULL, 0, 'Edwin', '2019-08-29 14:30:40', 'Edwin', '2019-08-29 14:30:40', '管理员', '0');

SET FOREIGN_KEY_CHECKS = 1;
