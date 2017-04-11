/*
Navicat MySQL Data Transfer

Source Server         : 118.178.93.85  _3306
Source Server Version : 50631
Source Host           : 118.178.93.85  :3306
Source Database       : dlcat_erp

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2017-04-11 10:15:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cu_corp_info
-- ----------------------------
DROP TABLE IF EXISTS `cu_corp_info`;
CREATE TABLE `cu_corp_info` (
  `cu_corp_id` varchar(32) NOT NULL COMMENT '客户编号',
  `name` varchar(100) NOT NULL COMMENT '公司名称',
  `legal_person` varchar(100) DEFAULT NULL COMMENT '公司法人',
  `conpany_type` varchar(32) NOT NULL COMMENT '公司类型(代码:orgType)',
  `conpany_size` int(11) NOT NULL COMMENT '公司规模(单位:人数)',
  `addr` varchar(100) NOT NULL COMMENT '公司地址',
  `found_time` int(11) NOT NULL COMMENT '成立时间',
  `year_income` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '年利润',
  `business` varchar(32) DEFAULT NULL COMMENT '公司主营业务(代码:CountryIndustry)',
  PRIMARY KEY (`cu_corp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司客户详情表';

-- ----------------------------
-- Records of cu_corp_info
-- ----------------------------

-- ----------------------------
-- Table structure for cu_ind_info
-- ----------------------------
DROP TABLE IF EXISTS `cu_ind_info`;
CREATE TABLE `cu_ind_info` (
  `cu_ind_id` varchar(32) NOT NULL COMMENT '客户编号',
  `name` varchar(100) NOT NULL COMMENT '真实姓名',
  `gender` varchar(32) NOT NULL COMMENT '性别(代码:Sex)',
  `card_id` varchar(18) NOT NULL COMMENT '身份证号',
  `born_date` int(11) NOT NULL COMMENT '出生日期',
  `phone` varchar(11) NOT NULL COMMENT '手机号码',
  `email` varchar(64) DEFAULT NULL COMMENT '电子邮箱',
  `wechat` varchar(64) DEFAULT NULL COMMENT '微信号',
  `qq` varchar(32) DEFAULT NULL COMMENT 'qq号码',
  `edu` varchar(32) NOT NULL COMMENT '最高学历(代码：EducationExperience)',
  `marriage_status` tinyint(2) NOT NULL COMMENT '婚姻状况',
  `childs_count` tinyint(2) DEFAULT NULL COMMENT '子女数量',
  `residence_addr` varchar(200) NOT NULL COMMENT '户口所在地址',
  `live_addr` varchar(200) NOT NULL COMMENT '现居住地址',
  `work_conpany_type` varchar(32) DEFAULT NULL COMMENT '工作单位公司类型(代码:orgType)',
  `work_conpany_size` int(11) DEFAULT NULL COMMENT '工作单位公司规模(单位:人数)',
  `work_name` varchar(100) DEFAULT NULL COMMENT '工作单位名称',
  `work_addr` varchar(100) DEFAULT NULL COMMENT '工作单位地址',
  `is_has_ssc` varchar(32) DEFAULT NULL COMMENT '是否有社保卡',
  `work_business` varchar(32) DEFAULT NULL COMMENT '公司主营业务(代码:CountryIndustry)',
  `meonth_income` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '月收入',
  `work_phone` varchar(12) DEFAULT NULL COMMENT '工作单位联系方式',
  `relative_name` varchar(100) DEFAULT NULL COMMENT '直系亲属姓名',
  `relative_ship` varchar(32) DEFAULT NULL COMMENT '与申请人关系(代码:RelationShip)',
  `relative_phone` varchar(12) DEFAULT NULL COMMENT '亲属手机号',
  `relative_addr` varchar(100) DEFAULT NULL COMMENT '亲属居住地址',
  `relative_work_addr` varchar(100) DEFAULT NULL COMMENT '亲属工作地址',
  PRIMARY KEY (`cu_ind_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人客户详情表';

-- ----------------------------
-- Records of cu_ind_info
-- ----------------------------

-- ----------------------------
-- Table structure for cu_object_customer
-- ----------------------------
DROP TABLE IF EXISTS `cu_object_customer`;
CREATE TABLE `cu_object_customer` (
  `id` varchar(32) NOT NULL COMMENT '正式客户编号',
  `cu_possible_id` varchar(32) DEFAULT NULL COMMENT '意向客户编号',
  `name` varchar(100) NOT NULL COMMENT '客户名称',
  `phone` varchar(12) NOT NULL COMMENT '联系方式',
  `type` varchar(32) NOT NULL DEFAULT '1' COMMENT '客户类型(代码:CustomerType)',
  `card_type` varchar(32) NOT NULL COMMENT '证件类型(代码:CertType)',
  `card_id` varchar(32) NOT NULL COMMENT '证件编号',
  `belong_user_id` int(11) NOT NULL COMMENT '管户人编号',
  `belong_user_name` varchar(32) NOT NULL COMMENT '管户人名称',
  `belong_org_id` varchar(32) NOT NULL COMMENT '管户机构编号',
  `belong_org_name` varchar(32) NOT NULL COMMENT '管户机构名称',
  `dlcat_member_id` int(11) DEFAULT NULL COMMENT '哆利猫平台用户id',
  `dlcat_trust_account` varchar(32) DEFAULT NULL COMMENT '哆利猫平台第三方托管账号',
  `contact_info` varchar(12) NOT NULL COMMENT '联系方式',
  `belong_partner_id` varchar(32) DEFAULT NULL COMMENT '客户所属合作渠道编号',
  `input_time` int(11) DEFAULT NULL COMMENT '录入时间',
  `input_user_id` int(11) DEFAULT NULL COMMENT '录入用户编号',
  `input_user_name` varchar(32) DEFAULT NULL COMMENT '录入用户名称',
  `input_org_id` varchar(32) DEFAULT NULL COMMENT '录入机构编号',
  `input_org_name` varchar(32) DEFAULT NULL COMMENT '录入机构名称',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `update_user_id` int(11) DEFAULT NULL COMMENT '更新用户编号',
  `update_user_name` varchar(32) DEFAULT NULL COMMENT '更新用户名称',
  `update_org_id` varchar(32) DEFAULT NULL COMMENT '更新机构编号',
  `update_org_name` varchar(32) DEFAULT NULL COMMENT '更新机构名称',
  `status` varchar(32) NOT NULL COMMENT '状态(代码:cu_status)自建',
  PRIMARY KEY (`id`),
  KEY `cu_object_customer_dlcat_message` (`dlcat_member_id`,`dlcat_trust_account`),
  KEY `cu_object_customer_belong` (`belong_user_id`,`belong_user_name`,`belong_org_id`,`belong_org_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='正式客户表';

-- ----------------------------
-- Records of cu_object_customer
-- ----------------------------

-- ----------------------------
-- Table structure for cu_partners
-- ----------------------------
DROP TABLE IF EXISTS `cu_partners`;
CREATE TABLE `cu_partners` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `addr` varchar(100) DEFAULT NULL COMMENT '所在地址',
  `status` varchar(32) DEFAULT NULL COMMENT '状态是否可用(代码:YesNo)',
  `contact_info` varchar(12) NOT NULL COMMENT '联系方式',
  `input_time` int(11) DEFAULT NULL COMMENT '录入时间',
  `input_org_id` int(11) DEFAULT NULL COMMENT '录入机构编号',
  `inpu_org_name` varchar(100) DEFAULT NULL COMMENT '录入机构名称',
  `input_user_id` int(11) DEFAULT NULL COMMENT '录入用户编号',
  `input_user_name` varchar(100) DEFAULT NULL COMMENT '录入用户名称',
  `belong_org_id` int(11) DEFAULT NULL COMMENT '所属机构编号',
  `belong_org_name` varchar(100) DEFAULT NULL COMMENT '所属机构名称',
  `remark` varchar(300) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合作渠道客户表';

-- ----------------------------
-- Records of cu_partners
-- ----------------------------

-- ----------------------------
-- Table structure for cu_possible_customer
-- ----------------------------
DROP TABLE IF EXISTS `cu_possible_customer`;
CREATE TABLE `cu_possible_customer` (
  `id` varchar(32) NOT NULL COMMENT '意向客户编号',
  `name` varchar(100) NOT NULL COMMENT '客户名称',
  `phone` varchar(12) NOT NULL COMMENT '联系方式',
  `type` varchar(32) NOT NULL DEFAULT '1' COMMENT '客户类型(代码:CustomerType)',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `input_user_id` int(11) DEFAULT NULL COMMENT '录入用户编号',
  `input_user_name` varchar(32) DEFAULT NULL COMMENT '录入用户名称',
  `input_org_id` varchar(32) DEFAULT NULL COMMENT '录入机构名称',
  `input_org_name` varchar(32) DEFAULT NULL COMMENT '录入机构名称',
  `input_time` int(11) DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='意向客户表';

-- ----------------------------
-- Records of cu_possible_customer
-- ----------------------------

-- ----------------------------
-- Table structure for cu_property
-- ----------------------------
DROP TABLE IF EXISTS `cu_property`;
CREATE TABLE `cu_property` (
  `id` varchar(32) NOT NULL COMMENT '财产编号',
  `type` varchar(32) NOT NULL COMMENT '财产种类(代码:CustomerProperty汽车、房产、其他  自建)',
  `cu_id` varchar(32) NOT NULL COMMENT '所属客户编号',
  `cu_name` varchar(100) NOT NULL COMMENT '所属客户名称',
  `certificate_type` varchar(32) NOT NULL COMMENT '证件类型(代码:CertType)',
  `certificate_no` varchar(32) NOT NULL COMMENT '证件编号',
  `buy_time` int(11) NOT NULL COMMENT '购买时间',
  `buy_type` varchar(32) NOT NULL COMMENT '购买方式(代码:BuyType 自建)（一次性、按揭xx元/月)',
  `buy_price` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '购买价格',
  `brand` varchar(32) DEFAULT NULL COMMENT '品牌',
  `color` varchar(12) DEFAULT NULL COMMENT '颜色',
  `run_km` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '已行驶里程数(单位:公里)',
  `area` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '面积(单位:平方米)',
  `addr` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `status` varchar(11) NOT NULL COMMENT '状态(代码:ProStatus 自建 未抵押、抵押中、抵押完成)（是否已经被抵押）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户财产表';

-- ----------------------------
-- Records of cu_property
-- ----------------------------

-- ----------------------------
-- Table structure for flow_data
-- ----------------------------
DROP TABLE IF EXISTS `flow_data`;
CREATE TABLE `flow_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号(主键)',
  `flow_object_no` varchar(32) NOT NULL COMMENT '流程对象编号',
  `flow_task_no` varchar(32) NOT NULL COMMENT '流程节点编号',
  `data_type` varchar(32) NOT NULL COMMENT '数据类型(代码:FlowDataType 自建 评估、面审、考察报告，合同等)',
  `url` varchar(200) NOT NULL COMMENT '数据url',
  `status` varchar(32) NOT NULL COMMENT '是否有效(代码:YesNo)',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程数据表';

-- ----------------------------
-- Records of flow_data
-- ----------------------------

-- ----------------------------
-- Table structure for flow_model
-- ----------------------------
DROP TABLE IF EXISTS `flow_model`;
CREATE TABLE `flow_model` (
  `id` varchar(32) NOT NULL COMMENT '流程模型编号',
  `name` varchar(100) NOT NULL COMMENT '流程模型名称',
  `flow_type` varchar(32) NOT NULL COMMENT '流程类别(代码:FlowType 自建 抵质押借款流程、信用借款流程)',
  `status` varchar(32) NOT NULL COMMENT '是否有效(代码:YesNo)（是、否）',
  `input_time` int(11) DEFAULT NULL COMMENT '录入时间',
  `input_user_id` int(11) DEFAULT NULL COMMENT '录入用户编号',
  `input_org_id` varchar(32) DEFAULT NULL COMMENT '录入机构编号',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程模型表';

-- ----------------------------
-- Records of flow_model
-- ----------------------------

-- ----------------------------
-- Table structure for flow_node
-- ----------------------------
DROP TABLE IF EXISTS `flow_node`;
CREATE TABLE `flow_node` (
  `node_no` varchar(32) NOT NULL COMMENT '节点编号',
  `node_name` varchar(100) NOT NULL COMMENT '节点名称',
  `node_sort_order` int(11) NOT NULL COMMENT '流程节点顺序',
  `flow_id` varchar(32) NOT NULL COMMENT '流程模型编号',
  `status` varchar(32) NOT NULL COMMENT '是否有效(代码:YesNo)（是、否）',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`node_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程节点表';

-- ----------------------------
-- Records of flow_node
-- ----------------------------

-- ----------------------------
-- Table structure for flow_object
-- ----------------------------
DROP TABLE IF EXISTS `flow_object`;
CREATE TABLE `flow_object` (
  `object_no` varchar(32) NOT NULL COMMENT '流程对象编号',
  `object_name` varchar(32) NOT NULL COMMENT '流程对象名称',
  `flow_name` varchar(32) NOT NULL COMMENT '流程名称',
  `current_node_no` varchar(32) NOT NULL COMMENT '当前流程节点',
  `current_node_name` varchar(100) NOT NULL COMMENT '当前流程节点名称',
  `current_node_user_id` int(11) NOT NULL COMMENT '当前节点审批人编号',
  `current_node_user_name` varchar(32) NOT NULL COMMENT '当前节点审批人名称',
  `sponsor_user_id` int(11) NOT NULL COMMENT '发起流程用户编号',
  `sponsor_user_name` varchar(32) NOT NULL COMMENT '发起流程用户名称',
  `sponsor_org_id` varchar(32) NOT NULL COMMENT '发起流程机构',
  `sponsor_org_name` varchar(100) NOT NULL COMMENT '发起流程机构名称',
  `sponsor_time` int(11) NOT NULL COMMENT '发起时间',
  PRIMARY KEY (`object_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程对象表';

-- ----------------------------
-- Records of flow_object
-- ----------------------------

-- ----------------------------
-- Table structure for flow_task
-- ----------------------------
DROP TABLE IF EXISTS `flow_task`;
CREATE TABLE `flow_task` (
  `task_no` varchar(32) NOT NULL COMMENT '流程任务编号',
  `flow_object_no` varchar(32) NOT NULL COMMENT '流程对象编号',
  `cur_node_no` varchar(32) NOT NULL COMMENT '当前节点编号',
  `cur_node_name` varchar(100) NOT NULL COMMENT '当前节点名称',
  `cur_approve_user_id` int(11) NOT NULL COMMENT '当前审批人编号',
  `cur_approve_user_name` varchar(32) NOT NULL COMMENT '当前审批人名称',
  `cur_approve_opinion` varchar(100) NOT NULL COMMENT '当前当前流程意见',
  `cur_approve_time` int(11) NOT NULL COMMENT '当前审批时间',
  `pre_node_no` varchar(32) NOT NULL COMMENT '上一节点编号',
  `pre_node_name` varchar(32) NOT NULL COMMENT '上一节点名称',
  `pre_approve_user_id` int(11) NOT NULL COMMENT '上一节点审批人编号',
  `pre_approve_user_name` varchar(32) NOT NULL COMMENT '上一节点审批人名称',
  `pre_approve_opinion` varchar(100) NOT NULL COMMENT '上一节点意见',
  `pre_approve_time` int(11) NOT NULL COMMENT '上一节点审批时间',
  `next_node_no` varchar(32) NOT NULL COMMENT '下一节点编号',
  `next_node_name` varchar(100) NOT NULL COMMENT '下一节点名称',
  `next_approve_user_id` int(11) NOT NULL COMMENT '下一节点审批人编号',
  `next_approve_user_name` varchar(32) NOT NULL COMMENT '下一节点审批人名称',
  `is_approve` varchar(32) NOT NULL COMMENT '是否已经审批(代码：YesNo)',
  PRIMARY KEY (`task_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程任务表';

-- ----------------------------
-- Records of flow_task
-- ----------------------------

-- ----------------------------
-- Table structure for loan_apply_approve
-- ----------------------------
DROP TABLE IF EXISTS `loan_apply_approve`;
CREATE TABLE `loan_apply_approve` (
  `id` varchar(32) NOT NULL COMMENT '业务编号',
  `category_id` smallint(6) NOT NULL COMMENT '业务种类',
  `loan_object_type` varchar(32) NOT NULL COMMENT '借款对象种类(代码:CustomerType)',
  `cu_id` varchar(32) NOT NULL COMMENT '借款人编号',
  `cu_name` varchar(100) NOT NULL COMMENT '借款人名称',
  `card_type` varchar(32) NOT NULL COMMENT '证件类型(代码:CertType)',
  `card_id` varchar(32) NOT NULL COMMENT '证件编号',
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '借款金额',
  `period` tinyint(2) NOT NULL COMMENT '借款期限（单位：月）',
  `apr` decimal(12,6) NOT NULL COMMENT '借款年利率',
  `repay_type` smallint(6) NOT NULL COMMENT '还款方式',
  `loan_dec` varchar(500) DEFAULT NULL COMMENT '借款描述',
  `loan_use` varchar(32) DEFAULT NULL COMMENT '借款用途(代码：LoanUseType	自建 资金周转等)',
  `flow_object_no` varchar(32) NOT NULL COMMENT '流程对象编号',
  `flow_object_name` varchar(100) NOT NULL COMMENT '流程对象名称',
  `node_no` varchar(32) NOT NULL COMMENT '当前流程节点编号',
  `node_name` varchar(100) NOT NULL COMMENT '当前流程节点名称',
  `status` varchar(32) NOT NULL COMMENT '借款申请状态',
  `apply_user_id` int(11) NOT NULL COMMENT '发起申请人编号',
  `apply_user_name` varchar(40) NOT NULL COMMENT '发起申请人名称',
  `apply_time` int(11) NOT NULL COMMENT '发起申请审批时间',
  `apply_org_id` int(11) NOT NULL COMMENT '发起机构编号',
  `apply_org_name` varchar(100) NOT NULL COMMENT '发起机构名称',
  `is_has_collateral` varchar(32) NOT NULL COMMENT '是否有抵押物(代码:YesNo)',
  `collateral_type` varchar(32) DEFAULT NULL COMMENT '抵押物种类(代码:CustomerProperty汽车、房产、其他  自建)',
  `collateral_no` varchar(32) DEFAULT NULL COMMENT '抵押物编号',
  `belong_partner_id` varchar(32) DEFAULT NULL COMMENT '债权所属合作渠道编号',
  `remark` varchar(300) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借款申请审批表';

-- ----------------------------
-- Records of loan_apply_approve
-- ----------------------------

-- ----------------------------
-- Table structure for loan_apply_approve_data
-- ----------------------------
DROP TABLE IF EXISTS `loan_apply_approve_data`;
CREATE TABLE `loan_apply_approve_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `loan_apply_id` varchar(32) NOT NULL COMMENT '借款申请编号',
  `loan_category_id` smallint(6) DEFAULT NULL COMMENT '业务类型',
  `data_type` varchar(32) NOT NULL COMMENT '数据类型(代码:FlowDataType 自建 评估、面审、考察报告，合同等)',
  `data_url` varchar(200) NOT NULL COMMENT '数据url地址',
  `add_user_id` int(11) NOT NULL COMMENT '添加用户编号',
  `add_user_name` varchar(100) NOT NULL COMMENT '添加用户名称',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借款申请资料表';

-- ----------------------------
-- Records of loan_apply_approve_data
-- ----------------------------

-- ----------------------------
-- Table structure for loan_business_category
-- ----------------------------
DROP TABLE IF EXISTS `loan_business_category`;
CREATE TABLE `loan_business_category` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `amount_min` decimal(12,2) DEFAULT NULL COMMENT '最低借款金额',
  `amount_max` decimal(12,2) DEFAULT NULL COMMENT '最高借款金额',
  `apr_min` decimal(12,6) DEFAULT NULL COMMENT '最小年化收益率',
  `apr_max` decimal(12,6) DEFAULT NULL COMMENT '最大年化收益率',
  `period_min` tinyint(2) DEFAULT NULL COMMENT '最低借款期限（单位：月）',
  `period_max` tinyint(2) DEFAULT NULL COMMENT '最高借款期限（单位：月）',
  `status` varchar(32) NOT NULL COMMENT '状态是否开启(代码:YesNo)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借款业务种类表(当前系统的所有业务种类：信用、抵押、质押)';

-- ----------------------------
-- Records of loan_business_category
-- ----------------------------

-- ----------------------------
-- Table structure for loan_product_category
-- ----------------------------
DROP TABLE IF EXISTS `loan_product_category`;
CREATE TABLE `loan_product_category` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `business_id` smallint(6) NOT NULL COMMENT '借款业务种类',
  `repay_type` smallint(6) DEFAULT NULL COMMENT '还款方式',
  `remark` varchar(500) DEFAULT NULL COMMENT '描述',
  `status` varchar(32) NOT NULL COMMENT '状态是否开启(代码:YesNo)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借款产品类型表';

-- ----------------------------
-- Records of loan_product_category
-- ----------------------------

-- ----------------------------
-- Table structure for loan_repay_type
-- ----------------------------
DROP TABLE IF EXISTS `loan_repay_type`;
CREATE TABLE `loan_repay_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `contents` varchar(500) DEFAULT NULL COMMENT '内容',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='还款类型表';

-- ----------------------------
-- Records of loan_repay_type
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单编号',
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '父级菜单id,0表示一级菜单',
  `role_id` smallint(6) unsigned NOT NULL COMMENT '角色编号',
  `level` tinyint(2) NOT NULL COMMENT '菜单级别(代码:MenuLevel)自建(1-3	分别表示一、二、三级菜单,4表示Tab,5表示Btn)',
  `name` varchar(40) NOT NULL COMMENT '名称',
  `url` varchar(32) DEFAULT NULL COMMENT '访问Url',
  `status` varchar(32) DEFAULT NULL COMMENT '状态是否可用(代码:YesNo)',
  `remark` varchar(300) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org` (
  `org_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '机构编号',
  `sortno` int(11) DEFAULT NULL COMMENT '排序号',
  `org_name` varchar(100) NOT NULL COMMENT '机构名称',
  `org_level` tinyint(2) NOT NULL COMMENT '机构级别(代码:OrgLevel 自建)',
  `org_tel` varchar(12) DEFAULT NULL COMMENT '机构电话',
  `org_add` varchar(100) NOT NULL COMMENT '机构地址',
  `belong_org_id` int(11) DEFAULT NULL COMMENT '所属一级上级机构id',
  `belong_org_name` varchar(100) DEFAULT NULL COMMENT '所属一级上级机构名称',
  `status` varchar(40) DEFAULT NULL COMMENT '是否有效(代码:YesNo)',
  `input_user_id` int(11) DEFAULT NULL COMMENT '录入人编号',
  `input_user_name` varchar(32) DEFAULT NULL COMMENT '录入人名称',
  `input_time` int(11) DEFAULT NULL COMMENT '录入时间',
  `update_user_id` int(11) DEFAULT NULL COMMENT '更新人编号',
  `update_user_name` varchar(32) DEFAULT NULL COMMENT '更新人名称',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(300) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';

-- ----------------------------
-- Records of sys_org
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(100) NOT NULL COMMENT '角色名称',
  `status` tinyint(2) DEFAULT NULL COMMENT '是否可用(代码:YesNo)',
  `input_user_id` int(11) DEFAULT NULL COMMENT '录入用户id',
  `input_user_name` varchar(32) DEFAULT NULL COMMENT '录入用户名称',
  `input_org_id` int(11) DEFAULT NULL COMMENT '录入机构编号',
  `input_org_name` varchar(100) DEFAULT NULL COMMENT '录入机构名称',
  `input_time` int(11) DEFAULT NULL COMMENT '录入时间',
  `remark` varchar(300) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `name` varchar(32) NOT NULL COMMENT '用户名称',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role_id` int(11) NOT NULL COMMENT '角色编号',
  `belong_org_id` int(11) NOT NULL COMMENT '所属机构id',
  `belong_org_name` varchar(100) NOT NULL COMMENT '所属机构名称',
  `phone` varchar(12) NOT NULL COMMENT '手机号',
  `status` varchar(32) NOT NULL COMMENT '是否可用(代码:YesNo)',
  `input_user_id` int(11) DEFAULT NULL COMMENT '录入用户id',
  `input_user_name` varchar(32) DEFAULT NULL COMMENT '录入用户名称',
  `input_time` int(11) DEFAULT NULL COMMENT '录入时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `update_user_id` int(11) DEFAULT NULL COMMENT '更新人id',
  `last_login_time` int(11) DEFAULT NULL COMMENT '最后一次登录时间',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT '最后一次登录ip',
  `login_count` int(11) DEFAULT NULL COMMENT '登录次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_code_library
-- ----------------------------
DROP TABLE IF EXISTS `t_code_library`;
CREATE TABLE `t_code_library` (
  `code_no` varchar(32) NOT NULL COMMENT '代码编号',
  `item_no` varchar(32) NOT NULL COMMENT '项目编号',
  `item_name` varchar(255) NOT NULL COMMENT '项目名称',
  `sort_no` varchar(12) NOT NULL DEFAULT '0' COMMENT '排序号',
  `status` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '状态',
  `item_desc` varchar(100) DEFAULT NULL COMMENT '项目描述',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`code_no`,`item_no`),
  KEY `idx1_code_library` (`code_no`,`sort_no`,`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码表';

-- ----------------------------
-- Records of t_code_library
-- ----------------------------
INSERT INTO `t_code_library` VALUES ('CertType', 'Ent01', '组织机构代码证', 'Ent01', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CertType', 'Ent02', '营业执照', 'Ent02', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CertType', 'Ent03', '其他企业证件', 'Ent03', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CertType', 'Ind01', '身份证', 'Ind01', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CertType', 'Ind02', '户口簿', 'Ind02', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CertType', 'Ind03', '护照', 'Ind03', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CertType', 'Ind04', '军官证', 'Ind04', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CertType', 'Ind05', '士兵证', 'Ind05', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CertType', 'Ind06', '港澳居民来往内地通行证', 'Ind06', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CertType', 'Ind07', '台湾同胞来往内地通行证', 'Ind07', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CertType', 'Ind08', '临时身份证', 'Ind08', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CertType', 'Ind09', '外国人居留证', 'Ind09', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CertType', 'Ind10', '警官证', 'Ind10', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CertType', 'Ind11', '其他个人证件', 'Ind11', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CertType', 'Ind12', '香港身份证', 'Ind12', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CertType', 'Ind13', '澳门身份证', 'Ind13', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CertType', 'Ind14', '台湾身份证', 'Ind14', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CertType', 'ProCar1', '机动车登记证书', 'Ind14', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CertType', 'ProCar2', '机动车行驶证', 'Ind14', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CertType', 'ProHouse1', '房屋产权证', 'Ind14', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A', '农、林、牧、渔业', 'A', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A01', '农业', 'A01', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A011', '谷类及其他作物的种植', 'A011', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0111', '谷物的种植', 'A0111', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0112', '薯类的种植', 'A0112', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0113', '油料的种植', 'A0113', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0114', '豆类的种植', 'A0114', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0115', '棉花的种植', 'A0115', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0116', '麻类的种植', 'A0116', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0117', '糖料的种植', 'A0117', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0118', '烟草的种植', 'A0118', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0119', '其他作物的种植', 'A0119', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A012', '蔬菜、园艺作物的种植', 'A012', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0121', '蔬菜的种植', 'A0121', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0122', '花卉的种植', 'A0122', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0123', '其他园艺作物的种植', 'A0123', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A013', '水果、坚果、饮料和香料作物的种植', 'A013', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0131', '水果、坚果、的种植', 'A0131', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0132', '茶及其他饮料的作物的种植', 'A0132', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0133', '香料作物的种植', 'A0133', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A014', '中药材的种植', 'A014', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0140', '中药材的种植', 'A0140', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A02', '林业', 'A02', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A021', '林木的培育和种植', 'A021', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0211', '育种和育苗', 'A0211', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0212', '造林', 'A0212', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0213', '林木的抚育和管理', 'A0213', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A022', '木材和竹材的采运', 'A022', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0221', '木材的采运', 'A0221', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0222', '竹材的采运', 'A0222', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A023', '林产品的采集', 'A023', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0230', '林产品的采集', 'A0230', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A03', '畜牧业', 'A03', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A031', '牲畜的饲养', 'A031', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0310', '牲畜的饲养', 'A0310', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0320', '猪的饲养', 'A032', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A033', '家禽的饲养', 'A033', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0330', '家禽的饲养', 'A0330', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A034', '狩猎和捕捉动物', 'A034', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0340', '狩猎和捕捉动物', 'A0340', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A039', '其他畜牧业', 'A039', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0390', '其他畜牧业', 'A0390', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A04', '渔业', 'A04', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A041', '海洋渔业', 'A041', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0411', '海水养殖', 'A0411', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0412', '海水捕捞', 'A0412', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A042', '内陆渔业', 'A042', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0421', '内陆养殖', 'A0421', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0422', '内陆捕捞', 'A0422', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A05', '农、林、牧、渔服务业', 'A05', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A051', '农业服务业', 'A051', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0511', '灌溉服务', 'A0511', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0512', '农产品初加工', 'A0512', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0519', '其他农业服务', 'A0519', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A052', '林业服务业', 'A052', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0520', '林业服务业', 'A0520', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A053', '畜牧服务业', 'A053', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0531', '兽医服务', 'A0531', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0539', '其他畜牧服务', 'A0539', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A054', '渔业服务业', 'A054', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A0540', '渔业服务业', 'A0540', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'A320', '猪的饲养', 'A320', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B', '采矿业', 'B', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B06', '煤炭开采和洗选业', 'B06', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B061', '烟煤和无烟煤的开采洗选', 'B061', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B0610', '烟煤和无烟煤的开采洗选', 'B0610', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B062', '褐煤的开采洗选', 'B062', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B0620', '褐煤的开采洗选', 'B0620', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B069', '其他煤炭采选', 'B069', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B0690', '其他煤炭采选', 'B0690', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B07', '石油和天然气开采业', 'B07', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B070', '天然原油和天然气开采', 'B070', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B0701', '天然原油和天然气开采', 'B0701', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B079', '与石油和天然气开采有关的服务活动', 'B079', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B0790', '与石油和天然气开采有关的服务活动', 'B0790', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B08', '黑色金属矿采选业', 'B08', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B081', '铁矿采选', 'B081', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B0810', '铁矿采选', 'B0810', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B089', '其他黑色金属矿采选', 'B089', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B0890', '其他黑色金属矿采选', 'B0890', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B09', '有色金属矿采选业', 'B09', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B091', '常用有色金属矿采选', 'B091', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B0911', '铜矿采选', 'B0911', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B0912', '铅锌矿采选', 'B0912', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B0913', '镍钴矿采选', 'B0913', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B0914', '锡矿采选', 'B0914', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B0915', '锑矿采选', 'B0915', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B0916', '铝矿采选', 'B0916', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B0917', '镁矿采选', 'B0917', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B0919', '其他常用有色金属矿采选', 'B0919', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B092', '贵金属矿采选', 'B092', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B0921', '金矿采选', 'B0921', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B0922', '银矿采选', 'B0922', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B0929', '其他贵金属矿采选', 'B0929', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B093', '稀有稀土金属矿采选', 'B093', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B0931', '钨钼矿采选', 'B0931', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B0932', '稀土金属矿采选', 'B0932', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B0933', '放射性金属矿采选', 'B0933', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B0939', '其他稀有金属矿采选', 'B0939', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B10', '非金属矿采选业', 'B10', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B101', '土砂石开采', 'B101', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B1011', '石灰石、石膏开采', 'B1011', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B1012', '建筑装饰用石开采', 'B1012', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B1013', '耐火土石开采', 'B1013', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B1019', '黏土及其他土沙石开采', 'B1019', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B102', '化学矿采选', 'B102', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B1020', '化学矿采选', 'B1020', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B103', '采盐', 'B103', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B1030', '采盐', 'B1030', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B109', '石棉及其他非金属矿采选', 'B109', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B1091', '石棉、云母矿采选', 'B1091', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B1092', '石墨、滑石采选', 'B1092', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B1093', '宝石、玉石采选', 'B1093', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B1099', '其他非金属矿采选', 'B1099', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B11', '其他采矿业', 'B11', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B110', '其他采矿业', 'B110', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'B1100', '其他采矿业', 'B1100', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C', '制造业', 'C', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C13', '农副食品加工业', 'C13', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C131', '谷物磨制', 'C131', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1310', '谷物磨制', 'C1310', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C132', '饲料加工', 'C132', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1320', '饲料加工', 'C1320', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C133', '植物油加工', 'C133', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1331', '食用植物油', 'C1331', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1332', '非食用植物油', 'C1332', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C134', '制糖', 'C134', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1340', '制糖', 'C1340', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C135', '屠宰及肉类加工', 'C135', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1351', '畜禽屠宰', 'C1351', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1352', '肉制品及副产品屠宰', 'C1352', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C136', '水产品加工', 'C136', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1361', '水产品冷冻加工', 'C1361', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1362', '鱼麋制品及水产品干腌制食品', 'C1362', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1363', '水产饲料加工', 'C1363', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1364', '鱼油提取及制品制造', 'C1364', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1369', '其他水产品加工', 'C1369', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C137', '蔬菜、水果和坚果加工', 'C137', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1370', '蔬菜、水果和坚果加工', 'C1370', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C139', '其他农副食品加工', 'C139', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1391', '淀粉及淀粉制品的制造', 'C1391', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1392', '豆制品制造', 'C1392', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1393', '蛋品加工', 'C1393', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1399', '其他未列明的农副食品加工', 'C1399', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C14', '食品制造业', 'C14', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C141', '焙烤食品制造', 'C141', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1411', '糕点、面包制造', 'C1411', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1419', '饼干及其他培烤食品', 'C1419', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C142', '糖果、巧克力及蜜饯制造', 'C142', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1421', '糖果、巧克力制造', 'C1421', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1422', '蜜饯制造', 'C1422', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C143', '方便食品制造', 'C143', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1431', '米、面制品制造', 'C1431', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1432', '速冻食品制造', 'C1432', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1439', '方便面及其食品制造', 'C1439', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C144', '液体乳及乳制品制造', 'C144', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1440', '液体乳及乳制品制造', 'C1440', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C145', '罐头制造', 'C145', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1451', '肉、禽类罐头制造', 'C1451', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1452', '水产品罐头制造', 'C1452', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1453', '蔬菜、水果罐头制造', 'C1453', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1459', '其他罐头食品制造', 'C1459', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C146', '调味品、发酵制品制造', 'C146', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1461', '味精制造', 'C1461', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1462', '酱油、食醋及类似制品的制造', 'C1462', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1469', '其他调味品、发酵制品制造', 'C1469', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C149', '其他食品制造', 'C149', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1491', '营养、保健食品制造', 'C1491', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1492', '冷冻饮品及食用冰制造', 'C1492', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1493', '盐加工', 'C1493', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1494', '食品及饲料添加剂制造', 'C1494', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1499', '其他未列明的食品制造', 'C1499', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C15', '饮料制造业', 'C15', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C151', '酒精制造', 'C151', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1510', '酒精制造', 'C1510', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C152', '酒的制造', 'C152', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1521', '白酒制造', 'C1521', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1522', '啤酒制造', 'C1522', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1523', '黄酒制造', 'C1523', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1524', '葡萄酒制造', 'C1524', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1529', '其他酒制造', 'C1529', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C153', '软饮料制造', 'C153', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1531', '碳酸饮料制造', 'C1531', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1532', '瓶(罐)装饮用水制造', 'C1532', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1533', '果蔬汁及果菜汁饮料制造', 'C1533', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1534', '含乳饮料和植物蛋白饮料制造', 'C1534', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1535', '固体饮料制造', 'C1535', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1539', '茶饮料及其他软饮料制造', 'C1539', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C154', '精致茶加工', 'C154', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1540', '精致茶加工', 'C1540', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C16', '烟草制品业', 'C16', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C161', '烟叶复烤', 'C161', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1610', '烟叶复烤', 'C1610', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C162', '卷烟制造', 'C162', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1620', '卷烟制造', 'C1620', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C169', '其他烟草制品加工', 'C169', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1690', '其他烟草制品加工', 'C1690', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C17', '纺织业', 'C17', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C171', '棉、化纤纺织及印染精加工', 'C171', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1711', '棉、化纤纺织加工', 'C1711', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1712', '棉、化纤印染精加工', 'C1712', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C172', '毛纺织和染整精加工', 'C172', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1721', '毛条加工', 'C1721', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1722', '毛纺织', 'C1722', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1723', '毛染整精加工', 'C1723', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C173', '麻纺织', 'C173', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1730', '麻纺织', 'C1730', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C174', '丝绢纺织及精加工', 'C174', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1741', '剿丝加工', 'C1741', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1742', '绢纺及丝织加工', 'C1742', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1743', '丝印染精加工', 'C1743', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C175', '纺织制成品制造', 'C175', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1751', '棉及化纤制品制造', 'C1751', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1752', '毛制品制造', 'C1752', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1753', '麻制品制造', 'C1753', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1754', '丝制品制造', 'C1754', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1755', '绳索缆的制造', 'C1755', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1756', '纺织带和帘子布制造', 'C1756', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1757', '无纺布制造', 'C1757', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1759', '其他纺织制品制造', 'C1759', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C176', '针织品、编织品及其制品制造', 'C176', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1761', '棉、化纤针织品及编织品制造', 'C1761', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1762', '毛针织品及编织品制造', 'C1762', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1763', '丝针织品及编织品制造', 'C1763', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1769', '其他针织品及编织品制造', 'C1769', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C18', '纺织服装、鞋、帽制造业', 'C18', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C181', '纺织服装制造', 'C181', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1810', '纺织服装制造', 'C1810', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C182', '纺织面料鞋的制造', 'C182', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1820', '纺织面料鞋的制造', 'C1820', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C183', '制帽', 'C183', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1830', '制帽', 'C1830', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C19', '皮革、毛皮、羽毛(绒)及其制品业', 'C19', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C191', '皮革鞣制加工', 'C191', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1910', '皮革鞣制加工', 'C1910', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C192', '皮革制品制造', 'C192', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1921', '皮鞋制造', 'C1921', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1922', '皮革服装制造', 'C1922', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1923', '皮箱、包、带制造', 'C1923', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1924', '皮手套及皮装饰制品', 'C1924', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1929', '其他皮革制品制造', 'C1929', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C193', '毛皮鞣制及制品加工', 'C193', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1931', '毛皮鞣制加工', 'C1931', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1932', '毛皮服装加工', 'C1932', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1939', '其他毛皮制品加工', 'C1939', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C194', '羽毛(绒)加工及制品制造', 'C194', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1941', '羽毛(绒)加工', 'C1941', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C1942', '羽毛(绒)制品加工', 'C1942', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C20', '木材加工及木、竹、藤、棕、草制品业', 'C20', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C201', '锯材、木片加工', 'C201', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2011', '锯材加工', 'C2011', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2012', '木片加工', 'C2012', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C202', '人造板制造', 'C202', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2021', '胶合板制造', 'C2021', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2022', '纤维板制造', 'C2022', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2023', '刨花板制造', 'C2023', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2029', '其他人造板、材制造', 'C2029', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C203', '木制品制造', 'C203', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2031', '建筑用木料及木材组件加工', 'C2031', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2032', '木容器制造', 'C2032', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2039', '软木制品及其他木制品制造', 'C2039', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C204', '竹、藤、棕、草制品制造', 'C204', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2040', '竹、藤、棕、草制品制造', 'C2040', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C21', '家具制造业', 'C21', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C211', '木质家具制造', 'C211', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2110', '木质家具制造', 'C2110', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C212', '竹、藤家具制造', 'C212', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2120', '竹、藤家具制造', 'C2120', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C213', '金属家具制造', 'C213', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2130', '金属家具制造', 'C2130', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C214', '塑料家具制造', 'C214', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2140', '塑料家具制造', 'C2140', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C219', '其他家具制造', 'C219', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2190', '其他家具制造', 'C2190', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C22', '造纸及纸制品业', 'C22', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C221', '纸浆制造', 'C221', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2210', '纸浆制造', 'C2210', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C222', '造纸', 'C222', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2221', '机制纸及纸板制造', 'C2221', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2222', '手工纸制造', 'C2222', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2223', '加工纸制造', 'C2223', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C223', '纸制品制造', 'C223', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2231', '纸和纸板容器制造', 'C2231', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2239', '其他纸制品制造', 'C2239', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C23', '印刷业和记录媒介的复制', 'C23', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C231', '印刷', 'C231', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2311', '书、报、刊印刷', 'C2311', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2312', '本册印刷', 'C2312', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2319', '包装装潢及其印刷', 'C2319', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C232', '装订及其他印刷服务活动', 'C232', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2320', '装订及其他印刷服务活动', 'C2320', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C233', '记录媒介的服务', 'C233', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2330', '记录媒介的服务', 'C2330', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C24', '文教体育用品制造业', 'C24', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C241', '文化用品制造', 'C241', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2411', '文具制造', 'C2411', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2412', '笔的制造', 'C2412', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2413', '教学用模型及模具制造', 'C2413', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2414', '墨水、墨汁制造', 'C2414', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2419', '其他文化用品制造', 'C2419', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C242', '体育用品制造', 'C242', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2421', '球类制造', 'C2421', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2422', '体育器材及配件制造', 'C2422', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2423', '训练健身器材制造', 'C2423', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2424', '运动防护用具制造', 'C2424', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2429', '其他体育用品制造', 'C2429', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C243', '乐器制造', 'C243', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2431', '中乐器制造', 'C2431', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2432', '西乐器制造', 'C2432', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2433', '电子乐器制造', 'C2433', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2439', '其他乐器及零件制造', 'C2439', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C244', '玩具制造', 'C244', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2440', '玩具制造', 'C2440', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C245', '游艺器材及娱乐用品制造', 'C245', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2451', '露天游乐场所游艺设备制造', 'C2451', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2452', '游艺用品及室内游艺器材制造', 'C2452', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C25', '石油加工、炼焦及核燃料加工业', 'C25', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C251', '精练石油产品的制造', 'C251', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2511', '原油加工及石油制品制造', 'C2511', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2512', '人造原油生产', 'C2512', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C252', '炼焦', 'C252', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2520', '炼焦', 'C2520', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C253', '核燃料加工', 'C253', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2530', '核燃料加工', 'C2530', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C26', '化学原料及化学制品制造业', 'C26', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C261', '基础化学原料制造', 'C261', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2611', '无机酸制造', 'C2611', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2612', '无机碱制造', 'C2612', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2613', '无机盐制造', 'C2613', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2614', '有机化学原料制造', 'C2614', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2619', '其他基础化学原料制造', 'C2619', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C262', '肥料制造', 'C262', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2621', '氮肥制造', 'C2621', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2622', '磷肥制造', 'C2622', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2623', '钾肥制造', 'C2623', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2624', '复合肥料制造', 'C2624', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2625', '有机肥料及微生物肥料制造', 'C2625', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2629', '其他肥料制造', 'C2629', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C263', '农药制造', 'C263', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2631', '化学农药制造', 'C2631', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2632', '生物化学农药及微生物农药制造', 'C2632', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C264', '涂料、油墨、颜料及类似产品制造', 'C264', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2641', '涂料制造', 'C2641', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2642', '油墨及类似产品制造', 'C2642', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2643', '颜料制造', 'C2643', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2644', '染料制造', 'C2644', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2645', '密封用填料及类似品制造', 'C2645', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C265', '合成材料制造', 'C265', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2651', '初级形态的塑料及合成树脂制造', 'C2651', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2652', '合成橡胶制造', 'C2652', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2653', '合成纤维(单)聚合体的制造', 'C2653', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2659', '其他合成材料制品制造', 'C2659', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C266', '专用化学产品制造', 'C266', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2661', '化学制剂及助剂制造', 'C2661', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2662', '专项化学制品制造', 'C2662', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2663', '林产化学产品制造', 'C2663', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2664', '炸药及火工产品制造', 'C2664', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2665', '信息化学品制造', 'C2665', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2666', '环境污染处理专用药剂材料生产', 'C2666', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2667', '动物胶制造', 'C2667', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2669', '其他专用化学产品制造', 'C2669', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C267', '日用化学产品制造', 'C267', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2671', '肥皂及合成洗涤剂制造', 'C2671', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2672', '化妆品制造', 'C2672', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2673', '口腔清洁品用品制造', 'C2673', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2674', '香料、香精制造', 'C2674', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2679', '其他日用化妆产品制造', 'C2679', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C27', '医药制造业', 'C27', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C271', '化学药品原药制造', 'C271', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2710', '化学药品原药制造', 'C2710', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C272', '化学药品制剂制造', 'C272', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2720', '化学药品制剂制造', 'C2720', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C273', '中药饮品加工', 'C273', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2730', '中药饮品加工', 'C2730', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C274', '中成药制造', 'C274', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2740', '中成药制造', 'C2740', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C275', '兽用药品制造', 'C275', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2750', '兽用药品制造', 'C2750', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C276', '生物、生化制品的制造', 'C276', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2760', '生物、生化制品的制造', 'C2760', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C277', '卫生材料及医药用品制造', 'C277', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2770', '卫生材料及医药用品制造', 'C2770', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C28', '化学纤维制造业', 'C28', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C281', '纤维素纤维原料及纤维制造', 'C281', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2811', '化纤浆箔制造', 'C2811', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2812', '人造纤维', 'C2812', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C282', '合成纤维制造', 'C282', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2821', '锦纶纤维制造', 'C2821', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2822', '涤纶纤维制造', 'C2822', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2823', '晴纶纤维制造', 'C2823', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2824', '维纶纤维制造', 'C2824', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2829', '其他合成纤维制造', 'C2829', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C29', '橡胶制品业', 'C29', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C291', '轮胎制造', 'C291', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2911', '车辆、飞机及工程机械轮胎制造', 'C2911', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2912', '力车胎制造', 'C2912', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2913', '轮胎翻新制造', 'C2913', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C292', '橡胶板、管、带的制造', 'C292', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2920', '橡胶板、管、带的制造', 'C2920', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C293', '橡胶零件制造', 'C293', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2930', '橡胶零件制造', 'C2930', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C294', '再生橡胶制造', 'C294', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2940', '再生橡胶制造', 'C2940', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C295', '日用及医用橡胶制品制造', 'C295', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2950', '日用及医用橡胶制品制造', 'C2950', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C296', '橡胶靴鞋制造', 'C296', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2960', '橡胶靴鞋制造', 'C2960', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C299', '其他橡胶制品制造', 'C299', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C2990', '其他橡胶制品制造', 'C2990', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C30', '塑料制品业', 'C30', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C301', '塑料薄膜制造', 'C301', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3010', '塑料薄膜制造', 'C3010', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C302', '塑料板、管、型材的制造', 'C302', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3020', '塑料板、管、型材的制造', 'C3020', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C303', '塑料丝、绳及编织品的制造', 'C303', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3030', '塑料丝、绳及编织品的制造', 'C3030', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C304', '泡沫塑料制造', 'C304', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3040', '泡沫塑料制造', 'C3040', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C305', '塑料人造革、合成革制造', 'C305', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3050', '塑料人造革、合成革制造', 'C3050', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C306', '塑料包装箱及容器制造', 'C306', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3060', '塑料包装箱及容器制造', 'C3060', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C307', '塑料零件制造', 'C307', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3070', '塑料零件制造', 'C3070', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C308', '日用塑料制造', 'C308', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3081', '塑料鞋制造', 'C3081', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3082', '日用塑料制品制造', 'C3082', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C309', '其他塑料制品制造', 'C309', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3090', '其他塑料制品制造', 'C3090', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C31', '非金属矿物制品业', 'C31', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C311', '水泥、石灰和石膏的制造', 'C311', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3111', '水泥制造', 'C3111', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3112', '石灰和石膏制造', 'C3112', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C312', '水泥及石膏制品制造', 'C312', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3121', '水泥制品制造', 'C3121', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3122', '钢结构构件制造', 'C3122', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3123', '石棉水泥制品制造', 'C3123', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3124', '轻质水泥制品制造', 'C3124', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3129', '其他水泥制品制造', 'C3129', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C313', '砖瓦、石材及其他建筑材料制造', 'C313', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3131', '黏土砖瓦及建筑砌块制造', 'C3131', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3132', '建筑陶瓷制品制造', 'C3132', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3133', '建筑用石加工', 'C3133', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3134', '防水建筑材料加工', 'C3134', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3135', '隔热和隔音材料制造', 'C3135', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3139', '其他建筑材料制造', 'C3139', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C314', '玻璃及玻璃制品制造', 'C314', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3141', '平板玻璃制造', 'C3141', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3142', '技术玻璃制品制造', 'C3142', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3143', '光学玻璃制品制造', 'C3143', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3144', '玻璃仪器制造', 'C3144', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3145', '日用玻璃制品及玻璃包装容器制造', 'C3145', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3146', '玻璃保温容器制造', 'C3146', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3147', '玻璃纤维及制品制造', 'C3147', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3148', '玻璃纤维增强塑料制品制造', 'C3148', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3149', '其他玻璃制品制造', 'C3149', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C315', '陶瓷制品制造', 'C315', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3151', '卫生陶瓷制品制造', 'C3151', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3152', '特种陶瓷制品制造', 'C3152', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3153', '日用陶瓷制品制造', 'C3153', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3159', '园林、陈设艺术及其他陶瓷制品制造', 'C3159', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C316', '耐火材料制品制造', 'C316', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3161', '石棉制品制造', 'C3161', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3162', '云母制品制造', 'C3162', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3169', '耐火陶瓷制品及其他耐火材料制造', 'C3169', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C319', '石墨及其他非金属矿物制品制造', 'C319', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3191', '石墨及炭素制品制造', 'C3191', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3199', '其他非金属矿物制品制造', 'C3199', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C32', '黑色金属冶炼及压延加工业', 'C32', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C321', '炼铁', 'C321', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3210', '炼铁', 'C3210', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C322', '炼钢', 'C322', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3220', '炼钢', 'C3220', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C323', '钢压延加工', 'C323', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3230', '钢压延加工', 'C3230', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C324', '铁合金冶炼', 'C324', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3240', '铁合金冶炼', 'C3240', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C33', '有色金属冶炼及压延加工业', 'C33', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C331', '常用有色金属冶炼', 'C331', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3311', '铜冶炼', 'C3311', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3312', '铅锌冶炼', 'C3312', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3313', '镍钴冶炼', 'C3313', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3314', '锡冶炼', 'C3314', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3315', '锑冶炼', 'C3315', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3316', '铝冶炼', 'C3316', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3317', '镁冶炼', 'C3317', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3319', '其他常用有色金属冶炼', 'C3319', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C332', '贵金属冶炼', 'C332', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3321', '金冶炼', 'C3321', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3322', '银冶炼', 'C3322', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3329', '其他贵金属冶炼', 'C3329', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C333', '稀有稀土金属冶炼', 'C333', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3331', '钨钼冶炼', 'C3331', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3332', '稀土金属冶炼', 'C3332', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3339', '其他稀有金属冶炼', 'C3339', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C334', '有色金属合金制造', 'C334', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3340', '有色金属合金制造', 'C3340', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C335', '有色金属压延加工', 'C335', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3351', '常用有色金属压延加工', 'C3351', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3352', '贵金属压延加工', 'C3352', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3353', '稀有金属压延加工', 'C3353', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C34', '金属制品业', 'C34', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C341', '结构性金属制品制造', 'C341', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3411', '金属机构制造', 'C3411', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3412', '金属门窗制造', 'C3412', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C342', '金属工具制造', 'C342', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3421', '切削工具制造', 'C3421', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3422', '手工具制造', 'C3422', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3423', '农用及园林用金属工具制造', 'C3423', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3424', '刀剪及类似日用金属工具制造', 'C3424', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3429', '其他金属工具制造', 'C3429', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C343', '集装箱及金属包装容器制造', 'C343', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3431', '集装箱制造', 'C3431', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3432', '金属压力容器制造', 'C3432', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3433', '金属包装容器制造', 'C3433', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C344', '金属丝绳及其制品的制造', 'C344', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3440', '金属丝绳及其制品的制造', 'C3440', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C345', '建筑、安全用金属制品制造', 'C345', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3451', '建筑、家具用金属配件制造', 'C3451', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3452', '建筑装饰及水暖管道零件制造', 'C3452', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3453', '安全、消防用金属制品制造', 'C3453', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3459', '其他建筑、安全用金属制品制造', 'C3459', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C346', '金属表面处理及热处理加工', 'C346', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3460', '金属表面处理及热处理加工', 'C3460', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C347', '搪瓷制品制造', 'C347', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3471', '工业生产配套用搪瓷制品制造', 'C3471', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3472', '搪瓷卫生洁具制造', 'C3472', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3479', '搪瓷日用品及其他搪瓷制品制造', 'C3479', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C348', '不锈钢及类似日用金属制品制造', 'C348', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3481', '金属制厨房调理及卫生器具制造', 'C3481', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3482', '金属制厨用器具及餐具制造', 'C3482', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3489', '其他日用金属制品制造', 'C3489', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C349', '其他金属制品制造', 'C349', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3491', '铸币及贵金属制实验室用品制造', 'C3491', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3499', '其他未列明的金属制品制造', 'C3499', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C35', '通用设备制造业', 'C35', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C351', '锅炉及原动机制造', 'C351', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3511', '锅炉及辅助设备制造', 'C3511', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3512', '内燃机及配件制造', 'C3512', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3513', '汽轮机及辅机制造', 'C3513', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3514', '水轮机及辅机制造', 'C3514', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3519', '其他原动机制造', 'C3519', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C352', '金属加工机械制造', 'C352', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3521', '金属切削机床制造', 'C3521', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3522', '金属成型机床制造', 'C3522', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3523', '铸造机械制造', 'C3523', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3524', '金属切割及焊接设备制造', 'C3524', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3525', '机床附件制造', 'C3525', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3529', '其他金属加工机械制造', 'C3529', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C353', '起重运输设备制造', 'C353', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3530', '起重运输设备制造', 'C3530', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C354', '泵、阀门、压缩机及类似机械的制造', 'C354', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3541', '泵及真空设备制造', 'C3541', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3542', '气体压缩机械制造', 'C3542', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3543', '阀门及旋塞的制造', 'C3543', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3544', '液压和气压动力机械及元件制造', 'C3544', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C355', '轴承、齿轮、传动和驱动部件的制造', 'C355', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3551', '轴承制造', 'C3551', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3552', '齿轮、传动和驱动部件制造', 'C3552', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C356', '烘炉、熔炉及电炉制造', 'C356', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3560', '烘炉、熔炉及电炉制造', 'C3560', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C357', '风机、衡器、包装设备等通用设备制造', 'C357', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3571', '风机、风扇制造', 'C3571', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3572', '气体、液体分离及纯净设备制造', 'C3572', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3573', '制冷、空调设备制造', 'C3573', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3574', '风动及电动工具制造', 'C3574', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3575', '喷枪及类似器具制造', 'C3575', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3576', '包装专用设备制造', 'C3576', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3577', '衡器制造', 'C3577', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3579', '其他通用设备制造', 'C3579', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C358', '通用零部件制造及机械修理', 'C358', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3581', '金属密封件制造', 'C3581', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3582', '紧固件、弹簧制造', 'C3582', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3583', '机械零部件加工及设备制造', 'C3583', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3589', '其他通用零部件制造', 'C3589', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C359', '金属铸、锻加工', 'C359', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3591', '钢铁铸件制造', 'C3591', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3592', '锻件及粉末冶金制品制造', 'C3592', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C36', '专用设备制造业', 'C36', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C361', '矿山、冶金、建筑专用设备制造', 'C361', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3611', '采矿、采石设备制造', 'C3611', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3612', '石油钻采专用设备制造', 'C3612', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3613', '建筑工程用机械制造', 'C3613', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3614', '建筑材料生产专用机械制造', 'C3614', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3615', '冶金专用设备制造', 'C3615', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C362', '化工、木材、非金属加工专用设备制造', 'C362', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3621', '炼油、化工生产专用设备制造', 'C3621', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3622', '橡胶加工专用设备制造', 'C3622', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3623', '塑料加工专用设备制造', 'C3623', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3624', '木材加工专用设备制造', 'C3624', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3625', '模具制造', 'C3625', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3629', '其他非金属加工专用设备制造', 'C3629', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C363', '食品、饮料、烟草及饲料生产专用设备制造', 'C363', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3631', '食品、饮料、烟草专用设备制造', 'C3631', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3632', '农副食品加工业专用设备制造', 'C3632', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3633', '饲料生产专用设备制造', 'C3633', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C364', '印刷、制药、日化生产专用设备制造', 'C364', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3641', '印浆和造纸专用设备制造', 'C3641', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3642', '印刷专用设备制造', 'C3642', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3643', '日用化工专用设备制造', 'C3643', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3644', '制药专用设备制造', 'C3644', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3645', '照明专用设备制造', 'C3645', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3646', '玻璃、陶瓷和搪瓷制品生产专用设备制造', 'C3646', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3649', '其他日用品生产专用设备制造', 'C3649', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C365', '纺织、服装和皮革工业专用设备制造', 'C365', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3651', '纺织专用设备制造', 'C3651', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3652', '皮革、毛皮及其制品专用设备制造', 'C3652', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3653', '缝纫机械专用设备制造', 'C3653', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3659', '其他服装加工专用设备制造', 'C3659', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C366', '电子和电工机械专用设备制造', 'C366', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3661', '电子机械专用设备制造', 'C3661', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3662', '电子工业专用设备制造', 'C3662', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3663', '武器弹药专用设备制造', 'C3663', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3669', '航空、航天及其他专用设备制造', 'C3669', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C367', '农、林、牧、渔专用机械制造', 'C367', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3671', '拖拉机制造', 'C3671', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3672', '机械化农业及园艺机具制造', 'C3672', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3673', '营林及木竹采伐机械制造', 'C3673', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3674', '畜牧机械制造', 'C3674', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3675', '渔业机械制造', 'C3675', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3676', '农林牧渔机械配件制造', 'C3676', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3679', '其他农林牧渔机械制造及机械修理', 'C3679', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C368', '医疗仪器设备及器械制造', 'C368', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3681', '医疗诊断、监护及治疗设备制造', 'C3681', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3682', '口腔科用设备及器具制造', 'C3682', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3683', '实验室及医用消毒设备和器具的制造', 'C3683', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3684', '医疗、外科及兽医用器械制造', 'C3684', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3685', '机械治疗及病房护理设备制造', 'C3685', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3686', '假肢、人工器官及植(介)入器械制造', 'C3686', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3689', '其他医疗设备及器械制造', 'C3689', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C369', '环保、社会公共安全及其他专用设备制造', 'C369', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3691', '环境污染防治专用设备制造', 'C3691', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3692', '地质勘查专用设备制造', 'C3692', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3693', '邮政专用机械及器材制造', 'C3693', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3694', '商业、饮食、服务业专用设备制造', 'C3694', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3695', '社会公共安全设备制造', 'C3695', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3696', '交通安全及管制设备制造', 'C3696', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3697', '水资源专用设备制造', 'C3697', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3699', '其他专用设备制造', 'C3699', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C37', '交通运输设备制造业', 'C37', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C371', '铁路运输设备制造', 'C371', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3711', '铁路机车车辆及动车组制造', 'C3711', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3712', '工矿有轨专用车辆制造', 'C3712', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3713', '铁路机车车辆配件制造', 'C3713', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3714', '铁路专用设备及器材、配件制造', 'C3714', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3719', '其他铁路设备制造及设备修理', 'C3719', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C372', '汽车制造', 'C372', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3721', '汽车整车制造', 'C3721', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3722', '改装汽车制造', 'C3722', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3723', '电车制造', 'C3723', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3724', '汽车车身、挂车制造', 'C3724', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3725', '汽车零部件及配件制造', 'C3725', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3726', '汽车修理', 'C3726', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C373', '摩托车制造', 'C373', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3731', '摩托车整车制造', 'C3731', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3732', '摩托车零部件及配件制造', 'C3732', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C374', '自行车制造', 'C374', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3741', '脚踏自行车及残疾人座车制造', 'C3741', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3742', '助动自行车制造', 'C3742', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C375', '船舶及浮动装置制造', 'C375', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3751', '金属船舶制造', 'C3751', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3752', '非金属船舶制造', 'C3752', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3753', '娱乐船及运动船制造及修理', 'C3753', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3754', '船用配套设施制造', 'C3754', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3755', '船舶修理及拆船', 'C3755', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3759', '航标器材及其他浮动装置制造', 'C3759', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C376', '航空航天器制造', 'C376', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3761', '飞机制造及修理', 'C3761', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3762', '航天器制造', 'C3762', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3769', '其他飞行器制造', 'C3769', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C379', '交通器材及其他交通运输设备制造', 'C379', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3791', '潜水及水下救捞装备制造', 'C3791', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3792', '交通管理用金属标志及设施制造', 'C3792', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3799', '其他交通运输设备制造', 'C3799', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C39', '电器机械及器材制造业', 'C39', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C391', '电机制造', 'C391', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3911', '发电机及发电机组制造', 'C3911', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3912', '电动机制造', 'C3912', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3919', '微电机及其他电机制造', 'C3919', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C392', '输配电及控制设备制造', 'C392', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3921', '变压器、整流器和电感器制造', 'C3921', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3922', '电容器及其配套设施制造', 'C3922', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3923', '配电开关控制设备制造', 'C3923', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3924', '电力电子元器件制造', 'C3924', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3929', '其他输配电及控制设备制造', 'C3929', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C393', '电线、电缆、光缆及电工器材制造', 'C393', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3931', '电线、电缆制造', 'C3931', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3932', '光纤、光缆制造', 'C3932', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3933', '绝缘制品制造', 'C3933', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3939', '其他电工器材制造', 'C3939', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C394', '电池制造', 'C394', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3940', '电池制造', 'C3940', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C395', '家用电力器具制造', 'C395', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3951', '家用制冷电器具制造', 'C3951', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3952', '家用空气调节器制造', 'C3952', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3953', '家用通风电器具制造', 'C3953', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3954', '家用厨房电器具制造', 'C3954', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3955', '家用清洁卫生电器具制造', 'C3955', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3956', '家用美容、保健电器具制造', 'C3956', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3957', '家用电力器具专用配件制造', 'C3957', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3959', '其他家用电力器具制造', 'C3959', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C396', '非电力家用器具制造', 'C396', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3961', '燃气、太阳能及类似能源的器具制造', 'C3961', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3969', '其他非电力家用器具制造', 'C3969', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C397', '照明器具制造', 'C397', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3971', '电光源制造', 'C3971', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3972', '照明灯具制造', 'C3972', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3979', '灯用电器附件及其他照明器具制造', 'C3979', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C399', '其他电器机械及器材制造', 'C399', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3991', '车辆专用照明及电气信号设备制造', 'C3991', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C3999', '其他未列明的电气机械制造', 'C3999', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C40', '通信设备、计算机及其他电子设备制造业', 'C40', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C401', '通信设备制造', 'C401', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4011', '通信传输设备制造', 'C4011', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4012', '通信交换设备制造', 'C4012', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4013', '通信终端设备制造', 'C4013', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4014', '移动通信及终端设备制造', 'C4014', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4019', '其他通信设备制造', 'C4019', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C402', '雷达及配套设备制造', 'C402', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4020', '雷达及配套设备制造', 'C4020', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C403', '广播电视设备制造', 'C403', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4031', '广播电视节目制作及发射设备制造', 'C4031', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4032', '广播电视接收设备及器材制造', 'C4032', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4039', '应用电视设备及其他广播电视设备制造', 'C4039', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C404', '电子计算机制造', 'C404', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4041', '电子计算机整机制造', 'C4041', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4042', '计算机网络设备制造', 'C4042', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4043', '电子计算机外部设备制造', 'C4043', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C405', '电子器件制造', 'C405', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4051', '电子真空器件制造', 'C4051', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4052', '半导体分立器件制造', 'C4052', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4053', '集成电路制造', 'C4053', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4059', '光电子器件及其他电子器件制造', 'C4059', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C406', '电子元件制造', 'C406', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4061', '电子元件及组件制造', 'C4061', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4062', '印制电路板制造', 'C4062', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C407', '家用视听设备制造', 'C407', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4071', '家用影视设备制造', 'C4071', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4072', '家用音响设备制造', 'C4072', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C409', '其他电子设备制造', 'C409', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4090', '其他电子设备制造', 'C4090', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C41', '仪器仪表及文化、办公用机械制造业', 'C41', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C411', '通用仪器仪表制造', 'C411', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4111', '工业自动控制系统装置制造', 'C4111', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4112', '电工仪器仪表制造', 'C4112', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4113', '绘图、计算及测量仪器制造', 'C4113', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4114', '实验分析仪器制造', 'C4114', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4115', '试验机制造', 'C4115', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4119', '供应用仪表及其他通用仪器制造', 'C4119', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C412', '专用仪器仪表制造', 'C412', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4121', '环境检测专用仪器仪表制造', 'C4121', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4122', '汽车及其他用技数仪表制造', 'C4122', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4123', '导航、气象及海洋专用仪器制造', 'C4123', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4124', '农林牧渔专用仪器仪表制造', 'C4124', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4125', '地质勘查和地震专用仪器制造', 'C4125', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4126', '教学专用仪器制造', 'C4126', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4127', '核子及核辐射测量仪器制造', 'C4127', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4128', '电子测量仪器制造', 'C4128', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4129', '其他专用仪器制造', 'C4129', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C413', '钟表与计时仪器制造', 'C413', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4130', '钟表与计时仪器制造', 'C4130', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C414', '光学仪器及眼镜制造', 'C414', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4141', '光学仪器制造', 'C4141', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4142', '眼镜制造', 'C4142', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C415', '文化、办公用机械制造', 'C415', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4151', '电影机械制造', 'C4151', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4152', '幻灯及投影设备制造', 'C4152', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4153', '照相机及器材制造', 'C4153', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4154', '复印和胶印设备制造', 'C4154', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4155', '计算机及货币专用设备制造', 'C4155', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4159', '其他文化、办公用机械制造', 'C4159', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C419', '其他仪器仪表的制造及修理', 'C419', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4190', '其他仪器仪表的制造及修理', 'C4190', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C42', '工艺品及其他制造业', 'C42', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C421', '工艺美术品制造', 'C421', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4211', '雕塑工艺品制造', 'C4211', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4212', '金属工艺品制造', 'C4212', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4213', '漆器工艺品制造', 'C4213', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4214', '花画工艺品制造', 'C4214', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4215', '天然植物纤维编制工艺品制造', 'C4215', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4216', '抽纱刺绣工艺品制造', 'C4216', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4217', '地毯、挂毯制造', 'C4217', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4218', '珠宝首饰及有关物品的制造', 'C4218', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4219', '其他工艺美术品制造', 'C4219', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C422', '日用杂品制造', 'C422', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4221', '制镜及类似品加工', 'C4221', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4222', '鬓毛加工、制刷及清扫工具的制造', 'C4222', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4229', '其他日用杂品的制造', 'C4229', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C423', '煤制品制造', 'C423', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4230', '煤制品制造', 'C4230', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C424', '核辐射加工', 'C424', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4240', '核辐射加工', 'C4240', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C429', '其他未列明的制造业', 'C429', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4290', '其他未列明的制造业', 'C4290', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C43', '废弃资源和废旧材料回收加工业', 'C43', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C431', '金属废料和碎屑的加工处理', 'C431', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4310', '金属废料和碎屑的加工处理', 'C4310', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C432', '非金属废料和碎屑的加工处理', 'C432', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'C4320', '非金属废料和碎屑的加工处理', 'C4320', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'D', '电力、燃气及水的生产和供应业', 'D', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'D44', '电力、热力的生产和供应业', 'D44', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'D441', '电力生产', 'D441', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'D4411', '火力发电', 'D4411', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'D4412', '水力发电', 'D4412', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'D4413', '核力发电', 'D4413', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'D4419', '其他能源发电', 'D4419', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'D442', '电力供应', 'D442', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'D4420', '电力供应', 'D4420', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'D443', '热力生产和供应', 'D443', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'D4430', '热力生产和供应', 'D4430', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'D45', '燃气生产和供应业', 'D45', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'D450', '燃气生产和供应业', 'D450', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'D4500', '燃气生产和供应业', 'D4500', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'D46', '水的生产和供应业', 'D46', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'D461', '自来水的生产和供应', 'D461', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'D4610', '自来水的生产和供应', 'D4610', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'D462', '污水处理及其再生利用', 'D462', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'D4620', '污水处理及其再生利用', 'D4620', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'D469', '其他水的处理、利用与分配', 'D469', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'D4690', '其他水的处理、利用与分配', 'D4690', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E', '建筑业', 'E', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E47', '房屋和土木工程建筑业', 'E47', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E471', '房屋工程建筑', 'E471', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E4710', '房屋工程建筑', 'E4710', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E472', '土木工程建筑', 'E472', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E4721', '铁路、道路、隧道和桥梁工程建筑', 'E4721', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E4722', '水利和港口工程建筑', 'E4722', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E4723', '工矿工程建筑', 'E4723', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E4724', '架线和管道工程建筑', 'E4724', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E4729', '其他土木工程建筑', 'E4729', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E48', '建筑安装业', 'E48', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E480', '建筑安装业', 'E480', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E4800', '建筑安装业', 'E4800', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E49', '建筑装饰业', 'E49', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E490', '建筑装饰业', 'E490', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E4900', '建筑装饰业', 'E4900', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E50', '其他建筑业', 'E50', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E501', '工程准备', 'E501', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E5010', '工程准备', 'E5010', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E502', '提供施工设备服务', 'E502', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E5020', '提供施工设备服务', 'E5020', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E509', '其他未列明的建筑活动', 'E509', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'E5090', '其他未列明的建筑活动', 'E5090', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F', '交通运输、仓储和邮政业', 'F', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F51', '铁路运输业', 'F51', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F511', '铁路旅客运输', 'F511', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5110', '铁路旅客运输', 'F5110', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F512', '铁路货物运输', 'F512', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5120', '铁路货物运输', 'F5120', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F513', '铁路运输辅助活动', 'F513', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5131', '客运火车站', 'F5131', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5132', '货运火车站', 'F5132', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5139', '其他铁路运输辅助活动', 'F5139', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F52', '道路运输业', 'F52', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F521', '公路旅客运输', 'F521', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5210', '公路旅客运输', 'F5210', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F522', '道路货物运输', 'F522', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5220', '道路货物运输', 'F5220', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F523', '道路运输辅助活动', 'F523', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5231', '客运汽车站', 'F5231', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5232', '公路管理与养护', 'F5232', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5239', '其他道路运输辅助活动', 'F5239', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F53', '城市公共交通业', 'F53', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F531', '公共电汽车客运', 'F531', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5310', '公共电汽车客运', 'F5310', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F532', '轨道交通', 'F532', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5320', '轨道交通', 'F5320', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F533', '出租车客运', 'F533', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5330', '出租车客运', 'F5330', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F534', '城市轮渡', 'F534', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5340', '城市轮渡', 'F5340', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F539', '其他城市公共交通', 'F539', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5390', '其他城市公共交通', 'F5390', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F54', '水上运输业', 'F54', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F541', '水上旅客运输', 'F541', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5411', '远洋旅客运输', 'F5411', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5412', '沿海旅客运输', 'F5412', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5413', '内河旅客运输', 'F5413', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F542', '水上货物运输', 'F542', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5421', '远洋货物运输', 'F5421', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5422', '沿海货物运输', 'F5422', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5423', '内河货物运输', 'F5423', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F543', '水上运输辅助活动', 'F543', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5431', '客运港口', 'F5431', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5432', '货运港口', 'F5432', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5439', '其他水上运输辅助活动', 'F5439', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F55', '航空运输业', 'F55', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F551', '航空客货运输', 'F551', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5511', '航空旅客运输', 'F5511', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5512', '航空货物运输', 'F5512', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F552', '通用航空服务', 'F552', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5520', '通用航空服务', 'F5520', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F553', '航空运输辅助活动', 'F553', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5531', '机场', 'F5531', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5532', '空中交通管理', 'F5532', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5539', '其他航空运输辅助活动', 'F5539', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F56', '管道运输业', 'F56', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F560', '管道运输业', 'F560', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5600', '管道运输业', 'F5600', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F57', '装卸搬运和其他运输服务业', 'F57', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F571', '装卸搬运', 'F571', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5710', '装卸搬运', 'F5710', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F572', '运输代理服务', 'F572', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5720', '运输代理服务', 'F5720', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F58', '仓储业', 'F58', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F581', '谷物、棉花等农产品仓储', 'F581', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5810', '谷物、棉花等农产品仓储', 'F5810', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F589', '其他仓储', 'F589', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5890', '其他仓储', 'F5890', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F59', '邮政业', 'F59', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F591', '国家邮政', 'F591', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5910', '国家邮政', 'F5910', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F599', '其他邮递服务', 'F599', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'F5990', '其他邮递服务', 'F5990', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G', '信息传输、计算机服务和软件业', 'G', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G60', '电信和其他信息传输服务业', 'G60', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G601', '电信', 'G601', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G6011', '固定电信服务', 'G6011', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G6012', '移动电信服务', 'G6012', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G6019', '其他电信服务', 'G6019', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G602', '互联网信息服务', 'G602', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G6020', '互联网信息服务', 'G6020', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G603', '广播电视传输服务', 'G603', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G6031', '有线广播电视传输服务', 'G6031', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G6032', '无线广播电视传输服务', 'G6032', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G604', '卫星传输服务', 'G604', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G6040', '卫星传输服务', 'G6040', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G61', '计算机服务业', 'G61', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G611', '计算机系统服务', 'G611', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G6110', '计算机系统服务', 'G6110', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G612', '数据处理', 'G612', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G6120', '数据处理', 'G6120', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G613', '计算机维修', 'G613', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G6130', '计算机维修', 'G6130', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G619', '其他计算机服务', 'G619', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G6190', '其他计算机服务', 'G6190', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G62', '软件业', 'G62', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G621', '公共软件服务', 'G621', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G6211', '基础软件服务', 'G6211', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G6212', '应用软件服务', 'G6212', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G629', '其他软件服务', 'G629', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'G6290', '其他软件服务', 'G6290', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H', '批发和零售业', 'H', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H63', '批发业', 'H63', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H631', '农畜产品批发', 'H631', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6311', '谷物、豆及薯类批发', 'H6311', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6312', '种子、饲料批发', 'H6312', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6313', '棉、麻批发', 'H6313', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6314', '牲畜批发', 'H6314', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6319', '其他农畜产品批发', 'H6319', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H632', '食品、饮料及烟草制品批发', 'H632', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6321', '米、面制品及食用油批发', 'H6321', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6322', '糕点、糖果及糖批发', 'H6322', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6323', '果品、蔬菜批发', 'H6323', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6324', '肉、禽、蛋及水产品批发', 'H6324', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6325', '盐及调味品批发', 'H6325', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6326', '饮料及茶叶批发', 'H6326', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6327', '烟草制品批发', 'H6327', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6329', '其他食品批发', 'H6329', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H633', '纺织、服装及日用品批发', 'H633', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6331', '纺织品、针织品及原料批发', 'H6331', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6332', '服装批发', 'H6332', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6333', '鞋帽批发', 'H6333', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6334', '厨房、卫生间用具及日用杂活批发', 'H6334', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6335', '化妆品及卫生用品批发', 'H6335', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6339', '其他日用品批发', 'H6339', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H634', '文化、体育用品及器材批发', 'H634', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6341', '文具用品批发', 'H6341', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6342', '体育用品批发', 'H6342', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6343', '图书批发', 'H6343', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6344', '报刊批发', 'H6344', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6345', '音响制品及电子出版物批发', 'H6345', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6346', '首饰、工艺品及收藏品批发', 'H6346', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6349', '其他文化用品批发', 'H6349', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H635', '医药及医疗器材批发', 'H635', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6351', '西药批发', 'H6351', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6352', '中药材及中成药批发', 'H6352', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6353', '医疗用品及器材批发', 'H6353', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H636', '矿产品、建材及化工产品批发', 'H636', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6361', '煤炭及制品批发', 'H6361', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6362', '石油及制品批发', 'H6362', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6363', '非金属矿及制品批发', 'H6363', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6364', '金属及金属矿批发', 'H6364', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6365', '建材批发', 'H6365', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6366', '化肥批发', 'H6366', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6367', '农药批发', 'H6367', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6368', '农用薄膜批发', 'H6368', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6369', '其他化工产品批发', 'H6369', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H637', '机械设备、五金交电及电子产品批发', 'H637', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6371', '农业机械批发', 'H6371', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6372', '汽车、摩托车及零配件批发', 'H6372', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6373', '五金、交电批发', 'H6373', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6374', '家用电器批发', 'H6374', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6375', '计算机、软件及辅助设备批发', 'H6375', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6376', '通讯及广播电视设备批发', 'H6376', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6379', '其他机械设备及电子产品批发', 'H6379', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H638', '贸易经纪与代理', 'H638', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6380', '贸易经纪与代理', 'H6380', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H639', '其他批发', 'H639', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6391', '再生物资回收与批发', 'H6391', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6399', '其他未列明的批发', 'H6399', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H65', '零售业', 'H65', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H651', '综合零售', 'H651', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6511', '百货零售', 'H6511', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6512', '超级市场零售', 'H6512', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6519', '其他综合零售', 'H6519', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H652', '食品、饮料及烟草制品专门销售', 'H652', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6521', '粮油批发', 'H6521', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6522', '糕点、面包零售', 'H6522', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6523', '果品、蔬菜零售', 'H6523', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6524', '肉、禽、蛋及水产品零售', 'H6524', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6525', '饮料及茶叶零售', 'H6525', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6526', '烟草制品零售', 'H6526', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6529', '其他食品零售', 'H6529', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H653', '纺织、服装及日用品专门零售', 'H653', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6531', '纺织品、针织品零售', 'H6531', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6532', '服装零售', 'H6532', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6533', '鞋帽零售', 'H6533', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6534', '钟表、眼镜零售', 'H6534', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6535', '化妆品及卫生用品零售', 'H6535', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6539', '其他日用用品零售', 'H6539', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H654', '文化、体育用品及器材专门零售', 'H654', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6541', '文具用品零售', 'H6541', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6542', '体育用品零售', 'H6542', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6543', '图书零售', 'H6543', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6544', '报刊零售', 'H6544', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6545', '音响制品及电子出版物零售', 'H6545', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6546', '珠宝首饰零售', 'H6546', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6547', '工艺美术品及收藏品零售', 'H6547', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6548', '照相器材零售', 'H6548', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6549', '其他文化用品零售', 'H6549', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H655', '医药及医疗器材专门零售', 'H655', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6551', '药品零售', 'H6551', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6552', '医疗用品及器材零售', 'H6552', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H656', '汽车、摩托车、燃料及零配件专门零售', 'H656', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6561', '汽车零售', 'H6561', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6562', '汽车零配件零售', 'H6562', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6563', '摩托车及零配件零售', 'H6563', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6564', '机动车燃料零售', 'H6564', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H657', '家用电器及电子产品专门零售', 'H657', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6571', '家用电器零售', 'H6571', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6572', '计算机、软件及辅助设备零售', 'H6572', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6573', '通信设备零售', 'H6573', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6579', '其他电子产品零售', 'H6579', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H658', '五金、家具及室内装修材料专门零售', 'H658', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6581', '五金零售', 'H6581', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6582', '家具零售', 'H6582', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6583', '涂料零售', 'H6583', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6589', '其他室内装修材料零售', 'H6589', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H659', '无店铺及其他零售', 'H659', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6591', '流动货摊零售', 'H6591', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6592', '邮购及电子销售', 'H6592', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6593', '生活用燃料零售', 'H6593', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6594', '花卉零售', 'H6594', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6595', '旧货零售', 'H6595', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'H6599', '其他未列明的零售', 'H6599', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'I', '住宿和餐饮业', 'I', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'I66', '住宿业', 'I66', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'I661', '旅游饭店', 'I661', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'I6610', '旅游饭店', 'I6610', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'I662', '一般旅馆', 'I662', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'I6620', '一般旅馆', 'I6620', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'I669', '其他住宿服务', 'I669', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'I6690', '其他住宿服务', 'I6690', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'I67', '餐饮业', 'I67', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'I671', '正餐服务', 'I671', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'I6710', '正餐服务', 'I6710', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'I672', '快餐服务', 'I672', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'I6720', '快餐服务', 'I6720', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'I673', '饮料及冷饮服务', 'I673', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'I6730', '饮料及冷饮服务', 'I6730', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'I679', '其他餐饮服务', 'I679', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'I6790', '其他餐饮服务', 'I6790', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J', '金融业', 'J', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J68', '银行业', 'J68', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J681', '中央银行', 'J681', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J6810', '中央银行', 'J6810', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J682', '商业银行', 'J682', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J6820', '商业银行', 'J6820', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J689', '其他银行', 'J689', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J6890', '其他银行', 'J6890', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J69', '证券业', 'J69', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J691', '证券市场管理', 'J691', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J6910', '证券市场管理', 'J6910', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J692', '证券经纪与交易', 'J692', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J6920', '证券经纪与交易', 'J6920', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J693', '证券投资', 'J693', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J6930', '证券投资', 'J6930', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J694', '证券分析与咨询', 'J694', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J6940', '证券分析与咨询', 'J6940', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J70', '保险业', 'J70', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J701', '人寿保险', 'J701', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J7010', '人寿保险', 'J7010', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J702', '非人寿保险', 'J702', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J7020', '非人寿保险', 'J7020', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J703', '保险辅助服务', 'J703', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J7030', '保险辅助服务', 'J7030', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J71', '其他金融活动', 'J71', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J711', '金融信托与管理', 'J711', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J7110', '金融信托与管理', 'J7110', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J712', '金融租赁', 'J712', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J7120', '金融租赁', 'J7120', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J713', '财务公司', 'J713', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J7130', '财务公司', 'J7130', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J714', '邮政储蓄', 'J714', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J7140', '邮政储蓄', 'J7140', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J715', '典当', 'J715', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J7150', '典当', 'J7150', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J719', '其他未列明的金融活动', 'J719', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'J7190', '其他未列明的金融活动', 'J7190', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'K', '房地产业', 'K', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'K72', '房地产业', 'K72', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'K721', '房地产开发经营', 'K721', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'K7210', '房地产开发经营', 'K7210', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'K722', '物业管理', 'K722', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'K7220', '物业管理', 'K7220', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'K723', '房地产中介服务', 'K723', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'K7230', '房地产中介服务', 'K7230', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'K729', '其他房地产活动', 'K729', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'K7290', '其他房地产活动', 'K7290', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L', '租赁和商务服务业', 'L', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L73', '租赁业', 'L73', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L731', '机械设备租赁', 'L731', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7311', '汽车租赁', 'L7311', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7312', '农业机械租赁', 'L7312', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7313', '建筑工程机械与设备租赁', 'L7313', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7314', '计算机及通讯设备租赁', 'L7314', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7319', '其他机械与设备租赁', 'L7319', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L732', '文化及日用品出租', 'L732', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7321', '图书及音响制品出租', 'L7321', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7329', '其他文化及日用品出租', 'L7329', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L74', '商务服务业', 'L74', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L741', '企业管理服务', 'L741', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7411', '企业管理机构', 'L7411', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7412', '投资与资产管理', 'L7412', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7419', '其他企业管理服务', 'L7419', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L742', '法律服务', 'L742', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7421', '律师及相关的法律服务', 'L7421', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7422', '公证服务', 'L7422', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7429', '其他法律服务', 'L7429', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L743', '咨询与调查', 'L743', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7431', '会计、审计及税务服务', 'L7431', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7432', '市场调查', 'L7432', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7433', '社会经济咨询', 'L7433', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7439', '其他专业咨询', 'L7439', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L744', '广告业', 'L744', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7440', '广告业', 'L7440', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L745', '知识产权服务', 'L745', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7450', '知识产权服务', 'L7450', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L746', '职业中介服务', 'L746', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7460', '职业中介服务', 'L7460', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L747', '市场管理', 'L747', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7470', '市场管理', 'L7470', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L748', '旅行社', 'L748', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7480', '旅行社', 'L7480', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L749', '其他商务服务', 'L749', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7491', '会议及展览服务', 'L7491', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7492', '包装服务', 'L7492', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7493', '保安服务', 'L7493', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7494', '办公服务', 'L7494', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'L7499', '其他未列明的商务服务', 'L7499', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M', '科学研究、技术服务和地质勘查业', 'M', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M75', '研究与试验发展', 'M75', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M751', '自然科学研究与试验发展', 'M751', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7510', '自然科学研究与试验发展', 'M7510', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M752', '工程和技术研究与试验发展', 'M752', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7520', '工程和技术研究与试验发展', 'M7520', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M753', '农业科学研究与试验发展', 'M753', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7530', '农业科学研究与试验发展', 'M7530', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M754', '医学研究与试验发展', 'M754', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7540', '医学研究与试验发展', 'M7540', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M755', '社会人文科学研究与试验发展', 'M755', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7550', '社会人文科学研究与试验发展', 'M7550', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M76', '专业技术服务业', 'M76', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M761', '气象服务', 'M761', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7610', '气象服务', 'M7610', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M762', '地震服务', 'M762', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7620', '地震服务', 'M7620', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M763', '海洋服务', 'M763', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7630', '海洋服务', 'M7630', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M764', '测绘服务', 'M764', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7640', '测绘服务', 'M7640', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M765', '技术检测', 'M765', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7650', '技术检测', 'M7650', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M766', '环境检测', 'M766', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7660', '环境检测', 'M7660', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M767', '工程技术与规划管理', 'M767', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7671', '工程管理服务', 'M7671', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7672', '工程勘查设计', 'M7672', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7673', '规划管理', 'M7673', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M769', '其他专业技术服务', 'M769', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7690', '其他专业技术服务', 'M7690', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M77', '科技交流和推广服务业', 'M77', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M771', '技术推广服务', 'M771', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7710', '技术推广服务', 'M7710', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M772', '科技中介服务', 'M772', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7720', '科技中介服务', 'M7720', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M779', '其他科技服务', 'M779', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7790', '其他科技服务', 'M7790', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M78', '地质勘查业', 'M78', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M781', '矿产地质勘查', 'M781', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7811', '能源矿产地质勘查', 'M7811', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7812', '固体矿产地质勘查', 'M7812', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7819', '其他矿产地质勘查', 'M7819', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M782', '基础地址勘查', 'M782', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7820', '基础地址勘查', 'M7820', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M783', '地址勘查技术服务', 'M783', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'M7830', '地址勘查技术服务', 'M7830', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N', '水利、环境和公共设施管理业', 'N', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N79', '水利管理业', 'N79', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N791', '防洪管理', 'N791', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N7910', '防洪管理', 'N7910', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N792', '水资源管理', 'N792', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N7921', '水库管理', 'N7921', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N7922', '调水、引水管理', 'N7922', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N7929', '其他水资源管理', 'N7929', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N799', '其他水利管理', 'N799', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N7990', '其他水利管理', 'N7990', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N80', '环境管理业', 'N80', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N801', '自然保护', 'N801', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N8011', '自然保护区管理', 'N8011', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N8012', '野生动植物保护', 'N8012', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N8019', '其他自然保护', 'N8019', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N802', '环境治理', 'N802', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N8021', '城市市容管理', 'N8021', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N8022', '城市环境卫生管理', 'N8022', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N8023', '水污染治理', 'N8023', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N8024', '危险废物管理', 'N8024', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N8029', '其他环境治理', 'N8029', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N81', '公共设施管理业', 'N81', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N811', '市政公共设施管理', 'N811', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N8110', '市政公共设施管理', 'N8110', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N812', '城市绿化管理', 'N812', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N8120', '城市绿化管理', 'N8120', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N813', '游览景区管理', 'N813', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N8131', '风景名胜区管理', 'N8131', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N8132', '公园管理', 'N8132', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'N8139', '其他游览景区管理', 'N8139', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O', '居民服务和其他服务业', 'O', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O82', '居民服务业', 'O82', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O821', '家庭服务', 'O821', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O8210', '家庭服务', 'O8210', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O822', '托儿所', 'O822', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O8220', '托儿所', 'O8220', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O823', '洗染服务', 'O823', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O8230', '洗染服务', 'O8230', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O824', '理发及美容保健服务', 'O824', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O8240', '理发及美容保健服务', 'O8240', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O825', '洗浴服务', 'O825', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O8250', '洗浴服务', 'O8250', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O826', '婚姻服务', 'O826', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O8260', '婚姻服务', 'O8260', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O827', '殡葬服务', 'O827', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O8270', '殡葬服务', 'O8270', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O828', '摄影扩印服务', 'O828', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O8280', '摄影扩印服务', 'O8280', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O829', '其他居民服务', 'O829', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O8290', '其他居民服务', 'O8290', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O83', '其他服务业', 'O83', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O831', '修理与维护', 'O831', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O8311', '汽车、摩托车维护与保养', 'O8311', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O8312', '办公设备维修', 'O8312', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O8313', '家用电器维修', 'O8313', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O8319', '其他日用品维修', 'O8319', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O832', '清洁服务', 'O832', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O8321', '建筑物清洁服务', 'O8321', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O8329', '其他清洁服务', 'O8329', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O839', '其他未列明服务', 'O839', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'O8390', '其他未列明服务', 'O8390', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'P', '教育', 'P', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'P84', '教育', 'P84', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'P841', '学前教育', 'P841', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'P8410', '学前教育', 'P8410', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'P842', '初等教育', 'P842', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'P8420', '初等教育', 'P8420', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'P843', '中等教育', 'P843', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'P8431', '初中教育', 'P8431', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'P8432', '高中教育', 'P8432', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'P8433', '中等专业教育', 'P8433', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'P8434', '职业中学教育', 'P8434', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'P8435', '技工学校教育', 'P8435', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'P8439', '其他中等教育', 'P8439', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'P844', '高等教育', 'P844', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'P8441', '普通高等教育', 'P8441', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'P8442', '成人高等教育', 'P8442', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'P849', '其他教育', 'P849', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'P8491', '职业技能培训', 'P8491', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'P8492', '特殊教育', 'P8492', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'P8499', '其他未列明的教育', 'P8499', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q', '卫生、社会保障和社会福利业', 'Q', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q85', '卫生', 'Q85', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q851', '医院', 'Q851', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q8511', '综合医院', 'Q8511', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q8512', '中医医院', 'Q8512', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q8513', '中西医结合医院', 'Q8513', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q8514', '民族医院', 'Q8514', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q8515', '专科医院', 'Q8515', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q8516', '疗养院', 'Q8516', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q852', '卫生院及社区医疗活动', 'Q852', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q8520', '卫生院及社区医疗活动', 'Q8520', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q853', '门诊部医疗活动', 'Q853', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q8530', '门诊部医疗活动', 'Q8530', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q854', '计划生育技术服务活动', 'Q854', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q8540', '计划生育技术服务活动', 'Q8540', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q855', '妇幼保健活动', 'Q855', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q8550', '妇幼保健活动', 'Q8550', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q856', '专科疾病防治活动', 'Q856', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q8560', '专科疾病防治活动', 'Q8560', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q857', '疾病预防控制及防疫活动', 'Q857', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q8570', '疾病预防控制及防疫活动', 'Q8570', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q859', '其他卫生活动', 'Q859', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q8590', '其他卫生活动', 'Q8590', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q86', '社会保障业', 'Q86', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q860', '社会保障业', 'Q860', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q8600', '社会保障业', 'Q8600', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q87', '社会福利业', 'Q87', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q871', '提供住宿的社会福利', 'Q871', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q8711', '干部休养所', 'Q8711', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q8712', '收养收容服务中心', 'Q8712', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q872', '不提供住宿的社会福利', 'Q872', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Q8720', '不提供住宿的社会福利', 'Q8720', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R', '文化、体育和娱乐业', 'R', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R88', '新闻出版业', 'R88', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R881', '新闻业', 'R881', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R8810', '新闻业', 'R8810', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R882', '出版业', 'R882', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R8821', '图书出版', 'R8821', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R8822', '报纸出版', 'R8822', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R8823', '期刊出版', 'R8823', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R8824', '音像制品出版', 'R8824', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R8825', '电子出版物出版', 'R8825', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R8829', '其他出版', 'R8829', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R89', '广播、电视、电影和音像业', 'R89', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R891', '广播', 'R891', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R8910', '广播', 'R8910', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R892', '电视', 'R892', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R8920', '电视', 'R8920', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R893', '电影', 'R893', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R8931', '电影制作和发行', 'R8931', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R8932', '电影放映', 'R8932', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R894', '音像制作', 'R894', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R8940', '音像制作', 'R8940', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R90', '文化艺术业', 'R90', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R901', '文艺创作与表演', 'R901', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R9010', '文艺创作与表演', 'R9010', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R902', '艺术表演场馆', 'R902', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R9020', '艺术表演场馆', 'R9020', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R903', '图书馆与档案馆', 'R903', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R9031', '图书馆', 'R9031', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R9032', '档案馆', 'R9032', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R904', '文物及文化保护', 'R904', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R9040', '文物及文化保护', 'R9040', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R905', '博物馆', 'R905', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R9050', '博物馆', 'R9050', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R906', '烈士陵园、纪念馆', 'R906', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R9060', '烈士陵园、纪念馆', 'R9060', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R907', '群众文化活动', 'R907', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R9070', '群众文化活动', 'R9070', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R908', '文化艺术经纪代理', 'R908', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R9080', '文化艺术经纪代理', 'R9080', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R909', '其他文化艺术', 'R909', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R9090', '其他文化艺术', 'R9090', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R91', '体育', 'R91', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R911', '体育组织', 'R911', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R9110', '体育组织', 'R9110', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R912', '体育场馆', 'R912', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R9120', '体育场馆', 'R9120', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R919', '其他体育', 'R919', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R9190', '其他体育', 'R9190', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R92', '娱乐业', 'R92', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R921', '室内娱乐活动', 'R921', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R9210', '室内娱乐活动', 'R9210', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R922', '游乐园', 'R922', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R9220', '游乐园', 'R9220', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R923', '休闲健身娱乐活动', 'R923', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R9230', '休闲健身娱乐活动', 'R9230', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R929', '其他娱乐活动', 'R929', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'R9290', '其他娱乐活动', 'R9290', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S', '公共管理和社会组织', 'S', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S93', '中国共产党机关', 'S93', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S930', '中国共产党机关', 'S930', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9300', '中国共产党机关', 'S9300', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S94', '国家机构', 'S94', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S941', '国家权力机构', 'S941', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9410', '国家权力机构', 'S9410', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S942', '国家行政机构', 'S942', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9421', '综合事务管理机构', 'S9421', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9422', '对外事务管理机构', 'S9422', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9423', '公共安全管理机构', 'S9423', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9424', '社会事务管理机构', 'S9424', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9425', '经济事务管理机构', 'S9425', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9426', '政府事务管理机构', 'S9426', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9427', '行政监督检查机构', 'S9427', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S943', '人民法院和人民检察院', 'S943', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9431', '人民法院', 'S9431', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9432', '人民检察院', 'S9432', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S949', '其他国家机构', 'S949', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9490', '其他国家机构', 'S9490', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S95', '人民政协和民主党派', 'S95', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S951', '人民政协', 'S951', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9510', '人民政协', 'S9510', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S952', '民主党派', 'S952', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9520', '民主党派', 'S9520', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S96', '群众团体、社会团体和宗教组织', 'S96', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S961', '群众团体', 'S961', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9611', '工会', 'S9611', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9612', '妇联', 'S9612', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9613', '共青团', 'S9613', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9619', '其他群众团体', 'S9619', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S962', '社会团体', 'S962', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9621', '专业性团体', 'S9621', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9622', '行业行团体', 'S9622', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9629', '其他社会团体', 'S9629', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S963', '宗教组织', 'S963', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9630', '宗教组织', 'S9630', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S97', '基层群众自治组织', 'S97', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S971', '社区自治组织', 'S971', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9710', '社区自治组织', 'S9710', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S972', '村民自治组织', 'S972', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'S9720', '村民自治组织', 'S9720', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'T', '国际组织', 'T', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'T98', '国际组织', 'T98', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'T980', '国际组织', 'T980', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'T9800', '国际组织', 'T9800', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Z', '待定', 'Z', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Z99', '待定', 'Z99', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Z999', '待定', 'Z999', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CountryIndustry', 'Z9999', '待定', 'Z9999', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CustomerType', '01', '公司客户', '01', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CustomerType', '02', '个人客户', '02', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('CustomerType', '03', '同业客户', '03', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('EducationExperience', '10', '研究生', '10', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('EducationExperience', '20', '大学本科', '20', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('EducationExperience', '30', '大学专科', '30', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('EducationExperience', '40', '中专/中等技校', '40', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('EducationExperience', '50', '技术学校', '50', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('EducationExperience', '60', '高中', '60', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('EducationExperience', '70', '初中', '70', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('EducationExperience', '80', '小学', '80', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('EducationExperience', '90', '文盲或半文盲', '90', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('EducationExperience', '99', '未知', '99', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A', '农、林、牧、渔业', 'A', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A01', '农业', 'A01', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A011', '谷类及其他作物的种植', 'A011', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0111', '谷物的种植', 'A0111', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0112', '薯类的种植', 'A0112', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0113', '油料的种植', 'A0113', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0114', '豆类的种植', 'A0114', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0115', '棉花的种植', 'A0115', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0116', '麻类的种植', 'A0116', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0117', '糖料的种植', 'A0117', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0118', '烟草的种植', 'A0118', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0119', '其他作物的种植', 'A0119', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A012', '蔬菜、园艺作物的种植', 'A012', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0121', '蔬菜的种植', 'A0121', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0122', '花卉的种植', 'A0122', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0123', '其他园艺作物的种植', 'A0123', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A013', '水果、坚果、饮料和香料作物的种植', 'A013', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0131', '水果、坚果、的种植', 'A0131', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0132', '茶及其他饮料的作物的种植', 'A0132', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0133', '香料作物的种植', 'A0133', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A014', '中药材的种植', 'A014', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0140', '中药材的种植', 'A0140', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A02', '林业', 'A02', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A021', '林木的培育和种植', 'A021', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0211', '育种和育苗', 'A0211', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0212', '造林', 'A0212', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0213', '林木的抚育和管理', 'A0213', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A022', '木材和竹材的采运', 'A022', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0221', '木材的采运', 'A0221', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0222', '竹材的采运', 'A0222', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A023', '林产品的采集', 'A023', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0230', '林产品的采集', 'A0230', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A03', '畜牧业', 'A03', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A031', '牲畜的饲养', 'A031', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0310', '牲畜的饲养', 'A0310', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0320', '猪的饲养', 'A0320', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A033', '家禽的饲养', 'A033', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0330', '家禽的饲养', 'A0330', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A034', '狩猎和捕捉动物', 'A034', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0340', '狩猎和捕捉动物', 'A0340', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A039', '其他畜牧业', 'A039', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0390', '其他畜牧业', 'A0390', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A04', '渔业', 'A04', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A041', '海洋渔业', 'A041', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0411', '海水养殖', 'A0411', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0412', '海水捕捞', 'A0412', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A042', '内陆渔业', 'A042', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0421', '内陆养殖', 'A0421', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0422', '内陆捕捞', 'A0422', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A05', '农、林、牧、渔服务业', 'A05', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A051', '农业服务业', 'A051', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0511', '灌溉服务', 'A0511', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0512', '农产品初加工', 'A0512', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0519', '其他农业服务', 'A0519', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A052', '林业服务业', 'A052', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0520', '林业服务业', 'A0520', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A053', '畜牧服务业', 'A053', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0531', '兽医服务', 'A0531', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0539', '其他畜牧服务', 'A0539', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A054', '渔业服务业', 'A054', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A0540', '渔业服务业', 'A0540', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'A320', '猪的饲养', 'A320', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B', '采矿业', 'B', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B06', '煤炭开采和洗选业', 'B06', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B061', '烟煤和无烟煤的开采洗选', 'B061', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B0610', '烟煤和无烟煤的开采洗选', 'B0610', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B062', '褐煤的开采洗选', 'B062', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B0620', '褐煤的开采洗选', 'B0620', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B069', '其他煤炭采选', 'B069', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B0690', '其他煤炭采选', 'B0690', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B07', '石油和天然气开采业', 'B07', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B070', '天然原油和天然气开采', 'B070', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B0701', '天然原油和天然气开采', 'B0701', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B079', '与石油和天然气开采有关的服务活动', 'B079', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B0790', '与石油和天然气开采有关的服务活动', 'B0790', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B08', '黑色金属矿采选业', 'B08', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B081', '铁矿采选', 'B081', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B0810', '铁矿采选', 'B0810', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B089', '其他黑色金属矿采选', 'B089', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B0890', '其他黑色金属矿采选', 'B0890', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B09', '有色金属矿采选业', 'B09', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B091', '常用有色金属矿采选', 'B091', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B0911', '铜矿采选', 'B0911', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B0912', '铅锌矿采选', 'B0912', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B0913', '镍钴矿采选', 'B0913', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B0914', '锡矿采选', 'B0914', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B0915', '锑矿采选', 'B0915', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B0916', '铝矿采选', 'B0916', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B0917', '镁矿采选', 'B0917', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B0919', '其他常用有色金属矿采选', 'B0919', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B092', '贵金属矿采选', 'B092', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B0921', '金矿采选', 'B0921', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B0922', '银矿采选', 'B0922', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B0929', '其他贵金属矿采选', 'B0929', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B093', '稀有稀土金属矿采选', 'B093', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B0931', '钨钼矿采选', 'B0931', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B0932', '稀土金属矿采选', 'B0932', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B0933', '放射性金属矿采选', 'B0933', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B0939', '其他稀有金属矿采选', 'B0939', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B10', '非金属矿采选业', 'B10', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B101', '土砂石开采', 'B101', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B1011', '石灰石、石膏开采', 'B1011', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B1012', '建筑装饰用石开采', 'B1012', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B1013', '耐火土石开采', 'B1013', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B1019', '黏土及其他土沙石开采', 'B1019', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B102', '化学矿采选', 'B102', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B1020', '化学矿采选', 'B1020', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B103', '采盐', 'B103', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B1030', '采盐', 'B1030', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B109', '石棉及其他非金属矿采选', 'B109', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B1091', '石棉、云母矿采选', 'B1091', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B1092', '石墨、滑石采选', 'B1092', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B1093', '宝石、玉石采选', 'B1093', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B1099', '其他非金属矿采选', 'B1099', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B11', '其他采矿业', 'B11', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B110', '其他采矿业', 'B110', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'B1100', '其他采矿业', 'B1100', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C', '制造业', 'C', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C13', '农副食品加工业', 'C13', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C131', '谷物磨制', 'C131', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1310', '谷物磨制', 'C1310', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C132', '饲料加工', 'C132', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1320', '饲料加工', 'C1320', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C133', '植物油加工', 'C133', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1331', '食用植物油', 'C1331', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1332', '非食用植物油', 'C1332', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C134', '制糖', 'C134', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1340', '制糖', 'C1340', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C135', '屠宰及肉类加工', 'C135', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1351', '畜禽屠宰', 'C1351', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1352', '肉制品及副产品屠宰', 'C1352', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C136', '水产品加工', 'C136', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1361', '水产品冷冻加工', 'C1361', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1362', '鱼麋制品及水产品干腌制食品', 'C1362', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1363', '水产饲料加工', 'C1363', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1364', '鱼油提取及制品制造', 'C1364', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1369', '其他水产品加工', 'C1369', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C137', '蔬菜、水果和坚果加工', 'C137', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1370', '蔬菜、水果和坚果加工', 'C1370', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C139', '其他农副食品加工', 'C139', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1391', '淀粉及淀粉制品的制造', 'C1391', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1392', '豆制品制造', 'C1392', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1393', '蛋品加工', 'C1393', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1399', '其他未列明的农副食品加工', 'C1399', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C14', '食品制造业', 'C14', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C141', '焙烤食品制造', 'C141', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1411', '糕点、面包制造', 'C1411', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1419', '饼干及其他培烤食品', 'C1419', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C142', '糖果、巧克力及蜜饯制造', 'C142', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1421', '糖果、巧克力制造', 'C1421', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1422', '蜜饯制造', 'C1422', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C143', '方便食品制造', 'C143', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1431', '米、面制品制造', 'C1431', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1432', '速冻食品制造', 'C1432', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1439', '方便面及其食品制造', 'C1439', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C144', '液体乳及乳制品制造', 'C144', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1440', '液体乳及乳制品制造', 'C1440', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C145', '罐头制造', 'C145', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1451', '肉、禽类罐头制造', 'C1451', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1452', '水产品罐头制造', 'C1452', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1453', '蔬菜、水果罐头制造', 'C1453', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1459', '其他罐头食品制造', 'C1459', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C146', '调味品、发酵制品制造', 'C146', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1461', '味精制造', 'C1461', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1462', '酱油、食醋及类似制品的制造', 'C1462', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1469', '其他调味品、发酵制品制造', 'C1469', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C149', '其他食品制造', 'C149', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1491', '营养、保健食品制造', 'C1491', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1492', '冷冻饮品及食用冰制造', 'C1492', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1493', '盐加工', 'C1493', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1494', '食品及饲料添加剂制造', 'C1494', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1499', '其他未列明的食品制造', 'C1499', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C15', '饮料制造业', 'C15', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C151', '酒精制造', 'C151', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1510', '酒精制造', 'C1510', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C152', '酒的制造', 'C152', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1521', '白酒制造', 'C1521', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1522', '啤酒制造', 'C1522', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1523', '黄酒制造', 'C1523', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1524', '葡萄酒制造', 'C1524', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1529', '其他酒制造', 'C1529', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C153', '软饮料制造', 'C153', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1531', '碳酸饮料制造', 'C1531', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1532', '瓶(罐)装饮用水制造', 'C1532', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1533', '果蔬汁及果菜汁饮料制造', 'C1533', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1534', '含乳饮料和植物蛋白饮料制造', 'C1534', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1535', '固体饮料制造', 'C1535', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1539', '茶饮料及其他软饮料制造', 'C1539', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C154', '精致茶加工', 'C154', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1540', '精致茶加工', 'C1540', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C16', '烟草制品业', 'C16', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C161', '烟叶复烤', 'C161', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1610', '烟叶复烤', 'C1610', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C162', '卷烟制造', 'C162', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1620', '卷烟制造', 'C1620', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C169', '其他烟草制品加工', 'C169', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1690', '其他烟草制品加工', 'C1690', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C17', '纺织业', 'C17', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C171', '棉、化纤纺织及印染精加工', 'C171', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1711', '棉、化纤纺织加工', 'C1711', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1712', '棉、化纤印染精加工', 'C1712', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C172', '毛纺织和染整精加工', 'C172', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1721', '毛条加工', 'C1721', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1722', '毛纺织', 'C1722', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1723', '毛染整精加工', 'C1723', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C173', '麻纺织', 'C173', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1730', '麻纺织', 'C1730', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C174', '丝绢纺织及精加工', 'C174', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1741', '剿丝加工', 'C1741', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1742', '绢纺及丝织加工', 'C1742', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1743', '丝印染精加工', 'C1743', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C175', '纺织制成品制造', 'C175', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1751', '棉及化纤制品制造', 'C1751', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1752', '毛制品制造', 'C1752', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1753', '麻制品制造', 'C1753', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1754', '丝制品制造', 'C1754', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1755', '绳索缆的制造', 'C1755', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1756', '纺织带和帘子布制造', 'C1756', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1757', '无纺布制造', 'C1757', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1759', '其他纺织制品制造', 'C1759', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C176', '针织品、编织品及其制品制造', 'C176', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1761', '棉、化纤针织品及编织品制造', 'C1761', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1762', '毛针织品及编织品制造', 'C1762', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1763', '丝针织品及编织品制造', 'C1763', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1769', '其他针织品及编织品制造', 'C1769', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C18', '纺织服装、鞋、帽制造业', 'C18', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C181', '纺织服装制造', 'C181', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1810', '纺织服装制造', 'C1810', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C182', '纺织面料鞋的制造', 'C182', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1820', '纺织面料鞋的制造', 'C1820', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C183', '制帽', 'C183', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1830', '制帽', 'C1830', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C19', '皮革、毛皮、羽毛(绒)及其制品业', 'C19', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C191', '皮革鞣制加工', 'C191', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1910', '皮革鞣制加工', 'C1910', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C192', '皮革制品制造', 'C192', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1921', '皮鞋制造', 'C1921', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1922', '皮革服装制造', 'C1922', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1923', '皮箱、包、带制造', 'C1923', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1924', '皮手套及皮装饰制品', 'C1924', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1929', '其他皮革制品制造', 'C1929', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C193', '毛皮鞣制及制品加工', 'C193', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1931', '毛皮鞣制加工', 'C1931', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1932', '毛皮服装加工', 'C1932', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1939', '其他毛皮制品加工', 'C1939', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C194', '羽毛(绒)加工及制品制造', 'C194', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1941', '羽毛(绒)加工', 'C1941', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C1942', '羽毛(绒)制品加工', 'C1942', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C20', '木材加工及木、竹、藤、棕、草制品业', 'C20', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C201', '锯材、木片加工', 'C201', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2011', '锯材加工', 'C2011', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2012', '木片加工', 'C2012', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C202', '人造板制造', 'C202', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2021', '胶合板制造', 'C2021', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2022', '纤维板制造', 'C2022', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2023', '刨花板制造', 'C2023', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2029', '其他人造板、材制造', 'C2029', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C203', '木制品制造', 'C203', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2031', '建筑用木料及木材组件加工', 'C2031', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2032', '木容器制造', 'C2032', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2039', '软木制品及其他木制品制造', 'C2039', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C204', '竹、藤、棕、草制品制造', 'C204', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2040', '竹、藤、棕、草制品制造', 'C2040', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C21', '家具制造业', 'C21', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C211', '木质家具制造', 'C211', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2110', '木质家具制造', 'C2110', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C212', '竹、藤家具制造', 'C212', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2120', '竹、藤家具制造', 'C2120', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C213', '金属家具制造', 'C213', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2130', '金属家具制造', 'C2130', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C214', '塑料家具制造', 'C214', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2140', '塑料家具制造', 'C2140', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C219', '其他家具制造', 'C219', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2190', '其他家具制造', 'C2190', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C22', '造纸及纸制品业', 'C22', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C221', '纸浆制造', 'C221', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2210', '纸浆制造', 'C2210', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C222', '造纸', 'C222', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2221', '机制纸及纸板制造', 'C2221', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2222', '手工纸制造', 'C2222', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2223', '加工纸制造', 'C2223', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C223', '纸制品制造', 'C223', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2231', '纸和纸板容器制造', 'C2231', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2239', '其他纸制品制造', 'C2239', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C23', '印刷业和记录媒介的复制', 'C23', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C231', '印刷', 'C231', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2311', '书、报、刊印刷', 'C2311', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2312', '本册印刷', 'C2312', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2319', '包装装潢及其印刷', 'C2319', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C232', '装订及其他印刷服务活动', 'C232', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2320', '装订及其他印刷服务活动', 'C2320', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C233', '记录媒介的服务', 'C233', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2330', '记录媒介的服务', 'C2330', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C24', '文教体育用品制造业', 'C24', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C241', '文化用品制造', 'C241', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2411', '文具制造', 'C2411', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2412', '笔的制造', 'C2412', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2413', '教学用模型及模具制造', 'C2413', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2414', '墨水、墨汁制造', 'C2414', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2419', '其他文化用品制造', 'C2419', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C242', '体育用品制造', 'C242', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2421', '球类制造', 'C2421', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2422', '体育器材及配件制造', 'C2422', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2423', '训练健身器材制造', 'C2423', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2424', '运动防护用具制造', 'C2424', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2429', '其他体育用品制造', 'C2429', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C243', '乐器制造', 'C243', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2431', '中乐器制造', 'C2431', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2432', '西乐器制造', 'C2432', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2433', '电子乐器制造', 'C2433', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2439', '其他乐器及零件制造', 'C2439', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C244', '玩具制造', 'C244', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2440', '玩具制造', 'C2440', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C245', '游艺器材及娱乐用品制造', 'C245', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2451', '露天游乐场所游艺设备制造', 'C2451', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2452', '游艺用品及室内游艺器材制造', 'C2452', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C25', '石油加工、炼焦及核燃料加工业', 'C25', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C251', '精练石油产品的制造', 'C251', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2511', '原油加工及石油制品制造', 'C2511', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2512', '人造原油生产', 'C2512', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C252', '炼焦', 'C252', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2520', '炼焦', 'C2520', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C253', '核燃料加工', 'C253', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2530', '核燃料加工', 'C2530', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C26', '化学原料及化学制品制造业', 'C26', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C261', '基础化学原料制造', 'C261', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2611', '无机酸制造', 'C2611', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2612', '无机碱制造', 'C2612', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2613', '无机盐制造', 'C2613', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2614', '有机化学原料制造', 'C2614', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2619', '其他基础化学原料制造', 'C2619', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C262', '肥料制造', 'C262', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2621', '氮肥制造', 'C2621', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2622', '磷肥制造', 'C2622', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2623', '钾肥制造', 'C2623', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2624', '复合肥料制造', 'C2624', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2625', '有机肥料及微生物肥料制造', 'C2625', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2629', '其他肥料制造', 'C2629', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C263', '农药制造', 'C263', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2631', '化学农药制造', 'C2631', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2632', '生物化学农药及微生物农药制造', 'C2632', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C264', '涂料、油墨、颜料及类似产品制造', 'C264', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2641', '涂料制造', 'C2641', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2642', '油墨及类似产品制造', 'C2642', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2643', '颜料制造', 'C2643', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2644', '染料制造', 'C2644', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2645', '密封用填料及类似品制造', 'C2645', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C265', '合成材料制造', 'C265', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2651', '初级形态的塑料及合成树脂制造', 'C2651', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2652', '合成橡胶制造', 'C2652', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2653', '合成纤维(单)聚合体的制造', 'C2653', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2659', '其他合成材料制品制造', 'C2659', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C266', '专用化学产品制造', 'C266', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2661', '化学制剂及助剂制造', 'C2661', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2662', '专项化学制品制造', 'C2662', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2663', '林产化学产品制造', 'C2663', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2664', '炸药及火工产品制造', 'C2664', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2665', '信息化学品制造', 'C2665', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2666', '环境污染处理专用药剂材料生产', 'C2666', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2667', '动物胶制造', 'C2667', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2669', '其他专用化学产品制造', 'C2669', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C267', '日用化学产品制造', 'C267', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2671', '肥皂及合成洗涤剂制造', 'C2671', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2672', '化妆品制造', 'C2672', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2673', '口腔清洁品用品制造', 'C2673', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2674', '香料、香精制造', 'C2674', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2679', '其他日用化妆产品制造', 'C2679', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C27', '医药制造业', 'C27', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C271', '化学药品原药制造', 'C271', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2710', '化学药品原药制造', 'C2710', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C272', '化学药品制剂制造', 'C272', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2720', '化学药品制剂制造', 'C2720', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C273', '中药饮品加工', 'C273', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2730', '中药饮品加工', 'C2730', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C274', '中成药制造', 'C274', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2740', '中成药制造', 'C2740', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C275', '兽用药品制造', 'C275', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2750', '兽用药品制造', 'C2750', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C276', '生物、生化制品的制造', 'C276', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2760', '生物、生化制品的制造', 'C2760', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C277', '卫生材料及医药用品制造', 'C277', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2770', '卫生材料及医药用品制造', 'C2770', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C28', '化学纤维制造业', 'C28', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C281', '纤维素纤维原料及纤维制造', 'C281', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2811', '化纤浆箔制造', 'C2811', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2812', '人造纤维', 'C2812', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C282', '合成纤维制造', 'C282', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2821', '锦纶纤维制造', 'C2821', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2822', '涤纶纤维制造', 'C2822', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2823', '晴纶纤维制造', 'C2823', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2824', '维纶纤维制造', 'C2824', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2829', '其他合成纤维制造', 'C2829', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C29', '橡胶制品业', 'C29', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C291', '轮胎制造', 'C291', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2911', '车辆、飞机及工程机械轮胎制造', 'C2911', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2912', '力车胎制造', 'C2912', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2913', '轮胎翻新制造', 'C2913', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C292', '橡胶板、管、带的制造', 'C292', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2920', '橡胶板、管、带的制造', 'C2920', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C293', '橡胶零件制造', 'C293', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2930', '橡胶零件制造', 'C2930', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C294', '再生橡胶制造', 'C294', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2940', '再生橡胶制造', 'C2940', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C295', '日用及医用橡胶制品制造', 'C295', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2950', '日用及医用橡胶制品制造', 'C2950', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C296', '橡胶靴鞋制造', 'C296', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2960', '橡胶靴鞋制造', 'C2960', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C299', '其他橡胶制品制造', 'C299', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C2990', '其他橡胶制品制造', 'C2990', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C30', '塑料制品业', 'C30', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C301', '塑料薄膜制造', 'C301', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3010', '塑料薄膜制造', 'C3010', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C302', '塑料板、管、型材的制造', 'C302', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3020', '塑料板、管、型材的制造', 'C3020', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C303', '塑料丝、绳及编织品的制造', 'C303', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3030', '塑料丝、绳及编织品的制造', 'C3030', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C304', '泡沫塑料制造', 'C304', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3040', '泡沫塑料制造', 'C3040', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C305', '塑料人造革、合成革制造', 'C305', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3050', '塑料人造革、合成革制造', 'C3050', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C306', '塑料包装箱及容器制造', 'C306', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3060', '塑料包装箱及容器制造', 'C3060', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C307', '塑料零件制造', 'C307', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3070', '塑料零件制造', 'C3070', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C308', '日用塑料制造', 'C308', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3081', '塑料鞋制造', 'C3081', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3082', '日用塑料制品制造', 'C3082', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C309', '其他塑料制品制造', 'C309', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3090', '其他塑料制品制造', 'C3090', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C31', '非金属矿物制品业', 'C31', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C311', '水泥、石灰和石膏的制造', 'C311', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3111', '水泥制造', 'C3111', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3112', '石灰和石膏制造', 'C3112', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C312', '水泥及石膏制品制造', 'C312', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3121', '水泥制品制造', 'C3121', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3122', '钢结构构件制造', 'C3122', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3123', '石棉水泥制品制造', 'C3123', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3124', '轻质水泥制品制造', 'C3124', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3129', '其他水泥制品制造', 'C3129', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C313', '砖瓦、石材及其他建筑材料制造', 'C313', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3131', '黏土砖瓦及建筑砌块制造', 'C3131', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3132', '建筑陶瓷制品制造', 'C3132', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3133', '建筑用石加工', 'C3133', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3134', '防水建筑材料加工', 'C3134', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3135', '隔热和隔音材料制造', 'C3135', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3139', '其他建筑材料制造', 'C3139', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C314', '玻璃及玻璃制品制造', 'C314', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3141', '平板玻璃制造', 'C3141', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3142', '技术玻璃制品制造', 'C3142', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3143', '光学玻璃制品制造', 'C3143', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3144', '玻璃仪器制造', 'C3144', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3145', '日用玻璃制品及玻璃包装容器制造', 'C3145', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3146', '玻璃保温容器制造', 'C3146', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3147', '玻璃纤维及制品制造', 'C3147', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3148', '玻璃纤维增强塑料制品制造', 'C3148', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3149', '其他玻璃制品制造', 'C3149', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C315', '陶瓷制品制造', 'C315', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3151', '卫生陶瓷制品制造', 'C3151', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3152', '特种陶瓷制品制造', 'C3152', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3153', '日用陶瓷制品制造', 'C3153', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3159', '园林、陈设艺术及其他陶瓷制品制造', 'C3159', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C316', '耐火材料制品制造', 'C316', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3161', '石棉制品制造', 'C3161', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3162', '云母制品制造', 'C3162', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3169', '耐火陶瓷制品及其他耐火材料制造', 'C3169', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C319', '石墨及其他非金属矿物制品制造', 'C319', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3191', '石墨及炭素制品制造', 'C3191', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3199', '其他非金属矿物制品制造', 'C3199', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C32', '黑色金属冶炼及压延加工业', 'C32', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C321', '炼铁', 'C321', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3210', '炼铁', 'C3210', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C322', '炼钢', 'C322', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3220', '炼钢', 'C3220', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C323', '钢压延加工', 'C323', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3230', '钢压延加工', 'C3230', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C324', '铁合金冶炼', 'C324', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3240', '铁合金冶炼', 'C3240', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C33', '有色金属冶炼及压延加工业', 'C33', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C331', '常用有色金属冶炼', 'C331', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3311', '铜冶炼', 'C3311', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3312', '铅锌冶炼', 'C3312', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3313', '镍钴冶炼', 'C3313', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3314', '锡冶炼', 'C3314', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3315', '锑冶炼', 'C3315', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3316', '铝冶炼', 'C3316', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3317', '镁冶炼', 'C3317', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3319', '其他常用有色金属冶炼', 'C3319', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C332', '贵金属冶炼', 'C332', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3321', '金冶炼', 'C3321', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3322', '银冶炼', 'C3322', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3329', '其他贵金属冶炼', 'C3329', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C333', '稀有稀土金属冶炼', 'C333', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3331', '钨钼冶炼', 'C3331', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3332', '稀土金属冶炼', 'C3332', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3339', '其他稀有金属冶炼', 'C3339', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C334', '有色金属合金制造', 'C334', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3340', '有色金属合金制造', 'C3340', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C335', '有色金属压延加工', 'C335', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3351', '常用有色金属压延加工', 'C3351', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3352', '贵金属压延加工', 'C3352', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3353', '稀有金属压延加工', 'C3353', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C34', '金属制品业', 'C34', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C341', '结构性金属制品制造', 'C341', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3411', '金属机构制造', 'C3411', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3412', '金属门窗制造', 'C3412', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C342', '金属工具制造', 'C342', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3421', '切削工具制造', 'C3421', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3422', '手工具制造', 'C3422', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3423', '农用及园林用金属工具制造', 'C3423', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3424', '刀剪及类似日用金属工具制造', 'C3424', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3429', '其他金属工具制造', 'C3429', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C343', '集装箱及金属包装容器制造', 'C343', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3431', '集装箱制造', 'C3431', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3432', '金属压力容器制造', 'C3432', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3433', '金属包装容器制造', 'C3433', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C344', '金属丝绳及其制品的制造', 'C344', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3440', '金属丝绳及其制品的制造', 'C3440', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C345', '建筑、安全用金属制品制造', 'C345', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3451', '建筑、家具用金属配件制造', 'C3451', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3452', '建筑装饰及水暖管道零件制造', 'C3452', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3453', '安全、消防用金属制品制造', 'C3453', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3459', '其他建筑、安全用金属制品制造', 'C3459', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C346', '金属表面处理及热处理加工', 'C346', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3460', '金属表面处理及热处理加工', 'C3460', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C347', '搪瓷制品制造', 'C347', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3471', '工业生产配套用搪瓷制品制造', 'C3471', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3472', '搪瓷卫生洁具制造', 'C3472', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3479', '搪瓷日用品及其他搪瓷制品制造', 'C3479', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C348', '不锈钢及类似日用金属制品制造', 'C348', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3481', '金属制厨房调理及卫生器具制造', 'C3481', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3482', '金属制厨用器具及餐具制造', 'C3482', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3489', '其他日用金属制品制造', 'C3489', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C349', '其他金属制品制造', 'C349', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3491', '铸币及贵金属制实验室用品制造', 'C3491', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3499', '其他未列明的金属制品制造', 'C3499', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C35', '通用设备制造业', 'C35', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C351', '锅炉及原动机制造', 'C351', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3511', '锅炉及辅助设备制造', 'C3511', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3512', '内燃机及配件制造', 'C3512', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3513', '汽轮机及辅机制造', 'C3513', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3514', '水轮机及辅机制造', 'C3514', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3519', '其他原动机制造', 'C3519', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C352', '金属加工机械制造', 'C352', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3521', '金属切削机床制造', 'C3521', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3522', '金属成型机床制造', 'C3522', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3523', '铸造机械制造', 'C3523', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3524', '金属切割及焊接设备制造', 'C3524', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3525', '机床附件制造', 'C3525', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3529', '其他金属加工机械制造', 'C3529', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C353', '起重运输设备制造', 'C353', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3530', '起重运输设备制造', 'C3530', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C354', '泵、阀门、压缩机及类似机械的制造', 'C354', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3541', '泵及真空设备制造', 'C3541', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3542', '气体压缩机械制造', 'C3542', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3543', '阀门及旋塞的制造', 'C3543', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3544', '液压和气压动力机械及元件制造', 'C3544', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C355', '轴承、齿轮、传动和驱动部件的制造', 'C355', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3551', '轴承制造', 'C3551', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3552', '齿轮、传动和驱动部件制造', 'C3552', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C356', '烘炉、熔炉及电炉制造', 'C356', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3560', '烘炉、熔炉及电炉制造', 'C3560', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C357', '风机、衡器、包装设备等通用设备制造', 'C357', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3571', '风机、风扇制造', 'C3571', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3572', '气体、液体分离及纯净设备制造', 'C3572', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3573', '制冷、空调设备制造', 'C3573', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3574', '风动及电动工具制造', 'C3574', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3575', '喷枪及类似器具制造', 'C3575', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3576', '包装专用设备制造', 'C3576', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3577', '衡器制造', 'C3577', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3579', '其他通用设备制造', 'C3579', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C358', '通用零部件制造及机械修理', 'C358', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3581', '金属密封件制造', 'C3581', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3582', '紧固件、弹簧制造', 'C3582', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3583', '机械零部件加工及设备制造', 'C3583', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3589', '其他通用零部件制造', 'C3589', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C359', '金属铸、锻加工', 'C359', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3591', '钢铁铸件制造', 'C3591', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3592', '锻件及粉末冶金制品制造', 'C3592', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C36', '专用设备制造业', 'C36', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C361', '矿山、冶金、建筑专用设备制造', 'C361', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3611', '采矿、采石设备制造', 'C3611', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3612', '石油钻采专用设备制造', 'C3612', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3613', '建筑工程用机械制造', 'C3613', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3614', '建筑材料生产专用机械制造', 'C3614', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3615', '冶金专用设备制造', 'C3615', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C362', '化工、木材、非金属加工专用设备制造', 'C362', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3621', '炼油、化工生产专用设备制造', 'C3621', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3622', '橡胶加工专用设备制造', 'C3622', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3623', '塑料加工专用设备制造', 'C3623', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3624', '木材加工专用设备制造', 'C3624', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3625', '模具制造', 'C3625', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3629', '其他非金属加工专用设备制造', 'C3629', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C363', '食品、饮料、烟草及饲料生产专用设备制造', 'C363', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3631', '食品、饮料、烟草专用设备制造', 'C3631', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3632', '农副食品加工业专用设备制造', 'C3632', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3633', '饲料生产专用设备制造', 'C3633', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C364', '印刷、制药、日化生产专用设备制造', 'C364', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3641', '印浆和造纸专用设备制造', 'C3641', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3642', '印刷专用设备制造', 'C3642', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3643', '日用化工专用设备制造', 'C3643', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3644', '制药专用设备制造', 'C3644', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3645', '照明专用设备制造', 'C3645', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3646', '玻璃、陶瓷和搪瓷制品生产专用设备制造', 'C3646', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3649', '其他日用品生产专用设备制造', 'C3649', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C365', '纺织、服装和皮革工业专用设备制造', 'C365', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3651', '纺织专用设备制造', 'C3651', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3652', '皮革、毛皮及其制品专用设备制造', 'C3652', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3653', '缝纫机械专用设备制造', 'C3653', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3659', '其他服装加工专用设备制造', 'C3659', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C366', '电子和电工机械专用设备制造', 'C366', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3661', '电子机械专用设备制造', 'C3661', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3662', '电子工业专用设备制造', 'C3662', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3663', '武器弹药专用设备制造', 'C3663', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3669', '航空、航天及其他专用设备制造', 'C3669', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C367', '农、林、牧、渔专用机械制造', 'C367', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3671', '拖拉机制造', 'C3671', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3672', '机械化农业及园艺机具制造', 'C3672', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3673', '营林及木竹采伐机械制造', 'C3673', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3674', '畜牧机械制造', 'C3674', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3675', '渔业机械制造', 'C3675', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3676', '农林牧渔机械配件制造', 'C3676', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3679', '其他农林牧渔机械制造及机械修理', 'C3679', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C368', '医疗仪器设备及器械制造', 'C368', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3681', '医疗诊断、监护及治疗设备制造', 'C3681', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3682', '口腔科用设备及器具制造', 'C3682', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3683', '实验室及医用消毒设备和器具的制造', 'C3683', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3684', '医疗、外科及兽医用器械制造', 'C3684', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3685', '机械治疗及病房护理设备制造', 'C3685', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3686', '假肢、人工器官及植(介)入器械制造', 'C3686', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3689', '其他医疗设备及器械制造', 'C3689', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C369', '环保、社会公共安全及其他专用设备制造', 'C369', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3691', '环境污染防治专用设备制造', 'C3691', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3692', '地质勘查专用设备制造', 'C3692', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3693', '邮政专用机械及器材制造', 'C3693', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3694', '商业、饮食、服务业专用设备制造', 'C3694', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3695', '社会公共安全设备制造', 'C3695', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3696', '交通安全及管制设备制造', 'C3696', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3697', '水资源专用设备制造', 'C3697', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3699', '其他专用设备制造', 'C3699', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C37', '交通运输设备制造业', 'C37', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C371', '铁路运输设备制造', 'C371', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3711', '铁路机车车辆及动车组制造', 'C3711', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3712', '工矿有轨专用车辆制造', 'C3712', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3713', '铁路机车车辆配件制造', 'C3713', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3714', '铁路专用设备及器材、配件制造', 'C3714', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3719', '其他铁路设备制造及设备修理', 'C3719', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C372', '汽车制造', 'C372', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3721', '汽车整车制造', 'C3721', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3722', '改装汽车制造', 'C3722', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3723', '电车制造', 'C3723', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3724', '汽车车身、挂车制造', 'C3724', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3725', '汽车零部件及配件制造', 'C3725', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3726', '汽车修理', 'C3726', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C373', '摩托车制造', 'C373', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3731', '摩托车整车制造', 'C3731', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3732', '摩托车零部件及配件制造', 'C3732', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C374', '自行车制造', 'C374', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3741', '脚踏自行车及残疾人座车制造', 'C3741', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3742', '助动自行车制造', 'C3742', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C375', '船舶及浮动装置制造', 'C375', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3751', '金属船舶制造', 'C3751', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3752', '非金属船舶制造', 'C3752', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3753', '娱乐船及运动船制造及修理', 'C3753', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3754', '船用配套设施制造', 'C3754', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3755', '船舶修理及拆船', 'C3755', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3759', '航标器材及其他浮动装置制造', 'C3759', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C376', '航空航天器制造', 'C376', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3761', '飞机制造及修理', 'C3761', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3762', '航天器制造', 'C3762', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3769', '其他飞行器制造', 'C3769', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C379', '交通器材及其他交通运输设备制造', 'C379', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3791', '潜水及水下救捞装备制造', 'C3791', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3792', '交通管理用金属标志及设施制造', 'C3792', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3799', '其他交通运输设备制造', 'C3799', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C39', '电器机械及器材制造业', 'C39', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C391', '电机制造', 'C391', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3911', '发电机及发电机组制造', 'C3911', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3912', '电动机制造', 'C3912', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3919', '微电机及其他电机制造', 'C3919', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C392', '输配电及控制设备制造', 'C392', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3921', '变压器、整流器和电感器制造', 'C3921', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3922', '电容器及其配套设施制造', 'C3922', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3923', '配电开关控制设备制造', 'C3923', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3924', '电力电子元器件制造', 'C3924', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3929', '其他输配电及控制设备制造', 'C3929', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C393', '电线、电缆、光缆及电工器材制造', 'C393', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3931', '电线、电缆制造', 'C3931', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3932', '光纤、光缆制造', 'C3932', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3933', '绝缘制品制造', 'C3933', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3939', '其他电工器材制造', 'C3939', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C394', '电池制造', 'C394', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3940', '电池制造', 'C3940', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C395', '家用电力器具制造', 'C395', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3951', '家用制冷电器具制造', 'C3951', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3952', '家用空气调节器制造', 'C3952', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3953', '家用通风电器具制造', 'C3953', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3954', '家用厨房电器具制造', 'C3954', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3955', '家用清洁卫生电器具制造', 'C3955', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3956', '家用美容、保健电器具制造', 'C3956', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3957', '家用电力器具专用配件制造', 'C3957', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3959', '其他家用电力器具制造', 'C3959', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C396', '非电力家用器具制造', 'C396', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3961', '燃气、太阳能及类似能源的器具制造', 'C3961', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3969', '其他非电力家用器具制造', 'C3969', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C397', '照明器具制造', 'C397', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3971', '电光源制造', 'C3971', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3972', '照明灯具制造', 'C3972', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3979', '灯用电器附件及其他照明器具制造', 'C3979', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C399', '其他电器机械及器材制造', 'C399', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3991', '车辆专用照明及电气信号设备制造', 'C3991', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C3999', '其他未列明的电气机械制造', 'C3999', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C40', '通信设备、计算机及其他电子设备制造业', 'C40', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C401', '通信设备制造', 'C401', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4011', '通信传输设备制造', 'C4011', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4012', '通信交换设备制造', 'C4012', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4013', '通信终端设备制造', 'C4013', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4014', '移动通信及终端设备制造', 'C4014', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4019', '其他通信设备制造', 'C4019', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C402', '雷达及配套设备制造', 'C402', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4020', '雷达及配套设备制造', 'C4020', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C403', '广播电视设备制造', 'C403', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4031', '广播电视节目制作及发射设备制造', 'C4031', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4032', '广播电视接收设备及器材制造', 'C4032', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4039', '应用电视设备及其他广播电视设备制造', 'C4039', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C404', '电子计算机制造', 'C404', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4041', '电子计算机整机制造', 'C4041', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4042', '计算机网络设备制造', 'C4042', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4043', '电子计算机外部设备制造', 'C4043', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C405', '电子器件制造', 'C405', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4051', '电子真空器件制造', 'C4051', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4052', '半导体分立器件制造', 'C4052', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4053', '集成电路制造', 'C4053', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4059', '光电子器件及其他电子器件制造', 'C4059', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C406', '电子元件制造', 'C406', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4061', '电子元件及组件制造', 'C4061', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4062', '印制电路板制造', 'C4062', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C407', '家用视听设备制造', 'C407', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4071', '家用影视设备制造', 'C4071', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4072', '家用音响设备制造', 'C4072', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C409', '其他电子设备制造', 'C409', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4090', '其他电子设备制造', 'C4090', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C41', '仪器仪表及文化、办公用机械制造业', 'C41', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C411', '通用仪器仪表制造', 'C411', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4111', '工业自动控制系统装置制造', 'C4111', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4112', '电工仪器仪表制造', 'C4112', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4113', '绘图、计算及测量仪器制造', 'C4113', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4114', '实验分析仪器制造', 'C4114', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4115', '试验机制造', 'C4115', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4119', '供应用仪表及其他通用仪器制造', 'C4119', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C412', '专用仪器仪表制造', 'C412', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4121', '环境检测专用仪器仪表制造', 'C4121', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4122', '汽车及其他用技数仪表制造', 'C4122', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4123', '导航、气象及海洋专用仪器制造', 'C4123', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4124', '农林牧渔专用仪器仪表制造', 'C4124', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4125', '地质勘查和地震专用仪器制造', 'C4125', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4126', '教学专用仪器制造', 'C4126', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4127', '核子及核辐射测量仪器制造', 'C4127', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4128', '电子测量仪器制造', 'C4128', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4129', '其他专用仪器制造', 'C4129', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C413', '钟表与计时仪器制造', 'C413', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4130', '钟表与计时仪器制造', 'C4130', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C414', '光学仪器及眼镜制造', 'C414', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4141', '光学仪器制造', 'C4141', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4142', '眼镜制造', 'C4142', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C415', '文化、办公用机械制造', 'C415', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4151', '电影机械制造', 'C4151', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4152', '幻灯及投影设备制造', 'C4152', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4153', '照相机及器材制造', 'C4153', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4154', '复印和胶印设备制造', 'C4154', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4155', '计算机及货币专用设备制造', 'C4155', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4159', '其他文化、办公用机械制造', 'C4159', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C419', '其他仪器仪表的制造及修理', 'C419', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4190', '其他仪器仪表的制造及修理', 'C4190', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C42', '工艺品及其他制造业', 'C42', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C421', '工艺美术品制造', 'C421', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4211', '雕塑工艺品制造', 'C4211', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4212', '金属工艺品制造', 'C4212', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4213', '漆器工艺品制造', 'C4213', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4214', '花画工艺品制造', 'C4214', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4215', '天然植物纤维编制工艺品制造', 'C4215', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4216', '抽纱刺绣工艺品制造', 'C4216', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4217', '地毯、挂毯制造', 'C4217', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4218', '珠宝首饰及有关物品的制造', 'C4218', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4219', '其他工艺美术品制造', 'C4219', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C422', '日用杂品制造', 'C422', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4221', '制镜及类似品加工', 'C4221', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4222', '鬓毛加工、制刷及清扫工具的制造', 'C4222', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4229', '其他日用杂品的制造', 'C4229', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C423', '煤制品制造', 'C423', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4230', '煤制品制造', 'C4230', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C424', '核辐射加工', 'C424', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4240', '核辐射加工', 'C4240', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C429', '其他未列明的制造业', 'C429', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4290', '其他未列明的制造业', 'C4290', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C43', '废弃资源和废旧材料回收加工业', 'C43', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C431', '金属废料和碎屑的加工处理', 'C431', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4310', '金属废料和碎屑的加工处理', 'C4310', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C432', '非金属废料和碎屑的加工处理', 'C432', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'C4320', '非金属废料和碎屑的加工处理', 'C4320', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'D', '电力、燃气及水的生产和供应业', 'D', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'D44', '电力、热力的生产和供应业', 'D44', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'D441', '电力生产', 'D441', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'D4411', '火力发电', 'D4411', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'D4412', '水力发电', 'D4412', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'D4413', '核力发电', 'D4413', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'D4419', '其他能源发电', 'D4419', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'D442', '电力供应', 'D442', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'D4420', '电力供应', 'D4420', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'D443', '热力生产和供应', 'D443', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'D4430', '热力生产和供应', 'D4430', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'D45', '燃气生产和供应业', 'D45', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'D450', '燃气生产和供应业', 'D450', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'D4500', '燃气生产和供应业', 'D4500', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'D46', '水的生产和供应业', 'D46', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'D461', '自来水的生产和供应', 'D461', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'D4610', '自来水的生产和供应', 'D4610', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'D462', '污水处理及其再生利用', 'D462', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'D4620', '污水处理及其再生利用', 'D4620', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'D469', '其他水的处理、利用与分配', 'D469', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'D4690', '其他水的处理、利用与分配', 'D4690', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E', '建筑业', 'E', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E47', '房屋和土木工程建筑业', 'E47', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E471', '房屋工程建筑', 'E471', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E4710', '房屋工程建筑', 'E4710', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E472', '土木工程建筑', 'E472', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E4721', '铁路、道路、隧道和桥梁工程建筑', 'E4721', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E4722', '水利和港口工程建筑', 'E4722', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E4723', '工矿工程建筑', 'E4723', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E4724', '架线和管道工程建筑', 'E4724', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E4729', '其他土木工程建筑', 'E4729', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E48', '建筑安装业', 'E48', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E480', '建筑安装业', 'E480', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E4800', '建筑安装业', 'E4800', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E49', '建筑装饰业', 'E49', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E490', '建筑装饰业', 'E490', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E4900', '建筑装饰业', 'E4900', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E50', '其他建筑业', 'E50', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E501', '工程准备', 'E501', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E5010', '工程准备', 'E5010', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E502', '提供施工设备服务', 'E502', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E5020', '提供施工设备服务', 'E5020', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E509', '其他未列明的建筑活动', 'E509', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'E5090', '其他未列明的建筑活动', 'E5090', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F', '交通运输、仓储和邮政业', 'F', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F51', '铁路运输业', 'F51', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F511', '铁路旅客运输', 'F511', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5110', '铁路旅客运输', 'F5110', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F512', '铁路货物运输', 'F512', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5120', '铁路货物运输', 'F5120', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F513', '铁路运输辅助活动', 'F513', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5131', '客运火车站', 'F5131', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5132', '货运火车站', 'F5132', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5139', '其他铁路运输辅助活动', 'F5139', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F52', '道路运输业', 'F52', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F521', '公路旅客运输', 'F521', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5210', '公路旅客运输', 'F5210', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F522', '道路货物运输', 'F522', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5220', '道路货物运输', 'F5220', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F523', '道路运输辅助活动', 'F523', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5231', '客运汽车站', 'F5231', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5232', '公路管理与养护', 'F5232', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5239', '其他道路运输辅助活动', 'F5239', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F53', '城市公共交通业', 'F53', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F531', '公共电汽车客运', 'F531', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5310', '公共电汽车客运', 'F5310', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F532', '轨道交通', 'F532', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5320', '轨道交通', 'F5320', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F533', '出租车客运', 'F533', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5330', '出租车客运', 'F5330', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F534', '城市轮渡', 'F534', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5340', '城市轮渡', 'F5340', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F539', '其他城市公共交通', 'F539', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5390', '其他城市公共交通', 'F5390', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F54', '水上运输业', 'F54', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F541', '水上旅客运输', 'F541', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5411', '远洋旅客运输', 'F5411', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5412', '沿海旅客运输', 'F5412', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5413', '内河旅客运输', 'F5413', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F542', '水上货物运输', 'F542', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5421', '远洋货物运输', 'F5421', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5422', '沿海货物运输', 'F5422', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5423', '内河货物运输', 'F5423', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F543', '水上运输辅助活动', 'F543', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5431', '客运港口', 'F5431', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5432', '货运港口', 'F5432', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5439', '其他水上运输辅助活动', 'F5439', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F55', '航空运输业', 'F55', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F551', '航空客货运输', 'F551', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5511', '航空旅客运输', 'F5511', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5512', '航空货物运输', 'F5512', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F552', '通用航空服务', 'F552', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5520', '通用航空服务', 'F5520', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F553', '航空运输辅助活动', 'F553', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5531', '机场', 'F5531', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5532', '空中交通管理', 'F5532', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5539', '其他航空运输辅助活动', 'F5539', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F56', '管道运输业', 'F56', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F560', '管道运输业', 'F560', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5600', '管道运输业', 'F5600', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F57', '装卸搬运和其他运输服务业', 'F57', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F571', '装卸搬运', 'F571', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5710', '装卸搬运', 'F5710', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F572', '运输代理服务', 'F572', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5720', '运输代理服务', 'F5720', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F58', '仓储业', 'F58', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F581', '谷物、棉花等农产品仓储', 'F581', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5810', '谷物、棉花等农产品仓储', 'F5810', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F589', '其他仓储', 'F589', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5890', '其他仓储', 'F5890', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F59', '邮政业', 'F59', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F591', '国家邮政', 'F591', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5910', '国家邮政', 'F5910', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F599', '其他邮递服务', 'F599', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'F5990', '其他邮递服务', 'F5990', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G', '信息传输、计算机服务和软件业', 'G', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G60', '电信和其他信息传输服务业', 'G60', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G601', '电信', 'G601', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G6011', '固定电信服务', 'G6011', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G6012', '移动电信服务', 'G6012', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G6019', '其他电信服务', 'G6019', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G602', '互联网信息服务', 'G602', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G6020', '互联网信息服务', 'G6020', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G603', '广播电视传输服务', 'G603', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G6031', '有线广播电视传输服务', 'G6031', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G6032', '无线广播电视传输服务', 'G6032', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G604', '卫星传输服务', 'G604', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G6040', '卫星传输服务', 'G6040', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G61', '计算机服务业', 'G61', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G611', '计算机系统服务', 'G611', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G6110', '计算机系统服务', 'G6110', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G612', '数据处理', 'G612', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G6120', '数据处理', 'G6120', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G613', '计算机维修', 'G613', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G6130', '计算机维修', 'G6130', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G619', '其他计算机服务', 'G619', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G6190', '其他计算机服务', 'G6190', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G62', '软件业', 'G62', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G621', '公共软件服务', 'G621', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G6211', '基础软件服务', 'G6211', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G6212', '应用软件服务', 'G6212', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G629', '其他软件服务', 'G629', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'G6290', '其他软件服务', 'G6290', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H', '批发和零售业', 'H', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H63', '批发业', 'H63', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H631', '农畜产品批发', 'H631', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6311', '谷物、豆及薯类批发', 'H6311', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6312', '种子、饲料批发', 'H6312', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6313', '棉、麻批发', 'H6313', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6314', '牲畜批发', 'H6314', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6319', '其他农畜产品批发', 'H6319', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H632', '食品、饮料及烟草制品批发', 'H632', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6321', '米、面制品及食用油批发', 'H6321', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6322', '糕点、糖果及糖批发', 'H6322', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6323', '果品、蔬菜批发', 'H6323', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6324', '肉、禽、蛋及水产品批发', 'H6324', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6325', '盐及调味品批发', 'H6325', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6326', '饮料及茶叶批发', 'H6326', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6327', '烟草制品批发', 'H6327', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6329', '其他食品批发', 'H6329', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H633', '纺织、服装及日用品批发', 'H633', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6331', '纺织品、针织品及原料批发', 'H6331', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6332', '服装批发', 'H6332', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6333', '鞋帽批发', 'H6333', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6334', '厨房、卫生间用具及日用杂活批发', 'H6334', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6335', '化妆品及卫生用品批发', 'H6335', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6339', '其他日用品批发', 'H6339', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H634', '文化、体育用品及器材批发', 'H634', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6341', '文具用品批发', 'H6341', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6342', '体育用品批发', 'H6342', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6343', '图书批发', 'H6343', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6344', '报刊批发', 'H6344', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6345', '音响制品及电子出版物批发', 'H6345', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6346', '首饰、工艺品及收藏品批发', 'H6346', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6349', '其他文化用品批发', 'H6349', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H635', '医药及医疗器材批发', 'H635', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6351', '西药批发', 'H6351', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6352', '中药材及中成药批发', 'H6352', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6353', '医疗用品及器材批发', 'H6353', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H636', '矿产品、建材及化工产品批发', 'H636', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6361', '煤炭及制品批发', 'H6361', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6362', '石油及制品批发', 'H6362', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6363', '非金属矿及制品批发', 'H6363', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6364', '金属及金属矿批发', 'H6364', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6365', '建材批发', 'H6365', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6366', '化肥批发', 'H6366', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6367', '农药批发', 'H6367', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6368', '农用薄膜批发', 'H6368', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6369', '其他化工产品批发', 'H6369', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H637', '机械设备、五金交电及电子产品批发', 'H637', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6371', '农业机械批发', 'H6371', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6372', '汽车、摩托车及零配件批发', 'H6372', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6373', '五金、交电批发', 'H6373', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6374', '家用电器批发', 'H6374', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6375', '计算机、软件及辅助设备批发', 'H6375', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6376', '通讯及广播电视设备批发', 'H6376', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6379', '其他机械设备及电子产品批发', 'H6379', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H638', '贸易经纪与代理', 'H638', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6380', '贸易经纪与代理', 'H6380', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H639', '其他批发', 'H639', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6391', '再生物资回收与批发', 'H6391', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6399', '其他未列明的批发', 'H6399', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H65', '零售业', 'H65', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H651', '综合零售', 'H651', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6511', '百货零售', 'H6511', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6512', '超级市场零售', 'H6512', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6519', '其他综合零售', 'H6519', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H652', '食品、饮料及烟草制品专门销售', 'H652', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6521', '粮油批发', 'H6521', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6522', '糕点、面包零售', 'H6522', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6523', '果品、蔬菜零售', 'H6523', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6524', '肉、禽、蛋及水产品零售', 'H6524', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6525', '饮料及茶叶零售', 'H6525', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6526', '烟草制品零售', 'H6526', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6529', '其他食品零售', 'H6529', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H653', '纺织、服装及日用品专门零售', 'H653', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6531', '纺织品、针织品零售', 'H6531', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6532', '服装零售', 'H6532', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6533', '鞋帽零售', 'H6533', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6534', '钟表、眼镜零售', 'H6534', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6535', '化妆品及卫生用品零售', 'H6535', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6539', '其他日用用品零售', 'H6539', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H654', '文化、体育用品及器材专门零售', 'H654', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6541', '文具用品零售', 'H6541', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6542', '体育用品零售', 'H6542', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6543', '图书零售', 'H6543', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6544', '报刊零售', 'H6544', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6545', '音响制品及电子出版物零售', 'H6545', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6546', '珠宝首饰零售', 'H6546', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6547', '工艺美术品及收藏品零售', 'H6547', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6548', '照相器材零售', 'H6548', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6549', '其他文化用品零售', 'H6549', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H655', '医药及医疗器材专门零售', 'H655', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6551', '药品零售', 'H6551', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6552', '医疗用品及器材零售', 'H6552', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H656', '汽车、摩托车、燃料及零配件专门零售', 'H656', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6561', '汽车零售', 'H6561', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6562', '汽车零配件零售', 'H6562', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6563', '摩托车及零配件零售', 'H6563', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6564', '机动车燃料零售', 'H6564', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H657', '家用电器及电子产品专门零售', 'H657', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6571', '家用电器零售', 'H6571', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6572', '计算机、软件及辅助设备零售', 'H6572', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6573', '通信设备零售', 'H6573', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6579', '其他电子产品零售', 'H6579', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H658', '五金、家具及室内装修材料专门零售', 'H658', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6581', '五金零售', 'H6581', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6582', '家具零售', 'H6582', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6583', '涂料零售', 'H6583', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6589', '其他室内装修材料零售', 'H6589', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H659', '无店铺及其他零售', 'H659', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6591', '流动货摊零售', 'H6591', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6592', '邮购及电子销售', 'H6592', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6593', '生活用燃料零售', 'H6593', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6594', '花卉零售', 'H6594', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6595', '旧货零售', 'H6595', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'H6599', '其他未列明的零售', 'H6599', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'I', '住宿和餐饮业', 'I', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'I66', '住宿业', 'I66', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'I661', '旅游饭店', 'I661', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'I6610', '旅游饭店', 'I6610', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'I662', '一般旅馆', 'I662', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'I6620', '一般旅馆', 'I6620', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'I669', '其他住宿服务', 'I669', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'I6690', '其他住宿服务', 'I6690', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'I67', '餐饮业', 'I67', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'I671', '正餐服务', 'I671', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'I6710', '正餐服务', 'I6710', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'I672', '快餐服务', 'I672', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'I6720', '快餐服务', 'I6720', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'I673', '饮料及冷饮服务', 'I673', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'I6730', '饮料及冷饮服务', 'I6730', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'I679', '其他餐饮服务', 'I679', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'I6790', '其他餐饮服务', 'I6790', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J', '金融业', 'J', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J68', '银行业', 'J68', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J681', '中央银行', 'J681', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J6810', '中央银行', 'J6810', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J682', '商业银行', 'J682', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J6820', '商业银行', 'J6820', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J689', '其他银行', 'J689', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J6890', '其他银行', 'J6890', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J69', '证券业', 'J69', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J691', '证券市场管理', 'J691', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J6910', '证券市场管理', 'J6910', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J692', '证券经纪与交易', 'J692', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J6920', '证券经纪与交易', 'J6920', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J693', '证券投资', 'J693', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J6930', '证券投资', 'J6930', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J694', '证券分析与咨询', 'J694', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J6940', '证券分析与咨询', 'J6940', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J70', '保险业', 'J70', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J701', '人寿保险', 'J701', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J7010', '人寿保险', 'J7010', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J702', '非人寿保险', 'J702', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J7020', '非人寿保险', 'J7020', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J703', '保险辅助服务', 'J703', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J7030', '保险辅助服务', 'J7030', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J71', '其他金融活动', 'J71', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J711', '金融信托与管理', 'J711', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J7110', '金融信托与管理', 'J7110', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J712', '金融租赁', 'J712', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J7120', '金融租赁', 'J7120', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J713', '财务公司', 'J713', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J7130', '财务公司', 'J7130', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J714', '邮政储蓄', 'J714', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J7140', '邮政储蓄', 'J7140', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J715', '典当', 'J715', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J7150', '典当', 'J7150', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J719', '其他未列明的金融活动', 'J719', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'J7190', '其他未列明的金融活动', 'J7190', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'K', '房地产业', 'K', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'K72', '房地产业', 'K72', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'K721', '房地产开发经营', 'K721', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'K7210', '房地产开发经营', 'K7210', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'K722', '物业管理', 'K722', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'K7220', '物业管理', 'K7220', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'K723', '房地产中介服务', 'K723', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'K7230', '房地产中介服务', 'K7230', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'K729', '其他房地产活动', 'K729', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'K7290', '其他房地产活动', 'K7290', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L', '租赁和商务服务业', 'L', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L73', '租赁业', 'L73', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L731', '机械设备租赁', 'L731', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7311', '汽车租赁', 'L7311', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7312', '农业机械租赁', 'L7312', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7313', '建筑工程机械与设备租赁', 'L7313', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7314', '计算机及通讯设备租赁', 'L7314', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7319', '其他机械与设备租赁', 'L7319', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L732', '文化及日用品出租', 'L732', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7321', '图书及音响制品出租', 'L7321', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7329', '其他文化及日用品出租', 'L7329', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L74', '商务服务业', 'L74', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L741', '企业管理服务', 'L741', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7411', '企业管理机构', 'L7411', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7412', '投资与资产管理', 'L7412', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7419', '其他企业管理服务', 'L7419', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L742', '法律服务', 'L742', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7421', '律师及相关的法律服务', 'L7421', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7422', '公证服务', 'L7422', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7429', '其他法律服务', 'L7429', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L743', '咨询与调查', 'L743', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7431', '会计、审计及税务服务', 'L7431', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7432', '市场调查', 'L7432', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7433', '社会经济咨询', 'L7433', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7439', '其他专业咨询', 'L7439', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L744', '广告业', 'L744', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7440', '广告业', 'L7440', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L745', '知识产权服务', 'L745', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7450', '知识产权服务', 'L7450', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L746', '职业中介服务', 'L746', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7460', '职业中介服务', 'L7460', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L747', '市场管理', 'L747', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7470', '市场管理', 'L7470', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L748', '旅行社', 'L748', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7480', '旅行社', 'L7480', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L749', '其他商务服务', 'L749', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7491', '会议及展览服务', 'L7491', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7492', '包装服务', 'L7492', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7493', '保安服务', 'L7493', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7494', '办公服务', 'L7494', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'L7499', '其他未列明的商务服务', 'L7499', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M', '科学研究、技术服务和地质勘查业', 'M', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M75', '研究与试验发展', 'M75', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M751', '自然科学研究与试验发展', 'M751', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7510', '自然科学研究与试验发展', 'M7510', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M752', '工程和技术研究与试验发展', 'M752', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7520', '工程和技术研究与试验发展', 'M7520', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M753', '农业科学研究与试验发展', 'M753', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7530', '农业科学研究与试验发展', 'M7530', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M754', '医学研究与试验发展', 'M754', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7540', '医学研究与试验发展', 'M7540', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M755', '社会人文科学研究与试验发展', 'M755', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7550', '社会人文科学研究与试验发展', 'M7550', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M76', '专业技术服务业', 'M76', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M761', '气象服务', 'M761', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7610', '气象服务', 'M7610', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M762', '地震服务', 'M762', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7620', '地震服务', 'M7620', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M763', '海洋服务', 'M763', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7630', '海洋服务', 'M7630', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M764', '测绘服务', 'M764', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7640', '测绘服务', 'M7640', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M765', '技术检测', 'M765', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7650', '技术检测', 'M7650', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M766', '环境检测', 'M766', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7660', '环境检测', 'M7660', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M767', '工程技术与规划管理', 'M767', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7671', '工程管理服务', 'M7671', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7672', '工程勘查设计', 'M7672', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7673', '规划管理', 'M7673', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M769', '其他专业技术服务', 'M769', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7690', '其他专业技术服务', 'M7690', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M77', '科技交流和推广服务业', 'M77', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M771', '技术推广服务', 'M771', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7710', '技术推广服务', 'M7710', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M772', '科技中介服务', 'M772', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7720', '科技中介服务', 'M7720', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M779', '其他科技服务', 'M779', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7790', '其他科技服务', 'M7790', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M78', '地质勘查业', 'M78', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M781', '矿产地质勘查', 'M781', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7811', '能源矿产地质勘查', 'M7811', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7812', '固体矿产地质勘查', 'M7812', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7819', '其他矿产地质勘查', 'M7819', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M782', '基础地址勘查', 'M782', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7820', '基础地址勘查', 'M7820', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M783', '地址勘查技术服务', 'M783', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'M7830', '地址勘查技术服务', 'M7830', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N', '水利、环境和公共设施管理业', 'N', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N79', '水利管理业', 'N79', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N791', '防洪管理', 'N791', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N7910', '防洪管理', 'N7910', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N792', '水资源管理', 'N792', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N7921', '水库管理', 'N7921', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N7922', '调水、引水管理', 'N7922', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N7929', '其他水资源管理', 'N7929', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N799', '其他水利管理', 'N799', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N7990', '其他水利管理', 'N7990', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N80', '环境管理业', 'N80', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N801', '自然保护', 'N801', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N8011', '自然保护区管理', 'N8011', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N8012', '野生动植物保护', 'N8012', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N8019', '其他自然保护', 'N8019', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N802', '环境治理', 'N802', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N8021', '城市市容管理', 'N8021', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N8022', '城市环境卫生管理', 'N8022', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N8023', '水污染治理', 'N8023', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N8024', '危险废物管理', 'N8024', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N8029', '其他环境治理', 'N8029', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N81', '公共设施管理业', 'N81', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N811', '市政公共设施管理', 'N811', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N8110', '市政公共设施管理', 'N8110', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N812', '城市绿化管理', 'N812', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N8120', '城市绿化管理', 'N8120', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N813', '游览景区管理', 'N813', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N8131', '风景名胜区管理', 'N8131', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N8132', '公园管理', 'N8132', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'N8139', '其他游览景区管理', 'N8139', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O', '居民服务和其他服务业', 'O', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O82', '居民服务业', 'O82', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O821', '家庭服务', 'O821', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O8210', '家庭服务', 'O8210', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O822', '托儿所', 'O822', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O8220', '托儿所', 'O8220', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O823', '洗染服务', 'O823', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O8230', '洗染服务', 'O8230', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O824', '理发及美容保健服务', 'O824', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O8240', '理发及美容保健服务', 'O8240', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O825', '洗浴服务', 'O825', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O8250', '洗浴服务', 'O8250', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O826', '婚姻服务', 'O826', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O8260', '婚姻服务', 'O8260', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O827', '殡葬服务', 'O827', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O8270', '殡葬服务', 'O8270', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O828', '摄影扩印服务', 'O828', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O8280', '摄影扩印服务', 'O8280', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O829', '其他居民服务', 'O829', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O8290', '其他居民服务', 'O8290', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O83', '其他服务业', 'O83', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O831', '修理与维护', 'O831', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O8311', '汽车、摩托车维护与保养', 'O8311', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O8312', '办公设备维修', 'O8312', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O8313', '家用电器维修', 'O8313', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O8319', '其他日用品维修', 'O8319', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O832', '清洁服务', 'O832', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O8321', '建筑物清洁服务', 'O8321', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O8329', '其他清洁服务', 'O8329', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O839', '其他未列明服务', 'O839', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'O8390', '其他未列明服务', 'O8390', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'P', '教育', 'P', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'P84', '教育', 'P84', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'P841', '学前教育', 'P841', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'P8410', '学前教育', 'P8410', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'P842', '初等教育', 'P842', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'P8420', '初等教育', 'P8420', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'P843', '中等教育', 'P843', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'P8431', '初中教育', 'P8431', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'P8432', '高中教育', 'P8432', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'P8433', '中等专业教育', 'P8433', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'P8434', '职业中学教育', 'P8434', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'P8435', '技工学校教育', 'P8435', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'P8439', '其他中等教育', 'P8439', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'P844', '高等教育', 'P844', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'P8441', '普通高等教育', 'P8441', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'P8442', '成人高等教育', 'P8442', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'P849', '其他教育', 'P849', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'P8491', '职业技能培训', 'P8491', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'P8492', '特殊教育', 'P8492', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'P8499', '其他未列明的教育', 'P8499', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q', '卫生、社会保障和社会福利业', 'Q', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q85', '卫生', 'Q85', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q851', '医院', 'Q851', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q8511', '综合医院', 'Q8511', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q8512', '中医医院', 'Q8512', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q8513', '中西医结合医院', 'Q8513', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q8514', '民族医院', 'Q8514', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q8515', '专科医院', 'Q8515', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q8516', '疗养院', 'Q8516', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q852', '卫生院及社区医疗活动', 'Q852', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q8520', '卫生院及社区医疗活动', 'Q8520', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q853', '门诊部医疗活动', 'Q853', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q8530', '门诊部医疗活动', 'Q8530', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q854', '计划生育技术服务活动', 'Q854', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q8540', '计划生育技术服务活动', 'Q8540', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q855', '妇幼保健活动', 'Q855', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q8550', '妇幼保健活动', 'Q8550', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q856', '专科疾病防治活动', 'Q856', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q8560', '专科疾病防治活动', 'Q8560', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q857', '疾病预防控制及防疫活动', 'Q857', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q8570', '疾病预防控制及防疫活动', 'Q8570', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q859', '其他卫生活动', 'Q859', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q8590', '其他卫生活动', 'Q8590', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q86', '社会保障业', 'Q86', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q860', '社会保障业', 'Q860', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q8600', '社会保障业', 'Q8600', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q87', '社会福利业', 'Q87', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q871', '提供住宿的社会福利', 'Q871', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q8711', '干部休养所', 'Q8711', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q8712', '收养收容服务中心', 'Q8712', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q872', '不提供住宿的社会福利', 'Q872', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Q8720', '不提供住宿的社会福利', 'Q8720', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R', '文化、体育和娱乐业', 'R', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R88', '新闻出版业', 'R88', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R881', '新闻业', 'R881', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R8810', '新闻业', 'R8810', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R882', '出版业', 'R882', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R8821', '图书出版', 'R8821', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R8822', '报纸出版', 'R8822', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R8823', '期刊出版', 'R8823', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R8824', '音像制品出版', 'R8824', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R8825', '电子出版物出版', 'R8825', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R8829', '其他出版', 'R8829', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R89', '广播、电视、电影和音像业', 'R89', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R891', '广播', 'R891', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R8910', '广播', 'R8910', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R892', '电视', 'R892', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R8920', '电视', 'R8920', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R893', '电影', 'R893', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R8931', '电影制作和发行', 'R8931', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R8932', '电影放映', 'R8932', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R894', '音像制作', 'R894', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R8940', '音像制作', 'R8940', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R90', '文化艺术业', 'R90', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R901', '文艺创作与表演', 'R901', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R9010', '文艺创作与表演', 'R9010', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R902', '艺术表演场馆', 'R902', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R9020', '艺术表演场馆', 'R9020', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R903', '图书馆与档案馆', 'R903', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R9031', '图书馆', 'R9031', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R9032', '档案馆', 'R9032', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R904', '文物及文化保护', 'R904', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R9040', '文物及文化保护', 'R9040', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R905', '博物馆', 'R905', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R9050', '博物馆', 'R9050', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R906', '烈士陵园、纪念馆', 'R906', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R9060', '烈士陵园、纪念馆', 'R9060', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R907', '群众文化活动', 'R907', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R9070', '群众文化活动', 'R9070', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R908', '文化艺术经纪代理', 'R908', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R9080', '文化艺术经纪代理', 'R9080', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R909', '其他文化艺术', 'R909', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R9090', '其他文化艺术', 'R9090', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R91', '体育', 'R91', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R911', '体育组织', 'R911', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R9110', '体育组织', 'R9110', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R912', '体育场馆', 'R912', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R9120', '体育场馆', 'R9120', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R919', '其他体育', 'R919', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R9190', '其他体育', 'R9190', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R92', '娱乐业', 'R92', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R921', '室内娱乐活动', 'R921', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R9210', '室内娱乐活动', 'R9210', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R922', '游乐园', 'R922', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R9220', '游乐园', 'R9220', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R923', '休闲健身娱乐活动', 'R923', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R9230', '休闲健身娱乐活动', 'R9230', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R929', '其他娱乐活动', 'R929', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'R9290', '其他娱乐活动', 'R9290', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S', '公共管理和社会组织', 'S', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S93', '中国共产党机关', 'S93', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S930', '中国共产党机关', 'S930', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9300', '中国共产党机关', 'S9300', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S94', '国家机构', 'S94', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S941', '国家权力机构', 'S941', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9410', '国家权力机构', 'S9410', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S942', '国家行政机构', 'S942', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9421', '综合事务管理机构', 'S9421', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9422', '对外事务管理机构', 'S9422', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9423', '公共安全管理机构', 'S9423', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9424', '社会事务管理机构', 'S9424', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9425', '经济事务管理机构', 'S9425', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9426', '政府事务管理机构', 'S9426', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9427', '行政监督检查机构', 'S9427', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S943', '人民法院和人民检察院', 'S943', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9431', '人民法院', 'S9431', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9432', '人民检察院', 'S9432', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S949', '其他国家机构', 'S949', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9490', '其他国家机构', 'S9490', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S95', '人民政协和民主党派', 'S95', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S951', '人民政协', 'S951', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9510', '人民政协', 'S9510', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S952', '民主党派', 'S952', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9520', '民主党派', 'S9520', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S96', '群众团体、社会团体和宗教组织', 'S96', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S961', '群众团体', 'S961', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9611', '工会', 'S9611', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9612', '妇联', 'S9612', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9613', '共青团', 'S9613', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9619', '其他群众团体', 'S9619', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S962', '社会团体', 'S962', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9621', '专业性团体', 'S9621', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9622', '行业行团体', 'S9622', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9629', '其他社会团体', 'S9629', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S963', '宗教组织', 'S963', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9630', '宗教组织', 'S9630', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S97', '基层群众自治组织', 'S97', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S971', '社区自治组织', 'S971', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9710', '社区自治组织', 'S9710', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S972', '村民自治组织', 'S972', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'S9720', '村民自治组织', 'S9720', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'T', '国际组织', 'T', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'T98', '国际组织', 'T98', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'T980', '国际组织', 'T980', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'T9800', '国际组织', 'T9800', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Z', '待定', 'Z', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Z99', '待定', 'Z99', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Z999', '待定', 'Z999', '1', null, null);
INSERT INTO `t_code_library` VALUES ('IndustryType', 'Z9999', '待定', 'Z9999', '1', null, null);
INSERT INTO `t_code_library` VALUES ('Marriage', '10', '未婚', '10', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('Marriage', '20', '已婚无子女', '20', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('Marriage', '21', '已婚且有子女', '30', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('Marriage', '22', '离异', '40', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('Marriage', '23', '复婚', '50', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('Marriage', '30', '丧偶', '60', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('Marriage', '40', '离婚', '70', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('Marriage', '90', '未说明', '80', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '100', '内资企业', '100', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '100110', '国有企业', '100110', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '100120', '集体企业', '100120', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '100130', '股份合作企业', '100130', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '100140', '联营企业', '100140', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '100150', '有限责任公司', '100150', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '100160', '股份有限公司', '100160', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '100170', '私营企业', '100170', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '100170171', '私营独资企业', '100170171', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '100170174', '私营有限责任公司', '100170174', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '100190', '其他企业', '100190', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '200', '港、澳、台商投资企业', '200', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '200210', '合资经营企业(港或澳、台资)', '200210', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '200210211', '港、澳与内地合资企业', '200210211', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '200210212', '台湾与内地合资企业', '200210212', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '200220', '合作经营企业(港或澳、台资)', '200220', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '200220221', '港、澳与内地合作企业', '200220221', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '200220222', '台湾与内地合作企业', '200220222', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '200230', '港、澳、台商独资经营企业', '200230', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '200230231', '港、澳独资经营企业', '200230231', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '200230232', '台湾独资经营企业', '200230232', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '200240', '港、澳、台商投资股份有限公司', '200240', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '200240241', '港、澳投资股份有限公司', '200240241', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '200240242', '台商投资股份有限公司', '200240242', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '300', '外商投资企业', '300', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '300310', '中外合资经营企业', '300310', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '300320', '中外合作经营企业', '300320', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '300330', '外资(独资)企业', '300330', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '300340', '外商投资股份有限公司', '300340', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '400', '个体经营', '400', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '400410', '个体经营户', '400410', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('OrgType', '400420', '个人合伙', '400420', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '01', '高管', '01', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0100', '法人代表(高管)', '0100', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0101', '公司董事长(高管)', '0101', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0102', '公司总经理/厂长/CEO(高管)', '0102', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0103', '财务主管/CFO(高管)', '0103', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0104', '授权经办人(高管)', '0104', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0105', '部门经理(高管)', '0105', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0106', '董事(高管)', '0106', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0108', '监事(高管)', '0108', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0109', '实际控制人(高管)', '0109', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '02', '投资', '02', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0201', '资金(投资)', '0201', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0202', '技术(投资)', '0202', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0203', '实物(投资)', '0203', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0204', '权利(投资)', '0204', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0205', '其他(投资)', '0205', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '03', '家庭关系', '03', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0301', '配偶', '0301', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0302', '父母', '0302', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0303', '子女', '0303', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0304', '兄妹', '0304', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0306', '其他血亲', '0305', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '04', '关联集团', '04', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0401', '主体成员', '0401', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0402', '一般成员', '0402', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0403', '外围成员', '0403', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '05', '联保小组', '05', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0501', '小组成员', '0501', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '06', '家庭关系(法人代表)', '06', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0601', '配偶(法人代表)', '0601', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0602', '父母(法人代表)', '0602', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0603', '子女(法人代表)', '0603', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0604', '其他血亲(法人代表)', '0604', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0605', '其他姻亲(法人代表)', '0605', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0606', '其他姻亲(法人代表)', '0605', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0607', '其他姻亲(法人代表)', '0605', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '0608', '其他姻亲(法人代表)', '0605', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '51', '任职', '51', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '5100', '法人代表(任职)', '5100', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '5101', '公司董事长(任职)', '5101', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '5102', '公司总经理/厂长/CEO(任职)', '5102', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '5103', '财务主管/CFO(任职)', '5103', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '5104', '授权经办人(任职)', '5104', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '5105', '部门经理(任职)', '5105', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '5106', '董事(任职)', '5106', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '5108', '监事(任职)', '5108', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '5109', '实际控制人(任职)', '5109', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '5199', '其他', '5199', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '52', '资本构成', '52', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '5201', '资金(资本构成)', '5201', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '5202', '技术(资本构成)', '5202', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '5203', '实物(资本构成)', '5203', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '5204', '权利(资本构成)', '5204', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '5205', '其他(资本构成)', '5205', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '54', '关联集团', '54', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '5401', '所属集团', '5401', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '55', '联保小组', '55', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '5501', '所属小组', '5501', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '88', '待定', '88', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '99', '其他', '99', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '9901', '供应商', '9901', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('RelationShip', '9951', '销售商', '9951', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('Sex', '0', '未知的性别', '3', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('Sex', '1', '男性', '1', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('Sex', '2', '女性', '2', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('Sex', '9', '未说明性别', '4', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('YesNo', '0', '模棱两可', '1', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('YesNo', '1', '是', '1', '-1', null, null);
INSERT INTO `t_code_library` VALUES ('YesNo', '2', '否', '2', '-1', null, null);

-- ----------------------------
-- Table structure for t_task
-- ----------------------------
DROP TABLE IF EXISTS `t_task`;
CREATE TABLE `t_task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态：0=停止，1=启动',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `exp` varchar(50) NOT NULL COMMENT '表达式',
  `clazz` varchar(255) NOT NULL COMMENT '实现类',
  `info` varchar(255) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_task
-- ----------------------------
INSERT INTO `t_task` VALUES ('1', '0', '每5s', '*/5 * * * * ?', 'com.zhao.task.EverySecond', '每5s来一发');
INSERT INTO `t_task` VALUES ('2', '0', '每时', '0 0 0/1 * * ?', 'com.zhao.task.EveryHourJob', '每小时统计一次');
INSERT INTO `t_task` VALUES ('12', '0', '每天', '59 59 23 * * ?', 'com.zhao.task.EveryDayJob', '每天23点59分59秒跑一下');
