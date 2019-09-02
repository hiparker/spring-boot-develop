/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-09-02 22:10:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '链接',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `menu_type` char(1) DEFAULT NULL COMMENT '0:功能菜单  1：菜单  2：按钮  3：数据权限',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '功能菜单', '0', '', '', 'fa fa-home', '1', '', '1', '2013-05-27 08:00:00', 'Edwin', '2019-08-31 18:53:02', '', '0', '0');
INSERT INTO `sys_menu` VALUES ('1168be17cc3348e7b7a85b7482eb7127', '20', '0,1,3,20,', '删除', '190', '/user/delAll', '', '', '0', 'sys:user:del', '2731f0f021c44a069664c7e665f66e1a', '2018-09-29 11:26:15', 'Edwin', '2019-08-31 22:26:02', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('20', '3', '0,1,3,', '用户管理', '40', '/user/list', '', '', '1', 'sys:user:index', '1', '2013-05-27 08:00:00', 'Edwin', '2019-08-31 22:36:31', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('22', '20', '0,1,3,20,', '修改', '40', '/user/form', '', '', '0', 'sys:user:edit', '1', '2013-05-27 08:00:00', 'Edwin', '2019-08-31 22:25:38', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('2a0f940fbe304a05a6b4040ddf6df279', '20', '0,1,3,20,', '增加', '30', '/user/form', '', '', '0', 'sys:user:add', '1', '2015-12-19 21:47:00', 'Edwin', '2019-09-01 00:14:43', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('3', '1', '0,1,', '系统设置', '40', '', '', 'fa fa-gear', '1', '', '1', '2013-05-27 08:00:00', 'Edwin', '2019-08-31 18:52:50', '', '0', '0');
INSERT INTO `sys_menu` VALUES ('3c1c639c76f14f6f9903b0143371ea09', '7', '0,1,3,7,', '增加', '30', '/role/form', '', '', '0', 'sys:role:add', '1', '2015-12-23 21:35:08', 'Edwin', '2019-09-01 00:34:06', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,1,3,', '菜单管理', '30', '/menu/list', '', '', '1', 'sys:menu:list', '1', '2013-05-27 08:00:00', 'Edwin', '2019-08-31 22:24:22', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('5', '4', '0,1,3,4,', '增加', '30', '/menu/form', '', '', '0', 'sys:menu:add', '1', '2013-05-27 08:00:00', 'Edwin', '2019-08-31 22:25:13', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('6', '4', '0,1,3,4,', '修改', '40', '/menu/form', '', '', '0', 'sys:menu:edit', '1', '2013-05-27 08:00:00', 'Edwin', '2019-08-31 22:25:08', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('68f9151151174868ab436e11e03bf548', '4', '0,1,3,4,', '删除', '70', '/menu/delAll', '', '', '0', 'sys:menu:del', '1', '2015-12-20 19:01:16', 'Edwin', '2019-08-31 22:25:22', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,1,3,', '角色管理', '50', '/role/list', '', '', '1', 'sys:role:list', '1', '2013-05-27 08:00:00', 'Edwin', '2019-08-31 18:41:02', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('9', '7', '0,1,3,7,', '修改', '40', '/role/form', '', '', '0', 'sys:role:edit', '1', '2013-05-27 08:00:00', 'Edwin', '2019-08-31 22:26:29', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('95944af666fd428591a6e49b2679b25f', 'c9ad65315d824f758590c9edd2606752', '0,1,c9ad65315d824f758590c9edd2606752,', '测试菜单1', '30', 'http://www.baidu.com', '', '', '1', '', 'Edwin', '2019-08-31 21:12:29', 'Edwin', '2019-08-31 21:12:29', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('c9ad65315d824f758590c9edd2606752', '1', '0,1,', '测试菜单', '50', '', '', '', '1', '', 'Edwin', '2019-08-31 21:11:35', 'Edwin', '2019-08-31 21:31:42', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('de7c50d276454f80881c41a096ecf55c', '7', '0,1,3,7,', '删除', '50', '/role/delAll', '', '', '0', 'sys:role:del', '1', '2015-12-23 21:59:46', 'Edwin', '2019-09-01 00:15:02', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('f93f9a3a2226461dace3b8992cf055ba', '7', '0,1,3,7,', '分配菜单', '130', 'role/saveRoleMenu', '', '', '0', 'sys:role:auth', '1', '2015-12-23 21:36:06', 'Edwin', '2019-09-01 00:34:15', '', '0', '2');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `enname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '英文名称',
  `is_sys` smallint(6) DEFAULT NULL COMMENT '是否系统数据',
  `is_useable` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('00093b4b51f347eb9353bafd3554293f', '乘客', 'Passenger', '0', '1', '1', '2019-01-11 13:50:19', 'Edwin', '2019-08-31 01:25:39', '123', '0');
INSERT INTO `sys_role` VALUES ('706f0a20b1d948d9b4c0ecef04c4de49', '管理员', 'System', '1', '1', 'Edwin', '2019-08-31 15:36:26', 'Edwin', '2019-08-31 15:36:26', '', '0');
INSERT INTO `sys_role` VALUES ('cc4a40558f2644bea07e5b8f1ba931ca', '演示', 'demo', '0', '1', '1', '2018-09-21 16:12:10', '1', '2018-10-25 16:04:21', '', '0');
INSERT INTO `sys_role` VALUES ('eb77223d14fd4b37a8ac582241514c9d', '客服', 'CustomerService', '0', '1', '1', '2019-01-11 13:57:48', '1', '2019-01-13 00:54:46', '', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` varchar(64) NOT NULL,
  `role_id` varchar(64) NOT NULL,
  `menu_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('03c84fcef1764136b8aafbb3997863b3', '00093b4b51f347eb9353bafd3554293f', '5');
INSERT INTO `sys_role_menu` VALUES ('0deeaf874b1d4458b4c3372723904464', '706f0a20b1d948d9b4c0ecef04c4de49', 'f93f9a3a2226461dace3b8992cf055ba');
INSERT INTO `sys_role_menu` VALUES ('11f807297506402ba213565480211ef7', '706f0a20b1d948d9b4c0ecef04c4de49', '20');
INSERT INTO `sys_role_menu` VALUES ('14e4176c40f54823ab0ba5000b49a431', '706f0a20b1d948d9b4c0ecef04c4de49', '22');
INSERT INTO `sys_role_menu` VALUES ('196232f7fd5e4babb74e23a19dded65d', 'eb77223d14fd4b37a8ac582241514c9d', '1168be17cc3348e7b7a85b7482eb7127');
INSERT INTO `sys_role_menu` VALUES ('2232ef744ebf4196afcade7e2597a207', '00093b4b51f347eb9353bafd3554293f', '6');
INSERT INTO `sys_role_menu` VALUES ('23f2855c273f414d9810b1990728af6c', '706f0a20b1d948d9b4c0ecef04c4de49', '4');
INSERT INTO `sys_role_menu` VALUES ('24b71dab00af4c798f70bd4e06a83946', 'eb77223d14fd4b37a8ac582241514c9d', '20');
INSERT INTO `sys_role_menu` VALUES ('349ba53737fa421aadb75da0a3cf1a68', '00093b4b51f347eb9353bafd3554293f', '22');
INSERT INTO `sys_role_menu` VALUES ('3c5da5d68e2a4b5ba3b45dfb5cdbc954', 'cc4a40558f2644bea07e5b8f1ba931ca', 'c9ad65315d824f758590c9edd2606752');
INSERT INTO `sys_role_menu` VALUES ('6b1e78264df3473b9f81538dcbdab4b5', '706f0a20b1d948d9b4c0ecef04c4de49', '95944af666fd428591a6e49b2679b25f');
INSERT INTO `sys_role_menu` VALUES ('6d58da0e5a6e4fd1902539b010da7903', '706f0a20b1d948d9b4c0ecef04c4de49', '3');
INSERT INTO `sys_role_menu` VALUES ('6d68b4a5ffc84b0995dd7f28ac193f58', '706f0a20b1d948d9b4c0ecef04c4de49', '1168be17cc3348e7b7a85b7482eb7127');
INSERT INTO `sys_role_menu` VALUES ('6f1cf4c7378c457fb297e116ac86805a', '706f0a20b1d948d9b4c0ecef04c4de49', 'de7c50d276454f80881c41a096ecf55c');
INSERT INTO `sys_role_menu` VALUES ('70ce5eea374240daa8a3ecedde738ca6', 'eb77223d14fd4b37a8ac582241514c9d', '9');
INSERT INTO `sys_role_menu` VALUES ('71a28947b17d45dc87b718c47e151545', 'eb77223d14fd4b37a8ac582241514c9d', '2a0f940fbe304a05a6b4040ddf6df279');
INSERT INTO `sys_role_menu` VALUES ('8571785a477d46208f8a44530689437e', '706f0a20b1d948d9b4c0ecef04c4de49', '68f9151151174868ab436e11e03bf548');
INSERT INTO `sys_role_menu` VALUES ('864a2b4f3ae74535944861667f455b82', 'eb77223d14fd4b37a8ac582241514c9d', '4');
INSERT INTO `sys_role_menu` VALUES ('88eafdabdb4f4af88923cfee30064271', '706f0a20b1d948d9b4c0ecef04c4de49', 'c9ad65315d824f758590c9edd2606752');
INSERT INTO `sys_role_menu` VALUES ('935278d8ad534eb984e8aa3cad2e44a8', '706f0a20b1d948d9b4c0ecef04c4de49', '1');
INSERT INTO `sys_role_menu` VALUES ('952fd34c529445f595d175be5b9ed627', 'eb77223d14fd4b37a8ac582241514c9d', 'f93f9a3a2226461dace3b8992cf055ba');
INSERT INTO `sys_role_menu` VALUES ('96f8175d9cc54aab8295bf8d0504db69', 'eb77223d14fd4b37a8ac582241514c9d', '22');
INSERT INTO `sys_role_menu` VALUES ('9bb8a1c03e7c4821af1409596fc8d192', 'eb77223d14fd4b37a8ac582241514c9d', '5');
INSERT INTO `sys_role_menu` VALUES ('9cd86ef8d1da446097bd7ddde2c5c991', '706f0a20b1d948d9b4c0ecef04c4de49', '3c1c639c76f14f6f9903b0143371ea09');
INSERT INTO `sys_role_menu` VALUES ('a17e60af0a074382a7b77de2ee49e6cd', 'eb77223d14fd4b37a8ac582241514c9d', '6');
INSERT INTO `sys_role_menu` VALUES ('a36df02995e04084877eb3b732627d0c', '706f0a20b1d948d9b4c0ecef04c4de49', '5');
INSERT INTO `sys_role_menu` VALUES ('a4f71b9685104f0693b2926fca2b7020', 'eb77223d14fd4b37a8ac582241514c9d', '7');
INSERT INTO `sys_role_menu` VALUES ('a72737cd18a344358d9fdfbb02487a8b', '706f0a20b1d948d9b4c0ecef04c4de49', '7');
INSERT INTO `sys_role_menu` VALUES ('a79afe4103484f6aa954b7ad2272d61b', 'eb77223d14fd4b37a8ac582241514c9d', '3');
INSERT INTO `sys_role_menu` VALUES ('b9dc7158311f4a32982acabf6af88990', '00093b4b51f347eb9353bafd3554293f', '2a0f940fbe304a05a6b4040ddf6df279');
INSERT INTO `sys_role_menu` VALUES ('d913411380f04126b8501c6d1677aaa8', 'eb77223d14fd4b37a8ac582241514c9d', 'de7c50d276454f80881c41a096ecf55c');
INSERT INTO `sys_role_menu` VALUES ('dc409edaa8d142e1b1e6f8dc49303e7a', '00093b4b51f347eb9353bafd3554293f', 'c9ad65315d824f758590c9edd2606752');
INSERT INTO `sys_role_menu` VALUES ('dcc0f927c41849428247fcc74b3bd2ab', 'cc4a40558f2644bea07e5b8f1ba931ca', '95944af666fd428591a6e49b2679b25f');
INSERT INTO `sys_role_menu` VALUES ('e3b50bb7f776471e9a09c4cddd0390d4', '706f0a20b1d948d9b4c0ecef04c4de49', '9');
INSERT INTO `sys_role_menu` VALUES ('e3be8c846f7a4a5a82f8a3fb225e271d', '00093b4b51f347eb9353bafd3554293f', '95944af666fd428591a6e49b2679b25f');
INSERT INTO `sys_role_menu` VALUES ('e8222b139952495bacf1f098e02a490f', '706f0a20b1d948d9b4c0ecef04c4de49', '6');
INSERT INTO `sys_role_menu` VALUES ('ed40e5bcdc50421e827942eaccb3aca8', 'eb77223d14fd4b37a8ac582241514c9d', '3c1c639c76f14f6f9903b0143371ea09');
INSERT INTO `sys_role_menu` VALUES ('f08193b013c14027ab400d4e8f6ecf33', '00093b4b51f347eb9353bafd3554293f', 'f93f9a3a2226461dace3b8992cf055ba');
INSERT INTO `sys_role_menu` VALUES ('f75230830d5748f6b49d18e1ba6a4012', '706f0a20b1d948d9b4c0ecef04c4de49', '2a0f940fbe304a05a6b4040ddf6df279');
INSERT INTO `sys_role_menu` VALUES ('f804715b58a0403abadb7a5ecae74cf8', 'eb77223d14fd4b37a8ac582241514c9d', '68f9151151174868ab436e11e03bf548');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL,
  `user_name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `code` varchar(30) CHARACTER SET utf8 NOT NULL,
  `account` varchar(64) CHARACTER SET utf8 NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 NOT NULL,
  `tel` varchar(18) CHARACTER SET utf8 NOT NULL,
  `is_useable` smallint(6) DEFAULT NULL,
  `sysversion` int(11) NOT NULL,
  `create_by` varchar(64) CHARACTER SET utf8 NOT NULL,
  `create_date` datetime NOT NULL,
  `update_by` varchar(64) CHARACTER SET utf8 NOT NULL,
  `update_date` datetime NOT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `un` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('0', '超级管理员', 'admin', 'admin', '557967DDC0B5428138ADDBE752020E61', '17310558930', null, '0', 'Edwin', '2019-08-31 10:29:31', 'Edwin', '2019-08-31 10:29:31', '', '0');
INSERT INTO `sys_user` VALUES ('1', '张三1', '123', 'edwin', '557967DDC0B5428138ADDBE752020E61', '17310558930', '1', '3', 'edwin', '2019-08-23 01:37:59', 'Edwin', '2019-08-31 22:23:35', '111', '0');
INSERT INTO `sys_user` VALUES ('2', '李四', '1231', 'edwin3', '557967DDC0B5428138ADDBE752020E61', '17310558930', '1', '1', 'edwin', '2019-08-23 01:37:59', 'Edwin', '2019-08-31 23:01:52', '', '0');
INSERT INTO `sys_user` VALUES ('25e38eb01cea4066aab635d72e1ddbe1', '王哲', 'wz', 'wz', '557967DDC0B5428138ADDBE752020E61', '17310558930', null, '2', 'Edwin', '2019-08-27 00:48:30', 'Edwin', '2019-09-01 00:45:58', '213', '0');
INSERT INTO `sys_user` VALUES ('4', '赵六', '1232', 'edwin2', '123456', '17310558930', '1', '0', 'edwin', '2019-08-23 01:37:59', 'edwin', '2019-08-23 01:37:59', null, '0');
INSERT INTO `sys_user` VALUES ('5', '李琦', '1233', 'edwin1', '123456', '17310558930', '1', '0', 'edwin', '2019-08-23 01:37:59', 'edwin', '2019-08-23 01:37:59', null, '0');
INSERT INTO `sys_user` VALUES ('6e0679b5d43c46d7910d887b5538e463', '王帅', '123', '1678618797', '557967DDC0B5428138ADDBE752020E61', '17310558930', null, '15', 'Edwin', '2019-08-24 00:56:39', 'Edwin', '2019-08-31 15:40:05', '123', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `role_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('23aeb24293ad42f3bca9824aa0a3266a', '6e0679b5d43c46d7910d887b5538e463', 'cc4a40558f2644bea07e5b8f1ba931ca');
INSERT INTO `sys_user_role` VALUES ('26e2fce945e24156a6886e25b488ef9b', '2', 'eb77223d14fd4b37a8ac582241514c9d');
INSERT INTO `sys_user_role` VALUES ('b0e29a026e1c410d9e3030ce18aa7428', '6e0679b5d43c46d7910d887b5538e463', '706f0a20b1d948d9b4c0ecef04c4de49');
INSERT INTO `sys_user_role` VALUES ('b93ffd03506348fbae99ca14a7efadb4', '25e38eb01cea4066aab635d72e1ddbe1', '00093b4b51f347eb9353bafd3554293f');
INSERT INTO `sys_user_role` VALUES ('ffeb4c7004d94a44b32aa6c6af79e84b', '1', 'cc4a40558f2644bea07e5b8f1ba931ca');
