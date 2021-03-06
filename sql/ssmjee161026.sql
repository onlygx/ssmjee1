/*
Navicat MySQL Data Transfer

Source Server         : server.vraiyou.com
Source Server Version : 50713
Source Host           : server.vraiyou.com:3306
Source Database       : ssmjee

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2016-10-26 14:29:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c_burst
-- ----------------------------
DROP TABLE IF EXISTS `c_burst`;
CREATE TABLE `c_burst` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '突发事件时间',
  `content` text COMMENT '突发事件内容',
  `solve` text COMMENT '突发事件解决方案',
  `type` int(1) DEFAULT NULL COMMENT '突发事件人类型：0为老人， 1为义工，2为社工，3为社区',
  `name` varchar(32) DEFAULT NULL COMMENT '突发事件名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='社区突发情况表';

-- ----------------------------
-- Records of c_burst
-- ----------------------------

-- ----------------------------
-- Table structure for c_community
-- ----------------------------
DROP TABLE IF EXISTS `c_community`;
CREATE TABLE `c_community` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `community` varchar(32) DEFAULT NULL COMMENT '社区名称',
  `login` varchar(32) DEFAULT NULL COMMENT '社区账号',
  `region` varchar(32) DEFAULT NULL COMMENT '所属区域',
  `person` varchar(32) DEFAULT NULL COMMENT '社区负责人',
  `telephone` varchar(32) DEFAULT NULL COMMENT '社区负责人电话',
  `comphone` varchar(32) DEFAULT NULL COMMENT '社区电话',
  `address` varchar(100) DEFAULT NULL COMMENT '社区地址',
  `area` varchar(32) DEFAULT NULL COMMENT '社区服务区域',
  `number` int(20) DEFAULT NULL COMMENT '老人数量',
  `profile` varchar(255) DEFAULT NULL COMMENT '社区概况',
  `valid` int(1) NOT NULL DEFAULT '1' COMMENT '社区及社区服务站是否有效，0为无效，1为有效',
  `superior` varchar(32) NOT NULL DEFAULT '0' COMMENT '上级社区',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '0为社区，1为社区服务站',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='社区表';

-- ----------------------------
-- Records of c_community
-- ----------------------------
INSERT INTO `c_community` VALUES ('1885698116952372134', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `c_community` VALUES ('5042060325045712012', '565', '456', '4565', '4565', '5465', '546', '54', '456', '56', '546', '546', '8796', '876');
INSERT INTO `c_community` VALUES ('5454fgfg5f4gfd5g4f545f4', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2');
INSERT INTO `c_community` VALUES ('5454fgfg5f4gfd5hjhf4', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3');
INSERT INTO `c_community` VALUES ('7468937182027992133', 'j', 'j', 'j', 'j', '1', '5', '2', '2', '2', '2', '2', '2', '2');

-- ----------------------------
-- Table structure for c_doctor
-- ----------------------------
DROP TABLE IF EXISTS `c_doctor`;
CREATE TABLE `c_doctor` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `name` varchar(32) DEFAULT NULL COMMENT '医生名称',
  `industry` varchar(32) DEFAULT NULL COMMENT '医生主治',
  `sex` varchar(1) DEFAULT NULL COMMENT '医生性别',
  `age` int(20) DEFAULT NULL COMMENT '医生年龄',
  `phone` varchar(11) DEFAULT NULL COMMENT '医生联系电话',
  `community_id` varchar(32) DEFAULT NULL COMMENT '关联社区门诊表ID。',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='社区医生表';

-- ----------------------------
-- Records of c_doctor
-- ----------------------------
INSERT INTO `c_doctor` VALUES ('8657214714052430648', '1', '1', '3', '3', '3', '1');

-- ----------------------------
-- Table structure for c_hospital
-- ----------------------------
DROP TABLE IF EXISTS `c_hospital`;
CREATE TABLE `c_hospital` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `name` varchar(32) DEFAULT NULL COMMENT '社区门诊名称',
  `address` varchar(100) DEFAULT NULL COMMENT '社区门诊地址',
  `phone` varchar(11) DEFAULT NULL COMMENT '门诊联系电话',
  `number` int(11) DEFAULT NULL COMMENT '门诊所属医生数量',
  `attending` varchar(32) DEFAULT NULL COMMENT '门诊主治行业',
  `community_id` varchar(32) DEFAULT NULL COMMENT '社区ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='社区门诊表';

-- ----------------------------
-- Records of c_hospital
-- ----------------------------

-- ----------------------------
-- Table structure for c_service_vol
-- ----------------------------
DROP TABLE IF EXISTS `c_service_vol`;
CREATE TABLE `c_service_vol` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `begin_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '义工服务开始时间',
  `end_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '义工服务结束时间',
  `content` text COMMENT '服务内容',
  `elderly_id` varchar(32) DEFAULT NULL COMMENT '服务老人id',
  `community_vol_id` varchar(32) DEFAULT NULL COMMENT '关联义工id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='社区义工服务表';

-- ----------------------------
-- Records of c_service_vol
-- ----------------------------

-- ----------------------------
-- Table structure for c_service_worker
-- ----------------------------
DROP TABLE IF EXISTS `c_service_worker`;
CREATE TABLE `c_service_worker` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `begin_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '社工服务开始时间',
  `end_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '社工服务结束时间',
  `content` text COMMENT '服务内容',
  `elderly_id` varchar(32) DEFAULT NULL COMMENT '服务老人id',
  `community_worker_id` varchar(32) DEFAULT NULL COMMENT '关联社工id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='社区员工服务表';

-- ----------------------------
-- Records of c_service_worker
-- ----------------------------

-- ----------------------------
-- Table structure for c_voluntary
-- ----------------------------
DROP TABLE IF EXISTS `c_voluntary`;
CREATE TABLE `c_voluntary` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `name` varchar(32) DEFAULT NULL COMMENT '义工名称',
  `sex` varchar(1) DEFAULT NULL COMMENT '义工性别关联sex_type',
  `nation` varchar(32) DEFAULT NULL COMMENT '义工民族',
  `phone` varchar(11) DEFAULT NULL COMMENT '义工联系电话',
  `time` timestamp NULL DEFAULT NULL COMMENT '出生年月',
  `number_id` varchar(32) DEFAULT NULL COMMENT '身份证号',
  `comunity_id` varchar(32) DEFAULT NULL COMMENT '关联社区表',
  `address` varchar(32) DEFAULT NULL COMMENT '义工联系地址',
  `occupation` varchar(1) DEFAULT NULL COMMENT 'tion_type关联字典',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='社区义工表';

-- ----------------------------
-- Records of c_voluntary
-- ----------------------------

-- ----------------------------
-- Table structure for c_worker
-- ----------------------------
DROP TABLE IF EXISTS `c_worker`;
CREATE TABLE `c_worker` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `name` varchar(32) DEFAULT NULL COMMENT '社工名称',
  `sex` varchar(1) DEFAULT NULL COMMENT '社工性别关联sex_type',
  `nation` varchar(32) DEFAULT NULL COMMENT '社工民族',
  `phone` varchar(11) DEFAULT NULL COMMENT '社工联系电话',
  `time` timestamp NULL DEFAULT NULL COMMENT '出生年月',
  `number_id` varchar(32) DEFAULT NULL COMMENT '身份证号',
  `community_id` varchar(32) DEFAULT NULL COMMENT '关联社区表',
  `address` varchar(32) DEFAULT NULL COMMENT '社工联系地址',
  `occupation` varchar(1) DEFAULT NULL COMMENT 'tion_type关联字典',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='社区员工表';

-- ----------------------------
-- Records of c_worker
-- ----------------------------

-- ----------------------------
-- Table structure for e_drugs
-- ----------------------------
DROP TABLE IF EXISTS `e_drugs`;
CREATE TABLE `e_drugs` (
  `id` varchar(32) NOT NULL COMMENT '系统老人用药表--主键',
  `drug` varchar(32) DEFAULT NULL COMMENT '药名',
  `takingtime` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '服用开始时间',
  `stoptime` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '服用结束时间',
  `dosage` varchar(32) DEFAULT NULL COMMENT '用药剂量',
  `treatment` varchar(32) DEFAULT NULL COMMENT '服用疗程treat_type',
  `usage` varchar(32) DEFAULT NULL COMMENT '使用方法usage_type',
  `effect` varchar(32) DEFAULT NULL COMMENT '药物作用',
  `elderly_id` varchar(32) DEFAULT NULL COMMENT '老人ID关联老人表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of e_drugs
-- ----------------------------

-- ----------------------------
-- Table structure for e_elderly
-- ----------------------------
DROP TABLE IF EXISTS `e_elderly`;
CREATE TABLE `e_elderly` (
  `id` varchar(32) NOT NULL COMMENT '系统老人会员表--主键',
  `username` varchar(32) NOT NULL COMMENT '老人姓名',
  `age` int(20) NOT NULL COMMENT '老人年龄',
  `equipment` varchar(32) DEFAULT NULL COMMENT '老人设备表',
  `community` varchar(32) NOT NULL COMMENT '老人所属机构关联机构表',
  `address` varchar(32) NOT NULL COMMENT '老人所在区域',
  `social` varchar(32) NOT NULL COMMENT '老人所属社工',
  `phone` varchar(11) NOT NULL COMMENT '老人手机号码',
  `healthy` varchar(1) NOT NULL COMMENT '老人健康状态',
  `sex` varchar(1) NOT NULL COMMENT '老人性别',
  `numberid` varchar(18) NOT NULL COMMENT '老人身份证号',
  `nation` varchar(1) NOT NULL COMMENT '老人民族',
  `datebirthtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '老人生日',
  `marital` varchar(1) NOT NULL COMMENT '婚姻状况marital_type 0：已婚1：未婚',
  `categories` varchar(1) NOT NULL COMMENT '老人类别categories _type 0:低保1：独居2：高龄3：孤寡4：空巢5：其他6：三无7：五保户',
  `living` varchar(1) NOT NULL COMMENT '关联字典living_type:0:独自居住1：与配偶2：子女合作3：其他',
  `emergency` varchar(32) NOT NULL COMMENT '紧急联系人',
  `emephone` varchar(11) NOT NULL COMMENT '紧急联系人电话',
  `chronic` varchar(1) NOT NULL COMMENT '是否有 1:高血压2：高血糖0：无',
  `blood` varchar(10) NOT NULL COMMENT '血型',
  `disability` varchar(1) NOT NULL COMMENT 'disability_type,0:轻度残疾1：无2：中度残疾3：重读残疾',
  `education` varchar(1) NOT NULL COMMENT 'edu_type;0:本科，1：初中，2：高中；3：硕士；4：无，5：小学；6：中专；7：专科',
  `major` varchar(10) NOT NULL COMMENT '专业',
  `title` varchar(10) NOT NULL COMMENT '职称',
  `company` varchar(32) NOT NULL COMMENT '原单位',
  `doctor` varchar(32) NOT NULL COMMENT '老人所属医生',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of e_elderly
-- ----------------------------

-- ----------------------------
-- Table structure for e_family
-- ----------------------------
DROP TABLE IF EXISTS `e_family`;
CREATE TABLE `e_family` (
  `id` varchar(32) NOT NULL COMMENT '系统老人家人表--主键',
  `familyname` varchar(32) NOT NULL COMMENT '家人姓名',
  `familysex` varchar(1) NOT NULL COMMENT '家属性别  关联字典性别sex_type',
  `familytype` varchar(1) NOT NULL COMMENT '与老人关系 关联字典身份表identity_type，0：儿子1：女子',
  `phone` varchar(11) NOT NULL COMMENT '家人联系电话号码',
  `address` varchar(32) NOT NULL COMMENT '家人地址',
  `elderly_id` varchar(32) NOT NULL COMMENT '关联ID',
  `user_id` varchar(32) NOT NULL COMMENT '关联用户ID',
  `children` varchar(1) NOT NULL COMMENT 'children_type,0:在读书；1:已工作；2：无业',
  `live` varchar(1) NOT NULL COMMENT 'live_type,0:是，1：否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of e_family
-- ----------------------------

-- ----------------------------
-- Table structure for e_healthy
-- ----------------------------
DROP TABLE IF EXISTS `e_healthy`;
CREATE TABLE `e_healthy` (
  `id` varchar(32) NOT NULL COMMENT '老人健康数据表--主键',
  `hearing` varchar(1) NOT NULL COMMENT '老人听力hearing_type',
  `vision` varchar(1) NOT NULL COMMENT '老人视力vision_type',
  `illness` varchar(1) NOT NULL COMMENT '现病史关联illness_type',
  `care` varchar(1) NOT NULL COMMENT '自理能力关联care_type',
  `memory` varchar(1) NOT NULL COMMENT '记忆能力memory_type',
  `pacemaker` varchar(1) NOT NULL COMMENT '心脏起搏器maker_type',
  `blood` varchar(1) NOT NULL COMMENT '血压情况blood_type',
  `hygiene` varchar(1) NOT NULL COMMENT '日常卫生hygiene_type',
  `washes` varchar(1) NOT NULL COMMENT '洗澡情况washes_type',
  `hair` varchar(1) NOT NULL COMMENT '头发颜色hair_type',
  `skin` varchar(1) NOT NULL COMMENT '皮肤状况skin_type',
  `eye` varchar(1) NOT NULL COMMENT '视力情况eye_type',
  `nasal` varchar(1) NOT NULL COMMENT '鼻腔情况nasal_type',
  `ear` varchar(1) NOT NULL COMMENT '耳部情况ear_type',
  `oral` varchar(1) NOT NULL COMMENT '口腔情况oral_type',
  `nerve` varchar(1) NOT NULL COMMENT '神经情况nerve_type',
  `head` varchar(1) NOT NULL COMMENT '颅脑情况head_type',
  `kidney` varchar(1) NOT NULL COMMENT '肾脏情况kidney_type',
  `joint` varchar(1) NOT NULL COMMENT '骨关节joint_type',
  `physical` varchar(255) DEFAULT NULL COMMENT '体检次数',
  `medical` varchar(1) NOT NULL COMMENT '就医情况medical_type',
  `take` varchar(1) NOT NULL COMMENT '是否服用药物take_type',
  `allergy` varchar(1) NOT NULL COMMENT '过敏史allergy_type',
  `elderly_id` varchar(32) NOT NULL COMMENT '关联老人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of e_healthy
-- ----------------------------

-- ----------------------------
-- Table structure for e_locate
-- ----------------------------
DROP TABLE IF EXISTS `e_locate`;
CREATE TABLE `e_locate` (
  `id` varchar(32) NOT NULL COMMENT '老人定位信息表--主键',
  `equ_id` varchar(32) DEFAULT NULL COMMENT '设备ID',
  `equgps` text COMMENT '设备GPS',
  `equtime` timestamp NULL DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of e_locate
-- ----------------------------

-- ----------------------------
-- Table structure for e_medical
-- ----------------------------
DROP TABLE IF EXISTS `e_medical`;
CREATE TABLE `e_medical` (
  `id` varchar(32) NOT NULL COMMENT '就诊记录表--主键',
  `elderly_id` varchar(32) DEFAULT NULL COMMENT '关联老人用户表',
  `medical` varchar(32) DEFAULT NULL COMMENT '就诊医院',
  `department` varchar(32) DEFAULT NULL COMMENT '就诊科室',
  `doctor` varchar(32) DEFAULT NULL COMMENT '就诊医生',
  `visitingtime` timestamp NULL DEFAULT NULL COMMENT '就诊时间',
  `visitime` timestamp NULL DEFAULT NULL COMMENT '复诊时间',
  `content` varchar(50) DEFAULT NULL COMMENT '主诉内容',
  `physique` varchar(230) DEFAULT NULL COMMENT '体格检查内容',
  `auxiliary` varchar(230) DEFAULT NULL COMMENT '辅助检查内容',
  `actual` varchar(230) DEFAULT NULL COMMENT '实际检查内容',
  `using` varchar(230) DEFAULT NULL COMMENT '正在使用药物',
  `diagnosis` varchar(230) DEFAULT NULL COMMENT '本次诊断结果',
  `treatment` varchar(230) DEFAULT NULL COMMENT '治疗处方',
  `taboo` varchar(230) DEFAULT NULL COMMENT '紧急事项',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of e_medical
-- ----------------------------

-- ----------------------------
-- Table structure for e_record
-- ----------------------------
DROP TABLE IF EXISTS `e_record`;
CREATE TABLE `e_record` (
  `id` varchar(32) NOT NULL COMMENT '体检记录表--主键',
  `medical` varchar(32) DEFAULT NULL COMMENT '体检医院',
  `examinationtime` timestamp NULL DEFAULT NULL COMMENT '体检时间',
  `nexttime` timestamp NULL DEFAULT NULL COMMENT '下次体检时间',
  `elderly_id` varchar(32) DEFAULT NULL COMMENT '关联老人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of e_record
-- ----------------------------

-- ----------------------------
-- Table structure for e_recordinfo
-- ----------------------------
DROP TABLE IF EXISTS `e_recordinfo`;
CREATE TABLE `e_recordinfo` (
  `id` varchar(32) NOT NULL COMMENT '体检记录信息表--主键',
  `reid` varchar(32) DEFAULT NULL COMMENT '关联体检记录表',
  `project` varchar(32) DEFAULT NULL COMMENT '体检项目',
  `projectval` varchar(32) DEFAULT NULL COMMENT '体检值',
  `Inspection` varchar(32) DEFAULT NULL COMMENT '检查结果',
  `analysis` varchar(32) DEFAULT NULL COMMENT '结果分析',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of e_recordinfo
-- ----------------------------

-- ----------------------------
-- Table structure for p_payserver
-- ----------------------------
DROP TABLE IF EXISTS `p_payserver`;
CREATE TABLE `p_payserver` (
  `id` varchar(32) NOT NULL,
  `temmadeooff` varchar(50) NOT NULL COMMENT '服务商定制模板开关0：淡紫 1：红火 2：雅绿 3：定制',
  `comrec` varchar(50) NOT NULL COMMENT '服务商商品推荐点数',
  `storerec` varchar(100) NOT NULL COMMENT '服务商店铺推荐点数',
  `helper` varchar(100) NOT NULL COMMENT '服务商帮手开关',
  `potential` varchar(100) NOT NULL COMMENT '服务商潜在推荐点数',
  `p_id` varchar(100) NOT NULL COMMENT '服务商ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of p_payserver
-- ----------------------------

-- ----------------------------
-- Table structure for p_proserver
-- ----------------------------
DROP TABLE IF EXISTS `p_proserver`;
CREATE TABLE `p_proserver` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '服务商名称',
  `phone` varchar(50) NOT NULL COMMENT '服务商联系电话',
  `contacts` varchar(100) NOT NULL COMMENT '服务商联系人',
  `address` varchar(100) NOT NULL COMMENT '服务商联系地址',
  `owned` varchar(100) NOT NULL COMMENT '关联服务商服务行业owned_type',
  `level` varchar(100) NOT NULL COMMENT '服务商级别',
  `integral` varchar(100) NOT NULL COMMENT '服务商积分',
  `core` varchar(100) NOT NULL COMMENT '服务商主营',
  `brief` varchar(100) NOT NULL COMMENT '服务商简介',
  `bond` decimal(10,0) NOT NULL COMMENT '服务商保证金余额',
  `money` decimal(10,0) NOT NULL COMMENT '服务商余额',
  `off_type` varchar(1) NOT NULL COMMENT '是否有效',
  `settime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `audit` int(20) NOT NULL COMMENT '服务商审核次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of p_proserver
-- ----------------------------

-- ----------------------------
-- Table structure for p_sercart
-- ----------------------------
DROP TABLE IF EXISTS `p_sercart`;
CREATE TABLE `p_sercart` (
  `id` varchar(32) NOT NULL,
  `pro_id` varchar(32) DEFAULT NULL COMMENT '产品ID',
  `server_id` varchar(32) DEFAULT NULL COMMENT '服务商ID',
  `off_type` varchar(1) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of p_sercart
-- ----------------------------

-- ----------------------------
-- Table structure for p_serorder
-- ----------------------------
DROP TABLE IF EXISTS `p_serorder`;
CREATE TABLE `p_serorder` (
  `id` varchar(32) NOT NULL,
  `pro_id` varchar(32) NOT NULL COMMENT '产品ID',
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '下单时间',
  `price` decimal(30,0) NOT NULL COMMENT '价格',
  `servetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '约定服务时间',
  `username` varchar(30) NOT NULL COMMENT '约定服务人',
  `place` varchar(100) NOT NULL COMMENT '服务地址',
  `strtus` varchar(1) NOT NULL COMMENT '服务状态0：未支付1：已支付2：已服务',
  `user_id` varchar(32) NOT NULL COMMENT '下单账号',
  `staff` varchar(50) NOT NULL COMMENT '约定服务人员',
  `off_type` varchar(1) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of p_serorder
-- ----------------------------

-- ----------------------------
-- Table structure for p_serverinfo
-- ----------------------------
DROP TABLE IF EXISTS `p_serverinfo`;
CREATE TABLE `p_serverinfo` (
  `id` varchar(32) NOT NULL,
  `p_id` varchar(50) NOT NULL COMMENT '关联服务商信息表ID',
  `p_qcn` varchar(50) NOT NULL COMMENT '服务商组织代码号',
  `p_license` varchar(100) NOT NULL COMMENT '服务商营业执照',
  `p_corporate` varchar(50) NOT NULL COMMENT '服务商法人资料',
  `p_storemap` varchar(100) NOT NULL COMMENT '服务商实体图片',
  `p_Industry` varchar(100) NOT NULL COMMENT '服务商行业资料',
  `p_suppl` varchar(100) NOT NULL COMMENT '服务商其他资料',
  `off_type` varchar(1) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of p_serverinfo
-- ----------------------------

-- ----------------------------
-- Table structure for p_serverpro
-- ----------------------------
DROP TABLE IF EXISTS `p_serverpro`;
CREATE TABLE `p_serverpro` (
  `id` varchar(32) NOT NULL,
  `p_id` varchar(32) NOT NULL COMMENT '关联服务商ID',
  `p_proname` varchar(50) NOT NULL COMMENT '服务商产品名称',
  `p_proprice` decimal(10,0) NOT NULL COMMENT '服务商产品价格',
  `p_protime` varchar(20) NOT NULL COMMENT '服务商服务时间',
  `p_region` varchar(100) NOT NULL COMMENT '服务商服务区域',
  `p_related` varchar(100) NOT NULL COMMENT '服务商相关产品，用，号间隔',
  `p_recomm` varchar(100) NOT NULL COMMENT '服务商产品推广开关',
  `p_storerec` varchar(255) NOT NULL COMMENT '服务商店铺推广开关',
  `p_potential` varchar(255) NOT NULL COMMENT '服务商潜在客户开关',
  `p_buildtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '服务商上架时间',
  `p_shelftime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '服务商下架时间',
  `p_sernumber` int(10) NOT NULL COMMENT '服务人数',
  `p_trade` varchar(32) NOT NULL COMMENT '服务类型关联服务类型表',
  `off_type` varchar(1) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of p_serverpro
-- ----------------------------

-- ----------------------------
-- Table structure for p_serverstaff
-- ----------------------------
DROP TABLE IF EXISTS `p_serverstaff`;
CREATE TABLE `p_serverstaff` (
  `id` varchar(32) NOT NULL,
  `p_id` varchar(32) NOT NULL COMMENT '关联服务商ID',
  `p_staffname` varchar(50) NOT NULL COMMENT '员工姓名',
  `p_staffsex` varchar(1) NOT NULL COMMENT '员工性别关联sex_type字典',
  `p_staffphone` varchar(11) DEFAULT NULL COMMENT '员工电话',
  `p_staffjsc` varchar(60) DEFAULT NULL COMMENT '员工从业资格照片',
  `p_staffhead` varchar(60) DEFAULT NULL COMMENT '员工照片',
  `p_advantage` varchar(32) DEFAULT NULL COMMENT '员工擅长',
  `p_trade` varchar(1) NOT NULL COMMENT '从服务类型表中选择',
  `p_idnumber` varchar(18) NOT NULL COMMENT '员工身份证号',
  `p_employee` varchar(30) NOT NULL COMMENT '员工工作证照片',
  `p_idimage` varchar(50) NOT NULL COMMENT '员工身份证照片',
  `p_years` int(10) NOT NULL COMMENT '员工工龄',
  `p_salary` decimal(10,0) NOT NULL COMMENT '员工底薪',
  `p_single` varchar(255) NOT NULL COMMENT '员工单次服务报酬',
  `off_type` varchar(1) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of p_serverstaff
-- ----------------------------

-- ----------------------------
-- Table structure for p_servertype
-- ----------------------------
DROP TABLE IF EXISTS `p_servertype`;
CREATE TABLE `p_servertype` (
  `id` varchar(32) NOT NULL,
  `p_id` varchar(32) NOT NULL COMMENT '服务商ID',
  `p_type` varchar(50) NOT NULL COMMENT '服务商类型名称',
  `off_type` varchar(1) NOT NULL COMMENT '类型开关',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of p_servertype
-- ----------------------------

-- ----------------------------
-- Table structure for t_account
-- ----------------------------
DROP TABLE IF EXISTS `t_account`;
CREATE TABLE `t_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `type` int(2) DEFAULT '1' COMMENT '用户类型，1普通用户，2，管理员',
  `status` int(2) DEFAULT '1' COMMENT '用户状态1正常，0被封',
  `info_id` bigint(20) DEFAULT NULL COMMENT '详细信息id',
  `qq_id` varchar(100) DEFAULT NULL,
  `sina_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `info_id` (`info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1226129137234234483 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_account
-- ----------------------------
INSERT INTO `t_account` VALUES ('888888', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1', '1', '888887', null, null);
INSERT INTO `t_account` VALUES ('1226129137234234482', 'test3', 'e10adc3949ba59abbe56e057f20f883e', '1', '1', '1226129137234234481', null, null);

-- ----------------------------
-- Table structure for t_account_role
-- ----------------------------
DROP TABLE IF EXISTS `t_account_role`;
CREATE TABLE `t_account_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `a_r_a` (`account_id`) USING BTREE,
  KEY `a_r_r` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_account_role
-- ----------------------------
INSERT INTO `t_account_role` VALUES ('2', '888888', '888888');
INSERT INTO `t_account_role` VALUES ('3', '888888', '888889');

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` varchar(32) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `sex` int(2) DEFAULT NULL,
  `id_card` varchar(20) DEFAULT NULL,
  `set_time` timestamp NULL DEFAULT NULL,
  `head` varchar(300) DEFAULT NULL COMMENT 'user head image',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1226129137234234481', 'test3', null, null, null, null, null, '2016-05-17 23:45:07', '/images/headImage/1463499946893_head.jpg');
INSERT INTO `t_admin` VALUES ('888887', 'Manager', '244556979@qq.com', '123456', '山东省 济南市 天桥区', '1', '37888820880808588X', '2015-04-24 14:59:12', '/images/headImage/1463825019924_head.jpg');

-- ----------------------------
-- Table structure for t_alipay
-- ----------------------------
DROP TABLE IF EXISTS `t_alipay`;
CREATE TABLE `t_alipay` (
  `id` varchar(32) NOT NULL COMMENT '系统支付宝主键',
  `partner` varchar(50) DEFAULT NULL COMMENT '合作者身份ID',
  `keywords` varchar(50) DEFAULT NULL COMMENT '商户私钥',
  `off_type` varchar(1) DEFAULT NULL COMMENT '有效状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_alipay
-- ----------------------------
INSERT INTO `t_alipay` VALUES ('3992505170006094213', '3', '3', '3');
INSERT INTO `t_alipay` VALUES ('5181394625587266534', 'e', 'e', 'e');
INSERT INTO `t_alipay` VALUES ('dd1', 'ddd', 'ddd', 'e');
INSERT INTO `t_alipay` VALUES ('dd2', 'ddd', 'ddd', 'e');
INSERT INTO `t_alipay` VALUES ('ddd', 'ddd', 'ddd', 'e');

-- ----------------------------
-- Table structure for t_appraise
-- ----------------------------
DROP TABLE IF EXISTS `t_appraise`;
CREATE TABLE `t_appraise` (
  `id` varchar(32) NOT NULL,
  `p_id` varchar(32) DEFAULT NULL COMMENT '评价的服务商id',
  `serorder_id` varchar(32) DEFAULT NULL COMMENT '关联 服务表id',
  `user_id` varchar(32) DEFAULT NULL COMMENT '评价用户的id',
  `appraise` varchar(255) DEFAULT NULL COMMENT '评价内容',
  `score` int(1) DEFAULT NULL COMMENT '打分 1-5',
  `integral` int(11) DEFAULT NULL COMMENT '打分获得的积分数',
  `time` timestamp NULL DEFAULT NULL COMMENT '评价时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_appraise
-- ----------------------------

-- ----------------------------
-- Table structure for t_city
-- ----------------------------
DROP TABLE IF EXISTS `t_city`;
CREATE TABLE `t_city` (
  `id` varchar(32) NOT NULL,
  `parent_id` varchar(32) DEFAULT '0' COMMENT '父id',
  `name` varchar(50) DEFAULT '' COMMENT '省市地区名称',
  `py` varchar(50) DEFAULT '' COMMENT '省市地区拼音',
  `code` varchar(6) DEFAULT '0' COMMENT '邮政编码',
  `type` int(1) DEFAULT '0' COMMENT '类型(0:国家;1:省份;2:城市;3:地区)',
  `special` int(1) DEFAULT '0' COMMENT '直辖市的标记(0:否;1:是)',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `area_type` (`type`) USING BTREE,
  KEY `py_name` (`py`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3370 DEFAULT CHARSET=utf8 COMMENT='地区信息';

-- ----------------------------
-- Records of t_city
-- ----------------------------
INSERT INTO `t_city` VALUES ('1', '0', '中国', 'zhongguo', '0', '0', '0');
INSERT INTO `t_city` VALUES ('2', '1', '北京', 'beijing', '0', '1', '0');
INSERT INTO `t_city` VALUES ('3', '2', '北京市', 'beijingshi', '0', '2', '1');
INSERT INTO `t_city` VALUES ('4', '3', '东城区', 'dongchengqu', '100011', '3', '0');
INSERT INTO `t_city` VALUES ('5', '3', '西城区', 'xichengqu', '100032', '3', '0');
INSERT INTO `t_city` VALUES ('6', '3', '崇文区', 'chongwenqu', '100061', '3', '0');
INSERT INTO `t_city` VALUES ('7', '3', '宣武区', 'xuanwuqu', '100054', '3', '0');
INSERT INTO `t_city` VALUES ('8', '3', '朝阳区', 'chaoyangqu', '100020', '3', '0');
INSERT INTO `t_city` VALUES ('9', '3', '丰台区', 'fengtaiqu', '100071', '3', '0');
INSERT INTO `t_city` VALUES ('10', '3', '石景山区', 'shijingshanqu', '100043', '3', '0');
INSERT INTO `t_city` VALUES ('11', '3', '海淀区', 'haidianqu', '100089', '3', '0');
INSERT INTO `t_city` VALUES ('12', '3', '门头沟区', 'mentougouqu', '102300', '3', '0');
INSERT INTO `t_city` VALUES ('13', '3', '房山区', 'fangshanqu', '102488', '3', '0');
INSERT INTO `t_city` VALUES ('14', '3', '通州区', 'tongzhouqu', '101100', '3', '0');
INSERT INTO `t_city` VALUES ('15', '3', '顺义区', 'shunyiqu', '101300', '3', '0');
INSERT INTO `t_city` VALUES ('16', '3', '昌平区', 'changpingqu', '102200', '3', '0');
INSERT INTO `t_city` VALUES ('17', '3', '大兴区', 'daxingqu', '102600', '3', '0');
INSERT INTO `t_city` VALUES ('18', '3', '怀柔区', 'huairouqu', '101400', '3', '0');
INSERT INTO `t_city` VALUES ('19', '3', '平谷区', 'pingguqu', '101200', '3', '0');
INSERT INTO `t_city` VALUES ('20', '3', '密云县', 'miyunxian', '101500', '3', '0');
INSERT INTO `t_city` VALUES ('21', '3', '延庆县', 'yanqingxian', '102100', '3', '0');
INSERT INTO `t_city` VALUES ('22', '1', '天津', 'tianjin', '0', '1', '0');
INSERT INTO `t_city` VALUES ('23', '22', '天津市', 'tianjinshi', '0', '2', '1');
INSERT INTO `t_city` VALUES ('24', '23', '和平区', 'hepingqu', '300041', '3', '0');
INSERT INTO `t_city` VALUES ('25', '23', '河东区', 'hedongqu', '300171', '3', '0');
INSERT INTO `t_city` VALUES ('26', '23', '河西区', 'hexiqu', '300202', '3', '0');
INSERT INTO `t_city` VALUES ('27', '23', '南开区', 'nankaiqu', '300100', '3', '0');
INSERT INTO `t_city` VALUES ('28', '23', '河北区', 'hebeiqu', '300143', '3', '0');
INSERT INTO `t_city` VALUES ('29', '23', '红桥区', 'hongqiaoqu', '300131', '3', '0');
INSERT INTO `t_city` VALUES ('30', '23', '塘沽区', 'tangguqu', '300450', '3', '0');
INSERT INTO `t_city` VALUES ('31', '23', '汉沽区', 'hanguqu', '300480', '3', '0');
INSERT INTO `t_city` VALUES ('32', '23', '大港区', 'dagangqu', '300270', '3', '0');
INSERT INTO `t_city` VALUES ('33', '23', '东丽区', 'dongliqu', '300300', '3', '0');
INSERT INTO `t_city` VALUES ('34', '23', '西青区', 'xiqingqu', '300380', '3', '0');
INSERT INTO `t_city` VALUES ('35', '23', '津南区', 'jinnanqu', '300350', '3', '0');
INSERT INTO `t_city` VALUES ('36', '23', '北辰区', 'beichenqu', '300400', '3', '0');
INSERT INTO `t_city` VALUES ('37', '23', '武清区', 'wuqingqu', '301700', '3', '0');
INSERT INTO `t_city` VALUES ('38', '23', '宝坻区', 'baoqu', '301800', '3', '0');
INSERT INTO `t_city` VALUES ('39', '23', '宁河县', 'ninghexian', '301500', '3', '0');
INSERT INTO `t_city` VALUES ('40', '23', '静海县', 'jinghaixian', '301600', '3', '0');
INSERT INTO `t_city` VALUES ('41', '23', '蓟县', 'jixian', '301900', '3', '0');
INSERT INTO `t_city` VALUES ('42', '23', '保税区', 'baoshuiqu', '300308', '3', '0');
INSERT INTO `t_city` VALUES ('43', '23', '经济技术开发区', 'jingjijishukaifaqu', '300457', '3', '0');
INSERT INTO `t_city` VALUES ('44', '23', '高新区', 'gaoxinqu', '300384', '3', '0');
INSERT INTO `t_city` VALUES ('45', '23', '滨海新区', 'binhaixinqu', '300457', '3', '0');
INSERT INTO `t_city` VALUES ('46', '1', '河北', 'hebei', '0', '1', '0');
INSERT INTO `t_city` VALUES ('47', '46', '石家庄市', 'shijiazhuangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('48', '47', '长安区', 'changanqu', '50011', '3', '0');
INSERT INTO `t_city` VALUES ('49', '47', '桥东区', 'qiaodongqu', '50011', '3', '0');
INSERT INTO `t_city` VALUES ('50', '47', '桥西区', 'qiaoxiqu', '50051', '3', '0');
INSERT INTO `t_city` VALUES ('51', '47', '新华区', 'xinhuaqu', '50051', '3', '0');
INSERT INTO `t_city` VALUES ('52', '47', '井陉矿区', 'jingkuangqu', '50100', '3', '0');
INSERT INTO `t_city` VALUES ('53', '47', '裕华区', 'yuhuaqu', '50081', '3', '0');
INSERT INTO `t_city` VALUES ('54', '47', '井陉县', 'jingxian', '50300', '3', '0');
INSERT INTO `t_city` VALUES ('55', '47', '正定县', 'zhengdingxian', '50800', '3', '0');
INSERT INTO `t_city` VALUES ('56', '47', '栾城县', 'chengxian', '51430', '3', '0');
INSERT INTO `t_city` VALUES ('57', '47', '行唐县', 'xingtangxian', '50600', '3', '0');
INSERT INTO `t_city` VALUES ('58', '47', '灵寿县', 'lingshouxian', '50500', '3', '0');
INSERT INTO `t_city` VALUES ('59', '47', '高邑县', 'gaoyixian', '51330', '3', '0');
INSERT INTO `t_city` VALUES ('60', '47', '深泽县', 'shenzexian', '52560', '3', '0');
INSERT INTO `t_city` VALUES ('61', '47', '赞皇县', 'zanhuangxian', '51230', '3', '0');
INSERT INTO `t_city` VALUES ('62', '47', '无极县', 'wujixian', '52400', '3', '0');
INSERT INTO `t_city` VALUES ('63', '47', '平山县', 'pingshanxian', '50400', '3', '0');
INSERT INTO `t_city` VALUES ('64', '47', '元氏县', 'yuanshixian', '51130', '3', '0');
INSERT INTO `t_city` VALUES ('65', '47', '赵县', 'zhaoxian', '51530', '3', '0');
INSERT INTO `t_city` VALUES ('66', '47', '辛集市', 'xinjishi', '52300', '3', '0');
INSERT INTO `t_city` VALUES ('67', '47', '藁城市', 'chengshi', '52160', '3', '0');
INSERT INTO `t_city` VALUES ('68', '47', '晋州市', 'jinzhoushi', '52200', '3', '0');
INSERT INTO `t_city` VALUES ('69', '47', '新乐市', 'xinleshi', '50700', '3', '0');
INSERT INTO `t_city` VALUES ('70', '47', '鹿泉市', 'luquanshi', '50200', '3', '0');
INSERT INTO `t_city` VALUES ('71', '47', '高新技术开发区', 'gaoxinjishukaifaqu', '50035', '3', '0');
INSERT INTO `t_city` VALUES ('72', '46', '唐山市', 'tangshanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('73', '72', '路南区', 'lunanqu', '63017', '3', '0');
INSERT INTO `t_city` VALUES ('74', '72', '路北区', 'lubeiqu', '63015', '3', '0');
INSERT INTO `t_city` VALUES ('75', '72', '古冶区', 'guyequ', '63104', '3', '0');
INSERT INTO `t_city` VALUES ('76', '72', '开平区', 'kaipingqu', '63021', '3', '0');
INSERT INTO `t_city` VALUES ('77', '72', '丰南区', 'fengnanqu', '63300', '3', '0');
INSERT INTO `t_city` VALUES ('78', '72', '丰润区', 'fengrunqu', '64000', '3', '0');
INSERT INTO `t_city` VALUES ('79', '72', '滦县', 'luanxian', '63700', '3', '0');
INSERT INTO `t_city` VALUES ('80', '72', '滦南县', 'luannanxian', '63500', '3', '0');
INSERT INTO `t_city` VALUES ('81', '72', '乐亭县', 'letingxian', '63600', '3', '0');
INSERT INTO `t_city` VALUES ('82', '72', '迁西县', 'qianxixian', '64300', '3', '0');
INSERT INTO `t_city` VALUES ('83', '72', '玉田县', 'yutianxian', '64100', '3', '0');
INSERT INTO `t_city` VALUES ('84', '72', '唐海县', 'tanghaixian', '63200', '3', '0');
INSERT INTO `t_city` VALUES ('85', '72', '遵化市', 'zunhuashi', '64200', '3', '0');
INSERT INTO `t_city` VALUES ('86', '72', '迁安市', 'qiananshi', '64400', '3', '0');
INSERT INTO `t_city` VALUES ('87', '72', '高新区', 'gaoxinqu', '63020', '3', '0');
INSERT INTO `t_city` VALUES ('88', '72', '汉沽管理区', 'hanguguanliqu', '301501', '3', '0');
INSERT INTO `t_city` VALUES ('89', '72', '海港开发区', 'haigangkaifaqu', '63600', '3', '0');
INSERT INTO `t_city` VALUES ('90', '72', '芦台开发区', 'lutaikaifaqu', '301501', '3', '0');
INSERT INTO `t_city` VALUES ('91', '72', '南堡开发区', 'nanbaokaifaqu', '63305', '3', '0');
INSERT INTO `t_city` VALUES ('92', '72', '曹妃甸工业区', 'caodiangongyequ', '63200', '3', '0');
INSERT INTO `t_city` VALUES ('93', '46', '秦皇岛市', 'qinhuangdaoshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('94', '93', '海港区', 'haigangqu', '66000', '3', '0');
INSERT INTO `t_city` VALUES ('95', '93', '山海关区', 'shanhaiguanqu', '66200', '3', '0');
INSERT INTO `t_city` VALUES ('96', '93', '北戴河区', 'beidaihequ', '66100', '3', '0');
INSERT INTO `t_city` VALUES ('97', '93', '青龙满族自治县', 'qinglongmanzuzizhixian', '66500', '3', '0');
INSERT INTO `t_city` VALUES ('98', '93', '昌黎县', 'changlixian', '66600', '3', '0');
INSERT INTO `t_city` VALUES ('99', '93', '抚宁县', 'funingxian', '66300', '3', '0');
INSERT INTO `t_city` VALUES ('100', '93', '卢龙县', 'lulongxian', '66400', '3', '0');
INSERT INTO `t_city` VALUES ('101', '93', '经济技术开发区', 'jingjijishukaifaqu', '66004', '3', '0');
INSERT INTO `t_city` VALUES ('102', '46', '邯郸市', 'handanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('103', '102', '邯山区', 'hanshanqu', '56001', '3', '0');
INSERT INTO `t_city` VALUES ('104', '102', '丛台区', 'congtaiqu', '56004', '3', '0');
INSERT INTO `t_city` VALUES ('105', '102', '复兴区', 'fuxingqu', '56003', '3', '0');
INSERT INTO `t_city` VALUES ('106', '102', '峰峰矿区', 'fengfengkuangqu', '56200', '3', '0');
INSERT INTO `t_city` VALUES ('107', '102', '邯郸县', 'handanxian', '56100', '3', '0');
INSERT INTO `t_city` VALUES ('108', '102', '临漳县', 'linzhangxian', '56600', '3', '0');
INSERT INTO `t_city` VALUES ('109', '102', '成安县', 'chenganxian', '56700', '3', '0');
INSERT INTO `t_city` VALUES ('110', '102', '大名县', 'damingxian', '56900', '3', '0');
INSERT INTO `t_city` VALUES ('111', '102', '涉县', 'shexian', '56400', '3', '0');
INSERT INTO `t_city` VALUES ('112', '102', '磁县', 'cixian', '56500', '3', '0');
INSERT INTO `t_city` VALUES ('113', '102', '肥乡县', 'feixiangxian', '57550', '3', '0');
INSERT INTO `t_city` VALUES ('114', '102', '永年县', 'yongnianxian', '57150', '3', '0');
INSERT INTO `t_city` VALUES ('115', '102', '邱县', 'qiuxian', '57450', '3', '0');
INSERT INTO `t_city` VALUES ('116', '102', '鸡泽县', 'jizexian', '57350', '3', '0');
INSERT INTO `t_city` VALUES ('117', '102', '广平县', 'guangpingxian', '57650', '3', '0');
INSERT INTO `t_city` VALUES ('118', '102', '馆陶县', 'guantaoxian', '57750', '3', '0');
INSERT INTO `t_city` VALUES ('119', '102', '魏县', 'weixian', '56800', '3', '0');
INSERT INTO `t_city` VALUES ('120', '102', '曲周县', 'quzhouxian', '57250', '3', '0');
INSERT INTO `t_city` VALUES ('121', '102', '武安市', 'wuanshi', '56300', '3', '0');
INSERT INTO `t_city` VALUES ('122', '102', '经济开发区', 'jingjikaifaqu', '56002', '3', '0');
INSERT INTO `t_city` VALUES ('123', '46', '邢台市', 'xingtaishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('124', '123', '桥东区', 'qiaodongqu', '54001', '3', '0');
INSERT INTO `t_city` VALUES ('125', '123', '桥西区', 'qiaoxiqu', '54000', '3', '0');
INSERT INTO `t_city` VALUES ('126', '123', '邢台县', 'xingtaixian', '54001', '3', '0');
INSERT INTO `t_city` VALUES ('127', '123', '临城县', 'linchengxian', '54300', '3', '0');
INSERT INTO `t_city` VALUES ('128', '123', '内丘县', 'neiqiuxian', '54200', '3', '0');
INSERT INTO `t_city` VALUES ('129', '123', '柏乡县', 'baixiangxian', '55450', '3', '0');
INSERT INTO `t_city` VALUES ('130', '123', '隆尧县', 'longyaoxian', '55350', '3', '0');
INSERT INTO `t_city` VALUES ('131', '123', '任县', 'renxian', '55150', '3', '0');
INSERT INTO `t_city` VALUES ('132', '123', '南和县', 'nanhexian', '54400', '3', '0');
INSERT INTO `t_city` VALUES ('133', '123', '宁晋县', 'ningjinxian', '55550', '3', '0');
INSERT INTO `t_city` VALUES ('134', '123', '巨鹿县', 'juluxian', '55250', '3', '0');
INSERT INTO `t_city` VALUES ('135', '123', '新河县', 'xinhexian', '51730', '3', '0');
INSERT INTO `t_city` VALUES ('136', '123', '广宗县', 'guangzongxian', '54600', '3', '0');
INSERT INTO `t_city` VALUES ('137', '123', '平乡县', 'pingxiangxian', '54500', '3', '0');
INSERT INTO `t_city` VALUES ('138', '123', '威县', 'weixian', '54700', '3', '0');
INSERT INTO `t_city` VALUES ('139', '123', '清河县', 'qinghexian', '54800', '3', '0');
INSERT INTO `t_city` VALUES ('140', '123', '临西县', 'linxixian', '54900', '3', '0');
INSERT INTO `t_city` VALUES ('141', '123', '南宫市', 'nangongshi', '55750', '3', '0');
INSERT INTO `t_city` VALUES ('142', '123', '沙河市', 'shaheshi', '54100', '3', '0');
INSERT INTO `t_city` VALUES ('143', '46', '保定市', 'baodingshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('144', '143', '新市区', 'xinshiqu', '71052', '3', '0');
INSERT INTO `t_city` VALUES ('145', '143', '南市区', 'nanshiqu', '71000', '3', '0');
INSERT INTO `t_city` VALUES ('146', '143', '北市区', 'beishiqu', '71000', '3', '0');
INSERT INTO `t_city` VALUES ('147', '143', '满城县', 'manchengxian', '72150', '3', '0');
INSERT INTO `t_city` VALUES ('148', '143', '清苑县', 'qingyuanxian', '71100', '3', '0');
INSERT INTO `t_city` VALUES ('149', '143', '涞水县', 'shuixian', '74100', '3', '0');
INSERT INTO `t_city` VALUES ('150', '143', '阜平县', 'fupingxian', '73200', '3', '0');
INSERT INTO `t_city` VALUES ('151', '143', '徐水县', 'xushuixian', '72550', '3', '0');
INSERT INTO `t_city` VALUES ('152', '143', '定兴县', 'dingxingxian', '72650', '3', '0');
INSERT INTO `t_city` VALUES ('153', '143', '唐县', 'tangxian', '72350', '3', '0');
INSERT INTO `t_city` VALUES ('154', '143', '高阳县', 'gaoyangxian', '71500', '3', '0');
INSERT INTO `t_city` VALUES ('155', '143', '容城县', 'rongchengxian', '71700', '3', '0');
INSERT INTO `t_city` VALUES ('156', '143', '涞源县', 'yuanxian', '74300', '3', '0');
INSERT INTO `t_city` VALUES ('157', '143', '望都县', 'wangduxian', '72450', '3', '0');
INSERT INTO `t_city` VALUES ('158', '143', '安新县', 'anxinxian', '71600', '3', '0');
INSERT INTO `t_city` VALUES ('159', '143', '易县', 'yixian', '74200', '3', '0');
INSERT INTO `t_city` VALUES ('160', '143', '曲阳县', 'quyangxian', '73100', '3', '0');
INSERT INTO `t_city` VALUES ('161', '143', '蠡县', 'xian', '71400', '3', '0');
INSERT INTO `t_city` VALUES ('162', '143', '顺平县', 'shunpingxian', '72250', '3', '0');
INSERT INTO `t_city` VALUES ('163', '143', '博野县', 'boyexian', '71300', '3', '0');
INSERT INTO `t_city` VALUES ('164', '143', '雄县', 'xiongxian', '71800', '3', '0');
INSERT INTO `t_city` VALUES ('165', '143', '涿州市', 'zhoushi', '72750', '3', '0');
INSERT INTO `t_city` VALUES ('166', '143', '定州市', 'dingzhoushi', '73000', '3', '0');
INSERT INTO `t_city` VALUES ('167', '143', '安国市', 'anguoshi', '71200', '3', '0');
INSERT INTO `t_city` VALUES ('168', '143', '高碑店市', 'gaobeidianshi', '74000', '3', '0');
INSERT INTO `t_city` VALUES ('169', '46', '张家口市', 'zhangjiakoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('170', '169', '桥东区', 'qiaodongqu', '75000', '3', '0');
INSERT INTO `t_city` VALUES ('171', '169', '桥西区', 'qiaoxiqu', '75061', '3', '0');
INSERT INTO `t_city` VALUES ('172', '169', '宣化区', 'xuanhuaqu', '75100', '3', '0');
INSERT INTO `t_city` VALUES ('173', '169', '下花园区', 'xiahuayuanqu', '75300', '3', '0');
INSERT INTO `t_city` VALUES ('174', '169', '宣化县', 'xuanhuaxian', '75100', '3', '0');
INSERT INTO `t_city` VALUES ('175', '169', '张北县', 'zhangbeixian', '76450', '3', '0');
INSERT INTO `t_city` VALUES ('176', '169', '康保县', 'kangbaoxian', '76650', '3', '0');
INSERT INTO `t_city` VALUES ('177', '169', '沽源县', 'guyuanxian', '76550', '3', '0');
INSERT INTO `t_city` VALUES ('178', '169', '尚义县', 'shangyixian', '76750', '3', '0');
INSERT INTO `t_city` VALUES ('179', '169', '蔚县', 'weixian', '75700', '3', '0');
INSERT INTO `t_city` VALUES ('180', '169', '阳原县', 'yangyuanxian', '75800', '3', '0');
INSERT INTO `t_city` VALUES ('181', '169', '怀安县', 'huaianxian', '76150', '3', '0');
INSERT INTO `t_city` VALUES ('182', '169', '万全县', 'wanquanxian', '76250', '3', '0');
INSERT INTO `t_city` VALUES ('183', '169', '怀来县', 'huailaixian', '75400', '3', '0');
INSERT INTO `t_city` VALUES ('184', '169', '涿鹿县', 'luxian', '75600', '3', '0');
INSERT INTO `t_city` VALUES ('185', '169', '赤城县', 'chichengxian', '75500', '3', '0');
INSERT INTO `t_city` VALUES ('186', '169', '崇礼县', 'chonglixian', '76350', '3', '0');
INSERT INTO `t_city` VALUES ('187', '46', '承德市', 'chengdeshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('188', '187', '双桥区', 'shuangqiaoqu', '67000', '3', '0');
INSERT INTO `t_city` VALUES ('189', '187', '双滦区', 'shuangluanqu', '67000', '3', '0');
INSERT INTO `t_city` VALUES ('190', '187', '鹰手营子矿区', 'yingshouyingzikuangqu', '67200', '3', '0');
INSERT INTO `t_city` VALUES ('191', '187', '承德县', 'chengdexian', '67400', '3', '0');
INSERT INTO `t_city` VALUES ('192', '187', '兴隆县', 'xinglongxian', '67300', '3', '0');
INSERT INTO `t_city` VALUES ('193', '187', '平泉县', 'pingquanxian', '67500', '3', '0');
INSERT INTO `t_city` VALUES ('194', '187', '滦平县', 'luanpingxian', '68250', '3', '0');
INSERT INTO `t_city` VALUES ('195', '187', '隆化县', 'longhuaxian', '68150', '3', '0');
INSERT INTO `t_city` VALUES ('196', '187', '丰宁满族自治县', 'fengningmanzuzizhixian', '68350', '3', '0');
INSERT INTO `t_city` VALUES ('197', '187', '宽城满族自治县', 'kuanchengmanzuzizhixian', '67600', '3', '0');
INSERT INTO `t_city` VALUES ('198', '187', '围场满族蒙古族自治县', 'weichangmanzumengguzuzizhixian', '68450', '3', '0');
INSERT INTO `t_city` VALUES ('199', '46', '沧州市', 'cangzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('200', '199', '新华区', 'xinhuaqu', '61000', '3', '0');
INSERT INTO `t_city` VALUES ('201', '199', '运河区', 'yunhequ', '61000', '3', '0');
INSERT INTO `t_city` VALUES ('202', '199', '沧县', 'cangxian', '61000', '3', '0');
INSERT INTO `t_city` VALUES ('203', '199', '青县', 'qingxian', '62650', '3', '0');
INSERT INTO `t_city` VALUES ('204', '199', '东光县', 'dongguangxian', '61600', '3', '0');
INSERT INTO `t_city` VALUES ('205', '199', '海兴县', 'haixingxian', '61200', '3', '0');
INSERT INTO `t_city` VALUES ('206', '199', '盐山县', 'yanshanxian', '61300', '3', '0');
INSERT INTO `t_city` VALUES ('207', '199', '肃宁县', 'suningxian', '62350', '3', '0');
INSERT INTO `t_city` VALUES ('208', '199', '南皮县', 'nanpixian', '61500', '3', '0');
INSERT INTO `t_city` VALUES ('209', '199', '吴桥县', 'wuqiaoxian', '61800', '3', '0');
INSERT INTO `t_city` VALUES ('210', '199', '献县', 'xianxian', '62250', '3', '0');
INSERT INTO `t_city` VALUES ('211', '199', '孟村回族自治县', 'mengcunhuizuzizhixian', '61400', '3', '0');
INSERT INTO `t_city` VALUES ('212', '199', '泊头市', 'botoushi', '62150', '3', '0');
INSERT INTO `t_city` VALUES ('213', '199', '任丘市', 'renqiushi', '62550', '3', '0');
INSERT INTO `t_city` VALUES ('214', '199', '黄骅市', 'huangshi', '61100', '3', '0');
INSERT INTO `t_city` VALUES ('215', '199', '河间市', 'hejianshi', '62450', '3', '0');
INSERT INTO `t_city` VALUES ('216', '46', '廊坊市', 'langfangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('217', '216', '安次区', 'anciqu', '65000', '3', '0');
INSERT INTO `t_city` VALUES ('218', '216', '广阳区', 'guangyangqu', '65000', '3', '0');
INSERT INTO `t_city` VALUES ('219', '216', '固安县', 'guanxian', '65500', '3', '0');
INSERT INTO `t_city` VALUES ('220', '216', '永清县', 'yongqingxian', '65600', '3', '0');
INSERT INTO `t_city` VALUES ('221', '216', '香河县', 'xianghexian', '65400', '3', '0');
INSERT INTO `t_city` VALUES ('222', '216', '大城县', 'dachengxian', '65900', '3', '0');
INSERT INTO `t_city` VALUES ('223', '216', '文安县', 'wenanxian', '65800', '3', '0');
INSERT INTO `t_city` VALUES ('224', '216', '大厂回族自治县', 'dachanghuizuzizhixian', '65300', '3', '0');
INSERT INTO `t_city` VALUES ('225', '216', '霸州市', 'bazhoushi', '65700', '3', '0');
INSERT INTO `t_city` VALUES ('226', '216', '三河市', 'sanheshi', '65200', '3', '0');
INSERT INTO `t_city` VALUES ('227', '216', '开发区', 'kaifaqu', '65001', '3', '0');
INSERT INTO `t_city` VALUES ('228', '46', '衡水市', 'hengshuishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('229', '228', '桃城区', 'taochengqu', '53000', '3', '0');
INSERT INTO `t_city` VALUES ('230', '228', '枣强县', 'zaoqiangxian', '53100', '3', '0');
INSERT INTO `t_city` VALUES ('231', '228', '武邑县', 'wuyixian', '53400', '3', '0');
INSERT INTO `t_city` VALUES ('232', '228', '武强县', 'wuqiangxian', '53300', '3', '0');
INSERT INTO `t_city` VALUES ('233', '228', '饶阳县', 'raoyangxian', '53900', '3', '0');
INSERT INTO `t_city` VALUES ('234', '228', '安平县', 'anpingxian', '53600', '3', '0');
INSERT INTO `t_city` VALUES ('235', '228', '故城县', 'guchengxian', '253800', '3', '0');
INSERT INTO `t_city` VALUES ('236', '228', '景县', 'jingxian', '53500', '3', '0');
INSERT INTO `t_city` VALUES ('237', '228', '阜城县', 'fuchengxian', '53700', '3', '0');
INSERT INTO `t_city` VALUES ('238', '228', '冀州市', 'jizhoushi', '53200', '3', '0');
INSERT INTO `t_city` VALUES ('239', '228', '深州市', 'shenzhoushi', '53800', '3', '0');
INSERT INTO `t_city` VALUES ('240', '1', '山西', 'shanxi', '0', '1', '0');
INSERT INTO `t_city` VALUES ('241', '240', '太原市', 'taiyuanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('242', '241', '小店区', 'xiaodianqu', '30032', '3', '0');
INSERT INTO `t_city` VALUES ('243', '241', '迎泽区', 'yingzequ', '30024', '3', '0');
INSERT INTO `t_city` VALUES ('244', '241', '杏花岭区', 'xinghualingqu', '30001', '3', '0');
INSERT INTO `t_city` VALUES ('245', '241', '尖草坪区', 'jiancaopingqu', '30003', '3', '0');
INSERT INTO `t_city` VALUES ('246', '241', '万柏林区', 'wanbailinqu', '30027', '3', '0');
INSERT INTO `t_city` VALUES ('247', '241', '晋源区', 'jinyuanqu', '30025', '3', '0');
INSERT INTO `t_city` VALUES ('248', '241', '清徐县', 'qingxuxian', '30400', '3', '0');
INSERT INTO `t_city` VALUES ('249', '241', '阳曲县', 'yangquxian', '30100', '3', '0');
INSERT INTO `t_city` VALUES ('250', '241', '娄烦县', 'loufanxian', '30300', '3', '0');
INSERT INTO `t_city` VALUES ('251', '241', '古交市', 'gujiaoshi', '30200', '3', '0');
INSERT INTO `t_city` VALUES ('252', '240', '大同市', 'datongshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('253', '252', '城区', 'chengqu', '37008', '3', '0');
INSERT INTO `t_city` VALUES ('254', '252', '矿区', 'kuangqu', '37001', '3', '0');
INSERT INTO `t_city` VALUES ('255', '252', '南郊区', 'nanjiaoqu', '37001', '3', '0');
INSERT INTO `t_city` VALUES ('256', '252', '新荣区', 'xinrongqu', '37002', '3', '0');
INSERT INTO `t_city` VALUES ('257', '252', '阳高县', 'yanggaoxian', '38100', '3', '0');
INSERT INTO `t_city` VALUES ('258', '252', '天镇县', 'tianzhenxian', '38200', '3', '0');
INSERT INTO `t_city` VALUES ('259', '252', '广灵县', 'guanglingxian', '37500', '3', '0');
INSERT INTO `t_city` VALUES ('260', '252', '灵丘县', 'lingqiuxian', '34400', '3', '0');
INSERT INTO `t_city` VALUES ('261', '252', '浑源县', 'hunyuanxian', '37400', '3', '0');
INSERT INTO `t_city` VALUES ('262', '252', '左云县', 'zuoyunxian', '37100', '3', '0');
INSERT INTO `t_city` VALUES ('263', '252', '大同县', 'datongxian', '37300', '3', '0');
INSERT INTO `t_city` VALUES ('264', '240', '阳泉市', 'yangquanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('265', '264', '城区', 'chengqu', '45000', '3', '0');
INSERT INTO `t_city` VALUES ('266', '264', '矿区', 'kuangqu', '45000', '3', '0');
INSERT INTO `t_city` VALUES ('267', '264', '郊区', 'jiaoqu', '45011', '3', '0');
INSERT INTO `t_city` VALUES ('268', '264', '平定县', 'pingdingxian', '45200', '3', '0');
INSERT INTO `t_city` VALUES ('269', '264', '盂县', 'yuxian', '45100', '3', '0');
INSERT INTO `t_city` VALUES ('270', '240', '长治市', 'changzhishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('271', '270', '城区', 'chengqu', '46011', '3', '0');
INSERT INTO `t_city` VALUES ('272', '270', '郊区', 'jiaoqu', '46011', '3', '0');
INSERT INTO `t_city` VALUES ('273', '270', '长治县', 'changzhixian', '47100', '3', '0');
INSERT INTO `t_city` VALUES ('274', '270', '襄垣县', 'xiangyuanxian', '46200', '3', '0');
INSERT INTO `t_city` VALUES ('275', '270', '屯留县', 'tunliuxian', '46100', '3', '0');
INSERT INTO `t_city` VALUES ('276', '270', '平顺县', 'pingshunxian', '47400', '3', '0');
INSERT INTO `t_city` VALUES ('277', '270', '黎城县', 'lichengxian', '47600', '3', '0');
INSERT INTO `t_city` VALUES ('278', '270', '壶关县', 'huguanxian', '47300', '3', '0');
INSERT INTO `t_city` VALUES ('279', '270', '长子县', 'changzixian', '46600', '3', '0');
INSERT INTO `t_city` VALUES ('280', '270', '武乡县', 'wuxiangxian', '46300', '3', '0');
INSERT INTO `t_city` VALUES ('281', '270', '沁县', 'qinxian', '46400', '3', '0');
INSERT INTO `t_city` VALUES ('282', '270', '沁源县', 'qinyuanxian', '46500', '3', '0');
INSERT INTO `t_city` VALUES ('283', '270', '潞城市', 'luchengshi', '47500', '3', '0');
INSERT INTO `t_city` VALUES ('284', '240', '晋城市', 'jinchengshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('285', '284', '城区', 'chengqu', '48000', '3', '0');
INSERT INTO `t_city` VALUES ('286', '284', '沁水县', 'qinshuixian', '48200', '3', '0');
INSERT INTO `t_city` VALUES ('287', '284', '阳城县', 'yangchengxian', '48100', '3', '0');
INSERT INTO `t_city` VALUES ('288', '284', '陵川县', 'lingchuanxian', '48300', '3', '0');
INSERT INTO `t_city` VALUES ('289', '284', '泽州县', 'zezhouxian', '48012', '3', '0');
INSERT INTO `t_city` VALUES ('290', '284', '高平市', 'gaopingshi', '48400', '3', '0');
INSERT INTO `t_city` VALUES ('291', '240', '朔州市', 'shuozhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('292', '291', '朔城区', 'shuochengqu', '38500', '3', '0');
INSERT INTO `t_city` VALUES ('293', '291', '平鲁区', 'pingluqu', '38600', '3', '0');
INSERT INTO `t_city` VALUES ('294', '291', '山阴县', 'shanyinxian', '36900', '3', '0');
INSERT INTO `t_city` VALUES ('295', '291', '应县', 'yingxian', '37600', '3', '0');
INSERT INTO `t_city` VALUES ('296', '291', '右玉县', 'youyuxian', '37200', '3', '0');
INSERT INTO `t_city` VALUES ('297', '291', '怀仁县', 'huairenxian', '38300', '3', '0');
INSERT INTO `t_city` VALUES ('298', '240', '晋中市', 'jinzhongshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('299', '298', '榆次区', 'yuciqu', '30600', '3', '0');
INSERT INTO `t_city` VALUES ('300', '298', '榆社县', 'yushexian', '31800', '3', '0');
INSERT INTO `t_city` VALUES ('301', '298', '左权县', 'zuoquanxian', '32600', '3', '0');
INSERT INTO `t_city` VALUES ('302', '298', '和顺县', 'heshunxian', '32700', '3', '0');
INSERT INTO `t_city` VALUES ('303', '298', '昔阳县', 'xiyangxian', '45300', '3', '0');
INSERT INTO `t_city` VALUES ('304', '298', '寿阳县', 'shouyangxian', '45400', '3', '0');
INSERT INTO `t_city` VALUES ('305', '298', '太谷县', 'taiguxian', '30800', '3', '0');
INSERT INTO `t_city` VALUES ('306', '298', '祁县', 'qixian', '30900', '3', '0');
INSERT INTO `t_city` VALUES ('307', '298', '平遥县', 'pingyaoxian', '31100', '3', '0');
INSERT INTO `t_city` VALUES ('308', '298', '灵石县', 'lingshixian', '31300', '3', '0');
INSERT INTO `t_city` VALUES ('309', '298', '介休市', 'jiexiushi', '31200', '3', '0');
INSERT INTO `t_city` VALUES ('310', '240', '运城市', 'yunchengshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('311', '310', '盐湖区', 'yanhuqu', '44000', '3', '0');
INSERT INTO `t_city` VALUES ('312', '310', '临猗县', 'linxian', '44100', '3', '0');
INSERT INTO `t_city` VALUES ('313', '310', '万荣县', 'wanrongxian', '44200', '3', '0');
INSERT INTO `t_city` VALUES ('314', '310', '闻喜县', 'wenxixian', '43800', '3', '0');
INSERT INTO `t_city` VALUES ('315', '310', '稷山县', 'shanxian', '43200', '3', '0');
INSERT INTO `t_city` VALUES ('316', '310', '新绛县', 'xinxian', '43100', '3', '0');
INSERT INTO `t_city` VALUES ('317', '310', '绛县', 'xian', '43600', '3', '0');
INSERT INTO `t_city` VALUES ('318', '310', '垣曲县', 'yuanquxian', '43700', '3', '0');
INSERT INTO `t_city` VALUES ('319', '310', '夏县', 'xiaxian', '44400', '3', '0');
INSERT INTO `t_city` VALUES ('320', '310', '平陆县', 'pingluxian', '44300', '3', '0');
INSERT INTO `t_city` VALUES ('321', '310', '芮城县', 'chengxian', '44600', '3', '0');
INSERT INTO `t_city` VALUES ('322', '310', '永济市', 'yongjishi', '44500', '3', '0');
INSERT INTO `t_city` VALUES ('323', '310', '河津市', 'hejinshi', '43300', '3', '0');
INSERT INTO `t_city` VALUES ('324', '240', '忻州市', 'xinzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('325', '324', '忻府区', 'xinfuqu', '34000', '3', '0');
INSERT INTO `t_city` VALUES ('326', '324', '定襄县', 'dingxiangxian', '35400', '3', '0');
INSERT INTO `t_city` VALUES ('327', '324', '五台县', 'wutaixian', '35500', '3', '0');
INSERT INTO `t_city` VALUES ('328', '324', '代县', 'daixian', '34200', '3', '0');
INSERT INTO `t_city` VALUES ('329', '324', '繁峙县', 'fanzhixian', '34300', '3', '0');
INSERT INTO `t_city` VALUES ('330', '324', '宁武县', 'ningwuxian', '36700', '3', '0');
INSERT INTO `t_city` VALUES ('331', '324', '静乐县', 'jinglexian', '35100', '3', '0');
INSERT INTO `t_city` VALUES ('332', '324', '神池县', 'shenchixian', '36100', '3', '0');
INSERT INTO `t_city` VALUES ('333', '324', '五寨县', 'wuzhaixian', '36200', '3', '0');
INSERT INTO `t_city` VALUES ('334', '324', '岢岚县', 'xian', '36300', '3', '0');
INSERT INTO `t_city` VALUES ('335', '324', '河曲县', 'hequxian', '36500', '3', '0');
INSERT INTO `t_city` VALUES ('336', '324', '保德县', 'baodexian', '36600', '3', '0');
INSERT INTO `t_city` VALUES ('337', '324', '偏关县', 'pianguanxian', '36400', '3', '0');
INSERT INTO `t_city` VALUES ('338', '324', '原平市', 'yuanpingshi', '34100', '3', '0');
INSERT INTO `t_city` VALUES ('339', '240', '临汾市', 'linfenshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('340', '339', '尧都区', 'yaoduqu', '41000', '3', '0');
INSERT INTO `t_city` VALUES ('341', '339', '曲沃县', 'quwoxian', '43400', '3', '0');
INSERT INTO `t_city` VALUES ('342', '339', '翼城县', 'yichengxian', '43500', '3', '0');
INSERT INTO `t_city` VALUES ('343', '339', '襄汾县', 'xiangfenxian', '41500', '3', '0');
INSERT INTO `t_city` VALUES ('344', '339', '洪洞县', 'hongdongxian', '31600', '3', '0');
INSERT INTO `t_city` VALUES ('345', '339', '古县', 'guxian', '42400', '3', '0');
INSERT INTO `t_city` VALUES ('346', '339', '安泽县', 'anzexian', '42500', '3', '0');
INSERT INTO `t_city` VALUES ('347', '339', '浮山县', 'fushanxian', '42600', '3', '0');
INSERT INTO `t_city` VALUES ('348', '339', '吉县', 'jixian', '42200', '3', '0');
INSERT INTO `t_city` VALUES ('349', '339', '乡宁县', 'xiangningxian', '42100', '3', '0');
INSERT INTO `t_city` VALUES ('350', '339', '大宁县', 'daningxian', '42300', '3', '0');
INSERT INTO `t_city` VALUES ('351', '339', '隰县', 'xian', '41300', '3', '0');
INSERT INTO `t_city` VALUES ('352', '339', '永和县', 'yonghexian', '41400', '3', '0');
INSERT INTO `t_city` VALUES ('353', '339', '蒲县', 'puxian', '41200', '3', '0');
INSERT INTO `t_city` VALUES ('354', '339', '汾西县', 'fenxixian', '31500', '3', '0');
INSERT INTO `t_city` VALUES ('355', '339', '侯马市', 'houmashi', '43007', '3', '0');
INSERT INTO `t_city` VALUES ('356', '339', '霍州市', 'huozhoushi', '31400', '3', '0');
INSERT INTO `t_city` VALUES ('357', '240', '吕梁市', 'lvliangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('358', '357', '离石区', 'lishiqu', '33000', '3', '0');
INSERT INTO `t_city` VALUES ('359', '357', '文水县', 'wenshuixian', '32100', '3', '0');
INSERT INTO `t_city` VALUES ('360', '357', '交城县', 'jiaochengxian', '30500', '3', '0');
INSERT INTO `t_city` VALUES ('361', '357', '兴县', 'xingxian', '33600', '3', '0');
INSERT INTO `t_city` VALUES ('362', '357', '临县', 'linxian', '33200', '3', '0');
INSERT INTO `t_city` VALUES ('363', '357', '柳林县', 'liulinxian', '33300', '3', '0');
INSERT INTO `t_city` VALUES ('364', '357', '石楼县', 'shilouxian', '32500', '3', '0');
INSERT INTO `t_city` VALUES ('365', '357', '岚县', 'xian', '33500', '3', '0');
INSERT INTO `t_city` VALUES ('366', '357', '方山县', 'fangshanxian', '33100', '3', '0');
INSERT INTO `t_city` VALUES ('367', '357', '中阳县', 'zhongyangxian', '33400', '3', '0');
INSERT INTO `t_city` VALUES ('368', '357', '交口县', 'jiaokouxian', '32400', '3', '0');
INSERT INTO `t_city` VALUES ('369', '357', '孝义市', 'xiaoyishi', '32300', '3', '0');
INSERT INTO `t_city` VALUES ('370', '357', '汾阳市', 'fenyangshi', '32200', '3', '0');
INSERT INTO `t_city` VALUES ('371', '1', '内蒙古', 'neimenggu', '0', '1', '0');
INSERT INTO `t_city` VALUES ('372', '371', '呼和浩特市', 'huhehaoteshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('373', '372', '回民区', 'huiminqu', '10030', '3', '0');
INSERT INTO `t_city` VALUES ('374', '372', '玉泉区', 'yuquanqu', '10020', '3', '0');
INSERT INTO `t_city` VALUES ('375', '372', '新城区', 'xinchengqu', '10030', '3', '0');
INSERT INTO `t_city` VALUES ('376', '372', '赛罕区', 'saihanqu', '10020', '3', '0');
INSERT INTO `t_city` VALUES ('377', '372', '土默特左旗', 'tumotezuoqi', '10100', '3', '0');
INSERT INTO `t_city` VALUES ('378', '372', '托克托县', 'tuoketuoxian', '10200', '3', '0');
INSERT INTO `t_city` VALUES ('379', '372', '和林格尔县', 'helingeerxian', '11500', '3', '0');
INSERT INTO `t_city` VALUES ('380', '372', '清水河县', 'qingshuihexian', '11600', '3', '0');
INSERT INTO `t_city` VALUES ('381', '372', '武川县', 'wuchuanxian', '11700', '3', '0');
INSERT INTO `t_city` VALUES ('382', '371', '包头市', 'baotoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('383', '382', '东河区', 'donghequ', '14040', '3', '0');
INSERT INTO `t_city` VALUES ('384', '382', '昆都仑区', 'kundulunqu', '14010', '3', '0');
INSERT INTO `t_city` VALUES ('385', '382', '青山区', 'qingshanqu', '14030', '3', '0');
INSERT INTO `t_city` VALUES ('386', '382', '石拐区', 'shiguaiqu', '14070', '3', '0');
INSERT INTO `t_city` VALUES ('387', '382', '白云矿区', 'baiyunkuangqu', '14080', '3', '0');
INSERT INTO `t_city` VALUES ('388', '382', '九原区', 'jiuyuanqu', '14060', '3', '0');
INSERT INTO `t_city` VALUES ('389', '382', '土默特右旗', 'tumoteyouqi', '14100', '3', '0');
INSERT INTO `t_city` VALUES ('390', '382', '固阳县', 'guyangxian', '14200', '3', '0');
INSERT INTO `t_city` VALUES ('391', '382', '达尔罕茂明安联合旗', 'daerhanmaominganlianheqi', '14500', '3', '0');
INSERT INTO `t_city` VALUES ('392', '371', '乌海市', 'wuhaishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('393', '392', '海勃湾区', 'haibowanqu', '16000', '3', '0');
INSERT INTO `t_city` VALUES ('394', '392', '海南区', 'hainanqu', '16030', '3', '0');
INSERT INTO `t_city` VALUES ('395', '392', '乌达区', 'wudaqu', '16040', '3', '0');
INSERT INTO `t_city` VALUES ('396', '371', '赤峰市', 'chifengshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('397', '396', '红山区', 'hongshanqu', '24020', '3', '0');
INSERT INTO `t_city` VALUES ('398', '396', '元宝山区', 'yuanbaoshanqu', '24076', '3', '0');
INSERT INTO `t_city` VALUES ('399', '396', '松山区', 'songshanqu', '24005', '3', '0');
INSERT INTO `t_city` VALUES ('400', '396', '阿鲁科尔沁旗', 'alukeerqinqi', '25550', '3', '0');
INSERT INTO `t_city` VALUES ('401', '396', '巴林左旗', 'balinzuoqi', '25450', '3', '0');
INSERT INTO `t_city` VALUES ('402', '396', '巴林右旗', 'balinyouqi', '25150', '3', '0');
INSERT INTO `t_city` VALUES ('403', '396', '林西县', 'linxixian', '25250', '3', '0');
INSERT INTO `t_city` VALUES ('404', '396', '克什克腾旗', 'keshiketengqi', '25350', '3', '0');
INSERT INTO `t_city` VALUES ('405', '396', '翁牛特旗', 'wengniuteqi', '24500', '3', '0');
INSERT INTO `t_city` VALUES ('406', '396', '喀喇沁旗', 'kalaqinqi', '24400', '3', '0');
INSERT INTO `t_city` VALUES ('407', '396', '宁城县', 'ningchengxian', '24200', '3', '0');
INSERT INTO `t_city` VALUES ('408', '396', '敖汉旗', 'aohanqi', '24300', '3', '0');
INSERT INTO `t_city` VALUES ('409', '396', '新城区', 'xinchengqu', '25350', '3', '0');
INSERT INTO `t_city` VALUES ('410', '371', '通辽市', 'tongliaoshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('411', '410', '科尔沁区', 'keerqinqu', '28000', '3', '0');
INSERT INTO `t_city` VALUES ('412', '410', '科尔沁左翼中旗', 'keerqinzuoyizhongqi', '29300', '3', '0');
INSERT INTO `t_city` VALUES ('413', '410', '科尔沁左翼后旗', 'keerqinzuoyihouqi', '28100', '3', '0');
INSERT INTO `t_city` VALUES ('414', '410', '开鲁县', 'kailuxian', '28400', '3', '0');
INSERT INTO `t_city` VALUES ('415', '410', '库伦旗', 'kulunqi', '28200', '3', '0');
INSERT INTO `t_city` VALUES ('416', '410', '奈曼旗', 'naimanqi', '28300', '3', '0');
INSERT INTO `t_city` VALUES ('417', '410', '扎鲁特旗', 'zhaluteqi', '29100', '3', '0');
INSERT INTO `t_city` VALUES ('418', '410', '霍林郭勒市', 'huolinguoleshi', '29200', '3', '0');
INSERT INTO `t_city` VALUES ('419', '371', '鄂尔多斯市', 'eerduosishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('420', '419', '东胜区', 'dongshengqu', '17000', '3', '0');
INSERT INTO `t_city` VALUES ('421', '419', '达拉特旗', 'dalateqi', '14300', '3', '0');
INSERT INTO `t_city` VALUES ('422', '419', '准格尔旗', 'zhungeerqi', '17100', '3', '0');
INSERT INTO `t_city` VALUES ('423', '419', '鄂托克前旗', 'etuokeqianqi', '16200', '3', '0');
INSERT INTO `t_city` VALUES ('424', '419', '鄂托克旗', 'etuokeqi', '16100', '3', '0');
INSERT INTO `t_city` VALUES ('425', '419', '杭锦旗', 'hangjinqi', '17400', '3', '0');
INSERT INTO `t_city` VALUES ('426', '419', '乌审旗', 'wushenqi', '17300', '3', '0');
INSERT INTO `t_city` VALUES ('427', '419', '伊金霍洛旗', 'yijinhuoluoqi', '17200', '3', '0');
INSERT INTO `t_city` VALUES ('428', '371', '呼伦贝尔市', 'hulunbeiershi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('429', '428', '海拉尔区', 'hailaerqu', '21000', '3', '0');
INSERT INTO `t_city` VALUES ('430', '428', '阿荣旗', 'arongqi', '162750', '3', '0');
INSERT INTO `t_city` VALUES ('431', '428', '莫力达瓦达斡尔族自治旗', 'molidawadawoerzuzizhiqi', '162850', '3', '0');
INSERT INTO `t_city` VALUES ('432', '428', '鄂伦春自治旗', 'elunchunzizhiqi', '165450', '3', '0');
INSERT INTO `t_city` VALUES ('433', '428', '鄂温克族自治旗', 'ewenkezuzizhiqi', '21100', '3', '0');
INSERT INTO `t_city` VALUES ('434', '428', '陈巴尔虎旗', 'chenbaerhuqi', '21500', '3', '0');
INSERT INTO `t_city` VALUES ('435', '428', '新巴尔虎左旗', 'xinbaerhuzuoqi', '21200', '3', '0');
INSERT INTO `t_city` VALUES ('436', '428', '新巴尔虎右旗', 'xinbaerhuyouqi', '21300', '3', '0');
INSERT INTO `t_city` VALUES ('437', '428', '满洲里市', 'manzhoulishi', '21400', '3', '0');
INSERT INTO `t_city` VALUES ('438', '428', '牙克石市', 'yakeshishi', '22150', '3', '0');
INSERT INTO `t_city` VALUES ('439', '428', '扎兰屯市', 'zhalantunshi', '162650', '3', '0');
INSERT INTO `t_city` VALUES ('440', '428', '额尔古纳市', 'eergunashi', '22250', '3', '0');
INSERT INTO `t_city` VALUES ('441', '428', '根河市', 'genheshi', '22350', '3', '0');
INSERT INTO `t_city` VALUES ('442', '371', '巴彦淖尔市', 'bayannaoershi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('443', '442', '临河区', 'linhequ', '15001', '3', '0');
INSERT INTO `t_city` VALUES ('444', '442', '五原县', 'wuyuanxian', '15100', '3', '0');
INSERT INTO `t_city` VALUES ('445', '442', '磴口县', 'kouxian', '15200', '3', '0');
INSERT INTO `t_city` VALUES ('446', '442', '乌拉特前旗', 'wulateqianqi', '14400', '3', '0');
INSERT INTO `t_city` VALUES ('447', '442', '乌拉特中旗', 'wulatezhongqi', '15300', '3', '0');
INSERT INTO `t_city` VALUES ('448', '442', '乌拉特后旗', 'wulatehouqi', '15500', '3', '0');
INSERT INTO `t_city` VALUES ('449', '442', '杭锦后旗', 'hangjinhouqi', '15400', '3', '0');
INSERT INTO `t_city` VALUES ('450', '371', '乌兰察布市', 'wulanchabushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('451', '450', '集宁区', 'jiningqu', '12000', '3', '0');
INSERT INTO `t_city` VALUES ('452', '450', '卓资县', 'zhuozixian', '12300', '3', '0');
INSERT INTO `t_city` VALUES ('453', '450', '化德县', 'huadexian', '13350', '3', '0');
INSERT INTO `t_city` VALUES ('454', '450', '商都县', 'shangduxian', '13450', '3', '0');
INSERT INTO `t_city` VALUES ('455', '450', '兴和县', 'xinghexian', '13650', '3', '0');
INSERT INTO `t_city` VALUES ('456', '450', '凉城县', 'liangchengxian', '13750', '3', '0');
INSERT INTO `t_city` VALUES ('457', '450', '察哈尔右翼前旗', 'chahaeryouyiqianqi', '12200', '3', '0');
INSERT INTO `t_city` VALUES ('458', '450', '察哈尔右翼中旗', 'chahaeryouyizhongqi', '13550', '3', '0');
INSERT INTO `t_city` VALUES ('459', '450', '察哈尔右翼后旗', 'chahaeryouyihouqi', '12400', '3', '0');
INSERT INTO `t_city` VALUES ('460', '450', '四子王旗', 'siziwangqi', '11800', '3', '0');
INSERT INTO `t_city` VALUES ('461', '450', '丰镇市', 'fengzhenshi', '12100', '3', '0');
INSERT INTO `t_city` VALUES ('462', '371', '兴安盟', 'xinganmeng', '0', '2', '0');
INSERT INTO `t_city` VALUES ('463', '462', '乌兰浩特市', 'wulanhaoteshi', '137401', '3', '0');
INSERT INTO `t_city` VALUES ('464', '462', '阿尔山市', 'aershanshi', '137800', '3', '0');
INSERT INTO `t_city` VALUES ('465', '462', '科尔沁右翼前旗', 'keerqinyouyiqianqi', '137423', '3', '0');
INSERT INTO `t_city` VALUES ('466', '462', '科尔沁右翼中旗', 'keerqinyouyizhongqi', '29400', '3', '0');
INSERT INTO `t_city` VALUES ('467', '462', '扎赉特旗', 'zhateqi', '137600', '3', '0');
INSERT INTO `t_city` VALUES ('468', '462', '突泉县', 'tuquanxian', '137500', '3', '0');
INSERT INTO `t_city` VALUES ('469', '371', '锡林郭勒盟', 'xilinguolemeng', '0', '2', '0');
INSERT INTO `t_city` VALUES ('470', '469', '二连浩特市', 'erlianhaoteshi', '11100', '3', '0');
INSERT INTO `t_city` VALUES ('471', '469', '锡林浩特市', 'xilinhaoteshi', '26000', '3', '0');
INSERT INTO `t_city` VALUES ('472', '469', '阿巴嘎旗', 'abagaqi', '11400', '3', '0');
INSERT INTO `t_city` VALUES ('473', '469', '苏尼特左旗', 'sunitezuoqi', '11300', '3', '0');
INSERT INTO `t_city` VALUES ('474', '469', '苏尼特右旗', 'suniteyouqi', '11200', '3', '0');
INSERT INTO `t_city` VALUES ('475', '469', '东乌珠穆沁旗', 'dongwuzhumuqinqi', '26300', '3', '0');
INSERT INTO `t_city` VALUES ('476', '469', '西乌珠穆沁旗', 'xiwuzhumuqinqi', '26200', '3', '0');
INSERT INTO `t_city` VALUES ('477', '469', '太仆寺旗', 'taipusiqi', '27000', '3', '0');
INSERT INTO `t_city` VALUES ('478', '469', '镶黄旗', 'xianghuangqi', '13250', '3', '0');
INSERT INTO `t_city` VALUES ('479', '469', '正镶白旗', 'zhengxiangbaiqi', '13800', '3', '0');
INSERT INTO `t_city` VALUES ('480', '469', '正蓝旗', 'zhenglanqi', '27200', '3', '0');
INSERT INTO `t_city` VALUES ('481', '469', '多伦县', 'duolunxian', '27300', '3', '0');
INSERT INTO `t_city` VALUES ('482', '371', '阿拉善盟', 'alashanmeng', '0', '2', '0');
INSERT INTO `t_city` VALUES ('483', '482', '阿拉善左旗', 'alashanzuoqi', '750306', '3', '0');
INSERT INTO `t_city` VALUES ('484', '482', '阿拉善右旗', 'alashanyouqi', '737300', '3', '0');
INSERT INTO `t_city` VALUES ('485', '482', '额济纳旗', 'ejinaqi', '735400', '3', '0');
INSERT INTO `t_city` VALUES ('486', '1', '辽宁', 'liaoning', '0', '1', '0');
INSERT INTO `t_city` VALUES ('487', '486', '沈阳市', 'shenyangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('488', '487', '和平区', 'hepingqu', '110001', '3', '0');
INSERT INTO `t_city` VALUES ('489', '487', '沈河区', 'shenhequ', '110013', '3', '0');
INSERT INTO `t_city` VALUES ('490', '487', '大东区', 'dadongqu', '110041', '3', '0');
INSERT INTO `t_city` VALUES ('491', '487', '皇姑区', 'huangguqu', '110031', '3', '0');
INSERT INTO `t_city` VALUES ('492', '487', '铁西区', 'tiexiqu', '110021', '3', '0');
INSERT INTO `t_city` VALUES ('493', '487', '苏家屯区', 'sujiatunqu', '110101', '3', '0');
INSERT INTO `t_city` VALUES ('494', '487', '东陵区', 'donglingqu', '110015', '3', '0');
INSERT INTO `t_city` VALUES ('495', '487', '沈北新区', 'shenbeixinqu', '110121', '3', '0');
INSERT INTO `t_city` VALUES ('496', '487', '于洪区', 'yuhongqu', '110141', '3', '0');
INSERT INTO `t_city` VALUES ('497', '487', '辽中县', 'liaozhongxian', '110200', '3', '0');
INSERT INTO `t_city` VALUES ('498', '487', '康平县', 'kangpingxian', '110500', '3', '0');
INSERT INTO `t_city` VALUES ('499', '487', '法库县', 'fakuxian', '110400', '3', '0');
INSERT INTO `t_city` VALUES ('500', '487', '新民市', 'xinminshi', '110300', '3', '0');
INSERT INTO `t_city` VALUES ('501', '487', '经济技术开发区', 'jingjijishukaifaqu', '110141', '3', '0');
INSERT INTO `t_city` VALUES ('502', '487', '浑南新区', 'hunnanxinqu', '110179', '3', '0');
INSERT INTO `t_city` VALUES ('503', '487', '新城子经济技术开发区', 'xinchengzijingjijishukaifaqu', '110121', '3', '0');
INSERT INTO `t_city` VALUES ('504', '486', '大连市', 'dalianshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('505', '504', '中山区', 'zhongshanqu', '116001', '3', '0');
INSERT INTO `t_city` VALUES ('506', '504', '西岗区', 'xigangqu', '116011', '3', '0');
INSERT INTO `t_city` VALUES ('507', '504', '沙河口区', 'shahekouqu', '116021', '3', '0');
INSERT INTO `t_city` VALUES ('508', '504', '甘井子区', 'ganjingziqu', '116033', '3', '0');
INSERT INTO `t_city` VALUES ('509', '504', '旅顺口区', 'lvshunkouqu', '116041', '3', '0');
INSERT INTO `t_city` VALUES ('510', '504', '金州区', 'jinzhouqu', '116100', '3', '0');
INSERT INTO `t_city` VALUES ('511', '504', '长海县', 'changhaixian', '116500', '3', '0');
INSERT INTO `t_city` VALUES ('512', '504', '瓦房店市', 'wafangdianshi', '116300', '3', '0');
INSERT INTO `t_city` VALUES ('513', '504', '普兰店市', 'pulandianshi', '116200', '3', '0');
INSERT INTO `t_city` VALUES ('514', '504', '庄河市', 'zhuangheshi', '116400', '3', '0');
INSERT INTO `t_city` VALUES ('515', '504', '开发区', 'kaifaqu', '116600', '3', '0');
INSERT INTO `t_city` VALUES ('516', '504', '保税区', 'baoshuiqu', '116600', '3', '0');
INSERT INTO `t_city` VALUES ('517', '486', '鞍山市', 'anshanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('518', '517', '铁东区', 'tiedongqu', '114001', '3', '0');
INSERT INTO `t_city` VALUES ('519', '517', '铁西区', 'tiexiqu', '114013', '3', '0');
INSERT INTO `t_city` VALUES ('520', '517', '立山区', 'lishanqu', '114031', '3', '0');
INSERT INTO `t_city` VALUES ('521', '517', '千山区', 'qianshanqu', '114041', '3', '0');
INSERT INTO `t_city` VALUES ('522', '517', '台安县', 'taianxian', '114100', '3', '0');
INSERT INTO `t_city` VALUES ('523', '517', '岫岩满族自治县', 'yanmanzuzizhixian', '114300', '3', '0');
INSERT INTO `t_city` VALUES ('524', '517', '海城市', 'haichengshi', '114200', '3', '0');
INSERT INTO `t_city` VALUES ('525', '486', '抚顺市', 'fushunshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('526', '525', '新抚区', 'xinfuqu', '113008', '3', '0');
INSERT INTO `t_city` VALUES ('527', '525', '东洲区', 'dongzhouqu', '113003', '3', '0');
INSERT INTO `t_city` VALUES ('528', '525', '望花区', 'wanghuaqu', '113001', '3', '0');
INSERT INTO `t_city` VALUES ('529', '525', '顺城区', 'shunchengqu', '113006', '3', '0');
INSERT INTO `t_city` VALUES ('530', '525', '抚顺县', 'fushunxian', '113006', '3', '0');
INSERT INTO `t_city` VALUES ('531', '525', '新宾满族自治县', 'xinbinmanzuzizhixian', '113200', '3', '0');
INSERT INTO `t_city` VALUES ('532', '525', '清原满族自治县', 'qingyuanmanzuzizhixian', '113300', '3', '0');
INSERT INTO `t_city` VALUES ('533', '486', '本溪市', 'benxishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('534', '533', '平山区', 'pingshanqu', '117000', '3', '0');
INSERT INTO `t_city` VALUES ('535', '533', '明山区', 'mingshanqu', '117021', '3', '0');
INSERT INTO `t_city` VALUES ('536', '533', '溪湖区', 'xihuqu', '117002', '3', '0');
INSERT INTO `t_city` VALUES ('537', '533', '南芬区', 'nanfenqu', '117014', '3', '0');
INSERT INTO `t_city` VALUES ('538', '533', '本溪满族自治县', 'benximanzuzizhixian', '117100', '3', '0');
INSERT INTO `t_city` VALUES ('539', '533', '桓仁满族自治县', 'huanrenmanzuzizhixian', '117200', '3', '0');
INSERT INTO `t_city` VALUES ('540', '486', '丹东市', 'dandongshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('541', '540', '元宝区', 'yuanbaoqu', '118000', '3', '0');
INSERT INTO `t_city` VALUES ('542', '540', '振兴区', 'zhenxingqu', '118002', '3', '0');
INSERT INTO `t_city` VALUES ('543', '540', '振安区', 'zhenanqu', '118001', '3', '0');
INSERT INTO `t_city` VALUES ('544', '540', '宽甸满族自治县', 'kuandianmanzuzizhixian', '118200', '3', '0');
INSERT INTO `t_city` VALUES ('545', '540', '东港市', 'donggangshi', '118300', '3', '0');
INSERT INTO `t_city` VALUES ('546', '540', '凤城市', 'fengchengshi', '118100', '3', '0');
INSERT INTO `t_city` VALUES ('547', '486', '锦州市', 'jinzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('548', '547', '古塔区', 'gutaqu', '121001', '3', '0');
INSERT INTO `t_city` VALUES ('549', '547', '凌河区', 'linghequ', '121000', '3', '0');
INSERT INTO `t_city` VALUES ('550', '547', '太和区', 'taihequ', '121011', '3', '0');
INSERT INTO `t_city` VALUES ('551', '547', '黑山县', 'heishanxian', '121400', '3', '0');
INSERT INTO `t_city` VALUES ('552', '547', '义县', 'yixian', '121100', '3', '0');
INSERT INTO `t_city` VALUES ('553', '547', '凌海市', 'linghaishi', '121200', '3', '0');
INSERT INTO `t_city` VALUES ('554', '547', '北宁市', 'beiningshi', '121300', '3', '0');
INSERT INTO `t_city` VALUES ('555', '547', '松山新区', 'songshanxinqu', '121219', '3', '0');
INSERT INTO `t_city` VALUES ('556', '547', '经济技术开发区', 'jingjijishukaifaqu', '121007', '3', '0');
INSERT INTO `t_city` VALUES ('557', '486', '营口市', 'yingkoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('558', '557', '站前区', 'zhanqianqu', '115002', '3', '0');
INSERT INTO `t_city` VALUES ('559', '557', '西市区', 'xishiqu', '115004', '3', '0');
INSERT INTO `t_city` VALUES ('560', '557', '鲅鱼圈区', 'yuquanqu', '115007', '3', '0');
INSERT INTO `t_city` VALUES ('561', '557', '老边区', 'laobianqu', '115005', '3', '0');
INSERT INTO `t_city` VALUES ('562', '557', '盖州市', 'gaizhoushi', '115200', '3', '0');
INSERT INTO `t_city` VALUES ('563', '557', '大石桥市', 'dashiqiaoshi', '115100', '3', '0');
INSERT INTO `t_city` VALUES ('564', '486', '阜新市', 'fuxinshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('565', '564', '海州区', 'haizhouqu', '123000', '3', '0');
INSERT INTO `t_city` VALUES ('566', '564', '新邱区', 'xinqiuqu', '123005', '3', '0');
INSERT INTO `t_city` VALUES ('567', '564', '太平区', 'taipingqu', '123003', '3', '0');
INSERT INTO `t_city` VALUES ('568', '564', '清河门区', 'qinghemenqu', '123006', '3', '0');
INSERT INTO `t_city` VALUES ('569', '564', '细河区', 'xihequ', '123000', '3', '0');
INSERT INTO `t_city` VALUES ('570', '564', '阜新蒙古族自治县', 'fuxinmengguzuzizhixian', '123100', '3', '0');
INSERT INTO `t_city` VALUES ('571', '564', '彰武县', 'zhangwuxian', '123200', '3', '0');
INSERT INTO `t_city` VALUES ('572', '486', '辽阳市', 'liaoyangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('573', '572', '白塔区', 'baitaqu', '111000', '3', '0');
INSERT INTO `t_city` VALUES ('574', '572', '文圣区', 'wenshengqu', '111000', '3', '0');
INSERT INTO `t_city` VALUES ('575', '572', '宏伟区', 'hongweiqu', '111003', '3', '0');
INSERT INTO `t_city` VALUES ('576', '572', '弓长岭区', 'gongchanglingqu', '111008', '3', '0');
INSERT INTO `t_city` VALUES ('577', '572', '太子河区', 'taizihequ', '111000', '3', '0');
INSERT INTO `t_city` VALUES ('578', '572', '辽阳县', 'liaoyangxian', '111200', '3', '0');
INSERT INTO `t_city` VALUES ('579', '572', '灯塔市', 'dengtashi', '111300', '3', '0');
INSERT INTO `t_city` VALUES ('580', '486', '盘锦市', 'panjinshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('581', '580', '双台子区', 'shuangtaiziqu', '124000', '3', '0');
INSERT INTO `t_city` VALUES ('582', '580', '兴隆台区', 'xinglongtaiqu', '124010', '3', '0');
INSERT INTO `t_city` VALUES ('583', '580', '大洼县', 'dawaxian', '124200', '3', '0');
INSERT INTO `t_city` VALUES ('584', '580', '盘山县', 'panshanxian', '124000', '3', '0');
INSERT INTO `t_city` VALUES ('585', '486', '铁岭市', 'tielingshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('586', '585', '银州区', 'yinzhouqu', '112000', '3', '0');
INSERT INTO `t_city` VALUES ('587', '585', '清河区', 'qinghequ', '112003', '3', '0');
INSERT INTO `t_city` VALUES ('588', '585', '铁岭县', 'tielingxian', '112000', '3', '0');
INSERT INTO `t_city` VALUES ('589', '585', '西丰县', 'xifengxian', '112400', '3', '0');
INSERT INTO `t_city` VALUES ('590', '585', '昌图县', 'changtuxian', '112500', '3', '0');
INSERT INTO `t_city` VALUES ('591', '585', '调兵山市', 'diaobingshanshi', '112700', '3', '0');
INSERT INTO `t_city` VALUES ('592', '585', '开原市', 'kaiyuanshi', '112300', '3', '0');
INSERT INTO `t_city` VALUES ('593', '486', '朝阳市', 'chaoyangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('594', '593', '双塔区', 'shuangtaqu', '122000', '3', '0');
INSERT INTO `t_city` VALUES ('595', '593', '龙城区', 'longchengqu', '122000', '3', '0');
INSERT INTO `t_city` VALUES ('596', '593', '朝阳县', 'chaoyangxian', '122000', '3', '0');
INSERT INTO `t_city` VALUES ('597', '593', '建平县', 'jianpingxian', '122400', '3', '0');
INSERT INTO `t_city` VALUES ('598', '593', '喀喇沁左翼蒙古族自治县', 'kalaqinzuoyimengguzuzizhixian', '122300', '3', '0');
INSERT INTO `t_city` VALUES ('599', '593', '北票市', 'beipiaoshi', '122100', '3', '0');
INSERT INTO `t_city` VALUES ('600', '593', '凌源市', 'lingyuanshi', '122500', '3', '0');
INSERT INTO `t_city` VALUES ('601', '486', '葫芦岛市', 'huludaoshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('602', '601', '连山区', 'lianshanqu', '125001', '3', '0');
INSERT INTO `t_city` VALUES ('603', '601', '龙港区', 'longgangqu', '125003', '3', '0');
INSERT INTO `t_city` VALUES ('604', '601', '南票区', 'nanpiaoqu', '125027', '3', '0');
INSERT INTO `t_city` VALUES ('605', '601', '绥中县', 'suizhongxian', '125200', '3', '0');
INSERT INTO `t_city` VALUES ('606', '601', '建昌县', 'jianchangxian', '125300', '3', '0');
INSERT INTO `t_city` VALUES ('607', '601', '兴城市', 'xingchengshi', '125100', '3', '0');
INSERT INTO `t_city` VALUES ('608', '1', '吉林', 'jilin', '0', '1', '0');
INSERT INTO `t_city` VALUES ('609', '608', '长春市', 'changchunshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('610', '609', '南关区', 'nanguanqu', '130022', '3', '0');
INSERT INTO `t_city` VALUES ('611', '609', '宽城区', 'kuanchengqu', '130051', '3', '0');
INSERT INTO `t_city` VALUES ('612', '609', '朝阳区', 'chaoyangqu', '130012', '3', '0');
INSERT INTO `t_city` VALUES ('613', '609', '二道区', 'erdaoqu', '130031', '3', '0');
INSERT INTO `t_city` VALUES ('614', '609', '绿园区', 'lvyuanqu', '130062', '3', '0');
INSERT INTO `t_city` VALUES ('615', '609', '双阳区', 'shuangyangqu', '130600', '3', '0');
INSERT INTO `t_city` VALUES ('616', '609', '农安县', 'nonganxian', '130200', '3', '0');
INSERT INTO `t_city` VALUES ('617', '609', '九台市', 'jiutaishi', '130500', '3', '0');
INSERT INTO `t_city` VALUES ('618', '609', '榆树市', 'yushushi', '130400', '3', '0');
INSERT INTO `t_city` VALUES ('619', '609', '德惠市', 'dehuishi', '130300', '3', '0');
INSERT INTO `t_city` VALUES ('620', '609', '净月经济开发区', 'jingyuejingjikaifaqu', '130117', '3', '0');
INSERT INTO `t_city` VALUES ('621', '609', '高新技术产业开发区', 'gaoxinjishuchanyekaifaqu', '130015', '3', '0');
INSERT INTO `t_city` VALUES ('622', '608', '吉林市', 'jilinshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('623', '622', '昌邑区', 'changyiqu', '132002', '3', '0');
INSERT INTO `t_city` VALUES ('624', '622', '龙潭区', 'longtanqu', '132021', '3', '0');
INSERT INTO `t_city` VALUES ('625', '622', '船营区', 'chuanyingqu', '132011', '3', '0');
INSERT INTO `t_city` VALUES ('626', '622', '丰满区', 'fengmanqu', '132013', '3', '0');
INSERT INTO `t_city` VALUES ('627', '622', '永吉县', 'yongjixian', '132200', '3', '0');
INSERT INTO `t_city` VALUES ('628', '622', '蛟河市', 'heshi', '132500', '3', '0');
INSERT INTO `t_city` VALUES ('629', '622', '桦甸市', 'dianshi', '132400', '3', '0');
INSERT INTO `t_city` VALUES ('630', '622', '舒兰市', 'shulanshi', '132600', '3', '0');
INSERT INTO `t_city` VALUES ('631', '622', '磐石市', 'panshishi', '132300', '3', '0');
INSERT INTO `t_city` VALUES ('632', '608', '四平市', 'sipingshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('633', '632', '铁西区', 'tiexiqu', '136000', '3', '0');
INSERT INTO `t_city` VALUES ('634', '632', '铁东区', 'tiedongqu', '136001', '3', '0');
INSERT INTO `t_city` VALUES ('635', '632', '梨树县', 'lishuxian', '136500', '3', '0');
INSERT INTO `t_city` VALUES ('636', '632', '伊通满族自治县', 'yitongmanzuzizhixian', '130700', '3', '0');
INSERT INTO `t_city` VALUES ('637', '632', '公主岭市', 'gongzhulingshi', '136100', '3', '0');
INSERT INTO `t_city` VALUES ('638', '632', '双辽市', 'shuangliaoshi', '136400', '3', '0');
INSERT INTO `t_city` VALUES ('639', '608', '辽源市', 'liaoyuanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('640', '639', '龙山区', 'longshanqu', '136200', '3', '0');
INSERT INTO `t_city` VALUES ('641', '639', '西安区', 'xianqu', '136201', '3', '0');
INSERT INTO `t_city` VALUES ('642', '639', '东丰县', 'dongfengxian', '136300', '3', '0');
INSERT INTO `t_city` VALUES ('643', '639', '东辽县', 'dongliaoxian', '136600', '3', '0');
INSERT INTO `t_city` VALUES ('644', '608', '通化市', 'tonghuashi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('645', '644', '东昌区', 'dongchangqu', '134001', '3', '0');
INSERT INTO `t_city` VALUES ('646', '644', '二道江区', 'erdaojiangqu', '134003', '3', '0');
INSERT INTO `t_city` VALUES ('647', '644', '通化县', 'tonghuaxian', '134100', '3', '0');
INSERT INTO `t_city` VALUES ('648', '644', '辉南县', 'huinanxian', '135100', '3', '0');
INSERT INTO `t_city` VALUES ('649', '644', '柳河县', 'liuhexian', '135300', '3', '0');
INSERT INTO `t_city` VALUES ('650', '644', '梅河口市', 'meihekoushi', '135000', '3', '0');
INSERT INTO `t_city` VALUES ('651', '644', '集安市', 'jianshi', '134200', '3', '0');
INSERT INTO `t_city` VALUES ('652', '608', '白山市', 'baishanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('653', '652', '八道江区', 'badaojiangqu', '134300', '3', '0');
INSERT INTO `t_city` VALUES ('654', '652', '抚松县', 'fusongxian', '134500', '3', '0');
INSERT INTO `t_city` VALUES ('655', '652', '靖宇县', 'jingyuxian', '135200', '3', '0');
INSERT INTO `t_city` VALUES ('656', '652', '长白朝鲜族自治县', 'changbaichaoxianzuzizhixian', '134400', '3', '0');
INSERT INTO `t_city` VALUES ('657', '652', '江源县', 'jiangyuanxian', '134700', '3', '0');
INSERT INTO `t_city` VALUES ('658', '652', '临江市', 'linjiangshi', '134600', '3', '0');
INSERT INTO `t_city` VALUES ('659', '608', '松原市', 'songyuanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('660', '659', '宁江区', 'ningjiangqu', '138000', '3', '0');
INSERT INTO `t_city` VALUES ('661', '659', '前郭尔罗斯蒙古族自治县', 'qianguoerluosimengguzuzizhixian', '138000', '3', '0');
INSERT INTO `t_city` VALUES ('662', '659', '长岭县', 'changlingxian', '131500', '3', '0');
INSERT INTO `t_city` VALUES ('663', '659', '乾安县', 'qiananxian', '131400', '3', '0');
INSERT INTO `t_city` VALUES ('664', '659', '扶余县', 'fuyuxian', '131200', '3', '0');
INSERT INTO `t_city` VALUES ('665', '608', '白城市', 'baichengshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('666', '665', '洮北区', 'beiqu', '137000', '3', '0');
INSERT INTO `t_city` VALUES ('667', '665', '镇赉县', 'zhenxian', '137300', '3', '0');
INSERT INTO `t_city` VALUES ('668', '665', '通榆县', 'tongyuxian', '137200', '3', '0');
INSERT INTO `t_city` VALUES ('669', '665', '洮南市', 'nanshi', '137100', '3', '0');
INSERT INTO `t_city` VALUES ('670', '665', '大安市', 'daanshi', '131300', '3', '0');
INSERT INTO `t_city` VALUES ('671', '608', '延边朝鲜族自治州', 'yanbianchaoxianzuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('672', '671', '延吉市', 'yanjishi', '133000', '3', '0');
INSERT INTO `t_city` VALUES ('673', '671', '图们市', 'tumenshi', '133100', '3', '0');
INSERT INTO `t_city` VALUES ('674', '671', '敦化市', 'dunhuashi', '133700', '3', '0');
INSERT INTO `t_city` VALUES ('675', '671', '珲春市', 'chunshi', '133300', '3', '0');
INSERT INTO `t_city` VALUES ('676', '671', '龙井市', 'longjingshi', '133400', '3', '0');
INSERT INTO `t_city` VALUES ('677', '671', '和龙市', 'helongshi', '133500', '3', '0');
INSERT INTO `t_city` VALUES ('678', '671', '汪清县', 'wangqingxian', '133200', '3', '0');
INSERT INTO `t_city` VALUES ('679', '671', '安图县', 'antuxian', '133600', '3', '0');
INSERT INTO `t_city` VALUES ('680', '1', '黑龙江', 'heilongjiang', '0', '1', '0');
INSERT INTO `t_city` VALUES ('681', '680', '哈尔滨市', 'haerbinshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('682', '681', '道里区', 'daoliqu', '150010', '3', '0');
INSERT INTO `t_city` VALUES ('683', '681', '南岗区', 'nangangqu', '150006', '3', '0');
INSERT INTO `t_city` VALUES ('684', '681', '道外区', 'daowaiqu', '150020', '3', '0');
INSERT INTO `t_city` VALUES ('685', '681', '香坊区', 'xiangfangqu', '150036', '3', '0');
INSERT INTO `t_city` VALUES ('686', '681', '动力区', 'dongliqu', '150040', '3', '0');
INSERT INTO `t_city` VALUES ('687', '681', '平房区', 'pingfangqu', '150060', '3', '0');
INSERT INTO `t_city` VALUES ('688', '681', '松北区', 'songbeiqu', '150028', '3', '0');
INSERT INTO `t_city` VALUES ('689', '681', '呼兰区', 'hulanqu', '150500', '3', '0');
INSERT INTO `t_city` VALUES ('690', '681', '依兰县', 'yilanxian', '154800', '3', '0');
INSERT INTO `t_city` VALUES ('691', '681', '方正县', 'fangzhengxian', '150800', '3', '0');
INSERT INTO `t_city` VALUES ('692', '681', '宾县', 'binxian', '150400', '3', '0');
INSERT INTO `t_city` VALUES ('693', '681', '巴彦县', 'bayanxian', '151800', '3', '0');
INSERT INTO `t_city` VALUES ('694', '681', '木兰县', 'mulanxian', '151900', '3', '0');
INSERT INTO `t_city` VALUES ('695', '681', '通河县', 'tonghexian', '150900', '3', '0');
INSERT INTO `t_city` VALUES ('696', '681', '延寿县', 'yanshouxian', '150700', '3', '0');
INSERT INTO `t_city` VALUES ('697', '681', '阿城区', 'achengqu', '150300', '3', '0');
INSERT INTO `t_city` VALUES ('698', '681', '双城市', 'shuangchengshi', '150100', '3', '0');
INSERT INTO `t_city` VALUES ('699', '681', '尚志市', 'shangzhishi', '150600', '3', '0');
INSERT INTO `t_city` VALUES ('700', '681', '五常市', 'wuchangshi', '150200', '3', '0');
INSERT INTO `t_city` VALUES ('701', '680', '齐齐哈尔市', 'qiqihaershi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('702', '701', '龙沙区', 'longshaqu', '161000', '3', '0');
INSERT INTO `t_city` VALUES ('703', '701', '建华区', 'jianhuaqu', '161006', '3', '0');
INSERT INTO `t_city` VALUES ('704', '701', '铁锋区', 'tiefengqu', '161000', '3', '0');
INSERT INTO `t_city` VALUES ('705', '701', '昂昂溪区', 'angangxiqu', '161031', '3', '0');
INSERT INTO `t_city` VALUES ('706', '701', '富拉尔基区', 'fulaerjiqu', '161041', '3', '0');
INSERT INTO `t_city` VALUES ('707', '701', '碾子山区', 'nianzishanqu', '161046', '3', '0');
INSERT INTO `t_city` VALUES ('708', '701', '梅里斯达斡尔族区', 'meilisidawoerzuqu', '161021', '3', '0');
INSERT INTO `t_city` VALUES ('709', '701', '龙江县', 'longjiangxian', '161100', '3', '0');
INSERT INTO `t_city` VALUES ('710', '701', '依安县', 'yianxian', '161500', '3', '0');
INSERT INTO `t_city` VALUES ('711', '701', '泰来县', 'tailaixian', '162400', '3', '0');
INSERT INTO `t_city` VALUES ('712', '701', '甘南县', 'gannanxian', '162100', '3', '0');
INSERT INTO `t_city` VALUES ('713', '701', '富裕县', 'fuyuxian', '161200', '3', '0');
INSERT INTO `t_city` VALUES ('714', '701', '克山县', 'keshanxian', '161600', '3', '0');
INSERT INTO `t_city` VALUES ('715', '701', '克东县', 'kedongxian', '164800', '3', '0');
INSERT INTO `t_city` VALUES ('716', '701', '拜泉县', 'baiquanxian', '164700', '3', '0');
INSERT INTO `t_city` VALUES ('717', '701', '讷河市', 'heshi', '161300', '3', '0');
INSERT INTO `t_city` VALUES ('718', '680', '鸡西市', 'jixishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('719', '718', '鸡冠区', 'jiguanqu', '158100', '3', '0');
INSERT INTO `t_city` VALUES ('720', '718', '恒山区', 'hengshanqu', '158130', '3', '0');
INSERT INTO `t_city` VALUES ('721', '718', '滴道区', 'didaoqu', '158150', '3', '0');
INSERT INTO `t_city` VALUES ('722', '718', '梨树区', 'lishuqu', '158160', '3', '0');
INSERT INTO `t_city` VALUES ('723', '718', '城子河区', 'chengzihequ', '158170', '3', '0');
INSERT INTO `t_city` VALUES ('724', '718', '麻山区', 'mashanqu', '158180', '3', '0');
INSERT INTO `t_city` VALUES ('725', '718', '鸡东县', 'jidongxian', '158200', '3', '0');
INSERT INTO `t_city` VALUES ('726', '718', '虎林市', 'hulinshi', '158400', '3', '0');
INSERT INTO `t_city` VALUES ('727', '718', '密山市', 'mishanshi', '158300', '3', '0');
INSERT INTO `t_city` VALUES ('728', '680', '鹤岗市', 'hegangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('729', '728', '向阳区', 'xiangyangqu', '154100', '3', '0');
INSERT INTO `t_city` VALUES ('730', '728', '工农区', 'gongnongqu', '154101', '3', '0');
INSERT INTO `t_city` VALUES ('731', '728', '南山区', 'nanshanqu', '154104', '3', '0');
INSERT INTO `t_city` VALUES ('732', '728', '兴安区', 'xinganqu', '154102', '3', '0');
INSERT INTO `t_city` VALUES ('733', '728', '东山区', 'dongshanqu', '154106', '3', '0');
INSERT INTO `t_city` VALUES ('734', '728', '兴山区', 'xingshanqu', '154105', '3', '0');
INSERT INTO `t_city` VALUES ('735', '728', '萝北县', 'luobeixian', '154200', '3', '0');
INSERT INTO `t_city` VALUES ('736', '728', '绥滨县', 'suibinxian', '156200', '3', '0');
INSERT INTO `t_city` VALUES ('737', '680', '双鸭山市', 'shuangyashanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('738', '737', '尖山区', 'jianshanqu', '155100', '3', '0');
INSERT INTO `t_city` VALUES ('739', '737', '岭东区', 'lingdongqu', '155120', '3', '0');
INSERT INTO `t_city` VALUES ('740', '737', '四方台区', 'sifangtaiqu', '155130', '3', '0');
INSERT INTO `t_city` VALUES ('741', '737', '宝山区', 'baoshanqu', '155131', '3', '0');
INSERT INTO `t_city` VALUES ('742', '737', '集贤县', 'jixianxian', '155900', '3', '0');
INSERT INTO `t_city` VALUES ('743', '737', '友谊县', 'youyixian', '155800', '3', '0');
INSERT INTO `t_city` VALUES ('744', '737', '宝清县', 'baoqingxian', '155600', '3', '0');
INSERT INTO `t_city` VALUES ('745', '737', '饶河县', 'raohexian', '155700', '3', '0');
INSERT INTO `t_city` VALUES ('746', '680', '大庆市', 'daqingshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('747', '746', '萨尔图区', 'saertuqu', '163001', '3', '0');
INSERT INTO `t_city` VALUES ('748', '746', '龙凤区', 'longfengqu', '163711', '3', '0');
INSERT INTO `t_city` VALUES ('749', '746', '让胡路区', 'ranghuluqu', '163712', '3', '0');
INSERT INTO `t_city` VALUES ('750', '746', '红岗区', 'honggangqu', '163511', '3', '0');
INSERT INTO `t_city` VALUES ('751', '746', '大同区', 'datongqu', '163515', '3', '0');
INSERT INTO `t_city` VALUES ('752', '746', '肇州县', 'zhaozhouxian', '166400', '3', '0');
INSERT INTO `t_city` VALUES ('753', '746', '肇源县', 'zhaoyuanxian', '166500', '3', '0');
INSERT INTO `t_city` VALUES ('754', '746', '林甸县', 'lindianxian', '166300', '3', '0');
INSERT INTO `t_city` VALUES ('755', '746', '杜尔伯特蒙古族自治县', 'duerbotemengguzuzizhixian', '166200', '3', '0');
INSERT INTO `t_city` VALUES ('756', '680', '伊春市', 'yichunshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('757', '756', '伊春区', 'yichunqu', '153000', '3', '0');
INSERT INTO `t_city` VALUES ('758', '756', '南岔区', 'nanchaqu', '153100', '3', '0');
INSERT INTO `t_city` VALUES ('759', '756', '友好区', 'youhaoqu', '153031', '3', '0');
INSERT INTO `t_city` VALUES ('760', '756', '西林区', 'xilinqu', '153025', '3', '0');
INSERT INTO `t_city` VALUES ('761', '756', '翠峦区', 'cuiluanqu', '153013', '3', '0');
INSERT INTO `t_city` VALUES ('762', '756', '新青区', 'xinqingqu', '153036', '3', '0');
INSERT INTO `t_city` VALUES ('763', '756', '美溪区', 'meixiqu', '153021', '3', '0');
INSERT INTO `t_city` VALUES ('764', '756', '金山屯区', 'jinshantunqu', '153026', '3', '0');
INSERT INTO `t_city` VALUES ('765', '756', '五营区', 'wuyingqu', '153033', '3', '0');
INSERT INTO `t_city` VALUES ('766', '756', '乌马河区', 'wumahequ', '153011', '3', '0');
INSERT INTO `t_city` VALUES ('767', '756', '汤旺河区', 'tangwanghequ', '153037', '3', '0');
INSERT INTO `t_city` VALUES ('768', '756', '带岭区', 'dailingqu', '153106', '3', '0');
INSERT INTO `t_city` VALUES ('769', '756', '乌伊岭区', 'wuyilingqu', '153038', '3', '0');
INSERT INTO `t_city` VALUES ('770', '756', '红星区', 'hongxingqu', '153035', '3', '0');
INSERT INTO `t_city` VALUES ('771', '756', '上甘岭区', 'shangganlingqu', '153032', '3', '0');
INSERT INTO `t_city` VALUES ('772', '756', '嘉荫县', 'jiayinxian', '153200', '3', '0');
INSERT INTO `t_city` VALUES ('773', '756', '铁力市', 'tielishi', '152500', '3', '0');
INSERT INTO `t_city` VALUES ('774', '680', '佳木斯市', 'jiamusishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('775', '774', '向阳区', 'xiangyangqu', '154002', '3', '0');
INSERT INTO `t_city` VALUES ('776', '774', '前进区', 'qianjinqu', '154002', '3', '0');
INSERT INTO `t_city` VALUES ('777', '774', '东风区', 'dongfengqu', '154005', '3', '0');
INSERT INTO `t_city` VALUES ('778', '774', '郊区', 'jiaoqu', '154004', '3', '0');
INSERT INTO `t_city` VALUES ('779', '774', '桦南县', 'nanxian', '154400', '3', '0');
INSERT INTO `t_city` VALUES ('780', '774', '桦川县', 'chuanxian', '154300', '3', '0');
INSERT INTO `t_city` VALUES ('781', '774', '汤原县', 'tangyuanxian', '154700', '3', '0');
INSERT INTO `t_city` VALUES ('782', '774', '抚远县', 'fuyuanxian', '156500', '3', '0');
INSERT INTO `t_city` VALUES ('783', '774', '同江市', 'tongjiangshi', '156400', '3', '0');
INSERT INTO `t_city` VALUES ('784', '774', '富锦市', 'fujinshi', '156100', '3', '0');
INSERT INTO `t_city` VALUES ('785', '680', '七台河市', 'qitaiheshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('786', '785', '新兴区', 'xinxingqu', '154604', '3', '0');
INSERT INTO `t_city` VALUES ('787', '785', '桃山区', 'taoshanqu', '154600', '3', '0');
INSERT INTO `t_city` VALUES ('788', '785', '茄子河区', 'qiezihequ', '154622', '3', '0');
INSERT INTO `t_city` VALUES ('789', '785', '勃利县', 'bolixian', '154500', '3', '0');
INSERT INTO `t_city` VALUES ('790', '680', '牡丹江市', 'mudanjiangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('791', '790', '东安区', 'donganqu', '157000', '3', '0');
INSERT INTO `t_city` VALUES ('792', '790', '爱民区', 'aiminqu', '157009', '3', '0');
INSERT INTO `t_city` VALUES ('793', '790', '阳明区', 'yangmingqu', '157013', '3', '0');
INSERT INTO `t_city` VALUES ('794', '790', '西安区', 'xianqu', '157000', '3', '0');
INSERT INTO `t_city` VALUES ('795', '790', '东宁县', 'dongningxian', '157200', '3', '0');
INSERT INTO `t_city` VALUES ('796', '790', '林口县', 'linkouxian', '157600', '3', '0');
INSERT INTO `t_city` VALUES ('797', '790', '绥芬河市', 'suifenheshi', '157300', '3', '0');
INSERT INTO `t_city` VALUES ('798', '790', '海林市', 'hailinshi', '157100', '3', '0');
INSERT INTO `t_city` VALUES ('799', '790', '宁安市', 'ninganshi', '157400', '3', '0');
INSERT INTO `t_city` VALUES ('800', '790', '穆棱市', 'mulengshi', '157500', '3', '0');
INSERT INTO `t_city` VALUES ('801', '680', '黑河市', 'heiheshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('802', '801', '爱辉区', 'aihuiqu', '164300', '3', '0');
INSERT INTO `t_city` VALUES ('803', '801', '嫩江县', 'nenjiangxian', '161400', '3', '0');
INSERT INTO `t_city` VALUES ('804', '801', '逊克县', 'xunkexian', '164400', '3', '0');
INSERT INTO `t_city` VALUES ('805', '801', '孙吴县', 'sunwuxian', '164200', '3', '0');
INSERT INTO `t_city` VALUES ('806', '801', '北安市', 'beianshi', '164000', '3', '0');
INSERT INTO `t_city` VALUES ('807', '801', '五大连池市', 'wudalianchishi', '164100', '3', '0');
INSERT INTO `t_city` VALUES ('808', '680', '绥化市', 'suihuashi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('809', '808', '北林区', 'beilinqu', '152000', '3', '0');
INSERT INTO `t_city` VALUES ('810', '808', '望奎县', 'wangkuixian', '152100', '3', '0');
INSERT INTO `t_city` VALUES ('811', '808', '兰西县', 'lanxixian', '151500', '3', '0');
INSERT INTO `t_city` VALUES ('812', '808', '青冈县', 'qinggangxian', '151600', '3', '0');
INSERT INTO `t_city` VALUES ('813', '808', '庆安县', 'qinganxian', '152400', '3', '0');
INSERT INTO `t_city` VALUES ('814', '808', '明水县', 'mingshuixian', '151700', '3', '0');
INSERT INTO `t_city` VALUES ('815', '808', '绥棱县', 'suilengxian', '152200', '3', '0');
INSERT INTO `t_city` VALUES ('816', '808', '安达市', 'andashi', '151400', '3', '0');
INSERT INTO `t_city` VALUES ('817', '808', '肇东市', 'zhaodongshi', '151100', '3', '0');
INSERT INTO `t_city` VALUES ('818', '808', '海伦市', 'hailunshi', '152300', '3', '0');
INSERT INTO `t_city` VALUES ('819', '680', '大兴安岭地区', 'daxinganlingdiqu', '0', '2', '0');
INSERT INTO `t_city` VALUES ('820', '819', '呼玛县', 'humaxian', '165100', '3', '0');
INSERT INTO `t_city` VALUES ('821', '819', '塔河县', 'tahexian', '165200', '3', '0');
INSERT INTO `t_city` VALUES ('822', '819', '漠河县', 'mohexian', '165300', '3', '0');
INSERT INTO `t_city` VALUES ('823', '819', '加格达奇区', 'jiagedaqiqu', '165000', '3', '0');
INSERT INTO `t_city` VALUES ('824', '819', '松岭区', 'songlingqu', '165012', '3', '0');
INSERT INTO `t_city` VALUES ('825', '819', '新林区', 'xinlinqu', '165023', '3', '0');
INSERT INTO `t_city` VALUES ('826', '819', '呼中区', 'huzhongqu', '165036', '3', '0');
INSERT INTO `t_city` VALUES ('827', '1', '上海', 'shanghai', '0', '1', '0');
INSERT INTO `t_city` VALUES ('828', '827', '上海市', 'shanghaishi', '0', '2', '1');
INSERT INTO `t_city` VALUES ('829', '828', '黄浦区', 'huangpuqu', '200001', '3', '0');
INSERT INTO `t_city` VALUES ('830', '828', '卢湾区', 'luwanqu', '200020', '3', '0');
INSERT INTO `t_city` VALUES ('831', '828', '徐汇区', 'xuhuiqu', '200030', '3', '0');
INSERT INTO `t_city` VALUES ('832', '828', '长宁区', 'changningqu', '200050', '3', '0');
INSERT INTO `t_city` VALUES ('833', '828', '静安区', 'jinganqu', '200040', '3', '0');
INSERT INTO `t_city` VALUES ('834', '828', '普陀区', 'putuoqu', '200333', '3', '0');
INSERT INTO `t_city` VALUES ('835', '828', '闸北区', 'zhabeiqu', '200070', '3', '0');
INSERT INTO `t_city` VALUES ('836', '828', '虹口区', 'hongkouqu', '200080', '3', '0');
INSERT INTO `t_city` VALUES ('837', '828', '杨浦区', 'yangpuqu', '200082', '3', '0');
INSERT INTO `t_city` VALUES ('838', '828', '闵行区', 'xingqu', '201100', '3', '0');
INSERT INTO `t_city` VALUES ('839', '828', '宝山区', 'baoshanqu', '201900', '3', '0');
INSERT INTO `t_city` VALUES ('840', '828', '嘉定区', 'jiadingqu', '201800', '3', '0');
INSERT INTO `t_city` VALUES ('841', '828', '浦东新区', 'pudongxinqu', '200135', '3', '0');
INSERT INTO `t_city` VALUES ('842', '828', '金山区', 'jinshanqu', '200540', '3', '0');
INSERT INTO `t_city` VALUES ('843', '828', '松江区', 'songjiangqu', '201600', '3', '0');
INSERT INTO `t_city` VALUES ('844', '828', '青浦区', 'qingpuqu', '201700', '3', '0');
INSERT INTO `t_city` VALUES ('845', '828', '南汇区', 'nanhuiqu', '201300', '3', '0');
INSERT INTO `t_city` VALUES ('846', '828', '奉贤区', 'fengxianqu', '201400', '3', '0');
INSERT INTO `t_city` VALUES ('847', '828', '崇明县', 'chongmingxian', '202150', '3', '0');
INSERT INTO `t_city` VALUES ('848', '1', '江苏', 'jiangsu', '0', '1', '0');
INSERT INTO `t_city` VALUES ('849', '848', '南京市', 'nanjingshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('850', '849', '玄武区', 'xuanwuqu', '210018', '3', '0');
INSERT INTO `t_city` VALUES ('851', '849', '白下区', 'baixiaqu', '210002', '3', '0');
INSERT INTO `t_city` VALUES ('852', '849', '秦淮区', 'qinhuaiqu', '210001', '3', '0');
INSERT INTO `t_city` VALUES ('853', '849', '建邺区', 'jianqu', '210004', '3', '0');
INSERT INTO `t_city` VALUES ('854', '849', '鼓楼区', 'gulouqu', '210009', '3', '0');
INSERT INTO `t_city` VALUES ('855', '849', '下关区', 'xiaguanqu', '210011', '3', '0');
INSERT INTO `t_city` VALUES ('856', '849', '浦口区', 'pukouqu', '211800', '3', '0');
INSERT INTO `t_city` VALUES ('857', '849', '栖霞区', 'qixiaqu', '210046', '3', '0');
INSERT INTO `t_city` VALUES ('858', '849', '雨花台区', 'yuhuataiqu', '210012', '3', '0');
INSERT INTO `t_city` VALUES ('859', '849', '江宁区', 'jiangningqu', '211100', '3', '0');
INSERT INTO `t_city` VALUES ('860', '849', '六合区', 'liuhequ', '211500', '3', '0');
INSERT INTO `t_city` VALUES ('861', '849', '溧水县', 'shuixian', '211200', '3', '0');
INSERT INTO `t_city` VALUES ('862', '849', '高淳县', 'gaochunxian', '211300', '3', '0');
INSERT INTO `t_city` VALUES ('863', '848', '无锡市', 'wuxishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('864', '863', '崇安区', 'chonganqu', '214002', '3', '0');
INSERT INTO `t_city` VALUES ('865', '863', '南长区', 'nanchangqu', '214021', '3', '0');
INSERT INTO `t_city` VALUES ('866', '863', '北塘区', 'beitangqu', '214044', '3', '0');
INSERT INTO `t_city` VALUES ('867', '863', '锡山区', 'xishanqu', '214101', '3', '0');
INSERT INTO `t_city` VALUES ('868', '863', '惠山区', 'huishanqu', '214174', '3', '0');
INSERT INTO `t_city` VALUES ('869', '863', '滨湖区', 'binhuqu', '214062', '3', '0');
INSERT INTO `t_city` VALUES ('870', '863', '江阴市', 'jiangyinshi', '214400', '3', '0');
INSERT INTO `t_city` VALUES ('871', '863', '宜兴市', 'yixingshi', '214200', '3', '0');
INSERT INTO `t_city` VALUES ('872', '863', '新区', 'xinqu', '214028', '3', '0');
INSERT INTO `t_city` VALUES ('873', '848', '徐州市', 'xuzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('874', '873', '云龙区', 'yunlongqu', '221009', '3', '0');
INSERT INTO `t_city` VALUES ('875', '873', '鼓楼区', 'gulouqu', '221005', '3', '0');
INSERT INTO `t_city` VALUES ('876', '873', '九里区', 'jiuliqu', '221140', '3', '0');
INSERT INTO `t_city` VALUES ('877', '873', '泉山区', 'quanshanqu', '221006', '3', '0');
INSERT INTO `t_city` VALUES ('878', '873', '铜山县', 'tongshanxian', '221116', '3', '0');
INSERT INTO `t_city` VALUES ('879', '873', '贾汪区', 'jiawangqu', '221011', '3', '0');
INSERT INTO `t_city` VALUES ('880', '873', '丰县', 'fengxian', '221700', '3', '0');
INSERT INTO `t_city` VALUES ('881', '873', '沛县', 'peixian', '221600', '3', '0');
INSERT INTO `t_city` VALUES ('882', '873', '睢宁县', 'ningxian', '221200', '3', '0');
INSERT INTO `t_city` VALUES ('883', '873', '新沂市', 'xinyishi', '221400', '3', '0');
INSERT INTO `t_city` VALUES ('884', '873', '邳州市', 'zhoushi', '221300', '3', '0');
INSERT INTO `t_city` VALUES ('885', '848', '常州市', 'changzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('886', '885', '天宁区', 'tianningqu', '213003', '3', '0');
INSERT INTO `t_city` VALUES ('887', '885', '钟楼区', 'zhonglouqu', '213002', '3', '0');
INSERT INTO `t_city` VALUES ('888', '885', '戚墅堰区', 'qishuyanqu', '213011', '3', '0');
INSERT INTO `t_city` VALUES ('889', '885', '新北区', 'xinbeiqu', '213001', '3', '0');
INSERT INTO `t_city` VALUES ('890', '885', '武进区', 'wujinqu', '213161', '3', '0');
INSERT INTO `t_city` VALUES ('891', '885', '溧阳市', 'yangshi', '213300', '3', '0');
INSERT INTO `t_city` VALUES ('892', '885', '金坛市', 'jintanshi', '213200', '3', '0');
INSERT INTO `t_city` VALUES ('893', '848', '苏州市', 'suzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('894', '893', '沧浪区', 'canglangqu', '215006', '3', '0');
INSERT INTO `t_city` VALUES ('895', '893', '平江区', 'pingjiangqu', '215005', '3', '0');
INSERT INTO `t_city` VALUES ('896', '893', '金阊区', 'jinqu', '215008', '3', '0');
INSERT INTO `t_city` VALUES ('897', '893', '虎丘区', 'huqiuqu', '215004', '3', '0');
INSERT INTO `t_city` VALUES ('898', '893', '吴中区', 'wuzhongqu', '215128', '3', '0');
INSERT INTO `t_city` VALUES ('899', '893', '相城区', 'xiangchengqu', '215131', '3', '0');
INSERT INTO `t_city` VALUES ('900', '893', '常熟市', 'changshushi', '215500', '3', '0');
INSERT INTO `t_city` VALUES ('901', '893', '张家港市', 'zhangjiagangshi', '215600', '3', '0');
INSERT INTO `t_city` VALUES ('902', '893', '昆山市', 'kunshanshi', '215300', '3', '0');
INSERT INTO `t_city` VALUES ('903', '893', '吴江市', 'wujiangshi', '215200', '3', '0');
INSERT INTO `t_city` VALUES ('904', '893', '太仓市', 'taicangshi', '215400', '3', '0');
INSERT INTO `t_city` VALUES ('905', '893', '工业园区', 'gongyeyuanqu', '215028', '3', '0');
INSERT INTO `t_city` VALUES ('906', '893', '高新区', 'gaoxinqu', '215011', '3', '0');
INSERT INTO `t_city` VALUES ('907', '848', '南通市', 'nantongshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('908', '907', '崇川区', 'chongchuanqu', '226001', '3', '0');
INSERT INTO `t_city` VALUES ('909', '907', '港闸区', 'gangzhaqu', '226001', '3', '0');
INSERT INTO `t_city` VALUES ('910', '907', '海安县', 'haianxian', '226600', '3', '0');
INSERT INTO `t_city` VALUES ('911', '907', '如东县', 'rudongxian', '226400', '3', '0');
INSERT INTO `t_city` VALUES ('912', '907', '启东市', 'qidongshi', '226200', '3', '0');
INSERT INTO `t_city` VALUES ('913', '907', '如皋市', 'rugaoshi', '226500', '3', '0');
INSERT INTO `t_city` VALUES ('914', '907', '通州市', 'tongzhoushi', '226300', '3', '0');
INSERT INTO `t_city` VALUES ('915', '907', '海门市', 'haimenshi', '226100', '3', '0');
INSERT INTO `t_city` VALUES ('916', '907', '经济技术开发区', 'jingjijishukaifaqu', '226009', '3', '0');
INSERT INTO `t_city` VALUES ('917', '848', '连云港市', 'lianyungangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('918', '917', '连云区', 'lianyunqu', '222042', '3', '0');
INSERT INTO `t_city` VALUES ('919', '917', '新浦区', 'xinpuqu', '222003', '3', '0');
INSERT INTO `t_city` VALUES ('920', '917', '海州区', 'haizhouqu', '222023', '3', '0');
INSERT INTO `t_city` VALUES ('921', '917', '赣榆县', 'ganyuxian', '222100', '3', '0');
INSERT INTO `t_city` VALUES ('922', '917', '东海县', 'donghaixian', '222300', '3', '0');
INSERT INTO `t_city` VALUES ('923', '917', '灌云县', 'guanyunxian', '222200', '3', '0');
INSERT INTO `t_city` VALUES ('924', '917', '灌南县', 'guannanxian', '223500', '3', '0');
INSERT INTO `t_city` VALUES ('925', '848', '淮安市', 'huaianshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('926', '925', '清河区', 'qinghequ', '223001', '3', '0');
INSERT INTO `t_city` VALUES ('927', '925', '楚州区', 'chuzhouqu', '223200', '3', '0');
INSERT INTO `t_city` VALUES ('928', '925', '淮阴区', 'huaiyinqu', '223300', '3', '0');
INSERT INTO `t_city` VALUES ('929', '925', '清浦区', 'qingpuqu', '223002', '3', '0');
INSERT INTO `t_city` VALUES ('930', '925', '涟水县', 'lianshuixian', '223400', '3', '0');
INSERT INTO `t_city` VALUES ('931', '925', '洪泽县', 'hongzexian', '223100', '3', '0');
INSERT INTO `t_city` VALUES ('932', '925', '盱眙县', 'xian', '211700', '3', '0');
INSERT INTO `t_city` VALUES ('933', '925', '金湖县', 'jinhuxian', '211600', '3', '0');
INSERT INTO `t_city` VALUES ('934', '848', '盐城市', 'yanchengshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('935', '934', '亭湖区', 'tinghuqu', '224005', '3', '0');
INSERT INTO `t_city` VALUES ('936', '934', '盐都区', 'yanduqu', '224055', '3', '0');
INSERT INTO `t_city` VALUES ('937', '934', '响水县', 'xiangshuixian', '224600', '3', '0');
INSERT INTO `t_city` VALUES ('938', '934', '滨海县', 'binhaixian', '224500', '3', '0');
INSERT INTO `t_city` VALUES ('939', '934', '阜宁县', 'funingxian', '224400', '3', '0');
INSERT INTO `t_city` VALUES ('940', '934', '射阳县', 'sheyangxian', '224300', '3', '0');
INSERT INTO `t_city` VALUES ('941', '934', '建湖县', 'jianhuxian', '224700', '3', '0');
INSERT INTO `t_city` VALUES ('942', '934', '东台市', 'dongtaishi', '224200', '3', '0');
INSERT INTO `t_city` VALUES ('943', '934', '大丰市', 'dafengshi', '224100', '3', '0');
INSERT INTO `t_city` VALUES ('944', '848', '扬州市', 'yangzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('945', '944', '广陵区', 'guanglingqu', '225002', '3', '0');
INSERT INTO `t_city` VALUES ('946', '944', '邗江区', 'jiangqu', '225002', '3', '0');
INSERT INTO `t_city` VALUES ('947', '944', '宝应县', 'baoyingxian', '225800', '3', '0');
INSERT INTO `t_city` VALUES ('948', '944', '仪征市', 'yizhengshi', '211400', '3', '0');
INSERT INTO `t_city` VALUES ('949', '944', '高邮市', 'gaoyoushi', '225600', '3', '0');
INSERT INTO `t_city` VALUES ('950', '944', '江都市', 'jiangdushi', '225200', '3', '0');
INSERT INTO `t_city` VALUES ('951', '944', '维扬区', 'weiyangqu', '225002', '3', '0');
INSERT INTO `t_city` VALUES ('952', '944', '经济开发区', 'jingjikaifaqu', '225101', '3', '0');
INSERT INTO `t_city` VALUES ('953', '848', '镇江市', 'zhenjiangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('954', '953', '京口区', 'jingkouqu', '212001', '3', '0');
INSERT INTO `t_city` VALUES ('955', '953', '润州区', 'runzhouqu', '212004', '3', '0');
INSERT INTO `t_city` VALUES ('956', '953', '丹徒区', 'dantuqu', '212001', '3', '0');
INSERT INTO `t_city` VALUES ('957', '953', '丹阳市', 'danyangshi', '212300', '3', '0');
INSERT INTO `t_city` VALUES ('958', '953', '扬中市', 'yangzhongshi', '212200', '3', '0');
INSERT INTO `t_city` VALUES ('959', '953', '句容市', 'jurongshi', '212400', '3', '0');
INSERT INTO `t_city` VALUES ('960', '953', '新区', 'xinqu', '212132', '3', '0');
INSERT INTO `t_city` VALUES ('961', '848', '泰州市', 'taizhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('962', '961', '海陵区', 'hailingqu', '225300', '3', '0');
INSERT INTO `t_city` VALUES ('963', '961', '高港区', 'gaogangqu', '225321', '3', '0');
INSERT INTO `t_city` VALUES ('964', '961', '兴化市', 'xinghuashi', '225700', '3', '0');
INSERT INTO `t_city` VALUES ('965', '961', '靖江市', 'jingjiangshi', '214500', '3', '0');
INSERT INTO `t_city` VALUES ('966', '961', '泰兴市', 'taixingshi', '225400', '3', '0');
INSERT INTO `t_city` VALUES ('967', '961', '姜堰市', 'jiangyanshi', '225500', '3', '0');
INSERT INTO `t_city` VALUES ('968', '848', '宿迁市', 'suqianshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('969', '968', '宿城区', 'suchengqu', '223800', '3', '0');
INSERT INTO `t_city` VALUES ('970', '968', '宿豫区', 'suyuqu', '223800', '3', '0');
INSERT INTO `t_city` VALUES ('971', '968', '沭阳县', 'yangxian', '223600', '3', '0');
INSERT INTO `t_city` VALUES ('972', '968', '泗阳县', 'yangxian', '223700', '3', '0');
INSERT INTO `t_city` VALUES ('973', '968', '泗洪县', 'hongxian', '223900', '3', '0');
INSERT INTO `t_city` VALUES ('974', '1', '浙江', 'zhejiang', '0', '1', '0');
INSERT INTO `t_city` VALUES ('975', '974', '杭州市', 'hangzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('976', '975', '上城区', 'shangchengqu', '310002', '3', '0');
INSERT INTO `t_city` VALUES ('977', '975', '下城区', 'xiachengqu', '310006', '3', '0');
INSERT INTO `t_city` VALUES ('978', '975', '江干区', 'jiangganqu', '310016', '3', '0');
INSERT INTO `t_city` VALUES ('979', '975', '拱墅区', 'gongshuqu', '310011', '3', '0');
INSERT INTO `t_city` VALUES ('980', '975', '西湖区', 'xihuqu', '310013', '3', '0');
INSERT INTO `t_city` VALUES ('981', '975', '滨江区', 'binjiangqu', '310051', '3', '0');
INSERT INTO `t_city` VALUES ('982', '975', '萧山区', 'xiaoshanqu', '311200', '3', '0');
INSERT INTO `t_city` VALUES ('983', '975', '余杭区', 'yuhangqu', '311100', '3', '0');
INSERT INTO `t_city` VALUES ('984', '975', '桐庐县', 'tongluxian', '311500', '3', '0');
INSERT INTO `t_city` VALUES ('985', '975', '淳安县', 'chunanxian', '311700', '3', '0');
INSERT INTO `t_city` VALUES ('986', '975', '建德市', 'jiandeshi', '311600', '3', '0');
INSERT INTO `t_city` VALUES ('987', '975', '富阳市', 'fuyangshi', '311400', '3', '0');
INSERT INTO `t_city` VALUES ('988', '975', '临安市', 'linanshi', '311300', '3', '0');
INSERT INTO `t_city` VALUES ('989', '974', '宁波市', 'ningboshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('990', '989', '海曙区', 'haishuqu', '315000', '3', '0');
INSERT INTO `t_city` VALUES ('991', '989', '江东区', 'jiangdongqu', '315040', '3', '0');
INSERT INTO `t_city` VALUES ('992', '989', '江北区', 'jiangbeiqu', '315040', '3', '0');
INSERT INTO `t_city` VALUES ('993', '989', '北仑区', 'beilunqu', '315800', '3', '0');
INSERT INTO `t_city` VALUES ('994', '989', '镇海区', 'zhenhaiqu', '315200', '3', '0');
INSERT INTO `t_city` VALUES ('995', '989', '鄞州区', 'zhouqu', '315100', '3', '0');
INSERT INTO `t_city` VALUES ('996', '989', '象山县', 'xiangshanxian', '315700', '3', '0');
INSERT INTO `t_city` VALUES ('997', '989', '宁海县', 'ninghaixian', '315600', '3', '0');
INSERT INTO `t_city` VALUES ('998', '989', '余姚市', 'yuyaoshi', '315400', '3', '0');
INSERT INTO `t_city` VALUES ('999', '989', '慈溪市', 'cixishi', '315300', '3', '0');
INSERT INTO `t_city` VALUES ('1000', '989', '奉化市', 'fenghuashi', '315500', '3', '0');
INSERT INTO `t_city` VALUES ('1001', '989', '国家高新区', 'guojiagaoxinqu', '315040', '3', '0');
INSERT INTO `t_city` VALUES ('1002', '974', '温州市', 'wenzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1003', '1002', '鹿城区', 'luchengqu', '325000', '3', '0');
INSERT INTO `t_city` VALUES ('1004', '1002', '龙湾区', 'longwanqu', '325013', '3', '0');
INSERT INTO `t_city` VALUES ('1005', '1002', '瓯海区', 'haiqu', '325005', '3', '0');
INSERT INTO `t_city` VALUES ('1006', '1002', '洞头县', 'dongtouxian', '325700', '3', '0');
INSERT INTO `t_city` VALUES ('1007', '1002', '永嘉县', 'yongjiaxian', '315100', '3', '0');
INSERT INTO `t_city` VALUES ('1008', '1002', '平阳县', 'pingyangxian', '325400', '3', '0');
INSERT INTO `t_city` VALUES ('1009', '1002', '苍南县', 'cangnanxian', '325800', '3', '0');
INSERT INTO `t_city` VALUES ('1010', '1002', '文成县', 'wenchengxian', '325300', '3', '0');
INSERT INTO `t_city` VALUES ('1011', '1002', '泰顺县', 'taishunxian', '325500', '3', '0');
INSERT INTO `t_city` VALUES ('1012', '1002', '瑞安市', 'ruianshi', '325200', '3', '0');
INSERT INTO `t_city` VALUES ('1013', '1002', '乐清市', 'leqingshi', '325600', '3', '0');
INSERT INTO `t_city` VALUES ('1014', '974', '嘉兴市', 'jiaxingshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1015', '1014', '秀洲区', 'xiuzhouqu', '314001', '3', '0');
INSERT INTO `t_city` VALUES ('1016', '1014', '嘉善县', 'jiashanxian', '314100', '3', '0');
INSERT INTO `t_city` VALUES ('1017', '1014', '海盐县', 'haiyanxian', '314300', '3', '0');
INSERT INTO `t_city` VALUES ('1018', '1014', '海宁市', 'hainingshi', '314400', '3', '0');
INSERT INTO `t_city` VALUES ('1019', '1014', '平湖市', 'pinghushi', '314200', '3', '0');
INSERT INTO `t_city` VALUES ('1020', '1014', '桐乡市', 'tongxiangshi', '314500', '3', '0');
INSERT INTO `t_city` VALUES ('1021', '1014', '南湖区', 'nanhuqu', '314001', '3', '0');
INSERT INTO `t_city` VALUES ('1022', '974', '湖州市', 'huzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1023', '1022', '吴兴区', 'wuxingqu', '313000', '3', '0');
INSERT INTO `t_city` VALUES ('1024', '1022', '南浔区', 'nanqu', '313009', '3', '0');
INSERT INTO `t_city` VALUES ('1025', '1022', '德清县', 'deqingxian', '313200', '3', '0');
INSERT INTO `t_city` VALUES ('1026', '1022', '长兴县', 'changxingxian', '313100', '3', '0');
INSERT INTO `t_city` VALUES ('1027', '1022', '安吉县', 'anjixian', '313300', '3', '0');
INSERT INTO `t_city` VALUES ('1028', '974', '绍兴市', 'shaoxingshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1029', '1028', '越城区', 'yuechengqu', '312000', '3', '0');
INSERT INTO `t_city` VALUES ('1030', '1028', '绍兴县', 'shaoxingxian', '312000', '3', '0');
INSERT INTO `t_city` VALUES ('1031', '1028', '新昌县', 'xinchangxian', '312500', '3', '0');
INSERT INTO `t_city` VALUES ('1032', '1028', '诸暨市', 'zhushi', '311800', '3', '0');
INSERT INTO `t_city` VALUES ('1033', '1028', '上虞市', 'shangyushi', '312300', '3', '0');
INSERT INTO `t_city` VALUES ('1034', '1028', '嵊州市', 'zhoushi', '312400', '3', '0');
INSERT INTO `t_city` VALUES ('1035', '974', '金华市', 'jinhuashi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1036', '1035', '婺城区', 'chengqu', '321000', '3', '0');
INSERT INTO `t_city` VALUES ('1037', '1035', '金东区', 'jindongqu', '321000', '3', '0');
INSERT INTO `t_city` VALUES ('1038', '1035', '武义县', 'wuyixian', '321200', '3', '0');
INSERT INTO `t_city` VALUES ('1039', '1035', '浦江县', 'pujiangxian', '322200', '3', '0');
INSERT INTO `t_city` VALUES ('1040', '1035', '磐安县', 'pananxian', '322300', '3', '0');
INSERT INTO `t_city` VALUES ('1041', '1035', '兰溪市', 'lanxishi', '321100', '3', '0');
INSERT INTO `t_city` VALUES ('1042', '1035', '义乌市', 'yiwushi', '322000', '3', '0');
INSERT INTO `t_city` VALUES ('1043', '1035', '东阳市', 'dongyangshi', '322100', '3', '0');
INSERT INTO `t_city` VALUES ('1044', '1035', '永康市', 'yongkangshi', '321300', '3', '0');
INSERT INTO `t_city` VALUES ('1045', '974', '衢州市', 'zhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1046', '1045', '柯城区', 'kechengqu', '324100', '3', '0');
INSERT INTO `t_city` VALUES ('1047', '1045', '衢江区', 'jiangqu', '324022', '3', '0');
INSERT INTO `t_city` VALUES ('1048', '1045', '常山县', 'changshanxian', '324200', '3', '0');
INSERT INTO `t_city` VALUES ('1049', '1045', '开化县', 'kaihuaxian', '324300', '3', '0');
INSERT INTO `t_city` VALUES ('1050', '1045', '龙游县', 'longyouxian', '324400', '3', '0');
INSERT INTO `t_city` VALUES ('1051', '1045', '江山市', 'jiangshanshi', '324100', '3', '0');
INSERT INTO `t_city` VALUES ('1052', '974', '舟山市', 'zhoushanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1053', '1052', '定海区', 'dinghaiqu', '316000', '3', '0');
INSERT INTO `t_city` VALUES ('1054', '1052', '普陀区', 'putuoqu', '316100', '3', '0');
INSERT INTO `t_city` VALUES ('1055', '1052', '岱山县', 'shanxian', '316200', '3', '0');
INSERT INTO `t_city` VALUES ('1056', '1052', '嵊泗县', 'xian', '202450', '3', '0');
INSERT INTO `t_city` VALUES ('1057', '974', '台州市', 'taizhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1058', '1057', '椒江区', 'jiaojiangqu', '318000', '3', '0');
INSERT INTO `t_city` VALUES ('1059', '1057', '路桥区', 'luqiaoqu', '318050', '3', '0');
INSERT INTO `t_city` VALUES ('1060', '1057', '黄岩区', 'huangyanqu', '318020', '3', '0');
INSERT INTO `t_city` VALUES ('1061', '1057', '玉环县', 'yuhuanxian', '317600', '3', '0');
INSERT INTO `t_city` VALUES ('1062', '1057', '三门县', 'sanmenxian', '317100', '3', '0');
INSERT INTO `t_city` VALUES ('1063', '1057', '天台县', 'tiantaixian', '317200', '3', '0');
INSERT INTO `t_city` VALUES ('1064', '1057', '仙居县', 'xianjuxian', '317300', '3', '0');
INSERT INTO `t_city` VALUES ('1065', '1057', '温岭市', 'wenlingshi', '317500', '3', '0');
INSERT INTO `t_city` VALUES ('1066', '1057', '临海市', 'linhaishi', '317000', '3', '0');
INSERT INTO `t_city` VALUES ('1067', '974', '丽水市', 'lishuishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1068', '1067', '莲都区', 'lianduqu', '323000', '3', '0');
INSERT INTO `t_city` VALUES ('1069', '1067', '青田县', 'qingtianxian', '323900', '3', '0');
INSERT INTO `t_city` VALUES ('1070', '1067', '缙云县', 'yunxian', '321400', '3', '0');
INSERT INTO `t_city` VALUES ('1071', '1067', '遂昌县', 'suichangxian', '323300', '3', '0');
INSERT INTO `t_city` VALUES ('1072', '1067', '松阳县', 'songyangxian', '323400', '3', '0');
INSERT INTO `t_city` VALUES ('1073', '1067', '云和县', 'yunhexian', '323600', '3', '0');
INSERT INTO `t_city` VALUES ('1074', '1067', '庆元县', 'qingyuanxian', '323800', '3', '0');
INSERT INTO `t_city` VALUES ('1075', '1067', '景宁畲族自治县', 'jingningzuzizhixian', '323500', '3', '0');
INSERT INTO `t_city` VALUES ('1076', '1067', '龙泉市', 'longquanshi', '323700', '3', '0');
INSERT INTO `t_city` VALUES ('1077', '1', '安徽', 'anhui', '0', '1', '0');
INSERT INTO `t_city` VALUES ('1078', '1077', '合肥市', 'hefeishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1079', '1078', '瑶海区', 'yaohaiqu', '230011', '3', '0');
INSERT INTO `t_city` VALUES ('1080', '1078', '庐阳区', 'luyangqu', '230001', '3', '0');
INSERT INTO `t_city` VALUES ('1081', '1078', '蜀山区', 'shushanqu', '230031', '3', '0');
INSERT INTO `t_city` VALUES ('1082', '1078', '包河区', 'baohequ', '230041', '3', '0');
INSERT INTO `t_city` VALUES ('1083', '1078', '长丰县', 'changfengxian', '231100', '3', '0');
INSERT INTO `t_city` VALUES ('1084', '1078', '肥东县', 'feidongxian', '231600', '3', '0');
INSERT INTO `t_city` VALUES ('1085', '1078', '肥西县', 'feixixian', '231200', '3', '0');
INSERT INTO `t_city` VALUES ('1086', '1078', '经济技术开发区', 'jingjijishukaifaqu', '230601', '3', '0');
INSERT INTO `t_city` VALUES ('1087', '1078', '新站试验区', 'xinzhanshiyanqu', '230011', '3', '0');
INSERT INTO `t_city` VALUES ('1088', '1078', '政务文化新区', 'zhengwuwenhuaxinqu', '230066', '3', '0');
INSERT INTO `t_city` VALUES ('1089', '1078', '高新技术产业开发区', 'gaoxinjishuchanyekaifaqu', '230088', '3', '0');
INSERT INTO `t_city` VALUES ('1090', '1077', '芜湖市', 'wuhushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1091', '1090', '镜湖区', 'jinghuqu', '241000', '3', '0');
INSERT INTO `t_city` VALUES ('1092', '1090', '鸠江区', 'jiangqu', '241000', '3', '0');
INSERT INTO `t_city` VALUES ('1093', '1090', '芜湖县', 'wuhuxian', '241100', '3', '0');
INSERT INTO `t_city` VALUES ('1094', '1090', '繁昌县', 'fanchangxian', '241200', '3', '0');
INSERT INTO `t_city` VALUES ('1095', '1090', '南陵县', 'nanlingxian', '242400', '3', '0');
INSERT INTO `t_city` VALUES ('1096', '1090', '弋江区', 'jiangqu', '241000', '3', '0');
INSERT INTO `t_city` VALUES ('1097', '1090', '三山区', 'sanshanqu', '241000', '3', '0');
INSERT INTO `t_city` VALUES ('1098', '1077', '蚌埠市', 'bangbushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1099', '1098', '龙子湖区', 'longzihuqu', '233000', '3', '0');
INSERT INTO `t_city` VALUES ('1100', '1098', '蚌山区', 'bangshanqu', '233000', '3', '0');
INSERT INTO `t_city` VALUES ('1101', '1098', '禹会区', 'yuhuiqu', '233000', '3', '0');
INSERT INTO `t_city` VALUES ('1102', '1098', '淮上区', 'huaishangqu', '233000', '3', '0');
INSERT INTO `t_city` VALUES ('1103', '1098', '怀远县', 'huaiyuanxian', '233400', '3', '0');
INSERT INTO `t_city` VALUES ('1104', '1098', '五河县', 'wuhexian', '233300', '3', '0');
INSERT INTO `t_city` VALUES ('1105', '1098', '固镇县', 'guzhenxian', '233700', '3', '0');
INSERT INTO `t_city` VALUES ('1106', '1077', '淮南市', 'huainanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1107', '1106', '大通区', 'datongqu', '232033', '3', '0');
INSERT INTO `t_city` VALUES ('1108', '1106', '田家庵区', 'tianjiaqu', '232000', '3', '0');
INSERT INTO `t_city` VALUES ('1109', '1106', '谢家集区', 'xiejiajiqu', '232052', '3', '0');
INSERT INTO `t_city` VALUES ('1110', '1106', '八公山区', 'bagongshanqu', '232072', '3', '0');
INSERT INTO `t_city` VALUES ('1111', '1106', '潘集区', 'panjiqu', '232082', '3', '0');
INSERT INTO `t_city` VALUES ('1112', '1106', '凤台县', 'fengtaixian', '232100', '3', '0');
INSERT INTO `t_city` VALUES ('1113', '1077', '马鞍山市', 'maanshanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1114', '1113', '雨山区', 'yushanqu', '243071', '3', '0');
INSERT INTO `t_city` VALUES ('1115', '1113', '花山区', 'huashanqu', '243000', '3', '0');
INSERT INTO `t_city` VALUES ('1116', '1113', '金家庄区', 'jinjiazhuangqu', '243021', '3', '0');
INSERT INTO `t_city` VALUES ('1117', '1113', '当涂县', 'dangtuxian', '243100', '3', '0');
INSERT INTO `t_city` VALUES ('1118', '1113', '经济技术开发区', 'jingjijishukaifaqu', '243041', '3', '0');
INSERT INTO `t_city` VALUES ('1119', '1077', '淮北市', 'huaibeishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1120', '1119', '杜集区', 'dujiqu', '235000', '3', '0');
INSERT INTO `t_city` VALUES ('1121', '1119', '相山区', 'xiangshanqu', '235000', '3', '0');
INSERT INTO `t_city` VALUES ('1122', '1119', '烈山区', 'lieshanqu', '235000', '3', '0');
INSERT INTO `t_city` VALUES ('1123', '1119', '濉溪县', 'xixian', '235100', '3', '0');
INSERT INTO `t_city` VALUES ('1124', '1077', '铜陵市', 'tonglingshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1125', '1124', '铜官山区', 'tongguanshanqu', '244000', '3', '0');
INSERT INTO `t_city` VALUES ('1126', '1124', '狮子山区', 'shizishanqu', '244000', '3', '0');
INSERT INTO `t_city` VALUES ('1127', '1124', '郊区', 'jiaoqu', '244000', '3', '0');
INSERT INTO `t_city` VALUES ('1128', '1124', '铜陵县', 'tonglingxian', '244100', '3', '0');
INSERT INTO `t_city` VALUES ('1129', '1077', '安庆市', 'anqingshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1130', '1129', '迎江区', 'yingjiangqu', '246001', '3', '0');
INSERT INTO `t_city` VALUES ('1131', '1129', '大观区', 'daguanqu', '246002', '3', '0');
INSERT INTO `t_city` VALUES ('1132', '1129', '怀宁县', 'huainingxian', '246100', '3', '0');
INSERT INTO `t_city` VALUES ('1133', '1129', '枞阳县', 'yangxian', '246700', '3', '0');
INSERT INTO `t_city` VALUES ('1134', '1129', '潜山县', 'qianshanxian', '246300', '3', '0');
INSERT INTO `t_city` VALUES ('1135', '1129', '太湖县', 'taihuxian', '246400', '3', '0');
INSERT INTO `t_city` VALUES ('1136', '1129', '宿松县', 'susongxian', '246500', '3', '0');
INSERT INTO `t_city` VALUES ('1137', '1129', '望江县', 'wangjiangxian', '246200', '3', '0');
INSERT INTO `t_city` VALUES ('1138', '1129', '岳西县', 'yuexixian', '246600', '3', '0');
INSERT INTO `t_city` VALUES ('1139', '1129', '桐城市', 'tongchengshi', '231400', '3', '0');
INSERT INTO `t_city` VALUES ('1140', '1129', '宜秀区', 'yixiuqu', '246003', '3', '0');
INSERT INTO `t_city` VALUES ('1141', '1077', '黄山市', 'huangshanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1142', '1141', '屯溪区', 'tunxiqu', '245000', '3', '0');
INSERT INTO `t_city` VALUES ('1143', '1141', '黄山区', 'huangshanqu', '242700', '3', '0');
INSERT INTO `t_city` VALUES ('1144', '1141', '徽州区', 'huizhouqu', '245061', '3', '0');
INSERT INTO `t_city` VALUES ('1145', '1141', '歙县', 'xian', '245200', '3', '0');
INSERT INTO `t_city` VALUES ('1146', '1141', '休宁县', 'xiuningxian', '245400', '3', '0');
INSERT INTO `t_city` VALUES ('1147', '1141', '黟县', 'xian', '245500', '3', '0');
INSERT INTO `t_city` VALUES ('1148', '1141', '祁门县', 'qimenxian', '245600', '3', '0');
INSERT INTO `t_city` VALUES ('1149', '1077', '滁州市', 'chuzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1150', '1149', '琅琊区', 'langqu', '239000', '3', '0');
INSERT INTO `t_city` VALUES ('1151', '1149', '南谯区', 'nanqu', '239000', '3', '0');
INSERT INTO `t_city` VALUES ('1152', '1149', '来安县', 'laianxian', '239200', '3', '0');
INSERT INTO `t_city` VALUES ('1153', '1149', '全椒县', 'quanjiaoxian', '239500', '3', '0');
INSERT INTO `t_city` VALUES ('1154', '1149', '定远县', 'dingyuanxian', '233200', '3', '0');
INSERT INTO `t_city` VALUES ('1155', '1149', '凤阳县', 'fengyangxian', '233100', '3', '0');
INSERT INTO `t_city` VALUES ('1156', '1149', '天长市', 'tianchangshi', '239300', '3', '0');
INSERT INTO `t_city` VALUES ('1157', '1149', '明光市', 'mingguangshi', '239400', '3', '0');
INSERT INTO `t_city` VALUES ('1158', '1077', '阜阳市', 'fuyangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1159', '1158', '颍州区', 'zhouqu', '236001', '3', '0');
INSERT INTO `t_city` VALUES ('1160', '1158', '颍东区', 'dongqu', '236058', '3', '0');
INSERT INTO `t_city` VALUES ('1161', '1158', '颍泉区', 'quanqu', '236045', '3', '0');
INSERT INTO `t_city` VALUES ('1162', '1158', '临泉县', 'linquanxian', '236400', '3', '0');
INSERT INTO `t_city` VALUES ('1163', '1158', '太和县', 'taihexian', '236600', '3', '0');
INSERT INTO `t_city` VALUES ('1164', '1158', '阜南县', 'funanxian', '236300', '3', '0');
INSERT INTO `t_city` VALUES ('1165', '1158', '颍上县', 'shangxian', '236200', '3', '0');
INSERT INTO `t_city` VALUES ('1166', '1158', '界首市', 'jieshoushi', '236500', '3', '0');
INSERT INTO `t_city` VALUES ('1167', '1158', '经济开发区', 'jingjikaifaqu', '236112', '3', '0');
INSERT INTO `t_city` VALUES ('1168', '1077', '宿州市', 'suzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1169', '1168', '埇桥区', '', '234000', '3', '0');
INSERT INTO `t_city` VALUES ('1170', '1168', '砀山县', 'shanxian', '235300', '3', '0');
INSERT INTO `t_city` VALUES ('1171', '1168', '萧县', 'xiaoxian', '235200', '3', '0');
INSERT INTO `t_city` VALUES ('1172', '1168', '灵璧县', 'lingxian', '234200', '3', '0');
INSERT INTO `t_city` VALUES ('1173', '1168', '泗县', 'xian', '234300', '3', '0');
INSERT INTO `t_city` VALUES ('1174', '1077', '巢湖市', 'chaohushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1175', '1174', '居巢区', 'juchaoqu', '238000', '3', '0');
INSERT INTO `t_city` VALUES ('1176', '1174', '庐江县', 'lujiangxian', '231500', '3', '0');
INSERT INTO `t_city` VALUES ('1177', '1174', '无为县', 'wuweixian', '238300', '3', '0');
INSERT INTO `t_city` VALUES ('1178', '1174', '含山县', 'hanshanxian', '238100', '3', '0');
INSERT INTO `t_city` VALUES ('1179', '1174', '和县', 'hexian', '238200', '3', '0');
INSERT INTO `t_city` VALUES ('1180', '1077', '六安市', 'liuanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1181', '1180', '金安区', 'jinanqu', '237000', '3', '0');
INSERT INTO `t_city` VALUES ('1182', '1180', '裕安区', 'yuanqu', '237010', '3', '0');
INSERT INTO `t_city` VALUES ('1183', '1180', '寿县', 'shouxian', '232200', '3', '0');
INSERT INTO `t_city` VALUES ('1184', '1180', '霍邱县', 'huoqiuxian', '237400', '3', '0');
INSERT INTO `t_city` VALUES ('1185', '1180', '舒城县', 'shuchengxian', '231300', '3', '0');
INSERT INTO `t_city` VALUES ('1186', '1180', '金寨县', 'jinzhaixian', '237300', '3', '0');
INSERT INTO `t_city` VALUES ('1187', '1180', '霍山县', 'huoshanxian', '237200', '3', '0');
INSERT INTO `t_city` VALUES ('1188', '1077', '亳州市', 'zhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1189', '1188', '谯城区', 'chengqu', '236800', '3', '0');
INSERT INTO `t_city` VALUES ('1190', '1188', '涡阳县', 'woyangxian', '233600', '3', '0');
INSERT INTO `t_city` VALUES ('1191', '1188', '蒙城县', 'mengchengxian', '233500', '3', '0');
INSERT INTO `t_city` VALUES ('1192', '1188', '利辛县', 'lixinxian', '236700', '3', '0');
INSERT INTO `t_city` VALUES ('1193', '1077', '池州市', 'chizhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1194', '1193', '贵池区', 'guichiqu', '247100', '3', '0');
INSERT INTO `t_city` VALUES ('1195', '1193', '东至县', 'dongzhixian', '247200', '3', '0');
INSERT INTO `t_city` VALUES ('1196', '1193', '石台县', 'shitaixian', '245100', '3', '0');
INSERT INTO `t_city` VALUES ('1197', '1193', '青阳县', 'qingyangxian', '242800', '3', '0');
INSERT INTO `t_city` VALUES ('1198', '1077', '宣城市', 'xuanchengshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1199', '1198', '宣州区', 'xuanzhouqu', '242000', '3', '0');
INSERT INTO `t_city` VALUES ('1200', '1198', '郎溪县', 'langxixian', '242100', '3', '0');
INSERT INTO `t_city` VALUES ('1201', '1198', '广德县', 'guangdexian', '242200', '3', '0');
INSERT INTO `t_city` VALUES ('1202', '1198', '泾县', 'xian', '242500', '3', '0');
INSERT INTO `t_city` VALUES ('1203', '1198', '绩溪县', 'jixixian', '245300', '3', '0');
INSERT INTO `t_city` VALUES ('1204', '1198', '旌德县', 'dexian', '242600', '3', '0');
INSERT INTO `t_city` VALUES ('1205', '1198', '宁国市', 'ningguoshi', '242300', '3', '0');
INSERT INTO `t_city` VALUES ('1206', '1', '福建', 'fujian', '0', '1', '0');
INSERT INTO `t_city` VALUES ('1207', '1206', '福州市', 'fuzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1208', '1207', '鼓楼区', 'gulouqu', '350001', '3', '0');
INSERT INTO `t_city` VALUES ('1209', '1207', '台江区', 'taijiangqu', '350004', '3', '0');
INSERT INTO `t_city` VALUES ('1210', '1207', '仓山区', 'cangshanqu', '350007', '3', '0');
INSERT INTO `t_city` VALUES ('1211', '1207', '马尾区', 'maweiqu', '350015', '3', '0');
INSERT INTO `t_city` VALUES ('1212', '1207', '晋安区', 'jinanqu', '350011', '3', '0');
INSERT INTO `t_city` VALUES ('1213', '1207', '闽侯县', 'minhouxian', '350100', '3', '0');
INSERT INTO `t_city` VALUES ('1214', '1207', '连江县', 'lianjiangxian', '350500', '3', '0');
INSERT INTO `t_city` VALUES ('1215', '1207', '罗源县', 'luoyuanxian', '350600', '3', '0');
INSERT INTO `t_city` VALUES ('1216', '1207', '闽清县', 'minqingxian', '350800', '3', '0');
INSERT INTO `t_city` VALUES ('1217', '1207', '永泰县', 'yongtaixian', '350700', '3', '0');
INSERT INTO `t_city` VALUES ('1218', '1207', '平潭县', 'pingtanxian', '350400', '3', '0');
INSERT INTO `t_city` VALUES ('1219', '1207', '福清市', 'fuqingshi', '350300', '3', '0');
INSERT INTO `t_city` VALUES ('1220', '1207', '长乐市', 'changleshi', '350200', '3', '0');
INSERT INTO `t_city` VALUES ('1221', '1206', '厦门市', 'xiamenshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1222', '1221', '思明区', 'simingqu', '361001', '3', '0');
INSERT INTO `t_city` VALUES ('1223', '1221', '海沧区', 'haicangqu', '361026', '3', '0');
INSERT INTO `t_city` VALUES ('1224', '1221', '湖里区', 'huliqu', '361006', '3', '0');
INSERT INTO `t_city` VALUES ('1225', '1221', '集美区', 'jimeiqu', '361021', '3', '0');
INSERT INTO `t_city` VALUES ('1226', '1221', '同安区', 'tonganqu', '361100', '3', '0');
INSERT INTO `t_city` VALUES ('1227', '1221', '翔安区', 'xianganqu', '361101', '3', '0');
INSERT INTO `t_city` VALUES ('1228', '1221', '鼓浪屿区', 'gulangyuqu', '361002', '3', '0');
INSERT INTO `t_city` VALUES ('1229', '1221', '象屿保税区', 'xiangyubaoshuiqu', '361006', '3', '0');
INSERT INTO `t_city` VALUES ('1230', '1221', '火炬高新区', 'huojugaoxinqu', '361006', '3', '0');
INSERT INTO `t_city` VALUES ('1231', '1206', '莆田市', 'putianshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1232', '1231', '城厢区', 'chengxiangqu', '351100', '3', '0');
INSERT INTO `t_city` VALUES ('1233', '1231', '涵江区', 'hanjiangqu', '351111', '3', '0');
INSERT INTO `t_city` VALUES ('1234', '1231', '荔城区', 'lichengqu', '351100', '3', '0');
INSERT INTO `t_city` VALUES ('1235', '1231', '秀屿区', 'xiuyuqu', '351152', '3', '0');
INSERT INTO `t_city` VALUES ('1236', '1231', '仙游县', 'xianyouxian', '351200', '3', '0');
INSERT INTO `t_city` VALUES ('1237', '1206', '三明市', 'sanmingshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1238', '1237', '梅列区', 'meiliequ', '365000', '3', '0');
INSERT INTO `t_city` VALUES ('1239', '1237', '三元区', 'sanyuanqu', '365001', '3', '0');
INSERT INTO `t_city` VALUES ('1240', '1237', '明溪县', 'mingxixian', '365200', '3', '0');
INSERT INTO `t_city` VALUES ('1241', '1237', '清流县', 'qingliuxian', '365300', '3', '0');
INSERT INTO `t_city` VALUES ('1242', '1237', '宁化县', 'ninghuaxian', '365400', '3', '0');
INSERT INTO `t_city` VALUES ('1243', '1237', '大田县', 'datianxian', '366100', '3', '0');
INSERT INTO `t_city` VALUES ('1244', '1237', '尤溪县', 'youxixian', '365100', '3', '0');
INSERT INTO `t_city` VALUES ('1245', '1237', '沙县', 'shaxian', '365500', '3', '0');
INSERT INTO `t_city` VALUES ('1246', '1237', '将乐县', 'jianglexian', '353300', '3', '0');
INSERT INTO `t_city` VALUES ('1247', '1237', '泰宁县', 'tainingxian', '354400', '3', '0');
INSERT INTO `t_city` VALUES ('1248', '1237', '建宁县', 'jianningxian', '354500', '3', '0');
INSERT INTO `t_city` VALUES ('1249', '1237', '永安市', 'yonganshi', '366000', '3', '0');
INSERT INTO `t_city` VALUES ('1250', '1206', '泉州市', 'quanzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1251', '1250', '鲤城区', 'lichengqu', '362000', '3', '0');
INSERT INTO `t_city` VALUES ('1252', '1250', '丰泽区', 'fengzequ', '362000', '3', '0');
INSERT INTO `t_city` VALUES ('1253', '1250', '洛江区', 'luojiangqu', '362011', '3', '0');
INSERT INTO `t_city` VALUES ('1254', '1250', '泉港区', 'quangangqu', '362114', '3', '0');
INSERT INTO `t_city` VALUES ('1255', '1250', '惠安县', 'huianxian', '362100', '3', '0');
INSERT INTO `t_city` VALUES ('1256', '1250', '安溪县', 'anxixian', '362400', '3', '0');
INSERT INTO `t_city` VALUES ('1257', '1250', '永春县', 'yongchunxian', '362600', '3', '0');
INSERT INTO `t_city` VALUES ('1258', '1250', '德化县', 'dehuaxian', '362500', '3', '0');
INSERT INTO `t_city` VALUES ('1259', '1250', '金门县', 'jinmenxian', '362000', '3', '0');
INSERT INTO `t_city` VALUES ('1260', '1250', '石狮市', 'shishishi', '362700', '3', '0');
INSERT INTO `t_city` VALUES ('1261', '1250', '晋江市', 'jinjiangshi', '362200', '3', '0');
INSERT INTO `t_city` VALUES ('1262', '1250', '南安市', 'nananshi', '362300', '3', '0');
INSERT INTO `t_city` VALUES ('1263', '1250', '经济技术开发区', 'jingjijishukaifaqu', '362005', '3', '0');
INSERT INTO `t_city` VALUES ('1264', '1206', '漳州市', 'zhangzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1265', '1264', '芗城区', 'chengqu', '363000', '3', '0');
INSERT INTO `t_city` VALUES ('1266', '1264', '龙文区', 'longwenqu', '363005', '3', '0');
INSERT INTO `t_city` VALUES ('1267', '1264', '云霄县', 'yunxiaoxian', '363300', '3', '0');
INSERT INTO `t_city` VALUES ('1268', '1264', '漳浦县', 'zhangpuxian', '363200', '3', '0');
INSERT INTO `t_city` VALUES ('1269', '1264', '诏安县', 'anxian', '363500', '3', '0');
INSERT INTO `t_city` VALUES ('1270', '1264', '长泰县', 'changtaixian', '363900', '3', '0');
INSERT INTO `t_city` VALUES ('1271', '1264', '东山县', 'dongshanxian', '363400', '3', '0');
INSERT INTO `t_city` VALUES ('1272', '1264', '南靖县', 'nanjingxian', '363600', '3', '0');
INSERT INTO `t_city` VALUES ('1273', '1264', '平和县', 'pinghexian', '363700', '3', '0');
INSERT INTO `t_city` VALUES ('1274', '1264', '华安县', 'huaanxian', '363800', '3', '0');
INSERT INTO `t_city` VALUES ('1275', '1264', '龙海市', 'longhaishi', '363100', '3', '0');
INSERT INTO `t_city` VALUES ('1276', '1206', '南平市', 'nanpingshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1277', '1276', '延平区', 'yanpingqu', '353000', '3', '0');
INSERT INTO `t_city` VALUES ('1278', '1276', '顺昌县', 'shunchangxian', '353200', '3', '0');
INSERT INTO `t_city` VALUES ('1279', '1276', '浦城县', 'puchengxian', '353400', '3', '0');
INSERT INTO `t_city` VALUES ('1280', '1276', '光泽县', 'guangzexian', '354100', '3', '0');
INSERT INTO `t_city` VALUES ('1281', '1276', '松溪县', 'songxixian', '353500', '3', '0');
INSERT INTO `t_city` VALUES ('1282', '1276', '政和县', 'zhenghexian', '353600', '3', '0');
INSERT INTO `t_city` VALUES ('1283', '1276', '邵武市', 'shaowushi', '354000', '3', '0');
INSERT INTO `t_city` VALUES ('1284', '1276', '武夷山市', 'wuyishanshi', '354300', '3', '0');
INSERT INTO `t_city` VALUES ('1285', '1276', '建瓯市', 'jianshi', '353100', '3', '0');
INSERT INTO `t_city` VALUES ('1286', '1276', '建阳市', 'jianyangshi', '354200', '3', '0');
INSERT INTO `t_city` VALUES ('1287', '1206', '龙岩市', 'longyanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1288', '1287', '新罗区', 'xinluoqu', '364000', '3', '0');
INSERT INTO `t_city` VALUES ('1289', '1287', '长汀县', 'changtingxian', '366300', '3', '0');
INSERT INTO `t_city` VALUES ('1290', '1287', '永定县', 'yongdingxian', '364100', '3', '0');
INSERT INTO `t_city` VALUES ('1291', '1287', '上杭县', 'shanghangxian', '364200', '3', '0');
INSERT INTO `t_city` VALUES ('1292', '1287', '武平县', 'wupingxian', '364300', '3', '0');
INSERT INTO `t_city` VALUES ('1293', '1287', '连城县', 'lianchengxian', '366200', '3', '0');
INSERT INTO `t_city` VALUES ('1294', '1287', '漳平市', 'zhangpingshi', '364400', '3', '0');
INSERT INTO `t_city` VALUES ('1295', '1206', '宁德市', 'ningdeshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1296', '1295', '蕉城区', 'jiaochengqu', '352100', '3', '0');
INSERT INTO `t_city` VALUES ('1297', '1295', '霞浦县', 'xiapuxian', '355100', '3', '0');
INSERT INTO `t_city` VALUES ('1298', '1295', '古田县', 'gutianxian', '352200', '3', '0');
INSERT INTO `t_city` VALUES ('1299', '1295', '屏南县', 'pingnanxian', '352300', '3', '0');
INSERT INTO `t_city` VALUES ('1300', '1295', '寿宁县', 'shouningxian', '355500', '3', '0');
INSERT INTO `t_city` VALUES ('1301', '1295', '周宁县', 'zhouningxian', '355400', '3', '0');
INSERT INTO `t_city` VALUES ('1302', '1295', '柘荣县', 'rongxian', '355300', '3', '0');
INSERT INTO `t_city` VALUES ('1303', '1295', '福安市', 'fuanshi', '355000', '3', '0');
INSERT INTO `t_city` VALUES ('1304', '1295', '福鼎市', 'fudingshi', '355200', '3', '0');
INSERT INTO `t_city` VALUES ('1305', '1', '江西', 'jiangxi', '0', '1', '0');
INSERT INTO `t_city` VALUES ('1306', '1305', '南昌市', 'nanchangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1307', '1306', '东湖区', 'donghuqu', '330006', '3', '0');
INSERT INTO `t_city` VALUES ('1308', '1306', '西湖区', 'xihuqu', '330009', '3', '0');
INSERT INTO `t_city` VALUES ('1309', '1306', '青云谱区', 'qingyunpuqu', '330001', '3', '0');
INSERT INTO `t_city` VALUES ('1310', '1306', '湾里区', 'wanliqu', '330004', '3', '0');
INSERT INTO `t_city` VALUES ('1311', '1306', '青山湖区', 'qingshanhuqu', '330029', '3', '0');
INSERT INTO `t_city` VALUES ('1312', '1306', '南昌县', 'nanchangxian', '330200', '3', '0');
INSERT INTO `t_city` VALUES ('1313', '1306', '新建县', 'xinjianxian', '330100', '3', '0');
INSERT INTO `t_city` VALUES ('1314', '1306', '安义县', 'anyixian', '330500', '3', '0');
INSERT INTO `t_city` VALUES ('1315', '1306', '进贤县', 'jinxianxian', '331700', '3', '0');
INSERT INTO `t_city` VALUES ('1316', '1306', '经济技术开发区', 'jingjijishukaifaqu', '330013', '3', '0');
INSERT INTO `t_city` VALUES ('1317', '1306', '红谷滩新区', 'honggutanxinqu', '330038', '3', '0');
INSERT INTO `t_city` VALUES ('1318', '1306', '高新技术产业开发区', 'gaoxinjishuchanyekaifaqu', '330029', '3', '0');
INSERT INTO `t_city` VALUES ('1319', '1306', '桑海经济技术开发区', 'sanghaijingjijishukaifaqu', '330115', '3', '0');
INSERT INTO `t_city` VALUES ('1320', '1306', '英雄经济开发区', 'yingxiongjingjikaifaqu', '330200', '3', '0');
INSERT INTO `t_city` VALUES ('1321', '1305', '景德镇市', 'jingdezhenshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1322', '1321', '昌江区', 'changjiangqu', '333000', '3', '0');
INSERT INTO `t_city` VALUES ('1323', '1321', '珠山区', 'zhushanqu', '333000', '3', '0');
INSERT INTO `t_city` VALUES ('1324', '1321', '浮梁县', 'fuliangxian', '333400', '3', '0');
INSERT INTO `t_city` VALUES ('1325', '1321', '乐平市', 'lepingshi', '333300', '3', '0');
INSERT INTO `t_city` VALUES ('1326', '1305', '萍乡市', 'pingxiangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1327', '1326', '安源区', 'anyuanqu', '337000', '3', '0');
INSERT INTO `t_city` VALUES ('1328', '1326', '湘东区', 'xiangdongqu', '337016', '3', '0');
INSERT INTO `t_city` VALUES ('1329', '1326', '莲花县', 'lianhuaxian', '337100', '3', '0');
INSERT INTO `t_city` VALUES ('1330', '1326', '上栗县', 'shanglixian', '337009', '3', '0');
INSERT INTO `t_city` VALUES ('1331', '1326', '芦溪县', 'luxixian', '337053', '3', '0');
INSERT INTO `t_city` VALUES ('1332', '1305', '九江市', 'jiujiangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1333', '1332', '庐山区', 'lushanqu', '332005', '3', '0');
INSERT INTO `t_city` VALUES ('1334', '1332', '浔阳区', 'yangqu', '332000', '3', '0');
INSERT INTO `t_city` VALUES ('1335', '1332', '九江县', 'jiujiangxian', '332100', '3', '0');
INSERT INTO `t_city` VALUES ('1336', '1332', '武宁县', 'wuningxian', '332300', '3', '0');
INSERT INTO `t_city` VALUES ('1337', '1332', '修水县', 'xiushuixian', '332400', '3', '0');
INSERT INTO `t_city` VALUES ('1338', '1332', '永修县', 'yongxiuxian', '330300', '3', '0');
INSERT INTO `t_city` VALUES ('1339', '1332', '德安县', 'deanxian', '330400', '3', '0');
INSERT INTO `t_city` VALUES ('1340', '1332', '星子县', 'xingzixian', '332800', '3', '0');
INSERT INTO `t_city` VALUES ('1341', '1332', '都昌县', 'duchangxian', '332600', '3', '0');
INSERT INTO `t_city` VALUES ('1342', '1332', '湖口县', 'hukouxian', '332500', '3', '0');
INSERT INTO `t_city` VALUES ('1343', '1332', '彭泽县', 'pengzexian', '332700', '3', '0');
INSERT INTO `t_city` VALUES ('1344', '1332', '瑞昌市', 'ruichangshi', '332200', '3', '0');
INSERT INTO `t_city` VALUES ('1345', '1332', '共青城市', 'gongqingchengshi', '332020', '3', '0');
INSERT INTO `t_city` VALUES ('1346', '1305', '新余市', 'xinyushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1347', '1346', '渝水区', 'yushuiqu', '338025', '3', '0');
INSERT INTO `t_city` VALUES ('1348', '1346', '分宜县', 'fenyixian', '336600', '3', '0');
INSERT INTO `t_city` VALUES ('1349', '1305', '鹰潭市', 'yingtanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1350', '1349', '月湖区', 'yuehuqu', '335000', '3', '0');
INSERT INTO `t_city` VALUES ('1351', '1349', '余江县', 'yujiangxian', '335200', '3', '0');
INSERT INTO `t_city` VALUES ('1352', '1349', '贵溪市', 'guixishi', '335400', '3', '0');
INSERT INTO `t_city` VALUES ('1353', '1305', '赣州市', 'ganzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1354', '1353', '章贡区', 'zhanggongqu', '341000', '3', '0');
INSERT INTO `t_city` VALUES ('1355', '1353', '赣县', 'ganxian', '341100', '3', '0');
INSERT INTO `t_city` VALUES ('1356', '1353', '信丰县', 'xinfengxian', '341600', '3', '0');
INSERT INTO `t_city` VALUES ('1357', '1353', '大余县', 'dayuxian', '341500', '3', '0');
INSERT INTO `t_city` VALUES ('1358', '1353', '上犹县', 'shangyouxian', '341200', '3', '0');
INSERT INTO `t_city` VALUES ('1359', '1353', '崇义县', 'chongyixian', '341300', '3', '0');
INSERT INTO `t_city` VALUES ('1360', '1353', '安远县', 'anyuanxian', '342100', '3', '0');
INSERT INTO `t_city` VALUES ('1361', '1353', '龙南县', 'longnanxian', '341700', '3', '0');
INSERT INTO `t_city` VALUES ('1362', '1353', '定南县', 'dingnanxian', '341900', '3', '0');
INSERT INTO `t_city` VALUES ('1363', '1353', '全南县', 'quannanxian', '341800', '3', '0');
INSERT INTO `t_city` VALUES ('1364', '1353', '宁都县', 'ningduxian', '342800', '3', '0');
INSERT INTO `t_city` VALUES ('1365', '1353', '于都县', 'yuduxian', '342300', '3', '0');
INSERT INTO `t_city` VALUES ('1366', '1353', '兴国县', 'xingguoxian', '342400', '3', '0');
INSERT INTO `t_city` VALUES ('1367', '1353', '会昌县', 'huichangxian', '342600', '3', '0');
INSERT INTO `t_city` VALUES ('1368', '1353', '寻乌县', 'xunwuxian', '342200', '3', '0');
INSERT INTO `t_city` VALUES ('1369', '1353', '石城县', 'shichengxian', '342700', '3', '0');
INSERT INTO `t_city` VALUES ('1370', '1353', '瑞金市', 'ruijinshi', '342500', '3', '0');
INSERT INTO `t_city` VALUES ('1371', '1353', '南康市', 'nankangshi', '341400', '3', '0');
INSERT INTO `t_city` VALUES ('1372', '1305', '吉安市', 'jianshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1373', '1372', '吉州区', 'jizhouqu', '343000', '3', '0');
INSERT INTO `t_city` VALUES ('1374', '1372', '青原区', 'qingyuanqu', '343009', '3', '0');
INSERT INTO `t_city` VALUES ('1375', '1372', '吉安县', 'jianxian', '343100', '3', '0');
INSERT INTO `t_city` VALUES ('1376', '1372', '吉水县', 'jishuixian', '331600', '3', '0');
INSERT INTO `t_city` VALUES ('1377', '1372', '峡江县', 'xiajiangxian', '331400', '3', '0');
INSERT INTO `t_city` VALUES ('1378', '1372', '新干县', 'xinganxian', '331300', '3', '0');
INSERT INTO `t_city` VALUES ('1379', '1372', '永丰县', 'yongfengxian', '331500', '3', '0');
INSERT INTO `t_city` VALUES ('1380', '1372', '泰和县', 'taihexian', '343700', '3', '0');
INSERT INTO `t_city` VALUES ('1381', '1372', '遂川县', 'suichuanxian', '343900', '3', '0');
INSERT INTO `t_city` VALUES ('1382', '1372', '万安县', 'wananxian', '343800', '3', '0');
INSERT INTO `t_city` VALUES ('1383', '1372', '安福县', 'anfuxian', '343200', '3', '0');
INSERT INTO `t_city` VALUES ('1384', '1372', '永新县', 'yongxinxian', '343400', '3', '0');
INSERT INTO `t_city` VALUES ('1385', '1372', '井冈山市', 'jinggangshanshi', '343600', '3', '0');
INSERT INTO `t_city` VALUES ('1386', '1305', '宜春市', 'yichunshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1387', '1386', '袁州区', 'yuanzhouqu', '336000', '3', '0');
INSERT INTO `t_city` VALUES ('1388', '1386', '奉新县', 'fengxinxian', '330700', '3', '0');
INSERT INTO `t_city` VALUES ('1389', '1386', '万载县', 'wanzaixian', '336100', '3', '0');
INSERT INTO `t_city` VALUES ('1390', '1386', '上高县', 'shanggaoxian', '336400', '3', '0');
INSERT INTO `t_city` VALUES ('1391', '1386', '宜丰县', 'yifengxian', '336300', '3', '0');
INSERT INTO `t_city` VALUES ('1392', '1386', '靖安县', 'jinganxian', '330600', '3', '0');
INSERT INTO `t_city` VALUES ('1393', '1386', '铜鼓县', 'tongguxian', '336200', '3', '0');
INSERT INTO `t_city` VALUES ('1394', '1386', '丰城市', 'fengchengshi', '331100', '3', '0');
INSERT INTO `t_city` VALUES ('1395', '1386', '樟树市', 'zhangshushi', '331200', '3', '0');
INSERT INTO `t_city` VALUES ('1396', '1386', '高安市', 'gaoanshi', '330800', '3', '0');
INSERT INTO `t_city` VALUES ('1397', '1305', '抚州市', 'fuzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1398', '1397', '临川区', 'linchuanqu', '344100', '3', '0');
INSERT INTO `t_city` VALUES ('1399', '1397', '南城县', 'nanchengxian', '344700', '3', '0');
INSERT INTO `t_city` VALUES ('1400', '1397', '黎川县', 'lichuanxian', '344600', '3', '0');
INSERT INTO `t_city` VALUES ('1401', '1397', '南丰县', 'nanfengxian', '344500', '3', '0');
INSERT INTO `t_city` VALUES ('1402', '1397', '崇仁县', 'chongrenxian', '344200', '3', '0');
INSERT INTO `t_city` VALUES ('1403', '1397', '乐安县', 'leanxian', '344300', '3', '0');
INSERT INTO `t_city` VALUES ('1404', '1397', '宜黄县', 'yihuangxian', '344400', '3', '0');
INSERT INTO `t_city` VALUES ('1405', '1397', '金溪县', 'jinxixian', '344800', '3', '0');
INSERT INTO `t_city` VALUES ('1406', '1397', '资溪县', 'zixixian', '335300', '3', '0');
INSERT INTO `t_city` VALUES ('1407', '1397', '东乡县', 'dongxiangxian', '331800', '3', '0');
INSERT INTO `t_city` VALUES ('1408', '1397', '广昌县', 'guangchangxian', '344900', '3', '0');
INSERT INTO `t_city` VALUES ('1409', '1305', '上饶市', 'shangraoshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1410', '1409', '信州区', 'xinzhouqu', '334000', '3', '0');
INSERT INTO `t_city` VALUES ('1411', '1409', '上饶县', 'shangraoxian', '334100', '3', '0');
INSERT INTO `t_city` VALUES ('1412', '1409', '广丰县', 'guangfengxian', '334600', '3', '0');
INSERT INTO `t_city` VALUES ('1413', '1409', '玉山县', 'yushanxian', '334700', '3', '0');
INSERT INTO `t_city` VALUES ('1414', '1409', '铅山县', 'qianshanxian', '334500', '3', '0');
INSERT INTO `t_city` VALUES ('1415', '1409', '横峰县', 'hengfengxian', '334300', '3', '0');
INSERT INTO `t_city` VALUES ('1416', '1409', '弋阳县', 'yangxian', '334400', '3', '0');
INSERT INTO `t_city` VALUES ('1417', '1409', '余干县', 'yuganxian', '335100', '3', '0');
INSERT INTO `t_city` VALUES ('1418', '1409', '鄱阳县', 'yangxian', '333100', '3', '0');
INSERT INTO `t_city` VALUES ('1419', '1409', '万年县', 'wannianxian', '335500', '3', '0');
INSERT INTO `t_city` VALUES ('1420', '1409', '婺源县', 'yuanxian', '333200', '3', '0');
INSERT INTO `t_city` VALUES ('1421', '1409', '德兴市', 'dexingshi', '334200', '3', '0');
INSERT INTO `t_city` VALUES ('1422', '1', '山东', 'shandong', '0', '1', '0');
INSERT INTO `t_city` VALUES ('1423', '1422', '济南市', 'jinanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1424', '1423', '历下区', 'lixiaqu', '250014', '3', '0');
INSERT INTO `t_city` VALUES ('1425', '1423', '市中区', 'shizhongqu', '250001', '3', '0');
INSERT INTO `t_city` VALUES ('1426', '1423', '槐荫区', 'huaiyinqu', '250022', '3', '0');
INSERT INTO `t_city` VALUES ('1427', '1423', '天桥区', 'tianqiaoqu', '250031', '3', '0');
INSERT INTO `t_city` VALUES ('1428', '1423', '历城区', 'lichengqu', '250100', '3', '0');
INSERT INTO `t_city` VALUES ('1429', '1423', '长清区', 'changqingqu', '250300', '3', '0');
INSERT INTO `t_city` VALUES ('1430', '1423', '平阴县', 'pingyinxian', '250400', '3', '0');
INSERT INTO `t_city` VALUES ('1431', '1423', '济阳县', 'jiyangxian', '251400', '3', '0');
INSERT INTO `t_city` VALUES ('1432', '1423', '商河县', 'shanghexian', '251600', '3', '0');
INSERT INTO `t_city` VALUES ('1433', '1423', '章丘市', 'zhangqiushi', '250200', '3', '0');
INSERT INTO `t_city` VALUES ('1434', '1423', '高新区', 'gaoxinqu', '250101', '3', '0');
INSERT INTO `t_city` VALUES ('1435', '1423', '经济开发区', 'jingjikaifaqu', '250300', '3', '0');
INSERT INTO `t_city` VALUES ('1436', '1422', '青岛市', 'qingdaoshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1437', '1436', '市南区', 'shinanqu', '266001', '3', '0');
INSERT INTO `t_city` VALUES ('1438', '1436', '市北区', 'shibeiqu', '266011', '3', '0');
INSERT INTO `t_city` VALUES ('1439', '1436', '四方区', 'sifangqu', '266031', '3', '0');
INSERT INTO `t_city` VALUES ('1440', '1436', '黄岛区', 'huangdaoqu', '266500', '3', '0');
INSERT INTO `t_city` VALUES ('1441', '1436', '崂山区', 'shanqu', '266100', '3', '0');
INSERT INTO `t_city` VALUES ('1442', '1436', '李沧区', 'licangqu', '266021', '3', '0');
INSERT INTO `t_city` VALUES ('1443', '1436', '城阳区', 'chengyangqu', '266041', '3', '0');
INSERT INTO `t_city` VALUES ('1444', '1436', '胶州市', 'jiaozhoushi', '266300', '3', '0');
INSERT INTO `t_city` VALUES ('1445', '1436', '即墨市', 'jimoshi', '266200', '3', '0');
INSERT INTO `t_city` VALUES ('1446', '1436', '平度市', 'pingdushi', '266700', '3', '0');
INSERT INTO `t_city` VALUES ('1447', '1436', '胶南市', 'jiaonanshi', '266400', '3', '0');
INSERT INTO `t_city` VALUES ('1448', '1436', '莱西市', 'laixishi', '266600', '3', '0');
INSERT INTO `t_city` VALUES ('1449', '1422', '淄博市', 'ziboshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1450', '1449', '淄川区', 'zichuanqu', '255100', '3', '0');
INSERT INTO `t_city` VALUES ('1451', '1449', '张店区', 'zhangdianqu', '255022', '3', '0');
INSERT INTO `t_city` VALUES ('1452', '1449', '博山区', 'boshanqu', '255200', '3', '0');
INSERT INTO `t_city` VALUES ('1453', '1449', '临淄区', 'linziqu', '255400', '3', '0');
INSERT INTO `t_city` VALUES ('1454', '1449', '周村区', 'zhoucunqu', '255300', '3', '0');
INSERT INTO `t_city` VALUES ('1455', '1449', '桓台县', 'huantaixian', '256400', '3', '0');
INSERT INTO `t_city` VALUES ('1456', '1449', '高青县', 'gaoqingxian', '256300', '3', '0');
INSERT INTO `t_city` VALUES ('1457', '1449', '沂源县', 'yiyuanxian', '256100', '3', '0');
INSERT INTO `t_city` VALUES ('1458', '1449', '高新区', 'gaoxinqu', '255086', '3', '0');
INSERT INTO `t_city` VALUES ('1459', '1422', '枣庄市', 'zaozhuangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1460', '1459', '市中区', 'shizhongqu', '277101', '3', '0');
INSERT INTO `t_city` VALUES ('1461', '1459', '薛城区', 'xuechengqu', '277000', '3', '0');
INSERT INTO `t_city` VALUES ('1462', '1459', '峄城区', 'chengqu', '277300', '3', '0');
INSERT INTO `t_city` VALUES ('1463', '1459', '台儿庄区', 'taierzhuangqu', '277400', '3', '0');
INSERT INTO `t_city` VALUES ('1464', '1459', '山亭区', 'shantingqu', '277200', '3', '0');
INSERT INTO `t_city` VALUES ('1465', '1459', '滕州市', 'zhoushi', '277500', '3', '0');
INSERT INTO `t_city` VALUES ('1466', '1422', '东营市', 'dongyingshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1467', '1466', '东营区', 'dongyingqu', '257029', '3', '0');
INSERT INTO `t_city` VALUES ('1468', '1466', '河口区', 'hekouqu', '257200', '3', '0');
INSERT INTO `t_city` VALUES ('1469', '1466', '垦利县', 'kenlixian', '257500', '3', '0');
INSERT INTO `t_city` VALUES ('1470', '1466', '利津县', 'lijinxian', '257400', '3', '0');
INSERT INTO `t_city` VALUES ('1471', '1466', '广饶县', 'guangraoxian', '257300', '3', '0');
INSERT INTO `t_city` VALUES ('1472', '1422', '烟台市', 'yantaishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1473', '1472', '芝罘区', 'zhiqu', '264001', '3', '0');
INSERT INTO `t_city` VALUES ('1474', '1472', '福山区', 'fushanqu', '265500', '3', '0');
INSERT INTO `t_city` VALUES ('1475', '1472', '牟平区', 'moupingqu', '264100', '3', '0');
INSERT INTO `t_city` VALUES ('1476', '1472', '莱山区', 'laishanqu', '264600', '3', '0');
INSERT INTO `t_city` VALUES ('1477', '1472', '长岛县', 'changdaoxian', '265800', '3', '0');
INSERT INTO `t_city` VALUES ('1478', '1472', '龙口市', 'longkoushi', '265700', '3', '0');
INSERT INTO `t_city` VALUES ('1479', '1472', '莱阳市', 'laiyangshi', '265200', '3', '0');
INSERT INTO `t_city` VALUES ('1480', '1472', '莱州市', 'laizhoushi', '261400', '3', '0');
INSERT INTO `t_city` VALUES ('1481', '1472', '蓬莱市', 'penglaishi', '265600', '3', '0');
INSERT INTO `t_city` VALUES ('1482', '1472', '招远市', 'zhaoyuanshi', '265400', '3', '0');
INSERT INTO `t_city` VALUES ('1483', '1472', '栖霞市', 'qixiashi', '265300', '3', '0');
INSERT INTO `t_city` VALUES ('1484', '1472', '海阳市', 'haiyangshi', '265100', '3', '0');
INSERT INTO `t_city` VALUES ('1485', '1472', '开发区', 'kaifaqu', '264006', '3', '0');
INSERT INTO `t_city` VALUES ('1486', '1422', '潍坊市', 'weifangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1487', '1486', '潍城区', 'weichengqu', '261021', '3', '0');
INSERT INTO `t_city` VALUES ('1488', '1486', '寒亭区', 'hantingqu', '261100', '3', '0');
INSERT INTO `t_city` VALUES ('1489', '1486', '坊子区', 'fangziqu', '261200', '3', '0');
INSERT INTO `t_city` VALUES ('1490', '1486', '奎文区', 'kuiwenqu', '261031', '3', '0');
INSERT INTO `t_city` VALUES ('1491', '1486', '临朐县', 'linxian', '262600', '3', '0');
INSERT INTO `t_city` VALUES ('1492', '1486', '昌乐县', 'changlexian', '262400', '3', '0');
INSERT INTO `t_city` VALUES ('1493', '1486', '青州市', 'qingzhoushi', '262500', '3', '0');
INSERT INTO `t_city` VALUES ('1494', '1486', '诸城市', 'zhuchengshi', '262200', '3', '0');
INSERT INTO `t_city` VALUES ('1495', '1486', '寿光市', 'shouguangshi', '262700', '3', '0');
INSERT INTO `t_city` VALUES ('1496', '1486', '安丘市', 'anqiushi', '262100', '3', '0');
INSERT INTO `t_city` VALUES ('1497', '1486', '高密市', 'gaomishi', '261500', '3', '0');
INSERT INTO `t_city` VALUES ('1498', '1486', '昌邑市', 'changyishi', '261300', '3', '0');
INSERT INTO `t_city` VALUES ('1499', '1486', '经济开发区', 'jingjikaifaqu', '261061', '3', '0');
INSERT INTO `t_city` VALUES ('1500', '1486', '滨海经济开发区', 'binhaijingjikaifaqu', '262737', '3', '0');
INSERT INTO `t_city` VALUES ('1501', '1486', '高新技术开发区', 'gaoxinjishukaifaqu', '261061', '3', '0');
INSERT INTO `t_city` VALUES ('1502', '1486', '出口加工区', 'chukoujiagongqu', '261205', '3', '0');
INSERT INTO `t_city` VALUES ('1503', '1422', '济宁市', 'jiningshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1504', '1503', '市中区', 'shizhongqu', '272133', '3', '0');
INSERT INTO `t_city` VALUES ('1505', '1503', '任城区', 'renchengqu', '272113', '3', '0');
INSERT INTO `t_city` VALUES ('1506', '1503', '微山县', 'weishanxian', '277600', '3', '0');
INSERT INTO `t_city` VALUES ('1507', '1503', '鱼台县', 'yutaixian', '272300', '3', '0');
INSERT INTO `t_city` VALUES ('1508', '1503', '金乡县', 'jinxiangxian', '272200', '3', '0');
INSERT INTO `t_city` VALUES ('1509', '1503', '嘉祥县', 'jiaxiangxian', '272400', '3', '0');
INSERT INTO `t_city` VALUES ('1510', '1503', '汶上县', 'shangxian', '272501', '3', '0');
INSERT INTO `t_city` VALUES ('1511', '1503', '泗水县', 'shuixian', '273200', '3', '0');
INSERT INTO `t_city` VALUES ('1512', '1503', '梁山县', 'liangshanxian', '272600', '3', '0');
INSERT INTO `t_city` VALUES ('1513', '1503', '曲阜市', 'qufushi', '273100', '3', '0');
INSERT INTO `t_city` VALUES ('1514', '1503', '兖州市', 'zhoushi', '272000', '3', '0');
INSERT INTO `t_city` VALUES ('1515', '1503', '邹城市', 'zouchengshi', '273500', '3', '0');
INSERT INTO `t_city` VALUES ('1516', '1422', '泰安市', 'taianshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1517', '1516', '泰山区', 'taishanqu', '271000', '3', '0');
INSERT INTO `t_city` VALUES ('1518', '1516', '岱岳区', 'yuequ', '271000', '3', '0');
INSERT INTO `t_city` VALUES ('1519', '1516', '宁阳县', 'ningyangxian', '271400', '3', '0');
INSERT INTO `t_city` VALUES ('1520', '1516', '东平县', 'dongpingxian', '271500', '3', '0');
INSERT INTO `t_city` VALUES ('1521', '1516', '新泰市', 'xintaishi', '271200', '3', '0');
INSERT INTO `t_city` VALUES ('1522', '1516', '肥城市', 'feichengshi', '271600', '3', '0');
INSERT INTO `t_city` VALUES ('1523', '1422', '威海市', 'weihaishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1524', '1523', '环翠区', 'huancuiqu', '264200', '3', '0');
INSERT INTO `t_city` VALUES ('1525', '1523', '文登市', 'wendengshi', '264400', '3', '0');
INSERT INTO `t_city` VALUES ('1526', '1523', '荣成市', 'rongchengshi', '264300', '3', '0');
INSERT INTO `t_city` VALUES ('1527', '1523', '乳山市', 'rushanshi', '264500', '3', '0');
INSERT INTO `t_city` VALUES ('1528', '1523', '经济技术开发区', 'jingjijishukaifaqu', '264205', '3', '0');
INSERT INTO `t_city` VALUES ('1529', '1523', '高新技术开发区', 'gaoxinjishukaifaqu', '264209', '3', '0');
INSERT INTO `t_city` VALUES ('1530', '1422', '日照市', 'rizhaoshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1531', '1530', '东港区', 'donggangqu', '276800', '3', '0');
INSERT INTO `t_city` VALUES ('1532', '1530', '岚山区', 'shanqu', '276808', '3', '0');
INSERT INTO `t_city` VALUES ('1533', '1530', '五莲县', 'wulianxian', '272300', '3', '0');
INSERT INTO `t_city` VALUES ('1534', '1530', '莒县', 'xian', '266500', '3', '0');
INSERT INTO `t_city` VALUES ('1535', '1422', '莱芜市', 'laiwushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1536', '1535', '莱城区', 'laichengqu', '271100', '3', '0');
INSERT INTO `t_city` VALUES ('1537', '1535', '钢城区', 'gangchengqu', '271100', '3', '0');
INSERT INTO `t_city` VALUES ('1538', '1422', '临沂市', 'linyishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1539', '1538', '兰山区', 'lanshanqu', '276002', '3', '0');
INSERT INTO `t_city` VALUES ('1540', '1538', '罗庄区', 'luozhuangqu', '276022', '3', '0');
INSERT INTO `t_city` VALUES ('1541', '1538', '河东区', 'hedongqu', '276034', '3', '0');
INSERT INTO `t_city` VALUES ('1542', '1538', '沂南县', 'yinanxian', '276300', '3', '0');
INSERT INTO `t_city` VALUES ('1543', '1538', '郯城县', 'chengxian', '276100', '3', '0');
INSERT INTO `t_city` VALUES ('1544', '1538', '沂水县', 'yishuixian', '276400', '3', '0');
INSERT INTO `t_city` VALUES ('1545', '1538', '苍山县', 'cangshanxian', '277700', '3', '0');
INSERT INTO `t_city` VALUES ('1546', '1538', '费县', 'feixian', '273400', '3', '0');
INSERT INTO `t_city` VALUES ('1547', '1538', '平邑县', 'pingyixian', '273300', '3', '0');
INSERT INTO `t_city` VALUES ('1548', '1538', '莒南县', 'nanxian', '276600', '3', '0');
INSERT INTO `t_city` VALUES ('1549', '1538', '蒙阴县', 'mengyinxian', '276200', '3', '0');
INSERT INTO `t_city` VALUES ('1550', '1538', '临沭县', 'linxian', '276700', '3', '0');
INSERT INTO `t_city` VALUES ('1551', '1422', '德州市', 'dezhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1552', '1551', '德城区', 'dechengqu', '253011', '3', '0');
INSERT INTO `t_city` VALUES ('1553', '1551', '陵县', 'lingxian', '253500', '3', '0');
INSERT INTO `t_city` VALUES ('1554', '1551', '宁津县', 'ningjinxian', '253400', '3', '0');
INSERT INTO `t_city` VALUES ('1555', '1551', '庆云县', 'qingyunxian', '253700', '3', '0');
INSERT INTO `t_city` VALUES ('1556', '1551', '临邑县', 'linyixian', '251500', '3', '0');
INSERT INTO `t_city` VALUES ('1557', '1551', '齐河县', 'qihexian', '251100', '3', '0');
INSERT INTO `t_city` VALUES ('1558', '1551', '平原县', 'pingyuanxian', '253100', '3', '0');
INSERT INTO `t_city` VALUES ('1559', '1551', '夏津县', 'xiajinxian', '253200', '3', '0');
INSERT INTO `t_city` VALUES ('1560', '1551', '武城县', 'wuchengxian', '253300', '3', '0');
INSERT INTO `t_city` VALUES ('1561', '1551', '乐陵市', 'lelingshi', '253600', '3', '0');
INSERT INTO `t_city` VALUES ('1562', '1551', '禹城市', 'yuchengshi', '251200', '3', '0');
INSERT INTO `t_city` VALUES ('1563', '1422', '聊城市', 'liaochengshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1564', '1563', '东昌府区', 'dongchangfuqu', '252000', '3', '0');
INSERT INTO `t_city` VALUES ('1565', '1563', '阳谷县', 'yangguxian', '252300', '3', '0');
INSERT INTO `t_city` VALUES ('1566', '1563', '莘县', 'xian', '252400', '3', '0');
INSERT INTO `t_city` VALUES ('1567', '1563', '茌平县', 'pingxian', '252100', '3', '0');
INSERT INTO `t_city` VALUES ('1568', '1563', '东阿县', 'dongaxian', '252200', '3', '0');
INSERT INTO `t_city` VALUES ('1569', '1563', '冠县', 'guanxian', '252500', '3', '0');
INSERT INTO `t_city` VALUES ('1570', '1563', '高唐县', 'gaotangxian', '252800', '3', '0');
INSERT INTO `t_city` VALUES ('1571', '1563', '临清市', 'linqingshi', '252600', '3', '0');
INSERT INTO `t_city` VALUES ('1572', '1422', '滨州市', 'binzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1573', '1572', '滨城区', 'binchengqu', '256613', '3', '0');
INSERT INTO `t_city` VALUES ('1574', '1572', '惠民县', 'huiminxian', '251700', '3', '0');
INSERT INTO `t_city` VALUES ('1575', '1572', '阳信县', 'yangxinxian', '251800', '3', '0');
INSERT INTO `t_city` VALUES ('1576', '1572', '无棣县', 'wuxian', '251900', '3', '0');
INSERT INTO `t_city` VALUES ('1577', '1572', '沾化县', 'zhanhuaxian', '256800', '3', '0');
INSERT INTO `t_city` VALUES ('1578', '1572', '博兴县', 'boxingxian', '256500', '3', '0');
INSERT INTO `t_city` VALUES ('1579', '1572', '邹平县', 'zoupingxian', '256200', '3', '0');
INSERT INTO `t_city` VALUES ('1580', '1422', '菏泽市', 'hezeshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1581', '1580', '牡丹区', 'mudanqu', '274009', '3', '0');
INSERT INTO `t_city` VALUES ('1582', '1580', '曹县', 'caoxian', '274400', '3', '0');
INSERT INTO `t_city` VALUES ('1583', '1580', '单县', 'danxian', '274300', '3', '0');
INSERT INTO `t_city` VALUES ('1584', '1580', '成武县', 'chengwuxian', '274200', '3', '0');
INSERT INTO `t_city` VALUES ('1585', '1580', '巨野县', 'juyexian', '274900', '3', '0');
INSERT INTO `t_city` VALUES ('1586', '1580', '郓城县', 'chengxian', '274700', '3', '0');
INSERT INTO `t_city` VALUES ('1587', '1580', '鄄城县', 'chengxian', '274600', '3', '0');
INSERT INTO `t_city` VALUES ('1588', '1580', '定陶县', 'dingtaoxian', '274100', '3', '0');
INSERT INTO `t_city` VALUES ('1589', '1580', '东明县', 'dongmingxian', '274500', '3', '0');
INSERT INTO `t_city` VALUES ('1590', '1', '河南', 'henan', '0', '1', '0');
INSERT INTO `t_city` VALUES ('1591', '1590', '郑州市', 'zhengzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1592', '1591', '中原区', 'zhongyuanqu', '450007', '3', '0');
INSERT INTO `t_city` VALUES ('1593', '1591', '二七区', 'erqiqu', '450052', '3', '0');
INSERT INTO `t_city` VALUES ('1594', '1591', '管城回族区', 'guanchenghuizuqu', '450000', '3', '0');
INSERT INTO `t_city` VALUES ('1595', '1591', '金水区', 'jinshuiqu', '450003', '3', '0');
INSERT INTO `t_city` VALUES ('1596', '1591', '上街区', 'shangjiequ', '450041', '3', '0');
INSERT INTO `t_city` VALUES ('1597', '1591', '中牟县', 'zhongmouxian', '451450', '3', '0');
INSERT INTO `t_city` VALUES ('1598', '1591', '巩义市', 'gongyishi', '451200', '3', '0');
INSERT INTO `t_city` VALUES ('1599', '1591', '荥阳市', 'yangshi', '450100', '3', '0');
INSERT INTO `t_city` VALUES ('1600', '1591', '新密市', 'xinmishi', '452300', '3', '0');
INSERT INTO `t_city` VALUES ('1601', '1591', '新郑市', 'xinzhengshi', '451100', '3', '0');
INSERT INTO `t_city` VALUES ('1602', '1591', '登封市', 'dengfengshi', '452470', '3', '0');
INSERT INTO `t_city` VALUES ('1603', '1591', '高新技术开发区', 'gaoxinjishukaifaqu', '450001', '3', '0');
INSERT INTO `t_city` VALUES ('1604', '1591', '惠济区', 'huijiqu', '450053', '3', '0');
INSERT INTO `t_city` VALUES ('1605', '1591', '经济技术开发区', 'jingjijishukaifaqu', '450016', '3', '0');
INSERT INTO `t_city` VALUES ('1606', '1591', '郑东新区', 'zhengdongxinqu', '450008', '3', '0');
INSERT INTO `t_city` VALUES ('1607', '1591', '出口加工区', 'chukoujiagongqu', '450016', '3', '0');
INSERT INTO `t_city` VALUES ('1608', '1590', '开封市', 'kaifengshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1609', '1608', '龙亭区', 'longtingqu', '475100', '3', '0');
INSERT INTO `t_city` VALUES ('1610', '1608', '顺河回族区', 'shunhehuizuqu', '475000', '3', '0');
INSERT INTO `t_city` VALUES ('1611', '1608', '鼓楼区', 'gulouqu', '475000', '3', '0');
INSERT INTO `t_city` VALUES ('1612', '1608', '杞县', 'xian', '475200', '3', '0');
INSERT INTO `t_city` VALUES ('1613', '1608', '通许县', 'tongxuxian', '475400', '3', '0');
INSERT INTO `t_city` VALUES ('1614', '1608', '尉氏县', 'weishixian', '475500', '3', '0');
INSERT INTO `t_city` VALUES ('1615', '1608', '开封县', 'kaifengxian', '475100', '3', '0');
INSERT INTO `t_city` VALUES ('1616', '1608', '兰考县', 'lankaoxian', '475300', '3', '0');
INSERT INTO `t_city` VALUES ('1617', '1608', '金明区', 'jinmingqu', '475003', '3', '0');
INSERT INTO `t_city` VALUES ('1618', '1608', '禹王台区', 'yuwangtaiqu', '475003', '3', '0');
INSERT INTO `t_city` VALUES ('1619', '1590', '洛阳市', 'luoyangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1620', '1619', '老城区', 'laochengqu', '471002', '3', '0');
INSERT INTO `t_city` VALUES ('1621', '1619', '西工区', 'xigongqu', '471000', '3', '0');
INSERT INTO `t_city` VALUES ('1622', '1619', '瀍河回族区', '', '471002', '3', '0');
INSERT INTO `t_city` VALUES ('1623', '1619', '涧西区', 'jianxiqu', '471003', '3', '0');
INSERT INTO `t_city` VALUES ('1624', '1619', '吉利区', 'jiliqu', '471012', '3', '0');
INSERT INTO `t_city` VALUES ('1625', '1619', '洛龙区', 'luolongqu', '471000', '3', '0');
INSERT INTO `t_city` VALUES ('1626', '1619', '孟津县', 'mengjinxian', '471100', '3', '0');
INSERT INTO `t_city` VALUES ('1627', '1619', '新安县', 'xinanxian', '471800', '3', '0');
INSERT INTO `t_city` VALUES ('1628', '1619', '栾川县', 'chuanxian', '471500', '3', '0');
INSERT INTO `t_city` VALUES ('1629', '1619', '嵩县', 'xian', '471400', '3', '0');
INSERT INTO `t_city` VALUES ('1630', '1619', '汝阳县', 'ruyangxian', '471200', '3', '0');
INSERT INTO `t_city` VALUES ('1631', '1619', '宜阳县', 'yiyangxian', '471600', '3', '0');
INSERT INTO `t_city` VALUES ('1632', '1619', '洛宁县', 'luoningxian', '471700', '3', '0');
INSERT INTO `t_city` VALUES ('1633', '1619', '伊川县', 'yichuanxian', '471300', '3', '0');
INSERT INTO `t_city` VALUES ('1634', '1619', '偃师市', 'shishi', '471900', '3', '0');
INSERT INTO `t_city` VALUES ('1635', '1619', '高新技术开发区', 'gaoxinjishukaifaqu', '471003', '3', '0');
INSERT INTO `t_city` VALUES ('1636', '1619', '经济技术开发区', 'jingjijishukaifaqu', '471023', '3', '0');
INSERT INTO `t_city` VALUES ('1637', '1590', '平顶山市', 'pingdingshanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1638', '1637', '新华区', 'xinhuaqu', '467002', '3', '0');
INSERT INTO `t_city` VALUES ('1639', '1637', '卫东区', 'weidongqu', '467021', '3', '0');
INSERT INTO `t_city` VALUES ('1640', '1637', '石龙区', 'shilongqu', '467045', '3', '0');
INSERT INTO `t_city` VALUES ('1641', '1637', '湛河区', 'zhanhequ', '467000', '3', '0');
INSERT INTO `t_city` VALUES ('1642', '1637', '宝丰县', 'baofengxian', '467400', '3', '0');
INSERT INTO `t_city` VALUES ('1643', '1637', '叶县', 'yexian', '467200', '3', '0');
INSERT INTO `t_city` VALUES ('1644', '1637', '鲁山县', 'lushanxian', '467300', '3', '0');
INSERT INTO `t_city` VALUES ('1645', '1637', '郏县', 'xian', '467100', '3', '0');
INSERT INTO `t_city` VALUES ('1646', '1637', '舞钢市', 'wugangshi', '462500', '3', '0');
INSERT INTO `t_city` VALUES ('1647', '1637', '汝州市', 'ruzhoushi', '467500', '3', '0');
INSERT INTO `t_city` VALUES ('1648', '1590', '安阳市', 'anyangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1649', '1648', '文峰区', 'wenfengqu', '455000', '3', '0');
INSERT INTO `t_city` VALUES ('1650', '1648', '北关区', 'beiguanqu', '455001', '3', '0');
INSERT INTO `t_city` VALUES ('1651', '1648', '殷都区', 'yinduqu', '455004', '3', '0');
INSERT INTO `t_city` VALUES ('1652', '1648', '龙安区', 'longanqu', '455001', '3', '0');
INSERT INTO `t_city` VALUES ('1653', '1648', '安阳县', 'anyangxian', '455000', '3', '0');
INSERT INTO `t_city` VALUES ('1654', '1648', '汤阴县', 'tangyinxian', '456150', '3', '0');
INSERT INTO `t_city` VALUES ('1655', '1648', '滑县', 'huaxian', '456400', '3', '0');
INSERT INTO `t_city` VALUES ('1656', '1648', '内黄县', 'neihuangxian', '456350', '3', '0');
INSERT INTO `t_city` VALUES ('1657', '1648', '林州市', 'linzhoushi', '456500', '3', '0');
INSERT INTO `t_city` VALUES ('1658', '1590', '鹤壁市', 'hebishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1659', '1658', '鹤山区', 'heshanqu', '458010', '3', '0');
INSERT INTO `t_city` VALUES ('1660', '1658', '山城区', 'shanchengqu', '458000', '3', '0');
INSERT INTO `t_city` VALUES ('1661', '1658', '淇滨区', 'binqu', '458000', '3', '0');
INSERT INTO `t_city` VALUES ('1662', '1658', '浚县', 'junxian', '456250', '3', '0');
INSERT INTO `t_city` VALUES ('1663', '1658', '淇县', 'xian', '456750', '3', '0');
INSERT INTO `t_city` VALUES ('1664', '1590', '新乡市', 'xinxiangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1665', '1664', '红旗区', 'hongqiqu', '453000', '3', '0');
INSERT INTO `t_city` VALUES ('1666', '1664', '卫滨区', 'weibinqu', '453000', '3', '0');
INSERT INTO `t_city` VALUES ('1667', '1664', '凤泉区', 'fengquanqu', '453011', '3', '0');
INSERT INTO `t_city` VALUES ('1668', '1664', '牧野区', 'muyequ', '453002', '3', '0');
INSERT INTO `t_city` VALUES ('1669', '1664', '新乡县', 'xinxiangxian', '453700', '3', '0');
INSERT INTO `t_city` VALUES ('1670', '1664', '获嘉县', 'huojiaxian', '453800', '3', '0');
INSERT INTO `t_city` VALUES ('1671', '1664', '原阳县', 'yuanyangxian', '453500', '3', '0');
INSERT INTO `t_city` VALUES ('1672', '1664', '延津县', 'yanjinxian', '453200', '3', '0');
INSERT INTO `t_city` VALUES ('1673', '1664', '封丘县', 'fengqiuxian', '453300', '3', '0');
INSERT INTO `t_city` VALUES ('1674', '1664', '长垣县', 'changyuanxian', '453400', '3', '0');
INSERT INTO `t_city` VALUES ('1675', '1664', '卫辉市', 'weihuishi', '453100', '3', '0');
INSERT INTO `t_city` VALUES ('1676', '1664', '辉县市', 'huixianshi', '453600', '3', '0');
INSERT INTO `t_city` VALUES ('1677', '1590', '焦作市', 'jiaozuoshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1678', '1677', '解放区', 'jiefangqu', '454000', '3', '0');
INSERT INTO `t_city` VALUES ('1679', '1677', '中站区', 'zhongzhanqu', '454191', '3', '0');
INSERT INTO `t_city` VALUES ('1680', '1677', '马村区', 'macunqu', '454171', '3', '0');
INSERT INTO `t_city` VALUES ('1681', '1677', '山阳区', 'shanyangqu', '454002', '3', '0');
INSERT INTO `t_city` VALUES ('1682', '1677', '修武县', 'xiuwuxian', '454350', '3', '0');
INSERT INTO `t_city` VALUES ('1683', '1677', '博爱县', 'boaixian', '454450', '3', '0');
INSERT INTO `t_city` VALUES ('1684', '1677', '武陟县', 'wuxian', '454950', '3', '0');
INSERT INTO `t_city` VALUES ('1685', '1677', '温县', 'wenxian', '454850', '3', '0');
INSERT INTO `t_city` VALUES ('1686', '1677', '沁阳市', 'qinyangshi', '454550', '3', '0');
INSERT INTO `t_city` VALUES ('1687', '1677', '孟州市', 'mengzhoushi', '454750', '3', '0');
INSERT INTO `t_city` VALUES ('1688', '1590', '济源市', 'jiyuanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1689', '1688', '济源市', 'jiyuanshi', '454650', '3', '0');
INSERT INTO `t_city` VALUES ('1690', '1590', '濮阳市', 'yangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1691', '1690', '华龙区', 'hualongqu', '457001', '3', '0');
INSERT INTO `t_city` VALUES ('1692', '1690', '清丰县', 'qingfengxian', '457300', '3', '0');
INSERT INTO `t_city` VALUES ('1693', '1690', '南乐县', 'nanlexian', '457400', '3', '0');
INSERT INTO `t_city` VALUES ('1694', '1690', '范县', 'fanxian', '457500', '3', '0');
INSERT INTO `t_city` VALUES ('1695', '1690', '台前县', 'taiqianxian', '457600', '3', '0');
INSERT INTO `t_city` VALUES ('1696', '1690', '濮阳县', 'yangxian', '457100', '3', '0');
INSERT INTO `t_city` VALUES ('1697', '1590', '许昌市', 'xuchangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1698', '1697', '魏都区', 'weiduqu', '461000', '3', '0');
INSERT INTO `t_city` VALUES ('1699', '1697', '许昌县', 'xuchangxian', '461100', '3', '0');
INSERT INTO `t_city` VALUES ('1700', '1697', '鄢陵县', 'lingxian', '461200', '3', '0');
INSERT INTO `t_city` VALUES ('1701', '1697', '襄城县', 'xiangchengxian', '461700', '3', '0');
INSERT INTO `t_city` VALUES ('1702', '1697', '禹州市', 'yuzhoushi', '461670', '3', '0');
INSERT INTO `t_city` VALUES ('1703', '1697', '长葛市', 'changgeshi', '461500', '3', '0');
INSERT INTO `t_city` VALUES ('1704', '1590', '漯河市', 'heshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1705', '1704', '源汇区', 'yuanhuiqu', '462000', '3', '0');
INSERT INTO `t_city` VALUES ('1706', '1704', '郾城区', 'chengqu', '462300', '3', '0');
INSERT INTO `t_city` VALUES ('1707', '1704', '召陵区', 'zhaolingqu', '462300', '3', '0');
INSERT INTO `t_city` VALUES ('1708', '1704', '舞阳县', 'wuyangxian', '462400', '3', '0');
INSERT INTO `t_city` VALUES ('1709', '1704', '临颍县', 'linxian', '462600', '3', '0');
INSERT INTO `t_city` VALUES ('1710', '1590', '三门峡市', 'sanmenxiashi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1711', '1710', '湖滨区', 'hubinqu', '472000', '3', '0');
INSERT INTO `t_city` VALUES ('1712', '1710', '渑池县', 'chixian', '472400', '3', '0');
INSERT INTO `t_city` VALUES ('1713', '1710', '陕县', 'shanxian', '472100', '3', '0');
INSERT INTO `t_city` VALUES ('1714', '1710', '卢氏县', 'lushixian', '472200', '3', '0');
INSERT INTO `t_city` VALUES ('1715', '1710', '义马市', 'yimashi', '472300', '3', '0');
INSERT INTO `t_city` VALUES ('1716', '1710', '灵宝市', 'lingbaoshi', '472500', '3', '0');
INSERT INTO `t_city` VALUES ('1717', '1590', '南阳市', 'nanyangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1718', '1717', '宛城区', 'wanchengqu', '473001', '3', '0');
INSERT INTO `t_city` VALUES ('1719', '1717', '卧龙区', 'wolongqu', '473003', '3', '0');
INSERT INTO `t_city` VALUES ('1720', '1717', '南召县', 'nanzhaoxian', '474650', '3', '0');
INSERT INTO `t_city` VALUES ('1721', '1717', '方城县', 'fangchengxian', '473200', '3', '0');
INSERT INTO `t_city` VALUES ('1722', '1717', '西峡县', 'xixiaxian', '474550', '3', '0');
INSERT INTO `t_city` VALUES ('1723', '1717', '镇平县', 'zhenpingxian', '474250', '3', '0');
INSERT INTO `t_city` VALUES ('1724', '1717', '内乡县', 'neixiangxian', '474350', '3', '0');
INSERT INTO `t_city` VALUES ('1725', '1717', '淅川县', 'chuanxian', '474450', '3', '0');
INSERT INTO `t_city` VALUES ('1726', '1717', '社旗县', 'sheqixian', '473300', '3', '0');
INSERT INTO `t_city` VALUES ('1727', '1717', '唐河县', 'tanghexian', '473400', '3', '0');
INSERT INTO `t_city` VALUES ('1728', '1717', '新野县', 'xinyexian', '473500', '3', '0');
INSERT INTO `t_city` VALUES ('1729', '1717', '桐柏县', 'tongbaixian', '474750', '3', '0');
INSERT INTO `t_city` VALUES ('1730', '1717', '邓州市', 'dengzhoushi', '474150', '3', '0');
INSERT INTO `t_city` VALUES ('1731', '1590', '商丘市', 'shangqiushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1732', '1731', '梁园区', 'liangyuanqu', '476000', '3', '0');
INSERT INTO `t_city` VALUES ('1733', '1731', '睢阳区', 'yangqu', '476100', '3', '0');
INSERT INTO `t_city` VALUES ('1734', '1731', '民权县', 'minquanxian', '476800', '3', '0');
INSERT INTO `t_city` VALUES ('1735', '1731', '睢县', 'xian', '476900', '3', '0');
INSERT INTO `t_city` VALUES ('1736', '1731', '宁陵县', 'ninglingxian', '476700', '3', '0');
INSERT INTO `t_city` VALUES ('1737', '1731', '柘城县', 'chengxian', '476200', '3', '0');
INSERT INTO `t_city` VALUES ('1738', '1731', '虞城县', 'yuchengxian', '476300', '3', '0');
INSERT INTO `t_city` VALUES ('1739', '1731', '夏邑县', 'xiayixian', '476400', '3', '0');
INSERT INTO `t_city` VALUES ('1740', '1731', '永城市', 'yongchengshi', '476600', '3', '0');
INSERT INTO `t_city` VALUES ('1741', '1590', '信阳市', 'xinyangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1742', '1741', '浉河区', '', '464000', '3', '0');
INSERT INTO `t_city` VALUES ('1743', '1741', '平桥区', 'pingqiaoqu', '464100', '3', '0');
INSERT INTO `t_city` VALUES ('1744', '1741', '罗山县', 'luoshanxian', '464200', '3', '0');
INSERT INTO `t_city` VALUES ('1745', '1741', '光山县', 'guangshanxian', '465450', '3', '0');
INSERT INTO `t_city` VALUES ('1746', '1741', '新县', 'xinxian', '465550', '3', '0');
INSERT INTO `t_city` VALUES ('1747', '1741', '商城县', 'shangchengxian', '465350', '3', '0');
INSERT INTO `t_city` VALUES ('1748', '1741', '固始县', 'gushixian', '465250', '3', '0');
INSERT INTO `t_city` VALUES ('1749', '1741', '潢川县', 'chuanxian', '465150', '3', '0');
INSERT INTO `t_city` VALUES ('1750', '1741', '淮滨县', 'huaibinxian', '464400', '3', '0');
INSERT INTO `t_city` VALUES ('1751', '1741', '息县', 'xixian', '464300', '3', '0');
INSERT INTO `t_city` VALUES ('1752', '1590', '周口市', 'zhoukoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1753', '1752', '川汇区', 'chuanhuiqu', '466000', '3', '0');
INSERT INTO `t_city` VALUES ('1754', '1752', '扶沟县', 'fugouxian', '461300', '3', '0');
INSERT INTO `t_city` VALUES ('1755', '1752', '西华县', 'xihuaxian', '466600', '3', '0');
INSERT INTO `t_city` VALUES ('1756', '1752', '商水县', 'shangshuixian', '466100', '3', '0');
INSERT INTO `t_city` VALUES ('1757', '1752', '沈丘县', 'shenqiuxian', '466300', '3', '0');
INSERT INTO `t_city` VALUES ('1758', '1752', '郸城县', 'danchengxian', '477150', '3', '0');
INSERT INTO `t_city` VALUES ('1759', '1752', '淮阳县', 'huaiyangxian', '466700', '3', '0');
INSERT INTO `t_city` VALUES ('1760', '1752', '太康县', 'taikangxian', '461400', '3', '0');
INSERT INTO `t_city` VALUES ('1761', '1752', '鹿邑县', 'luyixian', '477200', '3', '0');
INSERT INTO `t_city` VALUES ('1762', '1752', '项城市', 'xiangchengshi', '466200', '3', '0');
INSERT INTO `t_city` VALUES ('1763', '1590', '驻马店市', 'zhumadianshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1764', '1763', '驿城区', 'chengqu', '463000', '3', '0');
INSERT INTO `t_city` VALUES ('1765', '1763', '西平县', 'xipingxian', '463900', '3', '0');
INSERT INTO `t_city` VALUES ('1766', '1763', '上蔡县', 'shangcaixian', '463800', '3', '0');
INSERT INTO `t_city` VALUES ('1767', '1763', '平舆县', 'pingyuxian', '463400', '3', '0');
INSERT INTO `t_city` VALUES ('1768', '1763', '正阳县', 'zhengyangxian', '463600', '3', '0');
INSERT INTO `t_city` VALUES ('1769', '1763', '确山县', 'queshanxian', '463200', '3', '0');
INSERT INTO `t_city` VALUES ('1770', '1763', '泌阳县', 'miyangxian', '463700', '3', '0');
INSERT INTO `t_city` VALUES ('1771', '1763', '汝南县', 'runanxian', '463300', '3', '0');
INSERT INTO `t_city` VALUES ('1772', '1763', '遂平县', 'suipingxian', '463100', '3', '0');
INSERT INTO `t_city` VALUES ('1773', '1763', '新蔡县', 'xincaixian', '463500', '3', '0');
INSERT INTO `t_city` VALUES ('1774', '1', '湖北', 'hubei', '0', '1', '0');
INSERT INTO `t_city` VALUES ('1775', '1774', '武汉市', 'wuhanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1776', '1775', '江岸区', 'jianganqu', '430014', '3', '0');
INSERT INTO `t_city` VALUES ('1777', '1775', '江汉区', 'jianghanqu', '430021', '3', '0');
INSERT INTO `t_city` VALUES ('1778', '1775', '硚口区', '', '430033', '3', '0');
INSERT INTO `t_city` VALUES ('1779', '1775', '汉阳区', 'hanyangqu', '430050', '3', '0');
INSERT INTO `t_city` VALUES ('1780', '1775', '武昌区', 'wuchangqu', '430061', '3', '0');
INSERT INTO `t_city` VALUES ('1781', '1775', '青山区', 'qingshanqu', '430080', '3', '0');
INSERT INTO `t_city` VALUES ('1782', '1775', '洪山区', 'hongshanqu', '430070', '3', '0');
INSERT INTO `t_city` VALUES ('1783', '1775', '东西湖区', 'dongxihuqu', '430040', '3', '0');
INSERT INTO `t_city` VALUES ('1784', '1775', '汉南区', 'hannanqu', '430090', '3', '0');
INSERT INTO `t_city` VALUES ('1785', '1775', '蔡甸区', 'caidianqu', '430100', '3', '0');
INSERT INTO `t_city` VALUES ('1786', '1775', '江夏区', 'jiangxiaqu', '430200', '3', '0');
INSERT INTO `t_city` VALUES ('1787', '1775', '黄陂区', 'huangqu', '432200', '3', '0');
INSERT INTO `t_city` VALUES ('1788', '1775', '新洲区', 'xinzhouqu', '431400', '3', '0');
INSERT INTO `t_city` VALUES ('1789', '1774', '黄石市', 'huangshishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1790', '1789', '黄石港区', 'huangshigangqu', '435000', '3', '0');
INSERT INTO `t_city` VALUES ('1791', '1789', '西塞山区', 'xisaishanqu', '435001', '3', '0');
INSERT INTO `t_city` VALUES ('1792', '1789', '下陆区', 'xialuqu', '435005', '3', '0');
INSERT INTO `t_city` VALUES ('1793', '1789', '铁山区', 'tieshanqu', '435006', '3', '0');
INSERT INTO `t_city` VALUES ('1794', '1789', '阳新县', 'yangxinxian', '435200', '3', '0');
INSERT INTO `t_city` VALUES ('1795', '1789', '大冶市', 'dayeshi', '435100', '3', '0');
INSERT INTO `t_city` VALUES ('1796', '1774', '十堰市', 'shiyanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1797', '1796', '茅箭区', 'maojianqu', '442012', '3', '0');
INSERT INTO `t_city` VALUES ('1798', '1796', '张湾区', 'zhangwanqu', '442001', '3', '0');
INSERT INTO `t_city` VALUES ('1799', '1796', '郧县', 'yunxian', '442500', '3', '0');
INSERT INTO `t_city` VALUES ('1800', '1796', '郧西县', 'yunxixian', '442600', '3', '0');
INSERT INTO `t_city` VALUES ('1801', '1796', '竹山县', 'zhushanxian', '442200', '3', '0');
INSERT INTO `t_city` VALUES ('1802', '1796', '竹溪县', 'zhuxixian', '442300', '3', '0');
INSERT INTO `t_city` VALUES ('1803', '1796', '房县', 'fangxian', '442100', '3', '0');
INSERT INTO `t_city` VALUES ('1804', '1796', '丹江口市', 'danjiangkoushi', '442700', '3', '0');
INSERT INTO `t_city` VALUES ('1805', '1774', '宜昌市', 'yichangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1806', '1805', '西陵区', 'xilingqu', '443000', '3', '0');
INSERT INTO `t_city` VALUES ('1807', '1805', '伍家岗区', 'wujiagangqu', '443001', '3', '0');
INSERT INTO `t_city` VALUES ('1808', '1805', '点军区', 'dianjunqu', '443006', '3', '0');
INSERT INTO `t_city` VALUES ('1809', '1805', '猇亭区', '', '443007', '3', '0');
INSERT INTO `t_city` VALUES ('1810', '1805', '夷陵区', 'yilingqu', '443100', '3', '0');
INSERT INTO `t_city` VALUES ('1811', '1805', '远安县', 'yuananxian', '444200', '3', '0');
INSERT INTO `t_city` VALUES ('1812', '1805', '兴山县', 'xingshanxian', '443711', '3', '0');
INSERT INTO `t_city` VALUES ('1813', '1805', '秭归县', 'guixian', '443600', '3', '0');
INSERT INTO `t_city` VALUES ('1814', '1805', '长阳土家族自治县', 'changyangtujiazuzizhixian', '443500', '3', '0');
INSERT INTO `t_city` VALUES ('1815', '1805', '五峰土家族自治县', 'wufengtujiazuzizhixian', '443400', '3', '0');
INSERT INTO `t_city` VALUES ('1816', '1805', '宜都市', 'yidushi', '443300', '3', '0');
INSERT INTO `t_city` VALUES ('1817', '1805', '当阳市', 'dangyangshi', '444100', '3', '0');
INSERT INTO `t_city` VALUES ('1818', '1805', '枝江市', 'zhijiangshi', '443200', '3', '0');
INSERT INTO `t_city` VALUES ('1819', '1805', '经济技术开发区', 'jingjijishukaifaqu', '443003', '3', '0');
INSERT INTO `t_city` VALUES ('1820', '1774', '襄阳市', 'xiangyangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1821', '1820', '襄城区', 'xiangchengqu', '441021', '3', '0');
INSERT INTO `t_city` VALUES ('1822', '1820', '樊城区', 'fanchengqu', '441001', '3', '0');
INSERT INTO `t_city` VALUES ('1823', '1820', '襄阳区', 'xiangyangqu', '441100', '3', '0');
INSERT INTO `t_city` VALUES ('1824', '1820', '南漳县', 'nanzhangxian', '441500', '3', '0');
INSERT INTO `t_city` VALUES ('1825', '1820', '谷城县', 'guchengxian', '441700', '3', '0');
INSERT INTO `t_city` VALUES ('1826', '1820', '保康县', 'baokangxian', '441600', '3', '0');
INSERT INTO `t_city` VALUES ('1827', '1820', '老河口市', 'laohekoushi', '441800', '3', '0');
INSERT INTO `t_city` VALUES ('1828', '1820', '枣阳市', 'zaoyangshi', '441200', '3', '0');
INSERT INTO `t_city` VALUES ('1829', '1820', '宜城市', 'yichengshi', '441400', '3', '0');
INSERT INTO `t_city` VALUES ('1830', '1774', '鄂州市', 'ezhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1831', '1830', '梁子湖区', 'liangzihuqu', '436064', '3', '0');
INSERT INTO `t_city` VALUES ('1832', '1830', '华容区', 'huarongqu', '436030', '3', '0');
INSERT INTO `t_city` VALUES ('1833', '1830', '鄂城区', 'echengqu', '436000', '3', '0');
INSERT INTO `t_city` VALUES ('1834', '1774', '荆门市', 'jingmenshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1835', '1834', '东宝区', 'dongbaoqu', '448004', '3', '0');
INSERT INTO `t_city` VALUES ('1836', '1834', '掇刀区', 'duodaoqu', '448124', '3', '0');
INSERT INTO `t_city` VALUES ('1837', '1834', '京山县', 'jingshanxian', '431800', '3', '0');
INSERT INTO `t_city` VALUES ('1838', '1834', '沙洋县', 'shayangxian', '448200', '3', '0');
INSERT INTO `t_city` VALUES ('1839', '1834', '钟祥市', 'zhongxiangshi', '431900', '3', '0');
INSERT INTO `t_city` VALUES ('1840', '1774', '孝感市', 'xiaoganshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1841', '1840', '孝南区', 'xiaonanqu', '432100', '3', '0');
INSERT INTO `t_city` VALUES ('1842', '1840', '孝昌县', 'xiaochangxian', '432900', '3', '0');
INSERT INTO `t_city` VALUES ('1843', '1840', '大悟县', 'dawuxian', '432800', '3', '0');
INSERT INTO `t_city` VALUES ('1844', '1840', '云梦县', 'yunmengxian', '432500', '3', '0');
INSERT INTO `t_city` VALUES ('1845', '1840', '应城市', 'yingchengshi', '432400', '3', '0');
INSERT INTO `t_city` VALUES ('1846', '1840', '安陆市', 'anlushi', '432600', '3', '0');
INSERT INTO `t_city` VALUES ('1847', '1840', '汉川市', 'hanchuanshi', '432300', '3', '0');
INSERT INTO `t_city` VALUES ('1848', '1774', '荆州市', 'jingzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1849', '1848', '沙市区', 'shashiqu', '434000', '3', '0');
INSERT INTO `t_city` VALUES ('1850', '1848', '荆州区', 'jingzhouqu', '434020', '3', '0');
INSERT INTO `t_city` VALUES ('1851', '1848', '公安县', 'gonganxian', '434300', '3', '0');
INSERT INTO `t_city` VALUES ('1852', '1848', '监利县', 'jianlixian', '433300', '3', '0');
INSERT INTO `t_city` VALUES ('1853', '1848', '江陵县', 'jianglingxian', '434101', '3', '0');
INSERT INTO `t_city` VALUES ('1854', '1848', '石首市', 'shishoushi', '434400', '3', '0');
INSERT INTO `t_city` VALUES ('1855', '1848', '洪湖市', 'honghushi', '433200', '3', '0');
INSERT INTO `t_city` VALUES ('1856', '1848', '松滋市', 'songzishi', '434200', '3', '0');
INSERT INTO `t_city` VALUES ('1857', '1774', '黄冈市', 'huanggangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1858', '1857', '黄州区', 'huangzhouqu', '438000', '3', '0');
INSERT INTO `t_city` VALUES ('1859', '1857', '团风县', 'tuanfengxian', '438000', '3', '0');
INSERT INTO `t_city` VALUES ('1860', '1857', '红安县', 'honganxian', '438401', '3', '0');
INSERT INTO `t_city` VALUES ('1861', '1857', '罗田县', 'luotianxian', '438600', '3', '0');
INSERT INTO `t_city` VALUES ('1862', '1857', '英山县', 'yingshanxian', '438700', '3', '0');
INSERT INTO `t_city` VALUES ('1863', '1857', '浠水县', 'shuixian', '438200', '3', '0');
INSERT INTO `t_city` VALUES ('1864', '1857', '蕲春县', 'chunxian', '435300', '3', '0');
INSERT INTO `t_city` VALUES ('1865', '1857', '黄梅县', 'huangmeixian', '435500', '3', '0');
INSERT INTO `t_city` VALUES ('1866', '1857', '麻城市', 'machengshi', '438300', '3', '0');
INSERT INTO `t_city` VALUES ('1867', '1857', '武穴市', 'wuxueshi', '435400', '3', '0');
INSERT INTO `t_city` VALUES ('1868', '1774', '咸宁市', 'xianningshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1869', '1868', '咸安区', 'xiananqu', '437000', '3', '0');
INSERT INTO `t_city` VALUES ('1870', '1868', '嘉鱼县', 'jiayuxian', '437200', '3', '0');
INSERT INTO `t_city` VALUES ('1871', '1868', '通城县', 'tongchengxian', '437400', '3', '0');
INSERT INTO `t_city` VALUES ('1872', '1868', '崇阳县', 'chongyangxian', '437500', '3', '0');
INSERT INTO `t_city` VALUES ('1873', '1868', '通山县', 'tongshanxian', '437600', '3', '0');
INSERT INTO `t_city` VALUES ('1874', '1868', '赤壁市', 'chibishi', '437300', '3', '0');
INSERT INTO `t_city` VALUES ('1875', '1774', '随州市', 'suizhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1876', '1875', '曾都区', 'zengduqu', '441300', '3', '0');
INSERT INTO `t_city` VALUES ('1877', '1875', '广水市', 'guangshuishi', '432700', '3', '0');
INSERT INTO `t_city` VALUES ('1878', '1774', '恩施土家族苗族自治州', 'enshitujiazumiaozuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1879', '1878', '恩施市', 'enshishi', '445000', '3', '0');
INSERT INTO `t_city` VALUES ('1880', '1878', '利川市', 'lichuanshi', '445400', '3', '0');
INSERT INTO `t_city` VALUES ('1881', '1878', '建始县', 'jianshixian', '445300', '3', '0');
INSERT INTO `t_city` VALUES ('1882', '1878', '巴东县', 'badongxian', '444300', '3', '0');
INSERT INTO `t_city` VALUES ('1883', '1878', '宣恩县', 'xuanenxian', '445500', '3', '0');
INSERT INTO `t_city` VALUES ('1884', '1878', '咸丰县', 'xianfengxian', '445600', '3', '0');
INSERT INTO `t_city` VALUES ('1885', '1878', '来凤县', 'laifengxian', '445700', '3', '0');
INSERT INTO `t_city` VALUES ('1886', '1878', '鹤峰县', 'hefengxian', '445800', '3', '0');
INSERT INTO `t_city` VALUES ('1887', '1774', '省直辖县级行政单位', 'shengzhixiaxianjixingzhengdanwei', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1888', '1887', '仙桃市', 'xiantaoshi', '433000', '3', '0');
INSERT INTO `t_city` VALUES ('1889', '1887', '潜江市', 'qianjiangshi', '433100', '3', '0');
INSERT INTO `t_city` VALUES ('1890', '1887', '天门市', 'tianmenshi', '431700', '3', '0');
INSERT INTO `t_city` VALUES ('1891', '1887', '神农架林区', 'shennongjialinqu', '442400', '3', '0');
INSERT INTO `t_city` VALUES ('1892', '1', '湖南', 'hunan', '0', '1', '0');
INSERT INTO `t_city` VALUES ('1893', '1892', '长沙市', 'changshashi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1894', '1893', '芙蓉区', 'rongqu', '410011', '3', '0');
INSERT INTO `t_city` VALUES ('1895', '1893', '天心区', 'tianxinqu', '410011', '3', '0');
INSERT INTO `t_city` VALUES ('1896', '1893', '岳麓区', 'yueluqu', '410006', '3', '0');
INSERT INTO `t_city` VALUES ('1897', '1893', '开福区', 'kaifuqu', '410008', '3', '0');
INSERT INTO `t_city` VALUES ('1898', '1893', '雨花区', 'yuhuaqu', '410011', '3', '0');
INSERT INTO `t_city` VALUES ('1899', '1893', '长沙县', 'changshaxian', '410100', '3', '0');
INSERT INTO `t_city` VALUES ('1900', '1893', '望城县', 'wangchengxian', '410200', '3', '0');
INSERT INTO `t_city` VALUES ('1901', '1893', '宁乡县', 'ningxiangxian', '410600', '3', '0');
INSERT INTO `t_city` VALUES ('1902', '1893', '浏阳市', 'yangshi', '410300', '3', '0');
INSERT INTO `t_city` VALUES ('1903', '1892', '株洲市', 'zhuzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1904', '1903', '荷塘区', 'hetangqu', '412000', '3', '0');
INSERT INTO `t_city` VALUES ('1905', '1903', '芦淞区', 'luqu', '412000', '3', '0');
INSERT INTO `t_city` VALUES ('1906', '1903', '石峰区', 'shifengqu', '412005', '3', '0');
INSERT INTO `t_city` VALUES ('1907', '1903', '天元区', 'tianyuanqu', '412007', '3', '0');
INSERT INTO `t_city` VALUES ('1908', '1903', '株洲县', 'zhuzhouxian', '412100', '3', '0');
INSERT INTO `t_city` VALUES ('1909', '1903', '攸县', 'xian', '412300', '3', '0');
INSERT INTO `t_city` VALUES ('1910', '1903', '茶陵县', 'chalingxian', '412400', '3', '0');
INSERT INTO `t_city` VALUES ('1911', '1903', '炎陵县', 'yanlingxian', '412500', '3', '0');
INSERT INTO `t_city` VALUES ('1912', '1903', '醴陵市', 'lingshi', '412200', '3', '0');
INSERT INTO `t_city` VALUES ('1913', '1892', '湘潭市', 'xiangtanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1914', '1913', '雨湖区', 'yuhuqu', '411100', '3', '0');
INSERT INTO `t_city` VALUES ('1915', '1913', '岳塘区', 'yuetangqu', '411101', '3', '0');
INSERT INTO `t_city` VALUES ('1916', '1913', '湘潭县', 'xiangtanxian', '411228', '3', '0');
INSERT INTO `t_city` VALUES ('1917', '1913', '湘乡市', 'xiangxiangshi', '411400', '3', '0');
INSERT INTO `t_city` VALUES ('1918', '1913', '韶山市', 'shaoshanshi', '411300', '3', '0');
INSERT INTO `t_city` VALUES ('1919', '1892', '衡阳市', 'hengyangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1920', '1919', '珠晖区', 'zhuqu', '421002', '3', '0');
INSERT INTO `t_city` VALUES ('1921', '1919', '雁峰区', 'yanfengqu', '421001', '3', '0');
INSERT INTO `t_city` VALUES ('1922', '1919', '石鼓区', 'shiguqu', '421001', '3', '0');
INSERT INTO `t_city` VALUES ('1923', '1919', '蒸湘区', 'zhengxiangqu', '421001', '3', '0');
INSERT INTO `t_city` VALUES ('1924', '1919', '南岳区', 'nanyuequ', '421900', '3', '0');
INSERT INTO `t_city` VALUES ('1925', '1919', '衡阳县', 'hengyangxian', '421200', '3', '0');
INSERT INTO `t_city` VALUES ('1926', '1919', '衡南县', 'hengnanxian', '421131', '3', '0');
INSERT INTO `t_city` VALUES ('1927', '1919', '衡山县', 'hengshanxian', '421300', '3', '0');
INSERT INTO `t_city` VALUES ('1928', '1919', '衡东县', 'hengdongxian', '421400', '3', '0');
INSERT INTO `t_city` VALUES ('1929', '1919', '祁东县', 'qidongxian', '421600', '3', '0');
INSERT INTO `t_city` VALUES ('1930', '1919', '耒阳市', 'yangshi', '421800', '3', '0');
INSERT INTO `t_city` VALUES ('1931', '1919', '常宁市', 'changningshi', '421500', '3', '0');
INSERT INTO `t_city` VALUES ('1932', '1892', '邵阳市', 'shaoyangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1933', '1932', '双清区', 'shuangqingqu', '422001', '3', '0');
INSERT INTO `t_city` VALUES ('1934', '1932', '大祥区', 'daxiangqu', '422000', '3', '0');
INSERT INTO `t_city` VALUES ('1935', '1932', '北塔区', 'beitaqu', '422007', '3', '0');
INSERT INTO `t_city` VALUES ('1936', '1932', '邵东县', 'shaodongxian', '422800', '3', '0');
INSERT INTO `t_city` VALUES ('1937', '1932', '新邵县', 'xinshaoxian', '422900', '3', '0');
INSERT INTO `t_city` VALUES ('1938', '1932', '邵阳县', 'shaoyangxian', '422100', '3', '0');
INSERT INTO `t_city` VALUES ('1939', '1932', '隆回县', 'longhuixian', '422200', '3', '0');
INSERT INTO `t_city` VALUES ('1940', '1932', '洞口县', 'dongkouxian', '422300', '3', '0');
INSERT INTO `t_city` VALUES ('1941', '1932', '绥宁县', 'suiningxian', '422600', '3', '0');
INSERT INTO `t_city` VALUES ('1942', '1932', '新宁县', 'xinningxian', '422700', '3', '0');
INSERT INTO `t_city` VALUES ('1943', '1932', '城步苗族自治县', 'chengbumiaozuzizhixian', '422500', '3', '0');
INSERT INTO `t_city` VALUES ('1944', '1932', '武冈市', 'wugangshi', '422400', '3', '0');
INSERT INTO `t_city` VALUES ('1945', '1892', '岳阳市', 'yueyangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1946', '1945', '岳阳楼区', 'yueyanglouqu', '414000', '3', '0');
INSERT INTO `t_city` VALUES ('1947', '1945', '云溪区', 'yunxiqu', '414009', '3', '0');
INSERT INTO `t_city` VALUES ('1948', '1945', '君山区', 'junshanqu', '414005', '3', '0');
INSERT INTO `t_city` VALUES ('1949', '1945', '岳阳县', 'yueyangxian', '414100', '3', '0');
INSERT INTO `t_city` VALUES ('1950', '1945', '华容县', 'huarongxian', '414200', '3', '0');
INSERT INTO `t_city` VALUES ('1951', '1945', '湘阴县', 'xiangyinxian', '410500', '3', '0');
INSERT INTO `t_city` VALUES ('1952', '1945', '平江县', 'pingjiangxian', '414500', '3', '0');
INSERT INTO `t_city` VALUES ('1953', '1945', '汨罗市', 'luoshi', '414400', '3', '0');
INSERT INTO `t_city` VALUES ('1954', '1945', '临湘市', 'linxiangshi', '414300', '3', '0');
INSERT INTO `t_city` VALUES ('1955', '1892', '常德市', 'changdeshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1956', '1955', '武陵区', 'wulingqu', '415000', '3', '0');
INSERT INTO `t_city` VALUES ('1957', '1955', '鼎城区', 'dingchengqu', '415101', '3', '0');
INSERT INTO `t_city` VALUES ('1958', '1955', '安乡县', 'anxiangxian', '415600', '3', '0');
INSERT INTO `t_city` VALUES ('1959', '1955', '汉寿县', 'hanshouxian', '415900', '3', '0');
INSERT INTO `t_city` VALUES ('1960', '1955', '澧县', 'xian', '415500', '3', '0');
INSERT INTO `t_city` VALUES ('1961', '1955', '临澧县', 'linxian', '415200', '3', '0');
INSERT INTO `t_city` VALUES ('1962', '1955', '桃源县', 'taoyuanxian', '415700', '3', '0');
INSERT INTO `t_city` VALUES ('1963', '1955', '石门县', 'shimenxian', '415300', '3', '0');
INSERT INTO `t_city` VALUES ('1964', '1955', '津市市', 'jinshishi', '415400', '3', '0');
INSERT INTO `t_city` VALUES ('1965', '1892', '张家界市', 'zhangjiajieshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1966', '1965', '永定区', 'yongdingqu', '427000', '3', '0');
INSERT INTO `t_city` VALUES ('1967', '1965', '武陵源区', 'wulingyuanqu', '427400', '3', '0');
INSERT INTO `t_city` VALUES ('1968', '1965', '慈利县', 'cilixian', '427200', '3', '0');
INSERT INTO `t_city` VALUES ('1969', '1965', '桑植县', 'sangzhixian', '427100', '3', '0');
INSERT INTO `t_city` VALUES ('1970', '1892', '益阳市', 'yiyangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1971', '1970', '资阳区', 'ziyangqu', '413001', '3', '0');
INSERT INTO `t_city` VALUES ('1972', '1970', '赫山区', 'heshanqu', '413002', '3', '0');
INSERT INTO `t_city` VALUES ('1973', '1970', '南县', 'nanxian', '413200', '3', '0');
INSERT INTO `t_city` VALUES ('1974', '1970', '桃江县', 'taojiangxian', '413400', '3', '0');
INSERT INTO `t_city` VALUES ('1975', '1970', '安化县', 'anhuaxian', '413500', '3', '0');
INSERT INTO `t_city` VALUES ('1976', '1970', '沅江市', 'jiangshi', '413100', '3', '0');
INSERT INTO `t_city` VALUES ('1977', '1892', '郴州市', 'chenzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1978', '1977', '北湖区', 'beihuqu', '423000', '3', '0');
INSERT INTO `t_city` VALUES ('1979', '1977', '苏仙区', 'suxianqu', '423000', '3', '0');
INSERT INTO `t_city` VALUES ('1980', '1977', '桂阳县', 'guiyangxian', '424400', '3', '0');
INSERT INTO `t_city` VALUES ('1981', '1977', '宜章县', 'yizhangxian', '424200', '3', '0');
INSERT INTO `t_city` VALUES ('1982', '1977', '永兴县', 'yongxingxian', '423300', '3', '0');
INSERT INTO `t_city` VALUES ('1983', '1977', '嘉禾县', 'jiahexian', '424500', '3', '0');
INSERT INTO `t_city` VALUES ('1984', '1977', '临武县', 'linwuxian', '424300', '3', '0');
INSERT INTO `t_city` VALUES ('1985', '1977', '汝城县', 'ruchengxian', '424100', '3', '0');
INSERT INTO `t_city` VALUES ('1986', '1977', '桂东县', 'guidongxian', '423500', '3', '0');
INSERT INTO `t_city` VALUES ('1987', '1977', '安仁县', 'anrenxian', '423600', '3', '0');
INSERT INTO `t_city` VALUES ('1988', '1977', '资兴市', 'zixingshi', '423400', '3', '0');
INSERT INTO `t_city` VALUES ('1989', '1892', '永州市', 'yongzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('1990', '1989', '冷水滩区', 'lengshuitanqu', '425100', '3', '0');
INSERT INTO `t_city` VALUES ('1991', '1989', '祁阳县', 'qiyangxian', '426100', '3', '0');
INSERT INTO `t_city` VALUES ('1992', '1989', '东安县', 'donganxian', '425900', '3', '0');
INSERT INTO `t_city` VALUES ('1993', '1989', '双牌县', 'shuangpaixian', '425200', '3', '0');
INSERT INTO `t_city` VALUES ('1994', '1989', '道县', 'daoxian', '425300', '3', '0');
INSERT INTO `t_city` VALUES ('1995', '1989', '江永县', 'jiangyongxian', '425400', '3', '0');
INSERT INTO `t_city` VALUES ('1996', '1989', '宁远县', 'ningyuanxian', '425600', '3', '0');
INSERT INTO `t_city` VALUES ('1997', '1989', '蓝山县', 'lanshanxian', '425800', '3', '0');
INSERT INTO `t_city` VALUES ('1998', '1989', '新田县', 'xintianxian', '425700', '3', '0');
INSERT INTO `t_city` VALUES ('1999', '1989', '江华瑶族自治县', 'jianghuayaozuzizhixian', '425500', '3', '0');
INSERT INTO `t_city` VALUES ('2000', '1989', '零陵区', 'linglingqu', '425002', '3', '0');
INSERT INTO `t_city` VALUES ('2001', '1892', '怀化市', 'huaihuashi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2002', '2001', '鹤城区', 'hechengqu', '418000', '3', '0');
INSERT INTO `t_city` VALUES ('2003', '2001', '中方县', 'zhongfangxian', '418005', '3', '0');
INSERT INTO `t_city` VALUES ('2004', '2001', '沅陵县', 'lingxian', '419600', '3', '0');
INSERT INTO `t_city` VALUES ('2005', '2001', '辰溪县', 'chenxixian', '419500', '3', '0');
INSERT INTO `t_city` VALUES ('2006', '2001', '溆浦县', 'puxian', '419300', '3', '0');
INSERT INTO `t_city` VALUES ('2007', '2001', '会同县', 'huitongxian', '418300', '3', '0');
INSERT INTO `t_city` VALUES ('2008', '2001', '麻阳苗族自治县', 'mayangmiaozuzizhixian', '419400', '3', '0');
INSERT INTO `t_city` VALUES ('2009', '2001', '新晃侗族自治县', 'xinhuangdongzuzizhixian', '419200', '3', '0');
INSERT INTO `t_city` VALUES ('2010', '2001', '芷江侗族自治县', 'jiangdongzuzizhixian', '419100', '3', '0');
INSERT INTO `t_city` VALUES ('2011', '2001', '靖州苗族侗族自治县', 'jingzhoumiaozudongzuzizhixian', '418400', '3', '0');
INSERT INTO `t_city` VALUES ('2012', '2001', '通道侗族自治县', 'tongdaodongzuzizhixian', '418500', '3', '0');
INSERT INTO `t_city` VALUES ('2013', '2001', '洪江市', 'hongjiangshi', '418116', '3', '0');
INSERT INTO `t_city` VALUES ('2014', '1892', '娄底市', 'loudishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2015', '2014', '娄星区', 'louxingqu', '417000', '3', '0');
INSERT INTO `t_city` VALUES ('2016', '2014', '双峰县', 'shuangfengxian', '417700', '3', '0');
INSERT INTO `t_city` VALUES ('2017', '2014', '新化县', 'xinhuaxian', '417600', '3', '0');
INSERT INTO `t_city` VALUES ('2018', '2014', '冷水江市', 'lengshuijiangshi', '417500', '3', '0');
INSERT INTO `t_city` VALUES ('2019', '2014', '涟源市', 'lianyuanshi', '417100', '3', '0');
INSERT INTO `t_city` VALUES ('2020', '1892', '湘西土家族苗族自治州', 'xiangxitujiazumiaozuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2021', '2020', '吉首市', 'jishoushi', '416000', '3', '0');
INSERT INTO `t_city` VALUES ('2022', '2020', '泸溪县', 'xixian', '416100', '3', '0');
INSERT INTO `t_city` VALUES ('2023', '2020', '凤凰县', 'fenghuangxian', '416200', '3', '0');
INSERT INTO `t_city` VALUES ('2024', '2020', '花垣县', 'huayuanxian', '416400', '3', '0');
INSERT INTO `t_city` VALUES ('2025', '2020', '保靖县', 'baojingxian', '416500', '3', '0');
INSERT INTO `t_city` VALUES ('2026', '2020', '古丈县', 'guzhangxian', '416300', '3', '0');
INSERT INTO `t_city` VALUES ('2027', '2020', '永顺县', 'yongshunxian', '416700', '3', '0');
INSERT INTO `t_city` VALUES ('2028', '2020', '龙山县', 'longshanxian', '416800', '3', '0');
INSERT INTO `t_city` VALUES ('2029', '1', '广东', 'guangdong', '0', '1', '0');
INSERT INTO `t_city` VALUES ('2030', '2029', '广州市', 'guangzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2031', '2030', '荔湾区', 'liwanqu', '510145', '3', '0');
INSERT INTO `t_city` VALUES ('2032', '2030', '越秀区', 'yuexiuqu', '510030', '3', '0');
INSERT INTO `t_city` VALUES ('2033', '2030', '海珠区', 'haizhuqu', '510220', '3', '0');
INSERT INTO `t_city` VALUES ('2034', '2030', '天河区', 'tianhequ', '510630', '3', '0');
INSERT INTO `t_city` VALUES ('2035', '2030', '白云区', 'baiyunqu', '510080', '3', '0');
INSERT INTO `t_city` VALUES ('2036', '2030', '黄埔区', 'huangpuqu', '510700', '3', '0');
INSERT INTO `t_city` VALUES ('2037', '2030', '番禺区', 'fanqu', '511400', '3', '0');
INSERT INTO `t_city` VALUES ('2038', '2030', '花都区', 'huaduqu', '510800', '3', '0');
INSERT INTO `t_city` VALUES ('2039', '2030', '增城市', 'zengchengshi', '511300', '3', '0');
INSERT INTO `t_city` VALUES ('2040', '2030', '从化市', 'conghuashi', '510900', '3', '0');
INSERT INTO `t_city` VALUES ('2041', '2030', '南沙区', 'nanshaqu', '511400', '3', '0');
INSERT INTO `t_city` VALUES ('2042', '2030', '萝岗区', 'luogangqu', '510100', '3', '0');
INSERT INTO `t_city` VALUES ('2043', '2029', '韶关市', 'shaoguanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2044', '2043', '武江区', 'wujiangqu', '512026', '3', '0');
INSERT INTO `t_city` VALUES ('2045', '2043', '浈江区', 'jiangqu', '512023', '3', '0');
INSERT INTO `t_city` VALUES ('2046', '2043', '曲江区', 'qujiangqu', '512100', '3', '0');
INSERT INTO `t_city` VALUES ('2047', '2043', '始兴县', 'shixingxian', '512500', '3', '0');
INSERT INTO `t_city` VALUES ('2048', '2043', '仁化县', 'renhuaxian', '512300', '3', '0');
INSERT INTO `t_city` VALUES ('2049', '2043', '翁源县', 'wengyuanxian', '512600', '3', '0');
INSERT INTO `t_city` VALUES ('2050', '2043', '乳源瑶族自治县', 'ruyuanyaozuzizhixian', '512700', '3', '0');
INSERT INTO `t_city` VALUES ('2051', '2043', '新丰县', 'xinfengxian', '511100', '3', '0');
INSERT INTO `t_city` VALUES ('2052', '2043', '乐昌市', 'lechangshi', '512200', '3', '0');
INSERT INTO `t_city` VALUES ('2053', '2043', '南雄市', 'nanxiongshi', '512400', '3', '0');
INSERT INTO `t_city` VALUES ('2054', '2029', '深圳市', 'shenshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2055', '2054', '罗湖区', 'luohuqu', '518001', '3', '0');
INSERT INTO `t_city` VALUES ('2056', '2054', '福田区', 'futianqu', '518033', '3', '0');
INSERT INTO `t_city` VALUES ('2057', '2054', '南山区', 'nanshanqu', '518052', '3', '0');
INSERT INTO `t_city` VALUES ('2058', '2054', '宝安区', 'baoanqu', '518101', '3', '0');
INSERT INTO `t_city` VALUES ('2059', '2054', '龙岗区', 'longgangqu', '518116', '3', '0');
INSERT INTO `t_city` VALUES ('2060', '2054', '盐田区', 'yantianqu', '518083', '3', '0');
INSERT INTO `t_city` VALUES ('2061', '2054', '光明新区', 'guangmingxinqu', '518107', '3', '0');
INSERT INTO `t_city` VALUES ('2062', '2054', '坪山新区', 'pingshanxinqu', '518118', '3', '0');
INSERT INTO `t_city` VALUES ('2063', '2029', '珠海市', 'zhuhaishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2064', '2063', '香洲区', 'xiangzhouqu', '519000', '3', '0');
INSERT INTO `t_city` VALUES ('2065', '2063', '斗门区', 'doumenqu', '519100', '3', '0');
INSERT INTO `t_city` VALUES ('2066', '2063', '金湾区', 'jinwanqu', '519090', '3', '0');
INSERT INTO `t_city` VALUES ('2067', '2029', '汕头市', 'shantoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2068', '2067', '龙湖区', 'longhuqu', '515041', '3', '0');
INSERT INTO `t_city` VALUES ('2069', '2067', '金平区', 'jinpingqu', '515041', '3', '0');
INSERT INTO `t_city` VALUES ('2070', '2067', '濠江区', 'jiangqu', '515071', '3', '0');
INSERT INTO `t_city` VALUES ('2071', '2067', '潮阳区', 'chaoyangqu', '515100', '3', '0');
INSERT INTO `t_city` VALUES ('2072', '2067', '潮南区', 'chaonanqu', '515144', '3', '0');
INSERT INTO `t_city` VALUES ('2073', '2067', '澄海区', 'chenghaiqu', '515800', '3', '0');
INSERT INTO `t_city` VALUES ('2074', '2067', '南澳县', 'nanaoxian', '515900', '3', '0');
INSERT INTO `t_city` VALUES ('2075', '2029', '佛山市', 'foshanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2076', '2075', '禅城区', 'chengqu', '528000', '3', '0');
INSERT INTO `t_city` VALUES ('2077', '2075', '南海区', 'nanhaiqu', '528200', '3', '0');
INSERT INTO `t_city` VALUES ('2078', '2075', '顺德区', 'shundequ', '528300', '3', '0');
INSERT INTO `t_city` VALUES ('2079', '2075', '三水区', 'sanshuiqu', '528100', '3', '0');
INSERT INTO `t_city` VALUES ('2080', '2075', '高明区', 'gaomingqu', '528500', '3', '0');
INSERT INTO `t_city` VALUES ('2081', '2029', '江门市', 'jiangmenshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2082', '2081', '蓬江区', 'pengjiangqu', '529051', '3', '0');
INSERT INTO `t_city` VALUES ('2083', '2081', '江海区', 'jianghaiqu', '529000', '3', '0');
INSERT INTO `t_city` VALUES ('2084', '2081', '新会区', 'xinhuiqu', '529100', '3', '0');
INSERT INTO `t_city` VALUES ('2085', '2081', '台山市', 'taishanshi', '529211', '3', '0');
INSERT INTO `t_city` VALUES ('2086', '2081', '开平市', 'kaipingshi', '529312', '3', '0');
INSERT INTO `t_city` VALUES ('2087', '2081', '鹤山市', 'heshanshi', '529711', '3', '0');
INSERT INTO `t_city` VALUES ('2088', '2081', '恩平市', 'enpingshi', '529411', '3', '0');
INSERT INTO `t_city` VALUES ('2089', '2029', '湛江市', 'zhanjiangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2090', '2089', '赤坎区', 'chikanqu', '524033', '3', '0');
INSERT INTO `t_city` VALUES ('2091', '2089', '霞山区', 'xiashanqu', '524002', '3', '0');
INSERT INTO `t_city` VALUES ('2092', '2089', '坡头区', 'potouqu', '524057', '3', '0');
INSERT INTO `t_city` VALUES ('2093', '2089', '麻章区', 'mazhangqu', '524003', '3', '0');
INSERT INTO `t_city` VALUES ('2094', '2089', '遂溪县', 'suixixian', '524300', '3', '0');
INSERT INTO `t_city` VALUES ('2095', '2089', '徐闻县', 'xuwenxian', '524100', '3', '0');
INSERT INTO `t_city` VALUES ('2096', '2089', '廉江市', 'lianjiangshi', '524400', '3', '0');
INSERT INTO `t_city` VALUES ('2097', '2089', '雷州市', 'leizhoushi', '524200', '3', '0');
INSERT INTO `t_city` VALUES ('2098', '2089', '吴川市', 'wuchuanshi', '524500', '3', '0');
INSERT INTO `t_city` VALUES ('2099', '2089', '开发区', 'kaifaqu', '524022', '3', '0');
INSERT INTO `t_city` VALUES ('2100', '2029', '茂名市', 'maomingshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2101', '2100', '茂南区', 'maonanqu', '525011', '3', '0');
INSERT INTO `t_city` VALUES ('2102', '2100', '茂港区', 'maogangqu', '525027', '3', '0');
INSERT INTO `t_city` VALUES ('2103', '2100', '电白县', 'dianbaixian', '525400', '3', '0');
INSERT INTO `t_city` VALUES ('2104', '2100', '高州市', 'gaozhoushi', '525200', '3', '0');
INSERT INTO `t_city` VALUES ('2105', '2100', '化州市', 'huazhoushi', '525100', '3', '0');
INSERT INTO `t_city` VALUES ('2106', '2100', '信宜市', 'xinyishi', '525300', '3', '0');
INSERT INTO `t_city` VALUES ('2107', '2029', '肇庆市', 'zhaoqingshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2108', '2107', '端州区', 'duanzhouqu', '526040', '3', '0');
INSERT INTO `t_city` VALUES ('2109', '2107', '鼎湖区', 'dinghuqu', '526070', '3', '0');
INSERT INTO `t_city` VALUES ('2110', '2107', '广宁县', 'guangningxian', '526300', '3', '0');
INSERT INTO `t_city` VALUES ('2111', '2107', '怀集县', 'huaijixian', '526400', '3', '0');
INSERT INTO `t_city` VALUES ('2112', '2107', '封开县', 'fengkaixian', '526500', '3', '0');
INSERT INTO `t_city` VALUES ('2113', '2107', '德庆县', 'deqingxian', '526600', '3', '0');
INSERT INTO `t_city` VALUES ('2114', '2107', '高要市', 'gaoyaoshi', '526100', '3', '0');
INSERT INTO `t_city` VALUES ('2115', '2107', '四会市', 'sihuishi', '526200', '3', '0');
INSERT INTO `t_city` VALUES ('2116', '2107', '高新技术产业开发区', 'gaoxinjishuchanyekaifaqu', '526238', '3', '0');
INSERT INTO `t_city` VALUES ('2117', '2029', '惠州市', 'huizhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2118', '2117', '惠城区', 'huichengqu', '516001', '3', '0');
INSERT INTO `t_city` VALUES ('2119', '2117', '惠阳区', 'huiyangqu', '516200', '3', '0');
INSERT INTO `t_city` VALUES ('2120', '2117', '博罗县', 'boluoxian', '516100', '3', '0');
INSERT INTO `t_city` VALUES ('2121', '2117', '惠东县', 'huidongxian', '516300', '3', '0');
INSERT INTO `t_city` VALUES ('2122', '2117', '龙门县', 'longmenxian', '516800', '3', '0');
INSERT INTO `t_city` VALUES ('2123', '2117', '大亚湾区', 'dayawanqu', '516080', '3', '0');
INSERT INTO `t_city` VALUES ('2124', '2117', '仲恺高新区', 'zhonggaoxinqu', '516080', '3', '0');
INSERT INTO `t_city` VALUES ('2125', '2029', '梅州市', 'meizhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2126', '2125', '梅江区', 'meijiangqu', '514000', '3', '0');
INSERT INTO `t_city` VALUES ('2127', '2125', '梅县', 'meixian', '514733', '3', '0');
INSERT INTO `t_city` VALUES ('2128', '2125', '大埔县', 'dapuxian', '514200', '3', '0');
INSERT INTO `t_city` VALUES ('2129', '2125', '丰顺县', 'fengshunxian', '514300', '3', '0');
INSERT INTO `t_city` VALUES ('2130', '2125', '五华县', 'wuhuaxian', '514400', '3', '0');
INSERT INTO `t_city` VALUES ('2131', '2125', '平远县', 'pingyuanxian', '514600', '3', '0');
INSERT INTO `t_city` VALUES ('2132', '2125', '蕉岭县', 'jiaolingxian', '514100', '3', '0');
INSERT INTO `t_city` VALUES ('2133', '2125', '兴宁市', 'xingningshi', '514500', '3', '0');
INSERT INTO `t_city` VALUES ('2134', '2029', '汕尾市', 'shanweishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2135', '2134', '城区', 'chengqu', '516601', '3', '0');
INSERT INTO `t_city` VALUES ('2136', '2134', '陆丰市', 'lufengshi', '516500', '3', '0');
INSERT INTO `t_city` VALUES ('2137', '2134', '海丰县', 'haifengxian', '516400', '3', '0');
INSERT INTO `t_city` VALUES ('2138', '2134', '陆河县', 'luhexian', '516700', '3', '0');
INSERT INTO `t_city` VALUES ('2139', '2029', '河源市', 'heyuanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2140', '2139', '源城区', 'yuanchengqu', '517000', '3', '0');
INSERT INTO `t_city` VALUES ('2141', '2139', '紫金县', 'zijinxian', '517400', '3', '0');
INSERT INTO `t_city` VALUES ('2142', '2139', '龙川县', 'longchuanxian', '517300', '3', '0');
INSERT INTO `t_city` VALUES ('2143', '2139', '连平县', 'lianpingxian', '517100', '3', '0');
INSERT INTO `t_city` VALUES ('2144', '2139', '和平县', 'hepingxian', '517200', '3', '0');
INSERT INTO `t_city` VALUES ('2145', '2139', '东源县', 'dongyuanxian', '517500', '3', '0');
INSERT INTO `t_city` VALUES ('2146', '2029', '阳江市', 'yangjiangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2147', '2146', '江城区', 'jiangchengqu', '529525', '3', '0');
INSERT INTO `t_city` VALUES ('2148', '2146', '阳西县', 'yangxixian', '529800', '3', '0');
INSERT INTO `t_city` VALUES ('2149', '2146', '阳东县', 'yangdongxian', '529931', '3', '0');
INSERT INTO `t_city` VALUES ('2150', '2146', '阳春市', 'yangchunshi', '529611', '3', '0');
INSERT INTO `t_city` VALUES ('2151', '2029', '清远市', 'qingyuanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2152', '2151', '清城区', 'qingchengqu', '511500', '3', '0');
INSERT INTO `t_city` VALUES ('2153', '2151', '佛冈县', 'fogangxian', '511600', '3', '0');
INSERT INTO `t_city` VALUES ('2154', '2151', '阳山县', 'yangshanxian', '513100', '3', '0');
INSERT INTO `t_city` VALUES ('2155', '2151', '连山壮族瑶族自治县', 'lianshanzhuangzuyaozuzizhixian', '513200', '3', '0');
INSERT INTO `t_city` VALUES ('2156', '2151', '连南瑶族自治县', 'liannanyaozuzizhixian', '513300', '3', '0');
INSERT INTO `t_city` VALUES ('2157', '2151', '清新县', 'qingxinxian', '511800', '3', '0');
INSERT INTO `t_city` VALUES ('2158', '2151', '英德市', 'yingdeshi', '513000', '3', '0');
INSERT INTO `t_city` VALUES ('2159', '2151', '连州市', 'lianzhoushi', '513401', '3', '0');
INSERT INTO `t_city` VALUES ('2160', '2029', '潮州市', 'chaozhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2161', '2160', '湘桥区', 'xiangqiaoqu', '521000', '3', '0');
INSERT INTO `t_city` VALUES ('2162', '2160', '潮安县', 'chaoanxian', '515638', '3', '0');
INSERT INTO `t_city` VALUES ('2163', '2160', '饶平县', 'raopingxian', '515700', '3', '0');
INSERT INTO `t_city` VALUES ('2164', '2029', '揭阳市', 'jieyangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2165', '2164', '榕城区', 'chengqu', '522095', '3', '0');
INSERT INTO `t_city` VALUES ('2166', '2164', '揭东县', 'jiedongxian', '515554', '3', '0');
INSERT INTO `t_city` VALUES ('2167', '2164', '揭西县', 'jiexixian', '515400', '3', '0');
INSERT INTO `t_city` VALUES ('2168', '2164', '惠来县', 'huilaixian', '515200', '3', '0');
INSERT INTO `t_city` VALUES ('2169', '2164', '普宁市', 'puningshi', '515300', '3', '0');
INSERT INTO `t_city` VALUES ('2170', '2164', '东山区', 'dongshanqu', '522031', '3', '0');
INSERT INTO `t_city` VALUES ('2171', '2164', '普侨区', 'puqiaoqu', '515339', '3', '0');
INSERT INTO `t_city` VALUES ('2172', '2164', '大南山侨区', 'dananshanqiaoqu', '515237', '3', '0');
INSERT INTO `t_city` VALUES ('2173', '2029', '云浮市', 'yunfushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2174', '2173', '云城区', 'yunchengqu', '527300', '3', '0');
INSERT INTO `t_city` VALUES ('2175', '2173', '新兴县', 'xinxingxian', '527400', '3', '0');
INSERT INTO `t_city` VALUES ('2176', '2173', '郁南县', 'yunanxian', '527100', '3', '0');
INSERT INTO `t_city` VALUES ('2177', '2173', '云安县', 'yunanxian', '527500', '3', '0');
INSERT INTO `t_city` VALUES ('2178', '2173', '罗定市', 'luodingshi', '527200', '3', '0');
INSERT INTO `t_city` VALUES ('2179', '2029', '东莞市', 'dongshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2180', '2179', '南城区', 'nanchengqu', '523000', '3', '0');
INSERT INTO `t_city` VALUES ('2181', '2179', '石龙镇', 'shilongzhen', '523021', '3', '0');
INSERT INTO `t_city` VALUES ('2182', '2179', '长安镇', 'changanzhen', '523068', '3', '0');
INSERT INTO `t_city` VALUES ('2183', '2179', '虎门镇', 'humenzhen', '523061', '3', '0');
INSERT INTO `t_city` VALUES ('2184', '2179', '横沥镇', 'henglizhen', '523032', '3', '0');
INSERT INTO `t_city` VALUES ('2185', '2179', '寮步镇', 'buzhen', '523058', '3', '0');
INSERT INTO `t_city` VALUES ('2186', '2179', '黄江镇', 'huangjiangzhen', '523054', '3', '0');
INSERT INTO `t_city` VALUES ('2187', '2179', '清溪镇', 'qingxizhen', '523046', '3', '0');
INSERT INTO `t_city` VALUES ('2188', '2179', '莞城区', 'chengqu', '523000', '3', '0');
INSERT INTO `t_city` VALUES ('2189', '2179', '万江区', 'wanjiangqu', '523050', '3', '0');
INSERT INTO `t_city` VALUES ('2190', '2179', '东城区', 'dongchengqu', '523000', '3', '0');
INSERT INTO `t_city` VALUES ('2191', '2179', '石碣镇', 'shizhen', '523024', '3', '0');
INSERT INTO `t_city` VALUES ('2192', '2179', '茶山镇', 'chashanzhen', '523029', '3', '0');
INSERT INTO `t_city` VALUES ('2193', '2179', '石排镇', 'shipaizhen', '523025', '3', '0');
INSERT INTO `t_city` VALUES ('2194', '2179', '企石镇', 'qishizhen', '523027', '3', '0');
INSERT INTO `t_city` VALUES ('2195', '2179', '桥头镇', 'qiaotouzhen', '523038', '3', '0');
INSERT INTO `t_city` VALUES ('2196', '2179', '谢岗镇', 'xiegangzhen', '523044', '3', '0');
INSERT INTO `t_city` VALUES ('2197', '2179', '东坑镇', 'dongkengzhen', '523034', '3', '0');
INSERT INTO `t_city` VALUES ('2198', '2179', '常平镇', 'changpingzhen', '523036', '3', '0');
INSERT INTO `t_city` VALUES ('2199', '2179', '大朗镇', 'dalangzhen', '523056', '3', '0');
INSERT INTO `t_city` VALUES ('2200', '2179', '塘厦镇', 'tangxiazhen', '523710', '3', '0');
INSERT INTO `t_city` VALUES ('2201', '2179', '凤岗镇', 'fenggangzhen', '523048', '3', '0');
INSERT INTO `t_city` VALUES ('2202', '2179', '厚街镇', 'houjiezhen', '523071', '3', '0');
INSERT INTO `t_city` VALUES ('2203', '2179', '沙田镇', 'shatianzhen', '523073', '3', '0');
INSERT INTO `t_city` VALUES ('2204', '2179', '道滘镇', 'dao', '523170', '3', '0');
INSERT INTO `t_city` VALUES ('2205', '2179', '洪梅镇', 'hongmeizhen', '523083', '3', '0');
INSERT INTO `t_city` VALUES ('2206', '2179', '麻涌镇', 'mayongzhen', '523078', '3', '0');
INSERT INTO `t_city` VALUES ('2207', '2179', '中堂镇', 'zhongtangzhen', '523075', '3', '0');
INSERT INTO `t_city` VALUES ('2208', '2179', '高埗镇', 'gao', '523270', '3', '0');
INSERT INTO `t_city` VALUES ('2209', '2179', '樟木头镇', 'zhangmutouzhen', '523041', '3', '0');
INSERT INTO `t_city` VALUES ('2210', '2179', '大岭山镇', 'dalingshanzhen', '523074', '3', '0');
INSERT INTO `t_city` VALUES ('2211', '2179', '望牛墩镇', 'wangniudunzhen', '523077', '3', '0');
INSERT INTO `t_city` VALUES ('2212', '2029', '中山市', 'zhongshanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2213', '2212', '中山市', 'zhongshanshi', '528403', '3', '0');
INSERT INTO `t_city` VALUES ('2214', '1', '广西', 'guangxi', '0', '1', '0');
INSERT INTO `t_city` VALUES ('2215', '2214', '南宁市', 'nanningshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2216', '2215', '兴宁区', 'xingningqu', '530012', '3', '0');
INSERT INTO `t_city` VALUES ('2217', '2215', '青秀区', 'qingxiuqu', '530022', '3', '0');
INSERT INTO `t_city` VALUES ('2218', '2215', '江南区', 'jiangnanqu', '530031', '3', '0');
INSERT INTO `t_city` VALUES ('2219', '2215', '西乡塘区', 'xixiangtangqu', '530001', '3', '0');
INSERT INTO `t_city` VALUES ('2220', '2215', '良庆区', 'liangqingqu', '530200', '3', '0');
INSERT INTO `t_city` VALUES ('2221', '2215', '邕宁区', 'ningqu', '530200', '3', '0');
INSERT INTO `t_city` VALUES ('2222', '2215', '武鸣县', 'wumingxian', '530100', '3', '0');
INSERT INTO `t_city` VALUES ('2223', '2215', '隆安县', 'longanxian', '532700', '3', '0');
INSERT INTO `t_city` VALUES ('2224', '2215', '马山县', 'mashanxian', '530600', '3', '0');
INSERT INTO `t_city` VALUES ('2225', '2215', '上林县', 'shanglinxian', '530500', '3', '0');
INSERT INTO `t_city` VALUES ('2226', '2215', '宾阳县', 'binyangxian', '530400', '3', '0');
INSERT INTO `t_city` VALUES ('2227', '2215', '横县', 'hengxian', '530300', '3', '0');
INSERT INTO `t_city` VALUES ('2228', '2214', '柳州市', 'liuzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2229', '2228', '城中区', 'chengzhongqu', '545001', '3', '0');
INSERT INTO `t_city` VALUES ('2230', '2228', '鱼峰区', 'yufengqu', '545005', '3', '0');
INSERT INTO `t_city` VALUES ('2231', '2228', '柳南区', 'liunanqu', '545005', '3', '0');
INSERT INTO `t_city` VALUES ('2232', '2228', '柳北区', 'liubeiqu', '545001', '3', '0');
INSERT INTO `t_city` VALUES ('2233', '2228', '柳江县', 'liujiangxian', '545100', '3', '0');
INSERT INTO `t_city` VALUES ('2234', '2228', '柳城县', 'liuchengxian', '545200', '3', '0');
INSERT INTO `t_city` VALUES ('2235', '2228', '鹿寨县', 'luzhaixian', '545600', '3', '0');
INSERT INTO `t_city` VALUES ('2236', '2228', '融安县', 'ronganxian', '545400', '3', '0');
INSERT INTO `t_city` VALUES ('2237', '2228', '融水苗族自治县', 'rongshuimiaozuzizhixian', '545300', '3', '0');
INSERT INTO `t_city` VALUES ('2238', '2228', '三江侗族自治县', 'sanjiangdongzuzizhixian', '545500', '3', '0');
INSERT INTO `t_city` VALUES ('2239', '2214', '桂林市', 'guilinshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2240', '2239', '秀峰区', 'xiufengqu', '541001', '3', '0');
INSERT INTO `t_city` VALUES ('2241', '2239', '叠彩区', 'diecaiqu', '541001', '3', '0');
INSERT INTO `t_city` VALUES ('2242', '2239', '象山区', 'xiangshanqu', '541002', '3', '0');
INSERT INTO `t_city` VALUES ('2243', '2239', '七星区', 'qixingqu', '541004', '3', '0');
INSERT INTO `t_city` VALUES ('2244', '2239', '雁山区', 'yanshanqu', '541006', '3', '0');
INSERT INTO `t_city` VALUES ('2245', '2239', '阳朔县', 'yangshuoxian', '541900', '3', '0');
INSERT INTO `t_city` VALUES ('2246', '2239', '临桂县', 'linguixian', '541100', '3', '0');
INSERT INTO `t_city` VALUES ('2247', '2239', '灵川县', 'lingchuanxian', '541200', '3', '0');
INSERT INTO `t_city` VALUES ('2248', '2239', '全州县', 'quanzhouxian', '541500', '3', '0');
INSERT INTO `t_city` VALUES ('2249', '2239', '兴安县', 'xinganxian', '541300', '3', '0');
INSERT INTO `t_city` VALUES ('2250', '2239', '永福县', 'yongfuxian', '541800', '3', '0');
INSERT INTO `t_city` VALUES ('2251', '2239', '灌阳县', 'guanyangxian', '541600', '3', '0');
INSERT INTO `t_city` VALUES ('2252', '2239', '龙胜各族自治县', 'longshenggezuzizhixian', '541700', '3', '0');
INSERT INTO `t_city` VALUES ('2253', '2239', '资源县', 'ziyuanxian', '541400', '3', '0');
INSERT INTO `t_city` VALUES ('2254', '2239', '平乐县', 'pinglexian', '542400', '3', '0');
INSERT INTO `t_city` VALUES ('2255', '2239', '荔浦县', 'lipuxian', '546600', '3', '0');
INSERT INTO `t_city` VALUES ('2256', '2239', '恭城瑶族自治县', 'gongchengyaozuzizhixian', '542500', '3', '0');
INSERT INTO `t_city` VALUES ('2257', '2214', '梧州市', 'wuzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2258', '2257', '万秀区', 'wanxiuqu', '543000', '3', '0');
INSERT INTO `t_city` VALUES ('2259', '2257', '蝶山区', 'dieshanqu', '543002', '3', '0');
INSERT INTO `t_city` VALUES ('2260', '2257', '长洲区', 'changzhouqu', '543002', '3', '0');
INSERT INTO `t_city` VALUES ('2261', '2257', '苍梧县', 'cangwuxian', '543100', '3', '0');
INSERT INTO `t_city` VALUES ('2262', '2257', '藤县', 'tengxian', '543300', '3', '0');
INSERT INTO `t_city` VALUES ('2263', '2257', '蒙山县', 'mengshanxian', '546700', '3', '0');
INSERT INTO `t_city` VALUES ('2264', '2257', '岑溪市', 'xishi', '543200', '3', '0');
INSERT INTO `t_city` VALUES ('2265', '2214', '北海市', 'beihaishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2266', '2265', '海城区', 'haichengqu', '536000', '3', '0');
INSERT INTO `t_city` VALUES ('2267', '2265', '银海区', 'yinhaiqu', '536000', '3', '0');
INSERT INTO `t_city` VALUES ('2268', '2265', '铁山港区', 'tieshangangqu', '536017', '3', '0');
INSERT INTO `t_city` VALUES ('2269', '2265', '合浦县', 'hepuxian', '536100', '3', '0');
INSERT INTO `t_city` VALUES ('2270', '2214', '防城港市', 'fangchenggangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2271', '2270', '港口区', 'gangkouqu', '538001', '3', '0');
INSERT INTO `t_city` VALUES ('2272', '2270', '防城区', 'fangchengqu', '538021', '3', '0');
INSERT INTO `t_city` VALUES ('2273', '2270', '上思县', 'shangsixian', '535500', '3', '0');
INSERT INTO `t_city` VALUES ('2274', '2270', '东兴市', 'dongxingshi', '538100', '3', '0');
INSERT INTO `t_city` VALUES ('2275', '2214', '钦州市', 'qinzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2276', '2275', '钦南区', 'qinnanqu', '535000', '3', '0');
INSERT INTO `t_city` VALUES ('2277', '2275', '钦北区', 'qinbeiqu', '535000', '3', '0');
INSERT INTO `t_city` VALUES ('2278', '2275', '灵山县', 'lingshanxian', '535400', '3', '0');
INSERT INTO `t_city` VALUES ('2279', '2275', '浦北县', 'pubeixian', '535300', '3', '0');
INSERT INTO `t_city` VALUES ('2280', '2275', '钦州港经济开发区', 'qinzhougangjingjikaifaqu', '535008', '3', '0');
INSERT INTO `t_city` VALUES ('2281', '2214', '贵港市', 'guigangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2282', '2281', '港北区', 'gangbeiqu', '537100', '3', '0');
INSERT INTO `t_city` VALUES ('2283', '2281', '港南区', 'gangnanqu', '537132', '3', '0');
INSERT INTO `t_city` VALUES ('2284', '2281', '覃塘区', 'tangqu', '537121', '3', '0');
INSERT INTO `t_city` VALUES ('2285', '2281', '平南县', 'pingnanxian', '537300', '3', '0');
INSERT INTO `t_city` VALUES ('2286', '2281', '桂平市', 'guipingshi', '537200', '3', '0');
INSERT INTO `t_city` VALUES ('2287', '2214', '玉林市', 'yulinshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2288', '2287', '玉州区', 'yuzhouqu', '537000', '3', '0');
INSERT INTO `t_city` VALUES ('2289', '2287', '容县', 'rongxian', '537500', '3', '0');
INSERT INTO `t_city` VALUES ('2290', '2287', '陆川县', 'luchuanxian', '537700', '3', '0');
INSERT INTO `t_city` VALUES ('2291', '2287', '博白县', 'bobaixian', '537600', '3', '0');
INSERT INTO `t_city` VALUES ('2292', '2287', '兴业县', 'xingyexian', '537800', '3', '0');
INSERT INTO `t_city` VALUES ('2293', '2287', '北流市', 'beiliushi', '537400', '3', '0');
INSERT INTO `t_city` VALUES ('2294', '2214', '百色市', 'baiseshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2295', '2294', '右江区', 'youjiangqu', '533000', '3', '0');
INSERT INTO `t_city` VALUES ('2296', '2294', '田阳县', 'tianyangxian', '533600', '3', '0');
INSERT INTO `t_city` VALUES ('2297', '2294', '田东县', 'tiandongxian', '531500', '3', '0');
INSERT INTO `t_city` VALUES ('2298', '2294', '平果县', 'pingguoxian', '531400', '3', '0');
INSERT INTO `t_city` VALUES ('2299', '2294', '德保县', 'debaoxian', '533700', '3', '0');
INSERT INTO `t_city` VALUES ('2300', '2294', '靖西县', 'jingxixian', '533800', '3', '0');
INSERT INTO `t_city` VALUES ('2301', '2294', '那坡县', 'napoxian', '533900', '3', '0');
INSERT INTO `t_city` VALUES ('2302', '2294', '凌云县', 'lingyunxian', '533100', '3', '0');
INSERT INTO `t_city` VALUES ('2303', '2294', '乐业县', 'leyexian', '533200', '3', '0');
INSERT INTO `t_city` VALUES ('2304', '2294', '田林县', 'tianlinxian', '533300', '3', '0');
INSERT INTO `t_city` VALUES ('2305', '2294', '西林县', 'xilinxian', '533500', '3', '0');
INSERT INTO `t_city` VALUES ('2306', '2294', '隆林各族自治县', 'longlingezuzizhixian', '533400', '3', '0');
INSERT INTO `t_city` VALUES ('2307', '2214', '贺州市', 'hezhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2308', '2307', '八步区', 'babuqu', '542800', '3', '0');
INSERT INTO `t_city` VALUES ('2309', '2307', '昭平县', 'zhaopingxian', '546800', '3', '0');
INSERT INTO `t_city` VALUES ('2310', '2307', '钟山县', 'zhongshanxian', '542600', '3', '0');
INSERT INTO `t_city` VALUES ('2311', '2307', '富川瑶族自治县', 'fuchuanyaozuzizhixian', '542700', '3', '0');
INSERT INTO `t_city` VALUES ('2312', '2214', '河池市', 'hechishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2313', '2312', '金城江区', 'jinchengjiangqu', '547000', '3', '0');
INSERT INTO `t_city` VALUES ('2314', '2312', '南丹县', 'nandanxian', '547200', '3', '0');
INSERT INTO `t_city` VALUES ('2315', '2312', '天峨县', 'tianexian', '547300', '3', '0');
INSERT INTO `t_city` VALUES ('2316', '2312', '凤山县', 'fengshanxian', '547600', '3', '0');
INSERT INTO `t_city` VALUES ('2317', '2312', '东兰县', 'donglanxian', '547400', '3', '0');
INSERT INTO `t_city` VALUES ('2318', '2312', '罗城仫佬族自治县', 'luochenglaozuzizhixian', '546400', '3', '0');
INSERT INTO `t_city` VALUES ('2319', '2312', '环江毛南族自治县', 'huanjiangmaonanzuzizhixian', '547100', '3', '0');
INSERT INTO `t_city` VALUES ('2320', '2312', '巴马瑶族自治县', 'bamayaozuzizhixian', '547500', '3', '0');
INSERT INTO `t_city` VALUES ('2321', '2312', '都安瑶族自治县', 'duanyaozuzizhixian', '530700', '3', '0');
INSERT INTO `t_city` VALUES ('2322', '2312', '大化瑶族自治县', 'dahuayaozuzizhixian', '530800', '3', '0');
INSERT INTO `t_city` VALUES ('2323', '2312', '宜州市', 'yizhoushi', '546300', '3', '0');
INSERT INTO `t_city` VALUES ('2324', '2214', '来宾市', 'laibinshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2325', '2324', '兴宾区', 'xingbinqu', '546100', '3', '0');
INSERT INTO `t_city` VALUES ('2326', '2324', '忻城县', 'xinchengxian', '546200', '3', '0');
INSERT INTO `t_city` VALUES ('2327', '2324', '象州县', 'xiangzhouxian', '545800', '3', '0');
INSERT INTO `t_city` VALUES ('2328', '2324', '武宣县', 'wuxuanxian', '545900', '3', '0');
INSERT INTO `t_city` VALUES ('2329', '2324', '金秀瑶族自治县', 'jinxiuyaozuzizhixian', '545700', '3', '0');
INSERT INTO `t_city` VALUES ('2330', '2324', '合山市', 'heshanshi', '546500', '3', '0');
INSERT INTO `t_city` VALUES ('2331', '2214', '崇左市', 'chongzuoshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2332', '2331', '江洲区', 'jiangzhouqu', '532200', '3', '0');
INSERT INTO `t_city` VALUES ('2333', '2331', '扶绥县', 'fusuixian', '532100', '3', '0');
INSERT INTO `t_city` VALUES ('2334', '2331', '宁明县', 'ningmingxian', '532500', '3', '0');
INSERT INTO `t_city` VALUES ('2335', '2331', '龙州县', 'longzhouxian', '532400', '3', '0');
INSERT INTO `t_city` VALUES ('2336', '2331', '大新县', 'daxinxian', '532300', '3', '0');
INSERT INTO `t_city` VALUES ('2337', '2331', '天等县', 'tiandengxian', '532800', '3', '0');
INSERT INTO `t_city` VALUES ('2338', '2331', '凭祥市', 'pingxiangshi', '532600', '3', '0');
INSERT INTO `t_city` VALUES ('2339', '1', '海南', 'hainan', '0', '1', '0');
INSERT INTO `t_city` VALUES ('2340', '2339', '海口市', 'haikoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2341', '2340', '秀英区', 'xiuyingqu', '570311', '3', '0');
INSERT INTO `t_city` VALUES ('2342', '2340', '龙华区', 'longhuaqu', '570105', '3', '0');
INSERT INTO `t_city` VALUES ('2343', '2340', '琼山区', 'qiongshanqu', '571100', '3', '0');
INSERT INTO `t_city` VALUES ('2344', '2340', '美兰区', 'meilanqu', '570203', '3', '0');
INSERT INTO `t_city` VALUES ('2345', '2339', '省直辖县级行政单位', 'shengzhixiaxianjixingzhengdanwei', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2346', '2345', '五指山市', 'wuzhishanshi', '572200', '3', '0');
INSERT INTO `t_city` VALUES ('2347', '2345', '琼海市', 'qionghaishi', '571400', '3', '0');
INSERT INTO `t_city` VALUES ('2348', '2345', '儋州市', 'zhoushi', '571700', '3', '0');
INSERT INTO `t_city` VALUES ('2349', '2345', '文昌市', 'wenchangshi', '571300', '3', '0');
INSERT INTO `t_city` VALUES ('2350', '2345', '万宁市', 'wanningshi', '571500', '3', '0');
INSERT INTO `t_city` VALUES ('2351', '2345', '东方市', 'dongfangshi', '572600', '3', '0');
INSERT INTO `t_city` VALUES ('2352', '2345', '定安县', 'dinganxian', '571200', '3', '0');
INSERT INTO `t_city` VALUES ('2353', '2345', '屯昌县', 'tunchangxian', '571600', '3', '0');
INSERT INTO `t_city` VALUES ('2354', '2345', '澄迈县', 'chengmaixian', '571900', '3', '0');
INSERT INTO `t_city` VALUES ('2355', '2345', '临高县', 'lingaoxian', '571800', '3', '0');
INSERT INTO `t_city` VALUES ('2356', '2345', '白沙黎族自治县', 'baishalizuzizhixian', '572800', '3', '0');
INSERT INTO `t_city` VALUES ('2357', '2345', '昌江黎族自治县', 'changjianglizuzizhixian', '572700', '3', '0');
INSERT INTO `t_city` VALUES ('2358', '2345', '乐东黎族自治县', 'ledonglizuzizhixian', '572500', '3', '0');
INSERT INTO `t_city` VALUES ('2359', '2345', '陵水黎族自治县', 'lingshuilizuzizhixian', '572400', '3', '0');
INSERT INTO `t_city` VALUES ('2360', '2345', '保亭黎族苗族自治县', 'baotinglizumiaozuzizhixian', '572300', '3', '0');
INSERT INTO `t_city` VALUES ('2361', '2345', '琼中黎族苗族自治县', 'qiongzhonglizumiaozuzizhixian', '572900', '3', '0');
INSERT INTO `t_city` VALUES ('2362', '2345', '西、南、中沙群岛办事处', 'xinanzhongshaqundaobanshichu', '573100', '3', '0');
INSERT INTO `t_city` VALUES ('2363', '2339', '三亚市', 'sanyashi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2364', '2363', '河西区', 'hexiqu', '572000', '3', '0');
INSERT INTO `t_city` VALUES ('2365', '2363', '河东区', 'hedongqu', '572000', '3', '0');
INSERT INTO `t_city` VALUES ('2366', '2363', '田独镇', 'tianduzhen', '572011', '3', '0');
INSERT INTO `t_city` VALUES ('2367', '2363', '凤凰镇', 'fenghuangzhen', '572023', '3', '0');
INSERT INTO `t_city` VALUES ('2368', '2363', '三亚市', 'sanyashi', '572000', '3', '0');
INSERT INTO `t_city` VALUES ('2369', '2363', '崖城镇', 'yachengzhen', '572025', '3', '0');
INSERT INTO `t_city` VALUES ('2370', '2363', '天涯镇', 'tianyazhen', '572029', '3', '0');
INSERT INTO `t_city` VALUES ('2371', '2363', '育才乡', 'yucaixiang', '572032', '3', '0');
INSERT INTO `t_city` VALUES ('2372', '2363', '海棠湾镇', 'haitangwanzhen', '572014', '3', '0');
INSERT INTO `t_city` VALUES ('2373', '1', '重庆', 'chongqing', '0', '1', '0');
INSERT INTO `t_city` VALUES ('2374', '2373', '重庆市', 'chongqingshi', '0', '2', '1');
INSERT INTO `t_city` VALUES ('2375', '2374', '万州区', 'wanzhouqu', '404100', '3', '0');
INSERT INTO `t_city` VALUES ('2376', '2374', '涪陵区', 'fulingqu', '408000', '3', '0');
INSERT INTO `t_city` VALUES ('2377', '2374', '渝中区', 'yuzhongqu', '400010', '3', '0');
INSERT INTO `t_city` VALUES ('2378', '2374', '大渡口区', 'dadukouqu', '400080', '3', '0');
INSERT INTO `t_city` VALUES ('2379', '2374', '江北区', 'jiangbeiqu', '400020', '3', '0');
INSERT INTO `t_city` VALUES ('2380', '2374', '沙坪坝区', 'shapingbaqu', '400030', '3', '0');
INSERT INTO `t_city` VALUES ('2381', '2374', '九龙坡区', 'jiulongpoqu', '400050', '3', '0');
INSERT INTO `t_city` VALUES ('2382', '2374', '南岸区', 'nananqu', '400064', '3', '0');
INSERT INTO `t_city` VALUES ('2383', '2374', '北碚区', 'beiqu', '400700', '3', '0');
INSERT INTO `t_city` VALUES ('2384', '2374', '万盛区', 'wanshengqu', '400800', '3', '0');
INSERT INTO `t_city` VALUES ('2385', '2374', '双桥区', 'shuangqiaoqu', '400900', '3', '0');
INSERT INTO `t_city` VALUES ('2386', '2374', '渝北区', 'yubeiqu', '401120', '3', '0');
INSERT INTO `t_city` VALUES ('2387', '2374', '巴南区', 'bananqu', '401320', '3', '0');
INSERT INTO `t_city` VALUES ('2388', '2374', '黔江区', 'qianjiangqu', '409700', '3', '0');
INSERT INTO `t_city` VALUES ('2389', '2374', '长寿区', 'changshouqu', '401220', '3', '0');
INSERT INTO `t_city` VALUES ('2390', '2374', '綦江县', 'jiangxian', '401420', '3', '0');
INSERT INTO `t_city` VALUES ('2391', '2374', '潼南县', 'nanxian', '402660', '3', '0');
INSERT INTO `t_city` VALUES ('2392', '2374', '铜梁县', 'tongliangxian', '402560', '3', '0');
INSERT INTO `t_city` VALUES ('2393', '2374', '大足县', 'dazuxian', '402360', '3', '0');
INSERT INTO `t_city` VALUES ('2394', '2374', '荣昌县', 'rongchangxian', '402460', '3', '0');
INSERT INTO `t_city` VALUES ('2395', '2374', '璧山县', 'shanxian', '402760', '3', '0');
INSERT INTO `t_city` VALUES ('2396', '2374', '梁平县', 'liangpingxian', '405200', '3', '0');
INSERT INTO `t_city` VALUES ('2397', '2374', '城口县', 'chengkouxian', '405900', '3', '0');
INSERT INTO `t_city` VALUES ('2398', '2374', '丰都县', 'fengduxian', '408200', '3', '0');
INSERT INTO `t_city` VALUES ('2399', '2374', '垫江县', 'dianjiangxian', '408300', '3', '0');
INSERT INTO `t_city` VALUES ('2400', '2374', '武隆县', 'wulongxian', '408500', '3', '0');
INSERT INTO `t_city` VALUES ('2401', '2374', '忠县', 'zhongxian', '404300', '3', '0');
INSERT INTO `t_city` VALUES ('2402', '2374', '开县', 'kaixian', '405400', '3', '0');
INSERT INTO `t_city` VALUES ('2403', '2374', '云阳县', 'yunyangxian', '404500', '3', '0');
INSERT INTO `t_city` VALUES ('2404', '2374', '奉节县', 'fengjiexian', '404600', '3', '0');
INSERT INTO `t_city` VALUES ('2405', '2374', '巫山县', 'wushanxian', '404700', '3', '0');
INSERT INTO `t_city` VALUES ('2406', '2374', '巫溪县', 'wuxixian', '405800', '3', '0');
INSERT INTO `t_city` VALUES ('2407', '2374', '石柱土家族自治县', 'shizhutujiazuzizhixian', '409100', '3', '0');
INSERT INTO `t_city` VALUES ('2408', '2374', '秀山土家族苗族自治县', 'xiushantujiazumiaozuzizhixian', '409900', '3', '0');
INSERT INTO `t_city` VALUES ('2409', '2374', '酉阳土家族苗族自治县', 'youyangtujiazumiaozuzizhixian', '409800', '3', '0');
INSERT INTO `t_city` VALUES ('2410', '2374', '彭水苗族土家族自治县', 'pengshuimiaozutujiazuzizhixian', '409600', '3', '0');
INSERT INTO `t_city` VALUES ('2411', '2374', '高新区', 'gaoxinqu', '400039', '3', '0');
INSERT INTO `t_city` VALUES ('2412', '2374', '江津区', 'jiangjinqu', '402260', '3', '0');
INSERT INTO `t_city` VALUES ('2413', '2374', '合川区', 'hechuanqu', '401520', '3', '0');
INSERT INTO `t_city` VALUES ('2414', '2374', '永川区', 'yongchuanqu', '402160', '3', '0');
INSERT INTO `t_city` VALUES ('2415', '2374', '南川区', 'nanchuanqu', '408400', '3', '0');
INSERT INTO `t_city` VALUES ('2416', '1', '四川', 'sichuan', '0', '1', '0');
INSERT INTO `t_city` VALUES ('2417', '2416', '成都市', 'chengdushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2418', '2417', '锦江区', 'jinjiangqu', '610021', '3', '0');
INSERT INTO `t_city` VALUES ('2419', '2417', '青羊区', 'qingyangqu', '610031', '3', '0');
INSERT INTO `t_city` VALUES ('2420', '2417', '金牛区', 'jinniuqu', '610036', '3', '0');
INSERT INTO `t_city` VALUES ('2421', '2417', '武侯区', 'wuhouqu', '610041', '3', '0');
INSERT INTO `t_city` VALUES ('2422', '2417', '成华区', 'chenghuaqu', '610066', '3', '0');
INSERT INTO `t_city` VALUES ('2423', '2417', '龙泉驿区', 'longquanqu', '610100', '3', '0');
INSERT INTO `t_city` VALUES ('2424', '2417', '青白江区', 'qingbaijiangqu', '610300', '3', '0');
INSERT INTO `t_city` VALUES ('2425', '2417', '新都区', 'xinduqu', '610500', '3', '0');
INSERT INTO `t_city` VALUES ('2426', '2417', '温江区', 'wenjiangqu', '611130', '3', '0');
INSERT INTO `t_city` VALUES ('2427', '2417', '金堂县', 'jintangxian', '610400', '3', '0');
INSERT INTO `t_city` VALUES ('2428', '2417', '双流县', 'shuangliuxian', '610200', '3', '0');
INSERT INTO `t_city` VALUES ('2429', '2417', '郫县', 'xian', '611700', '3', '0');
INSERT INTO `t_city` VALUES ('2430', '2417', '大邑县', 'dayixian', '611300', '3', '0');
INSERT INTO `t_city` VALUES ('2431', '2417', '蒲江县', 'pujiangxian', '611630', '3', '0');
INSERT INTO `t_city` VALUES ('2432', '2417', '新津县', 'xinjinxian', '611430', '3', '0');
INSERT INTO `t_city` VALUES ('2433', '2417', '都江堰市', 'dujiangyanshi', '611830', '3', '0');
INSERT INTO `t_city` VALUES ('2434', '2417', '彭州市', 'pengzhoushi', '611930', '3', '0');
INSERT INTO `t_city` VALUES ('2435', '2417', '邛崃市', 'shi', '611530', '3', '0');
INSERT INTO `t_city` VALUES ('2436', '2417', '崇州市', 'chongzhoushi', '611230', '3', '0');
INSERT INTO `t_city` VALUES ('2437', '2417', '高新区', 'gaoxinqu', '610041', '3', '0');
INSERT INTO `t_city` VALUES ('2438', '2417', '高新西区', 'gaoxinxiqu', '611731', '3', '0');
INSERT INTO `t_city` VALUES ('2439', '2416', '自贡市', 'zigongshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2440', '2439', '自流井区', 'ziliujingqu', '643000', '3', '0');
INSERT INTO `t_city` VALUES ('2441', '2439', '贡井区', 'gongjingqu', '643020', '3', '0');
INSERT INTO `t_city` VALUES ('2442', '2439', '大安区', 'daanqu', '643010', '3', '0');
INSERT INTO `t_city` VALUES ('2443', '2439', '沿滩区', 'yantanqu', '643030', '3', '0');
INSERT INTO `t_city` VALUES ('2444', '2439', '荣县', 'rongxian', '643100', '3', '0');
INSERT INTO `t_city` VALUES ('2445', '2439', '富顺县', 'fushunxian', '643200', '3', '0');
INSERT INTO `t_city` VALUES ('2446', '2416', '攀枝花市', 'panzhihuashi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2447', '2446', '东区', 'dongqu', '617067', '3', '0');
INSERT INTO `t_city` VALUES ('2448', '2446', '西区', 'xiqu', '617068', '3', '0');
INSERT INTO `t_city` VALUES ('2449', '2446', '仁和区', 'renhequ', '617061', '3', '0');
INSERT INTO `t_city` VALUES ('2450', '2446', '米易县', 'miyixian', '617200', '3', '0');
INSERT INTO `t_city` VALUES ('2451', '2446', '盐边县', 'yanbianxian', '617100', '3', '0');
INSERT INTO `t_city` VALUES ('2452', '2416', '泸州市', 'zhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2453', '2452', '江阳区', 'jiangyangqu', '646000', '3', '0');
INSERT INTO `t_city` VALUES ('2454', '2452', '纳溪区', 'naxiqu', '646300', '3', '0');
INSERT INTO `t_city` VALUES ('2455', '2452', '龙马潭区', 'longmatanqu', '646000', '3', '0');
INSERT INTO `t_city` VALUES ('2456', '2452', '泸县', 'xian', '646106', '3', '0');
INSERT INTO `t_city` VALUES ('2457', '2452', '合江县', 'hejiangxian', '646200', '3', '0');
INSERT INTO `t_city` VALUES ('2458', '2452', '叙永县', 'xuyongxian', '646400', '3', '0');
INSERT INTO `t_city` VALUES ('2459', '2452', '古蔺县', 'guxian', '646500', '3', '0');
INSERT INTO `t_city` VALUES ('2460', '2416', '德阳市', 'deyangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2461', '2460', '旌阳区', 'yangqu', '618000', '3', '0');
INSERT INTO `t_city` VALUES ('2462', '2460', '中江县', 'zhongjiangxian', '618100', '3', '0');
INSERT INTO `t_city` VALUES ('2463', '2460', '罗江县', 'luojiangxian', '618500', '3', '0');
INSERT INTO `t_city` VALUES ('2464', '2460', '广汉市', 'guanghanshi', '618300', '3', '0');
INSERT INTO `t_city` VALUES ('2465', '2460', '什邡市', 'shishi', '618400', '3', '0');
INSERT INTO `t_city` VALUES ('2466', '2460', '绵竹市', 'mianzhushi', '618200', '3', '0');
INSERT INTO `t_city` VALUES ('2467', '2416', '绵阳市', 'mianyangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2468', '2467', '涪城区', 'fuchengqu', '621000', '3', '0');
INSERT INTO `t_city` VALUES ('2469', '2467', '游仙区', 'youxianqu', '621022', '3', '0');
INSERT INTO `t_city` VALUES ('2470', '2467', '三台县', 'santaixian', '621100', '3', '0');
INSERT INTO `t_city` VALUES ('2471', '2467', '盐亭县', 'yantingxian', '621600', '3', '0');
INSERT INTO `t_city` VALUES ('2472', '2467', '安县', 'anxian', '622650', '3', '0');
INSERT INTO `t_city` VALUES ('2473', '2467', '梓潼县', 'xian', '622150', '3', '0');
INSERT INTO `t_city` VALUES ('2474', '2467', '北川羌族自治县', 'beichuanqiangzuzizhixian', '622750', '3', '0');
INSERT INTO `t_city` VALUES ('2475', '2467', '平武县', 'pingwuxian', '622550', '3', '0');
INSERT INTO `t_city` VALUES ('2476', '2467', '江油市', 'jiangyoushi', '621700', '3', '0');
INSERT INTO `t_city` VALUES ('2477', '2467', '农科区', 'nongkequ', '621023', '3', '0');
INSERT INTO `t_city` VALUES ('2478', '2467', '经济技术开发区', 'jingjijishukaifaqu', '621000', '3', '0');
INSERT INTO `t_city` VALUES ('2479', '2467', '高新区', 'gaoxinqu', '621000', '3', '0');
INSERT INTO `t_city` VALUES ('2480', '2467', '仙海区', 'xianhaiqu', '621007', '3', '0');
INSERT INTO `t_city` VALUES ('2481', '2416', '广元市', 'guangyuanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2482', '2481', '利州区', 'lizhouqu', '628017', '3', '0');
INSERT INTO `t_city` VALUES ('2483', '2481', '元坝区', 'yuanbaqu', '628017', '3', '0');
INSERT INTO `t_city` VALUES ('2484', '2481', '朝天区', 'chaotianqu', '628017', '3', '0');
INSERT INTO `t_city` VALUES ('2485', '2481', '旺苍县', 'wangcangxian', '628200', '3', '0');
INSERT INTO `t_city` VALUES ('2486', '2481', '青川县', 'qingchuanxian', '628100', '3', '0');
INSERT INTO `t_city` VALUES ('2487', '2481', '剑阁县', 'jiangexian', '628300', '3', '0');
INSERT INTO `t_city` VALUES ('2488', '2481', '苍溪县', 'cangxixian', '628400', '3', '0');
INSERT INTO `t_city` VALUES ('2489', '2416', '遂宁市', 'suiningshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2490', '2489', '船山区', 'chuanshanqu', '629000', '3', '0');
INSERT INTO `t_city` VALUES ('2491', '2489', '安居区', 'anjuqu', '629000', '3', '0');
INSERT INTO `t_city` VALUES ('2492', '2489', '蓬溪县', 'pengxixian', '629100', '3', '0');
INSERT INTO `t_city` VALUES ('2493', '2489', '射洪县', 'shehongxian', '629200', '3', '0');
INSERT INTO `t_city` VALUES ('2494', '2489', '大英县', 'dayingxian', '629300', '3', '0');
INSERT INTO `t_city` VALUES ('2495', '2416', '内江市', 'neijiangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2496', '2495', '市中区', 'shizhongqu', '641000', '3', '0');
INSERT INTO `t_city` VALUES ('2497', '2495', '东兴区', 'dongxingqu', '641100', '3', '0');
INSERT INTO `t_city` VALUES ('2498', '2495', '威远县', 'weiyuanxian', '642450', '3', '0');
INSERT INTO `t_city` VALUES ('2499', '2495', '资中县', 'zizhongxian', '641200', '3', '0');
INSERT INTO `t_city` VALUES ('2500', '2495', '隆昌县', 'longchangxian', '642150', '3', '0');
INSERT INTO `t_city` VALUES ('2501', '2416', '乐山市', 'leshanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2502', '2501', '市中区', 'shizhongqu', '614000', '3', '0');
INSERT INTO `t_city` VALUES ('2503', '2501', '沙湾区', 'shawanqu', '614900', '3', '0');
INSERT INTO `t_city` VALUES ('2504', '2501', '五通桥区', 'wutongqiaoqu', '614800', '3', '0');
INSERT INTO `t_city` VALUES ('2505', '2501', '金口河区', 'jinkouhequ', '614700', '3', '0');
INSERT INTO `t_city` VALUES ('2506', '2501', '犍为县', 'weixian', '614400', '3', '0');
INSERT INTO `t_city` VALUES ('2507', '2501', '井研县', 'jingyanxian', '613100', '3', '0');
INSERT INTO `t_city` VALUES ('2508', '2501', '夹江县', 'jiajiangxian', '614100', '3', '0');
INSERT INTO `t_city` VALUES ('2509', '2501', '沐川县', 'chuanxian', '614500', '3', '0');
INSERT INTO `t_city` VALUES ('2510', '2501', '峨边彝族自治县', 'ebianyizuzizhixian', '614300', '3', '0');
INSERT INTO `t_city` VALUES ('2511', '2501', '马边彝族自治县', 'mabianyizuzizhixian', '614600', '3', '0');
INSERT INTO `t_city` VALUES ('2512', '2501', '峨眉山市', 'emeishanshi', '614200', '3', '0');
INSERT INTO `t_city` VALUES ('2513', '2416', '南充市', 'nanchongshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2514', '2513', '顺庆区', 'shunqingqu', '637000', '3', '0');
INSERT INTO `t_city` VALUES ('2515', '2513', '高坪区', 'gaopingqu', '637100', '3', '0');
INSERT INTO `t_city` VALUES ('2516', '2513', '嘉陵区', 'jialingqu', '637100', '3', '0');
INSERT INTO `t_city` VALUES ('2517', '2513', '南部县', 'nanbuxian', '637300', '3', '0');
INSERT INTO `t_city` VALUES ('2518', '2513', '营山县', 'yingshanxian', '637700', '3', '0');
INSERT INTO `t_city` VALUES ('2519', '2513', '蓬安县', 'penganxian', '637800', '3', '0');
INSERT INTO `t_city` VALUES ('2520', '2513', '仪陇县', 'yilongxian', '637600', '3', '0');
INSERT INTO `t_city` VALUES ('2521', '2513', '西充县', 'xichongxian', '637200', '3', '0');
INSERT INTO `t_city` VALUES ('2522', '2513', '阆中市', 'zhongshi', '637400', '3', '0');
INSERT INTO `t_city` VALUES ('2523', '2416', '眉山市', 'meishanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2524', '2523', '东坡区', 'dongpoqu', '620010', '3', '0');
INSERT INTO `t_city` VALUES ('2525', '2523', '仁寿县', 'renshouxian', '620500', '3', '0');
INSERT INTO `t_city` VALUES ('2526', '2523', '彭山县', 'pengshanxian', '620860', '3', '0');
INSERT INTO `t_city` VALUES ('2527', '2523', '洪雅县', 'hongyaxian', '620360', '3', '0');
INSERT INTO `t_city` VALUES ('2528', '2523', '丹棱县', 'danlengxian', '620200', '3', '0');
INSERT INTO `t_city` VALUES ('2529', '2523', '青神县', 'qingshenxian', '620460', '3', '0');
INSERT INTO `t_city` VALUES ('2530', '2416', '宜宾市', 'yibinshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2531', '2530', '翠屏区', 'cuipingqu', '644000', '3', '0');
INSERT INTO `t_city` VALUES ('2532', '2530', '宜宾县', 'yibinxian', '644600', '3', '0');
INSERT INTO `t_city` VALUES ('2533', '2530', '南溪县', 'nanxixian', '644100', '3', '0');
INSERT INTO `t_city` VALUES ('2534', '2530', '江安县', 'jianganxian', '644200', '3', '0');
INSERT INTO `t_city` VALUES ('2535', '2530', '长宁县', 'changningxian', '644300', '3', '0');
INSERT INTO `t_city` VALUES ('2536', '2530', '高县', 'gaoxian', '645150', '3', '0');
INSERT INTO `t_city` VALUES ('2537', '2530', '珙县', 'xian', '644500', '3', '0');
INSERT INTO `t_city` VALUES ('2538', '2530', '筠连县', 'lianxian', '645250', '3', '0');
INSERT INTO `t_city` VALUES ('2539', '2530', '兴文县', 'xingwenxian', '644400', '3', '0');
INSERT INTO `t_city` VALUES ('2540', '2530', '屏山县', 'pingshanxian', '645350', '3', '0');
INSERT INTO `t_city` VALUES ('2541', '2416', '广安市', 'guanganshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2542', '2541', '广安区', 'guanganqu', '638000', '3', '0');
INSERT INTO `t_city` VALUES ('2543', '2541', '岳池县', 'yuechixian', '638300', '3', '0');
INSERT INTO `t_city` VALUES ('2544', '2541', '武胜县', 'wushengxian', '638400', '3', '0');
INSERT INTO `t_city` VALUES ('2545', '2541', '邻水县', 'linshuixian', '638500', '3', '0');
INSERT INTO `t_city` VALUES ('2546', '2541', '华蓥市', 'huashi', '638600', '3', '0');
INSERT INTO `t_city` VALUES ('2547', '2416', '达州市', 'dazhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2548', '2547', '通川区', 'tongchuanqu', '635000', '3', '0');
INSERT INTO `t_city` VALUES ('2549', '2547', '达县', 'daxian', '635000', '3', '0');
INSERT INTO `t_city` VALUES ('2550', '2547', '宣汉县', 'xuanhanxian', '636150', '3', '0');
INSERT INTO `t_city` VALUES ('2551', '2547', '开江县', 'kaijiangxian', '636250', '3', '0');
INSERT INTO `t_city` VALUES ('2552', '2547', '大竹县', 'dazhuxian', '635100', '3', '0');
INSERT INTO `t_city` VALUES ('2553', '2547', '渠县', 'quxian', '635200', '3', '0');
INSERT INTO `t_city` VALUES ('2554', '2547', '万源市', 'wanyuanshi', '636350', '3', '0');
INSERT INTO `t_city` VALUES ('2555', '2416', '雅安市', 'yaanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2556', '2555', '雨城区', 'yuchengqu', '625000', '3', '0');
INSERT INTO `t_city` VALUES ('2557', '2555', '名山县', 'mingshanxian', '625100', '3', '0');
INSERT INTO `t_city` VALUES ('2558', '2555', '荥经县', 'jingxian', '625200', '3', '0');
INSERT INTO `t_city` VALUES ('2559', '2555', '汉源县', 'hanyuanxian', '625300', '3', '0');
INSERT INTO `t_city` VALUES ('2560', '2555', '石棉县', 'shimianxian', '625400', '3', '0');
INSERT INTO `t_city` VALUES ('2561', '2555', '天全县', 'tianquanxian', '625500', '3', '0');
INSERT INTO `t_city` VALUES ('2562', '2555', '芦山县', 'lushanxian', '625600', '3', '0');
INSERT INTO `t_city` VALUES ('2563', '2555', '宝兴县', 'baoxingxian', '625700', '3', '0');
INSERT INTO `t_city` VALUES ('2564', '2416', '巴中市', 'bazhongshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2565', '2564', '巴州区', 'bazhouqu', '636001', '3', '0');
INSERT INTO `t_city` VALUES ('2566', '2564', '通江县', 'tongjiangxian', '636700', '3', '0');
INSERT INTO `t_city` VALUES ('2567', '2564', '南江县', 'nanjiangxian', '636600', '3', '0');
INSERT INTO `t_city` VALUES ('2568', '2564', '平昌县', 'pingchangxian', '636400', '3', '0');
INSERT INTO `t_city` VALUES ('2569', '2416', '资阳市', 'ziyangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2570', '2569', '雁江区', 'yanjiangqu', '641300', '3', '0');
INSERT INTO `t_city` VALUES ('2571', '2569', '安岳县', 'anyuexian', '642350', '3', '0');
INSERT INTO `t_city` VALUES ('2572', '2569', '乐至县', 'lezhixian', '641500', '3', '0');
INSERT INTO `t_city` VALUES ('2573', '2569', '简阳市', 'jianyangshi', '641400', '3', '0');
INSERT INTO `t_city` VALUES ('2574', '2416', '阿坝藏族羌族自治州', 'abacangzuqiangzuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2575', '2574', '汶川县', 'chuanxian', '623000', '3', '0');
INSERT INTO `t_city` VALUES ('2576', '2574', '理县', 'lixian', '623100', '3', '0');
INSERT INTO `t_city` VALUES ('2577', '2574', '茂县', 'maoxian', '623200', '3', '0');
INSERT INTO `t_city` VALUES ('2578', '2574', '松潘县', 'songpanxian', '623300', '3', '0');
INSERT INTO `t_city` VALUES ('2579', '2574', '九寨沟县', 'jiuzhaigouxian', '623400', '3', '0');
INSERT INTO `t_city` VALUES ('2580', '2574', '金川县', 'jinchuanxian', '624100', '3', '0');
INSERT INTO `t_city` VALUES ('2581', '2574', '小金县', 'xiaojinxian', '624200', '3', '0');
INSERT INTO `t_city` VALUES ('2582', '2574', '黑水县', 'heishuixian', '623500', '3', '0');
INSERT INTO `t_city` VALUES ('2583', '2574', '马尔康县', 'maerkangxian', '624000', '3', '0');
INSERT INTO `t_city` VALUES ('2584', '2574', '壤塘县', 'rangtangxian', '624300', '3', '0');
INSERT INTO `t_city` VALUES ('2585', '2574', '阿坝县', 'abaxian', '624600', '3', '0');
INSERT INTO `t_city` VALUES ('2586', '2574', '若尔盖县', 'ruoergaixian', '624500', '3', '0');
INSERT INTO `t_city` VALUES ('2587', '2574', '红原县', 'hongyuanxian', '624400', '3', '0');
INSERT INTO `t_city` VALUES ('2588', '2416', '甘孜藏族自治州', 'ganzicangzuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2589', '2588', '康定县', 'kangdingxian', '626000', '3', '0');
INSERT INTO `t_city` VALUES ('2590', '2588', '泸定县', 'dingxian', '626100', '3', '0');
INSERT INTO `t_city` VALUES ('2591', '2588', '丹巴县', 'danbaxian', '626300', '3', '0');
INSERT INTO `t_city` VALUES ('2592', '2588', '九龙县', 'jiulongxian', '626200', '3', '0');
INSERT INTO `t_city` VALUES ('2593', '2588', '雅江县', 'yajiangxian', '627450', '3', '0');
INSERT INTO `t_city` VALUES ('2594', '2588', '道孚县', 'daoxian', '626400', '3', '0');
INSERT INTO `t_city` VALUES ('2595', '2588', '炉霍县', 'luhuoxian', '626500', '3', '0');
INSERT INTO `t_city` VALUES ('2596', '2588', '甘孜县', 'ganzixian', '626700', '3', '0');
INSERT INTO `t_city` VALUES ('2597', '2588', '新龙县', 'xinlongxian', '626800', '3', '0');
INSERT INTO `t_city` VALUES ('2598', '2588', '德格县', 'degexian', '627250', '3', '0');
INSERT INTO `t_city` VALUES ('2599', '2588', '白玉县', 'baiyuxian', '200000', '3', '0');
INSERT INTO `t_city` VALUES ('2600', '2588', '石渠县', 'shiquxian', '200000', '3', '0');
INSERT INTO `t_city` VALUES ('2601', '2588', '色达县', 'sedaxian', '201100', '3', '0');
INSERT INTO `t_city` VALUES ('2602', '2588', '理塘县', 'litangxian', '200000', '3', '0');
INSERT INTO `t_city` VALUES ('2603', '2588', '巴塘县', 'batangxian', '200120', '3', '0');
INSERT INTO `t_city` VALUES ('2604', '2588', '乡城县', 'xiangchengxian', '200000', '3', '0');
INSERT INTO `t_city` VALUES ('2605', '2588', '稻城县', 'daochengxian', '200000', '3', '0');
INSERT INTO `t_city` VALUES ('2606', '2588', '得荣县', 'derongxian', '200000', '3', '0');
INSERT INTO `t_city` VALUES ('2607', '2416', '凉山彝族自治州', 'liangshanyizuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2608', '2607', '西昌市', 'xichangshi', '200000', '3', '0');
INSERT INTO `t_city` VALUES ('2609', '2607', '木里藏族自治县', 'mulicangzuzizhixian', '200000', '3', '0');
INSERT INTO `t_city` VALUES ('2610', '2607', '盐源县', 'yanyuanxian', '200000', '3', '0');
INSERT INTO `t_city` VALUES ('2611', '2607', '德昌县', 'dechangxian', '201300', '3', '0');
INSERT INTO `t_city` VALUES ('2612', '2607', '会理县', 'huilixian', '201600', '3', '0');
INSERT INTO `t_city` VALUES ('2613', '2607', '会东县', 'huidongxian', '201800', '3', '0');
INSERT INTO `t_city` VALUES ('2614', '2607', '宁南县', 'ningnanxian', '201900', '3', '0');
INSERT INTO `t_city` VALUES ('2615', '2607', '普格县', 'pugexian', '201700', '3', '0');
INSERT INTO `t_city` VALUES ('2616', '2607', '布拖县', 'butuoxian', '201500', '3', '0');
INSERT INTO `t_city` VALUES ('2617', '2607', '金阳县', 'jinyangxian', '201400', '3', '0');
INSERT INTO `t_city` VALUES ('2618', '2607', '昭觉县', 'zhaojuexian', '202150', '3', '0');
INSERT INTO `t_city` VALUES ('2619', '2607', '喜德县', 'xidexian', '616750', '3', '0');
INSERT INTO `t_city` VALUES ('2620', '2607', '冕宁县', 'mianningxian', '615600', '3', '0');
INSERT INTO `t_city` VALUES ('2621', '2607', '越西县', 'yuexixian', '616650', '3', '0');
INSERT INTO `t_city` VALUES ('2622', '2607', '甘洛县', 'ganluoxian', '616850', '3', '0');
INSERT INTO `t_city` VALUES ('2623', '2607', '美姑县', 'meiguxian', '616450', '3', '0');
INSERT INTO `t_city` VALUES ('2624', '2607', '雷波县', 'leiboxian', '616550', '3', '0');
INSERT INTO `t_city` VALUES ('2625', '1', '贵州', 'guizhou', '0', '1', '0');
INSERT INTO `t_city` VALUES ('2626', '2625', '贵阳市', 'guiyangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2627', '2626', '南明区', 'nanmingqu', '550001', '3', '0');
INSERT INTO `t_city` VALUES ('2628', '2626', '云岩区', 'yunyanqu', '550001', '3', '0');
INSERT INTO `t_city` VALUES ('2629', '2626', '花溪区', 'huaxiqu', '550025', '3', '0');
INSERT INTO `t_city` VALUES ('2630', '2626', '乌当区', 'wudangqu', '550018', '3', '0');
INSERT INTO `t_city` VALUES ('2631', '2626', '白云区', 'baiyunqu', '550014', '3', '0');
INSERT INTO `t_city` VALUES ('2632', '2626', '小河区', 'xiaohequ', '550009', '3', '0');
INSERT INTO `t_city` VALUES ('2633', '2626', '开阳县', 'kaiyangxian', '550300', '3', '0');
INSERT INTO `t_city` VALUES ('2634', '2626', '息烽县', 'xifengxian', '551100', '3', '0');
INSERT INTO `t_city` VALUES ('2635', '2626', '修文县', 'xiuwenxian', '550200', '3', '0');
INSERT INTO `t_city` VALUES ('2636', '2626', '清镇市', 'qingzhenshi', '551400', '3', '0');
INSERT INTO `t_city` VALUES ('2637', '2626', '金阳新区', 'jinyangxinqu', '550081', '3', '0');
INSERT INTO `t_city` VALUES ('2638', '2625', '六盘水市', 'liupanshuishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2639', '2638', '钟山区', 'zhongshanqu', '553000', '3', '0');
INSERT INTO `t_city` VALUES ('2640', '2638', '六枝特区', 'liuzhitequ', '553400', '3', '0');
INSERT INTO `t_city` VALUES ('2641', '2638', '水城县', 'shuichengxian', '553000', '3', '0');
INSERT INTO `t_city` VALUES ('2642', '2638', '盘县', 'panxian', '561601', '3', '0');
INSERT INTO `t_city` VALUES ('2643', '2625', '遵义市', 'zunyishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2644', '2643', '红花岗区', 'honghuagangqu', '563000', '3', '0');
INSERT INTO `t_city` VALUES ('2645', '2643', '汇川区', 'huichuanqu', '563000', '3', '0');
INSERT INTO `t_city` VALUES ('2646', '2643', '遵义县', 'zunyixian', '563100', '3', '0');
INSERT INTO `t_city` VALUES ('2647', '2643', '桐梓县', 'tongxian', '563200', '3', '0');
INSERT INTO `t_city` VALUES ('2648', '2643', '绥阳县', 'suiyangxian', '563300', '3', '0');
INSERT INTO `t_city` VALUES ('2649', '2643', '正安县', 'zhenganxian', '563400', '3', '0');
INSERT INTO `t_city` VALUES ('2650', '2643', '道真仡佬族苗族自治县', 'daozhenlaozumiaozuzizhixian', '563500', '3', '0');
INSERT INTO `t_city` VALUES ('2651', '2643', '务川仡佬族苗族自治县', 'wuchuanlaozumiaozuzizhixian', '564300', '3', '0');
INSERT INTO `t_city` VALUES ('2652', '2643', '凤冈县', 'fenggangxian', '564200', '3', '0');
INSERT INTO `t_city` VALUES ('2653', '2643', '湄潭县', 'tanxian', '564100', '3', '0');
INSERT INTO `t_city` VALUES ('2654', '2643', '余庆县', 'yuqingxian', '564400', '3', '0');
INSERT INTO `t_city` VALUES ('2655', '2643', '习水县', 'xishuixian', '564600', '3', '0');
INSERT INTO `t_city` VALUES ('2656', '2643', '赤水市', 'chishuishi', '564700', '3', '0');
INSERT INTO `t_city` VALUES ('2657', '2643', '仁怀市', 'renhuaishi', '564500', '3', '0');
INSERT INTO `t_city` VALUES ('2658', '2625', '安顺市', 'anshunshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2659', '2658', '西秀区', 'xixiuqu', '561000', '3', '0');
INSERT INTO `t_city` VALUES ('2660', '2658', '平坝县', 'pingbaxian', '561100', '3', '0');
INSERT INTO `t_city` VALUES ('2661', '2658', '普定县', 'pudingxian', '562100', '3', '0');
INSERT INTO `t_city` VALUES ('2662', '2658', '镇宁布依族苗族自治县', 'zhenningbuyizumiaozuzizhixian', '561200', '3', '0');
INSERT INTO `t_city` VALUES ('2663', '2658', '关岭布依族苗族自治县', 'guanlingbuyizumiaozuzizhixian', '561300', '3', '0');
INSERT INTO `t_city` VALUES ('2664', '2658', '紫云苗族布依族自治县', 'ziyunmiaozubuyizuzizhixian', '550800', '3', '0');
INSERT INTO `t_city` VALUES ('2665', '2625', '铜仁地区', 'tongrendiqu', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2666', '2665', '铜仁市', 'tongrenshi', '554300', '3', '0');
INSERT INTO `t_city` VALUES ('2667', '2665', '江口县', 'jiangkouxian', '554400', '3', '0');
INSERT INTO `t_city` VALUES ('2668', '2665', '玉屏侗族自治县', 'yupingdongzuzizhixian', '554004', '3', '0');
INSERT INTO `t_city` VALUES ('2669', '2665', '石阡县', 'shixian', '555100', '3', '0');
INSERT INTO `t_city` VALUES ('2670', '2665', '思南县', 'sinanxian', '565100', '3', '0');
INSERT INTO `t_city` VALUES ('2671', '2665', '印江土家族苗族自治县', 'yinjiangtujiazumiaozuzizhixian', '555200', '3', '0');
INSERT INTO `t_city` VALUES ('2672', '2665', '德江县', 'dejiangxian', '565200', '3', '0');
INSERT INTO `t_city` VALUES ('2673', '2665', '沿河土家族自治县', 'yanhetujiazuzizhixian', '565300', '3', '0');
INSERT INTO `t_city` VALUES ('2674', '2665', '松桃苗族自治县', 'songtaomiaozuzizhixian', '554100', '3', '0');
INSERT INTO `t_city` VALUES ('2675', '2665', '万山特区', 'wanshantequ', '554200', '3', '0');
INSERT INTO `t_city` VALUES ('2676', '2625', '黔西南布依族苗族自治州', 'qianxinanbuyizumiaozuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2677', '2676', '兴义市', 'xingyishi', '562400', '3', '0');
INSERT INTO `t_city` VALUES ('2678', '2676', '兴仁县', 'xingrenxian', '562300', '3', '0');
INSERT INTO `t_city` VALUES ('2679', '2676', '普安县', 'puanxian', '561500', '3', '0');
INSERT INTO `t_city` VALUES ('2680', '2676', '晴隆县', 'qinglongxian', '561400', '3', '0');
INSERT INTO `t_city` VALUES ('2681', '2676', '贞丰县', 'zhenfengxian', '562200', '3', '0');
INSERT INTO `t_city` VALUES ('2682', '2676', '望谟县', 'wangxian', '552300', '3', '0');
INSERT INTO `t_city` VALUES ('2683', '2676', '册亨县', 'cehengxian', '552200', '3', '0');
INSERT INTO `t_city` VALUES ('2684', '2676', '安龙县', 'anlongxian', '552400', '3', '0');
INSERT INTO `t_city` VALUES ('2685', '2625', '毕节地区', 'bijiediqu', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2686', '2685', '毕节市', 'bijieshi', '551700', '3', '0');
INSERT INTO `t_city` VALUES ('2687', '2685', '大方县', 'dafangxian', '551600', '3', '0');
INSERT INTO `t_city` VALUES ('2688', '2685', '黔西县', 'qianxixian', '551500', '3', '0');
INSERT INTO `t_city` VALUES ('2689', '2685', '金沙县', 'jinshaxian', '551800', '3', '0');
INSERT INTO `t_city` VALUES ('2690', '2685', '织金县', 'zhijinxian', '552100', '3', '0');
INSERT INTO `t_city` VALUES ('2691', '2685', '纳雍县', 'nayongxian', '553300', '3', '0');
INSERT INTO `t_city` VALUES ('2692', '2685', '威宁彝族回族苗族自治县', 'weiningyizuhuizumiaozuzizhixian', '553100', '3', '0');
INSERT INTO `t_city` VALUES ('2693', '2685', '赫章县', 'hezhangxian', '553200', '3', '0');
INSERT INTO `t_city` VALUES ('2694', '2625', '黔东南苗族侗族自治州', 'qiandongnanmiaozudongzuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2695', '2694', '凯里市', 'kailishi', '556000', '3', '0');
INSERT INTO `t_city` VALUES ('2696', '2694', '黄平县', 'huangpingxian', '556100', '3', '0');
INSERT INTO `t_city` VALUES ('2697', '2694', '施秉县', 'shibingxian', '556200', '3', '0');
INSERT INTO `t_city` VALUES ('2698', '2694', '三穗县', 'sansuixian', '556500', '3', '0');
INSERT INTO `t_city` VALUES ('2699', '2694', '镇远县', 'zhenyuanxian', '557700', '3', '0');
INSERT INTO `t_city` VALUES ('2700', '2694', '岑巩县', 'gongxian', '557800', '3', '0');
INSERT INTO `t_city` VALUES ('2701', '2694', '天柱县', 'tianzhuxian', '556600', '3', '0');
INSERT INTO `t_city` VALUES ('2702', '2694', '锦屏县', 'jinpingxian', '556700', '3', '0');
INSERT INTO `t_city` VALUES ('2703', '2694', '剑河县', 'jianhexian', '556400', '3', '0');
INSERT INTO `t_city` VALUES ('2704', '2694', '台江县', 'taijiangxian', '556300', '3', '0');
INSERT INTO `t_city` VALUES ('2705', '2694', '黎平县', 'lipingxian', '557300', '3', '0');
INSERT INTO `t_city` VALUES ('2706', '2694', '榕江县', 'jiangxian', '557200', '3', '0');
INSERT INTO `t_city` VALUES ('2707', '2694', '从江县', 'congjiangxian', '557400', '3', '0');
INSERT INTO `t_city` VALUES ('2708', '2694', '雷山县', 'leishanxian', '557100', '3', '0');
INSERT INTO `t_city` VALUES ('2709', '2694', '麻江县', 'majiangxian', '557600', '3', '0');
INSERT INTO `t_city` VALUES ('2710', '2694', '丹寨县', 'danzhaixian', '557500', '3', '0');
INSERT INTO `t_city` VALUES ('2711', '2625', '黔南布依族苗族自治州', 'qiannanbuyizumiaozuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2712', '2711', '都匀市', 'duyunshi', '558000', '3', '0');
INSERT INTO `t_city` VALUES ('2713', '2711', '福泉市', 'fuquanshi', '550500', '3', '0');
INSERT INTO `t_city` VALUES ('2714', '2711', '荔波县', 'liboxian', '558400', '3', '0');
INSERT INTO `t_city` VALUES ('2715', '2711', '贵定县', 'guidingxian', '551300', '3', '0');
INSERT INTO `t_city` VALUES ('2716', '2711', '瓮安县', 'wenganxian', '550400', '3', '0');
INSERT INTO `t_city` VALUES ('2717', '2711', '独山县', 'dushanxian', '558200', '3', '0');
INSERT INTO `t_city` VALUES ('2718', '2711', '平塘县', 'pingtangxian', '558300', '3', '0');
INSERT INTO `t_city` VALUES ('2719', '2711', '罗甸县', 'luodianxian', '550100', '3', '0');
INSERT INTO `t_city` VALUES ('2720', '2711', '长顺县', 'changshunxian', '550700', '3', '0');
INSERT INTO `t_city` VALUES ('2721', '2711', '龙里县', 'longlixian', '551200', '3', '0');
INSERT INTO `t_city` VALUES ('2722', '2711', '惠水县', 'huishuixian', '550600', '3', '0');
INSERT INTO `t_city` VALUES ('2723', '2711', '三都水族自治县', 'sandushuizuzizhixian', '558100', '3', '0');
INSERT INTO `t_city` VALUES ('2724', '1', '云南', 'yunnan', '0', '1', '0');
INSERT INTO `t_city` VALUES ('2725', '2724', '昆明市', 'kunmingshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2726', '2725', '五华区', 'wuhuaqu', '650032', '3', '0');
INSERT INTO `t_city` VALUES ('2727', '2725', '盘龙区', 'panlongqu', '650051', '3', '0');
INSERT INTO `t_city` VALUES ('2728', '2725', '官渡区', 'guanduqu', '650220', '3', '0');
INSERT INTO `t_city` VALUES ('2729', '2725', '西山区', 'xishanqu', '650100', '3', '0');
INSERT INTO `t_city` VALUES ('2730', '2725', '东川区', 'dongchuanqu', '654100', '3', '0');
INSERT INTO `t_city` VALUES ('2731', '2725', '呈贡县', 'chenggongxian', '650500', '3', '0');
INSERT INTO `t_city` VALUES ('2732', '2725', '晋宁县', 'jinningxian', '650600', '3', '0');
INSERT INTO `t_city` VALUES ('2733', '2725', '富民县', 'fuminxian', '650400', '3', '0');
INSERT INTO `t_city` VALUES ('2734', '2725', '宜良县', 'yiliangxian', '652100', '3', '0');
INSERT INTO `t_city` VALUES ('2735', '2725', '石林彝族自治县', 'shilinyizuzizhixian', '652200', '3', '0');
INSERT INTO `t_city` VALUES ('2736', '2725', '嵩明县', 'mingxian', '651700', '3', '0');
INSERT INTO `t_city` VALUES ('2737', '2725', '禄劝彝族苗族自治县', 'luquanyizumiaozuzizhixian', '651500', '3', '0');
INSERT INTO `t_city` VALUES ('2738', '2725', '寻甸回族彝族自治县', 'xundianhuizuyizuzizhixian', '655200', '3', '0');
INSERT INTO `t_city` VALUES ('2739', '2725', '安宁市', 'anningshi', '650300', '3', '0');
INSERT INTO `t_city` VALUES ('2740', '2724', '曲靖市', 'qujingshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2741', '2740', '麒麟区', 'qu', '655000', '3', '0');
INSERT INTO `t_city` VALUES ('2742', '2740', '马龙县', 'malongxian', '655100', '3', '0');
INSERT INTO `t_city` VALUES ('2743', '2740', '陆良县', 'luliangxian', '655600', '3', '0');
INSERT INTO `t_city` VALUES ('2744', '2740', '师宗县', 'shizongxian', '655700', '3', '0');
INSERT INTO `t_city` VALUES ('2745', '2740', '罗平县', 'luopingxian', '655800', '3', '0');
INSERT INTO `t_city` VALUES ('2746', '2740', '富源县', 'fuyuanxian', '655500', '3', '0');
INSERT INTO `t_city` VALUES ('2747', '2740', '会泽县', 'huizexian', '654200', '3', '0');
INSERT INTO `t_city` VALUES ('2748', '2740', '沾益县', 'zhanyixian', '655331', '3', '0');
INSERT INTO `t_city` VALUES ('2749', '2740', '宣威市', 'xuanweishi', '655400', '3', '0');
INSERT INTO `t_city` VALUES ('2750', '2724', '玉溪市', 'yuxishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2751', '2750', '红塔区', 'hongtaqu', '653100', '3', '0');
INSERT INTO `t_city` VALUES ('2752', '2750', '江川县', 'jiangchuanxian', '652600', '3', '0');
INSERT INTO `t_city` VALUES ('2753', '2750', '澄江县', 'chengjiangxian', '652500', '3', '0');
INSERT INTO `t_city` VALUES ('2754', '2750', '通海县', 'tonghaixian', '652700', '3', '0');
INSERT INTO `t_city` VALUES ('2755', '2750', '华宁县', 'huaningxian', '652800', '3', '0');
INSERT INTO `t_city` VALUES ('2756', '2750', '易门县', 'yimenxian', '651100', '3', '0');
INSERT INTO `t_city` VALUES ('2757', '2750', '峨山彝族自治县', 'eshanyizuzizhixian', '653200', '3', '0');
INSERT INTO `t_city` VALUES ('2758', '2750', '新平彝族傣族自治县', 'xinpingyizudaizuzizhixian', '653400', '3', '0');
INSERT INTO `t_city` VALUES ('2759', '2750', '元江哈尼族彝族傣族自治县', 'yuanjianghanizuyizudaizuzizhixian', '653300', '3', '0');
INSERT INTO `t_city` VALUES ('2760', '2724', '保山市', 'baoshanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2761', '2760', '隆阳区', 'longyangqu', '678000', '3', '0');
INSERT INTO `t_city` VALUES ('2762', '2760', '施甸县', 'shidianxian', '678200', '3', '0');
INSERT INTO `t_city` VALUES ('2763', '2760', '腾冲县', 'tengchongxian', '679100', '3', '0');
INSERT INTO `t_city` VALUES ('2764', '2760', '龙陵县', 'longlingxian', '678300', '3', '0');
INSERT INTO `t_city` VALUES ('2765', '2760', '昌宁县', 'changningxian', '678100', '3', '0');
INSERT INTO `t_city` VALUES ('2766', '2724', '昭通市', 'zhaotongshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2767', '2766', '昭阳区', 'zhaoyangqu', '657000', '3', '0');
INSERT INTO `t_city` VALUES ('2768', '2766', '鲁甸县', 'ludianxian', '657100', '3', '0');
INSERT INTO `t_city` VALUES ('2769', '2766', '巧家县', 'qiaojiaxian', '654600', '3', '0');
INSERT INTO `t_city` VALUES ('2770', '2766', '盐津县', 'yanjinxian', '657500', '3', '0');
INSERT INTO `t_city` VALUES ('2771', '2766', '大关县', 'daguanxian', '657400', '3', '0');
INSERT INTO `t_city` VALUES ('2772', '2766', '永善县', 'yongshanxian', '657300', '3', '0');
INSERT INTO `t_city` VALUES ('2773', '2766', '绥江县', 'suijiangxian', '657700', '3', '0');
INSERT INTO `t_city` VALUES ('2774', '2766', '镇雄县', 'zhenxiongxian', '657200', '3', '0');
INSERT INTO `t_city` VALUES ('2775', '2766', '彝良县', 'yiliangxian', '657600', '3', '0');
INSERT INTO `t_city` VALUES ('2776', '2766', '威信县', 'weixinxian', '657900', '3', '0');
INSERT INTO `t_city` VALUES ('2777', '2766', '水富县', 'shuifuxian', '657800', '3', '0');
INSERT INTO `t_city` VALUES ('2778', '2724', '丽江市', 'lijiangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2779', '2778', '古城区', 'guchengqu', '674100', '3', '0');
INSERT INTO `t_city` VALUES ('2780', '2778', '玉龙纳西族自治县', 'yulongnaxizuzizhixian', '674100', '3', '0');
INSERT INTO `t_city` VALUES ('2781', '2778', '永胜县', 'yongshengxian', '674200', '3', '0');
INSERT INTO `t_city` VALUES ('2782', '2778', '华坪县', 'huapingxian', '674800', '3', '0');
INSERT INTO `t_city` VALUES ('2783', '2778', '宁蒗彝族自治县', 'ningyizuzizhixian', '674300', '3', '0');
INSERT INTO `t_city` VALUES ('2784', '2724', '普洱市', 'puershi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2785', '2784', '思茅区', 'simaoqu', '665000', '3', '0');
INSERT INTO `t_city` VALUES ('2786', '2784', '宁洱哈尼族彝族自治县', 'ningerhanizuyizuzizhixian', '665100', '3', '0');
INSERT INTO `t_city` VALUES ('2787', '2784', '墨江哈尼族自治县', 'mojianghanizuzizhixian', '654800', '3', '0');
INSERT INTO `t_city` VALUES ('2788', '2784', '景东彝族自治县', 'jingdongyizuzizhixian', '676200', '3', '0');
INSERT INTO `t_city` VALUES ('2789', '2784', '景谷傣族彝族自治县', 'jinggudaizuyizuzizhixian', '666400', '3', '0');
INSERT INTO `t_city` VALUES ('2790', '2784', '镇沅彝族哈尼族拉祜族自治县', 'zhenyizuhanizulazuzizhixian', '666500', '3', '0');
INSERT INTO `t_city` VALUES ('2791', '2784', '江城哈尼族彝族自治县', 'jiangchenghanizuyizuzizhixian', '665900', '3', '0');
INSERT INTO `t_city` VALUES ('2792', '2784', '孟连傣族拉祜族佤族自治县', 'mengliandaizulazuzuzizhixian', '665800', '3', '0');
INSERT INTO `t_city` VALUES ('2793', '2784', '澜沧拉祜族自治县', 'lancanglazuzizhixian', '665600', '3', '0');
INSERT INTO `t_city` VALUES ('2794', '2784', '西盟佤族自治县', 'ximengzuzizhixian', '665700', '3', '0');
INSERT INTO `t_city` VALUES ('2795', '2724', '临沧市', 'lincangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2796', '2795', '临翔区', 'linxiangqu', '677000', '3', '0');
INSERT INTO `t_city` VALUES ('2797', '2795', '凤庆县', 'fengqingxian', '675900', '3', '0');
INSERT INTO `t_city` VALUES ('2798', '2795', '云县', 'yunxian', '675800', '3', '0');
INSERT INTO `t_city` VALUES ('2799', '2795', '永德县', 'yongdexian', '677600', '3', '0');
INSERT INTO `t_city` VALUES ('2800', '2795', '镇康县', 'zhenkangxian', '677704', '3', '0');
INSERT INTO `t_city` VALUES ('2801', '2795', '双江拉祜族佤族布朗族傣族自治县', 'shuangjianglazuzubulangzudaizuzizhixian', '677300', '3', '0');
INSERT INTO `t_city` VALUES ('2802', '2795', '耿马傣族佤族自治县', 'gengmadaizuzuzizhixian', '677500', '3', '0');
INSERT INTO `t_city` VALUES ('2803', '2795', '沧源佤族自治县', 'cangyuanzuzizhixian', '677400', '3', '0');
INSERT INTO `t_city` VALUES ('2804', '2724', '楚雄彝族自治州', 'chuxiongyizuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2805', '2804', '楚雄市', 'chuxiongshi', '675000', '3', '0');
INSERT INTO `t_city` VALUES ('2806', '2804', '双柏县', 'shuangbaixian', '675100', '3', '0');
INSERT INTO `t_city` VALUES ('2807', '2804', '牟定县', 'moudingxian', '675500', '3', '0');
INSERT INTO `t_city` VALUES ('2808', '2804', '南华县', 'nanhuaxian', '675200', '3', '0');
INSERT INTO `t_city` VALUES ('2809', '2804', '姚安县', 'yaoanxian', '675300', '3', '0');
INSERT INTO `t_city` VALUES ('2810', '2804', '大姚县', 'dayaoxian', '675400', '3', '0');
INSERT INTO `t_city` VALUES ('2811', '2804', '永仁县', 'yongrenxian', '651400', '3', '0');
INSERT INTO `t_city` VALUES ('2812', '2804', '元谋县', 'yuanmouxian', '651300', '3', '0');
INSERT INTO `t_city` VALUES ('2813', '2804', '武定县', 'wudingxian', '651600', '3', '0');
INSERT INTO `t_city` VALUES ('2814', '2804', '禄丰县', 'lufengxian', '651200', '3', '0');
INSERT INTO `t_city` VALUES ('2815', '2724', '红河哈尼族彝族自治州', 'honghehanizuyizuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2816', '2815', '个旧市', 'gejiushi', '661000', '3', '0');
INSERT INTO `t_city` VALUES ('2817', '2815', '开远市', 'kaiyuanshi', '661600', '3', '0');
INSERT INTO `t_city` VALUES ('2818', '2815', '蒙自县', 'mengzixian', '661100', '3', '0');
INSERT INTO `t_city` VALUES ('2819', '2815', '屏边苗族自治县', 'pingbianmiaozuzizhixian', '661200', '3', '0');
INSERT INTO `t_city` VALUES ('2820', '2815', '建水县', 'jianshuixian', '654300', '3', '0');
INSERT INTO `t_city` VALUES ('2821', '2815', '石屏县', 'shipingxian', '662200', '3', '0');
INSERT INTO `t_city` VALUES ('2822', '2815', '弥勒县', 'milexian', '652300', '3', '0');
INSERT INTO `t_city` VALUES ('2823', '2815', '泸西县', 'xixian', '652400', '3', '0');
INSERT INTO `t_city` VALUES ('2824', '2815', '元阳县', 'yuanyangxian', '662400', '3', '0');
INSERT INTO `t_city` VALUES ('2825', '2815', '红河县', 'honghexian', '654400', '3', '0');
INSERT INTO `t_city` VALUES ('2826', '2815', '金平苗族瑶族傣族自治县', 'jinpingmiaozuyaozudaizuzizhixian', '661500', '3', '0');
INSERT INTO `t_city` VALUES ('2827', '2815', '绿春县', 'lvchunxian', '662500', '3', '0');
INSERT INTO `t_city` VALUES ('2828', '2815', '河口瑶族自治县', 'hekouyaozuzizhixian', '661300', '3', '0');
INSERT INTO `t_city` VALUES ('2829', '2724', '文山壮族苗族自治州', 'wenshanzhuangzumiaozuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2830', '2829', '文山县', 'wenshanxian', '663000', '3', '0');
INSERT INTO `t_city` VALUES ('2831', '2829', '砚山县', 'yanshanxian', '663100', '3', '0');
INSERT INTO `t_city` VALUES ('2832', '2829', '西畴县', 'xichouxian', '663500', '3', '0');
INSERT INTO `t_city` VALUES ('2833', '2829', '麻栗坡县', 'malipoxian', '663600', '3', '0');
INSERT INTO `t_city` VALUES ('2834', '2829', '马关县', 'maguanxian', '663700', '3', '0');
INSERT INTO `t_city` VALUES ('2835', '2829', '丘北县', 'qiubeixian', '663200', '3', '0');
INSERT INTO `t_city` VALUES ('2836', '2829', '广南县', 'guangnanxian', '663300', '3', '0');
INSERT INTO `t_city` VALUES ('2837', '2829', '富宁县', 'funingxian', '663400', '3', '0');
INSERT INTO `t_city` VALUES ('2838', '2724', '西双版纳傣族自治州', 'xishuangbannadaizuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2839', '2838', '景洪市', 'jinghongshi', '666100', '3', '0');
INSERT INTO `t_city` VALUES ('2840', '2838', '勐海县', 'haixian', '666200', '3', '0');
INSERT INTO `t_city` VALUES ('2841', '2838', '勐腊县', 'laxian', '666300', '3', '0');
INSERT INTO `t_city` VALUES ('2842', '2724', '大理白族自治州', 'dalibaizuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2843', '2842', '大理市', 'dalishi', '671000', '3', '0');
INSERT INTO `t_city` VALUES ('2844', '2842', '漾濞彝族自治县', 'yangyizuzizhixian', '672500', '3', '0');
INSERT INTO `t_city` VALUES ('2845', '2842', '祥云县', 'xiangyunxian', '672100', '3', '0');
INSERT INTO `t_city` VALUES ('2846', '2842', '宾川县', 'binchuanxian', '671600', '3', '0');
INSERT INTO `t_city` VALUES ('2847', '2842', '弥渡县', 'miduxian', '675600', '3', '0');
INSERT INTO `t_city` VALUES ('2848', '2842', '南涧彝族自治县', 'nanjianyizuzizhixian', '675700', '3', '0');
INSERT INTO `t_city` VALUES ('2849', '2842', '巍山彝族回族自治县', 'weishanyizuhuizuzizhixian', '672400', '3', '0');
INSERT INTO `t_city` VALUES ('2850', '2842', '永平县', 'yongpingxian', '672600', '3', '0');
INSERT INTO `t_city` VALUES ('2851', '2842', '云龙县', 'yunlongxian', '672700', '3', '0');
INSERT INTO `t_city` VALUES ('2852', '2842', '洱源县', 'eryuanxian', '671200', '3', '0');
INSERT INTO `t_city` VALUES ('2853', '2842', '剑川县', 'jianchuanxian', '671300', '3', '0');
INSERT INTO `t_city` VALUES ('2854', '2842', '鹤庆县', 'heqingxian', '671500', '3', '0');
INSERT INTO `t_city` VALUES ('2855', '2724', '德宏傣族景颇族自治州', 'dehongdaizujingpozuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2856', '2855', '瑞丽市', 'ruilishi', '678600', '3', '0');
INSERT INTO `t_city` VALUES ('2857', '2855', '潞西市', 'luxishi', '678400', '3', '0');
INSERT INTO `t_city` VALUES ('2858', '2855', '梁河县', 'lianghexian', '679200', '3', '0');
INSERT INTO `t_city` VALUES ('2859', '2855', '盈江县', 'yingjiangxian', '679300', '3', '0');
INSERT INTO `t_city` VALUES ('2860', '2855', '陇川县', 'longchuanxian', '678700', '3', '0');
INSERT INTO `t_city` VALUES ('2861', '2724', '怒江傈僳族自治州', 'nujianglisuzuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2862', '2861', '泸水县', 'shuixian', '673100', '3', '0');
INSERT INTO `t_city` VALUES ('2863', '2861', '福贡县', 'fugongxian', '673400', '3', '0');
INSERT INTO `t_city` VALUES ('2864', '2861', '贡山独龙族怒族自治县', 'gongshandulongzunuzuzizhixian', '673500', '3', '0');
INSERT INTO `t_city` VALUES ('2865', '2861', '兰坪白族普米族自治县', 'lanpingbaizupumizuzizhixian', '671400', '3', '0');
INSERT INTO `t_city` VALUES ('2866', '2724', '迪庆藏族自治州', 'diqingcangzuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2867', '2866', '香格里拉县', 'xianggelilaxian', '674400', '3', '0');
INSERT INTO `t_city` VALUES ('2868', '2866', '德钦县', 'deqinxian', '674500', '3', '0');
INSERT INTO `t_city` VALUES ('2869', '2866', '维西傈僳族自治县', 'weixilisuzuzizhixian', '674600', '3', '0');
INSERT INTO `t_city` VALUES ('2870', '1', '西藏', 'xicang', '0', '1', '0');
INSERT INTO `t_city` VALUES ('2871', '2870', '拉萨市', 'lasashi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2872', '2871', '城关区', 'chengguanqu', '850000', '3', '0');
INSERT INTO `t_city` VALUES ('2873', '2871', '林周县', 'linzhouxian', '852000', '3', '0');
INSERT INTO `t_city` VALUES ('2874', '2871', '当雄县', 'dangxiongxian', '851500', '3', '0');
INSERT INTO `t_city` VALUES ('2875', '2871', '尼木县', 'nimuxian', '851300', '3', '0');
INSERT INTO `t_city` VALUES ('2876', '2871', '曲水县', 'qushuixian', '850600', '3', '0');
INSERT INTO `t_city` VALUES ('2877', '2871', '堆龙德庆县', 'duilongdeqingxian', '851400', '3', '0');
INSERT INTO `t_city` VALUES ('2878', '2871', '达孜县', 'dazixian', '850100', '3', '0');
INSERT INTO `t_city` VALUES ('2879', '2871', '墨竹工卡县', 'mozhugongkaxian', '850200', '3', '0');
INSERT INTO `t_city` VALUES ('2880', '2870', '昌都地区', 'changdudiqu', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2881', '2880', '昌都县', 'changduxian', '854000', '3', '0');
INSERT INTO `t_city` VALUES ('2882', '2880', '江达县', 'jiangdaxian', '854100', '3', '0');
INSERT INTO `t_city` VALUES ('2883', '2880', '贡觉县', 'gongjuexian', '854200', '3', '0');
INSERT INTO `t_city` VALUES ('2884', '2880', '类乌齐县', 'leiwuqixian', '855600', '3', '0');
INSERT INTO `t_city` VALUES ('2885', '2880', '丁青县', 'dingqingxian', '855700', '3', '0');
INSERT INTO `t_city` VALUES ('2886', '2880', '察雅县', 'chayaxian', '854300', '3', '0');
INSERT INTO `t_city` VALUES ('2887', '2880', '八宿县', 'basuxian', '854600', '3', '0');
INSERT INTO `t_city` VALUES ('2888', '2880', '左贡县', 'zuogongxian', '854400', '3', '0');
INSERT INTO `t_city` VALUES ('2889', '2880', '芒康县', 'mangkangxian', '854500', '3', '0');
INSERT INTO `t_city` VALUES ('2890', '2880', '洛隆县', 'luolongxian', '855400', '3', '0');
INSERT INTO `t_city` VALUES ('2891', '2880', '边坝县', 'bianbaxian', '855500', '3', '0');
INSERT INTO `t_city` VALUES ('2892', '2870', '山南地区', 'shannandiqu', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2893', '2892', '乃东县', 'naidongxian', '856100', '3', '0');
INSERT INTO `t_city` VALUES ('2894', '2892', '扎囊县', 'zhanangxian', '850800', '3', '0');
INSERT INTO `t_city` VALUES ('2895', '2892', '贡嘎县', 'gonggaxian', '850700', '3', '0');
INSERT INTO `t_city` VALUES ('2896', '2892', '桑日县', 'sangrixian', '856200', '3', '0');
INSERT INTO `t_city` VALUES ('2897', '2892', '琼结县', 'qiongjiexian', '856800', '3', '0');
INSERT INTO `t_city` VALUES ('2898', '2892', '曲松县', 'qusongxian', '856300', '3', '0');
INSERT INTO `t_city` VALUES ('2899', '2892', '措美县', 'cuomeixian', '856900', '3', '0');
INSERT INTO `t_city` VALUES ('2900', '2892', '洛扎县', 'luozhaxian', '851200', '3', '0');
INSERT INTO `t_city` VALUES ('2901', '2892', '加查县', 'jiachaxian', '856400', '3', '0');
INSERT INTO `t_city` VALUES ('2902', '2892', '隆子县', 'longzixian', '856600', '3', '0');
INSERT INTO `t_city` VALUES ('2903', '2892', '错那县', 'cuonaxian', '856700', '3', '0');
INSERT INTO `t_city` VALUES ('2904', '2892', '浪卡子县', 'langkazixian', '851000', '3', '0');
INSERT INTO `t_city` VALUES ('2905', '2870', '日喀则地区', 'rikazediqu', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2906', '2905', '日喀则市', 'rikazeshi', '857000', '3', '0');
INSERT INTO `t_city` VALUES ('2907', '2905', '南木林县', 'nanmulinxian', '857100', '3', '0');
INSERT INTO `t_city` VALUES ('2908', '2905', '江孜县', 'jiangzixian', '857400', '3', '0');
INSERT INTO `t_city` VALUES ('2909', '2905', '定日县', 'dingrixian', '858200', '3', '0');
INSERT INTO `t_city` VALUES ('2910', '2905', '萨迦县', 'saxian', '857800', '3', '0');
INSERT INTO `t_city` VALUES ('2911', '2905', '拉孜县', 'lazixian', '858100', '3', '0');
INSERT INTO `t_city` VALUES ('2912', '2905', '昂仁县', 'angrenxian', '858500', '3', '0');
INSERT INTO `t_city` VALUES ('2913', '2905', '谢通门县', 'xietongmenxian', '858900', '3', '0');
INSERT INTO `t_city` VALUES ('2914', '2905', '白朗县', 'bailangxian', '857300', '3', '0');
INSERT INTO `t_city` VALUES ('2915', '2905', '仁布县', 'renbuxian', '857200', '3', '0');
INSERT INTO `t_city` VALUES ('2916', '2905', '康马县', 'kangmaxian', '857500', '3', '0');
INSERT INTO `t_city` VALUES ('2917', '2905', '定结县', 'dingjiexian', '857900', '3', '0');
INSERT INTO `t_city` VALUES ('2918', '2905', '仲巴县', 'zhongbaxian', '858800', '3', '0');
INSERT INTO `t_city` VALUES ('2919', '2905', '亚东县', 'yadongxian', '857600', '3', '0');
INSERT INTO `t_city` VALUES ('2920', '2905', '吉隆县', 'jilongxian', '858700', '3', '0');
INSERT INTO `t_city` VALUES ('2921', '2905', '聂拉木县', 'nielamuxian', '858300', '3', '0');
INSERT INTO `t_city` VALUES ('2922', '2905', '萨嘎县', 'sagaxian', '857800', '3', '0');
INSERT INTO `t_city` VALUES ('2923', '2905', '岗巴县', 'gangbaxian', '857700', '3', '0');
INSERT INTO `t_city` VALUES ('2924', '2870', '那曲地区', 'naqudiqu', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2925', '2924', '那曲县', 'naquxian', '852000', '3', '0');
INSERT INTO `t_city` VALUES ('2926', '2924', '嘉黎县', 'jialixian', '852400', '3', '0');
INSERT INTO `t_city` VALUES ('2927', '2924', '比如县', 'biruxian', '852300', '3', '0');
INSERT INTO `t_city` VALUES ('2928', '2924', '聂荣县', 'nierongxian', '853500', '3', '0');
INSERT INTO `t_city` VALUES ('2929', '2924', '安多县', 'anduoxian', '852600', '3', '0');
INSERT INTO `t_city` VALUES ('2930', '2924', '申扎县', 'shenzhaxian', '853100', '3', '0');
INSERT INTO `t_city` VALUES ('2931', '2924', '索县', 'suoxian', '852200', '3', '0');
INSERT INTO `t_city` VALUES ('2932', '2924', '班戈县', 'bangexian', '852500', '3', '0');
INSERT INTO `t_city` VALUES ('2933', '2924', '巴青县', 'baqingxian', '852100', '3', '0');
INSERT INTO `t_city` VALUES ('2934', '2924', '尼玛县', 'nimaxian', '853200', '3', '0');
INSERT INTO `t_city` VALUES ('2935', '2870', '阿里地区', 'alidiqu', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2936', '2935', '普兰县', 'pulanxian', '859500', '3', '0');
INSERT INTO `t_city` VALUES ('2937', '2935', '札达县', 'zhadaxian', '859600', '3', '0');
INSERT INTO `t_city` VALUES ('2938', '2935', '噶尔县', 'gaerxian', '859400', '3', '0');
INSERT INTO `t_city` VALUES ('2939', '2935', '日土县', 'rituxian', '859700', '3', '0');
INSERT INTO `t_city` VALUES ('2940', '2935', '革吉县', 'gejixian', '859100', '3', '0');
INSERT INTO `t_city` VALUES ('2941', '2935', '改则县', 'gaizexian', '859200', '3', '0');
INSERT INTO `t_city` VALUES ('2942', '2935', '措勤县', 'cuoqinxian', '859300', '3', '0');
INSERT INTO `t_city` VALUES ('2943', '2870', '林芝地区', 'linzhidiqu', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2944', '2943', '林芝县', 'linzhixian', '850400', '3', '0');
INSERT INTO `t_city` VALUES ('2945', '2943', '工布江达县', 'gongbujiangdaxian', '850300', '3', '0');
INSERT INTO `t_city` VALUES ('2946', '2943', '米林县', 'milinxian', '860500', '3', '0');
INSERT INTO `t_city` VALUES ('2947', '2943', '墨脱县', 'motuoxian', '855300', '3', '0');
INSERT INTO `t_city` VALUES ('2948', '2943', '波密县', 'bomixian', '855200', '3', '0');
INSERT INTO `t_city` VALUES ('2949', '2943', '察隅县', 'chayuxian', '855100', '3', '0');
INSERT INTO `t_city` VALUES ('2950', '2943', '朗县', 'langxian', '856500', '3', '0');
INSERT INTO `t_city` VALUES ('2951', '1', '陕西', 'shanxi', '0', '1', '0');
INSERT INTO `t_city` VALUES ('2952', '2951', '西安市', 'xianshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2953', '2952', '新城区', 'xinchengqu', '710004', '3', '0');
INSERT INTO `t_city` VALUES ('2954', '2952', '碑林区', 'beilinqu', '710001', '3', '0');
INSERT INTO `t_city` VALUES ('2955', '2952', '莲湖区', 'lianhuqu', '710003', '3', '0');
INSERT INTO `t_city` VALUES ('2956', '2952', '灞桥区', 'qiaoqu', '710038', '3', '0');
INSERT INTO `t_city` VALUES ('2957', '2952', '未央区', 'weiyangqu', '710014', '3', '0');
INSERT INTO `t_city` VALUES ('2958', '2952', '雁塔区', 'yantaqu', '710061', '3', '0');
INSERT INTO `t_city` VALUES ('2959', '2952', '阎良区', 'yanliangqu', '710087', '3', '0');
INSERT INTO `t_city` VALUES ('2960', '2952', '临潼区', 'linqu', '710600', '3', '0');
INSERT INTO `t_city` VALUES ('2961', '2952', '长安区', 'changanqu', '710100', '3', '0');
INSERT INTO `t_city` VALUES ('2962', '2952', '蓝田县', 'lantianxian', '710500', '3', '0');
INSERT INTO `t_city` VALUES ('2963', '2952', '周至县', 'zhouzhixian', '710400', '3', '0');
INSERT INTO `t_city` VALUES ('2964', '2952', '户县', 'huxian', '710300', '3', '0');
INSERT INTO `t_city` VALUES ('2965', '2952', '高陵县', 'gaolingxian', '710200', '3', '0');
INSERT INTO `t_city` VALUES ('2966', '2952', '高新区', 'gaoxinqu', '710075', '3', '0');
INSERT INTO `t_city` VALUES ('2967', '2951', '铜川市', 'tongchuanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2968', '2967', '王益区', 'wangyiqu', '727000', '3', '0');
INSERT INTO `t_city` VALUES ('2969', '2967', '印台区', 'yintaiqu', '727007', '3', '0');
INSERT INTO `t_city` VALUES ('2970', '2967', '耀州区', 'yaozhouqu', '727100', '3', '0');
INSERT INTO `t_city` VALUES ('2971', '2967', '宜君县', 'yijunxian', '727200', '3', '0');
INSERT INTO `t_city` VALUES ('2972', '2967', '新区', 'xinqu', '727100', '3', '0');
INSERT INTO `t_city` VALUES ('2973', '2951', '宝鸡市', 'baojishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2974', '2973', '渭滨区', 'weibinqu', '721000', '3', '0');
INSERT INTO `t_city` VALUES ('2975', '2973', '金台区', 'jintaiqu', '721000', '3', '0');
INSERT INTO `t_city` VALUES ('2976', '2973', '陈仓区', 'chencangqu', '721300', '3', '0');
INSERT INTO `t_city` VALUES ('2977', '2973', '凤翔县', 'fengxiangxian', '721400', '3', '0');
INSERT INTO `t_city` VALUES ('2978', '2973', '岐山县', 'shanxian', '722400', '3', '0');
INSERT INTO `t_city` VALUES ('2979', '2973', '扶风县', 'fufengxian', '722200', '3', '0');
INSERT INTO `t_city` VALUES ('2980', '2973', '眉县', 'meixian', '722300', '3', '0');
INSERT INTO `t_city` VALUES ('2981', '2973', '陇县', 'longxian', '721200', '3', '0');
INSERT INTO `t_city` VALUES ('2982', '2973', '千阳县', 'qianyangxian', '721100', '3', '0');
INSERT INTO `t_city` VALUES ('2983', '2973', '麟游县', 'youxian', '721500', '3', '0');
INSERT INTO `t_city` VALUES ('2984', '2973', '凤县', 'fengxian', '721700', '3', '0');
INSERT INTO `t_city` VALUES ('2985', '2973', '太白县', 'taibaixian', '721600', '3', '0');
INSERT INTO `t_city` VALUES ('2986', '2951', '咸阳市', 'xianyangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('2987', '2986', '秦都区', 'qinduqu', '712000', '3', '0');
INSERT INTO `t_city` VALUES ('2988', '2986', '渭城区', 'weichengqu', '712000', '3', '0');
INSERT INTO `t_city` VALUES ('2989', '2986', '杨陵区', 'yanglingqu', '712100', '3', '0');
INSERT INTO `t_city` VALUES ('2990', '2986', '三原县', 'sanyuanxian', '713800', '3', '0');
INSERT INTO `t_city` VALUES ('2991', '2986', '泾阳县', 'yangxian', '713700', '3', '0');
INSERT INTO `t_city` VALUES ('2992', '2986', '兴平市', 'xingpingshi', '713100', '3', '0');
INSERT INTO `t_city` VALUES ('2993', '2986', '乾县', 'qianxian', '713300', '3', '0');
INSERT INTO `t_city` VALUES ('2994', '2986', '礼泉县', 'liquanxian', '713200', '3', '0');
INSERT INTO `t_city` VALUES ('2995', '2986', '永寿县', 'yongshouxian', '713400', '3', '0');
INSERT INTO `t_city` VALUES ('2996', '2986', '彬县', 'binxian', '713500', '3', '0');
INSERT INTO `t_city` VALUES ('2997', '2986', '长武县', 'changwuxian', '713600', '3', '0');
INSERT INTO `t_city` VALUES ('2998', '2986', '旬邑县', 'xunyixian', '711300', '3', '0');
INSERT INTO `t_city` VALUES ('2999', '2986', '淳化县', 'chunhuaxian', '711200', '3', '0');
INSERT INTO `t_city` VALUES ('3000', '2986', '武功县', 'wugongxian', '712200', '3', '0');
INSERT INTO `t_city` VALUES ('3001', '2951', '渭南市', 'weinanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3002', '3001', '临渭区', 'linweiqu', '714000', '3', '0');
INSERT INTO `t_city` VALUES ('3003', '3001', '华县', 'huaxian', '714100', '3', '0');
INSERT INTO `t_city` VALUES ('3004', '3001', '潼关县', 'guanxian', '714300', '3', '0');
INSERT INTO `t_city` VALUES ('3005', '3001', '大荔县', 'dalixian', '715100', '3', '0');
INSERT INTO `t_city` VALUES ('3006', '3001', '合阳县', 'heyangxian', '715300', '3', '0');
INSERT INTO `t_city` VALUES ('3007', '3001', '澄城县', 'chengchengxian', '715200', '3', '0');
INSERT INTO `t_city` VALUES ('3008', '3001', '蒲城县', 'puchengxian', '715500', '3', '0');
INSERT INTO `t_city` VALUES ('3009', '3001', '白水县', 'baishuixian', '715600', '3', '0');
INSERT INTO `t_city` VALUES ('3010', '3001', '富平县', 'fupingxian', '711700', '3', '0');
INSERT INTO `t_city` VALUES ('3011', '3001', '韩城市', 'hanchengshi', '715400', '3', '0');
INSERT INTO `t_city` VALUES ('3012', '3001', '华阴市', 'huayinshi', '714200', '3', '0');
INSERT INTO `t_city` VALUES ('3013', '2951', '延安市', 'yananshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3014', '3013', '宝塔区', 'baotaqu', '716000', '3', '0');
INSERT INTO `t_city` VALUES ('3015', '3013', '延长县', 'yanchangxian', '717100', '3', '0');
INSERT INTO `t_city` VALUES ('3016', '3013', '延川县', 'yanchuanxian', '717200', '3', '0');
INSERT INTO `t_city` VALUES ('3017', '3013', '子长县', 'zichangxian', '717300', '3', '0');
INSERT INTO `t_city` VALUES ('3018', '3013', '安塞县', 'ansaixian', '717400', '3', '0');
INSERT INTO `t_city` VALUES ('3019', '3013', '志丹县', 'zhidanxian', '717500', '3', '0');
INSERT INTO `t_city` VALUES ('3020', '3013', '吴旗县', 'wuqixian', '717600', '3', '0');
INSERT INTO `t_city` VALUES ('3021', '3013', '甘泉县', 'ganquanxian', '716100', '3', '0');
INSERT INTO `t_city` VALUES ('3022', '3013', '富县', 'fuxian', '727500', '3', '0');
INSERT INTO `t_city` VALUES ('3023', '3013', '洛川县', 'luochuanxian', '727400', '3', '0');
INSERT INTO `t_city` VALUES ('3024', '3013', '宜川县', 'yichuanxian', '716200', '3', '0');
INSERT INTO `t_city` VALUES ('3025', '3013', '黄龙县', 'huanglongxian', '715700', '3', '0');
INSERT INTO `t_city` VALUES ('3026', '3013', '黄陵县', 'huanglingxian', '727300', '3', '0');
INSERT INTO `t_city` VALUES ('3027', '2951', '汉中市', 'hanzhongshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3028', '3027', '汉台区', 'hantaiqu', '723000', '3', '0');
INSERT INTO `t_city` VALUES ('3029', '3027', '南郑县', 'nanzhengxian', '723100', '3', '0');
INSERT INTO `t_city` VALUES ('3030', '3027', '城固县', 'chengguxian', '723200', '3', '0');
INSERT INTO `t_city` VALUES ('3031', '3027', '洋县', 'yangxian', '723300', '3', '0');
INSERT INTO `t_city` VALUES ('3032', '3027', '西乡县', 'xixiangxian', '723500', '3', '0');
INSERT INTO `t_city` VALUES ('3033', '3027', '勉县', 'mianxian', '724200', '3', '0');
INSERT INTO `t_city` VALUES ('3034', '3027', '宁强县', 'ningqiangxian', '724400', '3', '0');
INSERT INTO `t_city` VALUES ('3035', '3027', '略阳县', 'lueyangxian', '724300', '3', '0');
INSERT INTO `t_city` VALUES ('3036', '3027', '镇巴县', 'zhenbaxian', '723600', '3', '0');
INSERT INTO `t_city` VALUES ('3037', '3027', '留坝县', 'liubaxian', '724100', '3', '0');
INSERT INTO `t_city` VALUES ('3038', '3027', '佛坪县', 'fopingxian', '723400', '3', '0');
INSERT INTO `t_city` VALUES ('3039', '3027', '经济开发区', 'jingjikaifaqu', '723000', '3', '0');
INSERT INTO `t_city` VALUES ('3040', '2951', '榆林市', 'yulinshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3041', '3040', '榆阳区', 'yuyangqu', '719000', '3', '0');
INSERT INTO `t_city` VALUES ('3042', '3040', '神木县', 'shenmuxian', '719300', '3', '0');
INSERT INTO `t_city` VALUES ('3043', '3040', '府谷县', 'fuguxian', '719400', '3', '0');
INSERT INTO `t_city` VALUES ('3044', '3040', '横山县', 'hengshanxian', '719100', '3', '0');
INSERT INTO `t_city` VALUES ('3045', '3040', '靖边县', 'jingbianxian', '718500', '3', '0');
INSERT INTO `t_city` VALUES ('3046', '3040', '定边县', 'dingbianxian', '718600', '3', '0');
INSERT INTO `t_city` VALUES ('3047', '3040', '绥德县', 'suidexian', '718000', '3', '0');
INSERT INTO `t_city` VALUES ('3048', '3040', '米脂县', 'mizhixian', '718100', '3', '0');
INSERT INTO `t_city` VALUES ('3049', '3040', '佳县', 'jiaxian', '719200', '3', '0');
INSERT INTO `t_city` VALUES ('3050', '3040', '吴堡县', 'wubaoxian', '718200', '3', '0');
INSERT INTO `t_city` VALUES ('3051', '3040', '清涧县', 'qingjianxian', '718300', '3', '0');
INSERT INTO `t_city` VALUES ('3052', '3040', '子洲县', 'zizhouxian', '718400', '3', '0');
INSERT INTO `t_city` VALUES ('3053', '2951', '安康市', 'ankangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3054', '3053', '汉滨区', 'hanbinqu', '725000', '3', '0');
INSERT INTO `t_city` VALUES ('3055', '3053', '汉阴县', 'hanyinxian', '725100', '3', '0');
INSERT INTO `t_city` VALUES ('3056', '3053', '石泉县', 'shiquanxian', '725200', '3', '0');
INSERT INTO `t_city` VALUES ('3057', '3053', '宁陕县', 'ningshanxian', '711600', '3', '0');
INSERT INTO `t_city` VALUES ('3058', '3053', '紫阳县', 'ziyangxian', '725300', '3', '0');
INSERT INTO `t_city` VALUES ('3059', '3053', '岚皋县', 'gaoxian', '725400', '3', '0');
INSERT INTO `t_city` VALUES ('3060', '3053', '平利县', 'pinglixian', '725500', '3', '0');
INSERT INTO `t_city` VALUES ('3061', '3053', '镇坪县', 'zhenpingxian', '725600', '3', '0');
INSERT INTO `t_city` VALUES ('3062', '3053', '旬阳县', 'xunyangxian', '725700', '3', '0');
INSERT INTO `t_city` VALUES ('3063', '3053', '白河县', 'baihexian', '725800', '3', '0');
INSERT INTO `t_city` VALUES ('3064', '2951', '商洛市', 'shangluoshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3065', '3064', '商州区', 'shangzhouqu', '726000', '3', '0');
INSERT INTO `t_city` VALUES ('3066', '3064', '洛南县', 'luonanxian', '726100', '3', '0');
INSERT INTO `t_city` VALUES ('3067', '3064', '丹凤县', 'danfengxian', '726200', '3', '0');
INSERT INTO `t_city` VALUES ('3068', '3064', '商南县', 'shangnanxian', '726300', '3', '0');
INSERT INTO `t_city` VALUES ('3069', '3064', '山阳县', 'shanyangxian', '726400', '3', '0');
INSERT INTO `t_city` VALUES ('3070', '3064', '镇安县', 'zhenanxian', '711500', '3', '0');
INSERT INTO `t_city` VALUES ('3071', '3064', '柞水县', 'zuoshuixian', '674100', '3', '0');
INSERT INTO `t_city` VALUES ('3072', '1', '甘肃', 'gansu', '0', '1', '0');
INSERT INTO `t_city` VALUES ('3073', '3072', '兰州市', 'lanzhoushi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3074', '3073', '城关区', 'chengguanqu', '674100', '3', '0');
INSERT INTO `t_city` VALUES ('3075', '3073', '七里河区', 'qilihequ', '674100', '3', '0');
INSERT INTO `t_city` VALUES ('3076', '3073', '西固区', 'xiguqu', '674100', '3', '0');
INSERT INTO `t_city` VALUES ('3077', '3073', '安宁区', 'anningqu', '674100', '3', '0');
INSERT INTO `t_city` VALUES ('3078', '3073', '红古区', 'hongguqu', '678000', '3', '0');
INSERT INTO `t_city` VALUES ('3079', '3073', '永登县', 'yongdengxian', '678000', '3', '0');
INSERT INTO `t_city` VALUES ('3080', '3073', '皋兰县', 'gaolanxian', '678000', '3', '0');
INSERT INTO `t_city` VALUES ('3081', '3073', '榆中县', 'yuzhongxian', '678000', '3', '0');
INSERT INTO `t_city` VALUES ('3082', '3072', '嘉峪关市', 'jiayuguanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3083', '3082', '嘉峪关市', 'jiayuguanshi', '678000', '3', '0');
INSERT INTO `t_city` VALUES ('3084', '3072', '金昌市', 'jinchangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3085', '3084', '金川区', 'jinchuanqu', '737103', '3', '0');
INSERT INTO `t_city` VALUES ('3086', '3084', '永昌县', 'yongchangxian', '737200', '3', '0');
INSERT INTO `t_city` VALUES ('3087', '3072', '白银市', 'baiyinshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3088', '3087', '白银区', 'baiyinqu', '730900', '3', '0');
INSERT INTO `t_city` VALUES ('3089', '3087', '平川区', 'pingchuanqu', '730913', '3', '0');
INSERT INTO `t_city` VALUES ('3090', '3087', '靖远县', 'jingyuanxian', '730600', '3', '0');
INSERT INTO `t_city` VALUES ('3091', '3087', '会宁县', 'huiningxian', '730700', '3', '0');
INSERT INTO `t_city` VALUES ('3092', '3087', '景泰县', 'jingtaixian', '730400', '3', '0');
INSERT INTO `t_city` VALUES ('3093', '3072', '天水市', 'tianshuishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3094', '3093', '秦州区', 'qinzhouqu', '741000', '3', '0');
INSERT INTO `t_city` VALUES ('3095', '3093', '麦积区', 'maijiqu', '741020', '3', '0');
INSERT INTO `t_city` VALUES ('3096', '3093', '清水县', 'qingshuixian', '741400', '3', '0');
INSERT INTO `t_city` VALUES ('3097', '3093', '秦安县', 'qinanxian', '671000', '3', '0');
INSERT INTO `t_city` VALUES ('3098', '3093', '甘谷县', 'ganguxian', '671000', '3', '0');
INSERT INTO `t_city` VALUES ('3099', '3093', '武山县', 'wushanxian', '671000', '3', '0');
INSERT INTO `t_city` VALUES ('3100', '3093', '张家川回族自治县', 'zhangjiachuanhuizuzizhixian', '671000', '3', '0');
INSERT INTO `t_city` VALUES ('3101', '3072', '武威市', 'wuweishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3102', '3101', '凉州区', 'liangzhouqu', '671000', '3', '0');
INSERT INTO `t_city` VALUES ('3103', '3101', '民勤县', 'minqinxian', '671000', '3', '0');
INSERT INTO `t_city` VALUES ('3104', '3101', '古浪县', 'gulangxian', '671000', '3', '0');
INSERT INTO `t_city` VALUES ('3105', '3101', '天祝藏族自治县', 'tianzhucangzuzizhixian', '671000', '3', '0');
INSERT INTO `t_city` VALUES ('3106', '3072', '张掖市', 'zhangyeshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3107', '3106', '甘州区', 'ganzhouqu', '671000', '3', '0');
INSERT INTO `t_city` VALUES ('3108', '3106', '肃南裕固族自治县', 'sunanyuguzuzizhixian', '671000', '3', '0');
INSERT INTO `t_city` VALUES ('3109', '3106', '民乐县', 'minlexian', '671000', '3', '0');
INSERT INTO `t_city` VALUES ('3110', '3106', '临泽县', 'linzexian', '671000', '3', '0');
INSERT INTO `t_city` VALUES ('3111', '3106', '高台县', 'gaotaixian', '734300', '3', '0');
INSERT INTO `t_city` VALUES ('3112', '3106', '山丹县', 'shandanxian', '734100', '3', '0');
INSERT INTO `t_city` VALUES ('3113', '3072', '平凉市', 'pingliangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3114', '3113', '崆峒区', 'qu', '678400', '3', '0');
INSERT INTO `t_city` VALUES ('3115', '3113', '泾川县', 'chuanxian', '744300', '3', '0');
INSERT INTO `t_city` VALUES ('3116', '3113', '灵台县', 'lingtaixian', '744400', '3', '0');
INSERT INTO `t_city` VALUES ('3117', '3113', '崇信县', 'chongxinxian', '744200', '3', '0');
INSERT INTO `t_city` VALUES ('3118', '3113', '华亭县', 'huatingxian', '744100', '3', '0');
INSERT INTO `t_city` VALUES ('3119', '3113', '庄浪县', 'zhuanglangxian', '744600', '3', '0');
INSERT INTO `t_city` VALUES ('3120', '3113', '静宁县', 'jingningxian', '743400', '3', '0');
INSERT INTO `t_city` VALUES ('3121', '3072', '酒泉市', 'jiuquanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3122', '3121', '肃州区', 'suzhouqu', '735000', '3', '0');
INSERT INTO `t_city` VALUES ('3123', '3121', '金塔县', 'jintaxian', '735300', '3', '0');
INSERT INTO `t_city` VALUES ('3124', '3121', '安西县', 'anxixian', '736100', '3', '0');
INSERT INTO `t_city` VALUES ('3125', '3121', '肃北蒙古族自治县', 'subeimengguzuzizhixian', '736300', '3', '0');
INSERT INTO `t_city` VALUES ('3126', '3121', '阿克塞哈萨克族自治县', 'akesaihasakezuzizhixian', '736400', '3', '0');
INSERT INTO `t_city` VALUES ('3127', '3121', '玉门市', 'yumenshi', '735200', '3', '0');
INSERT INTO `t_city` VALUES ('3128', '3121', '敦煌市', 'dunhuangshi', '736200', '3', '0');
INSERT INTO `t_city` VALUES ('3129', '3072', '庆阳市', 'qingyangshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3130', '3129', '西峰区', 'xifengqu', '745000', '3', '0');
INSERT INTO `t_city` VALUES ('3131', '3129', '庆城县', 'qingchengxian', '745100', '3', '0');
INSERT INTO `t_city` VALUES ('3132', '3129', '环县', 'huanxian', '745700', '3', '0');
INSERT INTO `t_city` VALUES ('3133', '3129', '华池县', 'huachixian', '745600', '3', '0');
INSERT INTO `t_city` VALUES ('3134', '3129', '合水县', 'heshuixian', '745400', '3', '0');
INSERT INTO `t_city` VALUES ('3135', '3129', '正宁县', 'zhengningxian', '677000', '3', '0');
INSERT INTO `t_city` VALUES ('3136', '3129', '宁县', 'ningxian', '677000', '3', '0');
INSERT INTO `t_city` VALUES ('3137', '3129', '镇原县', 'zhenyuanxian', '677000', '3', '0');
INSERT INTO `t_city` VALUES ('3138', '3072', '定西市', 'dingxishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3139', '3138', '安定区', 'andingqu', '677000', '3', '0');
INSERT INTO `t_city` VALUES ('3140', '3138', '通渭县', 'tongweixian', '677000', '3', '0');
INSERT INTO `t_city` VALUES ('3141', '3138', '陇西县', 'longxixian', '677000', '3', '0');
INSERT INTO `t_city` VALUES ('3142', '3138', '渭源县', 'weiyuanxian', '677000', '3', '0');
INSERT INTO `t_city` VALUES ('3143', '3138', '临洮县', 'linxian', '677000', '3', '0');
INSERT INTO `t_city` VALUES ('3144', '3138', '漳县', 'zhangxian', '748300', '3', '0');
INSERT INTO `t_city` VALUES ('3145', '3138', '岷县', 'xian', '748400', '3', '0');
INSERT INTO `t_city` VALUES ('3146', '3072', '陇南市', 'longnanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3147', '3146', '武都区', 'wuduqu', '746000', '3', '0');
INSERT INTO `t_city` VALUES ('3148', '3146', '成县', 'chengxian', '742500', '3', '0');
INSERT INTO `t_city` VALUES ('3149', '3146', '文县', 'wenxian', '746400', '3', '0');
INSERT INTO `t_city` VALUES ('3150', '3146', '宕昌县', 'changxian', '748500', '3', '0');
INSERT INTO `t_city` VALUES ('3151', '3146', '康县', 'kangxian', '746500', '3', '0');
INSERT INTO `t_city` VALUES ('3152', '3146', '西和县', 'xihexian', '742100', '3', '0');
INSERT INTO `t_city` VALUES ('3153', '3146', '礼县', 'lixian', '742200', '3', '0');
INSERT INTO `t_city` VALUES ('3154', '3146', '徽县', 'huixian', '742300', '3', '0');
INSERT INTO `t_city` VALUES ('3155', '3146', '两当县', 'liangdangxian', '742400', '3', '0');
INSERT INTO `t_city` VALUES ('3156', '3072', '临夏回族自治州', 'linxiahuizuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3157', '3156', '临夏市', 'linxiashi', '731100', '3', '0');
INSERT INTO `t_city` VALUES ('3158', '3156', '临夏县', 'linxiaxian', '731800', '3', '0');
INSERT INTO `t_city` VALUES ('3159', '3156', '康乐县', 'kanglexian', '731500', '3', '0');
INSERT INTO `t_city` VALUES ('3160', '3156', '永靖县', 'yongjingxian', '731600', '3', '0');
INSERT INTO `t_city` VALUES ('3161', '3156', '广河县', 'guanghexian', '731300', '3', '0');
INSERT INTO `t_city` VALUES ('3162', '3156', '和政县', 'hezhengxian', '731200', '3', '0');
INSERT INTO `t_city` VALUES ('3163', '3156', '东乡族自治县', 'dongxiangzuzizhixian', '731400', '3', '0');
INSERT INTO `t_city` VALUES ('3164', '3156', '积石山保安族东乡族撒拉族自治县', 'jishishanbaoanzudongxiangzusalazuzizhixian', '731700', '3', '0');
INSERT INTO `t_city` VALUES ('3165', '3072', '甘南藏族自治州', 'gannancangzuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3166', '3165', '合作市', 'hezuoshi', '747000', '3', '0');
INSERT INTO `t_city` VALUES ('3167', '3165', '临潭县', 'lintanxian', '747500', '3', '0');
INSERT INTO `t_city` VALUES ('3168', '3165', '卓尼县', 'zhuonixian', '747600', '3', '0');
INSERT INTO `t_city` VALUES ('3169', '3165', '舟曲县', 'zhouquxian', '746300', '3', '0');
INSERT INTO `t_city` VALUES ('3170', '3165', '迭部县', 'diebuxian', '747400', '3', '0');
INSERT INTO `t_city` VALUES ('3171', '3165', '玛曲县', 'maquxian', '747300', '3', '0');
INSERT INTO `t_city` VALUES ('3172', '3165', '碌曲县', 'luquxian', '747200', '3', '0');
INSERT INTO `t_city` VALUES ('3173', '3165', '夏河县', 'xiahexian', '747100', '3', '0');
INSERT INTO `t_city` VALUES ('3174', '1', '青海', 'qinghai', '0', '1', '0');
INSERT INTO `t_city` VALUES ('3175', '3174', '西宁市', 'xiningshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3176', '3175', '城东区', 'chengdongqu', '810000', '3', '0');
INSERT INTO `t_city` VALUES ('3177', '3175', '城中区', 'chengzhongqu', '810000', '3', '0');
INSERT INTO `t_city` VALUES ('3178', '3175', '城西区', 'chengxiqu', '810000', '3', '0');
INSERT INTO `t_city` VALUES ('3179', '3175', '城北区', 'chengbeiqu', '810000', '3', '0');
INSERT INTO `t_city` VALUES ('3180', '3175', '大通回族土族自治县', 'datonghuizutuzuzizhixian', '810100', '3', '0');
INSERT INTO `t_city` VALUES ('3181', '3175', '湟中县', 'zhongxian', '811600', '3', '0');
INSERT INTO `t_city` VALUES ('3182', '3175', '湟源县', 'yuanxian', '812100', '3', '0');
INSERT INTO `t_city` VALUES ('3183', '3174', '海东地区', 'haidongdiqu', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3184', '3183', '平安县', 'pinganxian', '810600', '3', '0');
INSERT INTO `t_city` VALUES ('3185', '3183', '民和回族土族自治县', 'minhehuizutuzuzizhixian', '810800', '3', '0');
INSERT INTO `t_city` VALUES ('3186', '3183', '乐都县', 'leduxian', '810700', '3', '0');
INSERT INTO `t_city` VALUES ('3187', '3183', '互助土族自治县', 'huzhutuzuzizhixian', '810500', '3', '0');
INSERT INTO `t_city` VALUES ('3188', '3183', '化隆回族自治县', 'hualonghuizuzizhixian', '810900', '3', '0');
INSERT INTO `t_city` VALUES ('3189', '3183', '循化撒拉族自治县', 'xunhuasalazuzizhixian', '811100', '3', '0');
INSERT INTO `t_city` VALUES ('3190', '3174', '海北藏族自治州', 'haibeicangzuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3191', '3190', '门源回族自治县', 'menyuanhuizuzizhixian', '810300', '3', '0');
INSERT INTO `t_city` VALUES ('3192', '3190', '祁连县', 'qilianxian', '810400', '3', '0');
INSERT INTO `t_city` VALUES ('3193', '3190', '海晏县', 'haixian', '812200', '3', '0');
INSERT INTO `t_city` VALUES ('3194', '3190', '刚察县', 'gangchaxian', '812300', '3', '0');
INSERT INTO `t_city` VALUES ('3195', '3174', '黄南藏族自治州', 'huangnancangzuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3196', '3195', '同仁县', 'tongrenxian', '811300', '3', '0');
INSERT INTO `t_city` VALUES ('3197', '3195', '尖扎县', 'jianzhaxian', '811200', '3', '0');
INSERT INTO `t_city` VALUES ('3198', '3195', '泽库县', 'zekuxian', '811400', '3', '0');
INSERT INTO `t_city` VALUES ('3199', '3195', '河南蒙古族自治县', 'henanmengguzuzizhixian', '811500', '3', '0');
INSERT INTO `t_city` VALUES ('3200', '3174', '海南藏族自治州', 'hainancangzuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3201', '3200', '共和县', 'gonghexian', '813000', '3', '0');
INSERT INTO `t_city` VALUES ('3202', '3200', '同德县', 'tongdexian', '813200', '3', '0');
INSERT INTO `t_city` VALUES ('3203', '3200', '贵德县', 'guidexian', '811700', '3', '0');
INSERT INTO `t_city` VALUES ('3204', '3200', '兴海县', 'xinghaixian', '813300', '3', '0');
INSERT INTO `t_city` VALUES ('3205', '3200', '贵南县', 'guinanxian', '813100', '3', '0');
INSERT INTO `t_city` VALUES ('3206', '3174', '果洛藏族自治州', 'guoluocangzuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3207', '3206', '玛沁县', 'maqinxian', '814000', '3', '0');
INSERT INTO `t_city` VALUES ('3208', '3206', '班玛县', 'banmaxian', '814300', '3', '0');
INSERT INTO `t_city` VALUES ('3209', '3206', '甘德县', 'gandexian', '814100', '3', '0');
INSERT INTO `t_city` VALUES ('3210', '3206', '达日县', 'darixian', '814200', '3', '0');
INSERT INTO `t_city` VALUES ('3211', '3206', '久治县', 'jiuzhixian', '624700', '3', '0');
INSERT INTO `t_city` VALUES ('3212', '3206', '玛多县', 'maduoxian', '813500', '3', '0');
INSERT INTO `t_city` VALUES ('3213', '3174', '玉树藏族自治州', 'yushucangzuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3214', '3213', '玉树县', 'yushuxian', '815000', '3', '0');
INSERT INTO `t_city` VALUES ('3215', '3213', '杂多县', 'zaduoxian', '815300', '3', '0');
INSERT INTO `t_city` VALUES ('3216', '3213', '称多县', 'chengduoxian', '815100', '3', '0');
INSERT INTO `t_city` VALUES ('3217', '3213', '治多县', 'zhiduoxian', '815400', '3', '0');
INSERT INTO `t_city` VALUES ('3218', '3213', '囊谦县', 'nangqianxian', '815200', '3', '0');
INSERT INTO `t_city` VALUES ('3219', '3213', '曲麻莱县', 'qumalaixian', '815500', '3', '0');
INSERT INTO `t_city` VALUES ('3220', '3174', '海西蒙古族藏族自治州', 'haiximengguzucangzuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3221', '3220', '格尔木市', 'geermushi', '816000', '3', '0');
INSERT INTO `t_city` VALUES ('3222', '3220', '德令哈市', 'delinghashi', '817000', '3', '0');
INSERT INTO `t_city` VALUES ('3223', '3220', '乌兰县', 'wulanxian', '817100', '3', '0');
INSERT INTO `t_city` VALUES ('3224', '3220', '都兰县', 'dulanxian', '816100', '3', '0');
INSERT INTO `t_city` VALUES ('3225', '3220', '天峻县', 'tianjunxian', '817200', '3', '0');
INSERT INTO `t_city` VALUES ('3226', '3220', '大柴旦行委', 'dachaidanxingwei', '817300', '3', '0');
INSERT INTO `t_city` VALUES ('3227', '1', '宁夏', 'ningxia', '0', '1', '0');
INSERT INTO `t_city` VALUES ('3228', '3227', '银川市', 'yinchuanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3229', '3228', '兴庆区', 'xingqingqu', '750001', '3', '0');
INSERT INTO `t_city` VALUES ('3230', '3228', '西夏区', 'xixiaqu', '750021', '3', '0');
INSERT INTO `t_city` VALUES ('3231', '3228', '金凤区', 'jinfengqu', '750011', '3', '0');
INSERT INTO `t_city` VALUES ('3232', '3228', '永宁县', 'yongningxian', '750100', '3', '0');
INSERT INTO `t_city` VALUES ('3233', '3228', '贺兰县', 'helanxian', '750200', '3', '0');
INSERT INTO `t_city` VALUES ('3234', '3228', '灵武市', 'lingwushi', '750004', '3', '0');
INSERT INTO `t_city` VALUES ('3235', '3227', '石嘴山市', 'shizuishanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3236', '3235', '大武口区', 'dawukouqu', '753000', '3', '0');
INSERT INTO `t_city` VALUES ('3237', '3235', '惠农区', 'huinongqu', '753600', '3', '0');
INSERT INTO `t_city` VALUES ('3238', '3235', '平罗县', 'pingluoxian', '753400', '3', '0');
INSERT INTO `t_city` VALUES ('3239', '3227', '吴忠市', 'wuzhongshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3240', '3239', '利通区', 'litongqu', '751100', '3', '0');
INSERT INTO `t_city` VALUES ('3241', '3239', '盐池县', 'yanchixian', '751500', '3', '0');
INSERT INTO `t_city` VALUES ('3242', '3239', '同心县', 'tongxinxian', '751300', '3', '0');
INSERT INTO `t_city` VALUES ('3243', '3239', '青铜峡市', 'qingtongxiashi', '751600', '3', '0');
INSERT INTO `t_city` VALUES ('3244', '3239', '红寺堡区', 'hongsibaoqu', '751900', '3', '0');
INSERT INTO `t_city` VALUES ('3245', '3227', '固原市', 'guyuanshi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3246', '3245', '原州区', 'yuanzhouqu', '756000', '3', '0');
INSERT INTO `t_city` VALUES ('3247', '3245', '西吉县', 'xijixian', '756200', '3', '0');
INSERT INTO `t_city` VALUES ('3248', '3245', '隆德县', 'longdexian', '756300', '3', '0');
INSERT INTO `t_city` VALUES ('3249', '3245', '泾源县', 'yuanxian', '756400', '3', '0');
INSERT INTO `t_city` VALUES ('3250', '3245', '彭阳县', 'pengyangxian', '756500', '3', '0');
INSERT INTO `t_city` VALUES ('3251', '3227', '中卫市', 'zhongweishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3252', '3251', '沙坡头区', 'shapotouqu', '755000', '3', '0');
INSERT INTO `t_city` VALUES ('3253', '3251', '中宁县', 'zhongningxian', '755100', '3', '0');
INSERT INTO `t_city` VALUES ('3254', '3251', '海原县', 'haiyuanxian', '755200', '3', '0');
INSERT INTO `t_city` VALUES ('3255', '1', '新疆', 'xinjiang', '0', '1', '0');
INSERT INTO `t_city` VALUES ('3256', '3255', '乌鲁木齐市', 'wulumuqishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3257', '3256', '天山区', 'tianshanqu', '830000', '3', '0');
INSERT INTO `t_city` VALUES ('3258', '3256', '沙依巴克区', 'shayibakequ', '830002', '3', '0');
INSERT INTO `t_city` VALUES ('3259', '3256', '新市区', 'xinshiqu', '830011', '3', '0');
INSERT INTO `t_city` VALUES ('3260', '3256', '水磨沟区', 'shuimogouqu', '830017', '3', '0');
INSERT INTO `t_city` VALUES ('3261', '3256', '头屯河区', 'toutunhequ', '830022', '3', '0');
INSERT INTO `t_city` VALUES ('3262', '3256', '达坂城区', 'dachengqu', '830039', '3', '0');
INSERT INTO `t_city` VALUES ('3263', '3256', '米东区', 'midongqu', '830019', '3', '0');
INSERT INTO `t_city` VALUES ('3264', '3256', '乌鲁木齐县', 'wulumuqixian', '830063', '3', '0');
INSERT INTO `t_city` VALUES ('3265', '3255', '克拉玛依市', 'kelamayishi', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3266', '3265', '独山子区', 'dushanziqu', '834021', '3', '0');
INSERT INTO `t_city` VALUES ('3267', '3265', '克拉玛依区', 'kelamayiqu', '834000', '3', '0');
INSERT INTO `t_city` VALUES ('3268', '3265', '白碱滩区', 'baijiantanqu', '834008', '3', '0');
INSERT INTO `t_city` VALUES ('3269', '3265', '乌尔禾区', 'wuerhequ', '834012', '3', '0');
INSERT INTO `t_city` VALUES ('3270', '3255', '吐鲁番地区', 'tulufandiqu', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3271', '3270', '吐鲁番市', 'tulufanshi', '838000', '3', '0');
INSERT INTO `t_city` VALUES ('3272', '3270', '鄯善县', 'shanxian', '838200', '3', '0');
INSERT INTO `t_city` VALUES ('3273', '3270', '托克逊县', 'tuokexunxian', '838100', '3', '0');
INSERT INTO `t_city` VALUES ('3274', '3255', '哈密地区', 'hamidiqu', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3275', '3274', '哈密市', 'hamishi', '839000', '3', '0');
INSERT INTO `t_city` VALUES ('3276', '3274', '巴里坤哈萨克自治县', 'balikunhasakezizhixian', '839200', '3', '0');
INSERT INTO `t_city` VALUES ('3277', '3274', '伊吾县', 'yiwuxian', '839300', '3', '0');
INSERT INTO `t_city` VALUES ('3278', '3255', '昌吉回族自治州', 'changjihuizuzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3279', '3278', '昌吉市', 'changjishi', '831100', '3', '0');
INSERT INTO `t_city` VALUES ('3280', '3278', '阜康市', 'fukangshi', '831500', '3', '0');
INSERT INTO `t_city` VALUES ('3281', '3278', '米泉市', 'miquanshi', '831400', '3', '0');
INSERT INTO `t_city` VALUES ('3282', '3278', '呼图壁县', 'hutubixian', '831200', '3', '0');
INSERT INTO `t_city` VALUES ('3283', '3278', '玛纳斯县', 'manasixian', '832200', '3', '0');
INSERT INTO `t_city` VALUES ('3284', '3278', '奇台县', 'qitaixian', '831800', '3', '0');
INSERT INTO `t_city` VALUES ('3285', '3278', '吉木萨尔县', 'jimusaerxian', '831700', '3', '0');
INSERT INTO `t_city` VALUES ('3286', '3278', '木垒哈萨克自治县', 'muleihasakezizhixian', '831900', '3', '0');
INSERT INTO `t_city` VALUES ('3287', '3255', '博尔塔拉蒙古自治州', 'boertalamengguzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3288', '3287', '博乐市', 'boleshi', '833400', '3', '0');
INSERT INTO `t_city` VALUES ('3289', '3287', '精河县', 'jinghexian', '833300', '3', '0');
INSERT INTO `t_city` VALUES ('3290', '3287', '温泉县', 'wenquanxian', '833500', '3', '0');
INSERT INTO `t_city` VALUES ('3291', '3255', '巴音郭楞蒙古自治州', 'bayinguolengmengguzizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3292', '3291', '库尔勒市', 'kuerleshi', '841000', '3', '0');
INSERT INTO `t_city` VALUES ('3293', '3291', '轮台县', 'luntaixian', '841600', '3', '0');
INSERT INTO `t_city` VALUES ('3294', '3291', '尉犁县', 'weilixian', '841500', '3', '0');
INSERT INTO `t_city` VALUES ('3295', '3291', '若羌县', 'ruoqiangxian', '841800', '3', '0');
INSERT INTO `t_city` VALUES ('3296', '3291', '且末县', 'qiemoxian', '841900', '3', '0');
INSERT INTO `t_city` VALUES ('3297', '3291', '焉耆回族自治县', 'yanhuizuzizhixian', '841100', '3', '0');
INSERT INTO `t_city` VALUES ('3298', '3291', '和静县', 'hejingxian', '841300', '3', '0');
INSERT INTO `t_city` VALUES ('3299', '3291', '和硕县', 'heshuoxian', '841200', '3', '0');
INSERT INTO `t_city` VALUES ('3300', '3291', '博湖县', 'bohuxian', '841400', '3', '0');
INSERT INTO `t_city` VALUES ('3301', '3255', '阿克苏地区', 'akesudiqu', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3302', '3301', '阿克苏市', 'akesushi', '843000', '3', '0');
INSERT INTO `t_city` VALUES ('3303', '3301', '温宿县', 'wensuxian', '843100', '3', '0');
INSERT INTO `t_city` VALUES ('3304', '3301', '库车县', 'kuchexian', '842000', '3', '0');
INSERT INTO `t_city` VALUES ('3305', '3301', '沙雅县', 'shayaxian', '842200', '3', '0');
INSERT INTO `t_city` VALUES ('3306', '3301', '新和县', 'xinhexian', '842100', '3', '0');
INSERT INTO `t_city` VALUES ('3307', '3301', '拜城县', 'baichengxian', '842300', '3', '0');
INSERT INTO `t_city` VALUES ('3308', '3301', '乌什县', 'wushixian', '843400', '3', '0');
INSERT INTO `t_city` VALUES ('3309', '3301', '阿瓦提县', 'awatixian', '843200', '3', '0');
INSERT INTO `t_city` VALUES ('3310', '3301', '柯坪县', 'kepingxian', '843600', '3', '0');
INSERT INTO `t_city` VALUES ('3311', '3255', '克孜勒苏柯尔克孜自治州', 'kezilesukeerkezizizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3312', '3311', '阿图什市', 'atushishi', '845350', '3', '0');
INSERT INTO `t_city` VALUES ('3313', '3311', '阿克陶县', 'aketaoxian', '845550', '3', '0');
INSERT INTO `t_city` VALUES ('3314', '3311', '阿合奇县', 'aheqixian', '843500', '3', '0');
INSERT INTO `t_city` VALUES ('3315', '3311', '乌恰县', 'wuqiaxian', '845450', '3', '0');
INSERT INTO `t_city` VALUES ('3316', '3255', '喀什地区', 'kashidiqu', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3317', '3316', '喀什市', 'kashishi', '844000', '3', '0');
INSERT INTO `t_city` VALUES ('3318', '3316', '疏附县', 'shufuxian', '844100', '3', '0');
INSERT INTO `t_city` VALUES ('3319', '3316', '疏勒县', 'shulexian', '844200', '3', '0');
INSERT INTO `t_city` VALUES ('3320', '3316', '英吉沙县', 'yingjishaxian', '844500', '3', '0');
INSERT INTO `t_city` VALUES ('3321', '3316', '泽普县', 'zepuxian', '844800', '3', '0');
INSERT INTO `t_city` VALUES ('3322', '3316', '莎车县', 'shachexian', '844700', '3', '0');
INSERT INTO `t_city` VALUES ('3323', '3316', '叶城县', 'yechengxian', '844900', '3', '0');
INSERT INTO `t_city` VALUES ('3324', '3316', '麦盖提县', 'maigaitixian', '844600', '3', '0');
INSERT INTO `t_city` VALUES ('3325', '3316', '岳普湖县', 'yuepuhuxian', '844400', '3', '0');
INSERT INTO `t_city` VALUES ('3326', '3316', '伽师县', 'shixian', '844300', '3', '0');
INSERT INTO `t_city` VALUES ('3327', '3316', '巴楚县', 'bachuxian', '843800', '3', '0');
INSERT INTO `t_city` VALUES ('3328', '3316', '塔什库尔干塔吉克自治县', 'tashikuergantajikezizhixian', '845250', '3', '0');
INSERT INTO `t_city` VALUES ('3329', '3255', '和田地区', 'hetiandiqu', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3330', '3329', '和田市', 'hetianshi', '848000', '3', '0');
INSERT INTO `t_city` VALUES ('3331', '3329', '和田县', 'hetianxian', '848000', '3', '0');
INSERT INTO `t_city` VALUES ('3332', '3329', '墨玉县', 'moyuxian', '848100', '3', '0');
INSERT INTO `t_city` VALUES ('3333', '3329', '皮山县', 'pishanxian', '845150', '3', '0');
INSERT INTO `t_city` VALUES ('3334', '3329', '洛浦县', 'luopuxian', '848200', '3', '0');
INSERT INTO `t_city` VALUES ('3335', '3329', '策勒县', 'celexian', '848300', '3', '0');
INSERT INTO `t_city` VALUES ('3336', '3329', '于田县', 'yutianxian', '848400', '3', '0');
INSERT INTO `t_city` VALUES ('3337', '3329', '民丰县', 'minfengxian', '848500', '3', '0');
INSERT INTO `t_city` VALUES ('3338', '3255', '伊犁哈萨克自治州', 'yilihasakezizhizhou', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3339', '3338', '伊宁市', 'yiningshi', '835000', '3', '0');
INSERT INTO `t_city` VALUES ('3340', '3338', '奎屯市', 'kuitunshi', '833200', '3', '0');
INSERT INTO `t_city` VALUES ('3341', '3338', '伊宁县', 'yiningxian', '835100', '3', '0');
INSERT INTO `t_city` VALUES ('3342', '3338', '察布查尔锡伯自治县', 'chabuchaerxibozizhixian', '835300', '3', '0');
INSERT INTO `t_city` VALUES ('3343', '3338', '霍城县', 'huochengxian', '835200', '3', '0');
INSERT INTO `t_city` VALUES ('3344', '3338', '巩留县', 'gongliuxian', '835400', '3', '0');
INSERT INTO `t_city` VALUES ('3345', '3338', '新源县', 'xinyuanxian', '835800', '3', '0');
INSERT INTO `t_city` VALUES ('3346', '3338', '昭苏县', 'zhaosuxian', '835600', '3', '0');
INSERT INTO `t_city` VALUES ('3347', '3338', '特克斯县', 'tekesixian', '835500', '3', '0');
INSERT INTO `t_city` VALUES ('3348', '3338', '尼勒克县', 'nilekexian', '835700', '3', '0');
INSERT INTO `t_city` VALUES ('3349', '3255', '塔城地区', 'tachengdiqu', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3350', '3349', '塔城市', 'tachengshi', '834700', '3', '0');
INSERT INTO `t_city` VALUES ('3351', '3349', '乌苏市', 'wusushi', '833300', '3', '0');
INSERT INTO `t_city` VALUES ('3352', '3349', '额敏县', 'eminxian', '834600', '3', '0');
INSERT INTO `t_city` VALUES ('3353', '3349', '沙湾县', 'shawanxian', '832100', '3', '0');
INSERT INTO `t_city` VALUES ('3354', '3349', '托里县', 'tuolixian', '834500', '3', '0');
INSERT INTO `t_city` VALUES ('3355', '3349', '裕民县', 'yuminxian', '834800', '3', '0');
INSERT INTO `t_city` VALUES ('3356', '3349', '和布克赛尔蒙古自治县', 'hebukesaiermengguzizhixian', '834400', '3', '0');
INSERT INTO `t_city` VALUES ('3357', '3255', '阿勒泰地区', 'aletaidiqu', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3358', '3357', '阿勒泰市', 'aletaishi', '836500', '3', '0');
INSERT INTO `t_city` VALUES ('3359', '3357', '布尔津县', 'buerjinxian', '836600', '3', '0');
INSERT INTO `t_city` VALUES ('3360', '3357', '富蕴县', 'fuyunxian', '836100', '3', '0');
INSERT INTO `t_city` VALUES ('3361', '3357', '福海县', 'fuhaixian', '836400', '3', '0');
INSERT INTO `t_city` VALUES ('3362', '3357', '哈巴河县', 'habahexian', '836700', '3', '0');
INSERT INTO `t_city` VALUES ('3363', '3357', '青河县', 'qinghexian', '836200', '3', '0');
INSERT INTO `t_city` VALUES ('3364', '3357', '吉木乃县', 'jimunaixian', '836800', '3', '0');
INSERT INTO `t_city` VALUES ('3365', '3255', '省直辖县级行政单位', 'shengzhixiaxianjixingzhengdanwei', '0', '2', '0');
INSERT INTO `t_city` VALUES ('3366', '3365', '石河子市', 'shihezishi', '832000', '3', '0');
INSERT INTO `t_city` VALUES ('3367', '3365', '阿拉尔市', 'alaershi', '843300', '3', '0');
INSERT INTO `t_city` VALUES ('3368', '3365', '图木舒克市', 'tumushukeshi', '843806', '3', '0');
INSERT INTO `t_city` VALUES ('3369', '3365', '五家渠市', 'wujiaqushi', '831300', '3', '0');

-- ----------------------------
-- Table structure for t_complain
-- ----------------------------
DROP TABLE IF EXISTS `t_complain`;
CREATE TABLE `t_complain` (
  `id` varchar(32) NOT NULL,
  `type` int(1) NOT NULL COMMENT '投诉人员类型。1：用户投诉，2：服务商投诉。',
  `reason` varchar(100) NOT NULL COMMENT '投诉原因',
  `user_id` varchar(32) NOT NULL COMMENT '投诉用户或服务商的id',
  `complain` varchar(255) NOT NULL COMMENT '投诉内容',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '投诉时间',
  `phone` varchar(11) DEFAULT NULL COMMENT '投诉人手机号码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_complain
-- ----------------------------

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `value` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '数据值',
  `label` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '标签名',
  `type` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) COLLATE utf8_bin DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES ('0695ed99552743df8835df50f0d98161', '51-55', '51-55周岁', 'nianling_type', '分摊扣费规则', '30', '0', '1', '2016-08-29 09:20:54', '1', '2016-08-29 09:20:54', '', '0');
INSERT INTO `t_dict` VALUES ('0fd44eda5e65425d96725fe2a5f5c334', '56-60', '56-60周岁', 'nianling_type', '分摊扣费规则', '40', '0', '1', '2016-08-29 09:21:11', '1', '2016-08-29 09:21:11', '', '0');
INSERT INTO `t_dict` VALUES ('1', '0', '正常', 'del_flag', '删除标记', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('10', 'yellow', '黄色', 'color', '颜色值', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('100', 'java.util.Date', 'Date', 'gen_java_type', 'Java类型\0\0', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('101', 'com.thinkgem.jeesite.modules.sys.entity.User', 'User', 'gen_java_type', 'Java类型\0\0', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('102', 'com.thinkgem.jeesite.modules.sys.entity.Office', 'Office', 'gen_java_type', 'Java类型\0\0', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('103', 'com.thinkgem.jeesite.modules.sys.entity.Area', 'Area', 'gen_java_type', 'Java类型\0\0', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型\0\0', '90', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('105', '1', '会议通告\0\0\0\0', 'oa_notify_type', '通知通告类型', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('106', '2', '奖惩通告\0\0\0\0', 'oa_notify_type', '通知通告类型', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('107', '3', '活动通告\0\0\0\0', 'oa_notify_type', '通知通告类型', '30', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('108', '0', '草稿', 'oa_notify_status', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('109', '1', '发布', 'oa_notify_status', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('11', 'orange', '橙色', 'color', '颜色值', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('110', '0', '未读', 'oa_notify_read', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('111', '1', '已读', 'oa_notify_read', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('12', 'default', '默认主题', 'theme', '主题方案', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('13', 'cerulean', '天蓝主题', 'theme', '主题方案', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('14', 'readable', '橙色主题', 'theme', '主题方案', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('15', 'united', '红色主题', 'theme', '主题方案', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('16', 'flat', 'Flat主题', 'theme', '主题方案', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('17', '1', '国家', 'sys_area_type', '区域类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('18', '2', '省份、直辖市', 'sys_area_type', '区域类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('19', '3', '地市', 'sys_area_type', '区域类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('2', '1', '删除', 'del_flag', '删除标记', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('20', '4', '区县', 'sys_area_type', '区域类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('21', '1', '公司', 'sys_office_type', '机构类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('22', '2', '部门', 'sys_office_type', '机构类型', '70', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('23', '3', '小组', 'sys_office_type', '机构类型', '80', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('24', '4', '其它', 'sys_office_type', '机构类型', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('28', '1', '一级', 'sys_office_grade', '机构等级', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('29', '2', '二级', 'sys_office_grade', '机构等级', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('3', '1', '显示', 'show_hide', '显示/隐藏', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('30', '3', '三级', 'sys_office_grade', '机构等级', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('31', '4', '四级', 'sys_office_grade', '机构等级', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('32', '1', '所有数据', 'sys_data_scope', '数据范围', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', '100', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('39', '1', '系统管理', 'sys_user_type', '用户类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('4', '0', '隐藏', 'show_hide', '显示/隐藏', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('40', '2', '部门经理', 'sys_user_type', '用户类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('41', '3', '普通用户', 'sys_user_type', '用户类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('42', 'basic', '基础主题', 'cms_theme', '站点主题', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('43', 'blue', '蓝色主题', 'cms_theme', '站点主题', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('44', 'red', '红色主题', 'cms_theme', '站点主题', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('45', 'article', '文章模型', 'cms_module', '栏目模型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('46', 'picture', '图片模型', 'cms_module', '栏目模型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('47', 'download', '下载模型', 'cms_module', '栏目模型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('48', 'link', '链接模型', 'cms_module', '栏目模型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('49', 'special', '专题模型', 'cms_module', '栏目模型', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('5', '1', '是', 'yes_no', '是/否', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('50', '0', '默认展现方式', 'cms_show_modes', '展现方式', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('51', '1', '首栏目内容列表', 'cms_show_modes', '展现方式', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('52', '2', '栏目第一条内容', 'cms_show_modes', '展现方式', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('53', '0', '发布', 'cms_del_flag', '内容状态', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('54', '1', '删除', 'cms_del_flag', '内容状态', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('55', '2', '审核', 'cms_del_flag', '内容状态', '15', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('56', '1', '首页焦点图', 'cms_posid', '推荐位', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('57', '2', '栏目页文章推荐', 'cms_posid', '推荐位', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('58', '1', '咨询', 'cms_guestbook', '留言板分类', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('59', '2', '建议', 'cms_guestbook', '留言板分类', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('6', '0', '否', 'yes_no', '是/否', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('60', '3', '投诉', 'cms_guestbook', '留言板分类', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('61', '4', '其它', 'cms_guestbook', '留言板分类', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('62', '1', '公休', 'oa_leave_type', '请假类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('63', '2', '病假', 'oa_leave_type', '请假类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('64', '3', '事假', 'oa_leave_type', '请假类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('65', '4', '调休', 'oa_leave_type', '请假类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('66', '5', '婚假', 'oa_leave_type', '请假类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('67', '1', '接入日志', 'sys_log_type', '日志类型', '30', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('68', '2', '异常日志', 'sys_log_type', '日志类型', '40', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('69', 'leave', '请假流程', 'act_type', '流程类型', '10', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('7', 'red', '红色', 'color', '颜色值', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('70', 'test_audit', '审批测试流程', 'act_type', '流程类型', '20', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('71', '1', '分类1', 'act_category', '流程分类', '10', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('72', '2', '分类2', 'act_category', '流程分类', '20', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('73', 'crud', '增删改查', 'gen_category', '代码生成分类', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('74', 'crud_many', '增删改查（包含从表）', 'gen_category', '代码生成分类', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('740a1723410749669db7e90867abfc03', '0', '失败', 'pay_type', '充值状态', '10', '0', '1', '2016-08-31 15:59:51', '1', '2016-08-31 15:59:51', '', '0');
INSERT INTO `t_dict` VALUES ('75', 'tree', '树结构', 'gen_category', '代码生成分类', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('7dc16cdf221645fab2ea9c07ec101376', '1', '成功', 'pay_strtus', '充值状态', '10', '0', '1', '2016-08-31 15:59:32', '1', '2016-08-31 15:59:32', '', '0');
INSERT INTO `t_dict` VALUES ('8', 'green', '绿色', 'color', '颜色值', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('80', 'between', 'Between', 'gen_query_type', '查询方式', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('81', 'like', 'Like', 'gen_query_type', '查询方式', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('82', 'left_like', 'Left Like', 'gen_query_type', '查询方式', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('83', 'right_like', 'Right Like', 'gen_query_type', '查询方式', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('84', 'input', '文本框', 'gen_show_type', '字段生成方案', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('85', 'textarea', '文本域', 'gen_show_type', '字段生成方案', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('86', 'select', '下拉框', 'gen_show_type', '字段生成方案', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('87', 'checkbox', '复选框', 'gen_show_type', '字段生成方案', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('88', 'radiobox', '单选框', 'gen_show_type', '字段生成方案', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('89', 'dateselect', '日期选择', 'gen_show_type', '字段生成方案', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('9', 'blue', '蓝色', 'color', '颜色值', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('90', 'userselect', '人员选择\0', 'gen_show_type', '字段生成方案', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('91', 'officeselect', '部门选择', 'gen_show_type', '字段生成方案', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('92', 'areaselect', '区域选择', 'gen_show_type', '字段生成方案', '90', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('95', 'dao', '仅持久层', 'gen_category', '代码生成分类\0\0\0\0\0\0', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('96', '1', '男', 'sex', '性别', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('968bbf01c3c9432db0b11e6d679020bc', '1', '成功', 'pay_type', '充值状态', '20', '0', '1', '2016-08-31 16:00:02', '1', '2016-08-31 16:00:02', '', '0');
INSERT INTO `t_dict` VALUES ('97', '2', '女', 'sex', '性别', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `t_dict` VALUES ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型\0\0', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('99', 'Double', 'Double', 'gen_java_type', 'Java类型\0\0', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `t_dict` VALUES ('9f70adf2f3a74bc88e3f3b0fc2cf66d4', '61-80', '61-80周岁', 'nianling_type', '分摊扣费规则', '50', '0', '1', '2016-08-29 09:21:26', '1', '2016-08-29 09:21:26', '', '0');
INSERT INTO `t_dict` VALUES ('a7e7e4c8e1604ed4a544f51028132b76', '0-35', '出生满28天到35周岁', 'nianling_type', '分摊扣费规则', '10', '0', '1', '2016-08-29 09:19:57', '1', '2016-08-29 09:20:25', '', '0');
INSERT INTO `t_dict` VALUES ('faef022cce73486f8921d3a036c1e6db', '36-50', '36-50周岁', 'nianling_type', '分摊扣费规则', '20', '0', '1', '2016-08-29 09:20:41', '1', '2016-08-29 09:20:41', '', '0');

-- ----------------------------
-- Table structure for t_engines
-- ----------------------------
DROP TABLE IF EXISTS `t_engines`;
CREATE TABLE `t_engines` (
  `id` int(32) NOT NULL COMMENT '搜索引擎表主键',
  `keywords` varchar(50) DEFAULT NULL COMMENT '网站keyword',
  `title` varchar(50) DEFAULT NULL COMMENT '网站Title',
  `statis` text COMMENT '统计代码',
  `type` varchar(1) DEFAULT NULL COMMENT 'keywords所属功能',
  `off_type` varchar(1) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_engines
-- ----------------------------

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback` (
  `id` varchar(32) NOT NULL,
  `type` int(1) NOT NULL COMMENT '反馈人员类型。1：用户反馈，2：服务商反馈。',
  `reason` varchar(100) NOT NULL COMMENT '反馈原因',
  `user_id` varchar(32) NOT NULL COMMENT '反馈用户或服务商的id',
  `feedback` varchar(255) NOT NULL COMMENT '反馈内容',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '反馈时间',
  `phone` varchar(11) DEFAULT NULL COMMENT '反馈人手机号码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for t_image
-- ----------------------------
DROP TABLE IF EXISTS `t_image`;
CREATE TABLE `t_image` (
  `id` varchar(50) NOT NULL COMMENT '系统图片表主键',
  `name` varchar(50) DEFAULT NULL COMMENT '图片名称',
  `type` varchar(50) DEFAULT NULL COMMENT '图片所属功能类型',
  `img_id` varchar(32) DEFAULT NULL COMMENT '图片所属ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_image
-- ----------------------------

-- ----------------------------
-- Table structure for t_level
-- ----------------------------
DROP TABLE IF EXISTS `t_level`;
CREATE TABLE `t_level` (
  `id` varchar(32) NOT NULL,
  `fraction` varchar(100) DEFAULT NULL COMMENT '等级所需分数',
  `name` varchar(50) DEFAULT NULL COMMENT '等级名称',
  `level_type` varchar(11) DEFAULT NULL COMMENT '等级类型',
  `off_type` varchar(1) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_level
-- ----------------------------

-- ----------------------------
-- Table structure for t_link
-- ----------------------------
DROP TABLE IF EXISTS `t_link`;
CREATE TABLE `t_link` (
  `id` varchar(32) NOT NULL COMMENT '友情链接主键',
  `url` varchar(50) DEFAULT NULL COMMENT '友情链接地址',
  `title` varchar(50) DEFAULT NULL COMMENT '友情链接名称',
  `type` varchar(1) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_link
-- ----------------------------

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `id` varchar(32) NOT NULL,
  `content` varchar(400) DEFAULT NULL,
  `type` int(4) DEFAULT NULL,
  `set_time` timestamp NULL DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_power
-- ----------------------------
DROP TABLE IF EXISTS `t_power`;
CREATE TABLE `t_power` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '权限名称',
  `intro` varchar(200) DEFAULT NULL COMMENT '简介',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父级权限',
  `type` int(2) DEFAULT NULL COMMENT '权限类型',
  `url` varchar(200) DEFAULT NULL COMMENT '权限跳转url',
  `sort` int(3) DEFAULT NULL COMMENT '权限排序',
  `icon` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_power
-- ----------------------------
INSERT INTO `t_power` VALUES ('13735', '管理员管理', '管理管理员信息', '0', '0', 'admin', '1', 'fa fa-user icon-state-info icon-lg ');
INSERT INTO `t_power` VALUES ('13736', '管理员列表', '管理员增删改查', '13735', '0', 'admin/list', '1', 'fa fa-user icon-state-success');
INSERT INTO `t_power` VALUES ('13737', '管理员添加', '管理员添加', '13735', '1', 'admin/save', '2', 'fa  fa-plus icon-state-info');
INSERT INTO `t_power` VALUES ('13738', '管理员编辑', '管理员编辑', '13735', '1', 'admin/edit', '3', 'fa  fa-edit icon-state-warning');
INSERT INTO `t_power` VALUES ('13739', '管理员删除', '管理员删除', '13735', '1', 'admin/delete', '4', 'fa  fa-trash-o icon-state-danger');
INSERT INTO `t_power` VALUES ('13740', '角色管理', '管理角色信息', '0', '0', 'role', '2', 'fa fa-male icon-state-info icon-lg ');
INSERT INTO `t_power` VALUES ('13741', '角色列表', '管理角色信息。', '13740', '0', 'role/list', '1', 'fa fa-list-ul icon-state-success');
INSERT INTO `t_power` VALUES ('13742', '角色添加', '添加角色', '13740', '1', 'role/save', '2', 'fa  fa-plus icon-state-info');
INSERT INTO `t_power` VALUES ('13743', '角色编辑', '编辑角色信息', '13740', '1', 'role/edit', '3', 'fa  fa-edit icon-state-warning');
INSERT INTO `t_power` VALUES ('13744', '角色删除', '删除角色信息', '13740', '1', 'role/delete', '4', 'fa  fa-trash-o icon-state-danger');
INSERT INTO `t_power` VALUES ('13761', '用户管理', '', '0', '0', 'user', '3', 'fa fa-user-md icon-state-info icon-lg');
INSERT INTO `t_power` VALUES ('13762', '用户列表', '', '13761', '0', 'user/list', '0', 'fa fa-list-ul icon-state-success');
INSERT INTO `t_power` VALUES ('13763', '用户添加', '', '13761', '1', 'user/save', '0', 'fa  fa-plus icon-state-info');
INSERT INTO `t_power` VALUES ('13764', '用户编辑', '', '13761', '1', 'user/edit', '0', 'fa  fa-edit icon-state-warning');
INSERT INTO `t_power` VALUES ('13765', '用户删除', '', '13761', '1', 'user/delete', '0', 'fa  fa-trash-o icon-state-danger');
INSERT INTO `t_power` VALUES ('1618053117878515653', '城市列表', '', '4388083004622194027', '0', 'city/list', '0', 'fa fa-list-ul icon-state-success');
INSERT INTO `t_power` VALUES ('4388083004622194027', '城市管理', '', '0', '0', 'city', '4', 'fa fa-file icon-state-info icon-lg');
INSERT INTO `t_power` VALUES ('4613906781675566568', '社区管理', '', '0', '0', 'javascript:void(0);', '5', 'fa fa-file icon-state-info icon-lg');
INSERT INTO `t_power` VALUES ('4698445783758096420', '社区列表', '', '4613906781675566568', '0', 'community/list', '0', 'fa fa-list-ul icon-state-success');
INSERT INTO `t_power` VALUES ('8406334401924843741', '医生列表', '', '4767068453408848466', '0', 'doctor/list', '8', 'fa fa-list-ul icon-state-success');

-- ----------------------------
-- Table structure for t_prompt
-- ----------------------------
DROP TABLE IF EXISTS `t_prompt`;
CREATE TABLE `t_prompt` (
  `id` varchar(32) NOT NULL COMMENT '网站提示语表主键',
  `prompt` varchar(50) DEFAULT NULL COMMENT '网站提示语',
  `type` varchar(1) DEFAULT NULL COMMENT '提示状态',
  `off_type` varchar(1) DEFAULT NULL COMMENT '开启状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_prompt
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '权限名称',
  `intro` varchar(200) DEFAULT NULL COMMENT '简介',
  `set_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `account_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('888888', '超级管理员', '超级管理员权限 一般用于Admin。', null, null);
INSERT INTO `t_role` VALUES ('888889', '管理员', '普通管理员  一般也就少个权限管理列表 因为权限参数不可更改；只有开发人员懂得什么意思；', null, null);
INSERT INTO `t_role` VALUES ('888890', '角色管理员', '管理角色 ', null, null);

-- ----------------------------
-- Table structure for t_role_power
-- ----------------------------
DROP TABLE IF EXISTS `t_role_power`;
CREATE TABLE `t_role_power` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) DEFAULT NULL,
  `power_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_power` (`power_id`) USING BTREE,
  KEY `role` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_power
-- ----------------------------
INSERT INTO `t_role_power` VALUES ('1', '888888', '13735');
INSERT INTO `t_role_power` VALUES ('1894383195508486490', '888888', '4613906781675566568');
INSERT INTO `t_role_power` VALUES ('2', '888888', '13736');
INSERT INTO `t_role_power` VALUES ('22', '888888', '13740');
INSERT INTO `t_role_power` VALUES ('23', '888888', '13741');
INSERT INTO `t_role_power` VALUES ('24', '888888', '13742');
INSERT INTO `t_role_power` VALUES ('25', '888888', '13743');
INSERT INTO `t_role_power` VALUES ('26', '888888', '13744');
INSERT INTO `t_role_power` VALUES ('27', '888890', '13740');
INSERT INTO `t_role_power` VALUES ('28', '888890', '13741');
INSERT INTO `t_role_power` VALUES ('29', '888890', '13742');
INSERT INTO `t_role_power` VALUES ('3', '888888', '13737');
INSERT INTO `t_role_power` VALUES ('30', '888890', '13743');
INSERT INTO `t_role_power` VALUES ('31', '888890', '13744');
INSERT INTO `t_role_power` VALUES ('32', '888889', '13735');
INSERT INTO `t_role_power` VALUES ('33', '888889', '13736');
INSERT INTO `t_role_power` VALUES ('34', '888889', '13737');
INSERT INTO `t_role_power` VALUES ('35', '888889', '13738');
INSERT INTO `t_role_power` VALUES ('36', '888889', '13739');
INSERT INTO `t_role_power` VALUES ('4', '888888', '13738');
INSERT INTO `t_role_power` VALUES ('4334452434776339853', '888888', '4698445783758096420');
INSERT INTO `t_role_power` VALUES ('47', '888888', '13755');
INSERT INTO `t_role_power` VALUES ('48', '888888', '13756');
INSERT INTO `t_role_power` VALUES ('49', '888888', '13757');
INSERT INTO `t_role_power` VALUES ('5', '888888', '13739');
INSERT INTO `t_role_power` VALUES ('50', '888888', '13758');
INSERT INTO `t_role_power` VALUES ('51', '888888', '13759');
INSERT INTO `t_role_power` VALUES ('53', '888888', '13761');
INSERT INTO `t_role_power` VALUES ('54', '888888', '13762');
INSERT INTO `t_role_power` VALUES ('55', '888888', '13763');
INSERT INTO `t_role_power` VALUES ('56', '888888', '13764');
INSERT INTO `t_role_power` VALUES ('57', '888888', '13765');
INSERT INTO `t_role_power` VALUES ('58', '888888', '1618053117878515653');
INSERT INTO `t_role_power` VALUES ('59', '888888', '4388083004622194027');

-- ----------------------------
-- Table structure for t_settings
-- ----------------------------
DROP TABLE IF EXISTS `t_settings`;
CREATE TABLE `t_settings` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `account_id` varchar(32) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT 'settings type',
  PRIMARY KEY (`id`),
  KEY `s_a` (`account_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_settings
-- ----------------------------

-- ----------------------------
-- Table structure for t_sign
-- ----------------------------
DROP TABLE IF EXISTS `t_sign`;
CREATE TABLE `t_sign` (
  `id` varchar(32) NOT NULL,
  `user_id` varchar(32) NOT NULL COMMENT '签到用户的id',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '签到时间',
  `number` int(11) NOT NULL COMMENT '累计签到次数',
  `integral` int(11) NOT NULL DEFAULT '0' COMMENT '签到获得的积分数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_sign
-- ----------------------------

-- ----------------------------
-- Table structure for t_sms
-- ----------------------------
DROP TABLE IF EXISTS `t_sms`;
CREATE TABLE `t_sms` (
  `id` varchar(32) DEFAULT NULL COMMENT '短信接口表主键',
  `name` varchar(50) DEFAULT NULL COMMENT '短信接口账号',
  `password` varchar(50) DEFAULT NULL COMMENT '短信接口密码',
  `ip` varchar(30) DEFAULT NULL COMMENT '短信接口网关',
  `sent` int(255) DEFAULT NULL COMMENT '短信接口已发送',
  `number` int(255) DEFAULT NULL COMMENT '短信接口剩余',
  `off_type` varchar(1) DEFAULT NULL COMMENT '是否有效'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_sms
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '用户账号',
  `pw` varchar(50) NOT NULL COMMENT '用户密码',
  `phone` varchar(11) DEFAULT NULL COMMENT '用户手机号码',
  `sex` varchar(1) NOT NULL COMMENT '性别关联字典sex_type',
  `money` decimal(10,0) DEFAULT NULL COMMENT '用户金额',
  `openid` varchar(32) DEFAULT NULL COMMENT '用户微信登陆用户',
  `qqid` varchar(32) DEFAULT NULL COMMENT 'qq登陆id',
  `strtus` varchar(1) NOT NULL DEFAULT '0' COMMENT '禁止状态关联字典strtus_type',
  `type` varchar(1) NOT NULL DEFAULT '0' COMMENT '失效状态关联字典user_type',
  `integral` varchar(100) NOT NULL DEFAULT '0' COMMENT '用户积分管理',
  `level` varchar(10) NOT NULL DEFAULT '0' COMMENT '用户等级 关联t_level',
  `ip` varchar(32) NOT NULL COMMENT '用户登录IP',
  `login_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '用户最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_version
-- ----------------------------
DROP TABLE IF EXISTS `t_version`;
CREATE TABLE `t_version` (
  `id` varchar(32) NOT NULL,
  `code` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `content` text,
  `set_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_version
-- ----------------------------
INSERT INTO `t_version` VALUES ('8', '6', '1.6', '/upload/client/syCar_apk_1441594935891.apk', '666', '2015-09-07 11:02:16');
INSERT INTO `t_version` VALUES ('9', '7', '1.7', '/upload/client/syCar_apk_1441621388460.apk', '', '2015-09-07 18:23:09');

-- ----------------------------
-- Table structure for t_wechatpay
-- ----------------------------
DROP TABLE IF EXISTS `t_wechatpay`;
CREATE TABLE `t_wechatpay` (
  `id` varchar(32) NOT NULL COMMENT '系统微信表主键',
  `key` varchar(50) DEFAULT NULL COMMENT 'app秘钥',
  `appid` varchar(50) DEFAULT NULL COMMENT '公众号ID',
  `secret` varchar(50) DEFAULT NULL COMMENT '公众号secret',
  `off_type` varchar(1) DEFAULT NULL COMMENT '开启状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_wechatpay
-- ----------------------------

-- ----------------------------
-- Table structure for w_activation
-- ----------------------------
DROP TABLE IF EXISTS `w_activation`;
CREATE TABLE `w_activation` (
  `id` varchar(32) NOT NULL COMMENT '设备激活表--主键',
  `equid` varchar(32) NOT NULL COMMENT '设备出厂ID',
  `user_id` varchar(32) NOT NULL COMMENT '绑定老人 关联老人表',
  `user_numberid` varchar(18) NOT NULL COMMENT '关联老人身份证号',
  `sim` varchar(55) NOT NULL COMMENT '手机号',
  `master` varchar(11) NOT NULL COMMENT '设备主控号码',
  `sosone` varchar(11) NOT NULL COMMENT 'SOS号码1',
  `sostwo` varchar(11) NOT NULL COMMENT 'SOS号码2',
  `live` varchar(1) NOT NULL COMMENT '设备状态0：设备可用 1：设备停用 2：设备禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of w_activation
-- ----------------------------

-- ----------------------------
-- Table structure for w_equipment
-- ----------------------------
DROP TABLE IF EXISTS `w_equipment`;
CREATE TABLE `w_equipment` (
  `id` varchar(32) NOT NULL COMMENT '系统设备表--主键',
  `wat_id` varchar(32) NOT NULL COMMENT '设备出厂ID',
  `w_id` varchar(32) NOT NULL COMMENT '设备厂商关联设备商表',
  `starttime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '设备入库时间',
  `activation` varchar(1) NOT NULL COMMENT '设备激活状态',
  `activastime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '设备激活时间',
  `model` varchar(32) NOT NULL COMMENT '设备型号',
  `price` decimal(10,0) NOT NULL COMMENT '设备单价',
  `live` varchar(1) NOT NULL COMMENT '设备状态0：设备可用 1：设备停用 2：设备禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of w_equipment
-- ----------------------------

-- ----------------------------
-- Table structure for w_gps
-- ----------------------------
DROP TABLE IF EXISTS `w_gps`;
CREATE TABLE `w_gps` (
  `id` varchar(32) NOT NULL COMMENT '设备GPS传输表',
  `equid` varchar(32) DEFAULT NULL COMMENT '设备传输ID',
  `gpsval` text COMMENT '设备GPS数据',
  `starttime` timestamp NULL DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of w_gps
-- ----------------------------

-- ----------------------------
-- Table structure for w_heart
-- ----------------------------
DROP TABLE IF EXISTS `w_heart`;
CREATE TABLE `w_heart` (
  `id` varchar(32) NOT NULL COMMENT '设备传输心率表--主键',
  `equid` varchar(32) DEFAULT NULL COMMENT '设备传输ID',
  `heartval` varchar(32) DEFAULT NULL COMMENT '设备心率数据',
  `starttime` timestamp NULL DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of w_heart
-- ----------------------------

-- ----------------------------
-- Table structure for w_remind
-- ----------------------------
DROP TABLE IF EXISTS `w_remind`;
CREATE TABLE `w_remind` (
  `id` varchar(32) NOT NULL COMMENT '设备提醒设置表--主键',
  `equid` varchar(32) DEFAULT NULL COMMENT '设备传输ID',
  `remindval` int(10) DEFAULT NULL COMMENT '设置提醒时间',
  `starttime` timestamp NULL DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of w_remind
-- ----------------------------

-- ----------------------------
-- Table structure for w_transfer
-- ----------------------------
DROP TABLE IF EXISTS `w_transfer`;
CREATE TABLE `w_transfer` (
  `id` varchar(32) NOT NULL COMMENT '设备传输记录表--主键',
  `content` text COMMENT '设备内容',
  `remindval` varchar(32) DEFAULT NULL COMMENT '设备传输ID',
  `starttime` timestamp NULL DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of w_transfer
-- ----------------------------

-- ----------------------------
-- Table structure for w_watchware
-- ----------------------------
DROP TABLE IF EXISTS `w_watchware`;
CREATE TABLE `w_watchware` (
  `id` varchar(32) NOT NULL COMMENT '设备提供商表--主键',
  `name` varchar(32) NOT NULL COMMENT '设备商名称',
  `charge` varchar(32) NOT NULL COMMENT '设备商负责人',
  `phone` varchar(11) NOT NULL COMMENT '设备商联系电话',
  `address` varchar(55) NOT NULL COMMENT '设备商地址',
  `type` varchar(1) NOT NULL COMMENT '设备类型，0：血糖仪；1：血压计；2：计步器；3：电子秤；4：一键通终端；5：腕表终端',
  `bank` varchar(32) NOT NULL COMMENT '开户银行',
  `banktitle` varchar(32) NOT NULL COMMENT '账户名称',
  `hardware` varchar(32) NOT NULL COMMENT '硬件商银行账号',
  `live` varchar(1) NOT NULL COMMENT '设备商状态0：设备商可用 1：设备商停用 2：设备商禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of w_watchware
-- ----------------------------
