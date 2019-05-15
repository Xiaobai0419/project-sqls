/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1_3306
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : 127.0.0.1:3306
 Source Schema         : zhongz

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 15/05/2019 11:25:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200094C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0002696471007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C00077374617475733171007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787070740000707400013070707400013174000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200094C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0002696471007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C00077374617475733171007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787070740000707400013070707400013174000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002727974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'admin-PC1555581980186', 1555582045346, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1555581980000, -1, 5, 'PAUSED', 'CRON', 1555581980000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1555581980000, -1, 5, 'PAUSED', 'CRON', 1555581980000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (11, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (12, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (13, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (14, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (15, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (16, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (17, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (18, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (19, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (20, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (21, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (22, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (23, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (24, 8, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (25, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (26, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (6, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (8, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (9, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法参数',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, 'ryTask', '系统默认（无参）', 'ryNoParams', '', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (2, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法参数',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 173 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-29 17:49:54');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-29 18:47:54');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-29 18:53:12');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-29 18:56:24');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-01 09:08:53');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-01 09:45:17');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-01 10:08:53');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-01 10:17:57');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-01 11:15:58');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-01 11:27:19');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-01 12:39:40');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-01 12:57:02');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-01 13:05:42');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-01 13:15:40');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-01 13:34:01');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-01 14:10:23');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '0', '登录成功', '2019-04-02 10:54:38');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-02 11:03:31');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-02 15:00:56');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-04 12:46:15');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 12:46:21');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 16:11:38');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 16:59:01');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-04 17:01:21');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-04 17:01:24');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 17:01:28');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-04 17:04:28');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 17:04:31');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 17:09:53');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-04 17:13:13');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 17:13:16');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 17:21:04');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 17:27:06');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 17:29:18');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-04 17:34:58');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 17:35:01');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 17:38:12');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-08 08:21:38');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-08 08:41:31');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-08 08:41:34');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '0', '退出成功', '2019-04-08 12:14:43');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '0', '登录成功', '2019-04-08 12:14:52');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '0', '退出成功', '2019-04-08 12:15:33');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-08 14:10:08');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-08 14:22:43');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-08 14:47:31');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-08 14:47:36');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-08 16:25:09');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-08 16:35:10');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-08 16:44:27');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-08 16:51:05');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-08 19:41:21');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-08 19:52:12');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-08 20:10:08');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-08 20:10:13');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-10 16:11:43');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-11 12:31:54');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-11 17:43:21');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-12 15:01:30');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-15 10:18:11');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-15 13:57:25');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-15 13:57:32');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-15 13:57:35');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-15 13:57:40');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-15 14:11:16');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-15 14:37:18');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-15 18:23:19');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-16 09:04:00');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-16 16:04:26');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-17 09:43:07');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-17 14:33:12');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-17 14:35:52');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-18 18:06:45');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2034 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 3, '/monitor/server', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, '/tool/build', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, '/tool/gen', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, '/tool/swagger', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '任务详细', 110, 6, '#', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1055, '任务导出', 110, 7, '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1056, '生成查询', 114, 1, '#', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1057, '生成代码', 114, 2, '#', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2000, '客服及帮助', 0, 0, '#', 'M', '0', '', 'fa fa-address-book', 'admin', '2019-04-01 09:47:35', 'admin', '2019-04-01 09:47:56', '');
INSERT INTO `sys_menu` VALUES (2001, '订单管理', 2000, 1, '#', 'C', '0', NULL, '#', 'admin', '2019-04-01 09:49:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '签约订单', 2001, 1, '/system/zhongzOrder', 'C', '0', 'system:zhongzOrder:view', '#', 'admin', '2019-04-01 09:52:28', 'admin', '2019-04-01 09:55:27', '');
INSERT INTO `sys_menu` VALUES (2003, '订单查询', 2002, 1, '#', 'F', '0', 'system:zhongzOrder:list', '#', 'admin', '2019-04-01 09:57:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '订单新增', 2002, 2, '#', 'F', '0', 'system:zhongzOrder:add', '#', 'admin', '2019-04-01 09:58:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '订单修改', 2002, 3, '#', 'F', '0', 'system:zhongzOrder:edit', '#', 'admin', '2019-04-01 09:59:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '订单删除', 2002, 4, '#', 'F', '0', 'system:zhongzOrder:remove', '#', 'admin', '2019-04-01 09:59:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '意见反馈', 2000, 1, '/system/zhongzSuggestion', 'C', '0', 'system:zhongzSuggestion:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '意见反馈菜单');
INSERT INTO `sys_menu` VALUES (2008, '意见反馈查询', 2007, 1, '#', 'F', '0', 'system:zhongzSuggestion:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2009, '意见反馈新增', 2007, 2, '#', 'F', '0', 'system:zhongzSuggestion:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2010, '意见反馈修改', 2007, 3, '#', 'F', '0', 'system:zhongzSuggestion:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2011, '意见反馈删除', 2007, 4, '#', 'F', '0', 'system:zhongzSuggestion:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2012, '意见反馈采纳', 2007, 5, '#', 'F', '0', 'system:zhongzSuggestion:accept', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2013, '意见反馈不采纳', 2007, 6, '#', 'F', '0', 'system:zhongzSuggestion:disaccept', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2014, '业主委托', 2000, 1, '/system/zhongzEntrust', 'C', '0', 'system:zhongzEntrust:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '业主委托菜单');
INSERT INTO `sys_menu` VALUES (2015, '业主委托查询', 2014, 1, '#', 'F', '0', 'system:zhongzEntrust:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2016, '业主委托新增', 2014, 2, '#', 'F', '0', 'system:zhongzEntrust:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2017, '业主委托修改', 2014, 3, '#', 'F', '0', 'system:zhongzEntrust:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2018, '业主委托删除', 2014, 4, '#', 'F', '0', 'system:zhongzEntrust:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2019, '业主委托受理', 2014, 5, '#', 'F', '0', 'system:zhongzEntrust:accept', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2020, '业主委托取消受理', 2014, 6, '#', 'F', '0', 'system:zhongzEntrust:disaccept', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2026, '资源管理', 0, 5, '#', 'M', '0', '', 'fa fa-cubes', 'admin', '2019-04-30 14:15:18', '', '2019-04-30 14:30:13', '');
INSERT INTO `sys_menu` VALUES (2027, '店铺信息维护', 2026, 4, '#', 'M', '0', '', 'fa fa-institution', 'admin', '2019-04-30 14:18:54', '', '2019-04-30 14:30:37', '');
INSERT INTO `sys_menu` VALUES (2029, '服务类型', 2027, 1, '/system/zhongzServiceType', 'C', '0', 'system:zhongzServiceType:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-04-30 14:26:08', '服务类型菜单');
INSERT INTO `sys_menu` VALUES (2030, '服务类型查询', 2029, 1, '#', 'F', '0', 'system:zhongzServiceType:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2031, '服务类型新增', 2029, 2, '#', 'F', '0', 'system:zhongzServiceType:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2032, '服务类型修改', 2029, 3, '#', 'F', '0', 'system:zhongzServiceType:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2033, '服务类型删除', 2029, 4, '#', 'F', '0', 'system:zhongzServiceType:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 208 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '角色管理', 5, 'com.ruoyi.web.controller.system.SysRoleController.export()', 1, 'admin', '研发部门', '/system/role/export', '127.0.0.1', '内网IP', '{\r\n  \"roleName\" : [ \"\" ],\r\n  \"roleKey\" : [ \"\" ],\r\n  \"status\" : [ \"\" ],\r\n  \"params[beginTime]\" : [ \"\" ],\r\n  \"params[endTime]\" : [ \"\" ]\r\n}', 0, NULL, '2019-03-29 18:59:25');
INSERT INTO `sys_oper_log` VALUES (101, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 1, 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"105\" ],\r\n  \"userName\" : [ \"yy\" ],\r\n  \"deptName\" : [ \"测试部门\" ],\r\n  \"phonenumber\" : [ \"13234342343\" ],\r\n  \"email\" : [ \"fd@123\" ],\r\n  \"loginName\" : [ \"yy\" ],\r\n  \"password\" : [ \"123456\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"1\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1\" ],\r\n  \"postIds\" : [ \"2\" ]\r\n}', 0, NULL, '2019-03-29 19:02:16');
INSERT INTO `sys_oper_log` VALUES (102, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"100\" ],\r\n  \"status\" : [ \"1\" ]\r\n}', 0, NULL, '2019-03-29 19:02:25');
INSERT INTO `sys_oper_log` VALUES (103, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"100\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 0, NULL, '2019-03-29 19:02:28');
INSERT INTO `sys_oper_log` VALUES (104, '重置密码', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 1, 'admin', '研发部门', '/system/user/resetPwd/100', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-03-29 19:02:46');
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"客服及帮助\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-address-book\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-04-01 09:47:35');
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2000\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"客服及帮助\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"0\" ],\r\n  \"icon\" : [ \"fa fa-address-book\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-04-01 09:47:56');
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2000\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"订单管理\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-04-01 09:49:24');
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2001\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"签约订单\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-04-01 09:52:28');
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2002\" ],\r\n  \"parentId\" : [ \"2001\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"签约订单\" ],\r\n  \"url\" : [ \"/system/zhongzOrder\" ],\r\n  \"perms\" : [ \"system:zhongzOrder:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-04-01 09:55:27');
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2002\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"订单查询\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"system:zhongzOrder:list\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-04-01 09:57:33');
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2002\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"订单新增\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"system:zhongzOrder:add\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-04-01 09:58:44');
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2002\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"订单修改\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"system:zhongzOrder:edit\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-04-01 09:59:28');
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2002\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"订单删除\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"system:zhongzOrder:remove\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-04-01 09:59:57');
INSERT INTO `sys_oper_log` VALUES (114, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"111111\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ],\r\n  \"createBy\" : [ \"\" ],\r\n  \"createTime\" : [ \"\" ],\r\n  \"updateBy\" : [ \"\" ],\r\n  \"updateTime\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"\" ]\r\n}', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may involve com.zhongz.mapper.ZhongzOrderMapper.insertZhongzOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into zhongz_order    ( order_id )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2019-04-01 10:19:29');
INSERT INTO `sys_oper_log` VALUES (115, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 1, 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"uu\" ],\r\n  \"deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"13234545678\" ],\r\n  \"email\" : [ \"dd@uu\" ],\r\n  \"loginName\" : [ \"uu\" ],\r\n  \"password\" : [ \"123456\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"1\" ],\r\n  \"remark\" : [ \"111\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1\" ],\r\n  \"postIds\" : [ \"3\" ]\r\n}', 0, NULL, '2019-04-01 11:17:13');
INSERT INTO `sys_oper_log` VALUES (116, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"101\" ],\r\n  \"status\" : [ \"1\" ]\r\n}', 0, NULL, '2019-04-01 11:17:17');
INSERT INTO `sys_oper_log` VALUES (117, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"101\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 0, NULL, '2019-04-01 11:17:20');
INSERT INTO `sys_oper_log` VALUES (118, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"101\" ],\r\n  \"deptId\" : [ \"105\" ],\r\n  \"userName\" : [ \"uu\" ],\r\n  \"dept.deptName\" : [ \"测试部门\" ],\r\n  \"phonenumber\" : [ \"15566666666\" ],\r\n  \"email\" : [ \"dd@uu\" ],\r\n  \"loginName\" : [ \"uu\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"1\" ],\r\n  \"remark\" : [ \"111\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1\" ],\r\n  \"postIds\" : [ \"3\" ]\r\n}', 0, NULL, '2019-04-01 11:17:43');
INSERT INTO `sys_oper_log` VALUES (119, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 1, 'admin', '研发部门', '/system/user/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"101\" ]\r\n}', 0, NULL, '2019-04-01 11:17:51');
INSERT INTO `sys_oper_log` VALUES (120, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 1, 'admin', '研发部门', '/system/user/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"101\" ]\r\n}', 0, NULL, '2019-04-01 11:17:51');
INSERT INTO `sys_oper_log` VALUES (121, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"\" ],\r\n  \"parentId\" : [ \"\" ],\r\n  \"loginName\" : [ \"\" ],\r\n  \"phonenumber\" : [ \"\" ],\r\n  \"status\" : [ \"\" ],\r\n  \"params[beginTime]\" : [ \"\" ],\r\n  \"params[endTime]\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 11:17:56');
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"cc\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-04-01 11:19:06');
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2007\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"ss\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-04-01 11:19:33');
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2008\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"ff\" ],\r\n  \"url\" : [ \"/system/zhongzOrder\" ],\r\n  \"perms\" : [ \"system:zhongzOrder:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-04-01 11:20:29');
INSERT INTO `sys_oper_log` VALUES (125, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"12345\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ],\r\n  \"createBy\" : [ \"\" ],\r\n  \"createTime\" : [ \"\" ],\r\n  \"updateBy\" : [ \"\" ],\r\n  \"updateTime\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 11:21:03');
INSERT INTO `sys_oper_log` VALUES (126, '订单', 2, 'com.zhongz.web.controller.ZhongzOrderController.editSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"9e3920b60f064f719aac13d5a6f0f806\" ],\r\n  \"orderType\" : [ \"0\" ],\r\n  \"orderId\" : [ \"12345\" ],\r\n  \"orderStatus\" : [ \"0\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"0\" ],\r\n  \"acceptType\" : [ \"0\" ],\r\n  \"payed\" : [ \"0\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"0\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"0\" ],\r\n  \"monthlyRent\" : [ \"0.0\" ],\r\n  \"pledgeMonth\" : [ \"0\" ],\r\n  \"heatingPerSquare\" : [ \"0.0\" ],\r\n  \"managementPerSquare\" : [ \"0.0\" ],\r\n  \"area\" : [ \"0.0\" ],\r\n  \"waterWatch\" : [ \"0.0\" ],\r\n  \"electricWatch\" : [ \"0.0\" ],\r\n  \"gasWatch\" : [ \"0.0\" ],\r\n  \"debt\" : [ \"0.0\" ],\r\n  \"rentTotal\" : [ \"0.0\" ],\r\n  \"payPeriod\" : [ \"0\" ],\r\n  \"payType\" : [ \"0\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ],\r\n  \"createBy\" : [ \"\" ],\r\n  \"createTime\" : [ \"Mon Apr 01 11:21:05 CST 2019\" ],\r\n  \"updateBy\" : [ \"\" ],\r\n  \"updateTime\" : [ \"Mon Apr 01 11:21:05 CST 2019\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status1\" : [ \"0\" ]\r\n}', 0, NULL, '2019-04-01 11:28:58');
INSERT INTO `sys_oper_log` VALUES (127, '订单', 2, 'com.zhongz.web.controller.ZhongzOrderController.editSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"9e3920b60f064f719aac13d5a6f0f806\" ],\r\n  \"orderType\" : [ \"1\" ],\r\n  \"orderId\" : [ \"12345\" ],\r\n  \"orderStatus\" : [ \"0\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"qqq\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"0\" ],\r\n  \"acceptType\" : [ \"0\" ],\r\n  \"payed\" : [ \"0\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"0\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"0\" ],\r\n  \"monthlyRent\" : [ \"0.0\" ],\r\n  \"pledgeMonth\" : [ \"0\" ],\r\n  \"heatingPerSquare\" : [ \"0.0\" ],\r\n  \"managementPerSquare\" : [ \"0.0\" ],\r\n  \"area\" : [ \"0.0\" ],\r\n  \"waterWatch\" : [ \"0.0\" ],\r\n  \"electricWatch\" : [ \"0.0\" ],\r\n  \"gasWatch\" : [ \"0.0\" ],\r\n  \"debt\" : [ \"0.0\" ],\r\n  \"rentTotal\" : [ \"0.0\" ],\r\n  \"payPeriod\" : [ \"0\" ],\r\n  \"payType\" : [ \"0\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ],\r\n  \"createBy\" : [ \"\" ],\r\n  \"createTime\" : [ \"Mon Apr 01 11:21:05 CST 2019\" ],\r\n  \"updateBy\" : [ \"\" ],\r\n  \"updateTime\" : [ \"Mon Apr 01 11:29:00 CST 2019\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status1\" : [ \"0\" ]\r\n}', 0, NULL, '2019-04-01 11:30:21');
INSERT INTO `sys_oper_log` VALUES (128, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"2\" ],\r\n  \"orderId\" : [ \"www\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ],\r\n  \"createBy\" : [ \"\" ],\r\n  \"createTime\" : [ \"\" ],\r\n  \"updateBy\" : [ \"\" ],\r\n  \"updateTime\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status1\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 11:30:36');
INSERT INTO `sys_oper_log` VALUES (129, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"0\" ],\r\n  \"orderId\" : [ \"aaaaa\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ],\r\n  \"createBy\" : [ \"\" ],\r\n  \"createTime\" : [ \"\" ],\r\n  \"updateBy\" : [ \"\" ],\r\n  \"updateTime\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status1\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 11:31:13');
INSERT INTO `sys_oper_log` VALUES (130, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"0\" ],\r\n  \"orderId\" : [ \"sssss\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 12:40:24');
INSERT INTO `sys_oper_log` VALUES (131, '订单', 3, 'com.zhongz.web.controller.ZhongzOrderController.remove()', 1, 'admin', '研发部门', '/system/zhongzOrder/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"71027c6461be4b3296c4d97d94eeedc6\" ]\r\n}', 0, NULL, '2019-04-01 12:40:40');
INSERT INTO `sys_oper_log` VALUES (132, '订单', 2, 'com.zhongz.web.controller.ZhongzOrderController.editSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"9e3920b60f064f719aac13d5a6f0f806\" ],\r\n  \"orderType\" : [ \"1\" ],\r\n  \"orderId\" : [ \"qqq111\" ],\r\n  \"orderStatus\" : [ \"0\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"@@@@\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"0\" ],\r\n  \"acceptType\" : [ \"0\" ],\r\n  \"payed\" : [ \"0\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"0\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"0\" ],\r\n  \"monthlyRent\" : [ \"0.0\" ],\r\n  \"pledgeMonth\" : [ \"0\" ],\r\n  \"heatingPerSquare\" : [ \"0.0\" ],\r\n  \"managementPerSquare\" : [ \"0.0\" ],\r\n  \"area\" : [ \"0.0\" ],\r\n  \"waterWatch\" : [ \"0.0\" ],\r\n  \"electricWatch\" : [ \"0.0\" ],\r\n  \"gasWatch\" : [ \"0.0\" ],\r\n  \"debt\" : [ \"0.0\" ],\r\n  \"rentTotal\" : [ \"0.0\" ],\r\n  \"payPeriod\" : [ \"0\" ],\r\n  \"payType\" : [ \"0\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 13:06:24');
INSERT INTO `sys_oper_log` VALUES (133, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"2\" ],\r\n  \"orderId\" : [ \"3333333\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 13:06:42');
INSERT INTO `sys_oper_log` VALUES (134, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 13:06:47');
INSERT INTO `sys_oper_log` VALUES (135, '订单', 3, 'com.zhongz.web.controller.ZhongzOrderController.remove()', 1, 'admin', '研发部门', '/system/zhongzOrder/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"0,2\" ]\r\n}', 0, NULL, '2019-04-01 13:06:56');
INSERT INTO `sys_oper_log` VALUES (136, '订单', 3, 'com.zhongz.web.controller.ZhongzOrderController.remove()', 1, 'admin', '研发部门', '/system/zhongzOrder/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"0,2\" ]\r\n}', 0, NULL, '2019-04-01 13:08:42');
INSERT INTO `sys_oper_log` VALUES (137, '订单', 3, 'com.zhongz.web.controller.ZhongzOrderController.remove()', 1, 'admin', '研发部门', '/system/zhongzOrder/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"ced5caba13714cfe89b43889499ff10d,e325de90fe0b4555b40a9fe6644f75e8\" ]\r\n}', 0, NULL, '2019-04-01 13:15:58');
INSERT INTO `sys_oper_log` VALUES (138, '订单', 2, 'com.zhongz.web.controller.ZhongzOrderController.editSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"9e3920b60f064f719aac13d5a6f0f806\" ],\r\n  \"orderType\" : [ \"1\" ],\r\n  \"orderId\" : [ \"qqq111\" ],\r\n  \"orderStatus\" : [ \"0\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"@@@@11\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"0\" ],\r\n  \"acceptType\" : [ \"0\" ],\r\n  \"payed\" : [ \"0\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"0\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"0\" ],\r\n  \"monthlyRent\" : [ \"0.0\" ],\r\n  \"pledgeMonth\" : [ \"0\" ],\r\n  \"heatingPerSquare\" : [ \"0.0\" ],\r\n  \"managementPerSquare\" : [ \"0.0\" ],\r\n  \"area\" : [ \"0.0\" ],\r\n  \"waterWatch\" : [ \"0.0\" ],\r\n  \"electricWatch\" : [ \"0.0\" ],\r\n  \"gasWatch\" : [ \"0.0\" ],\r\n  \"debt\" : [ \"0.0\" ],\r\n  \"rentTotal\" : [ \"0.0\" ],\r\n  \"payPeriod\" : [ \"0\" ],\r\n  \"payType\" : [ \"0\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 13:16:24');
INSERT INTO `sys_oper_log` VALUES (139, '订单', 2, 'com.zhongz.web.controller.ZhongzOrderController.editSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"9e3920b60f064f719aac13d5a6f0f806\" ],\r\n  \"orderType\" : [ \"1\" ],\r\n  \"orderId\" : [ \"aaaaa\" ],\r\n  \"orderStatus\" : [ \"0\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"@@@@11\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"0\" ],\r\n  \"acceptType\" : [ \"0\" ],\r\n  \"payed\" : [ \"0\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"0\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"0\" ],\r\n  \"monthlyRent\" : [ \"0.0\" ],\r\n  \"pledgeMonth\" : [ \"0\" ],\r\n  \"heatingPerSquare\" : [ \"0.0\" ],\r\n  \"managementPerSquare\" : [ \"0.0\" ],\r\n  \"area\" : [ \"0.0\" ],\r\n  \"waterWatch\" : [ \"0.0\" ],\r\n  \"electricWatch\" : [ \"0.0\" ],\r\n  \"gasWatch\" : [ \"0.0\" ],\r\n  \"debt\" : [ \"0.0\" ],\r\n  \"rentTotal\" : [ \"0.0\" ],\r\n  \"payPeriod\" : [ \"0\" ],\r\n  \"payType\" : [ \"0\" ],\r\n  \"invitationCode\" : [ \"qqqqq\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 13:34:55');
INSERT INTO `sys_oper_log` VALUES (140, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 13:35:13');
INSERT INTO `sys_oper_log` VALUES (141, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 13:35:16');
INSERT INTO `sys_oper_log` VALUES (142, '订单', 3, 'com.zhongz.web.controller.ZhongzOrderController.remove()', 1, 'admin', '研发部门', '/system/zhongzOrder/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"8e70a089577143bca90ea9f896fcd50f,c56335961d42464a92fca95f6d49c118\" ]\r\n}', 0, NULL, '2019-04-01 13:36:11');
INSERT INTO `sys_oper_log` VALUES (143, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 13:37:27');
INSERT INTO `sys_oper_log` VALUES (144, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 13:37:29');
INSERT INTO `sys_oper_log` VALUES (145, '订单', 3, 'com.zhongz.web.controller.ZhongzOrderController.remove()', 1, 'admin', '研发部门', '/system/zhongzOrder/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"596403b024144ce4ba491737bae36e2f\" ]\r\n}', 0, NULL, '2019-04-01 13:37:45');
INSERT INTO `sys_oper_log` VALUES (146, '订单', 3, 'com.zhongz.web.controller.ZhongzOrderController.remove()', 1, 'admin', '研发部门', '/system/zhongzOrder/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"fc3dc545379240718e74f98ef1da470c\" ]\r\n}', 0, NULL, '2019-04-01 13:37:51');
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/2007', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-04-01 13:40:43');
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/2009', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-04-01 13:40:53');
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/2008', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-04-01 13:40:59');
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/2007', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-04-01 13:41:05');
INSERT INTO `sys_oper_log` VALUES (151, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:11:07');
INSERT INTO `sys_oper_log` VALUES (152, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:11:28');
INSERT INTO `sys_oper_log` VALUES (153, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:12:09');
INSERT INTO `sys_oper_log` VALUES (154, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:12:15');
INSERT INTO `sys_oper_log` VALUES (155, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:12:18');
INSERT INTO `sys_oper_log` VALUES (156, '订单', 3, 'com.zhongz.web.controller.ZhongzOrderController.remove()', 1, 'admin', '研发部门', '/system/zhongzOrder/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2b6199425d644afe8978b3443cdc93d5,57166c2ea44842ee9ac885991a78a0d7,9e3920b60f064f719aac13d5a6f0f806,abdb80174858454792c034f291748b81,b8e36441df7c42bbacac0cad0d62793c,e520c511e7584726a0b97cf90087d422\" ]\r\n}', 0, NULL, '2019-04-01 14:12:26');
INSERT INTO `sys_oper_log` VALUES (157, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:12:31');
INSERT INTO `sys_oper_log` VALUES (158, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:12:33');
INSERT INTO `sys_oper_log` VALUES (159, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:12:35');
INSERT INTO `sys_oper_log` VALUES (160, '订单', 3, 'com.zhongz.web.controller.ZhongzOrderController.remove()', 1, 'admin', '研发部门', '/system/zhongzOrder/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"673ed265a04a4c228a6841407c47a4ae\" ]\r\n}', 0, NULL, '2019-04-01 14:13:12');
INSERT INTO `sys_oper_log` VALUES (161, '订单', 3, 'com.zhongz.web.controller.ZhongzOrderController.remove()', 1, 'admin', '研发部门', '/system/zhongzOrder/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"08b83f150a444f51962ca0efe8e3b2ab\" ]\r\n}', 0, NULL, '2019-04-01 14:13:15');
INSERT INTO `sys_oper_log` VALUES (162, '订单', 2, 'com.zhongz.web.controller.ZhongzOrderController.editSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2eb89d7d3daf47d2b087da3db8ecab14\" ],\r\n  \"orderType\" : [ \"0\" ],\r\n  \"orderId\" : [ \"aaaaa\" ],\r\n  \"orderStatus\" : [ \"0\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"0\" ],\r\n  \"acceptType\" : [ \"0\" ],\r\n  \"payed\" : [ \"0\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"0\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"0\" ],\r\n  \"monthlyRent\" : [ \"0.0\" ],\r\n  \"pledgeMonth\" : [ \"0\" ],\r\n  \"heatingPerSquare\" : [ \"0.0\" ],\r\n  \"managementPerSquare\" : [ \"0.0\" ],\r\n  \"area\" : [ \"0.0\" ],\r\n  \"waterWatch\" : [ \"0.0\" ],\r\n  \"electricWatch\" : [ \"0.0\" ],\r\n  \"gasWatch\" : [ \"0.0\" ],\r\n  \"debt\" : [ \"0.0\" ],\r\n  \"rentTotal\" : [ \"0.0\" ],\r\n  \"payPeriod\" : [ \"0\" ],\r\n  \"payType\" : [ \"0\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:13:22');
INSERT INTO `sys_oper_log` VALUES (163, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"aaaa11\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:13:33');
INSERT INTO `sys_oper_log` VALUES (164, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:21:30');
INSERT INTO `sys_oper_log` VALUES (165, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:21:32');
INSERT INTO `sys_oper_log` VALUES (166, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:21:35');
INSERT INTO `sys_oper_log` VALUES (167, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:21:37');
INSERT INTO `sys_oper_log` VALUES (168, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:21:39');
INSERT INTO `sys_oper_log` VALUES (169, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:21:41');
INSERT INTO `sys_oper_log` VALUES (170, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:21:44');
INSERT INTO `sys_oper_log` VALUES (171, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:21:47');
INSERT INTO `sys_oper_log` VALUES (172, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:21:48');
INSERT INTO `sys_oper_log` VALUES (173, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:21:57');
INSERT INTO `sys_oper_log` VALUES (174, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:21:59');
INSERT INTO `sys_oper_log` VALUES (175, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"去去去\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:22:12');
INSERT INTO `sys_oper_log` VALUES (176, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"去去去1\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:22:23');
INSERT INTO `sys_oper_log` VALUES (177, '订单', 3, 'com.zhongz.web.controller.ZhongzOrderController.remove()', 1, 'admin', '研发部门', '/system/zhongzOrder/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"168671efdb424fac84ed50300d731b21,1d0c92d256084295a51eeaa675663b08,2eb89d7d3daf47d2b087da3db8ecab14,472702ce1d5041289904b9ccc409d577,5256aac1a3714303b7977f2506a3f3a3,569201b3cf4e41c180d97cbfafd68bd8,650ffc0d67704b08ab1f3fbd7a5e932f,6dbe0075f6064675b66df0d8fdd7f825,89bf68f4c9614623882702a1d68698b2,aeb3c388ac1843ca9e5584dd0b315e68\" ]\r\n}', 0, NULL, '2019-04-01 14:24:57');
INSERT INTO `sys_oper_log` VALUES (178, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:25:06');
INSERT INTO `sys_oper_log` VALUES (179, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:25:08');
INSERT INTO `sys_oper_log` VALUES (180, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"www\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:25:16');
INSERT INTO `sys_oper_log` VALUES (181, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:25:21');
INSERT INTO `sys_oper_log` VALUES (182, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"aaaaaa\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:25:25');
INSERT INTO `sys_oper_log` VALUES (183, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"q12\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:25:30');
INSERT INTO `sys_oper_log` VALUES (184, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"houseId\" : [ \"\" ],\r\n  \"tenantId\" : [ \"\" ],\r\n  \"entrustedAgentId\" : [ \"\" ],\r\n  \"renterId\" : [ \"\" ],\r\n  \"acceptTime\" : [ \"\" ],\r\n  \"acceptStatus\" : [ \"\" ],\r\n  \"acceptType\" : [ \"\" ],\r\n  \"payed\" : [ \"\" ],\r\n  \"contractId\" : [ \"\" ],\r\n  \"contractStatus\" : [ \"\" ],\r\n  \"rentStartTime\" : [ \"\" ],\r\n  \"rentEndTime\" : [ \"\" ],\r\n  \"signedTime\" : [ \"\" ],\r\n  \"continuationTime\" : [ \"\" ],\r\n  \"continuationPeriod\" : [ \"\" ],\r\n  \"monthlyRent\" : [ \"\" ],\r\n  \"pledgeMonth\" : [ \"\" ],\r\n  \"heatingPerSquare\" : [ \"\" ],\r\n  \"managementPerSquare\" : [ \"\" ],\r\n  \"area\" : [ \"\" ],\r\n  \"waterWatch\" : [ \"\" ],\r\n  \"electricWatch\" : [ \"\" ],\r\n  \"gasWatch\" : [ \"\" ],\r\n  \"debt\" : [ \"\" ],\r\n  \"rentTotal\" : [ \"\" ],\r\n  \"payPeriod\" : [ \"\" ],\r\n  \"payType\" : [ \"\" ],\r\n  \"invitationCode\" : [ \"\" ],\r\n  \"coupon\" : [ \"\" ],\r\n  \"couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-01 14:25:37');
INSERT INTO `sys_oper_log` VALUES (185, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"zhongz_user,zhongz_room,zhongz_favourite,zhongz_search_history,zhongz_rent_price,zhongz_validate_code,zhongz_manager,zhongz_comment,zhongz_entrust,zhongz_service_type,zhongz_order_record,zhongz_house_event,zhongz_coupon,zhongz_coupon_policy,zhongz_house,zhongz_event,zhongz_contract,zhongz_restaurant,zhongz_estate,zhongz_request_service_type,zhongz_service_order,zhongz_direction_type,zhongz_structure_type,zhongz_card_type,zhongz_user_type,zhongz_pay_period_type,zhongz_pay_type,zhongz_contract_status,zhongz_payed_type,zhongz_accept_type,zhongz_accept_status,zhongz_order_status,zhongz_order_type,zhongz_order,zhongz_suggestion,zhongz_buiding_type,zhongz_age,zhongz_residence,zhongz_nation,zhongz_hot_tag,zhongz_soft_config,zhongz_rent_type,zhongz_electric_config\" ]\r\n}', 0, NULL, '2019-04-04 12:48:51');
INSERT INTO `sys_oper_log` VALUES (186, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"2\" ],\r\n  \"orderId\" : [ \"1111111111\" ],\r\n  \"orderStatus\" : [ \"0\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"contract.houseId\" : [ \"\" ],\r\n  \"contract.tenantId\" : [ \"1111111111111111\" ],\r\n  \"contract.entrustedAgentId\" : [ \"\" ],\r\n  \"contract.renterId\" : [ \"\" ],\r\n  \"contract.acceptTime\" : [ \"\" ],\r\n  \"contract.acceptStatus\" : [ \"\" ],\r\n  \"contract.acceptType\" : [ \"\" ],\r\n  \"contract.payed\" : [ \"\" ],\r\n  \"contract.contractId\" : [ \"\" ],\r\n  \"contract.contractStatus\" : [ \"\" ],\r\n  \"contract.rentStartTime\" : [ \"\" ],\r\n  \"contract.rentEndTime\" : [ \"\" ],\r\n  \"contract.signedTime\" : [ \"\" ],\r\n  \"contract.continuationTime\" : [ \"\" ],\r\n  \"contract.continuationPeriod\" : [ \"\" ],\r\n  \"contract.monthlyRent\" : [ \"\" ],\r\n  \"contract.pledgeMonth\" : [ \"\" ],\r\n  \"contract.heatingPerSquare\" : [ \"\" ],\r\n  \"contract.managementPerSquare\" : [ \"\" ],\r\n  \"contract.area\" : [ \"\" ],\r\n  \"contract.waterWatch\" : [ \"\" ],\r\n  \"contract.electricWatch\" : [ \"\" ],\r\n  \"contract.gasWatch\" : [ \"\" ],\r\n  \"contract.debt\" : [ \"\" ],\r\n  \"contract.rentTotal\" : [ \"\" ],\r\n  \"contract.payPeriod\" : [ \"\" ],\r\n  \"contract.payType\" : [ \"\" ],\r\n  \"contract.invitationCode\" : [ \"\" ],\r\n  \"contract.coupon\" : [ \"\" ],\r\n  \"contract.couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-04 16:16:06');
INSERT INTO `sys_oper_log` VALUES (187, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"contract.houseId\" : [ \"\" ],\r\n  \"contract.tenantId\" : [ \"\" ],\r\n  \"contract.entrustedAgentId\" : [ \"\" ],\r\n  \"contract.renterId\" : [ \"\" ],\r\n  \"contract.acceptTime\" : [ \"\" ],\r\n  \"contract.acceptStatus\" : [ \"\" ],\r\n  \"contract.acceptType\" : [ \"\" ],\r\n  \"contract.payed\" : [ \"\" ],\r\n  \"contract.contractId\" : [ \"\" ],\r\n  \"contract.contractStatus\" : [ \"\" ],\r\n  \"contract.rentStartTime\" : [ \"\" ],\r\n  \"contract.rentEndTime\" : [ \"\" ],\r\n  \"contract.signedTime\" : [ \"\" ],\r\n  \"contract.continuationTime\" : [ \"\" ],\r\n  \"contract.continuationPeriod\" : [ \"\" ],\r\n  \"contract.monthlyRent\" : [ \"\" ],\r\n  \"contract.pledgeMonth\" : [ \"\" ],\r\n  \"contract.heatingPerSquare\" : [ \"\" ],\r\n  \"contract.managementPerSquare\" : [ \"\" ],\r\n  \"contract.area\" : [ \"\" ],\r\n  \"contract.waterWatch\" : [ \"\" ],\r\n  \"contract.electricWatch\" : [ \"\" ],\r\n  \"contract.gasWatch\" : [ \"\" ],\r\n  \"contract.debt\" : [ \"\" ],\r\n  \"contract.rentTotal\" : [ \"\" ],\r\n  \"contract.payPeriod\" : [ \"\" ],\r\n  \"contract.payType\" : [ \"\" ],\r\n  \"contract.invitationCode\" : [ \"\" ],\r\n  \"contract.coupon\" : [ \"\" ],\r\n  \"contract.couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-04 17:01:51');
INSERT INTO `sys_oper_log` VALUES (188, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"contract.houseId\" : [ \"\" ],\r\n  \"contract.tenantId\" : [ \"\" ],\r\n  \"contract.entrustedAgentId\" : [ \"\" ],\r\n  \"contract.renterId\" : [ \"\" ],\r\n  \"contract.acceptTime\" : [ \"\" ],\r\n  \"contract.acceptStatus\" : [ \"\" ],\r\n  \"contract.acceptType\" : [ \"\" ],\r\n  \"contract.payed\" : [ \"\" ],\r\n  \"contract.contractId\" : [ \"111\" ],\r\n  \"contract.contractStatus\" : [ \"\" ],\r\n  \"contract.rentStartTime\" : [ \"\" ],\r\n  \"contract.rentEndTime\" : [ \"\" ],\r\n  \"contract.signedTime\" : [ \"\" ],\r\n  \"contract.continuationTime\" : [ \"\" ],\r\n  \"contract.continuationPeriod\" : [ \"\" ],\r\n  \"contract.monthlyRent\" : [ \"\" ],\r\n  \"contract.pledgeMonth\" : [ \"\" ],\r\n  \"contract.heatingPerSquare\" : [ \"\" ],\r\n  \"contract.managementPerSquare\" : [ \"\" ],\r\n  \"contract.area\" : [ \"\" ],\r\n  \"contract.waterWatch\" : [ \"\" ],\r\n  \"contract.electricWatch\" : [ \"\" ],\r\n  \"contract.gasWatch\" : [ \"\" ],\r\n  \"contract.debt\" : [ \"\" ],\r\n  \"contract.rentTotal\" : [ \"\" ],\r\n  \"contract.payPeriod\" : [ \"\" ],\r\n  \"contract.payType\" : [ \"\" ],\r\n  \"contract.invitationCode\" : [ \"\" ],\r\n  \"contract.coupon\" : [ \"\" ],\r\n  \"contract.couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-04 17:27:33');
INSERT INTO `sys_oper_log` VALUES (189, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"contract.houseId\" : [ \"\" ],\r\n  \"contract.tenantId\" : [ \"\" ],\r\n  \"contract.entrustedAgentId\" : [ \"\" ],\r\n  \"contract.renterId\" : [ \"\" ],\r\n  \"contract.acceptTime\" : [ \"\" ],\r\n  \"contract.acceptStatus\" : [ \"\" ],\r\n  \"contract.acceptType\" : [ \"\" ],\r\n  \"contract.payed\" : [ \"\" ],\r\n  \"contract.contractId\" : [ \"111\" ],\r\n  \"contract.contractStatus\" : [ \"\" ],\r\n  \"contract.rentStartTime\" : [ \"\" ],\r\n  \"contract.rentEndTime\" : [ \"\" ],\r\n  \"contract.signedTime\" : [ \"\" ],\r\n  \"contract.continuationTime\" : [ \"\" ],\r\n  \"contract.continuationPeriod\" : [ \"\" ],\r\n  \"contract.monthlyRent\" : [ \"\" ],\r\n  \"contract.pledgeMonth\" : [ \"\" ],\r\n  \"contract.heatingPerSquare\" : [ \"\" ],\r\n  \"contract.managementPerSquare\" : [ \"\" ],\r\n  \"contract.area\" : [ \"\" ],\r\n  \"contract.waterWatch\" : [ \"\" ],\r\n  \"contract.electricWatch\" : [ \"\" ],\r\n  \"contract.gasWatch\" : [ \"\" ],\r\n  \"contract.debt\" : [ \"\" ],\r\n  \"contract.rentTotal\" : [ \"\" ],\r\n  \"contract.payPeriod\" : [ \"\" ],\r\n  \"contract.payType\" : [ \"\" ],\r\n  \"contract.invitationCode\" : [ \"\" ],\r\n  \"contract.coupon\" : [ \"\" ],\r\n  \"contract.couponComment\" : [ \"\" ]\r\n}', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'111\' for key \'zhongz_contract_idx1\'\r\n### The error may involve com.zhongz.mapper.ZhongzContractMapper.insertZhongzContract-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into zhongz_contract    ( id,                                                contract_id,                                                                                            create_time,        update_time,        status1 )           values ( ?,                                                ?,                                                                                            ?,        ?,        ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'111\' for key \'zhongz_contract_idx1\'\n; Duplicate entry \'111\' for key \'zhongz_contract_idx1\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'111\' for key \'zhongz_contract_idx1\'', '2019-04-04 17:29:33');
INSERT INTO `sys_oper_log` VALUES (190, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"contract.houseId\" : [ \"\" ],\r\n  \"contract.tenantId\" : [ \"\" ],\r\n  \"contract.entrustedAgentId\" : [ \"\" ],\r\n  \"contract.renterId\" : [ \"\" ],\r\n  \"contract.acceptTime\" : [ \"\" ],\r\n  \"contract.acceptStatus\" : [ \"\" ],\r\n  \"contract.acceptType\" : [ \"\" ],\r\n  \"contract.payed\" : [ \"\" ],\r\n  \"contract.contractId\" : [ \"\" ],\r\n  \"contract.contractStatus\" : [ \"\" ],\r\n  \"contract.rentStartTime\" : [ \"\" ],\r\n  \"contract.rentEndTime\" : [ \"\" ],\r\n  \"contract.signedTime\" : [ \"\" ],\r\n  \"contract.continuationTime\" : [ \"\" ],\r\n  \"contract.continuationPeriod\" : [ \"\" ],\r\n  \"contract.monthlyRent\" : [ \"\" ],\r\n  \"contract.pledgeMonth\" : [ \"\" ],\r\n  \"contract.heatingPerSquare\" : [ \"\" ],\r\n  \"contract.managementPerSquare\" : [ \"\" ],\r\n  \"contract.area\" : [ \"\" ],\r\n  \"contract.waterWatch\" : [ \"\" ],\r\n  \"contract.electricWatch\" : [ \"\" ],\r\n  \"contract.gasWatch\" : [ \"\" ],\r\n  \"contract.debt\" : [ \"\" ],\r\n  \"contract.rentTotal\" : [ \"\" ],\r\n  \"contract.payPeriod\" : [ \"\" ],\r\n  \"contract.payType\" : [ \"\" ],\r\n  \"contract.invitationCode\" : [ \"\" ],\r\n  \"contract.coupon\" : [ \"\" ],\r\n  \"contract.couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-04 17:35:10');
INSERT INTO `sys_oper_log` VALUES (191, '订单', 1, 'com.zhongz.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"contract.houseId\" : [ \"\" ],\r\n  \"contract.tenantId\" : [ \"\" ],\r\n  \"contract.entrustedAgentId\" : [ \"\" ],\r\n  \"contract.renterId\" : [ \"\" ],\r\n  \"contract.acceptTime\" : [ \"\" ],\r\n  \"contract.acceptStatus\" : [ \"\" ],\r\n  \"contract.acceptType\" : [ \"\" ],\r\n  \"contract.payed\" : [ \"\" ],\r\n  \"contract.contractId\" : [ \"e2w\" ],\r\n  \"contract.contractStatus\" : [ \"\" ],\r\n  \"contract.rentStartTime\" : [ \"\" ],\r\n  \"contract.rentEndTime\" : [ \"\" ],\r\n  \"contract.signedTime\" : [ \"\" ],\r\n  \"contract.continuationTime\" : [ \"\" ],\r\n  \"contract.continuationPeriod\" : [ \"\" ],\r\n  \"contract.monthlyRent\" : [ \"\" ],\r\n  \"contract.pledgeMonth\" : [ \"\" ],\r\n  \"contract.heatingPerSquare\" : [ \"\" ],\r\n  \"contract.managementPerSquare\" : [ \"\" ],\r\n  \"contract.area\" : [ \"\" ],\r\n  \"contract.waterWatch\" : [ \"\" ],\r\n  \"contract.electricWatch\" : [ \"\" ],\r\n  \"contract.gasWatch\" : [ \"\" ],\r\n  \"contract.debt\" : [ \"\" ],\r\n  \"contract.rentTotal\" : [ \"\" ],\r\n  \"contract.payPeriod\" : [ \"\" ],\r\n  \"contract.payType\" : [ \"\" ],\r\n  \"contract.invitationCode\" : [ \"\" ],\r\n  \"contract.coupon\" : [ \"\" ],\r\n  \"contract.couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-08 14:47:50');
INSERT INTO `sys_oper_log` VALUES (192, '订单', 3, 'com.zhongz.web.controller.ZhongzOrderController.remove()', 1, 'admin', '研发部门', '/system/zhongzOrder/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1c31bf7e08724ea39a0867fd8012a1dd,5116a03ad0c6402da17d675ee3427f96\" ]\r\n}', 0, NULL, '2019-04-08 14:48:15');
INSERT INTO `sys_oper_log` VALUES (193, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"zhongz_user,zhongz_favourite\" ]\r\n}', 0, NULL, '2019-04-08 14:49:47');
INSERT INTO `sys_oper_log` VALUES (194, '订单', 1, 'com.zhongz.rental.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"contract.houseId\" : [ \"\" ],\r\n  \"contract.tenantId\" : [ \"\" ],\r\n  \"contract.entrustedAgentId\" : [ \"\" ],\r\n  \"contract.renterId\" : [ \"\" ],\r\n  \"contract.acceptTime\" : [ \"\" ],\r\n  \"contract.acceptStatus\" : [ \"\" ],\r\n  \"contract.acceptType\" : [ \"\" ],\r\n  \"contract.payed\" : [ \"\" ],\r\n  \"contract.contractId\" : [ \"66\" ],\r\n  \"contract.contractStatus\" : [ \"\" ],\r\n  \"contract.rentStartTime\" : [ \"\" ],\r\n  \"contract.rentEndTime\" : [ \"\" ],\r\n  \"contract.signedTime\" : [ \"\" ],\r\n  \"contract.continuationTime\" : [ \"\" ],\r\n  \"contract.continuationPeriod\" : [ \"\" ],\r\n  \"contract.monthlyRent\" : [ \"\" ],\r\n  \"contract.pledgeMonth\" : [ \"\" ],\r\n  \"contract.heatingPerSquare\" : [ \"\" ],\r\n  \"contract.managementPerSquare\" : [ \"\" ],\r\n  \"contract.area\" : [ \"\" ],\r\n  \"contract.waterWatch\" : [ \"\" ],\r\n  \"contract.electricWatch\" : [ \"\" ],\r\n  \"contract.gasWatch\" : [ \"\" ],\r\n  \"contract.debt\" : [ \"\" ],\r\n  \"contract.rentTotal\" : [ \"\" ],\r\n  \"contract.payPeriod\" : [ \"\" ],\r\n  \"contract.payType\" : [ \"\" ],\r\n  \"contract.invitationCode\" : [ \"\" ],\r\n  \"contract.coupon\" : [ \"\" ],\r\n  \"contract.couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-08 16:45:00');
INSERT INTO `sys_oper_log` VALUES (195, '订单', 1, 'com.zhongz.rental.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"contract.houseId\" : [ \"\" ],\r\n  \"contract.tenantId\" : [ \"\" ],\r\n  \"contract.entrustedAgentId\" : [ \"\" ],\r\n  \"contract.renterId\" : [ \"\" ],\r\n  \"contract.acceptTime\" : [ \"\" ],\r\n  \"contract.acceptStatus\" : [ \"\" ],\r\n  \"contract.acceptType\" : [ \"\" ],\r\n  \"contract.payed\" : [ \"\" ],\r\n  \"contract.contractId\" : [ \"的总分多少\" ],\r\n  \"contract.contractStatus\" : [ \"\" ],\r\n  \"contract.rentStartTime\" : [ \"\" ],\r\n  \"contract.rentEndTime\" : [ \"\" ],\r\n  \"contract.signedTime\" : [ \"\" ],\r\n  \"contract.continuationTime\" : [ \"\" ],\r\n  \"contract.continuationPeriod\" : [ \"\" ],\r\n  \"contract.monthlyRent\" : [ \"\" ],\r\n  \"contract.pledgeMonth\" : [ \"\" ],\r\n  \"contract.heatingPerSquare\" : [ \"\" ],\r\n  \"contract.managementPerSquare\" : [ \"\" ],\r\n  \"contract.area\" : [ \"\" ],\r\n  \"contract.waterWatch\" : [ \"\" ],\r\n  \"contract.electricWatch\" : [ \"\" ],\r\n  \"contract.gasWatch\" : [ \"\" ],\r\n  \"contract.debt\" : [ \"\" ],\r\n  \"contract.rentTotal\" : [ \"\" ],\r\n  \"contract.payPeriod\" : [ \"\" ],\r\n  \"contract.payType\" : [ \"\" ],\r\n  \"contract.invitationCode\" : [ \"\" ],\r\n  \"contract.coupon\" : [ \"\" ],\r\n  \"contract.couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-08 16:51:19');
INSERT INTO `sys_oper_log` VALUES (196, '订单', 3, 'com.zhongz.rental.web.controller.ZhongzOrderController.remove()', 1, 'admin', '研发部门', '/system/zhongzOrder/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"850e31f226ff460da477390762734443,95684e77b7084cafb213a7bdf6b9629a\" ]\r\n}', 0, NULL, '2019-04-08 16:51:29');
INSERT INTO `sys_oper_log` VALUES (197, '订单', 1, 'com.zhongz.rental.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"contract.houseId\" : [ \"\" ],\r\n  \"contract.tenantId\" : [ \"\" ],\r\n  \"contract.entrustedAgentId\" : [ \"\" ],\r\n  \"contract.renterId\" : [ \"\" ],\r\n  \"contract.acceptTime\" : [ \"\" ],\r\n  \"contract.acceptStatus\" : [ \"\" ],\r\n  \"contract.acceptType\" : [ \"\" ],\r\n  \"contract.payed\" : [ \"\" ],\r\n  \"contract.contractId\" : [ \"zzzzzz\" ],\r\n  \"contract.contractStatus\" : [ \"\" ],\r\n  \"contract.rentStartTime\" : [ \"\" ],\r\n  \"contract.rentEndTime\" : [ \"\" ],\r\n  \"contract.signedTime\" : [ \"\" ],\r\n  \"contract.continuationTime\" : [ \"\" ],\r\n  \"contract.continuationPeriod\" : [ \"\" ],\r\n  \"contract.monthlyRent\" : [ \"\" ],\r\n  \"contract.pledgeMonth\" : [ \"\" ],\r\n  \"contract.heatingPerSquare\" : [ \"\" ],\r\n  \"contract.managementPerSquare\" : [ \"\" ],\r\n  \"contract.area\" : [ \"\" ],\r\n  \"contract.waterWatch\" : [ \"\" ],\r\n  \"contract.electricWatch\" : [ \"\" ],\r\n  \"contract.gasWatch\" : [ \"\" ],\r\n  \"contract.debt\" : [ \"\" ],\r\n  \"contract.rentTotal\" : [ \"\" ],\r\n  \"contract.payPeriod\" : [ \"\" ],\r\n  \"contract.payType\" : [ \"\" ],\r\n  \"contract.invitationCode\" : [ \"\" ],\r\n  \"contract.coupon\" : [ \"\" ],\r\n  \"contract.couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-08 19:41:36');
INSERT INTO `sys_oper_log` VALUES (198, '订单', 1, 'com.zhongz.rental.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"contract.houseId\" : [ \"\" ],\r\n  \"contract.tenantId\" : [ \"\" ],\r\n  \"contract.entrustedAgentId\" : [ \"\" ],\r\n  \"contract.renterId\" : [ \"\" ],\r\n  \"contract.acceptTime\" : [ \"\" ],\r\n  \"contract.acceptStatus\" : [ \"\" ],\r\n  \"contract.acceptType\" : [ \"\" ],\r\n  \"contract.payed\" : [ \"\" ],\r\n  \"contract.contractId\" : [ \"aaaaaa\" ],\r\n  \"contract.contractStatus\" : [ \"\" ],\r\n  \"contract.rentStartTime\" : [ \"\" ],\r\n  \"contract.rentEndTime\" : [ \"\" ],\r\n  \"contract.signedTime\" : [ \"\" ],\r\n  \"contract.continuationTime\" : [ \"\" ],\r\n  \"contract.continuationPeriod\" : [ \"\" ],\r\n  \"contract.monthlyRent\" : [ \"\" ],\r\n  \"contract.pledgeMonth\" : [ \"\" ],\r\n  \"contract.heatingPerSquare\" : [ \"\" ],\r\n  \"contract.managementPerSquare\" : [ \"\" ],\r\n  \"contract.area\" : [ \"\" ],\r\n  \"contract.waterWatch\" : [ \"\" ],\r\n  \"contract.electricWatch\" : [ \"\" ],\r\n  \"contract.gasWatch\" : [ \"\" ],\r\n  \"contract.debt\" : [ \"\" ],\r\n  \"contract.rentTotal\" : [ \"\" ],\r\n  \"contract.payPeriod\" : [ \"\" ],\r\n  \"contract.payType\" : [ \"\" ],\r\n  \"contract.invitationCode\" : [ \"\" ],\r\n  \"contract.coupon\" : [ \"\" ],\r\n  \"contract.couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-08 19:52:54');
INSERT INTO `sys_oper_log` VALUES (199, '订单', 3, 'com.zhongz.rental.web.controller.ZhongzOrderController.remove()', 1, 'admin', '研发部门', '/system/zhongzOrder/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"c2fa736309544f5faa544c7c81527108,e9095ae75605417da0b39ccf41da8f22\" ]\r\n}', 0, NULL, '2019-04-08 19:53:03');
INSERT INTO `sys_oper_log` VALUES (200, '订单', 1, 'com.zhongz.rental.web.controller.ZhongzOrderController.addSave()', 1, 'admin', '研发部门', '/system/zhongzOrder/add', '127.0.0.1', '内网IP', '{\r\n  \"orderType\" : [ \"\" ],\r\n  \"orderId\" : [ \"\" ],\r\n  \"orderStatus\" : [ \"\" ],\r\n  \"orderTime\" : [ \"\" ],\r\n  \"contract.houseId\" : [ \"\" ],\r\n  \"contract.tenantId\" : [ \"\" ],\r\n  \"contract.entrustedAgentId\" : [ \"\" ],\r\n  \"contract.renterId\" : [ \"\" ],\r\n  \"contract.acceptTime\" : [ \"\" ],\r\n  \"contract.acceptStatus\" : [ \"\" ],\r\n  \"contract.acceptType\" : [ \"\" ],\r\n  \"contract.payed\" : [ \"\" ],\r\n  \"contract.contractId\" : [ \"ssssss\" ],\r\n  \"contract.contractStatus\" : [ \"\" ],\r\n  \"contract.rentStartTime\" : [ \"\" ],\r\n  \"contract.rentEndTime\" : [ \"\" ],\r\n  \"contract.signedTime\" : [ \"\" ],\r\n  \"contract.continuationTime\" : [ \"\" ],\r\n  \"contract.continuationPeriod\" : [ \"\" ],\r\n  \"contract.monthlyRent\" : [ \"\" ],\r\n  \"contract.pledgeMonth\" : [ \"\" ],\r\n  \"contract.heatingPerSquare\" : [ \"\" ],\r\n  \"contract.managementPerSquare\" : [ \"\" ],\r\n  \"contract.area\" : [ \"\" ],\r\n  \"contract.waterWatch\" : [ \"\" ],\r\n  \"contract.electricWatch\" : [ \"\" ],\r\n  \"contract.gasWatch\" : [ \"\" ],\r\n  \"contract.debt\" : [ \"\" ],\r\n  \"contract.rentTotal\" : [ \"\" ],\r\n  \"contract.payPeriod\" : [ \"\" ],\r\n  \"contract.payType\" : [ \"\" ],\r\n  \"contract.invitationCode\" : [ \"\" ],\r\n  \"contract.coupon\" : [ \"\" ],\r\n  \"contract.couponComment\" : [ \"\" ]\r\n}', 0, NULL, '2019-04-08 20:10:54');
INSERT INTO `sys_oper_log` VALUES (201, '订单', 3, 'com.zhongz.rental.web.controller.ZhongzOrderController.remove()', 1, 'admin', '研发部门', '/system/zhongzOrder/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"e2be555fa06b46789347a8533b0853bc\" ]\r\n}', 0, NULL, '2019-04-08 20:11:04');
INSERT INTO `sys_oper_log` VALUES (202, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"zhongz_validate_code,zhongz_user_type,zhongz_suggestion,zhongz_structure_type,zhongz_soft_config,zhongz_service_type,zhongz_service_order,zhongz_direction_type,zhongz_search_history,zhongz_room,zhongz_restaurant,zhongz_residence,zhongz_request_service_type,zhongz_rent_type,zhongz_rent_price,zhongz_payed_type,zhongz_pay_type,zhongz_pay_period_type,zhongz_order_type,zhongz_order_status,zhongz_order_record,zhongz_order,zhongz_nation,zhongz_media_file,zhongz_manager,zhongz_house_tag,zhongz_house_rent_type,zhongz_house_event,zhongz_accept_status,zhongz_accept_type,zhongz_age,zhongz_buiding_type,zhongz_card_type,zhongz_comment,zhongz_contract,zhongz_contract_status,zhongz_electric_config,zhongz_entrust,zhongz_favourite,zhongz_hot_tag,zhongz_house,zhongz_house_visit,zhongz_coupon,zhongz_user,zhongz_coupon_policy,zhongz_event,zhongz_estate\" ]\r\n}', 0, NULL, '2019-04-11 17:46:12');
INSERT INTO `sys_oper_log` VALUES (203, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"zhongz_house,zhongz_structure_type,zhongz_direction_type,zhongz_validate_code,zhongz_user_type,zhongz_suggestion,zhongz_soft_config,zhongz_service_type,zhongz_service_order,zhongz_search_history,zhongz_room,zhongz_restaurant,zhongz_residence,zhongz_request_service_type,zhongz_rent_type,zhongz_rent_price,zhongz_payed_type,zhongz_pay_type,zhongz_pay_period_type,zhongz_order_type,zhongz_order_status,zhongz_order_record,zhongz_order,zhongz_nation,zhongz_media_file,zhongz_manager,zhongz_house_tag,zhongz_house_rent_type,zhongz_house_event,zhongz_accept_status,zhongz_accept_type,zhongz_age,zhongz_buiding_type,zhongz_card_type,zhongz_comment,zhongz_contract,zhongz_contract_status,zhongz_electric_config,zhongz_entrust,zhongz_favourite,zhongz_hot_tag,zhongz_house_visit,zhongz_coupon,zhongz_user,zhongz_coupon_policy,zhongz_event,zhongz_estate\" ]\r\n}', 0, NULL, '2019-04-12 15:02:07');
INSERT INTO `sys_oper_log` VALUES (204, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/zhongz_user', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-04-15 10:18:59');
INSERT INTO `sys_oper_log` VALUES (205, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"zhongz_media_file\" ]\r\n}', 0, NULL, '2019-04-16 09:04:32');
INSERT INTO `sys_oper_log` VALUES (206, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"zhongz_event\" ]\r\n}', 0, NULL, '2019-04-16 16:04:59');
INSERT INTO `sys_oper_log` VALUES (207, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"zhongz_rent_type,zhongz_order,zhongz_direction_type,zhongz_contract\" ]\r\n}', 0, NULL, '2019-04-17 09:45:32');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `dept_id` int(11) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2019-04-18 18:06:53', 'admin', '2018-03-16 11:33:00', 'ry', '2019-04-18 18:06:45', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员');
INSERT INTO `sys_user` VALUES (100, 105, 'yy', 'yy', '00', 'fd@123', '13234342343', '0', '', 'e9c27e171e1759f1fd63a254736b825f', '06044c', '0', '0', '', NULL, 'admin', '2019-03-29 19:02:16', '', '2019-03-29 19:02:28', '');
INSERT INTO `sys_user` VALUES (101, 105, 'uu', 'uu', '00', 'dd@uu', '15566666666', '0', '', '07b837f8949e56cc1bd0fdda4848ee4c', '2d58ce', '0', '2', '', NULL, 'admin', '2019-04-01 11:17:13', 'admin', '2019-04-01 11:17:43', '111');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('39c2af04-5593-4ee0-9553-2f8c83f80845', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', 'on_line', '2019-04-18 18:06:40', '2019-04-18 18:06:53', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `post_id` int(11) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (100, 2);
INSERT INTO `sys_user_post` VALUES (101, 3);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 1);
INSERT INTO `sys_user_role` VALUES (101, 1);

-- ----------------------------
-- Table structure for zhongz_accept_status
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_accept_status`;
CREATE TABLE `zhongz_accept_status`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '受理状态表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_accept_type
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_accept_type`;
CREATE TABLE `zhongz_accept_type`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '受理性质表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_age
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_age`;
CREATE TABLE `zhongz_age`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '建筑年代表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_buiding_type
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_buiding_type`;
CREATE TABLE `zhongz_buiding_type`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '建筑类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_card_type
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_card_type`;
CREATE TABLE `zhongz_card_type`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '证件类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_comment
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_comment`;
CREATE TABLE `zhongz_comment`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '留言者id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '留言内容',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `zhongz_comment_idx1`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管家留言表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_comment
-- ----------------------------
INSERT INTO `zhongz_comment` VALUES ('32ae541c89464c029b3c8279393a0f62', 'c28cfa138c1a48ebaad68afb467527ab', '11', NULL, '33', '', '2019-05-01 08:11:58', '', '2019-05-01 08:11:58', '', '0');
INSERT INTO `zhongz_comment` VALUES ('3f85e914dd5e4fabb7e1e4c47914c213', NULL, 'Bruce Lee', '18888888888', '我是李小龙你知道吗', '', '2019-04-29 19:20:36', '', '2019-04-29 19:20:36', '', '0');
INSERT INTO `zhongz_comment` VALUES ('67212996b91c4048b20f9360c47dd261', NULL, '巴拉拉小魔仙', '17898978909', '我来出演《流浪地球》', '', '2019-04-29 21:29:02', '', '2019-04-29 21:29:02', '', '0');
INSERT INTO `zhongz_comment` VALUES ('6a0df1c0ce4e45949928e7aafc159b6e', 'c28cfa138c1a48ebaad68afb467527ab', '111', '13130274421', '流量卡', '', '2019-05-07 06:49:19', '', '2019-05-07 06:49:19', '', '0');
INSERT INTO `zhongz_comment` VALUES ('c420e4a303ce4431a87c5dbdb40f359a', 'c28cfa138c1a48ebaad68afb467527ab', '4644', NULL, '你明明', '', '2019-05-05 08:20:12', '', '2019-05-05 08:20:12', '', '0');
INSERT INTO `zhongz_comment` VALUES ('fc7885b3a3274d9aa58e9cc1b69e4722', 'c28cfa138c1a48ebaad68afb467527ab', '33', NULL, '55', '', '2019-05-01 08:13:55', '', '2019-05-01 08:13:55', '', '0');

-- ----------------------------
-- Table structure for zhongz_contract
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_contract`;
CREATE TABLE `zhongz_contract`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `category` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同类别',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同类型',
  `rent_type` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '租住方式（整租、合租）',
  `house_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租住房屋id',
  `room_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租住房间id',
  `room_direction` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '租住房间朝向',
  `tenant_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '承租人id',
  `entrusted_agent` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '委托代理人',
  `renter_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '受理人id',
  `accept_time` datetime(0) NULL DEFAULT NULL COMMENT '受理时间',
  `accept_status` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '受理状态',
  `accept_type` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '受理性质',
  `payed` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '缴费状态',
  `contract_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同编号',
  `contract_status` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '合同状态',
  `rent_start_time` datetime(0) NULL DEFAULT NULL COMMENT '起租日期',
  `rent_end_time` datetime(0) NULL DEFAULT NULL COMMENT '止租日期',
  `signed_time` datetime(0) NULL DEFAULT NULL COMMENT '签约日期',
  `continuation_time` datetime(0) NULL DEFAULT NULL COMMENT '续费日期',
  `continuation_period` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '续费周期',
  `monthly_rent` double(10, 0) NULL DEFAULT 0 COMMENT '月租金',
  `pledge_month` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '押金标准',
  `heating_per_square` double(10, 0) NULL DEFAULT 0 COMMENT '每平米供暖费',
  `management_per_square` double(10, 0) NULL DEFAULT 0 COMMENT '每平米物业费',
  `area` double(10, 0) NULL DEFAULT 0 COMMENT '计费面积',
  `water_watch` double(10, 0) NULL DEFAULT 0 COMMENT '水表值',
  `electric_watch` double(10, 0) NULL DEFAULT 0 COMMENT '电表值',
  `gas_watch` double(10, 0) NULL DEFAULT 0 COMMENT '燃气表值',
  `debt` double(10, 0) NULL DEFAULT 0 COMMENT '欠款',
  `rent_total` double(10, 0) NULL DEFAULT 0 COMMENT '租金总计',
  `pay_period` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '支付方式',
  `pay_type` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '付款方式',
  `pay_type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款方式名称',
  `invitation_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `coupon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠券',
  `coupon_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠说明',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `identity_card_type` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '证件类型',
  `identity_card_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件类型名称',
  `identity_card_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `mobile` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `nation_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国籍id',
  `registered_residence_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '户口所在地id',
  `gender` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '性别',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '出生日期',
  `emergency_contact` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '紧急联系人',
  `emergency_mobile` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `zhongz_contract_idx1`(`contract_id`) USING BTREE,
  INDEX `zhongz_contract_idx2`(`house_id`) USING BTREE,
  INDEX `zhongz_contract_idx3`(`tenant_id`) USING BTREE,
  INDEX `zhongz_contract_idx4`(`renter_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '合同表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_contract
-- ----------------------------
INSERT INTO `zhongz_contract` VALUES ('0413a27f8bc1409aba5d4e23932f80c1', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '111', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-04-04 17:27:37', '', '2019-04-04 17:27:37', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('08f5e1ef454241cba176e255763ca2ca', NULL, NULL, 1, 'ewq', NULL, 0, 'c28cfa138c1a48ebaad68afb467527ab', NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-05-06 22:10:47', '', '2019-05-06 22:10:47', '', '0', NULL, 0, NULL, NULL, '13130274421', NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('126736fd7eb5478aa68172418c979c48', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 'e2w', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-04-08 14:47:54', '', '2019-04-08 14:47:54', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('2b96af2c54fa41bb9720306fb47d4172', NULL, NULL, 1, 'ewq', NULL, 0, '2a32a65277e04290a5f0e7a2a589230e', NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-04-29 19:43:00', '', '2019-04-29 19:43:00', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('3a0cd74933a245728d72b0986a573ec2', NULL, NULL, 2, 'ewq2', NULL, 0, 'c28cfa138c1a48ebaad68afb467527ab', NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-05-14 11:09:30', '', '2019-05-14 11:09:30', '', '0', NULL, 0, NULL, NULL, '13130274421', NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('3fead28fa82c4f7c934b4d4cc6b88cfc', NULL, NULL, 1, 'ewq', NULL, 0, '2a32a65277e04290a5f0e7a2a589230e', NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-04-29 19:44:35', '', '2019-04-29 19:44:35', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('522514c5a233439495d1cabc87525894', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 'zzzzzz', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-04-08 19:41:40', '', '2019-04-08 19:41:40', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('60b46753ee2643c49a1143b5757a00d5', NULL, NULL, 2, 'ewq2', NULL, 0, 'c28cfa138c1a48ebaad68afb467527ab', NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-05-09 06:10:02', '', '2019-05-09 06:10:02', '', '0', NULL, 0, NULL, NULL, '13130274421', NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('7b661cab4d5046c3af3854c959e00e37', NULL, NULL, 0, 'ewq1', NULL, 0, '1', NULL, NULL, NULL, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'DFO4E9RO', NULL, NULL, '', '2019-04-17 05:25:27', '', '2019-04-17 05:25:27', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('91ea65676d55434rf6ec503a907a3', NULL, NULL, 1, 'ewq', NULL, 0, '2a32a65277e04290a5f0e7a2a589230e', NULL, NULL, NULL, 0, 0, 0, NULL, 1, '2018-04-19 15:34:55', '2019-04-19 15:34:58', '2018-04-19 15:34:43', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-04-17 06:18:33', '', '2019-04-17 06:18:33', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('91ea65676d5543ge2ec503a907a3', NULL, NULL, 1, 'ewq', NULL, 0, '94380d3672094d3c855142c7f16659fe', NULL, NULL, NULL, 0, 0, 0, NULL, 1, '2018-04-19 15:34:55', '2019-04-19 15:34:58', '2018-04-19 15:34:43', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-04-17 06:18:33', '', '2019-04-17 06:18:33', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('91ea65676d554d54wyye8b6ec503a907a3', NULL, NULL, 2, 'ewq2', NULL, 0, 'c28cfa138c1a48ebaad68afb467527ab', NULL, NULL, NULL, 0, 0, 0, NULL, 1, '2019-04-19 15:34:55', '2020-04-19 15:34:58', '2019-04-19 15:34:43', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-04-17 06:18:33', '', '2019-04-17 06:18:33', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('91ea65676d554d55858b6ec503a907a3', NULL, NULL, 2, 'ewq2', NULL, 0, '2a32a65277e04290a5f0e7a2a589230e', NULL, NULL, NULL, 0, 0, 0, NULL, 1, '2019-04-19 15:34:55', '2020-04-19 15:34:58', '2019-04-19 15:34:43', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-04-17 06:18:33', '', '2019-04-17 06:18:33', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('91ea65676d554ddsewre8b6ec503a907a3', NULL, NULL, 2, 'ewq2', NULL, 0, '94380d3672094d3c855142c7f16659fe', NULL, NULL, NULL, 0, 0, 0, NULL, 1, '2019-04-19 15:34:55', '2020-04-19 15:34:58', '2019-04-19 15:34:43', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-04-17 06:18:33', '', '2019-04-17 06:18:33', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('91ea65676dfetege2ec503a907a3', NULL, NULL, 1, 'ewq', NULL, 0, 'c28cfa138c1a48ebaad68afb467527ab', NULL, NULL, NULL, 0, 0, 0, NULL, 1, '2018-04-19 15:34:55', '2019-04-19 15:34:58', '2018-04-19 15:34:43', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-04-17 06:18:33', '', '2019-04-17 06:18:33', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('a1221543e2334afca5c98468aa6af5b9', NULL, NULL, 0, 'ewq', NULL, 0, '1', NULL, NULL, NULL, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'DFO4E9RO', NULL, NULL, '', '2019-04-17 04:39:16', '', '2019-04-17 04:39:16', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('a4164a4ffc3549ddb2987e946de14567', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 'aaaaaa', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-04-08 19:52:58', '', '2019-04-08 19:52:58', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('bafa15c86f004923ad593dba05ba8b37', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '的总分多少', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-04-08 16:51:23', '', '2019-04-08 16:51:23', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('bea96ca144c84fe08e25baafb5002ed8', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-04-04 17:35:15', '', '2019-04-04 17:35:15', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('c47f2f58c32c4809b7f2bad984afa994', NULL, NULL, 0, NULL, NULL, 0, '1111111111111111', NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-04-04 16:16:04', '', '2019-04-04 16:16:04', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('d596b4c4a65144fabafc06c89b5a9ed0', NULL, NULL, 0, 'ewq2', NULL, 0, '1', NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-04-17 06:14:03', '', '2019-04-17 06:14:03', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('e2e420f7fb17444ab59841a5619660bd', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 'ssssss', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-04-08 20:10:58', '', '2019-04-08 20:10:58', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('e77c52db5eb549d0a6b82a5356eb2409', NULL, NULL, 2, 'ewq2', NULL, 0, '2a32a65277e04290a5f0e7a2a589230e', NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-04-19 02:24:12', '', '2019-04-19 02:24:12', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('f4d8bf7a577c4473b90749f8e0377f53', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '66', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-04-08 16:45:04', '', '2019-04-08 16:45:04', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `zhongz_contract` VALUES ('fd915af617364f62a36668f05db54a3e', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '', '2019-04-04 17:01:55', '', '2019-04-04 17:01:55', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for zhongz_contract_status
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_contract_status`;
CREATE TABLE `zhongz_contract_status`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '合同状态表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_coupon
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_coupon`;
CREATE TABLE `zhongz_coupon`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '优惠券编码',
  `policy_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '优惠券类型',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '归属用户',
  `status` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '优惠券状态',
  `achieve_time` datetime(0) NULL DEFAULT NULL COMMENT '获取时间',
  `use_time` datetime(0) NULL DEFAULT NULL COMMENT '使用时间',
  `house_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用去向',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `titile` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '优惠标题',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '优惠信息',
  `preference` double(10, 0) NULL DEFAULT 0 COMMENT '优惠力度',
  `rules` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用规则',
  `expire` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '有效期限',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `zhongz_coupon_idx1`(`code`) USING BTREE,
  INDEX `zhongz_coupon_idx2`(`user_id`) USING BTREE,
  INDEX `zhongz_coupon_idx3`(`house_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '优惠券表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_coupon
-- ----------------------------
INSERT INTO `zhongz_coupon` VALUES ('11', 'sdfsfs3', '1', '1', 1, '2019-04-22 16:54:47', NULL, NULL, '', '2019-04-22 16:54:52', '', '2019-04-22 16:54:54', '', '0', '', '', 0, NULL, 60);
INSERT INTO `zhongz_coupon` VALUES ('1113dws3efws134', 'sdfhg34ssfs31125', '1', '94380d3672094d3c855142c7f16659fe', 0, '2019-04-28 16:54:47', NULL, 'ewq2', '', '2019-04-22 16:54:52', '', '2019-04-22 16:54:54', '', '0', '', '', 0, NULL, 60);
INSERT INTO `zhongz_coupon` VALUES ('112', 'sdfsfs31', '1', '2a32a65277e04290a5f0e7a2a589230e', 1, '2019-04-22 16:54:47', NULL, 'ewq2', '', '2019-04-22 16:54:52', '', '2019-04-22 16:54:54', '', '0', '', '', 0, NULL, 60);
INSERT INTO `zhongz_coupon` VALUES ('112dfw', 'sdfsfs3143f', '1', 'c28cfa138c1a48ebaad68afb467527ab', 1, '2019-04-22 16:54:47', NULL, 'ewq2', '', '2019-04-22 16:54:52', '', '2019-04-22 16:54:54', '', '0', '', '', 0, NULL, 60);
INSERT INTO `zhongz_coupon` VALUES ('112dfw18rfw', 'sdfsfs3143f367d8', '1', '94380d3672094d3c855142c7f16659fe', 1, '2019-04-22 16:54:47', NULL, 'ewq2', '', '2019-04-22 16:54:52', '', '2019-04-22 16:54:54', '', '0', '', '', 0, NULL, 60);
INSERT INTO `zhongz_coupon` VALUES ('113', 'sdfsfs3112', '1', '2a32a65277e04290a5f0e7a2a589230e', 0, '2019-02-20 16:54:47', NULL, 'ewq2', '', '2019-04-22 16:54:52', '', '2019-04-22 16:54:54', '', '0', '', '', 0, NULL, 60);
INSERT INTO `zhongz_coupon` VALUES ('1132sw32ref', 'sd32dsf2353sfs3112', '1', '94380d3672094d3c855142c7f16659fe', 0, '2019-02-20 16:54:47', NULL, 'ewq2', '', '2019-04-22 16:54:52', '', '2019-04-22 16:54:54', '', '0', '', '', 0, NULL, 60);
INSERT INTO `zhongz_coupon` VALUES ('11332ref', 'sd32dsfsfs3112', '1', 'c28cfa138c1a48ebaad68afb467527ab', 0, '2019-02-20 16:54:47', NULL, 'ewq2', '', '2019-04-22 16:54:52', '', '2019-04-22 16:54:54', '', '0', '', '', 0, NULL, 60);
INSERT INTO `zhongz_coupon` VALUES ('1134', 'sdfsfs31125', '1', '2a32a65277e04290a5f0e7a2a589230e', 0, '2019-04-28 16:54:47', NULL, 'ewq2', '', '2019-04-22 16:54:52', '', '2019-04-22 16:54:54', '', '0', '', '', 0, NULL, 60);
INSERT INTO `zhongz_coupon` VALUES ('113efws134', 'sdfhg3w5dsfs31125', '1', 'c28cfa138c1a48ebaad68afb467527ab', 0, '2019-04-28 16:54:47', NULL, 'ewq2', '', '2019-04-22 16:54:52', '', '2019-04-22 16:54:54', '', '0', '', '', 0, NULL, 60);
INSERT INTO `zhongz_coupon` VALUES ('a5072df492d24916ab0b8a3401092a28', 'IF7K67DD', '1', '5bbfac87d09d4aa7b205f4bbd3a6a3b9', 0, '2019-05-08 21:06:17', NULL, NULL, '', '2019-05-08 21:06:17', '', '2019-05-08 21:06:17', '', '0', '新用户欢迎礼', '租金立减', 1500, '首签', 60);

-- ----------------------------
-- Table structure for zhongz_coupon_policy
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_coupon_policy`;
CREATE TABLE `zhongz_coupon_policy`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `titile` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '优惠标题',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '优惠信息',
  `preference` double(10, 0) NULL DEFAULT 0 COMMENT '优惠力度',
  `rules` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用规则',
  `expire` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '有效期限',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '优惠券策略表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_coupon_policy
-- ----------------------------
INSERT INTO `zhongz_coupon_policy` VALUES ('1', '新用户欢迎礼', '租金立减', 1500, '首签', 60, '', '2019-04-26 18:19:34', '', '2019-04-26 18:19:38', '', '0');
INSERT INTO `zhongz_coupon_policy` VALUES ('2', '老带新优惠', '租金优惠', 1500, '老带新', 60, '', '2019-04-26 18:19:34', '', '2019-04-26 18:19:38', '', '0');
INSERT INTO `zhongz_coupon_policy` VALUES ('3', '老客户续租优惠', '最高直减', 2000, '续租优惠', 60, '', '2019-04-26 18:19:34', '', '2019-04-26 18:19:38', '', '0');

-- ----------------------------
-- Table structure for zhongz_direction_type
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_direction_type`;
CREATE TABLE `zhongz_direction_type`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '朝向类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_direction_type
-- ----------------------------
INSERT INTO `zhongz_direction_type` VALUES ('1', 1, '南向', '', '2019-04-24 09:55:14', '', '2019-04-24 09:55:17', '', '0');
INSERT INTO `zhongz_direction_type` VALUES ('2', 2, '南向左', NULL, '2019-04-24 09:55:14', NULL, '2019-04-24 09:55:17', NULL, '0');
INSERT INTO `zhongz_direction_type` VALUES ('3', 3, '南向右', NULL, '2019-04-24 09:55:14', NULL, '2019-04-24 09:55:17', NULL, '0');

-- ----------------------------
-- Table structure for zhongz_electric_config
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_electric_config`;
CREATE TABLE `zhongz_electric_config`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '房屋电器类别表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_electric_config
-- ----------------------------
INSERT INTO `zhongz_electric_config` VALUES ('1', 1, '冰箱', '', '2019-04-24 09:59:49', '', '2019-04-24 09:59:52', '', '0');
INSERT INTO `zhongz_electric_config` VALUES ('2', 1, '彩电', '', '2019-04-24 09:59:49', '', '2019-04-24 09:59:52', '', '0');
INSERT INTO `zhongz_electric_config` VALUES ('3', 1, '洗衣机', '', '2019-04-24 09:59:49', '', '2019-04-24 09:59:52', '', '0');
INSERT INTO `zhongz_electric_config` VALUES ('4', 1, '浴霸', '', '2019-04-24 09:59:49', '', '2019-04-24 09:59:52', '', '0');

-- ----------------------------
-- Table structure for zhongz_entrust
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_entrust`;
CREATE TABLE `zhongz_entrust`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '委托人id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `entrust_time` datetime(0) NULL DEFAULT NULL COMMENT '委托时间',
  `estate` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '委托小区',
  `accept_status` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '受理状态（0：未受理，1：已受理，2：已取消）',
  `acceptor_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '受理人id',
  `accept_time` datetime(0) NULL DEFAULT NULL COMMENT '受理时间',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '受理描述',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `zhongz_entrust_idx1`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '业主委托表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_estate
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_estate`;
CREATE TABLE `zhongz_estate`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小区名称',
  `short_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小区简称',
  `commerce` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小区商圈',
  `age` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '建筑年代',
  `building_type` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '建筑类型',
  `building_type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '建筑类型名，冗余存储',
  `address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小区位置',
  `longitude` double(10, 0) NULL DEFAULT 0 COMMENT '经度',
  `latitude` double(10, 0) NULL DEFAULT 0 COMMENT '纬度',
  `picture` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小区照片',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '小区简介',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `zhongz_estate_idx1`(`name`) USING BTREE,
  INDEX `zhongz_estate_idx2`(`short_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '小区表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_estate
-- ----------------------------
INSERT INTO `zhongz_estate` VALUES ('1', '北京西局玉园', '西局玉园', '海淀CBD', 2010, 2, '酒店式公寓', '海淀西局', 132, 66, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556083358756&di=bd2ec3797baded9f0402d9f1e618a70a&imgtype=0&src=http%3A%2F%2Fhainansj.com%2FUserFiles%2Fdsjz%2FImages%2F201311220959282255.jpg', '高档豪华酒店式公寓小区', '', '2019-04-19 11:14:38', '', '2019-04-19 11:14:40', '', '0');

-- ----------------------------
-- Table structure for zhongz_event
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_event`;
CREATE TABLE `zhongz_event`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '活动截止时间',
  `frontend` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '前端展示',
  `frontend_order` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '前端展示排序',
  `house_related` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '是否关联房屋',
  `picture` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通栏广告图',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '活动内容',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `zhongz_event_idx1`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '活动表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_event
-- ----------------------------
INSERT INTO `zhongz_event` VALUES ('qq', '新用户注册礼', '2019-05-01 10:36:35', 1, 0, 0, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556083541289&di=74598b0d6a380682ca1cba0ece6335b9&imgtype=0&src=http%3A%2F%2Fimg3.redocn.com%2Ftupian%2F20150413%2Fyouhuicuxiaohaibaosheji_4136490.jpg', NULL, '', '2019-04-19 13:03:15', '', '2019-04-19 13:03:18', '', '0');
INSERT INTO `zhongz_event` VALUES ('qq1', '续约优惠', '2019-06-01 10:36:45', 1, 10, 0, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556083541289&di=3f2a43b6a6819c84f9200e514a5df64c&imgtype=0&src=http%3A%2F%2Fimg.redocn.com%2Fsheji%2F20150313%2Fkaiyeyouhuicuxiaoxuanchuanhaibao_4005448.jpg', '<img src=\"https://f12.baidu.com/it/u=287050614,2284589336&fm=72\"/><img src=\"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=247468628,3793180583&fm=26&gp=0.jpg\"/><p><span>活动详情测试</span></p><img src=\"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=721355480,3354003439&fm=26&gp=0.jpg\"/>', '', '2019-04-19 13:03:15', '', '2019-04-19 13:03:18', '', '0');
INSERT INTO `zhongz_event` VALUES ('qq12', '老带新优惠', '2019-07-01 10:36:50', 1, 2, 0, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556083541289&di=e49872c15e0f9e120fd5ee85bc4c3b59&imgtype=0&src=http%3A%2F%2Fimage.tupian114.com%2F20180328%2F0909183723.jpg', '<h1>我是标题</h1><p>活动详情测试活动详情测试活动详情测试活动详情测试活动详情测试活动详情测试活动详情测试活动详情测试</p><img src=\"https://f12.baidu.com/it/u=287050614,2284589336&fm=72\"/><img src=\"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=247468628,3793180583&fm=26&gp=0.jpg\"/><p><span>活动详情测试</span></p><img src=\"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=721355480,3354003439&fm=26&gp=0.jpg\"/>', '', '2019-04-19 13:03:15', '', '2019-04-19 13:03:18', '', '0');

-- ----------------------------
-- Table structure for zhongz_favourite
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_favourite`;
CREATE TABLE `zhongz_favourite`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '收藏类型',
  `term_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收藏项目id',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收藏者id',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '收藏表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_hot_tag
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_hot_tag`;
CREATE TABLE `zhongz_hot_tag`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `hot_value` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '标签热度值',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '热度标签类别表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_hot_tag
-- ----------------------------
INSERT INTO `zhongz_hot_tag` VALUES ('1', 1, '地铁旁', 20, '', '2019-04-19 10:17:45', '', '2019-04-19 10:17:48', '', '0');
INSERT INTO `zhongz_hot_tag` VALUES ('2', 2, '学区房', 30, '', '2019-04-19 10:17:45', '', '2019-04-19 10:17:48', '', '0');
INSERT INTO `zhongz_hot_tag` VALUES ('3', 3, '热门租住', 30, '', '2019-04-19 10:17:45', '', '2019-04-19 10:17:48', '', '0');
INSERT INTO `zhongz_hot_tag` VALUES ('4', 4, '立刻入住', 10, '', '2019-04-19 10:17:45', '', '2019-04-19 10:17:48', '', '0');

-- ----------------------------
-- Table structure for zhongz_house
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_house`;
CREATE TABLE `zhongz_house`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `rent_status` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '房子租住状态',
  `rent_type` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '租住方式（整租、合租）',
  `address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房屋位置',
  `longitude` double(10, 0) NULL DEFAULT 0 COMMENT '经度',
  `latitude` double(10, 0) NULL DEFAULT 0 COMMENT '纬度',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房屋标题描述',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房屋描述',
  `estate_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小区id',
  `estate_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小区名，冗余存储',
  `region` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域',
  `building` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '幢',
  `unit` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '单元',
  `room_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '室',
  `floor` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '楼层',
  `floors` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '总楼层',
  `structure` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '户型',
  `structure_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '户型名，冗余存储',
  `area` double(10, 0) NULL DEFAULT 0 COMMENT '面积',
  `direction` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '朝向',
  `direction_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '朝向名，冗余存储',
  `monthly_rent` double(10, 0) NULL DEFAULT 0 COMMENT '月租金',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `soft_configs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房屋软装配置',
  `electric_configs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房屋电器配置',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '热度标签',
  `frontend` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '前端展示',
  `tags_value` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '总热度值',
  `first_picture` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第一张图，冗余存储',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '房屋表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_house
-- ----------------------------
INSERT INTO `zhongz_house` VALUES ('ewq', 0, 1, '北京西局玉园320-01', 132, 66, '西局玉园两居', '西局玉园两居', '1', '西局玉园', '海淀区', 11, 1, '2', 22, 32, 2, '两居', 55, 1, '南向', 5000, '', '2019-04-17 17:38:19', '', '2019-04-17 17:38:23', '', '0', '椅子,桌子,茶几,电视柜,床（床垫）,橱柜', '冰箱,电视,洗衣机,热水器,油烟机', '地铁旁,学区房,热门租住,立刻入住', 1, 90, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556080746707&di=ec0ce207d64ad891ef28d4c7ac515195&imgtype=0&src=http%3A%2F%2Fimgs.soufunimg.com%2Fnews%2F2015_10%2F21%2Fzhishi%2F1445410890554_000.jpg');
INSERT INTO `zhongz_house` VALUES ('ewq2', 0, 2, '北京西局玉园320-02', 132, 66, '西局玉园合租三居', '西局玉园合租三居', '1', '西局玉园', '海淀区', 12, 2, '1', 19, 32, 3, '三居', 78, 1, '南向', 8000, '', '2019-04-17 17:38:19', '', '2019-04-17 17:38:23', '', '0', '椅子,桌子,茶几,电视柜,衣柜,床（床垫）,橱柜', '冰箱,电视,洗衣机,空调,热水器,油烟机,暖气', '地铁旁,学区房,热门租住', 1, 80, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556080746807&di=dbf744ddc33f918743f8ebe55a3137a1&imgtype=0&src=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2Fp2PB8SxZ0c2PlsOaBKRZpWrPicDpI9BpFxSEKtsqGic6DcLzC4JUQGd6E43XLWyiafqCG4ArZRCau1jMxnElQWiaqg%2F640%3Fwx_fmt%3Djpeg');

-- ----------------------------
-- Table structure for zhongz_house_event
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_house_event`;
CREATE TABLE `zhongz_house_event`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `house_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房屋id',
  `event_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动id',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '房源活动中间表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_house_event
-- ----------------------------
INSERT INTO `zhongz_house_event` VALUES ('ee', 'ewq', 'qq', '', '2019-04-19 13:04:03', '', '2019-04-19 13:04:06', '', '0');
INSERT INTO `zhongz_house_event` VALUES ('eea', 'ewq2', 'qq', '', '2019-04-19 13:04:03', '', '2019-04-19 13:04:06', '', '0');

-- ----------------------------
-- Table structure for zhongz_house_rent_type
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_house_rent_type`;
CREATE TABLE `zhongz_house_rent_type`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `house_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房屋id',
  `rent_type_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租赁时长类型id',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '房屋租赁时长类型中间表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_house_rent_type
-- ----------------------------
INSERT INTO `zhongz_house_rent_type` VALUES ('1', 'ewq2', 'dscf', '', '2019-04-19 14:13:30', '', '2019-04-19 14:13:32', '', '0');
INSERT INTO `zhongz_house_rent_type` VALUES ('2', 'ewq2', 'dscf2', '', '2019-04-19 14:13:30', '', '2019-04-19 14:13:32', '', '0');
INSERT INTO `zhongz_house_rent_type` VALUES ('3', 'ewq', 'dscf2', '', '2019-04-19 14:13:30', '', '2019-04-19 14:13:32', '', '0');
INSERT INTO `zhongz_house_rent_type` VALUES ('4', 'ewq', 'dscf3', '', '2019-04-19 14:13:30', '', '2019-04-19 14:13:32', '', '0');

-- ----------------------------
-- Table structure for zhongz_house_tag
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_house_tag`;
CREATE TABLE `zhongz_house_tag`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `house_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房屋id',
  `tag_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签id',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '房屋标签中间表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_house_tag
-- ----------------------------
INSERT INTO `zhongz_house_tag` VALUES ('1', 'ewq', '1', '', '2019-04-19 10:20:18', '', '2019-04-19 10:20:23', '', '0');
INSERT INTO `zhongz_house_tag` VALUES ('2', 'ewq', '3', '', '2019-04-19 10:20:18', '', '2019-04-19 10:20:23', '', '0');
INSERT INTO `zhongz_house_tag` VALUES ('3', 'ewq2', '1', '', '2019-04-19 10:20:18', '', '2019-04-19 10:20:23', '', '0');
INSERT INTO `zhongz_house_tag` VALUES ('4', 'ewq2', '2', '', '2019-04-19 10:20:18', '', '2019-04-19 10:20:23', '', '0');
INSERT INTO `zhongz_house_tag` VALUES ('5', 'ewq', '2', '', '2019-04-19 10:20:18', '', '2019-04-19 10:20:23', '', '0');
INSERT INTO `zhongz_house_tag` VALUES ('6', 'ewq', '4', '', '2019-04-19 10:20:18', '', '2019-04-19 10:20:23', '', '0');
INSERT INTO `zhongz_house_tag` VALUES ('7', 'ewq2', '3', '', '2019-04-19 10:20:18', '', '2019-04-19 10:20:23', '', '0');

-- ----------------------------
-- Table structure for zhongz_house_visit
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_house_visit`;
CREATE TABLE `zhongz_house_visit`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `house_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房屋id',
  `times` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '访问次数',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '房屋访问记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_manager
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_manager`;
CREATE TABLE `zhongz_manager`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `online_state` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '在线状态',
  `phone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `mobile` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短信接收手机',
  `description1` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第一段描述',
  `description2` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第二段描述',
  `wechat_qrcode` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信二维码图片地址',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管家信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_manager
-- ----------------------------
INSERT INTO `zhongz_manager` VALUES ('1', 1, '02000001010', '17640289146', '周一至周五 上午09:00 至 下午18:00', '周六至周日 上午10:00 至 下午17:00', 'http://www.jadyinn.com:81/zhongz-rental-service/images/upload/managerQrcode/4852ecd6abb120e216417a7b06bd6e4.jpg', '', '2019-04-29 17:46:38', '', '2019-04-29 17:46:41', '', '0');

-- ----------------------------
-- Table structure for zhongz_media_file
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_media_file`;
CREATE TABLE `zhongz_media_file`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `media_type` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '媒体文件类型 1 图片 2 视频 3 其他',
  `business` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '所属业务',
  `entity_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件所属实体id',
  `category` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '所属小类',
  `category_order` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '小类中排序',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件描述',
  `url` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存储地址',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `zhongz_media_file_idx1`(`entity_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '媒体文件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_media_file
-- ----------------------------
INSERT INTO `zhongz_media_file` VALUES ('1', 2, 0, 'ewq', 0, 0, '视频', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556272763770&di=806f6fc5346cebfa48e4a7f0850ab719&imgtype=0&src=http%3A%2F%2Fpic.tugou.com%2FDT%2F1453099717_3452194.jpg', '', '2019-04-19 14:54:44', '', '2019-04-19 14:54:47', '', '0');
INSERT INTO `zhongz_media_file` VALUES ('2', 1, 0, 'ewq', 1, 0, '主卧', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556274160955&di=7f255e1aa104137cccf405f94614dd4b&imgtype=0&src=http%3A%2F%2Fimg.zhuangxiubaike.cn%2F201511%2F20151125_07783afab4a2c28d8ec2yvs4a12fuw0s.jpg', '', '2019-04-19 14:54:44', '', '2019-04-19 14:54:47', '', '0');
INSERT INTO `zhongz_media_file` VALUES ('3', 1, 0, 'ewq', 2, 0, '次卧', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556273179528&di=4b8111be1cfc50a83d921a1f345a993a&imgtype=0&src=http%3A%2F%2Fpic.tugou.com%2FTT%2F1449108834_411591.jpg', '', '2019-04-19 14:54:44', '', '2019-04-19 14:54:47', '', '0');
INSERT INTO `zhongz_media_file` VALUES ('4', 1, 0, 'ewq', 3, 0, '客厅', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556274111837&di=b958de3ae4830537c89a6923e9c4f8d0&imgtype=0&src=http%3A%2F%2Ftgi1.jia.com%2F118%2F928%2F18928562.jpg', '', '2019-04-19 14:54:44', '', '2019-04-19 14:54:47', '', '0');
INSERT INTO `zhongz_media_file` VALUES ('5', 1, 0, 'ewq', 4, 0, '厨房', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556273221982&di=c6f563ae4c2b4c4c353cac1db693c56d&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F15%2F20151115220235_GmhEX.jpeg', '', '2019-04-19 14:54:44', '', '2019-04-19 14:54:47', '', '0');
INSERT INTO `zhongz_media_file` VALUES ('6', 1, 0, 'ewq', 5, 0, '卫生间', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556274026306&di=730b10d76634b34f0b2096440faf5478&imgtype=0&src=http%3A%2F%2Fimg1n.soufunimg.com%2Fzxb%2F2014_07%2F30%2F9%2F63%2Fpic%2F000339351100.jpg', '', '2019-04-19 14:54:44', '', '2019-04-19 14:54:47', '', '0');
INSERT INTO `zhongz_media_file` VALUES ('7', 1, 0, 'ewq', 6, 0, '户型图', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556273271380&di=243cb991775784f44dbacd733d3243df&imgtype=0&src=http%3A%2F%2Fimg4.cache.netease.com%2Fphoto%2F0201%2F2013-05-27%2F8VSL9KT02A180201.jpg', '', '2019-04-19 14:54:44', '', '2019-04-19 14:54:47', '', '0');
INSERT INTO `zhongz_media_file` VALUES ('sdfws', 2, 0, 'ewq2', 0, 0, '视频', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556272763770&di=806f6fc5346cebfa48e4a7f0850ab719&imgtype=0&src=http%3A%2F%2Fpic.tugou.com%2FDT%2F1453099717_3452194.jpg', '', '2019-04-19 14:54:44', '', '2019-04-19 14:54:47', '', '0');
INSERT INTO `zhongz_media_file` VALUES ('sdfws1', 1, 0, 'ewq2', 1, 0, '主卧', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556272763770&di=545cf5f012212385f3b3e820aaaf7317&imgtype=0&src=http%3A%2F%2Fimg.zhuangxiubaike.cn%2F201512%2F20151209_2a1eeadf75e2c6170c10muoiphy5wezg.jpg', '', '2019-04-19 14:54:44', '', '2019-04-19 14:54:47', '', '0');
INSERT INTO `zhongz_media_file` VALUES ('sdfws12', 1, 0, 'ewq2', 2, 0, '次卧', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556273179528&di=4b8111be1cfc50a83d921a1f345a993a&imgtype=0&src=http%3A%2F%2Fpic.tugou.com%2FTT%2F1449108834_411591.jpg', '', '2019-04-19 14:54:44', '', '2019-04-19 14:54:47', '', '0');
INSERT INTO `zhongz_media_file` VALUES ('sdfws132', 1, 0, 'ewq2', 3, 0, '客厅', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556273079686&di=d25274d850d7e59c2daf13af589cb04e&imgtype=0&src=http%3A%2F%2Fimg4.duitang.com%2Fuploads%2Fitem%2F201408%2F13%2F20140813172834_usLc3.jpeg', '', '2019-04-19 14:54:44', '', '2019-04-19 14:54:47', '', '0');
INSERT INTO `zhongz_media_file` VALUES ('sdfws132sdw', 1, 0, 'ewq2', 3, 1, '客厅', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556274141576&di=89c6c2f9fd8ea2cd3f73dc8ea1f6f8c8&imgtype=0&src=http%3A%2F%2Fwww.360aiyi.com%2Fdown%2F201410%2F040c8c1d6e9252c64e1805a9b19aa17a.jpg', '', '2019-04-19 14:54:44', '', '2019-04-19 14:54:47', '', '0');
INSERT INTO `zhongz_media_file` VALUES ('sdfws132sdwdfwes', 1, 0, 'ewq2', 5, 1, '卫生间', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556274026306&di=730b10d76634b34f0b2096440faf5478&imgtype=0&src=http%3A%2F%2Fimg1n.soufunimg.com%2Fzxb%2F2014_07%2F30%2F9%2F63%2Fpic%2F000339351100.jpg', '', '2019-04-19 14:54:44', '', '2019-04-19 14:54:47', '', '0');
INSERT INTO `zhongz_media_file` VALUES ('sdfws132sdwxa', 1, 0, 'ewq2', 3, 2, '客厅', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556274111837&di=b958de3ae4830537c89a6923e9c4f8d0&imgtype=0&src=http%3A%2F%2Ftgi1.jia.com%2F118%2F928%2F18928562.jpg', '', '2019-04-19 14:54:44', '', '2019-04-19 14:54:47', '', '0');
INSERT INTO `zhongz_media_file` VALUES ('sdfws1dfye', 1, 0, 'ewq2', 1, 1, '主卧', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556274160955&di=7f255e1aa104137cccf405f94614dd4b&imgtype=0&src=http%3A%2F%2Fimg.zhuangxiubaike.cn%2F201511%2F20151125_07783afab4a2c28d8ec2yvs4a12fuw0s.jpg', '', '2019-04-19 14:54:44', '', '2019-04-19 14:54:47', '', '0');
INSERT INTO `zhongz_media_file` VALUES ('sdfws2', 1, 0, 'ewq2', 4, 0, '厨房', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556273221982&di=c6f563ae4c2b4c4c353cac1db693c56d&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F15%2F20151115220235_GmhEX.jpeg', '', '2019-04-19 14:54:44', '', '2019-04-19 14:54:47', '', '0');
INSERT INTO `zhongz_media_file` VALUES ('sdfws222', 1, 0, 'ewq2', 5, 0, '卫生间', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556273250082&di=1cc02703dd6def544caa42ffed5a4379&imgtype=0&src=http%3A%2F%2Fimg.zhuangxiubaike.cn%2F201512%2F20151202_a6c718edf6da2fca86c9rbc0x1w69brl.jpg', '', '2019-04-19 14:54:44', '', '2019-04-19 14:54:47', '', '0');
INSERT INTO `zhongz_media_file` VALUES ('sdfws2221', 1, 0, 'ewq2', 6, 0, '户型图', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556273271380&di=243cb991775784f44dbacd733d3243df&imgtype=0&src=http%3A%2F%2Fimg4.cache.netease.com%2Fphoto%2F0201%2F2013-05-27%2F8VSL9KT02A180201.jpg', '', '2019-04-19 14:54:44', '', '2019-04-19 14:54:47', '', '0');

-- ----------------------------
-- Table structure for zhongz_nation
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_nation`;
CREATE TABLE `zhongz_nation`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '国籍表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_order
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_order`;
CREATE TABLE `zhongz_order`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `order_type` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单类型',
  `order_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `order_day_order` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '当日订单排序',
  `order_status` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单状态',
  `order_time` datetime(0) NULL DEFAULT NULL COMMENT '预约时间',
  `contract_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同表id',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `zhongz_order_idx1`(`contract_id`) USING BTREE,
  UNIQUE INDEX `zhongz_order_idx2`(`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_order
-- ----------------------------
INSERT INTO `zhongz_order` VALUES ('1c31bf7e08724ea39a0867fd8012a1dd', 0, NULL, 0, 0, NULL, NULL, '', '2019-04-04 17:01:55', '', '2019-04-04 17:01:55', '', '1');
INSERT INTO `zhongz_order` VALUES ('1e12613c60b34da4a31f106066b6aa1b', 0, NULL, 0, 0, NULL, NULL, '', '2019-04-04 17:27:37', '', '2019-04-04 17:27:37', '', '0');
INSERT INTO `zhongz_order` VALUES ('5116a03ad0c6402da17d675ee3427f96', 0, NULL, 0, 0, NULL, NULL, '', '2019-04-04 17:35:15', '', '2019-04-04 17:35:15', '', '1');
INSERT INTO `zhongz_order` VALUES ('530b8d3737f549b997212471f4694c65', 0, 'YYDD20190430001', 1, 0, '2019-04-29 19:43:00', '2b96af2c54fa41bb9720306fb47d4172', '', '2019-04-29 19:43:00', '', '2019-04-29 19:43:00', '', '0');
INSERT INTO `zhongz_order` VALUES ('613019215c0643a082def87656faf61d', 1, 'XYDD20190419001', 1, 0, '2019-04-19 02:24:10', 'e77c52db5eb549d0a6b82a5356eb2409', '', '2019-04-19 02:24:08', '', '2019-04-19 02:24:08', '', '0');
INSERT INTO `zhongz_order` VALUES ('6a486d5dd5024e50a3bc0f87e9478166', 2, '1111111111', 0, 0, NULL, NULL, '', '2019-04-04 16:15:59', '', '2019-04-04 16:15:59', '', '0');
INSERT INTO `zhongz_order` VALUES ('74d8c9c029aa40e6bbdf9d62777c9cec', 0, 'YYDD20190417004', 4, 0, '2019-04-17 06:18:33', '91ea65676d554d55858b6ec503a907a3', '', '2019-04-17 06:18:33', '', '2019-04-17 06:18:33', '', '0');
INSERT INTO `zhongz_order` VALUES ('7a79dc852775408cbdd6697474d1a827', 0, NULL, 0, 0, NULL, NULL, '', '2019-04-08 20:10:58', '', '2019-04-08 20:10:58', '', '0');
INSERT INTO `zhongz_order` VALUES ('850e31f226ff460da477390762734443', 0, NULL, 0, 0, NULL, NULL, '', '2019-04-08 14:47:54', '', '2019-04-08 14:47:54', '', '1');
INSERT INTO `zhongz_order` VALUES ('8d62b5d8f21b49cc8b53d12b18d0d895', 1, 'XYDD20190430001', 1, 0, '2019-04-29 19:44:35', '3fead28fa82c4f7c934b4d4cc6b88cfc', '', '2019-04-29 19:44:35', '', '2019-04-29 19:44:35', '', '0');
INSERT INTO `zhongz_order` VALUES ('8ea12607529441d4896bdaede3d022e0', 0, 'YYDD20190509001', 1, 0, '2019-05-09 06:10:02', '60b46753ee2643c49a1143b5757a00d5', '', '2019-05-09 06:10:02', '', '2019-05-09 06:10:02', '', '0');
INSERT INTO `zhongz_order` VALUES ('95684e77b7084cafb213a7bdf6b9629a', 0, NULL, 0, 0, NULL, NULL, '', '2019-04-08 16:51:23', '', '2019-04-08 16:51:23', '', '1');
INSERT INTO `zhongz_order` VALUES ('9d7b046565c246afa5bc909d1c3eb014', 0, 'YYDD20190507001', 1, 0, '2019-05-06 22:10:47', '08f5e1ef454241cba176e255763ca2ca', '', '2019-05-06 22:10:47', '', '2019-05-06 22:10:47', '', '0');
INSERT INTO `zhongz_order` VALUES ('ad7c58e68b5242f49ea751520203c949', 1, 'XYDD20190514001', 1, 0, '2019-05-14 11:09:30', '3a0cd74933a245728d72b0986a573ec2', '', '2019-05-14 11:09:30', '', '2019-05-14 11:09:30', '', '0');
INSERT INTO `zhongz_order` VALUES ('c2fa736309544f5faa544c7c81527108', 0, NULL, 0, 0, NULL, NULL, '', '2019-04-08 16:45:04', '', '2019-04-08 16:45:04', '', '1');
INSERT INTO `zhongz_order` VALUES ('cb4870ad78cd4a9d902cf0802c252718', 0, 'YYDD20190417001', 1, 0, '2019-04-17 04:39:14', 'a1221543e2334afca5c98468aa6af5b9', '', '2019-04-17 04:39:13', '', '2019-04-17 04:39:13', '', '0');
INSERT INTO `zhongz_order` VALUES ('e2be555fa06b46789347a8533b0853bc', 0, NULL, 0, 0, NULL, NULL, '', '2019-04-08 19:41:40', '', '2019-04-08 19:41:40', '', '1');
INSERT INTO `zhongz_order` VALUES ('e846425d782b4332aeca445ba37ef15e', 0, 'YYDD20190417003', 3, 0, '2019-04-17 06:14:02', 'd596b4c4a65144fabafc06c89b5a9ed0', '', '2019-04-17 06:14:01', '', '2019-04-17 06:14:01', '', '0');
INSERT INTO `zhongz_order` VALUES ('e9095ae75605417da0b39ccf41da8f22', 0, NULL, 0, 0, NULL, NULL, '', '2019-04-08 19:52:58', '', '2019-04-16 19:52:58', '', '1');
INSERT INTO `zhongz_order` VALUES ('ee4396e959f1452ea07148bff19f367f', 0, 'YYDD20190417002', 2, 0, '2019-04-17 05:25:24', '7b661cab4d5046c3af3854c959e00e37', '', '2019-04-17 05:25:23', '', '2019-04-17 05:25:23', '', '0');

-- ----------------------------
-- Table structure for zhongz_order_record
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_order_record`;
CREATE TABLE `zhongz_order_record`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `order_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联订单号',
  `operator_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作者id',
  `operate_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `zhongz_order_record_idx1`(`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单操作记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_order_status
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_order_status`;
CREATE TABLE `zhongz_order_status`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单状态表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_order_type
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_order_type`;
CREATE TABLE `zhongz_order_type`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_pay_period_type
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_pay_period_type`;
CREATE TABLE `zhongz_pay_period_type`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '支付方式表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_pay_type
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_pay_type`;
CREATE TABLE `zhongz_pay_type`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '付款方式表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_payed_type
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_payed_type`;
CREATE TABLE `zhongz_payed_type`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '缴费状态表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_rent_price
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_rent_price`;
CREATE TABLE `zhongz_rent_price`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `price` double(10, 0) UNSIGNED NULL DEFAULT 0 COMMENT '租金价格',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '租金价格表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_rent_type
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_rent_type`;
CREATE TABLE `zhongz_rent_type`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `type_period` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '租赁按月时长',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '租赁时长类别表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_rent_type
-- ----------------------------
INSERT INTO `zhongz_rent_type` VALUES ('dscf', 1, '半年', 6, '', '2019-04-19 14:11:43', '', '2019-04-19 14:11:48', '', '0');
INSERT INTO `zhongz_rent_type` VALUES ('dscf2', 2, '一年', 12, '', '2019-04-19 14:11:43', '', '2019-04-19 14:11:48', '', '0');
INSERT INTO `zhongz_rent_type` VALUES ('dscf3', 3, '十年', 120, '', '2019-04-19 14:11:43', '', '2019-04-19 14:11:48', '', '0');

-- ----------------------------
-- Table structure for zhongz_request_service_type
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_request_service_type`;
CREATE TABLE `zhongz_request_service_type`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '服务大类',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '请求服务类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_request_service_type
-- ----------------------------
INSERT INTO `zhongz_request_service_type` VALUES ('1', 1, 1, '水管管件', '', '2019-05-07 15:21:08', '', '2019-05-07 15:21:12', '', '0');
INSERT INTO `zhongz_request_service_type` VALUES ('10', 2, 10, '开荒', '', '2019-05-07 15:21:08', '', '2019-05-07 15:21:12', '', '0');
INSERT INTO `zhongz_request_service_type` VALUES ('11', 2, 11, '整屋', '', '2019-05-07 15:21:08', '', '2019-05-07 15:21:12', '', '0');
INSERT INTO `zhongz_request_service_type` VALUES ('12', 2, 12, '小时工', '', '2019-05-07 15:21:08', '', '2019-05-07 15:21:12', '', '0');
INSERT INTO `zhongz_request_service_type` VALUES ('2', 1, 2, '灯具电路', '', '2019-05-07 15:21:08', '', '2019-05-07 15:21:12', '', '0');
INSERT INTO `zhongz_request_service_type` VALUES ('3', 1, 3, '开锁换锁', '', '2019-05-07 15:21:08', '', '2019-05-07 15:21:12', '', '0');
INSERT INTO `zhongz_request_service_type` VALUES ('4', 1, 4, '门窗报修', '', '2019-05-07 15:21:08', '', '2019-05-07 15:21:12', '', '0');
INSERT INTO `zhongz_request_service_type` VALUES ('5', 1, 5, '安装拆除', '', '2019-05-07 15:21:08', '', '2019-05-07 15:21:12', '', '0');
INSERT INTO `zhongz_request_service_type` VALUES ('6', 1, 6, '墙地面报修', '', '2019-05-07 15:21:08', '', '2019-05-07 15:21:12', '', '0');
INSERT INTO `zhongz_request_service_type` VALUES ('7', 1, 7, '清洗', '', '2019-05-07 15:21:08', '', '2019-05-07 15:21:12', '', '0');
INSERT INTO `zhongz_request_service_type` VALUES ('8', 2, 8, '油烟机', '', '2019-05-07 15:21:08', '', '2019-05-07 15:21:12', '', '0');
INSERT INTO `zhongz_request_service_type` VALUES ('9', 2, 9, '厨卫', '', '2019-05-07 15:21:08', '', '2019-05-07 15:21:12', '', '0');

-- ----------------------------
-- Table structure for zhongz_residence
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_residence`;
CREATE TABLE `zhongz_residence`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `nation_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国籍id',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '户籍表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_restaurant
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_restaurant`;
CREATE TABLE `zhongz_restaurant`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '店铺名称',
  `service_type` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '服务类型',
  `address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家位置',
  `mobile` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `picture` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '店铺照片',
  `description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '店铺简介',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `zhongz_restaurant_idx1`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '店铺表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_room
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_room`;
CREATE TABLE `zhongz_room`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `house_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属房屋id',
  `rent_status` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '房间租住状态',
  `direction` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '朝向',
  `direction_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '朝向名，冗余存储',
  `area` double(10, 0) NULL DEFAULT 0 COMMENT '面积',
  `monthly_rent` double(10, 0) NULL DEFAULT 0 COMMENT '月租金',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房间标题描述',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房间描述',
  `soft_configs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房间软装配置',
  `electric_configs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房间电器配置',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `zhongz_room_idx1`(`house_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '房间表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_room
-- ----------------------------
INSERT INTO `zhongz_room` VALUES ('ccc', 'ewq', 0, 1, '南向', 55, 5000, '西局玉园两居', '西局玉园两居', '椅子,桌子,茶几,电视柜,床（床垫）,橱柜', '冰箱,电视,洗衣机,空调,热水器,油烟机,暖气', '', '2019-04-19 13:15:51', '', '2019-04-19 13:15:53', '', '0');
INSERT INTO `zhongz_room` VALUES ('ccc1', 'ewq2', 0, 1, '南向', 22, 8000, '西局玉园合租三居南', '西局玉园合租三居南', '椅子,桌子,茶几,电视柜,衣柜,床（床垫）,橱柜', '冰箱,电视,洗衣机,空调,热水器,油烟机,暖气', '', '2019-04-19 13:15:51', '', '2019-04-19 13:15:53', '', '0');
INSERT INTO `zhongz_room` VALUES ('ccc3', 'ewq2', 0, 2, '南向左', 26, 8000, '西局玉园合租三居南向左', '西局玉园合租三居南向左', '椅子,桌子,茶几,电视柜,床（床垫）,橱柜', '冰箱,电视,洗衣机,热水器,油烟机', '', '2019-04-19 13:15:51', '', '2019-04-19 13:15:53', '', '0');
INSERT INTO `zhongz_room` VALUES ('ccc5', 'ewq2', 1, 3, '南向右', 30, 8000, '西局玉园合租三居南向右', '西局玉园合租三居南向右', '椅子,桌子,茶几,电视柜,衣柜,床（床垫）,橱柜', '冰箱,电视,洗衣机,热水器,油烟机', '', '2019-04-19 13:15:51', '', '2019-04-19 13:15:53', '', '0');

-- ----------------------------
-- Table structure for zhongz_search_history
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_search_history`;
CREATE TABLE `zhongz_search_history`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '标签类型',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联用户id',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '搜索历史标签表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_service_order
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_service_order`;
CREATE TABLE `zhongz_service_order`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `order_type` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单类型',
  `order_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `order_day_order` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '当日订单排序',
  `order_status` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '订单状态',
  `order_time` datetime(0) NULL DEFAULT NULL COMMENT '预约时间',
  `house_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租住房屋id',
  `tenant_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '承租人id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `renter_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '受理人id',
  `accept_time` datetime(0) NULL DEFAULT NULL COMMENT '受理时间',
  `request_service_type` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '请求服务类型',
  `service_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务描述内容',
  `pictures` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '现场图片',
  `server_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '指派人员',
  `server_mobile` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '指派人员联系电话',
  `service_pay` double(10, 0) NULL DEFAULT 0 COMMENT '服务实付金额',
  `wechat_pay_status` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '微信支付状态',
  `wechat_order_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信订单号',
  `wechat_refund_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信退款单号',
  `service_stars` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '服务评价星级',
  `service_pictures` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务后图片',
  `service_remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务后备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `zhongz_service_order_idx1`(`order_id`) USING BTREE,
  INDEX `zhongz_service_order_idx2`(`house_id`) USING BTREE,
  INDEX `zhongz_service_order_idx3`(`tenant_id`) USING BTREE,
  INDEX `zhongz_service_order_idx4`(`renter_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '服务订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_service_order
-- ----------------------------
INSERT INTO `zhongz_service_order` VALUES ('0c6d4d63675b472f859e8b8e635c90fa', 1, 'BJDD20190515006', 6, 3, '2019-05-15 10:59:34', 'ewq2', 'c28cfa138c1a48ebaad68afb467527ab', NULL, NULL, NULL, NULL, 8, '111', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, '', '2019-05-15 10:59:34', '', '2019-05-15 10:59:34', '', '0');
INSERT INTO `zhongz_service_order` VALUES ('2b068bf49dda46519ad75f093a0f05b5', 0, 'BXDD20190514006', 6, 3, '2019-05-14 19:20:10', 'ewq2', 'c28cfa138c1a48ebaad68afb467527ab', NULL, NULL, NULL, NULL, 6, 'fdasdf', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, '', '2019-05-14 19:20:10', '', '2019-05-14 19:20:10', '', '0');
INSERT INTO `zhongz_service_order` VALUES ('33ef818269ba4bd0a9b0e8d3c02009fb', 1, 'BJDD20190515004', 4, 3, '2019-05-15 10:54:28', 'ewq2', 'c28cfa138c1a48ebaad68afb467527ab', NULL, NULL, NULL, NULL, 10, '开荒', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, '', '2019-05-15 10:54:28', '', '2019-05-15 10:54:28', '', '0');
INSERT INTO `zhongz_service_order` VALUES ('3cb83990495640e999ea9719c8196333', 1, 'BJDD20190515003', 3, 3, '2019-05-15 10:50:42', 'ewq2', 'c28cfa138c1a48ebaad68afb467527ab', NULL, NULL, NULL, NULL, 11, '整屋', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, '', '2019-05-15 10:50:42', '', '2019-05-15 10:50:42', '', '0');
INSERT INTO `zhongz_service_order` VALUES ('584e3590bf72416982084faab4d67402', 1, 'BJDD20190515001', 1, 3, '2019-05-15 10:09:23', 'ewq2', 'c28cfa138c1a48ebaad68afb467527ab', NULL, NULL, NULL, NULL, 9, '厨卫清洁', 'http://www.jadyinn.com:81/zhongz-rental-service/images/upload/cleaningReportPics/om4J45A9IvODqycslYOaEDiVSTdI/20190515100922ROC77QZ8tmp_6fc513ea3a3bccc3d473e28a727c24fad888afa0ca4db663.jpg', NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, '', '2019-05-15 10:09:23', '', '2019-05-15 10:09:23', '', '0');
INSERT INTO `zhongz_service_order` VALUES ('5b5cbbea52fb4f9f9adbd9d7eecad0e3', 1, 'BJDD20190515002', 2, 3, '2019-05-15 10:11:21', 'ewq2', 'c28cfa138c1a48ebaad68afb467527ab', NULL, NULL, NULL, NULL, 9, 'fff', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, '', '2019-05-15 10:11:21', '', '2019-05-15 10:11:21', '', '0');
INSERT INTO `zhongz_service_order` VALUES ('621c3f6d26664d658370fe8b3ee6234b', 1, 'BJDD20190515007', 7, 3, '2019-05-15 11:03:37', 'ewq2', 'c28cfa138c1a48ebaad68afb467527ab', NULL, NULL, NULL, NULL, 9, '你好', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, '', '2019-05-15 11:03:37', '', '2019-05-15 11:03:37', '', '0');
INSERT INTO `zhongz_service_order` VALUES ('751439091fb343a5a7ff5221fb8975b8', 0, 'BXDD20190514003', 3, 1, '2019-05-14 15:35:06', 'ewq2', 'c28cfa138c1a48ebaad68afb467527ab', NULL, NULL, NULL, NULL, 3, 'fffff', 'http://www.jadyinn.com:81/zhongz-rental-service/images/upload/repairReportPics/om4J45A9IvODqycslYOaEDiVSTdI/20190514033505G3YSMK2Mwx67c11d207099cd88.o6zAJs3QC2ZA4A4Rt53Cfy0QAT6I.ehVmPQAbhyK10d5490e3055ffb806b8071ae4c889dfd.jpg', NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, '', '2019-05-14 15:35:06', '', '2019-05-14 15:35:06', '', '0');
INSERT INTO `zhongz_service_order` VALUES ('75f4c54422cf4b12bb769e9c038b8f08', 1, 'BJDD20190514001', 1, 3, '2019-05-14 20:47:16', 'ewq2', 'c28cfa138c1a48ebaad68afb467527ab', NULL, NULL, NULL, NULL, 8, '秀阿秀', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, '', '2019-05-14 20:47:16', '', '2019-05-14 20:47:16', '', '0');
INSERT INTO `zhongz_service_order` VALUES ('8d8e5bb5eda4436cb239f27c1e564786', 0, 'BXDD20190514002', 2, 0, '2019-05-14 15:17:30', 'ewq2', 'c28cfa138c1a48ebaad68afb467527ab', NULL, NULL, NULL, NULL, 1, 'fff', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, '', '2019-05-14 15:17:30', '', '2019-05-14 15:17:30', '', '0');
INSERT INTO `zhongz_service_order` VALUES ('900c171837fe437190ea632b26923693', 1, 'BJDD20190515005', 5, 3, '2019-05-15 10:57:11', 'ewq2', 'c28cfa138c1a48ebaad68afb467527ab', NULL, NULL, NULL, NULL, 9, '红', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, '', '2019-05-15 10:57:11', '', '2019-05-15 10:57:11', '', '0');
INSERT INTO `zhongz_service_order` VALUES ('951812b519d34e41b7e95c5c8d0b8fb1', 1, 'BJDD20190515008', 8, 3, '2019-05-15 11:06:19', 'ewq2', 'c28cfa138c1a48ebaad68afb467527ab', NULL, NULL, NULL, NULL, 12, '女朋', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, '', '2019-05-15 11:06:19', '', '2019-05-15 11:06:19', '', '0');
INSERT INTO `zhongz_service_order` VALUES ('abb5b4b4281d4c569da0347c1fd218eb', 0, 'BXDD20190514005', 5, 3, '2019-05-14 19:19:20', 'ewq2', 'c28cfa138c1a48ebaad68afb467527ab', NULL, NULL, NULL, NULL, 2, 'fdaffds', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, '', '2019-05-14 19:19:20', '', '2019-05-14 19:19:20', '', '0');
INSERT INTO `zhongz_service_order` VALUES ('bbf5e1b1a69b4841a3f927069bcb01f7', 0, 'BXDD20190514001', 1, 2, '2019-05-14 15:03:10', 'ewq2', 'c28cfa138c1a48ebaad68afb467527ab', NULL, NULL, NULL, NULL, 1, 'f大幅度发', 'http://www.jadyinn.com:81/zhongz-rental-service/images/upload/repairReportPics/om4J45A9IvODqycslYOaEDiVSTdI/20190514030256RZ19ORGOwx67c11d207099cd88.o6zAJs3QC2ZA4A4Rt53Cfy0QAT6I.RQ2gJIol9qNL0d5490e3055ffb806b8071ae4c889dfd.jpg', NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, '', '2019-05-14 15:03:10', '', '2019-05-14 15:03:10', '', '0');
INSERT INTO `zhongz_service_order` VALUES ('ebf9483c13474a488821b044cd0dccb5', 0, 'BXDD20190514004', 4, 3, '2019-05-14 19:05:56', 'ewq2', 'c28cfa138c1a48ebaad68afb467527ab', NULL, NULL, NULL, NULL, 1, 'ioiio', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, '', '2019-05-14 19:05:56', '', '2019-05-14 19:05:56', '', '0');

-- ----------------------------
-- Table structure for zhongz_service_type
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_service_type`;
CREATE TABLE `zhongz_service_type`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '服务类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_soft_config
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_soft_config`;
CREATE TABLE `zhongz_soft_config`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '房屋软装类别表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_soft_config
-- ----------------------------
INSERT INTO `zhongz_soft_config` VALUES ('1', 1, '沙发', '', '2019-04-24 09:58:15', '', '2019-04-24 09:58:18', '', '0');
INSERT INTO `zhongz_soft_config` VALUES ('2', 1, '地毯', '', '2019-04-24 09:58:15', '', '2019-04-24 09:58:18', '', '0');
INSERT INTO `zhongz_soft_config` VALUES ('3', 1, '立柜', '', '2019-04-24 09:58:15', '', '2019-04-24 09:58:18', '', '0');
INSERT INTO `zhongz_soft_config` VALUES ('4', 1, '台球桌', '', '2019-04-24 09:58:15', '', '2019-04-24 09:58:18', '', '0');

-- ----------------------------
-- Table structure for zhongz_structure_type
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_structure_type`;
CREATE TABLE `zhongz_structure_type`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `tenant_count` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '整租户型居住人上限',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `zhongz_structure_type_idx1`(`type_code`) USING BTREE,
  UNIQUE INDEX `zhongz_structure_type_idx2`(`type_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '户型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_structure_type
-- ----------------------------
INSERT INTO `zhongz_structure_type` VALUES ('1', 1, '一居', 3, '', '2019-04-19 10:58:25', '', '2019-04-19 10:58:28', '', '0');
INSERT INTO `zhongz_structure_type` VALUES ('2', 2, '两居', 6, '', '2019-04-19 10:58:25', '', '2019-04-19 10:58:28', '', '0');
INSERT INTO `zhongz_structure_type` VALUES ('3', 3, '三居', 5, '', '2019-04-19 10:58:25', '', '2019-04-19 10:58:28', '', '0');

-- ----------------------------
-- Table structure for zhongz_suggestion
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_suggestion`;
CREATE TABLE `zhongz_suggestion`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '反馈人id',
  `suggest_time` datetime(0) NULL DEFAULT NULL COMMENT '反馈时间',
  `content` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '反馈内容',
  `accept_status` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '受理状态（0：未处理，1：已采纳，2：未采纳）',
  `acceptor_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '受理人id',
  `accept_time` datetime(0) NULL DEFAULT NULL COMMENT '受理时间',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '受理描述',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `zhongz_suggestion_idx1`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '意见反馈表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_user
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_user`;
CREATE TABLE `zhongz_user`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '主键',
  `nick_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `mobile` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `openid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信小程序用户唯一标识',
  `session_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信小程序用户会话密钥',
  `unionid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户在微信开放平台唯一标识符',
  `head_portrait` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像url',
  `gender` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '性别',
  `user_type` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '用户类型',
  `invitation_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邀请码',
  `invitor_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '我的邀请人id',
  `register_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后一次登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `country` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信用户所在国家',
  `province` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信用户所在省份',
  `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信用户所在城市',
  `language` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信用户所用的语言',
  `longitude` double(64, 0) NULL DEFAULT NULL COMMENT '微信用户所在经度',
  `latitude` double(64, 0) NULL DEFAULT NULL COMMENT '微信用户所在纬度',
  `last_logout_time` datetime(0) NULL DEFAULT NULL COMMENT '最后一次退出登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `zhongz_user_idx4`(`invitation_code`) USING BTREE,
  UNIQUE INDEX `zhongz_user_idx1`(`nick_name`) USING BTREE,
  UNIQUE INDEX `zhongz_user_idx2`(`mobile`) USING BTREE,
  UNIQUE INDEX `zhongz_user_idx3`(`openid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_user
-- ----------------------------
INSERT INTO `zhongz_user` VALUES ('1', NULL, NULL, 'ddd', 'eee', NULL, NULL, 0, 0, 'd', 'c28cfa138c1a48ebaad68afb467527ab', NULL, NULL, '', '2019-04-17 17:34:44', '', '2019-04-17 17:34:47', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `zhongz_user` VALUES ('2a32a65277e04290a5f0e7a2a589230e', '无心快语', '17640289146', 'dke', 'ks1', 'fws', '/zhongz-rental-service/images/upload/headPortrait/17640289146/5c500d9565b10.png', 0, 0, '2a32a65277e04290a5f0e7a2a589230e', 'c28cfa138c1a48ebaad68afb467527ab', '2019-04-17 06:00:45', '2019-04-19 03:50:02', '', '2019-04-17 06:00:44', '', '2019-04-19 03:50:02', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-30 08:47:57');
INSERT INTO `zhongz_user` VALUES ('5bbfac87d09d4aa7b205f4bbd3a6a3b9', '裴迪', NULL, 'om4J45MG38eZBdnyoQCyB556_U_o', 'wKVg0mqKHiK8RXY13Khs4A==', NULL, 'https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLDhB2cetjCibibibkKSSgfZ0dH22N1oX1E3O87b1HyibRktVmaVariaCg5hXWLqqNACqPeSQMYHN0gJWaA/132', 0, 0, 'OPZ1H3H3', NULL, '2019-05-08 21:06:17', '2019-05-08 21:06:17', '', '2019-05-08 21:06:17', '', '2019-05-08 21:06:17', '', '0', 'China', 'Liaoning', 'Shenyang', 'zh_CN', 123, 42, NULL);
INSERT INTO `zhongz_user` VALUES ('c28cfa138c1a48ebaad68afb467527ab', 'hliu', '13130274421', 'om4J45A9IvODqycslYOaEDiVSTdI', 'LvM3rMJT2G5XIcTlNfSK6g==', NULL, 'http://www.jadyinn.com:81/zhongz-rental-service/images/upload/headPortrait/om4J45A9IvODqycslYOaEDiVSTdI/wx67c11d207099cd88.o6zAJs3QC2ZA4A4Rt53Cfy0QAT6I.N1ohLke1J3sU4068e6b025f5716c5eaad07778e9560c.png', 0, 0, 'DFO4E9RO', NULL, '2019-04-23 20:23:14', '2019-05-15 11:03:25', '', '2019-04-23 20:23:14', '', '2019-05-15 11:03:25', '', '0', 'China', 'Liaoning', 'Shenyang', 'zh_CN', 123, 42, '2019-05-07 13:02:04');

-- ----------------------------
-- Table structure for zhongz_user_type
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_user_type`;
CREATE TABLE `zhongz_user_type`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type_code` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型值',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型描述',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zhongz_validate_code
-- ----------------------------
DROP TABLE IF EXISTS `zhongz_validate_code`;
CREATE TABLE `zhongz_validate_code`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型',
  `mobile` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '验证手机',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '验证码',
  `expire` int(10) UNSIGNED NULL DEFAULT 60 COMMENT '有效期',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status1` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `zhongz_validate_code_idx1`(`type`, `mobile`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '验证码表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhongz_validate_code
-- ----------------------------
INSERT INTO `zhongz_validate_code` VALUES ('b2fac579191f4146b34b1ab1ad3653ac', 0, '13080806066', '966048', 60, '', '2019-04-25 22:18:15', '', '2019-04-25 22:18:15', '', '0');
INSERT INTO `zhongz_validate_code` VALUES ('e223d7f252914d9bab63d0c6573483bf', 0, '17640289146', '791603', 60, '', '2019-04-17 05:37:28', '', '2019-04-17 05:45:06', '', '0');
INSERT INTO `zhongz_validate_code` VALUES ('ea10dc3fc9a240e4a8b7ca9ccf709aa4', 0, '13130274421', '737910', 60, '', '2019-04-22 23:22:38', '', '2019-05-06 09:16:53', '', '0');

SET FOREIGN_KEY_CHECKS = 1;
