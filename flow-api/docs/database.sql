/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 8.0.21 : Database - flowable_6_62
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`flowable_6_62` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `flowable_6_62`;

/*Table structure for table `ACT_ADM_DATABASECHANGELOG` */

DROP TABLE IF EXISTS `ACT_ADM_DATABASECHANGELOG`;

CREATE TABLE `ACT_ADM_DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_ADM_DATABASECHANGELOG` */

insert  into `ACT_ADM_DATABASECHANGELOG`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values 
('1','flowable','META-INF/liquibase/flowable-admin-app-db-changelog.xml','2020-11-20 09:29:38',1,'EXECUTED','8:655e3bb142f7d051dfc2d641ee0eeebd','createTable tableName=ACT_ADM_SERVER_CONFIG','',NULL,'3.10.3',NULL,NULL,'5835779685');

/*Table structure for table `ACT_ADM_DATABASECHANGELOGLOCK` */

DROP TABLE IF EXISTS `ACT_ADM_DATABASECHANGELOGLOCK`;

CREATE TABLE `ACT_ADM_DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_ADM_DATABASECHANGELOGLOCK` */

insert  into `ACT_ADM_DATABASECHANGELOGLOCK`(`ID`,`LOCKED`,`LOCKGRANTED`,`LOCKEDBY`) values 
(1,'\0',NULL,NULL);

/*Table structure for table `ACT_ADM_SERVER_CONFIG` */

DROP TABLE IF EXISTS `ACT_ADM_SERVER_CONFIG`;

CREATE TABLE `ACT_ADM_SERVER_CONFIG` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(50) DEFAULT NULL,
  `DESCRIPTION_` varchar(255) DEFAULT NULL,
  `SERVER_ADDRESS_` varchar(100) DEFAULT NULL,
  `PORT_` int DEFAULT NULL,
  `CONTEXT_ROOT_` varchar(100) DEFAULT NULL,
  `REST_ROOT_` varchar(100) DEFAULT NULL,
  `USER_NAME_` varchar(100) DEFAULT NULL,
  `PASSWORD_` varchar(100) DEFAULT NULL,
  `ENDPOINT_TYPE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_ADM_SERVER_CONFIG` */

insert  into `ACT_ADM_SERVER_CONFIG`(`ID_`,`NAME_`,`DESCRIPTION_`,`SERVER_ADDRESS_`,`PORT_`,`CONTEXT_ROOT_`,`REST_ROOT_`,`USER_NAME_`,`PASSWORD_`,`ENDPOINT_TYPE_`,`TENANT_ID_`) values 
('dcda8f99-2acf-11eb-80d9-227918fa15ea','Flowable Process app','Flowable Process REST config','http://localhost',8042,'/','process-api','admin','wf088DItMLLPiQIoM5rajQ==',1,NULL),
('dcdaddba-2acf-11eb-80d9-227918fa15ea','Flowable CMMN app','Flowable CMMN REST config','http://localhost',8042,'/','cmmn-api','admin','wf088DItMLLPiQIoM5rajQ==',5,NULL),
('dcdb2bdb-2acf-11eb-80d9-227918fa15ea','Flowable App app','Flowable App REST config','http://localhost',8042,'/','app-api','admin','wf088DItMLLPiQIoM5rajQ==',6,NULL),
('dcdb79fc-2acf-11eb-80d9-227918fa15ea','Flowable DMN app','Flowable DMN REST config','http://localhost',8042,'/','dmn-api','admin','wf088DItMLLPiQIoM5rajQ==',2,NULL),
('dcdba10d-2acf-11eb-80d9-227918fa15ea','Flowable Form app','Flowable Form REST config','http://localhost',8042,'/','form-api','admin','wf088DItMLLPiQIoM5rajQ==',3,NULL),
('dcdbef2e-2acf-11eb-80d9-227918fa15ea','Flowable Content app','Flowable Content REST config','http://localhost',8042,'/','content-api','admin','wf088DItMLLPiQIoM5rajQ==',4,NULL);

/*Table structure for table `ACT_APP_APPDEF` */

DROP TABLE IF EXISTS `ACT_APP_APPDEF`;

CREATE TABLE `ACT_APP_APPDEF` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) NOT NULL,
  `VERSION_` int NOT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_APP_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`),
  KEY `ACT_IDX_APP_DEF_DPLY` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_APP_DEF_DPLY` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_APP_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_APP_APPDEF` */

insert  into `ACT_APP_APPDEF`(`ID_`,`REV_`,`NAME_`,`KEY_`,`VERSION_`,`CATEGORY_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DESCRIPTION_`,`TENANT_ID_`) values 
('0021c0ee-2e08-11eb-bbd8-227918fa15ea',1,'外出单','out-factory',7,NULL,'0020fd9a-2e08-11eb-bbd8-227918fa15ea','out-factory.app','',''),
('59d4ef43-2bc9-11eb-9d15-227918fa15ea',1,'外出单','out-factory',2,NULL,'59d4c82f-2bc9-11eb-9d15-227918fa15ea','out-factory.app','',''),
('5c0b5344-2d58-11eb-b88c-227918fa15ea',1,'返廠申請單','rehire-form',1,NULL,'5c0ab700-2d58-11eb-b88c-227918fa15ea','rehire-form.app','',''),
('674830f1-2bc8-11eb-9d15-227918fa15ea',1,'外出单','out-factory',1,NULL,'6747bbbd-2bc8-11eb-9d15-227918fa15ea','out-factory.app','',''),
('6d8ba52a-2e03-11eb-8edb-227918fa15ea',1,'外出单','out-factory',5,NULL,'6d8b08e6-2e03-11eb-8edb-227918fa15ea','out-factory.app','',''),
('78509358-2e06-11eb-84ba-227918fa15ea',1,'外出单','out-factory',6,NULL,'784ff714-2e06-11eb-84ba-227918fa15ea','out-factory.app','',''),
('9c68405c-2d55-11eb-b88c-227918fa15ea',1,'MES需求变更','mes-requirement',1,NULL,'9c6707d8-2d55-11eb-b88c-227918fa15ea','mes-requirement.app','',''),
('9f323e69-2e0b-11eb-b42b-227918fa15ea',1,'外出单','out-factory',8,NULL,'9f3105e5-2e0b-11eb-b42b-227918fa15ea','out-factory.app','',''),
('a636a9a3-2e00-11eb-8699-227918fa15ea',1,'外出单','out-factory',4,NULL,'a6360d5f-2e00-11eb-8699-227918fa15ea','out-factory.app','',''),
('a83f9a9e-2d56-11eb-b88c-227918fa15ea',1,'联络单','liaison',1,NULL,'a83efe5a-2d56-11eb-b88c-227918fa15ea','liaison.app','',''),
('be82bcf7-2d29-11eb-b92b-227918fa15ea',1,'发送邮件','send-email',3,NULL,'be8247c4-2d29-11eb-b92b-227918fa15ea','send-email.app','',''),
('ce8688e2-2d57-11eb-b88c-227918fa15ea',1,'FI厂商代码申请单','vendor-code-request-form',1,NULL,'ce8661ce-2d57-11eb-b88c-227918fa15ea','vendor-code-request-form.app','',''),
('d4fd16a1-2d28-11eb-9045-227918fa15ea',1,'发送邮件','send-email',2,NULL,'d4fc7a5e-2d28-11eb-9045-227918fa15ea','send-email.app','',''),
('f1be3863-2d24-11eb-84d4-227918fa15ea',1,'发送邮件','send-email',1,NULL,'f1be3860-2d24-11eb-84d4-227918fa15ea','send-email.app','',''),
('faa2e378-2d29-11eb-9782-227918fa15ea',1,'发送邮件','send-email',4,NULL,'faa1aaf5-2d29-11eb-9782-227918fa15ea','send-email.app','',''),
('fcbc8214-2bcb-11eb-9e90-227918fa15ea',1,'外出单','out-factory',3,NULL,'fcbc33f0-2bcb-11eb-9e90-227918fa15ea','out-factory.app','','');

/*Table structure for table `ACT_APP_DATABASECHANGELOG` */

DROP TABLE IF EXISTS `ACT_APP_DATABASECHANGELOG`;

CREATE TABLE `ACT_APP_DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_APP_DATABASECHANGELOG` */

insert  into `ACT_APP_DATABASECHANGELOG`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values 
('1','flowable','org/flowable/app/db/liquibase/flowable-app-db-changelog.xml','2020-11-20 09:29:36',1,'EXECUTED','8:496fc778bdf2ab13f2e1926d0e63e0a2','createTable tableName=ACT_APP_DEPLOYMENT; createTable tableName=ACT_APP_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_APP_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_APP_RSRC_DPL, referencedTableName=ACT_APP_DEPLOYMENT; createIndex...','',NULL,'3.10.3',NULL,NULL,'5835777901'),
('2','flowable','org/flowable/app/db/liquibase/flowable-app-db-changelog.xml','2020-11-20 09:29:36',2,'EXECUTED','8:ccea9ebfb6c1f8367ca4dd473fcbb7db','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_APP_DEPLOYMENT','',NULL,'3.10.3',NULL,NULL,'5835777901'),
('3','flowable','org/flowable/app/db/liquibase/flowable-app-db-changelog.xml','2020-11-20 09:29:36',3,'EXECUTED','8:f1f8aff320aade831944ebad24355f3d','createIndex indexName=ACT_IDX_APP_DEF_UNIQ, tableName=ACT_APP_APPDEF','',NULL,'3.10.3',NULL,NULL,'5835777901');

/*Table structure for table `ACT_APP_DATABASECHANGELOGLOCK` */

DROP TABLE IF EXISTS `ACT_APP_DATABASECHANGELOGLOCK`;

CREATE TABLE `ACT_APP_DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_APP_DATABASECHANGELOGLOCK` */

insert  into `ACT_APP_DATABASECHANGELOGLOCK`(`ID`,`LOCKED`,`LOCKGRANTED`,`LOCKEDBY`) values 
(1,'\0',NULL,NULL);

/*Table structure for table `ACT_APP_DEPLOYMENT` */

DROP TABLE IF EXISTS `ACT_APP_DEPLOYMENT`;

CREATE TABLE `ACT_APP_DEPLOYMENT` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_APP_DEPLOYMENT` */

insert  into `ACT_APP_DEPLOYMENT`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`DEPLOY_TIME_`,`TENANT_ID_`) values 
('0020fd9a-2e08-11eb-bbd8-227918fa15ea','外出单',NULL,'out-factory','2020-11-23 21:49:06.171',''),
('59d4c82f-2bc9-11eb-9d15-227918fa15ea','外出单',NULL,'out-factory','2020-11-21 01:15:36.047',''),
('5c0ab700-2d58-11eb-b88c-227918fa15ea','返廠申請單',NULL,'rehire-form','2020-11-23 00:51:48.951',''),
('6747bbbd-2bc8-11eb-9d15-227918fa15ea','外出单',NULL,'out-factory','2020-11-21 01:08:49.114',''),
('6d8b08e6-2e03-11eb-8edb-227918fa15ea','外出单',NULL,'out-factory','2020-11-23 21:16:22.254',''),
('784ff714-2e06-11eb-84ba-227918fa15ea','外出单',NULL,'out-factory','2020-11-23 21:38:08.812',''),
('9c6707d8-2d55-11eb-b88c-227918fa15ea','MES需求变更',NULL,'mes-requirement','2020-11-23 00:32:08.440',''),
('9f3105e5-2e0b-11eb-b42b-227918fa15ea','外出单',NULL,'out-factory','2020-11-23 22:15:01.524',''),
('a6360d5f-2e00-11eb-8699-227918fa15ea','外出单',NULL,'out-factory','2020-11-23 20:56:28.837',''),
('a83efe5a-2d56-11eb-b88c-227918fa15ea','联络单',NULL,'liaison','2020-11-23 00:39:37.807',''),
('be8247c4-2d29-11eb-b92b-227918fa15ea','发送邮件',NULL,'send-email','2020-11-22 19:18:07.805',''),
('ce8661ce-2d57-11eb-b88c-227918fa15ea','FI厂商代码申请单',NULL,'vendor-code-request-form','2020-11-23 00:47:51.525',''),
('d4fc7a5e-2d28-11eb-9045-227918fa15ea','发送邮件',NULL,'send-email','2020-11-22 19:11:36.019',''),
('f1be3860-2d24-11eb-84d4-227918fa15ea','发送邮件',NULL,'send-email','2020-11-22 18:43:46.278',''),
('faa1aaf5-2d29-11eb-9782-227918fa15ea','发送邮件',NULL,'send-email','2020-11-22 19:19:48.674',''),
('fcbc33f0-2bcb-11eb-9e90-227918fa15ea','外出单',NULL,'out-factory','2020-11-21 01:34:28.348','');

/*Table structure for table `ACT_APP_DEPLOYMENT_RESOURCE` */

DROP TABLE IF EXISTS `ACT_APP_DEPLOYMENT_RESOURCE`;

CREATE TABLE `ACT_APP_DEPLOYMENT_RESOURCE` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_APP_RSRC_DPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_APP_RSRC_DPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_APP_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_APP_DEPLOYMENT_RESOURCE` */

insert  into `ACT_APP_DEPLOYMENT_RESOURCE`(`ID_`,`NAME_`,`DEPLOYMENT_ID_`,`RESOURCE_BYTES_`) values 
('0020fd9b-2e08-11eb-bbd8-227918fa15ea','out-factory.bpmn','0020fd9a-2e08-11eb-bbd8-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"外出单\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"填单\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"申请人确认\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${skip}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"主管审核\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('0020fd9c-2e08-11eb-bbd8-227918fa15ea','out-factory.app','0020fd9a-2e08-11eb-bbd8-227918fa15ea','{\"key\":\"out-factory\",\"name\":\"外出单\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('0020fd9d-2e08-11eb-bbd8-227918fa15ea','form-out-factory.form','0020fd9a-2e08-11eb-bbd8-227918fa15ea','{\"name\":\"外出单\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"主旨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"人员编号\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\",\"name\":\"允许跳过\",\"type\":\"boolean\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"skip\",\"name\":\"是否跳过\",\"type\":\"boolean\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"描述\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('59d4c830-2bc9-11eb-9d15-227918fa15ea','out-factory.bpmn','59d4c82f-2bc9-11eb-9d15-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"外出单\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"填单\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:formProperty id=\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\" name=\"FLOWABLE_SKIP_EXPRESSION_ENABLED\" type=\"boolean\" default=\"true\"></flowable:formProperty>\n        <flowable:formProperty id=\"manager\" name=\"所属领导\" type=\"string\" default=\"manager\"></flowable:formProperty>\n      </extensionElements>\n    </startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"申请人确认\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${_FLOWABLE_SKIP_EXPRESSION_ENABLED==true}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"主管审核\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('59d4c831-2bc9-11eb-9d15-227918fa15ea','out-factory.app','59d4c82f-2bc9-11eb-9d15-227918fa15ea','{\"key\":\"out-factory\",\"name\":\"外出单\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('59d4c832-2bc9-11eb-9d15-227918fa15ea','form-out-factory.form','59d4c82f-2bc9-11eb-9d15-227918fa15ea','{\"name\":\"外出单\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"主旨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"人员编号\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"描述\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('5c0ab701-2d58-11eb-b88c-227918fa15ea','rehire-form.bpmn','5c0ab700-2d58-11eb-b88c-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"rehire-form\" name=\"返廠申請單\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" flowable:initiator=\"initiator\" flowable:formKey=\"rehire-form\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-345367B5-F2D6-40E7-A1B1-D802F28D51BD\" sourceRef=\"startEvent1\" targetRef=\"sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\"></sequenceFlow>\n    <endEvent id=\"sid-28104B17-66FC-492B-8654-D19352BABECE\"></endEvent>\n    <sequenceFlow id=\"sid-6A43BA7B-9987-46BC-AB2A-44F15554599B\" sourceRef=\"sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\" targetRef=\"sid-28104B17-66FC-492B-8654-D19352BABECE\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_rehire-form\">\n    <bpmndi:BPMNPlane bpmnElement=\"rehire-form\" id=\"BPMNPlane_rehire-form\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\" id=\"BPMNShape_sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-28104B17-66FC-492B-8654-D19352BABECE\" id=\"BPMNShape_sid-28104B17-66FC-492B-8654-D19352BABECE\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-6A43BA7B-9987-46BC-AB2A-44F15554599B\" id=\"BPMNEdge_sid-6A43BA7B-9987-46BC-AB2A-44F15554599B\">\n        <omgdi:waypoint x=\"274.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-345367B5-F2D6-40E7-A1B1-D802F28D51BD\" id=\"BPMNEdge_sid-345367B5-F2D6-40E7-A1B1-D802F28D51BD\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('5c0ab702-2d58-11eb-b88c-227918fa15ea','form-rehire-form.form','5c0ab700-2d58-11eb-b88c-227918fa15ea','{\"name\":\"返廠申請單\",\"key\":\"rehire-form\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null}],\"outcomes\":[]}'),
('5c0ab703-2d58-11eb-b88c-227918fa15ea','rehire-form.app','5c0ab700-2d58-11eb-b88c-227918fa15ea','{\"key\":\"rehire-form\",\"name\":\"返廠申請單\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('6747bbbe-2bc8-11eb-9d15-227918fa15ea','out-factory.bpmn','6747bbbd-2bc8-11eb-9d15-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"外出单\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"填单\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:formProperty id=\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\" name=\"FLOWABLE_SKIP_EXPRESSION_ENABLED\" type=\"boolean\" default=\"true\"></flowable:formProperty>\n      </extensionElements>\n    </startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"申请人确认\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${_FLOWABLE_SKIP_EXPRESSION_ENABLED==true}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"主管审核\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('6747bbbf-2bc8-11eb-9d15-227918fa15ea','out-factory.app','6747bbbd-2bc8-11eb-9d15-227918fa15ea','{\"key\":\"out-factory\",\"name\":\"外出单\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('6747bbc0-2bc8-11eb-9d15-227918fa15ea','form-out-factory.form','6747bbbd-2bc8-11eb-9d15-227918fa15ea','{\"name\":\"外出单\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"主旨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"人员编号\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"描述\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('6d8b08e7-2e03-11eb-8edb-227918fa15ea','out-factory.bpmn','6d8b08e6-2e03-11eb-8edb-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"外出单\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"填单\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"申请人确认\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${skip==true}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"主管审核\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('6d8b08e8-2e03-11eb-8edb-227918fa15ea','out-factory.app','6d8b08e6-2e03-11eb-8edb-227918fa15ea','{\"key\":\"out-factory\",\"name\":\"外出单\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('6d8b08e9-2e03-11eb-8edb-227918fa15ea','form-out-factory.form','6d8b08e6-2e03-11eb-8edb-227918fa15ea','{\"name\":\"外出单\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"主旨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"人员编号\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"描述\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('784ff715-2e06-11eb-84ba-227918fa15ea','out-factory.bpmn','784ff714-2e06-11eb-84ba-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"外出单\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"填单\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"申请人确认\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${skip}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"主管审核\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('784ff716-2e06-11eb-84ba-227918fa15ea','out-factory.app','784ff714-2e06-11eb-84ba-227918fa15ea','{\"key\":\"out-factory\",\"name\":\"外出单\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('784ff717-2e06-11eb-84ba-227918fa15ea','form-out-factory.form','784ff714-2e06-11eb-84ba-227918fa15ea','{\"name\":\"外出单\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"主旨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"人员编号\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"描述\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('9c6707d9-2d55-11eb-b88c-227918fa15ea','form-mes-requirement.form','9c6707d8-2d55-11eb-b88c-227918fa15ea','{\"name\":\"MES需求变更\",\"key\":\"mes-requirement\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"主旨\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"提案人员\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"需求变更描述\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('9c6707da-2d55-11eb-b88c-227918fa15ea','mes-requirement.app','9c6707d8-2d55-11eb-b88c-227918fa15ea','{\"key\":\"mes-requirement\",\"name\":\"MES需求变更\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('9c6707db-2d55-11eb-b88c-227918fa15ea','mes-requirement.bpmn','9c6707d8-2d55-11eb-b88c-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"mes-requirement\" name=\"MES需求变更\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"填单\" flowable:initiator=\"initiator\" flowable:formKey=\"mes-requirement\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-33868E85-5876-4712-9136-27C22F40C24D\" name=\"填单人确认\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-07BACF0C-406A-4E40-A1FC-00A0BC020C59\" sourceRef=\"startEvent1\" targetRef=\"sid-33868E85-5876-4712-9136-27C22F40C24D\"></sequenceFlow>\n    <userTask id=\"sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\" name=\"提案部门主管\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-9D4E7218-A416-4E13-8129-6902D1CEDBD3\" sourceRef=\"sid-33868E85-5876-4712-9136-27C22F40C24D\" targetRef=\"sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\"></sequenceFlow>\n    <userTask id=\"sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\" name=\"Coordinator\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-3B1C7B5B-E126-4DBE-9960-3332CA8953FC\" sourceRef=\"sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\" targetRef=\"sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\"></sequenceFlow>\n    <userTask id=\"sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\" name=\"DEV TL\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-75B89205-F7AD-4B61-9772-F69F67FC5A4B\" sourceRef=\"sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\" targetRef=\"sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\"></sequenceFlow>\n    <userTask id=\"sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\" name=\"PSM\" flowable:formFieldValidation=\"true\"></userTask>\n    <userTask id=\"sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\" name=\"MESM\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-6F9F2036-70B8-4F2E-AF81-4B54AA19CD43\" sourceRef=\"sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\" targetRef=\"sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\"></sequenceFlow>\n    <userTask id=\"sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\" name=\"PM\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-C4E02C10-B6FB-47DF-8F9F-346B5D75275C\" sourceRef=\"sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\" targetRef=\"sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\"></sequenceFlow>\n    <sequenceFlow id=\"sid-2090AF02-C11C-4993-9CC4-F4D95E4F6C72\" sourceRef=\"sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\" targetRef=\"sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\"></sequenceFlow>\n    <endEvent id=\"sid-4C4E0E45-0E10-40C1-A1A5-B4BC491F8E1E\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-19C22622-BF57-43FF-BE8C-D74EDD41782F\" sourceRef=\"sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\" targetRef=\"sid-4C4E0E45-0E10-40C1-A1A5-B4BC491F8E1E\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_mes-requirement\">\n    <bpmndi:BPMNPlane bpmnElement=\"mes-requirement\" id=\"BPMNPlane_mes-requirement\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-33868E85-5876-4712-9136-27C22F40C24D\" id=\"BPMNShape_sid-33868E85-5876-4712-9136-27C22F40C24D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\" id=\"BPMNShape_sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\" id=\"BPMNShape_sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"465.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\" id=\"BPMNShape_sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"610.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\" id=\"BPMNShape_sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"255.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\" id=\"BPMNShape_sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"255.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\" id=\"BPMNShape_sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"465.0\" y=\"255.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-4C4E0E45-0E10-40C1-A1A5-B4BC491F8E1E\" id=\"BPMNShape_sid-4C4E0E45-0E10-40C1-A1A5-B4BC491F8E1E\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"610.0\" y=\"281.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-07BACF0C-406A-4E40-A1FC-00A0BC020C59\" id=\"BPMNEdge_sid-07BACF0C-406A-4E40-A1FC-00A0BC020C59\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C4E02C10-B6FB-47DF-8F9F-346B5D75275C\" id=\"BPMNEdge_sid-C4E02C10-B6FB-47DF-8F9F-346B5D75275C\">\n        <omgdi:waypoint x=\"419.94999999990824\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"464.9999999999807\" y=\"295.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2090AF02-C11C-4993-9CC4-F4D95E4F6C72\" id=\"BPMNEdge_sid-2090AF02-C11C-4993-9CC4-F4D95E4F6C72\">\n        <omgdi:waypoint x=\"660.0\" y=\"217.95000000000002\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"660.0\" y=\"234.99999999999994\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"225.0\" y=\"234.99999999999994\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"225.0\" y=\"255.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3B1C7B5B-E126-4DBE-9960-3332CA8953FC\" id=\"BPMNEdge_sid-3B1C7B5B-E126-4DBE-9960-3332CA8953FC\">\n        <omgdi:waypoint x=\"419.94999999999067\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"464.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-75B89205-F7AD-4B61-9772-F69F67FC5A4B\" id=\"BPMNEdge_sid-75B89205-F7AD-4B61-9772-F69F67FC5A4B\">\n        <omgdi:waypoint x=\"564.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"609.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9D4E7218-A416-4E13-8129-6902D1CEDBD3\" id=\"BPMNEdge_sid-9D4E7218-A416-4E13-8129-6902D1CEDBD3\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-6F9F2036-70B8-4F2E-AF81-4B54AA19CD43\" id=\"BPMNEdge_sid-6F9F2036-70B8-4F2E-AF81-4B54AA19CD43\">\n        <omgdi:waypoint x=\"274.94999999974334\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"295.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-19C22622-BF57-43FF-BE8C-D74EDD41782F\" id=\"BPMNEdge_sid-19C22622-BF57-43FF-BE8C-D74EDD41782F\">\n        <omgdi:waypoint x=\"564.95\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"295.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('9f3105e6-2e0b-11eb-b42b-227918fa15ea','out-factory.bpmn','9f3105e5-2e0b-11eb-b42b-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"外出单\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"填单\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"申请人确认\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${skip}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"主管审核\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('9f3105e7-2e0b-11eb-b42b-227918fa15ea','out-factory.app','9f3105e5-2e0b-11eb-b42b-227918fa15ea','{\"key\":\"out-factory\",\"name\":\"外出单\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('9f3105e8-2e0b-11eb-b42b-227918fa15ea','form-out-factory.form','9f3105e5-2e0b-11eb-b42b-227918fa15ea','{\"name\":\"外出单\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"主旨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"人员编号\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\",\"name\":\"允许跳过\",\"type\":\"boolean\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"skip\",\"name\":\"是否跳过\",\"type\":\"boolean\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"manager\",\"name\":\"所属主管\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":\"manager\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"描述\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('a6363470-2e00-11eb-8699-227918fa15ea','out-factory.bpmn','a6360d5f-2e00-11eb-8699-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"外出单\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"填单\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"申请人确认\" flowable:assignee=\"${INITIATOR}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${skip==true}\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"主管审核\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('a6363471-2e00-11eb-8699-227918fa15ea','out-factory.app','a6360d5f-2e00-11eb-8699-227918fa15ea','{\"key\":\"out-factory\",\"name\":\"外出单\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('a6363472-2e00-11eb-8699-227918fa15ea','form-out-factory.form','a6360d5f-2e00-11eb-8699-227918fa15ea','{\"name\":\"外出单\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"主旨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"人员编号\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"描述\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('a83efe5b-2d56-11eb-b88c-227918fa15ea','form-liaison.form','a83efe5a-2d56-11eb-b88c-227918fa15ea','{\"name\":\"联络单\",\"key\":\"liaison\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"subject\",\"name\":\"主题\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${subject}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"department\",\"name\":\"接收单位\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${department}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"content\",\"name\":\"正文\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${content}\",\"layout\":null}],\"outcomes\":[]}'),
('a83efe5c-2d56-11eb-b88c-227918fa15ea','liaison.bpmn','a83efe5a-2d56-11eb-b88c-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"liaison\" name=\"联络单\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"填单\" flowable:initiator=\"initiator\" flowable:formKey=\"liaison\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\" name=\"填单人确认\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-8837ACC1-9927-4EF2-AB27-6113B895B400\" sourceRef=\"startEvent1\" targetRef=\"sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\"></sequenceFlow>\n    <userTask id=\"sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\" name=\"审核中\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-7BA30D19-708A-4A69-A05E-3B5FC38E05C5\" sourceRef=\"sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\" targetRef=\"sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\"></sequenceFlow>\n    <endEvent id=\"sid-7387C76A-E91A-40AA-A84A-11C8155AD7C0\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-0255207B-6BE7-449E-8B53-6D87AF68964A\" sourceRef=\"sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\" targetRef=\"sid-7387C76A-E91A-40AA-A84A-11C8155AD7C0\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_liaison\">\n    <bpmndi:BPMNPlane bpmnElement=\"liaison\" id=\"BPMNPlane_liaison\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\" id=\"BPMNShape_sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\" id=\"BPMNShape_sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-7387C76A-E91A-40AA-A84A-11C8155AD7C0\" id=\"BPMNShape_sid-7387C76A-E91A-40AA-A84A-11C8155AD7C0\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7BA30D19-708A-4A69-A05E-3B5FC38E05C5\" id=\"BPMNEdge_sid-7BA30D19-708A-4A69-A05E-3B5FC38E05C5\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8837ACC1-9927-4EF2-AB27-6113B895B400\" id=\"BPMNEdge_sid-8837ACC1-9927-4EF2-AB27-6113B895B400\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-0255207B-6BE7-449E-8B53-6D87AF68964A\" id=\"BPMNEdge_sid-0255207B-6BE7-449E-8B53-6D87AF68964A\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('a83efe5d-2d56-11eb-b88c-227918fa15ea','liaison.app','a83efe5a-2d56-11eb-b88c-227918fa15ea','{\"key\":\"liaison\",\"name\":\"联络单\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('be8247c5-2d29-11eb-b92b-227918fa15ea','send-email.app','be8247c4-2d29-11eb-b92b-227918fa15ea','{\"key\":\"send-email\",\"name\":\"发送邮件\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('be8247c6-2d29-11eb-b92b-227918fa15ea','send-email.bpmn','be8247c4-2d29-11eb-b92b-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"send-email\" name=\"发送邮件\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"start\" flowable:initiator=\"initiator\" flowable:formFieldValidation=\"true\"></startEvent>\n    <sequenceFlow id=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" sourceRef=\"startEvent1\" targetRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\"></sequenceFlow>\n    <endEvent id=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" name=\"end\"></endEvent>\n    <sequenceFlow id=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" sourceRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" targetRef=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\"></sequenceFlow>\n    <serviceTask id=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" name=\"SendEmail\" flowable:type=\"mail\">\n      <extensionElements>\n        <flowable:field name=\"to\">\n          <flowable:expression><![CDATA[${emailTo}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"from\">\n          <flowable:expression><![CDATA[${emailFrom}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"subject\">\n          <flowable:expression><![CDATA[${emailSubject}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"cc\">\n          <flowable:expression><![CDATA[${emailCC}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"text\">\n          <flowable:expression><![CDATA[${emailContent}]]></flowable:expression>\n        </flowable:field>\n      </extensionElements>\n    </serviceTask>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_send-email\">\n    <bpmndi:BPMNPlane bpmnElement=\"send-email\" id=\"BPMNPlane_send-email\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" id=\"BPMNShape_sid-E4D02A62-9237-4DB5-88D6-388754AE1687\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" id=\"BPMNShape_sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"165.0\" y=\"135.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" id=\"BPMNEdge_sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\">\n        <omgdi:waypoint x=\"129.94340692927761\" y=\"177.55019845363262\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"164.99999999999906\" y=\"176.4985\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" id=\"BPMNEdge_sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\">\n        <omgdi:waypoint x=\"264.9499999999882\" y=\"175.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"292.5\" y=\"175.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"292.5\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('ce8661cf-2d57-11eb-b88c-227918fa15ea','vendor-code-request-form.bpmn','ce8661ce-2d57-11eb-b88c-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"vendor-code-request-form\" name=\"FI廠商代碼申請單\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" flowable:initiator=\"initiator\" flowable:formKey=\"vendor-code-request-form\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-E3CDDACB-2B12-4398-966D-C78588092BD6\" sourceRef=\"startEvent1\" targetRef=\"sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\"></sequenceFlow>\n    <endEvent id=\"sid-860C90D4-77B6-4336-A684-FBD28C95B009\"></endEvent>\n    <sequenceFlow id=\"sid-61149916-1C68-428E-987A-8C94F5454F96\" sourceRef=\"sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\" targetRef=\"sid-860C90D4-77B6-4336-A684-FBD28C95B009\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_vendor-code-request-form\">\n    <bpmndi:BPMNPlane bpmnElement=\"vendor-code-request-form\" id=\"BPMNPlane_vendor-code-request-form\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\" id=\"BPMNShape_sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-860C90D4-77B6-4336-A684-FBD28C95B009\" id=\"BPMNShape_sid-860C90D4-77B6-4336-A684-FBD28C95B009\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-61149916-1C68-428E-987A-8C94F5454F96\" id=\"BPMNEdge_sid-61149916-1C68-428E-987A-8C94F5454F96\">\n        <omgdi:waypoint x=\"274.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-E3CDDACB-2B12-4398-966D-C78588092BD6\" id=\"BPMNEdge_sid-E3CDDACB-2B12-4398-966D-C78588092BD6\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('ce8661d0-2d57-11eb-b88c-227918fa15ea','form-vendor-code-request-form.form','ce8661ce-2d57-11eb-b88c-227918fa15ea','{\"name\":\"FI厂商代码申请单\",\"key\":\"vendor-code-request-form\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null}],\"outcomes\":[]}'),
('ce8661d1-2d57-11eb-b88c-227918fa15ea','vendor-code-request-form.app','ce8661ce-2d57-11eb-b88c-227918fa15ea','{\"key\":\"vendor-code-request-form\",\"name\":\"FI厂商代码申请单\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('d4fc7a5f-2d28-11eb-9045-227918fa15ea','send-email.app','d4fc7a5e-2d28-11eb-9045-227918fa15ea','{\"key\":\"send-email\",\"name\":\"发送邮件\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('d4fc7a60-2d28-11eb-9045-227918fa15ea','send-email.bpmn','d4fc7a5e-2d28-11eb-9045-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"send-email\" name=\"发送邮件\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"start\" flowable:initiator=\"initiator\" flowable:formFieldValidation=\"true\"></startEvent>\n    <sequenceFlow id=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" sourceRef=\"startEvent1\" targetRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\"></sequenceFlow>\n    <endEvent id=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" name=\"end\"></endEvent>\n    <sequenceFlow id=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" sourceRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" targetRef=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\"></sequenceFlow>\n    <serviceTask id=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" name=\"SendEmail\" flowable:type=\"mail\">\n      <extensionElements>\n        <flowable:field name=\"to\">\n          <flowable:expression><![CDATA[${emailTo}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"from\">\n          <flowable:expression><![CDATA[${emailFrom}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"subject\">\n          <flowable:expression><![CDATA[${emailSubject}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"cc\">\n          <flowable:expression><![CDATA[${emailCC}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"text\">\n          <flowable:expression><![CDATA[${emailContent}]]></flowable:expression>\n        </flowable:field>\n      </extensionElements>\n    </serviceTask>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_send-email\">\n    <bpmndi:BPMNPlane bpmnElement=\"send-email\" id=\"BPMNPlane_send-email\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" id=\"BPMNShape_sid-E4D02A62-9237-4DB5-88D6-388754AE1687\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" id=\"BPMNShape_sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" id=\"BPMNEdge_sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" id=\"BPMNEdge_sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\">\n        <omgdi:waypoint x=\"274.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('f1be3861-2d24-11eb-84d4-227918fa15ea','send-email.app','f1be3860-2d24-11eb-84d4-227918fa15ea','{\"key\":\"send-email\",\"name\":\"发送邮件\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('f1be3862-2d24-11eb-84d4-227918fa15ea','send-email.bpmn','f1be3860-2d24-11eb-84d4-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"send-email\" name=\"发送邮件\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"start\" flowable:initiator=\"initiator\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:formProperty id=\"emailFrom\" name=\"发件人\" type=\"string\" default=\"delta@flowable.com\"></flowable:formProperty>\n        <flowable:formProperty id=\"emailTo\" name=\"收件人\" type=\"string\" default=\"delta@flowable.com\"></flowable:formProperty>\n        <flowable:formProperty id=\"emailCC\" name=\"抄送\" type=\"string\"></flowable:formProperty>\n        <flowable:formProperty id=\"emailSubject\" name=\"主题\" type=\"string\" default=\"测试\"></flowable:formProperty>\n        <flowable:formProperty id=\"emailContent\" name=\"正文\" type=\"string\" default=\"这是一个测试邮件\"></flowable:formProperty>\n      </extensionElements>\n    </startEvent>\n    <sequenceFlow id=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" sourceRef=\"startEvent1\" targetRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\"></sequenceFlow>\n    <endEvent id=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" name=\"end\"></endEvent>\n    <sequenceFlow id=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" sourceRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" targetRef=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\"></sequenceFlow>\n    <serviceTask id=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" name=\"SendEmail\" flowable:type=\"mail\">\n      <extensionElements>\n        <flowable:field name=\"to\">\n          <flowable:expression><![CDATA[${emailTo}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"from\">\n          <flowable:expression><![CDATA[${emailFrom}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"subject\">\n          <flowable:expression><![CDATA[${emailSubject}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"cc\">\n          <flowable:expression><![CDATA[${emailCC}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"text\">\n          <flowable:expression><![CDATA[${emailContent}]]></flowable:expression>\n        </flowable:field>\n      </extensionElements>\n    </serviceTask>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_send-email\">\n    <bpmndi:BPMNPlane bpmnElement=\"send-email\" id=\"BPMNPlane_send-email\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" id=\"BPMNShape_sid-E4D02A62-9237-4DB5-88D6-388754AE1687\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" id=\"BPMNShape_sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" id=\"BPMNEdge_sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" id=\"BPMNEdge_sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\">\n        <omgdi:waypoint x=\"274.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('faa1aaf6-2d29-11eb-9782-227918fa15ea','send-email.app','faa1aaf5-2d29-11eb-9782-227918fa15ea','{\"key\":\"send-email\",\"name\":\"发送邮件\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('faa1aaf7-2d29-11eb-9782-227918fa15ea','send-email.bpmn','faa1aaf5-2d29-11eb-9782-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"send-email\" name=\"发送邮件\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"start\" flowable:initiator=\"initiator\" flowable:formFieldValidation=\"true\"></startEvent>\n    <sequenceFlow id=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" sourceRef=\"startEvent1\" targetRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\"></sequenceFlow>\n    <endEvent id=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" name=\"end\"></endEvent>\n    <sequenceFlow id=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" sourceRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" targetRef=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\"></sequenceFlow>\n    <serviceTask id=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" name=\"SendEmail\" flowable:type=\"mail\">\n      <extensionElements>\n        <flowable:field name=\"to\">\n          <flowable:expression><![CDATA[${emailTo}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"from\">\n          <flowable:expression><![CDATA[${emailFrom}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"subject\">\n          <flowable:expression><![CDATA[${emailSubject}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"text\">\n          <flowable:expression><![CDATA[${emailContent}]]></flowable:expression>\n        </flowable:field>\n      </extensionElements>\n    </serviceTask>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_send-email\">\n    <bpmndi:BPMNPlane bpmnElement=\"send-email\" id=\"BPMNPlane_send-email\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" id=\"BPMNShape_sid-E4D02A62-9237-4DB5-88D6-388754AE1687\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" id=\"BPMNShape_sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"180.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" id=\"BPMNEdge_sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\">\n        <omgdi:waypoint x=\"129.9499986183554\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"180.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" id=\"BPMNEdge_sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\">\n        <omgdi:waypoint x=\"279.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('fcbc33f1-2bcb-11eb-9e90-227918fa15ea','out-factory.bpmn','fcbc33f0-2bcb-11eb-9e90-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"外出单\" isExecutable=\"true\">\n    <dataObject id=\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\" name=\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\" itemSubjectRef=\"xsd:boolean\">\n      <extensionElements>\n        <flowable:value>true</flowable:value>\n      </extensionElements>\n    </dataObject>\n    <dataObject id=\"manager\" name=\"所属领导\" itemSubjectRef=\"xsd:string\">\n      <extensionElements>\n        <flowable:value>manager</flowable:value>\n      </extensionElements>\n    </dataObject>\n    <startEvent id=\"startEvent1\" name=\"填单\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"申请人确认\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${_FLOWABLE_SKIP_EXPRESSION_ENABLED==true}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"主管审核\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('fcbc33f2-2bcb-11eb-9e90-227918fa15ea','out-factory.app','fcbc33f0-2bcb-11eb-9e90-227918fa15ea','{\"key\":\"out-factory\",\"name\":\"外出单\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('fcbc33f3-2bcb-11eb-9e90-227918fa15ea','form-out-factory.form','fcbc33f0-2bcb-11eb-9e90-227918fa15ea','{\"name\":\"外出单\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"主旨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"人员编号\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"描述\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}');

/*Table structure for table `ACT_CMMN_CASEDEF` */

DROP TABLE IF EXISTS `ACT_CMMN_CASEDEF`;

CREATE TABLE `ACT_CMMN_CASEDEF` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) NOT NULL,
  `VERSION_` int NOT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` bit(1) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  `DGRM_RESOURCE_NAME_` varchar(4000) DEFAULT NULL,
  `HAS_START_FORM_KEY_` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_CASE_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`),
  KEY `ACT_IDX_CASE_DEF_DPLY` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_CASE_DEF_DPLY` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_CMMN_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_CMMN_CASEDEF` */

/*Table structure for table `ACT_CMMN_DATABASECHANGELOG` */

DROP TABLE IF EXISTS `ACT_CMMN_DATABASECHANGELOG`;

CREATE TABLE `ACT_CMMN_DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_CMMN_DATABASECHANGELOG` */

insert  into `ACT_CMMN_DATABASECHANGELOG`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values 
('1','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2020-11-20 09:29:34',1,'EXECUTED','8:8b4b922d90b05ff27483abefc9597aa6','createTable tableName=ACT_CMMN_DEPLOYMENT; createTable tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_CMMN_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_CMMN_RSRC_DPL, referencedTableName=ACT_CMMN_DEPLOYMENT; create...','',NULL,'3.10.3',NULL,NULL,'5835775466'),
('2','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2020-11-20 09:29:34',2,'EXECUTED','8:65e39b3d385706bb261cbeffe7533cbe','addColumn tableName=ACT_CMMN_CASEDEF; addColumn tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST','',NULL,'3.10.3',NULL,NULL,'5835775466'),
('3','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2020-11-20 09:29:34',3,'EXECUTED','8:c01f6e802b49436b4489040da3012359','addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_PLAN_ITEM_STAGE_INST, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableNam...','',NULL,'3.10.3',NULL,NULL,'5835775466'),
('4','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2020-11-20 09:29:34',4,'EXECUTED','8:e40d29cb79345b7fb5afd38a7f0ba8fc','createTable tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_MIL_INST; addColumn tableName=ACT_CMMN_HI_MIL_INST','',NULL,'3.10.3',NULL,NULL,'5835775466'),
('5','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2020-11-20 09:29:35',5,'EXECUTED','8:70349de472f87368dcdec971a10311a0','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_CMMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_CASE_INST; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; modifyDataType columnName=T...','',NULL,'3.10.3',NULL,NULL,'5835775466'),
('6','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2020-11-20 09:29:35',6,'EXECUTED','8:10e82e26a7fee94c32a92099c059c18c','createIndex indexName=ACT_IDX_CASE_DEF_UNIQ, tableName=ACT_CMMN_CASEDEF','',NULL,'3.10.3',NULL,NULL,'5835775466'),
('7','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2020-11-20 09:29:35',7,'EXECUTED','8:530bc81a1e30618ccf4a2da1f7c6c043','renameColumn newColumnName=CREATE_TIME_, oldColumnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; renameColumn newColumnName=CREATE_TIME_, oldColumnName=CREATED_TIME_, tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_P...','',NULL,'3.10.3',NULL,NULL,'5835775466'),
('8','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2020-11-20 09:29:35',8,'EXECUTED','8:e8c2eb1ce28bc301efe07e0e29757781','addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST','',NULL,'3.10.3',NULL,NULL,'5835775466'),
('9','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2020-11-20 09:29:35',9,'EXECUTED','8:4cb4782b9bdec5ced2a64c525aa7b3a0','addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST','',NULL,'3.10.3',NULL,NULL,'5835775466'),
('10','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2020-11-20 09:29:36',10,'EXECUTED','8:341c16be247f5d17badc9809da8691f9','addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_CASE_INST_REF_ID_, tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE...','',NULL,'3.10.3',NULL,NULL,'5835775466'),
('11','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2020-11-20 09:29:36',11,'EXECUTED','8:d7c4da9276bcfffbfb0ebfb25e3f7b05','addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST','',NULL,'3.10.3',NULL,NULL,'5835775466'),
('12','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2020-11-20 09:29:36',12,'EXECUTED','8:adf4ecc45f2aa9a44a5626b02e1d6f98','addColumn tableName=ACT_CMMN_RU_CASE_INST','',NULL,'3.10.3',NULL,NULL,'5835775466'),
('13','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2020-11-20 09:29:36',13,'EXECUTED','8:7550626f964ab5518464709408333ec1','addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST','',NULL,'3.10.3',NULL,NULL,'5835775466');

/*Table structure for table `ACT_CMMN_DATABASECHANGELOGLOCK` */

DROP TABLE IF EXISTS `ACT_CMMN_DATABASECHANGELOGLOCK`;

CREATE TABLE `ACT_CMMN_DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_CMMN_DATABASECHANGELOGLOCK` */

insert  into `ACT_CMMN_DATABASECHANGELOGLOCK`(`ID`,`LOCKED`,`LOCKGRANTED`,`LOCKEDBY`) values 
(1,'\0',NULL,NULL);

/*Table structure for table `ACT_CMMN_DEPLOYMENT` */

DROP TABLE IF EXISTS `ACT_CMMN_DEPLOYMENT`;

CREATE TABLE `ACT_CMMN_DEPLOYMENT` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_CMMN_DEPLOYMENT` */

/*Table structure for table `ACT_CMMN_DEPLOYMENT_RESOURCE` */

DROP TABLE IF EXISTS `ACT_CMMN_DEPLOYMENT_RESOURCE`;

CREATE TABLE `ACT_CMMN_DEPLOYMENT_RESOURCE` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  `GENERATED_` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_CMMN_RSRC_DPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_CMMN_RSRC_DPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_CMMN_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_CMMN_DEPLOYMENT_RESOURCE` */

/*Table structure for table `ACT_CMMN_HI_CASE_INST` */

DROP TABLE IF EXISTS `ACT_CMMN_HI_CASE_INST`;

CREATE TABLE `ACT_CMMN_HI_CASE_INST` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int NOT NULL,
  `BUSINESS_KEY_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `PARENT_ID_` varchar(255) DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  `REFERENCE_ID_` varchar(255) DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_CMMN_HI_CASE_INST` */

/*Table structure for table `ACT_CMMN_HI_MIL_INST` */

DROP TABLE IF EXISTS `ACT_CMMN_HI_MIL_INST`;

CREATE TABLE `ACT_CMMN_HI_MIL_INST` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int NOT NULL,
  `NAME_` varchar(255) NOT NULL,
  `TIME_STAMP_` datetime(3) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) NOT NULL,
  `CASE_DEF_ID_` varchar(255) NOT NULL,
  `ELEMENT_ID_` varchar(255) NOT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_CMMN_HI_MIL_INST` */

/*Table structure for table `ACT_CMMN_HI_PLAN_ITEM_INST` */

DROP TABLE IF EXISTS `ACT_CMMN_HI_PLAN_ITEM_INST`;

CREATE TABLE `ACT_CMMN_HI_PLAN_ITEM_INST` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) DEFAULT NULL,
  `IS_STAGE_` bit(1) DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) DEFAULT NULL,
  `ITEM_DEFINITION_ID_` varchar(255) DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) DEFAULT NULL,
  `EXIT_TIME_` datetime(3) DEFAULT NULL,
  `ENDED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  `ENTRY_CRITERION_ID_` varchar(255) DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) DEFAULT NULL,
  `SHOW_IN_OVERVIEW_` bit(1) DEFAULT NULL,
  `EXTRA_VALUE_` varchar(255) DEFAULT NULL,
  `DERIVED_CASE_DEF_ID_` varchar(255) DEFAULT NULL,
  `LAST_UNAVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_CMMN_HI_PLAN_ITEM_INST` */

/*Table structure for table `ACT_CMMN_RU_CASE_INST` */

DROP TABLE IF EXISTS `ACT_CMMN_RU_CASE_INST`;

CREATE TABLE `ACT_CMMN_RU_CASE_INST` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int NOT NULL,
  `BUSINESS_KEY_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `PARENT_ID_` varchar(255) DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  `LOCK_TIME_` datetime(3) DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_CASE_INST_CASE_DEF` (`CASE_DEF_ID_`),
  KEY `ACT_IDX_CASE_INST_PARENT` (`PARENT_ID_`),
  KEY `ACT_IDX_CASE_INST_REF_ID_` (`REFERENCE_ID_`),
  CONSTRAINT `ACT_FK_CASE_INST_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `ACT_CMMN_CASEDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_CMMN_RU_CASE_INST` */

/*Table structure for table `ACT_CMMN_RU_MIL_INST` */

DROP TABLE IF EXISTS `ACT_CMMN_RU_MIL_INST`;

CREATE TABLE `ACT_CMMN_RU_MIL_INST` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) NOT NULL,
  `TIME_STAMP_` datetime(3) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) NOT NULL,
  `CASE_DEF_ID_` varchar(255) NOT NULL,
  `ELEMENT_ID_` varchar(255) NOT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_MIL_CASE_DEF` (`CASE_DEF_ID_`),
  KEY `ACT_IDX_MIL_CASE_INST` (`CASE_INST_ID_`),
  CONSTRAINT `ACT_FK_MIL_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `ACT_CMMN_CASEDEF` (`ID_`),
  CONSTRAINT `ACT_FK_MIL_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `ACT_CMMN_RU_CASE_INST` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_CMMN_RU_MIL_INST` */

/*Table structure for table `ACT_CMMN_RU_PLAN_ITEM_INST` */

DROP TABLE IF EXISTS `ACT_CMMN_RU_PLAN_ITEM_INST`;

CREATE TABLE `ACT_CMMN_RU_PLAN_ITEM_INST` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int NOT NULL,
  `CASE_DEF_ID_` varchar(255) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) DEFAULT NULL,
  `IS_STAGE_` bit(1) DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  `ITEM_DEFINITION_ID_` varchar(255) DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) DEFAULT NULL,
  `IS_COUNT_ENABLED_` bit(1) DEFAULT NULL,
  `VAR_COUNT_` int DEFAULT NULL,
  `SENTRY_PART_INST_COUNT_` int DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) DEFAULT NULL,
  `EXIT_TIME_` datetime(3) DEFAULT NULL,
  `ENDED_TIME_` datetime(3) DEFAULT NULL,
  `ENTRY_CRITERION_ID_` varchar(255) DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) DEFAULT NULL,
  `EXTRA_VALUE_` varchar(255) DEFAULT NULL,
  `DERIVED_CASE_DEF_ID_` varchar(255) DEFAULT NULL,
  `LAST_UNAVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_PLAN_ITEM_CASE_DEF` (`CASE_DEF_ID_`),
  KEY `ACT_IDX_PLAN_ITEM_CASE_INST` (`CASE_INST_ID_`),
  KEY `ACT_IDX_PLAN_ITEM_STAGE_INST` (`STAGE_INST_ID_`),
  CONSTRAINT `ACT_FK_PLAN_ITEM_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `ACT_CMMN_CASEDEF` (`ID_`),
  CONSTRAINT `ACT_FK_PLAN_ITEM_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `ACT_CMMN_RU_CASE_INST` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_CMMN_RU_PLAN_ITEM_INST` */

/*Table structure for table `ACT_CMMN_RU_SENTRY_PART_INST` */

DROP TABLE IF EXISTS `ACT_CMMN_RU_SENTRY_PART_INST`;

CREATE TABLE `ACT_CMMN_RU_SENTRY_PART_INST` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int NOT NULL,
  `CASE_DEF_ID_` varchar(255) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) DEFAULT NULL,
  `PLAN_ITEM_INST_ID_` varchar(255) DEFAULT NULL,
  `ON_PART_ID_` varchar(255) DEFAULT NULL,
  `IF_PART_ID_` varchar(255) DEFAULT NULL,
  `TIME_STAMP_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_SENTRY_CASE_DEF` (`CASE_DEF_ID_`),
  KEY `ACT_IDX_SENTRY_CASE_INST` (`CASE_INST_ID_`),
  KEY `ACT_IDX_SENTRY_PLAN_ITEM` (`PLAN_ITEM_INST_ID_`),
  CONSTRAINT `ACT_FK_SENTRY_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `ACT_CMMN_CASEDEF` (`ID_`),
  CONSTRAINT `ACT_FK_SENTRY_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `ACT_CMMN_RU_CASE_INST` (`ID_`),
  CONSTRAINT `ACT_FK_SENTRY_PLAN_ITEM` FOREIGN KEY (`PLAN_ITEM_INST_ID_`) REFERENCES `ACT_CMMN_RU_PLAN_ITEM_INST` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_CMMN_RU_SENTRY_PART_INST` */

/*Table structure for table `ACT_CO_CONTENT_ITEM` */

DROP TABLE IF EXISTS `ACT_CO_CONTENT_ITEM`;

CREATE TABLE `ACT_CO_CONTENT_ITEM` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) NOT NULL,
  `MIME_TYPE_` varchar(255) DEFAULT NULL,
  `TASK_ID_` varchar(255) DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) DEFAULT NULL,
  `CONTENT_STORE_ID_` varchar(255) DEFAULT NULL,
  `CONTENT_STORE_NAME_` varchar(255) DEFAULT NULL,
  `FIELD_` varchar(400) DEFAULT NULL,
  `CONTENT_AVAILABLE_` bit(1) DEFAULT b'0',
  `CREATED_` timestamp(6) NULL DEFAULT NULL,
  `CREATED_BY_` varchar(255) DEFAULT NULL,
  `LAST_MODIFIED_` timestamp(6) NULL DEFAULT NULL,
  `LAST_MODIFIED_BY_` varchar(255) DEFAULT NULL,
  `CONTENT_SIZE_` bigint DEFAULT '0',
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `SCOPE_ID_` varchar(255) DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `idx_contitem_taskid` (`TASK_ID_`),
  KEY `idx_contitem_procid` (`PROC_INST_ID_`),
  KEY `idx_contitem_scope` (`SCOPE_ID_`,`SCOPE_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_CO_CONTENT_ITEM` */

/*Table structure for table `ACT_CO_DATABASECHANGELOG` */

DROP TABLE IF EXISTS `ACT_CO_DATABASECHANGELOG`;

CREATE TABLE `ACT_CO_DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_CO_DATABASECHANGELOG` */

insert  into `ACT_CO_DATABASECHANGELOG`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values 
('1','activiti','org/flowable/content/db/liquibase/flowable-content-db-changelog.xml','2020-11-20 09:29:33',1,'EXECUTED','8:7644d7165cfe799200a2abdd3419e8b6','createTable tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_taskid, tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_procid, tableName=ACT_CO_CONTENT_ITEM','',NULL,'3.10.3',NULL,NULL,'5835774898'),
('2','flowable','org/flowable/content/db/liquibase/flowable-content-db-changelog.xml','2020-11-20 09:29:33',2,'EXECUTED','8:fe7b11ac7dbbf9c43006b23bbab60bab','addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM','',NULL,'3.10.3',NULL,NULL,'5835774898');

/*Table structure for table `ACT_CO_DATABASECHANGELOGLOCK` */

DROP TABLE IF EXISTS `ACT_CO_DATABASECHANGELOGLOCK`;

CREATE TABLE `ACT_CO_DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_CO_DATABASECHANGELOGLOCK` */

insert  into `ACT_CO_DATABASECHANGELOGLOCK`(`ID`,`LOCKED`,`LOCKGRANTED`,`LOCKEDBY`) values 
(1,'\0',NULL,NULL);

/*Table structure for table `ACT_DE_DATABASECHANGELOG` */

DROP TABLE IF EXISTS `ACT_DE_DATABASECHANGELOG`;

CREATE TABLE `ACT_DE_DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_DE_DATABASECHANGELOG` */

insert  into `ACT_DE_DATABASECHANGELOG`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values 
('1','flowable','META-INF/liquibase/flowable-modeler-app-db-changelog.xml','2020-11-20 09:29:38',1,'EXECUTED','8:e70d1d9d3899a734296b2514ccc71501','createTable tableName=ACT_DE_MODEL; createIndex indexName=idx_proc_mod_created, tableName=ACT_DE_MODEL; createTable tableName=ACT_DE_MODEL_HISTORY; createIndex indexName=idx_proc_mod_history_proc, tableName=ACT_DE_MODEL_HISTORY; createTable tableN...','',NULL,'3.10.3',NULL,NULL,'5835780044'),
('3','flowable','META-INF/liquibase/flowable-modeler-app-db-changelog.xml','2020-11-20 09:29:38',2,'EXECUTED','8:3a9143bef2e45f2316231cc1369138b6','addColumn tableName=ACT_DE_MODEL; addColumn tableName=ACT_DE_MODEL_HISTORY','',NULL,'3.10.3',NULL,NULL,'5835780044');

/*Table structure for table `ACT_DE_DATABASECHANGELOGLOCK` */

DROP TABLE IF EXISTS `ACT_DE_DATABASECHANGELOGLOCK`;

CREATE TABLE `ACT_DE_DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_DE_DATABASECHANGELOGLOCK` */

insert  into `ACT_DE_DATABASECHANGELOGLOCK`(`ID`,`LOCKED`,`LOCKGRANTED`,`LOCKEDBY`) values 
(1,'\0',NULL,NULL);

/*Table structure for table `ACT_DE_MODEL` */

DROP TABLE IF EXISTS `ACT_DE_MODEL`;

CREATE TABLE `ACT_DE_MODEL` (
  `id` varchar(255) NOT NULL,
  `name` varchar(400) NOT NULL,
  `model_key` varchar(400) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `model_comment` varchar(4000) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `last_updated_by` varchar(255) DEFAULT NULL,
  `version` int DEFAULT NULL,
  `model_editor_json` longtext,
  `thumbnail` longblob,
  `model_type` int DEFAULT NULL,
  `tenant_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_proc_mod_created` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_DE_MODEL` */

insert  into `ACT_DE_MODEL`(`id`,`name`,`model_key`,`description`,`model_comment`,`created`,`created_by`,`last_updated`,`last_updated_by`,`version`,`model_editor_json`,`thumbnail`,`model_type`,`tenant_id`) values 
('1670ce87-2bc7-11eb-9d15-227918fa15ea','外出单','out-factory','',NULL,'2020-11-21 00:59:23.370000','admin','2020-11-23 21:37:53.842000','admin',1,'{\"modelId\":\"1670ce87-2bc7-11eb-9d15-227918fa15ea\",\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"properties\":{\"process_id\":\"out-factory\",\"name\":\"外出单\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.flowable.org/processdef\",\"process_historylevel\":\"\",\"isexecutable\":true,\"dataproperties\":\"null\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\",\"escalationdefinitions\":\"\",\"process_potentialstarteruser\":\"\",\"process_potentialstartergroup\":\"\",\"iseagerexecutionfetch\":\"false\"},\"childShapes\":[{\"resourceId\":\"startEvent1\",\"properties\":{\"overrideid\":\"\",\"name\":\"填单\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formreference\":{\"id\":\"e5975ad8-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"外出单\",\"key\":\"out-factory\"},\"formfieldvalidation\":true,\"formproperties\":null},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\"}],\"bounds\":{\"lowerRight\":{\"x\":130,\"y\":193},\"upperLeft\":{\"x\":100,\"y\":163}},\"dockers\":[]},{\"resourceId\":\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\",\"properties\":{\"overrideid\":\"\",\"name\":\"申请人确认\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"type\":\"initiator\"}}},\"formkeydefinition\":\"\",\"formreference\":{\"id\":\"e5975ad8-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"外出单\",\"key\":\"out-factory\"},\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"${skip}\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\"}],\"bounds\":{\"lowerRight\":{\"x\":275,\"y\":218},\"upperLeft\":{\"x\":175,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"}],\"bounds\":{\"lowerRight\":{\"x\":174.15625,\"y\":178},\"upperLeft\":{\"x\":130.609375,\"y\":178}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"}},{\"resourceId\":\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\",\"properties\":{\"overrideid\":\"\",\"name\":\"主管审核\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"${manager}\"}},\"formkeydefinition\":\"\",\"formreference\":{\"id\":\"e5975ad8-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"外出单\",\"key\":\"out-factory\"},\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[{\"event\":\"create\",\"implementation\":\"com.deltaww.flowapi.listener.AutoAssigneeListener\",\"className\":\"com.deltaww.flowapi.listener.AutoAssigneeListener\",\"expression\":\"\",\"delegateExpression\":\"\",\"fields\":[],\"$$hashKey\":\"uiGrid-000D\"}]},\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\"}],\"bounds\":{\"lowerRight\":{\"x\":420,\"y\":218},\"upperLeft\":{\"x\":320,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"}],\"bounds\":{\"lowerRight\":{\"x\":319.15625,\"y\":178},\"upperLeft\":{\"x\":275.84375,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"}},{\"resourceId\":\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\",\"properties\":{\"overrideid\":\"\",\"name\":\"结束\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":493,\"y\":192},\"upperLeft\":{\"x\":465,\"y\":164}},\"dockers\":[]},{\"resourceId\":\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"}],\"bounds\":{\"lowerRight\":{\"x\":464.375,\"y\":178},\"upperLeft\":{\"x\":420.390625,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"}}],\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"}}','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0@\0\0\0Ք�j\0\0�IDATx���O�w�9x�a�v�aG��v�@���;`��Hm���F�2�@��q$�	�$!s�f	36cB˴����d6C�p�\0j����~HkZ�}��~�z%�4O�><}�~?��OE\0\0\0\0\0\0\0\0\0�ۈRj_2������hT\rW\"����b�tq��Y��ĘCCCjvvV���[����ݻw�Q���}�R#�n�<���j}��, M�r0f�hsf��}��g�Ꟙ�A%\"��W�̩��}���|��I��˗/ʿ�~̉��������s�1�D_�_��h�9�s�/�/�������r�9ї�ɀ_�9�B_�_&��{����r�9ї��tj���/ys�/�70��Ӕ&�^�}����M�/�̉����cN�5)������=�ɑ#G���yy���>p�ر����?����v����N�sM_�r�\\�gΜy���<z���Cr����oi8|���:g�u�S��-JZ���|ήx�������72���jiiI	��������͛*l���p8\\I�	?�ZC����;�������^��ק�UW��7]�J^�;���^���Q۱������U]]]����;�O�ѷ8t��t�H�C�ІT�[1==-�h	�֗���\'��~�zJ�y���ӧWkjj�\'��}���7�/-j�T_G~W������v_A*�R>�/�o_`N����s��\ry7������Rs_������111��n�}�0\'�G�5�/K�/\\����\Z�e.^��h�r�)����i}�fD�U�J�i�9��}��Wf�r�����E�M�\0Ǻ��EO�/ݻw/m5�###��#m.��)sګ1�ڧ����qCCâ��555-e�{a�s�yV��@9����9��}m�wB^���W�d���gs�P}a���l)�hN��?�oRc�Ƿ�|?{����4�i������qWW׳�����Ĭ�����y����1�g���>�ɓ\'-����E�}��+W��X\r��s�v��3�T��S}2;�d	}������\\��l��z�,,,<�0Ͽ�t:��\'����m6�O�8���r�]X\'�ˆ�Z�++�B�PQ��\\���������n��M����T~�K������Z��+k���vvv��vm��S�u��-k�	?���wL���z7nݺ�9p���۷o�f�\\s_��q��!����Ғx��nW_MM͢���j/��cN�5aW�t�u��r3n�[]�tI�o�mmmU��ϟ&쳴��U-\0��\\��k׮Mo��_6�|�絵�����V��}Mz����s8����E\\���I+�]�m~�$�veq���\'��Ϻ���\'�~���+ ���l�-yM�.�9їx~̉����cN�%��s�/�\'��}	?�ǜ�K�	?�D_�O�1\'�~9�?�G_x�F��d�em����/X �M˖�r0���ԏڜc�k��`����Cw��y:33���\ZI��D�ѥ\n}��,��a�{T�l�g3���\Z�+c�/\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���1�e]J1�\0\0\0\0IEND�B`�',0,''),
('29d7751a-2d58-11eb-b88c-227918fa15ea','返廠申請單','rehire-form','',NULL,'2020-11-23 00:50:24.459000','admin','2020-11-23 00:51:13.197000','admin',1,'{\"modelId\":\"29d7751a-2d58-11eb-b88c-227918fa15ea\",\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"properties\":{\"process_id\":\"rehire-form\",\"name\":\"返廠申請單\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.flowable.org/processdef\",\"process_historylevel\":\"\",\"isexecutable\":true,\"dataproperties\":\"\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\",\"escalationdefinitions\":\"\",\"process_potentialstarteruser\":\"\",\"process_potentialstartergroup\":\"\",\"iseagerexecutionfetch\":\"false\"},\"childShapes\":[{\"resourceId\":\"startEvent1\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formreference\":{\"id\":\"46afcbbb-2d58-11eb-b88c-227918fa15ea\",\"name\":\"返廠申請單\",\"key\":\"rehire-form\"},\"formfieldvalidation\":true,\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-345367B5-F2D6-40E7-A1B1-D802F28D51BD\"}],\"bounds\":{\"lowerRight\":{\"x\":130,\"y\":193},\"upperLeft\":{\"x\":100,\"y\":163}},\"dockers\":[]},{\"resourceId\":\"sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-6A43BA7B-9987-46BC-AB2A-44F15554599B\"}],\"bounds\":{\"lowerRight\":{\"x\":275,\"y\":218},\"upperLeft\":{\"x\":175,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-345367B5-F2D6-40E7-A1B1-D802F28D51BD\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\"}],\"bounds\":{\"lowerRight\":{\"x\":174.15625,\"y\":178},\"upperLeft\":{\"x\":130.609375,\"y\":178}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\"}},{\"resourceId\":\"sid-28104B17-66FC-492B-8654-D19352BABECE\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":348,\"y\":192},\"upperLeft\":{\"x\":320,\"y\":164}},\"dockers\":[]},{\"resourceId\":\"sid-6A43BA7B-9987-46BC-AB2A-44F15554599B\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-28104B17-66FC-492B-8654-D19352BABECE\"}],\"bounds\":{\"lowerRight\":{\"x\":319.375,\"y\":178},\"upperLeft\":{\"x\":275.390625,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-28104B17-66FC-492B-8654-D19352BABECE\"}}],\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"}}','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0T\0\0\0}_��\0\0�IDATx��MLTW�]���.�袋.\\v�E�,���&m\ZQ�cJ�pR��TIIhI1�\r�]5U�GmL,i��IJ��t�@)��00x{�gDG�7���}��8/��7�s�l�\0\0\0\0\0\0\0\0�U1�l�y��������\'l����	��Jx�Y`�ڵkfzz�D�Q\"ɘ��1W�^}(��w�-4C\"��bF%s��]`�\"��!R�л�z-�D�Hi�]���&�حnsw�e�Q�#RB��|46w.5���{\Z�\\�#RB\Z�]�b��V�q�CJH��w�O$�R�#RR\"% �wI�Ǒ)!\rR���H(�G>��4M�����uB�s�CJH��KKf����YR��q�CJH��:�獳	��z��J��TJ)����ƄBZ�_\'c\"%�@�WɘPNDDJpO��i\"\"%���J % %RRH	H��`����7J�����F\n\n\n���]�����|��yq~~��$���ҟߕ~�{߾}5�xB%���tʸ������������@ `&&&����QM86ׯ_����͈���௥�o\"%��R�߿�m�~�0���e!�|z�޽�ʿ�OY㚚�>Wϟ?�����077gΝ;7+tjϞ=\"%RfK����ψK<\Z��oz{{M__�Z�������u����JV}����ֶ=z4�Y��s����哤)�2��;D��-�ZZZ��Ȉ��b����N#��sA�3W\Z����Msss�\Z��E��\"�_� &R殔q!o�X������Û�瓓�k���y���<y2_3d�B>+���3}(���)�Y�y���U�..\\x�5���XQ�����!��_��Nfr�)sS��5�^#�$#�������D^sEF�$���Ǐ��E7��wH\Zَ�H�IUV����!�FhQ(�-C������,�<;;는Z��O��4#%RfH��i#�l�N�u-9r$��vkjj�O�>mܤ��ᮼ��:	�]��C�ܑr�sn�Cj��i���ֲ�����cǎ\r��I �Ћ�4� kX�B�-+e�s.�a���|+M{�%�����h��~�V�+++�.�<O8֔>�\'���[^�u�\\2X�>?u�Ṱ��������x�|b,;5\r���N�f�	zz��2g��bT�(����֢�\ZۍO�%Lg �{Rf�9��esn����b�͔_st�j�Oft�̱kJ\n=9^豮)��ږ���r�:��5e�T_�aJ${���y�\'nJY__\'��,`�@V�Sꊞ���(+zV�dȊ�����־vtt���)Y���l�S��w�H���]\"H���r�\n{�С匼KD��O���������\')�����:������Nd<�eSSSԉ���`���d�;���*3n�g��_���F�eeȺTVV�7{� e6��{�<��G�nG�jC���?*))y��ӳ���׭�vuu�ӝ�͎؊�ٝ9s�TUU�����R�P-�HJ�9���>���D����y�t�WXX8+�<��v{H��.Ve_g�W���۱���yL�H������z���0�\"EEE��^�f�&�H�������%y�0\'=�H����RR\"% %����H	HI % %RR\"%RR\"%\0R\"% %R\"% %RRH	H����RR\"%�6���H�|DD�z�\"NNOO#����)C�.�E �thh�����c�J>C�����]`�@��\'�-r�a;��!$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0d\'������F*}\0\0\0\0IEND�B`�',0,''),
('45c41353-2d55-11eb-b88c-227918fa15ea','MES需求变更','mes-requirement','',NULL,'2020-11-23 00:29:43.088000','admin','2020-11-23 00:31:19.913000','admin',1,'{\"name\":\"MES需求变更\",\"key\":\"mes-requirement\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"主旨\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"提案人员\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"需求变更描述\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0\0o\0\0\0V��\0\0�IDATx����+�q���ծ(��V\\� ?.���mH��H��f�P�4�B�oٰ}J^��������z��|֣&ߖ�.^��b��\0X�+�?\0\0����\03,\0f0X\0�`�\0��`0��`�����u}}�y����\0�?\rV&�Q,S2�T�����f�\0��4X�����ࠚͦ2������A\0���K��� �utt$眖��C?�7���`0#�`u+����`��,\"2�EDf��`E\"�����!�R)���hbbB///!��,���\Z�����������C:*Y������$I�tZ�bQ777j�Zj��a�����=,\"2ӷ\0���`���\03,\0f0X\0�`�\0��`0��`����+�����^���j��j��ZYY�t���^�q��������B?(\0�\r���R��*��^^^455�d2�����5�x��Z��R�(�͆~P\0�\Z���q���kqqQ�fS�bQ�lV�X�sM���<n4\Z�<����\r������4??/����t||���I�Z----�9���\r�Z-��uMOO����\n�>n�0��`�LD?\"����`��,\"2�EDf��`E\"]^^*�+��+�Hhuu�/R%�/����F��������z\"�r]���I��ݝ���������w����qV\"2����L�>X\0&�\03,\0f0X\0�`�\0��`0��`���\03,\0f\Z�j��B��B����W9�tpp�����5\'\'\'r�����sm.���<WWW�T*rΩV���\"\0�!�`�J%e2E\"���l6�(�����h4�F�ܟo~���J�ӟ���j���G�jU��硿\0l4X[[[���R�T��Ņ�s��r�w[333�����쬜s*\nZ[[��ٙ���uxx�t:���1�j5��e�_4X+++�����Օ|�W�^����������<�����<��uy����y����#*�HhddD�DB����<����_\0?7���`0��H&��EDfb���L���\"\"31XDd&����`��,\"2�EDfb���L���\"\"31XDd&����`��,\"2�EDfb���L���\"\"31XDd&����`��,\"2�EDfb���L���\"\"3}�`@�,\0f0X\0�`�\0��`0��`���\03,\0f0X\0��\r�>kEK��\0\0\0\0IEND�B`�',2,''),
('46afcbbb-2d58-11eb-b88c-227918fa15ea','返廠申請單','rehire-form','',NULL,'2020-11-23 00:51:13.123000','admin','2020-11-23 00:51:19.252000','admin',1,'{\"name\":\"返廠申請單\",\"key\":\"rehire-form\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null}],\"outcomes\":[]}','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0\0l\0\0\0�R��\0\0�IDATx���!K,Q�a��M�67�4Z���I���~�	�M������&�vW���OX��)o8a�^k�\0���\0���b, ��b, ��b, ��b, ��b, �N�uyyY��:;;����꺮...��V��׵^�k�^�~(�w��`����j���몵VWWW�Z3X��v\Z�����z}}�a�������n�\Z�q�C��;, ��b�4X�4UKRLKRLKRLKRL����A\r�PGGGussS���urrR��f��JJn��Z,5C}||���y=??�tTI�M:X���UUuwwW�ժ^^^j���8�s�URx�$���0\'��0X@��0X@��0X@��0X@��0X@���i�6������g?\0�����ϋŢNOO��z||��Z===y��Է������_.�՚��i��b, ��b��dI�DKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRL?>X\0s2X@��0X@��0X@��0X@��0X@��0X@��0X@��0X@��0X@��0X@��0X@��0X@��0X@��0X@��0X@��0X@��0X@���!eA��Կ/\0\0\0\0IEND�B`�',2,''),
('534cb54d-2d58-11eb-b88c-227918fa15ea','返廠申請單','rehire-form','','','2020-11-23 00:51:34.284000','admin','2020-11-23 00:51:48.931000','admin',2,'{\"models\":[{\"id\":\"29d7751a-2d58-11eb-b88c-227918fa15ea\",\"name\":\"返廠申請單\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T06:51:13.197+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}',NULL,3,''),
('5920a125-2d56-11eb-b88c-227918fa15ea','联络单','liaison','',NULL,'2020-11-23 00:37:25.068000','admin','2020-11-23 00:39:00.439000','admin',1,'{\"name\":\"联络单\",\"key\":\"liaison\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"subject\",\"name\":\"主题\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${subject}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"department\",\"name\":\"接收单位\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${department}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"content\",\"name\":\"正文\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${content}\",\"layout\":null}],\"outcomes\":[]}','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0\0o\0\0\0V��\0\0�IDATx��ݿk�{�a�a�9�E���U�`D����VA;��C��hE�A��چ���:�x\Z^�x}��:�Yn�wHN��P���_\0�e��2P���0X@(�`e,���a��2&�����_4�w�h�?~�^��������3KKK���˅��ǏΏf�D����Ӝ:u*�������ɓ\'��˗\\�z��C��7��~?��|��5kkkY[[�h4�Ǐ;?�m�e,���K�����T&�%�LKR���2Mu����2r���ܺu+>���B::WR�>XgϞ�`0ȯ_�r�ʕlmmut���Mu��={�$Y]]͋/�����h��x�ŭ�����2�`t�`e,���a��2P���0X@(�`e,���1�`�������p��x��Z������޽Kk-���i�e0d8v~$0&������|��=��������իW���C�<y��/�ڵki��޽{�t�RΟ?���@}\r���b�߿�dee%������Ν;i�����̙3��z������~��c��z��uvwws������k}}=i��ƍG����7o������\n��;P����ɒ����2,Ie2X��d�$�i��577��o�����y��yn޼���_�*鷚�`�;w�����E_U/鷛�`���$ɧO���۷�����[%�3,Ie:�����0X@(�`e,���a��2P���0X@(�����i���˗�����ݻw;?�}�{�=z��h��!��h�._�|���euu5��,--e{{��c���;P����ɒ����2,Ie2X��d�$��`I*���T&�%�LKR���2,Ie2X��d�$��`I*���T&�%�LKR���2,Ie2X��d�$��`I*���T&�%�LKR���2,Ie2X��d�$����K(�`e,���a��2P���0X@(�`e��\r�9�σ~\0\0\0\0IEND�B`�',2,''),
('5c4e9a62-2d54-11eb-b88c-227918fa15ea','MES需求变更','mes-requirement','',NULL,'2020-11-23 00:23:10.662000','admin','2020-11-23 00:29:43.197000','admin',1,'{\"modelId\":\"5c4e9a62-2d54-11eb-b88c-227918fa15ea\",\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"properties\":{\"process_id\":\"mes-requirement\",\"name\":\"MES需求变更\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.flowable.org/processdef\",\"process_historylevel\":\"\",\"isexecutable\":true,\"dataproperties\":\"\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\",\"escalationdefinitions\":\"\",\"process_potentialstarteruser\":\"\",\"process_potentialstartergroup\":\"\",\"iseagerexecutionfetch\":\"false\"},\"childShapes\":[{\"resourceId\":\"startEvent1\",\"properties\":{\"overrideid\":\"\",\"name\":\"填单\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formreference\":{\"id\":\"45c41353-2d55-11eb-b88c-227918fa15ea\",\"name\":\"MES需求变更\",\"key\":\"mes-requirement\"},\"formfieldvalidation\":true,\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-07BACF0C-406A-4E40-A1FC-00A0BC020C59\"}],\"bounds\":{\"lowerRight\":{\"x\":130,\"y\":193},\"upperLeft\":{\"x\":100,\"y\":163}},\"dockers\":[]},{\"resourceId\":\"sid-33868E85-5876-4712-9136-27C22F40C24D\",\"properties\":{\"overrideid\":\"\",\"name\":\"填单人确认\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-9D4E7218-A416-4E13-8129-6902D1CEDBD3\"}],\"bounds\":{\"lowerRight\":{\"x\":275,\"y\":218},\"upperLeft\":{\"x\":175,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-07BACF0C-406A-4E40-A1FC-00A0BC020C59\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-33868E85-5876-4712-9136-27C22F40C24D\"}],\"bounds\":{\"lowerRight\":{\"x\":174.15625,\"y\":178},\"upperLeft\":{\"x\":130.609375,\"y\":178}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-33868E85-5876-4712-9136-27C22F40C24D\"}},{\"resourceId\":\"sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\",\"properties\":{\"overrideid\":\"\",\"name\":\"提案部门主管\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-3B1C7B5B-E126-4DBE-9960-3332CA8953FC\"}],\"bounds\":{\"lowerRight\":{\"x\":420,\"y\":218},\"upperLeft\":{\"x\":320,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-9D4E7218-A416-4E13-8129-6902D1CEDBD3\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\"}],\"bounds\":{\"lowerRight\":{\"x\":319.15625,\"y\":178},\"upperLeft\":{\"x\":275.84375,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\"}},{\"resourceId\":\"sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\",\"properties\":{\"overrideid\":\"\",\"name\":\"Coordinator\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-75B89205-F7AD-4B61-9772-F69F67FC5A4B\"}],\"bounds\":{\"lowerRight\":{\"x\":565,\"y\":218},\"upperLeft\":{\"x\":465,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-3B1C7B5B-E126-4DBE-9960-3332CA8953FC\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\"}],\"bounds\":{\"lowerRight\":{\"x\":464.15625,\"y\":178},\"upperLeft\":{\"x\":420.84375,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\"}},{\"resourceId\":\"sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\",\"properties\":{\"overrideid\":\"\",\"name\":\"DEV TL\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-2090AF02-C11C-4993-9CC4-F4D95E4F6C72\"}],\"bounds\":{\"lowerRight\":{\"x\":710,\"y\":218},\"upperLeft\":{\"x\":610,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-75B89205-F7AD-4B61-9772-F69F67FC5A4B\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\"}],\"bounds\":{\"lowerRight\":{\"x\":609.15625,\"y\":178},\"upperLeft\":{\"x\":565.84375,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\"}},{\"resourceId\":\"sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\",\"properties\":{\"overrideid\":\"\",\"name\":\"PSM\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-6F9F2036-70B8-4F2E-AF81-4B54AA19CD43\"}],\"bounds\":{\"lowerRight\":{\"x\":275,\"y\":335},\"upperLeft\":{\"x\":175,\"y\":255}},\"dockers\":[]},{\"resourceId\":\"sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\",\"properties\":{\"overrideid\":\"\",\"name\":\"MESM\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C4E02C10-B6FB-47DF-8F9F-346B5D75275C\"}],\"bounds\":{\"lowerRight\":{\"x\":420,\"y\":335},\"upperLeft\":{\"x\":320,\"y\":255}},\"dockers\":[]},{\"resourceId\":\"sid-6F9F2036-70B8-4F2E-AF81-4B54AA19CD43\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\"}],\"bounds\":{\"lowerRight\":{\"x\":319.15625,\"y\":295},\"upperLeft\":{\"x\":275.84375,\"y\":295}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\"}},{\"resourceId\":\"sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\",\"properties\":{\"overrideid\":\"\",\"name\":\"PM\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-19C22622-BF57-43FF-BE8C-D74EDD41782F\"}],\"bounds\":{\"lowerRight\":{\"x\":565,\"y\":335},\"upperLeft\":{\"x\":465,\"y\":255}},\"dockers\":[]},{\"resourceId\":\"sid-C4E02C10-B6FB-47DF-8F9F-346B5D75275C\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\"}],\"bounds\":{\"lowerRight\":{\"x\":464.15625,\"y\":295},\"upperLeft\":{\"x\":420.84375,\"y\":295}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\"}},{\"resourceId\":\"sid-2090AF02-C11C-4993-9CC4-F4D95E4F6C72\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\"}],\"bounds\":{\"lowerRight\":{\"x\":660,\"y\":254.625},\"upperLeft\":{\"x\":225,\"y\":218.18749999999994}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":660,\"y\":234.99999999999994},{\"x\":225,\"y\":234.99999999999994},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\"}},{\"resourceId\":\"sid-4C4E0E45-0E10-40C1-A1A5-B4BC491F8E1E\",\"properties\":{\"overrideid\":\"\",\"name\":\"结束\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":638,\"y\":309},\"upperLeft\":{\"x\":610,\"y\":281}},\"dockers\":[]},{\"resourceId\":\"sid-19C22622-BF57-43FF-BE8C-D74EDD41782F\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-4C4E0E45-0E10-40C1-A1A5-B4BC491F8E1E\"}],\"bounds\":{\"lowerRight\":{\"x\":609.375,\"y\":295},\"upperLeft\":{\"x\":565.390625,\"y\":295}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-4C4E0E45-0E10-40C1-A1A5-B4BC491F8E1E\"}}],\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"}}','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0b\0\0\0wU�U\0\0�IDATx���Ki������]���������\'�ڤ��<�R\n=���<,TJ=<�K�-��D��Z��RZ�\n�nL�mզj����LH�čq&}��<��)�|��;3�{�\0\0\0\0\0\0\0\0\0\0�n�MkkkS�d�`vvV���h3l��D��x㌳��/,,���\r������d2\"���o�g�5D%ti��=[�)]\n�+�{�Koݜ����纣�x�RN�W�iShY�}/�utv�g3��Z�U\n�����,�����mo��p�*D\Z�ȕ�K�5s=(�	W��֊N�݋\Z\"�:{y@�%D�(�S����!���W΍��rF���r�o���oB��¹v�~�W�e��\rB�n��	���8�|$20�;::6&\'\'�����B���)���3�px����?\"x�sYZ[[�D\"��={�eX__����###�Lx���|�����TP��zWW׎z?E�g�����D�ќ����qq����(2�8�\\`pp�i2��&C��ʊ~y�����T�bgS�Mt6���\\�xqW�@����\n�NXd�s5V�Y5�!!b����}(}��t�q��l�7��9�\'\n�p8��v&���[q��=��8����=\'���$���s�	o�q. g�ccc[���_��t��~___�\"�3�\n��n޼�}T�ܾ}�����/��g���p&g$����W���9��:���,�Le;�����_r0�3��,�\\8����勉����\n0��3B�\ng@���gB��!D8�p&D(�	��7�8\"�Χ�r�hj8�^o�i�7���w]I$/t�1��T���荳9�]Wb�X�����t:�NǄV�m��-x㌳�H�s2	�ԔJ��4\Z��Y���&z����{��]��\04�����@ ����?�\Z\0pl,��F��c*\05������?�\0�:�U�H�J\0@M�\0��*\0��D�TK\Z*\0��D����Jx_h�`4�P�y9��\"T\Z�!D\0�\0B\0�Bx���NE\0�!�+\n��g#T�\0�MkkkS�d�@=JN�gLض-��K9���4E5����r�LF���7n?��DoS?k��[����=[�)]�k��gP�z��셷��P�=\r�i�չk:=R�ӧ���춷��P����4�C��1������,&8�\'�6��ѹ^!�FN�jc����\\��E�]��S���!�4U�h���٫1�>�r��xٗ�\Zo��!D�	��Z��.�1�������k\"	h,�q>2<�Wx�������7Εf�2(�U`D\"����q155%�kwww�	�>����f 2 �*$�_�~��fE1�\\Nܸq�xV�=�@c�sg	�D���dai�9\Zo��\09�,aJg ��Ioo/�\Z�2�%�L�6ѹ�;���G5���Cd�d D�5Vṯ��	�K���Wu�\Z�����2�Р!��f���Dg�?kf\"���k]Μ�oy��!U�OtufbbBTsu&���\Zo�K��w�doo�H��]���4�8D����ݢ��բ%w��Xx�|���Ψ%3\Zo��=Gr6?39�+^u5A�Xx��!B�\"�!B�\"�!B�\"@c�3ԏr�hj8�^o�i����5xL\"�x��.��H�R�����DoS?k�X,�<??�:�N���j*۶��т7Π)�C;\'�IM#�zT��~�U���DoS?k\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���\0�zw\Ze�c\0\0\0\0IEND�B`�',0,''),
('5eef80ba-2bc8-11eb-9d15-227918fa15ea','外出单','out-factory','','','2020-11-21 01:08:35.114000','admin','2020-11-23 22:15:01.427000','admin',9,'{\"models\":[{\"id\":\"1670ce87-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"外出单\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-21T07:08:14.341+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}',NULL,3,''),
('8e54d196-2d57-11eb-b88c-227918fa15ea','FI廠商代碼申請單','vendor-code-request-form','',NULL,'2020-11-23 00:46:03.568000','admin','2020-11-23 00:46:51.838000','admin',1,'{\"modelId\":\"8e54d196-2d57-11eb-b88c-227918fa15ea\",\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"properties\":{\"process_id\":\"vendor-code-request-form\",\"name\":\"FI廠商代碼申請單\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.flowable.org/processdef\",\"process_historylevel\":\"\",\"isexecutable\":true,\"dataproperties\":\"\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\",\"escalationdefinitions\":\"\",\"process_potentialstarteruser\":\"\",\"process_potentialstartergroup\":\"\",\"iseagerexecutionfetch\":\"false\"},\"childShapes\":[{\"resourceId\":\"startEvent1\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formreference\":{\"id\":\"aae549c7-2d57-11eb-b88c-227918fa15ea\",\"name\":\"FI厂商代码申请单\",\"key\":\"vendor-code-request-form\"},\"formfieldvalidation\":true,\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-E3CDDACB-2B12-4398-966D-C78588092BD6\"}],\"bounds\":{\"lowerRight\":{\"x\":130,\"y\":193},\"upperLeft\":{\"x\":100,\"y\":163}},\"dockers\":[]},{\"resourceId\":\"sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-61149916-1C68-428E-987A-8C94F5454F96\"}],\"bounds\":{\"lowerRight\":{\"x\":275,\"y\":218},\"upperLeft\":{\"x\":175,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-E3CDDACB-2B12-4398-966D-C78588092BD6\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\"}],\"bounds\":{\"lowerRight\":{\"x\":174.15625,\"y\":178},\"upperLeft\":{\"x\":130.609375,\"y\":178}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\"}},{\"resourceId\":\"sid-860C90D4-77B6-4336-A684-FBD28C95B009\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":348,\"y\":192},\"upperLeft\":{\"x\":320,\"y\":164}},\"dockers\":[]},{\"resourceId\":\"sid-61149916-1C68-428E-987A-8C94F5454F96\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-860C90D4-77B6-4336-A684-FBD28C95B009\"}],\"bounds\":{\"lowerRight\":{\"x\":319.375,\"y\":178},\"upperLeft\":{\"x\":275.390625,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-860C90D4-77B6-4336-A684-FBD28C95B009\"}}],\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"}}','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0T\0\0\0}_��\0\0�IDATx��MLTW�]���.�袋.\\v�E�,���&m\ZQ�cJ�pR��TIIhI1�\r�]5U�GmL,i��IJ��t�@)��00x{�gDG�7���}��8/��7�s�l�\0\0\0\0\0\0\0\0�U1�l�y��������\'l����	��Jx�Y`�ڵkfzz�D�Q\"ɘ��1W�^}(��w�-4C\"��bF%s��]`�\"��!R�л�z-�D�Hi�]���&�حnsw�e�Q�#RB��|46w.5���{\Z�\\�#RB\Z�]�b��V�q�CJH��w�O$�R�#RR\"% �wI�Ǒ)!\rR���H(�G>��4M�����uB�s�CJH��KKf����YR��q�CJH��:�獳	��z��J��TJ)����ƄBZ�_\'c\"%�@�WɘPNDDJpO��i\"\"%���J % %RRH	H��`����7J�����F\n\n\n���]�����|��yq~~��$���ҟߕ~�{߾}5�xB%���tʸ������������@ `&&&����QM86ׯ_����͈���௥�o\"%��R�߿�m�~�0���e!�|z�޽�ʿ�OY㚚�>Wϟ?�����077gΝ;7+tjϞ=\"%RfK����ψK<\Z��oz{{M__�Z�������u����JV}����ֶ=z4�Y��s����哤)�2��;D��-�ZZZ��Ȉ��b����N#��sA�3W\Z����Msss�\Z��E��\"�_� &R殔q!o�X������Û�瓓�k���y���<y2_3d�B>+���3}(���)�Y�y���U�..\\x�5���XQ�����!��_��Nfr�)sS��5�^#�$#�������D^sEF�$���Ǐ��E7��wH\Zَ�H�IUV����!�FhQ(�-C������,�<;;는Z��O��4#%RfH��i#�l�N�u-9r$��vkjj�O�>mܤ��ᮼ��:	�]��C�ܑr�sn�Cj��i���ֲ�����cǎ\r��I �Ћ�4� kX�B�-+e�s.�a���|+M{�%�����h��~�V�+++�.�<O8֔>�\'���[^�u�\\2X�>?u�Ṱ��������x�|b,;5\r���N�f�	zz��2g��bT�(����֢�\ZۍO�%Lg �{Rf�9��esn����b�͔_st�j�Oft�̱kJ\n=9^豮)��ږ���r�:��5e�T_�aJ${���y�\'nJY__\'��,`�@V�Sꊞ���(+zV�dȊ�����־vtt���)Y���l�S��w�H���]\"H���r�\n{�С匼KD��O���������\')�����:������Nd<�eSSSԉ���`���d�;���*3n�g��_���F�eeȺTVV�7{� e6��{�<��G�nG�jC���?*))y��ӳ���׭�vuu�ӝ�͎؊�ٝ9s�TUU�����R�P-�HJ�9���>���D����y�t�WXX8+�<��v{H��.Ve_g�W���۱���yL�H������z���0�\"EEE��^�f�&�H�������%y�0\'=�H����RR\"% %����H	HI % %RR\"%RR\"%\0R\"% %R\"% %RRH	H����RR\"%�6���H�|DD�z�\"NNOO#����)C�.�E �thh�����c�J>C�����]`�@��\'�-r�a;��!$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0d\'������F*}\0\0\0\0IEND�B`�',0,''),
('9231a865-2d55-11eb-b88c-227918fa15ea','MES需求变更','mes-requirement','','','2020-11-23 00:31:51.313000','admin','2020-11-23 00:32:08.366000','admin',2,'{\"models\":[{\"id\":\"5c4e9a62-2d54-11eb-b88c-227918fa15ea\",\"name\":\"MES需求变更\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T06:29:43.197+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}',NULL,3,''),
('a02ca5f7-2d56-11eb-b88c-227918fa15ea','联络单','liaison','','','2020-11-23 00:39:24.265000','admin','2020-11-23 00:39:37.768000','admin',2,'{\"models\":[{\"id\":\"fbbf99a4-2d55-11eb-b88c-227918fa15ea\",\"name\":\"联络单\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T06:37:25.131+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}',NULL,3,''),
('aae549c7-2d57-11eb-b88c-227918fa15ea','FI厂商代码申请单','vendor-code-request-form','',NULL,'2020-11-23 00:46:51.749000','admin','2020-11-23 00:47:00.055000','admin',1,'{\"name\":\"FI厂商代码申请单\",\"key\":\"vendor-code-request-form\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null}],\"outcomes\":[]}','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0\0l\0\0\0�R��\0\0�IDATx���!K,Q�a��M�67�4Z���I���~�	�M������&�vW���OX��)o8a�^k�\0���\0���b, ��b, ��b, ��b, ��b, �N�uyyY��:;;����꺮...��V��׵^�k�^�~(�w��`����j���몵VWWW�Z3X��v\Z�����z}}�a�������n�\Z�q�C��;, ��b�4X�4UKRLKRLKRLKRL����A\r�PGGGussS���urrR��f��JJn��Z,5C}||���y=??�tTI�M:X���UUuwwW�ժ^^^j���8�s�URx�$���0\'��0X@��0X@��0X@��0X@��0X@���i�6������g?\0�����ϋŢNOO��z||��Z===y��Է������_.�՚��i��b, ��b��dI�DKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRL?>X\0s2X@��0X@��0X@��0X@��0X@��0X@��0X@��0X@��0X@��0X@��0X@��0X@��0X@��0X@��0X@��0X@��0X@���!eA��Կ/\0\0\0\0IEND�B`�',2,''),
('c506bdcb-2d57-11eb-b88c-227918fa15ea','FI厂商代码申请单','vendor-code-request-form','','','2020-11-23 00:47:35.589000','admin','2020-11-23 00:47:51.500000','admin',2,'{\"models\":[{\"id\":\"8e54d196-2d57-11eb-b88c-227918fa15ea\",\"name\":\"FI廠商代碼申請單\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T06:46:51.838+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}',NULL,3,''),
('e0d829dc-2d23-11eb-84d4-227918fa15ea','发送邮件','send-email','',NULL,'2020-11-22 18:36:07.533000','admin','2020-11-22 19:19:38.292000','admin',1,'{\"modelId\":\"e0d829dc-2d23-11eb-84d4-227918fa15ea\",\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"properties\":{\"process_id\":\"send-email\",\"name\":\"发送邮件\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.flowable.org/processdef\",\"process_historylevel\":\"\",\"isexecutable\":true,\"dataproperties\":\"\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\",\"escalationdefinitions\":\"\",\"process_potentialstarteruser\":\"\",\"process_potentialstartergroup\":\"\",\"iseagerexecutionfetch\":\"false\"},\"childShapes\":[{\"resourceId\":\"startEvent1\",\"properties\":{\"overrideid\":\"\",\"name\":\"start\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"formproperties\":null},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\"}],\"bounds\":{\"lowerRight\":{\"x\":130,\"y\":193},\"upperLeft\":{\"x\":100,\"y\":163}},\"dockers\":[]},{\"resourceId\":\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\"}],\"bounds\":{\"lowerRight\":{\"x\":179.5859375,\"y\":178},\"upperLeft\":{\"x\":130.375,\"y\":178}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\"}},{\"resourceId\":\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\",\"properties\":{\"overrideid\":\"\",\"name\":\"end\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":348,\"y\":192},\"upperLeft\":{\"x\":320,\"y\":164}},\"dockers\":[]},{\"resourceId\":\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\"}],\"bounds\":{\"lowerRight\":{\"x\":320,\"y\":178},\"upperLeft\":{\"x\":280.5625,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\"}},{\"resourceId\":\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\",\"properties\":{\"overrideid\":\"\",\"name\":\"SendEmail\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"mailtaskheaders\":\"\",\"mailtaskto\":\"${emailTo}\",\"mailtaskfrom\":\"${emailFrom}\",\"mailtasksubject\":\"${emailSubject}\",\"mailtaskcc\":\"\",\"mailtaskbcc\":\"\",\"mailtasktext\":\"${emailContent}\",\"mailtasktextvar\":\"\",\"mailtaskhtml\":\"\",\"mailtaskhtmlvar\":\"\",\"mailtaskcharset\":\"\",\"type\":\"http://b3mn.org/stencilset/bpmn2.0#UserTask\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"MailTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\"}],\"bounds\":{\"lowerRight\":{\"x\":280,\"y\":218},\"upperLeft\":{\"x\":180,\"y\":138}},\"dockers\":[]}],\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"}}','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0T\0\0\0}_��\0\0�IDATx��MLTW�]��]t�E]t�E]�h�.��iDqP@~�!(	�?Il\ZRkjBcX`J\r�]�U��h\Z����?�0j��� �#�80x{�d�)�������%\'�q\0/����{�}�M�\0\0\0\0\0\0\0\0\0�	c��7n�\\�zuull�\\�x�����&\nݑ�ӳ�6*��˗M4\Z5�d��3���ͥK�[�]`͐鸘Iɜaz�B����|��+�.��΅��)\r�\\�r��i�-}E8���$�B�ᓏC�ٴ�z��-z/�|H	�����xZ��ſwb��P�L�)�)�%H�q�w��������W}��H	�R�9�RCE�~^[���Q�AJpYʵCT͐���c��H	dJ���)���\"%�����:%�\n�)g�r�蹛��@J(���}EJ�RR\"% %����H	ϧ����:����®]�\"��Չ��*����s���y\\[YY�*R�\"��緤_oݱcG�\\��U�����y�2n���ڽ{�ROOO2���i�Ō��M$1W�\\I���΋�1i���א�(F)w������>�0���Y!�<�}�����wָ���OUƳgϦ�Y�����̙3�A�m��>R�\"eEE��LFLX�ɨ�������a322����~�������uÒU_w���������OiV��~]cc�my\'�DJ��R�K��ޒ�رcfrrҤR��}����F2�%��\'�4����C���!�]th+r_/V1��<�������ܼ:11�B�|ff&�=�2�Gx���J͐�\n�-����q(���/�Y��w��U�.�ϟ�5���XQ�����!볘���Kcg������/ef�sĕ|���?s�����\\��{y7�����iQ�\rd��F�#%�)��ju^tȚ-\ne�eX3q^됒%�\\�R���rW�1R\"�G��.{���:�׵8�o߾TF�&�\rlkkk=q�q������Q�����DR����^ckR��N3>>�Ζ2:��v�80���M���N�=$�5�X��Cʒ�r��X�����@`%ײ�]�����If��7m5���y���Z\"����k�r�)KJʧ^c�`U�����)��{__�Rf���ʕw�e��Ar-�����|�Cʒ�Ҋkzբ�[Z�\n�l7���K�@Jw�k��[薼�6�)�����Z��t�,�9%��2+�Xs����e����Wcy�)˴�ʒH�.�E�5�N��M);;;���:%��{���)uGO}}}�=HɎ���Q<xέ���N��d�+���ϖ[$[�ݸKD��m�!�z�Ȟ={�=y�����r���)��pS����u?ekkkʩ�)���x�����\'������\"8y l�W鹓�������\'�ee������g�EzF�c;g��q��6���񃺺��CCC�Z=�h�u``ঞ4�ivD)�fw��I������pT��j�GR�������灮��w�k(�ɻ�����i䗮���H�bUv#�����uб���uL=H�!����qm��\0����i����NnK�f����?�%o�	�z\0s����H	HI % %RRH	H����RR\"%\0R\"% %R %RRH	H����RR\"% %����H	����1$r>\"�\n�l\n�f��(\"9�H�[�2L�[����������=D��3�\n9:::%�����������C.��Ca�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���cF1\Z\0\0\0\0IEND�B`�',0,''),
('e5975ad8-2bc7-11eb-9d15-227918fa15ea','外出单','out-factory','',NULL,'2020-11-21 01:05:11.531000','admin','2020-11-23 22:14:42.888000','admin',1,'{\"name\":\"外出单\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"主旨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"人员编号\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\",\"name\":\"允许跳过\",\"type\":\"boolean\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"skip\",\"name\":\"是否跳过\",\"type\":\"boolean\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"manager\",\"name\":\"所属主管\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":\"manager\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"描述\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0\0�\0\0\05p�\0\0:IDATx����Kӏ���?�Utt�E�y#݉�L�̺0#�ȈJ��F�����0	�!f���X8�-�|k�u�� �������y>�5��y�&�\"B\0�����\0�o1X\0l0X\0l0X\0l0X\0l0X\0l0X\0l0X\0l0X\0l0X\0l0X\0l�=X�BA����r9������O��W�jee%�\0M��+�J���POO�zzz���?��v��������5�C\0}u\r���H����o�%}���7�بk�vww�!}���\ZQ�Ze���#��lb��Ȧ�֏?��֦���?��o���Dtj�+�|>�R�$I�f��|���ժfgg������+����$I���ׅ$��\"���=,\"���\"\"�\Z2X\0�$�\r�\r�\r�\r�\r�\r�\r�\r�\r�\r���V�XTDhcc��\0�^���v���+\"488��/j``@�޽���\"B�������kkk+����{�����o�*\"���T.�U.�J��\Z��ؘ���t��=��i��i���&~,\0ou����\"B������ZYY���\"Bo޼�ӧO511����ڿy��q��Ǜ�\0l0X\0l�5X�j\0�����Q#�V�\n\"2��\"\"�,\"���\"\"�,\"���\"\"�,\"���\"\"�\Z2X\0�$�\r�\r�\r�\r�\r�\r�\r�\r�\r�\r�\r�\r���kww�7��y��ˊutt(\"4<<���\0���a���g�������󧦧����Y{�\\.+�J����Z\\\\L�`\0�e�:::t��yE�����������ե\\.�T*�R��`8�V�PPD���W���z��U���������)����y�f��S�`����7I�\0���SB\06,\06,\06,\06,\06,\06,\06,\06,\06,\06,\06,\06,\06,\06,\06,\06,\06e�N�8��\'O*\"������%�>}ZǎSD(�J)\"������\0|ʇP�9sF��͊\r\r\r�ԩSjnnV6���ΎR��\n�B�@e����4::���muww+\"���\'uuu�R��^a-..jtt4�x:�`���(\"T,U,U.�U,U�TT,���R�R�=�T*%~8\0?|j\0���\r�\r�\r�\r�\r�\r�\r�\r�\r�\r�\r�\r�\r�\r����P(h||\\���a���*��(���Ç�e2����߿���)-..jss3�cx�k�^�|���&�x�BSSS���QD���������ڟ���j�?���\0��5X�_�V&���̌\n���٬�޽�k׮i}}]_�~ճg�499���m-,,����z��A��W�`=z�H���`������OO�<��ܜ޿���9}��E��󚛛���D��Ǜ�\0l0X\0l�c����j��`�G��`�M\r�b��t:�t:��^^^��w��ᯰ������$I?~ԝ;w�������$�%\"���`-,,�����\"I��a�M�Ԑ��$1X\0l0X\0l0X\0l0X\0l0X\0l0X\0l0X\0l0X\0l0X\0l0X\0l0X\0l0X\0l�5X����u����400����А�\\����uvv�T*%~�����ZXX������Ңs��ibbB�f����k�������\r\r\r�ҥKZ__�Ç��fu�ƍďp��\0\0u\r���\04ġQ#�C(��&��lb���&��lb���&��lb���&��lb���&��lb���&��lb���&��lb���&��lb���&��lb���&��lb���&��lb���&��lb���&��lb���&��lj�`@�,\06,\06,\06,\06,\06,\06,\06,\06,\06,\06,\06�����~�\0\0\0\0IEND�B`�',2,''),
('e96a6b2d-2d24-11eb-84d4-227918fa15ea','发送邮件','send-email','','','2020-11-22 18:43:32.307000','admin','2020-11-22 19:19:48.608000','admin',5,'{\"models\":[{\"id\":\"e0d829dc-2d23-11eb-84d4-227918fa15ea\",\"name\":\"发送邮件\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T00:43:07.638+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}',NULL,3,''),
('fbbf99a4-2d55-11eb-b88c-227918fa15ea','联络单','liaison','',NULL,'2020-11-23 00:34:48.150000','admin','2020-11-23 00:37:25.131000','admin',1,'{\"modelId\":\"fbbf99a4-2d55-11eb-b88c-227918fa15ea\",\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"properties\":{\"process_id\":\"liaison\",\"name\":\"联络单\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.flowable.org/processdef\",\"process_historylevel\":\"\",\"isexecutable\":true,\"dataproperties\":\"\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\",\"escalationdefinitions\":\"\",\"process_potentialstarteruser\":\"\",\"process_potentialstartergroup\":\"\",\"iseagerexecutionfetch\":\"false\"},\"childShapes\":[{\"resourceId\":\"startEvent1\",\"properties\":{\"overrideid\":\"\",\"name\":\"填单\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formreference\":{\"id\":\"5920a125-2d56-11eb-b88c-227918fa15ea\",\"name\":\"联络单\",\"key\":\"liaison\"},\"formfieldvalidation\":true,\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-8837ACC1-9927-4EF2-AB27-6113B895B400\"}],\"bounds\":{\"lowerRight\":{\"x\":130,\"y\":193},\"upperLeft\":{\"x\":100,\"y\":163}},\"dockers\":[]},{\"resourceId\":\"sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\",\"properties\":{\"overrideid\":\"\",\"name\":\"填单人确认\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-7BA30D19-708A-4A69-A05E-3B5FC38E05C5\"}],\"bounds\":{\"lowerRight\":{\"x\":275,\"y\":218},\"upperLeft\":{\"x\":175,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-8837ACC1-9927-4EF2-AB27-6113B895B400\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\"}],\"bounds\":{\"lowerRight\":{\"x\":174.15625,\"y\":178},\"upperLeft\":{\"x\":130.609375,\"y\":178}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\"}},{\"resourceId\":\"sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\",\"properties\":{\"overrideid\":\"\",\"name\":\"审核中\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-0255207B-6BE7-449E-8B53-6D87AF68964A\"}],\"bounds\":{\"lowerRight\":{\"x\":420,\"y\":218},\"upperLeft\":{\"x\":320,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-7BA30D19-708A-4A69-A05E-3B5FC38E05C5\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\"}],\"bounds\":{\"lowerRight\":{\"x\":319.15625,\"y\":178},\"upperLeft\":{\"x\":275.84375,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\"}},{\"resourceId\":\"sid-7387C76A-E91A-40AA-A84A-11C8155AD7C0\",\"properties\":{\"overrideid\":\"\",\"name\":\"结束\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":493,\"y\":192},\"upperLeft\":{\"x\":465,\"y\":164}},\"dockers\":[]},{\"resourceId\":\"sid-0255207B-6BE7-449E-8B53-6D87AF68964A\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-7387C76A-E91A-40AA-A84A-11C8155AD7C0\"}],\"bounds\":{\"lowerRight\":{\"x\":464.375,\"y\":178},\"upperLeft\":{\"x\":420.390625,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-7387C76A-E91A-40AA-A84A-11C8155AD7C0\"}}],\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"}}','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0@\0\0\0Ք�j\0\0�IDATx���O�w�9x�a�v�aG��v�@���;`��Hm���F�2�@��q$�	�$!s�f	36cB˴����d6C�p�\0j����~HkZ�}��~�z%�4O�><}�~?��OE\0\0\0\0\0\0\0\0\0�ۈRj_2������hT\rW\"����b�tq��Y��ĘCCCjvvV���[����ݻw�Q���}�R#�n�<���j}��, M�r0f�hsf��}��g�Ꟙ�A%\"��W�̩��}���|��I��˗/ʿ�~̉��������s�1�D_�_��h�9�s�/�/�������r�9ї�ɀ_�9�B_�_&��{����r�9ї��tj���/ys�/�70��Ӕ&�^�}����M�/�̉����cN�5)������=�ɑ#G���yy���>p�ر����?����v����N�sM_�r�\\�gΜy���<z���Cr����oi8|���:g�u�S��-JZ���|ήx�������72���jiiI	��������͛*l���p8\\I�	?�ZC����;�������^��ק�UW��7]�J^�;���^���Q۱������U]]]����;�O�ѷ8t��t�H�C�ІT�[1==-�h	�֗���\'��~�zJ�y���ӧWkjj�\'��}���7�/-j�T_G~W������v_A*�R>�/�o_`N����s��\ry7������Rs_������111��n�}�0\'�G�5�/K�/\\����\Z�e.^��h�r�)����i}�fD�U�J�i�9��}��Wf�r�����E�M�\0Ǻ��EO�/ݻw/m5�###��#m.��)sګ1�ڧ����qCCâ��555-e�{a�s�yV��@9����9��}m�wB^���W�d���gs�P}a���l)�hN��?�oRc�Ƿ�|?{����4�i������qWW׳�����Ĭ�����y����1�g���>�ɓ\'-����E�}��+W��X\r��s�v��3�T��S}2;�d	}������\\��l��z�,,,<�0Ͽ�t:��\'����m6�O�8���r�]X\'�ˆ�Z�++�B�PQ��\\���������n��M����T~�K������Z��+k���vvv��vm��S�u��-k�	?���wL���z7nݺ�9p���۷o�f�\\s_��q��!����Ғx��nW_MM͢���j/��cN�5aW�t�u��r3n�[]�tI�o�mmmU��ϟ&쳴��U-\0��\\��k׮Mo��_6�|�絵�����V��}Mz����s8����E\\���I+�]�m~�$�veq���\'��Ϻ���\'�~���+ ���l�-yM�.�9їx~̉����cN�%��s�/�\'��}	?�ǜ�K�	?�D_�O�1\'�~9�?�G_x�F��d�em����/X �M˖�r0���ԏڜc�k��`����Cw��y:33���\ZI��D�ѥ\n}��,��a�{T�l�g3���\Z�+c�/\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���1�e]J1�\0\0\0\0IEND�B`�',0,'');

/*Table structure for table `ACT_DE_MODEL_HISTORY` */

DROP TABLE IF EXISTS `ACT_DE_MODEL_HISTORY`;

CREATE TABLE `ACT_DE_MODEL_HISTORY` (
  `id` varchar(255) NOT NULL,
  `name` varchar(400) NOT NULL,
  `model_key` varchar(400) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `model_comment` varchar(4000) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `last_updated_by` varchar(255) DEFAULT NULL,
  `removal_date` datetime(6) DEFAULT NULL,
  `version` int DEFAULT NULL,
  `model_editor_json` longtext,
  `model_id` varchar(255) NOT NULL,
  `model_type` int DEFAULT NULL,
  `tenant_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_proc_mod_history_proc` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_DE_MODEL_HISTORY` */

insert  into `ACT_DE_MODEL_HISTORY`(`id`,`name`,`model_key`,`description`,`model_comment`,`created`,`created_by`,`last_updated`,`last_updated_by`,`removal_date`,`version`,`model_editor_json`,`model_id`,`model_type`,`tenant_id`) values 
('00142c59-2e08-11eb-bbd8-227918fa15ea','外出单','out-factory','','','2020-11-21 01:08:35.114000','admin','2020-11-23 21:49:06.087000','admin',NULL,7,'{\"models\":[{\"id\":\"1670ce87-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"外出单\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-21T07:08:14.341+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','5eef80ba-2bc8-11eb-9d15-227918fa15ea',3,''),
('59d16cce-2bc9-11eb-9d15-227918fa15ea','外出单','out-factory','','','2020-11-21 01:08:35.114000','admin','2020-11-21 01:15:36.025000','admin',NULL,2,'{\"models\":[{\"id\":\"1670ce87-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"外出单\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-21T07:08:14.341+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','5eef80ba-2bc8-11eb-9d15-227918fa15ea',3,''),
('5c07a9bf-2d58-11eb-b88c-227918fa15ea','返廠申請單','rehire-form','','','2020-11-23 00:51:34.284000','admin','2020-11-23 00:51:48.931000','admin',NULL,1,'{\"models\":[{\"id\":\"29d7751a-2d58-11eb-b88c-227918fa15ea\",\"name\":\"返廠申請單\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T06:51:13.197+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','534cb54d-2d58-11eb-b88c-227918fa15ea',3,''),
('673da99c-2bc8-11eb-9d15-227918fa15ea','外出单','out-factory','','','2020-11-21 01:08:35.114000','admin','2020-11-21 01:08:49.048000','admin',NULL,1,'{\"models\":[{\"id\":\"1670ce87-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"外出单\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-21T07:08:14.341+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','5eef80ba-2bc8-11eb-9d15-227918fa15ea',3,''),
('6d819305-2e03-11eb-8edb-227918fa15ea','外出单','out-factory','','','2020-11-21 01:08:35.114000','admin','2020-11-23 21:16:22.192000','admin',NULL,5,'{\"models\":[{\"id\":\"1670ce87-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"外出单\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-21T07:08:14.341+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','5eef80ba-2bc8-11eb-9d15-227918fa15ea',3,''),
('78482ee3-2e06-11eb-84ba-227918fa15ea','外出单','out-factory','','','2020-11-21 01:08:35.114000','admin','2020-11-23 21:38:08.761000','admin',NULL,6,'{\"models\":[{\"id\":\"1670ce87-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"外出单\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-21T07:08:14.341+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','5eef80ba-2bc8-11eb-9d15-227918fa15ea',3,''),
('9c5bbd37-2d55-11eb-b88c-227918fa15ea','MES需求变更','mes-requirement','','','2020-11-23 00:31:51.313000','admin','2020-11-23 00:32:08.366000','admin',NULL,1,'{\"models\":[{\"id\":\"5c4e9a62-2d54-11eb-b88c-227918fa15ea\",\"name\":\"MES需求变更\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T06:29:43.197+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','9231a865-2d55-11eb-b88c-227918fa15ea',3,''),
('9f2238d4-2e0b-11eb-b42b-227918fa15ea','外出单','out-factory','','','2020-11-21 01:08:35.114000','admin','2020-11-23 22:15:01.427000','admin',NULL,8,'{\"models\":[{\"id\":\"1670ce87-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"外出单\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-21T07:08:14.341+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','5eef80ba-2bc8-11eb-9d15-227918fa15ea',3,''),
('a62f087e-2e00-11eb-8699-227918fa15ea','外出单','out-factory','','','2020-11-21 01:08:35.114000','admin','2020-11-23 20:56:28.791000','admin',NULL,4,'{\"models\":[{\"id\":\"1670ce87-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"外出单\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-21T07:08:14.341+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','5eef80ba-2bc8-11eb-9d15-227918fa15ea',3,''),
('a8390ae9-2d56-11eb-b88c-227918fa15ea','联络单','liaison','','','2020-11-23 00:39:24.265000','admin','2020-11-23 00:39:37.768000','admin',NULL,1,'{\"models\":[{\"id\":\"fbbf99a4-2d55-11eb-b88c-227918fa15ea\",\"name\":\"联络单\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T06:37:25.131+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','a02ca5f7-2d56-11eb-b88c-227918fa15ea',3,''),
('bd89797a-2d57-11eb-b88c-227918fa15ea','FI','vendor-code-request-form','',NULL,'2020-11-23 00:47:10.170000','admin','2020-11-23 00:47:10.170000','admin','2020-11-23 00:47:23.024000',1,'{}','b5e01c19-2d57-11eb-b88c-227918fa15ea',3,''),
('be76d613-2d29-11eb-b92b-227918fa15ea','发送邮件','send-email','','','2020-11-22 18:43:32.307000','admin','2020-11-22 19:18:07.726000','admin',NULL,3,'{\"models\":[{\"id\":\"e0d829dc-2d23-11eb-84d4-227918fa15ea\",\"name\":\"发送邮件\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T00:43:07.638+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','e96a6b2d-2d24-11eb-84d4-227918fa15ea',3,''),
('ce82913d-2d57-11eb-b88c-227918fa15ea','FI厂商代码申请单','vendor-code-request-form','','','2020-11-23 00:47:35.589000','admin','2020-11-23 00:47:51.500000','admin',NULL,1,'{\"models\":[{\"id\":\"8e54d196-2d57-11eb-b88c-227918fa15ea\",\"name\":\"FI廠商代碼申請單\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T06:46:51.838+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','c506bdcb-2d57-11eb-b88c-227918fa15ea',3,''),
('d4f4b22d-2d28-11eb-9045-227918fa15ea','发送邮件','send-email','','','2020-11-22 18:43:32.307000','admin','2020-11-22 19:11:35.968000','admin',NULL,2,'{\"models\":[{\"id\":\"e0d829dc-2d23-11eb-84d4-227918fa15ea\",\"name\":\"发送邮件\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T00:43:07.638+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','e96a6b2d-2d24-11eb-84d4-227918fa15ea',3,''),
('f1af6c4f-2d24-11eb-84d4-227918fa15ea','发送邮件','send-email','','','2020-11-22 18:43:32.307000','admin','2020-11-22 18:43:46.181000','admin',NULL,1,'{\"models\":[{\"id\":\"e0d829dc-2d23-11eb-84d4-227918fa15ea\",\"name\":\"发送邮件\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T00:43:07.638+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','e96a6b2d-2d24-11eb-84d4-227918fa15ea',3,''),
('fa9798d4-2d29-11eb-9782-227918fa15ea','发送邮件','send-email','','','2020-11-22 18:43:32.307000','admin','2020-11-22 19:19:48.608000','admin',NULL,4,'{\"models\":[{\"id\":\"e0d829dc-2d23-11eb-84d4-227918fa15ea\",\"name\":\"发送邮件\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T00:43:07.638+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','e96a6b2d-2d24-11eb-84d4-227918fa15ea',3,''),
('fcb5a43f-2bcb-11eb-9e90-227918fa15ea','外出单','out-factory','','','2020-11-21 01:08:35.114000','admin','2020-11-21 01:34:28.305000','admin',NULL,3,'{\"models\":[{\"id\":\"1670ce87-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"外出单\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-21T07:08:14.341+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','5eef80ba-2bc8-11eb-9d15-227918fa15ea',3,'');

/*Table structure for table `ACT_DE_MODEL_RELATION` */

DROP TABLE IF EXISTS `ACT_DE_MODEL_RELATION`;

CREATE TABLE `ACT_DE_MODEL_RELATION` (
  `id` varchar(255) NOT NULL,
  `parent_model_id` varchar(255) DEFAULT NULL,
  `model_id` varchar(255) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relation_parent` (`parent_model_id`),
  KEY `fk_relation_child` (`model_id`),
  CONSTRAINT `fk_relation_child` FOREIGN KEY (`model_id`) REFERENCES `ACT_DE_MODEL` (`id`),
  CONSTRAINT `fk_relation_parent` FOREIGN KEY (`parent_model_id`) REFERENCES `ACT_DE_MODEL` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_DE_MODEL_RELATION` */

insert  into `ACT_DE_MODEL_RELATION`(`id`,`parent_model_id`,`model_id`,`relation_type`) values 
('45fb9e14-2d55-11eb-b88c-227918fa15ea','5c4e9a62-2d54-11eb-b88c-227918fa15ea','45c41353-2d55-11eb-b88c-227918fa15ea','form-model'),
('46e1d83c-2d58-11eb-b88c-227918fa15ea','29d7751a-2d58-11eb-b88c-227918fa15ea','46afcbbb-2d58-11eb-b88c-227918fa15ea','form-model'),
('52bf1499-2bc8-11eb-9d15-227918fa15ea','1670ce87-2bc7-11eb-9d15-227918fa15ea','e5975ad8-2bc7-11eb-9d15-227918fa15ea','form-model'),
('5950fff6-2d56-11eb-b88c-227918fa15ea','fbbf99a4-2d55-11eb-b88c-227918fa15ea','5920a125-2d56-11eb-b88c-227918fa15ea','form-model'),
('59ba103e-2d58-11eb-b88c-227918fa15ea','534cb54d-2d58-11eb-b88c-227918fa15ea','29d7751a-2d58-11eb-b88c-227918fa15ea','process-model'),
('6415b5ab-2bc8-11eb-9d15-227918fa15ea','5eef80ba-2bc8-11eb-9d15-227918fa15ea','1670ce87-2bc7-11eb-9d15-227918fa15ea','process-model'),
('972311b6-2d55-11eb-b88c-227918fa15ea','9231a865-2d55-11eb-b88c-227918fa15ea','5c4e9a62-2d54-11eb-b88c-227918fa15ea','process-model'),
('a58b9e28-2d56-11eb-b88c-227918fa15ea','a02ca5f7-2d56-11eb-b88c-227918fa15ea','fbbf99a4-2d55-11eb-b88c-227918fa15ea','process-model'),
('ab188ec8-2d57-11eb-b88c-227918fa15ea','8e54d196-2d57-11eb-b88c-227918fa15ea','aae549c7-2d57-11eb-b88c-227918fa15ea','form-model'),
('cb93fccc-2d57-11eb-b88c-227918fa15ea','c506bdcb-2d57-11eb-b88c-227918fa15ea','8e54d196-2d57-11eb-b88c-227918fa15ea','process-model'),
('ef18e2ee-2d24-11eb-84d4-227918fa15ea','e96a6b2d-2d24-11eb-84d4-227918fa15ea','e0d829dc-2d23-11eb-84d4-227918fa15ea','process-model');

/*Table structure for table `ACT_DMN_DATABASECHANGELOG` */

DROP TABLE IF EXISTS `ACT_DMN_DATABASECHANGELOG`;

CREATE TABLE `ACT_DMN_DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_DMN_DATABASECHANGELOG` */

insert  into `ACT_DMN_DATABASECHANGELOG`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values 
('1','activiti','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2020-11-20 09:29:31',1,'EXECUTED','8:c8701f1c71018b55029f450b2e9a10a1','createTable tableName=ACT_DMN_DEPLOYMENT; createTable tableName=ACT_DMN_DEPLOYMENT_RESOURCE; createTable tableName=ACT_DMN_DECISION_TABLE','',NULL,'3.10.3',NULL,NULL,'5835773114'),
('2','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2020-11-20 09:29:31',2,'EXECUTED','8:47f94b27feb7df8a30d4e338c7bd5fb8','createTable tableName=ACT_DMN_HI_DECISION_EXECUTION','',NULL,'3.10.3',NULL,NULL,'5835773114'),
('3','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2020-11-20 09:29:31',3,'EXECUTED','8:ac17eae89fbdccb6e08daf3c7797b579','addColumn tableName=ACT_DMN_HI_DECISION_EXECUTION','',NULL,'3.10.3',NULL,NULL,'5835773114'),
('4','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2020-11-20 09:29:31',4,'EXECUTED','8:f73aabc4529e7292c2942073d1cff6f9','dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_DMN_DECISION_TABLE','',NULL,'3.10.3',NULL,NULL,'5835773114'),
('5','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2020-11-20 09:29:31',5,'EXECUTED','8:3e03528582dd4eeb4eb41f9b9539140d','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_DMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION; modifyDataType columnName=END_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION','',NULL,'3.10.3',NULL,NULL,'5835773114'),
('6','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2020-11-20 09:29:31',6,'EXECUTED','8:646c6a061e0b6e8a62e69844ff96abb0','createIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE','',NULL,'3.10.3',NULL,NULL,'5835773114'),
('7','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2020-11-20 09:29:32',7,'EXECUTED','8:215a499ff7ae77685b55355245b8b708','dropIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE; renameTable newTableName=ACT_DMN_DECISION, oldTableName=ACT_DMN_DECISION_TABLE; createIndex indexName=ACT_IDX_DMN_DEC_UNIQ, tableName=ACT_DMN_DECISION','',NULL,'3.10.3',NULL,NULL,'5835773114'),
('8','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2020-11-20 09:29:32',8,'EXECUTED','8:5355bee389318afed91a11702f2df032','addColumn tableName=ACT_DMN_DECISION','',NULL,'3.10.3',NULL,NULL,'5835773114');

/*Table structure for table `ACT_DMN_DATABASECHANGELOGLOCK` */

DROP TABLE IF EXISTS `ACT_DMN_DATABASECHANGELOGLOCK`;

CREATE TABLE `ACT_DMN_DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_DMN_DATABASECHANGELOGLOCK` */

insert  into `ACT_DMN_DATABASECHANGELOGLOCK`(`ID`,`LOCKED`,`LOCKGRANTED`,`LOCKEDBY`) values 
(1,'\0',NULL,NULL);

/*Table structure for table `ACT_DMN_DECISION` */

DROP TABLE IF EXISTS `ACT_DMN_DECISION`;

CREATE TABLE `ACT_DMN_DECISION` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(255) DEFAULT NULL,
  `DECISION_TYPE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_DMN_DEC_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_DMN_DECISION` */

/*Table structure for table `ACT_DMN_DEPLOYMENT` */

DROP TABLE IF EXISTS `ACT_DMN_DEPLOYMENT`;

CREATE TABLE `ACT_DMN_DEPLOYMENT` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_DMN_DEPLOYMENT` */

/*Table structure for table `ACT_DMN_DEPLOYMENT_RESOURCE` */

DROP TABLE IF EXISTS `ACT_DMN_DEPLOYMENT_RESOURCE`;

CREATE TABLE `ACT_DMN_DEPLOYMENT_RESOURCE` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_DMN_DEPLOYMENT_RESOURCE` */

/*Table structure for table `ACT_DMN_HI_DECISION_EXECUTION` */

DROP TABLE IF EXISTS `ACT_DMN_HI_DECISION_EXECUTION`;

CREATE TABLE `ACT_DMN_HI_DECISION_EXECUTION` (
  `ID_` varchar(255) NOT NULL,
  `DECISION_DEFINITION_ID_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `INSTANCE_ID_` varchar(255) DEFAULT NULL,
  `EXECUTION_ID_` varchar(255) DEFAULT NULL,
  `ACTIVITY_ID_` varchar(255) DEFAULT NULL,
  `FAILED_` bit(1) DEFAULT b'0',
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `EXECUTION_JSON_` longtext,
  `SCOPE_TYPE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_DMN_HI_DECISION_EXECUTION` */

/*Table structure for table `ACT_EVT_LOG` */

DROP TABLE IF EXISTS `ACT_EVT_LOG`;

CREATE TABLE `ACT_EVT_LOG` (
  `LOG_NR_` bigint NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_EVT_LOG` */

/*Table structure for table `ACT_FO_DATABASECHANGELOG` */

DROP TABLE IF EXISTS `ACT_FO_DATABASECHANGELOG`;

CREATE TABLE `ACT_FO_DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_FO_DATABASECHANGELOG` */

insert  into `ACT_FO_DATABASECHANGELOG`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values 
('1','activiti','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2020-11-20 09:29:32',1,'EXECUTED','8:033ebf9380889aed7c453927ecc3250d','createTable tableName=ACT_FO_FORM_DEPLOYMENT; createTable tableName=ACT_FO_FORM_RESOURCE; createTable tableName=ACT_FO_FORM_DEFINITION; createTable tableName=ACT_FO_FORM_INSTANCE','',NULL,'3.10.3',NULL,NULL,'5835774074'),
('2','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2020-11-20 09:29:32',2,'EXECUTED','8:986365ceb40445ce3b27a8e6b40f159b','addColumn tableName=ACT_FO_FORM_INSTANCE','',NULL,'3.10.3',NULL,NULL,'5835774074'),
('3','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2020-11-20 09:29:32',3,'EXECUTED','8:abf482518ceb09830ef674e52c06bf15','dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_FO_FORM_DEFINITION','',NULL,'3.10.3',NULL,NULL,'5835774074'),
('4','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2020-11-20 09:29:32',4,'EXECUTED','8:2087829f22a4b2298dbf530681c74854','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_FO_FORM_DEPLOYMENT; modifyDataType columnName=SUBMITTED_DATE_, tableName=ACT_FO_FORM_INSTANCE','',NULL,'3.10.3',NULL,NULL,'5835774074'),
('5','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2020-11-20 09:29:32',5,'EXECUTED','8:b4be732b89e5ca028bdd520c6ad4d446','createIndex indexName=ACT_IDX_FORM_DEF_UNIQ, tableName=ACT_FO_FORM_DEFINITION','',NULL,'3.10.3',NULL,NULL,'5835774074');

/*Table structure for table `ACT_FO_DATABASECHANGELOGLOCK` */

DROP TABLE IF EXISTS `ACT_FO_DATABASECHANGELOGLOCK`;

CREATE TABLE `ACT_FO_DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_FO_DATABASECHANGELOGLOCK` */

insert  into `ACT_FO_DATABASECHANGELOGLOCK`(`ID`,`LOCKED`,`LOCKGRANTED`,`LOCKEDBY`) values 
(1,'\0',NULL,NULL);

/*Table structure for table `ACT_FO_FORM_DEFINITION` */

DROP TABLE IF EXISTS `ACT_FO_FORM_DEFINITION`;

CREATE TABLE `ACT_FO_FORM_DEFINITION` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_FORM_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_FO_FORM_DEFINITION` */

insert  into `ACT_FO_FORM_DEFINITION`(`ID_`,`NAME_`,`VERSION_`,`KEY_`,`CATEGORY_`,`DEPLOYMENT_ID_`,`TENANT_ID_`,`RESOURCE_NAME_`,`DESCRIPTION_`) values 
('0088e735-2e08-11eb-bbd8-227918fa15ea','外出单',7,'out-factory',NULL,'0087d5c3-2e08-11eb-bbd8-227918fa15ea','','form-out-factory.form',NULL),
('59f9191a-2bc9-11eb-9d15-227918fa15ea','外出单',2,'out-factory',NULL,'59f87cd8-2bc9-11eb-9d15-227918fa15ea','','form-out-factory.form',NULL),
('5c2f560b-2d58-11eb-b88c-227918fa15ea','返廠申請單',1,'rehire-form',NULL,'5c2e1d89-2d58-11eb-b88c-227918fa15ea','','form-rehire-form.form',NULL),
('67920b38-2bc8-11eb-9d15-227918fa15ea','外出单',1,'out-factory',NULL,'67900f66-2bc8-11eb-9d15-227918fa15ea','','form-out-factory.form',NULL),
('6ddf1c61-2e03-11eb-8edb-227918fa15ea','外出单',5,'out-factory',NULL,'6ddd479f-2e03-11eb-8edb-227918fa15ea','','form-out-factory.form',NULL),
('78ad806f-2e06-11eb-84ba-227918fa15ea','外出单',6,'out-factory',NULL,'78ace42d-2e06-11eb-84ba-227918fa15ea','','form-out-factory.form',NULL),
('9ca919f3-2d55-11eb-b88c-227918fa15ea','MES需求变更',1,'mes-requirement',NULL,'9ca87db1-2d55-11eb-b88c-227918fa15ea','','form-mes-requirement.form',NULL),
('9fd471e0-2e0b-11eb-b42b-227918fa15ea','外出单',8,'out-factory',NULL,'9fd29d1e-2e0b-11eb-b42b-227918fa15ea','','form-out-factory.form',NULL),
('a68f29ea-2e00-11eb-8699-227918fa15ea','外出单',4,'out-factory',NULL,'a68df168-2e00-11eb-8699-227918fa15ea','','form-out-factory.form',NULL),
('a867e325-2d56-11eb-b88c-227918fa15ea','联络单',1,'liaison',NULL,'a86746e3-2d56-11eb-b88c-227918fa15ea','','form-liaison.form',NULL),
('ceab9d19-2d57-11eb-b88c-227918fa15ea','FI厂商代码申请单',1,'vendor-code-request-form',NULL,'ceaa8ba7-2d57-11eb-b88c-227918fa15ea','','form-vendor-code-request-form.form',NULL),
('fcf6a4eb-2bcb-11eb-9e90-227918fa15ea','外出单',3,'out-factory',NULL,'fcf5e199-2bcb-11eb-9e90-227918fa15ea','','form-out-factory.form',NULL);

/*Table structure for table `ACT_FO_FORM_DEPLOYMENT` */

DROP TABLE IF EXISTS `ACT_FO_FORM_DEPLOYMENT`;

CREATE TABLE `ACT_FO_FORM_DEPLOYMENT` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_FO_FORM_DEPLOYMENT` */

insert  into `ACT_FO_FORM_DEPLOYMENT`(`ID_`,`NAME_`,`CATEGORY_`,`DEPLOY_TIME_`,`TENANT_ID_`,`PARENT_DEPLOYMENT_ID_`) values 
('0087d5c3-2e08-11eb-bbd8-227918fa15ea','外出单',NULL,'2020-11-23 21:49:06.845','','0020fd9a-2e08-11eb-bbd8-227918fa15ea'),
('59f87cd8-2bc9-11eb-9d15-227918fa15ea','外出单',NULL,'2020-11-21 01:15:36.281','','59d4c82f-2bc9-11eb-9d15-227918fa15ea'),
('5c2e1d89-2d58-11eb-b88c-227918fa15ea','返廠申請單',NULL,'2020-11-23 00:51:49.183','','5c0ab700-2d58-11eb-b88c-227918fa15ea'),
('67900f66-2bc8-11eb-9d15-227918fa15ea','外出单',NULL,'2020-11-21 01:08:49.588','','6747bbbd-2bc8-11eb-9d15-227918fa15ea'),
('6ddd479f-2e03-11eb-8edb-227918fa15ea','外出单',NULL,'2020-11-23 21:16:22.793','','6d8b08e6-2e03-11eb-8edb-227918fa15ea'),
('78ace42d-2e06-11eb-84ba-227918fa15ea','外出单',NULL,'2020-11-23 21:38:09.421','','784ff714-2e06-11eb-84ba-227918fa15ea'),
('9ca87db1-2d55-11eb-b88c-227918fa15ea','MES需求变更',NULL,'2020-11-23 00:32:08.869','','9c6707d8-2d55-11eb-b88c-227918fa15ea'),
('9fd29d1e-2e0b-11eb-b42b-227918fa15ea','外出单',NULL,'2020-11-23 22:15:02.583','','9f3105e5-2e0b-11eb-b42b-227918fa15ea'),
('a68df168-2e00-11eb-8699-227918fa15ea','外出单',NULL,'2020-11-23 20:56:29.413','','a6360d5f-2e00-11eb-8699-227918fa15ea'),
('a86746e3-2d56-11eb-b88c-227918fa15ea','联络单',NULL,'2020-11-23 00:39:38.071','','a83efe5a-2d56-11eb-b88c-227918fa15ea'),
('ceaa8ba7-2d57-11eb-b88c-227918fa15ea','FI厂商代码申请单',NULL,'2020-11-23 00:47:51.762','','ce8661ce-2d57-11eb-b88c-227918fa15ea'),
('fcf5e199-2bcb-11eb-9e90-227918fa15ea','外出单',NULL,'2020-11-21 01:34:28.726','','fcbc33f0-2bcb-11eb-9e90-227918fa15ea');

/*Table structure for table `ACT_FO_FORM_INSTANCE` */

DROP TABLE IF EXISTS `ACT_FO_FORM_INSTANCE`;

CREATE TABLE `ACT_FO_FORM_INSTANCE` (
  `ID_` varchar(255) NOT NULL,
  `FORM_DEFINITION_ID_` varchar(255) NOT NULL,
  `TASK_ID_` varchar(255) DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) DEFAULT NULL,
  `PROC_DEF_ID_` varchar(255) DEFAULT NULL,
  `SUBMITTED_DATE_` datetime(3) DEFAULT NULL,
  `SUBMITTED_BY_` varchar(255) DEFAULT NULL,
  `FORM_VALUES_ID_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `SCOPE_ID_` varchar(255) DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_FO_FORM_INSTANCE` */

insert  into `ACT_FO_FORM_INSTANCE`(`ID_`,`FORM_DEFINITION_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SUBMITTED_DATE_`,`SUBMITTED_BY_`,`FORM_VALUES_ID_`,`TENANT_ID_`,`SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values 
('3156e01f-2df0-11eb-a430-227918fa15ea','fcf6a4eb-2bcb-11eb-9e90-227918fa15ea',NULL,'315420f7-2df0-11eb-a430-227918fa15ea','out-factory:4:2d2b9dca-2d3d-11eb-a3a6-227918fa15ea','2020-11-23 18:58:40.809','admin','3156e01e-2df0-11eb-a430-227918fa15ea','',NULL,NULL,NULL),
('3abd3c18-2e00-11eb-8699-227918fa15ea','fcf6a4eb-2bcb-11eb-9e90-227918fa15ea',NULL,'3abb6750-2e00-11eb-8699-227918fa15ea','out-factory:4:2d2b9dca-2d3d-11eb-a3a6-227918fa15ea','2020-11-23 20:53:28.528','admin','3abd3c17-2e00-11eb-8699-227918fa15ea','',NULL,NULL,NULL),
('3b44e6ce-2e04-11eb-8e8e-227918fa15ea','6ddf1c61-2e03-11eb-8edb-227918fa15ea',NULL,'3b4275c5-2e04-11eb-8e8e-227918fa15ea','out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','2020-11-23 21:22:07.401','admin','3b44e6cd-2e04-11eb-8e8e-227918fa15ea','',NULL,NULL,NULL),
('40d81cfa-2dfe-11eb-b3f3-227918fa15ea','fcf6a4eb-2bcb-11eb-9e90-227918fa15ea',NULL,'40d64832-2dfe-11eb-b3f3-227918fa15ea','out-factory:4:2d2b9dca-2d3d-11eb-a3a6-227918fa15ea','2020-11-23 20:39:19.778','admin','40d81cf9-2dfe-11eb-b3f3-227918fa15ea','',NULL,NULL,NULL),
('6760f3da-2bc9-11eb-9d15-227918fa15ea','59f9191a-2bc9-11eb-9d15-227918fa15ea',NULL,'6760ccc1-2bc9-11eb-9d15-227918fa15ea','out-factory:2:59f74457-2bc9-11eb-9d15-227918fa15ea','2020-11-21 01:15:58.776','admin','6760f3d9-2bc9-11eb-9d15-227918fa15ea','',NULL,NULL,NULL),
('676909bd-2df0-11eb-9bca-227918fa15ea','fcf6a4eb-2bcb-11eb-9e90-227918fa15ea',NULL,'676671a5-2df0-11eb-9bca-227918fa15ea','out-factory:4:2d2b9dca-2d3d-11eb-a3a6-227918fa15ea','2020-11-23 19:00:11.524','admin','676909bc-2df0-11eb-9bca-227918fa15ea','',NULL,NULL,NULL),
('7bb91f73-2bca-11eb-9e90-227918fa15ea','59f9191a-2bc9-11eb-9d15-227918fa15ea',NULL,'7bb6d57a-2bca-11eb-9e90-227918fa15ea','out-factory:2:59f74457-2bc9-11eb-9d15-227918fa15ea','2020-11-21 01:23:42.404','admin','7bb91f72-2bca-11eb-9e90-227918fa15ea','',NULL,NULL,NULL),
('9fe9c24c-2df0-11eb-8e96-227918fa15ea','fcf6a4eb-2bcb-11eb-9e90-227918fa15ea',NULL,'9fe72a34-2df0-11eb-8e96-227918fa15ea','out-factory:4:2d2b9dca-2d3d-11eb-a3a6-227918fa15ea','2020-11-23 19:01:46.320','admin','9fe9c24b-2df0-11eb-8e96-227918fa15ea','',NULL,NULL,NULL),
('a2c783c2-2bc8-11eb-9d15-227918fa15ea','67920b38-2bc8-11eb-9d15-227918fa15ea',NULL,'a2c512b9-2bc8-11eb-9d15-227918fa15ea','out-factory:1:678dc575-2bc8-11eb-9d15-227918fa15ea','2020-11-21 01:10:28.936','admin','a2c783c1-2bc8-11eb-9d15-227918fa15ea','',NULL,NULL,NULL),
('a4411eee-2e04-11eb-b39c-227918fa15ea','6ddf1c61-2e03-11eb-8edb-227918fa15ea',NULL,'a43e38b5-2e04-11eb-b39c-227918fa15ea','out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','2020-11-23 21:25:03.538','admin','a4411eed-2e04-11eb-b39c-227918fa15ea','',NULL,NULL,NULL),
('b01fe4f4-2e00-11eb-8699-227918fa15ea','a867e325-2d56-11eb-b88c-227918fa15ea',NULL,'b01f48ab-2e00-11eb-8699-227918fa15ea','liaison:1:a866aaa2-2d56-11eb-b88c-227918fa15ea','2020-11-23 20:56:45.469','admin','b01fe4f3-2e00-11eb-8699-227918fa15ea','',NULL,NULL,NULL),
('d5a5f3f9-2d6d-11eb-aadf-227918fa15ea','fcf6a4eb-2bcb-11eb-9e90-227918fa15ea',NULL,'d59fb261-2d6d-11eb-aadf-227918fa15ea','out-factory:4:2d2b9dca-2d3d-11eb-a3a6-227918fa15ea','2020-11-23 03:25:32.398','admin','d5a5f3f8-2d6d-11eb-aadf-227918fa15ea','',NULL,NULL,NULL),
('d805df44-2d4c-11eb-9afa-227918fa15ea','fcf6a4eb-2bcb-11eb-9e90-227918fa15ea',NULL,'d80236bc-2d4c-11eb-9afa-227918fa15ea','out-factory:4:2d2b9dca-2d3d-11eb-a3a6-227918fa15ea','2020-11-22 23:29:22.992','admin','d805df43-2d4c-11eb-9afa-227918fa15ea','',NULL,NULL,NULL),
('df372757-2ef9-11eb-aabd-227918fa15ea','9fd471e0-2e0b-11eb-b42b-227918fa15ea',NULL,'df35046b-2ef9-11eb-aabd-227918fa15ea','out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','2020-11-25 02:40:29.159','user','df372756-2ef9-11eb-aabd-227918fa15ea','',NULL,NULL,NULL),
('f26245c3-2e06-11eb-bbd8-227918fa15ea','78ad806f-2e06-11eb-84ba-227918fa15ea',NULL,'f25f869a-2e06-11eb-bbd8-227918fa15ea','out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea','2020-11-23 21:41:33.611','admin','f26245c2-2e06-11eb-bbd8-227918fa15ea','',NULL,NULL,NULL),
('f880f1d7-2e0b-11eb-b5e4-227918fa15ea','9fd471e0-2e0b-11eb-b42b-227918fa15ea',NULL,'f87e80cb-2e0b-11eb-b5e4-227918fa15ea','out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','2020-11-23 22:17:31.361','admin','f880f1d6-2e0b-11eb-b5e4-227918fa15ea','',NULL,NULL,NULL);

/*Table structure for table `ACT_FO_FORM_RESOURCE` */

DROP TABLE IF EXISTS `ACT_FO_FORM_RESOURCE`;

CREATE TABLE `ACT_FO_FORM_RESOURCE` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ACT_FO_FORM_RESOURCE` */

insert  into `ACT_FO_FORM_RESOURCE`(`ID_`,`NAME_`,`DEPLOYMENT_ID_`,`RESOURCE_BYTES_`) values 
('0087d5c4-2e08-11eb-bbd8-227918fa15ea','form-out-factory.form','0087d5c3-2e08-11eb-bbd8-227918fa15ea','{\"name\":\"外出单\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"主旨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"人员编号\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\",\"name\":\"允许跳过\",\"type\":\"boolean\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"skip\",\"name\":\"是否跳过\",\"type\":\"boolean\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"描述\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('3156e01e-2df0-11eb-a430-227918fa15ea','form-fcf6a4eb-2bcb-11eb-9e90-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"222222\",\"description\":\"    22222222222222222\"}}'),
('3abd3c17-2e00-11eb-8699-227918fa15ea','form-fcf6a4eb-2bcb-11eb-9e90-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"5555555555\",\"description\":\"    55555555555555555555555\"}}'),
('3b44e6cd-2e04-11eb-8e8e-227918fa15ea','form-6ddf1c61-2e03-11eb-8edb-227918fa15ea',NULL,'{\"values\":{\"summary\":\"23333\",\"empid\":\"322\",\"description\":\"22222232\"}}'),
('40d81cf9-2dfe-11eb-b3f3-227918fa15ea','form-fcf6a4eb-2bcb-11eb-9e90-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"1111\",\"description\":\"11111111111\"}}'),
('59f87cd9-2bc9-11eb-9d15-227918fa15ea','form-out-factory.form','59f87cd8-2bc9-11eb-9d15-227918fa15ea','{\"name\":\"外出单\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"主旨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"人员编号\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"描述\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('5c2e1d8a-2d58-11eb-b88c-227918fa15ea','form-rehire-form.form','5c2e1d89-2d58-11eb-b88c-227918fa15ea','{\"name\":\"返廠申請單\",\"key\":\"rehire-form\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null}],\"outcomes\":[]}'),
('6760f3d9-2bc9-11eb-9d15-227918fa15ea','form-59f9191a-2bc9-11eb-9d15-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"11111111111\",\"description\":\"11111111111\"}}'),
('676909bc-2df0-11eb-9bca-227918fa15ea','form-fcf6a4eb-2bcb-11eb-9e90-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"3333333333333333\",\"description\":\"    3333333333333333333333\"}}'),
('67900f67-2bc8-11eb-9d15-227918fa15ea','form-out-factory.form','67900f66-2bc8-11eb-9d15-227918fa15ea','{\"name\":\"外出单\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"主旨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"人员编号\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"描述\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('6ddd47a0-2e03-11eb-8edb-227918fa15ea','form-out-factory.form','6ddd479f-2e03-11eb-8edb-227918fa15ea','{\"name\":\"外出单\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"主旨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"人员编号\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"描述\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('78ace42e-2e06-11eb-84ba-227918fa15ea','form-out-factory.form','78ace42d-2e06-11eb-84ba-227918fa15ea','{\"name\":\"外出单\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"主旨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"人员编号\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"描述\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('7bb91f72-2bca-11eb-9e90-227918fa15ea','form-59f9191a-2bc9-11eb-9d15-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"1111111111\",\"description\":\"11111111111111\"}}'),
('9ca87db2-2d55-11eb-b88c-227918fa15ea','form-mes-requirement.form','9ca87db1-2d55-11eb-b88c-227918fa15ea','{\"name\":\"MES需求变更\",\"key\":\"mes-requirement\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"主旨\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"提案人员\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"需求变更描述\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('9fd29d1f-2e0b-11eb-b42b-227918fa15ea','form-out-factory.form','9fd29d1e-2e0b-11eb-b42b-227918fa15ea','{\"name\":\"外出单\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"主旨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"人员编号\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\",\"name\":\"允许跳过\",\"type\":\"boolean\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"skip\",\"name\":\"是否跳过\",\"type\":\"boolean\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"manager\",\"name\":\"所属主管\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":\"manager\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"描述\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('9fe9c24b-2df0-11eb-8e96-227918fa15ea','form-fcf6a4eb-2bcb-11eb-9e90-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"44444444444444444\",\"description\":\"    444444444444444\"}}'),
('a2c783c1-2bc8-11eb-9d15-227918fa15ea','form-67920b38-2bc8-11eb-9d15-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"111111\",\"description\":\"1111111111111\"}}'),
('a4411eed-2e04-11eb-b39c-227918fa15ea','form-6ddf1c61-2e03-11eb-8edb-227918fa15ea',NULL,'{\"values\":{\"summary\":\"test\",\"empid\":\"222\",\"description\":\"    222222222222222222\"}}'),
('a68df169-2e00-11eb-8699-227918fa15ea','form-out-factory.form','a68df168-2e00-11eb-8699-227918fa15ea','{\"name\":\"外出单\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"主旨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"人员编号\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"描述\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('a86746e4-2d56-11eb-b88c-227918fa15ea','form-liaison.form','a86746e3-2d56-11eb-b88c-227918fa15ea','{\"name\":\"联络单\",\"key\":\"liaison\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"subject\",\"name\":\"主题\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${subject}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"department\",\"name\":\"接收单位\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${department}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"content\",\"name\":\"正文\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${content}\",\"layout\":null}],\"outcomes\":[]}'),
('b01fe4f3-2e00-11eb-8699-227918fa15ea','form-a867e325-2d56-11eb-b88c-227918fa15ea',NULL,'{\"values\":{\"subject\":\"二十四\",\"department\":\"2222222222\",\"content\":\"222222222222222222\"}}'),
('ceaa8ba8-2d57-11eb-b88c-227918fa15ea','form-vendor-code-request-form.form','ceaa8ba7-2d57-11eb-b88c-227918fa15ea','{\"name\":\"FI厂商代码申请单\",\"key\":\"vendor-code-request-form\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null}],\"outcomes\":[]}'),
('d5a5f3f8-2d6d-11eb-aadf-227918fa15ea','form-fcf6a4eb-2bcb-11eb-9e90-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"1111111111\",\"description\":\"    1111111111111111111\"}}'),
('d805df43-2d4c-11eb-9afa-227918fa15ea','form-fcf6a4eb-2bcb-11eb-9e90-227918fa15ea',NULL,'{\"values\":{\"summary\":\"test\",\"empid\":\"11\",\"description\":\"1\"}}'),
('df372756-2ef9-11eb-aabd-227918fa15ea','form-9fd471e0-2e0b-11eb-b42b-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"33333\",\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\":true,\"manager\":\"manager\",\"description\":\"    3333333333333\",\"skip\":true}}'),
('f26245c2-2e06-11eb-bbd8-227918fa15ea','form-78ad806f-2e06-11eb-84ba-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"2222\",\"description\":\"    22222222222222222222\"}}'),
('f880f1d6-2e0b-11eb-b5e4-227918fa15ea','form-9fd471e0-2e0b-11eb-b42b-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"123123\",\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\":true,\"manager\":\"manager\",\"description\":\"    21313213\",\"skip\":true}}'),
('fcf5e19a-2bcb-11eb-9e90-227918fa15ea','form-out-factory.form','fcf5e199-2bcb-11eb-9e90-227918fa15ea','{\"name\":\"外出单\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"主旨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"人员编号\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"描述\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}');

/*Table structure for table `ACT_GE_BYTEARRAY` */

DROP TABLE IF EXISTS `ACT_GE_BYTEARRAY`;

CREATE TABLE `ACT_GE_BYTEARRAY` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_GE_BYTEARRAY` */

insert  into `ACT_GE_BYTEARRAY`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values 
('00223620-2e08-11eb-bbd8-227918fa15ea',1,'out-factory.bpmn','0022361f-2e08-11eb-bbd8-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"外出单\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"填单\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"申请人确认\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${skip}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"主管审核\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('00860101-2e08-11eb-bbd8-227918fa15ea',1,'out-factory.out-factory.png','0022361f-2e08-11eb-bbd8-227918fa15ea','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0�\0\0\0�@m�\0\0~IDATx���}�Uu�\0�*z\"\"��#ڨ�h%\"\"�6�\"���6zs���4�\'�5��\"{�������6D�u]5g|͔ްYCV7�̜�m}̧1�<{������y�w��/3��;����|�����s��~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��$I�޴iӬ5k����ؘ,^�X�s444$+V���4���9��(�+W�LZZZ��{���;v$˗/ߕ��j9��m)�S������rH�zYL�*��ia�\'��P�!���z��XQ�9�Cb��0@��/ޞl��O�W\r�g��6�Ta�Cr��¼{�dݢ)ɗ��o�-�SP5w9$��*+�[���C�r�}5OA�����0�_�t��9�SP5w9$��*+��?�ia��T�]�!@a���C�@�8�����)����C@�捫�����)����C@���5%�>|����t[ܧ�j�rHUV�#66���S�Y�!�\Z�/�$?��C�S�mq�����!9TQa���mX�J��q�+�i�rH�P������K��\\����<�1�X#0�]�!�Bsw#-#0�Y�!��\ns9#��F`\n��.��Pa��p�r\n��.��Pa�Y(�rH���܅f��9(�\n��;t%I��755տ��;˧M��k	�F�\Z�><���;p�]w�<y򦧟~zf\Z���Yɡ�S[[�W555w�5zV\Z���:�=ilN~�c<N��M}���3�N��o�ĉ�믿��Y�&ٶm[�gϞ$�ז�����?O���s�=���-cǎ���Yɡ�s뭷�}\Z���{���K����xCD��G?������Y�޿R��k�&>�������7�|�ٚ�P���;i�>3m�{��;����^s�h��s�.���;�y������Z�pa2z����2�W�f9$�*MMM��#F�o�Q���&O=�T�dɒ��o�M~�駬&�������U���ӧ\'��v[i��m?H��e�>?~|�aÆ�7lٲ%IwZǌ�������������/6��3gfK��عsg����b�O�s��8�Ĉ=\Z{��Q�x�t�^�{�\n��,��P%�؋�}ҤI�(�p���lI�7�,k�1�[#��F��~��4a�i�Bsr���؋S�<�H����)�\'�|�t�~��X��������\Z{_�?~kmm�j�]h�B���7G�G�؋\r�d�R��bs����xC��פ��7��Z�{f�Yɡ�����w*��)��\Z���*��y�q�[���/�V��]aV�����8o�q0\\_x���ޫ]\\y.�;�S�zj���ͱfTI,i��¬0�!9T�9W�������?��\'5:��/9M�Lݲ��%e�|�ͤ?M�>}m\\��R�\n�O�kjj�VaV����:xI��q�<�L_��bs��nYe�Z�qI�����oI�e^��QbAG{�\n��,���@���k�g�/[��O�t\\����-�L|�������777��ɲ��������\\\n��,���@����ɶ���t��Jv��c�nYe������/�z��D��GU܃�i2�Ya�Crh s(���vo����iq��ޣ[V�x��~�����\\Y!��P̡<��N�Uf�ȑ�{�����\\%#�O���W\\q�ѕ4��z������O\Z�m?��c�L�.9$i>��ȝ��?~o������U�k��\n�@��Κ5+�N���������KN�p�\r�	\'��E<��c�i�=nܸN�w�ܹe�q&�駟�Y��q\nε�^����%_�u��+��2��k�\nȡ�\"΋���y?�x�7����Oڶ͙3\'���v�����J�s�/���>��S�v�g$�v�����!k�mʔ)��h�E��G�-�:��TZ���0�(<\nhw�YQ.w����vZ��g����Ԕ�t�I��r�-m��1cFr�&�֭k�v�y�%�]w�P.��C���E�D�/�/r���o�~_}��ɹ��n[��k��VV���J�{�~G��Cͽ�r�<e{��g��������\n;Ͻ�Q�@4��\'f�7�vt;�{������ʶw6r�?�!���K/e��������/O.�����N�>��dذa�֭[��˗g�ۻ�w�|��٬�,��CḚ�ӄ#�\"�b&h�ڵY#��\'�xb�,H�:�lI(�7o��s�#q;�����39��D^�gX\\|��m�t�9�ćJ%+W��ͽ�r�;e{���������P�gĈ_W��*e��G�h�=�������4jG����rJV�cZ����t4���F#�8��C+��Ǻi�I��z������؁�w�����s�vG�/�Dn_t�EYc�����K������W���^\\�.�����\nuuuu\\���M�4�����-�Y��*���{�ȣwր#bDT�:1\"��.��NG��i�(�H.f\0b[����*k�y�.6�ݻwg�;ꨣ���ʛ���X�x�#���,�A�{wyM;�7���c��=\ZE>�y\\:���c�e�=�ޯ�wϵ�)�w�q�}�ݷ�F�;ӑ�>�����\"��.6�q�wl/6�|[�k��c{4��\Zkj��c�4/�ys�F��=^3n���؋�=�n�]:��0\\s���\Za���w���(�\r�ܑ{������a�9u��,�&L��L�<9�?�Gs/�����¥u��O�$�������c}?��[�4-��u��=ֺ���ߋϿq���5��{����1���ꫯf?>o�1���nyA/m�1��y��l���\ZmX�0WFs���ȓ�f�\"�x���{9��OƎ��ٳ�獯q;���=?�#f�b� \Z{�8=��sɔ)S��{��M��l}~i_}�{:��_�Wk�����̴��nذ�O\Z{SS���5��{�ê���Ҧ��H�t��ۑ�g�}���#���8ʎ����������{�0�AW�������x@a��i��F����h/w�;����1��3,\"�^%{��)��{V��ؑ7���;��=�Q/����zMA]]]mZ�nii�����w�}�6�o�}z�R��#� ����j�gBDa�m�Ӟ/��B��8�.Nk˛{�����[����ŷ5��b��z�;��,\nD����#3����{g#���)m�嬹��\n;��vZ��7�xc��q>��^�������u��p����JF�������cǎ��[#��GcO��j�����#�(��hbZ=��c�њ{4�(��}��t饗�;��u����V�gbM4�r��(�q$s|E����Ǻ}iż����y� ����\n�\06��Fץ��8�����|�(�x�#\'���Ÿ?����^��A��Iw�����z�ݒP��ǎ������b��5��	��W�Q�q�\\q�=b0�k:�#LG�>�����Av;���?�T|$�`���K��e�������:�ԏ���(�;v�h7���U���ˡx����u���ʡ���4v�s4��q����S�1�W����_~99r�o%W��=X�5]��\r�����9}���<��P���|\Zc�5�J�.x4�|Z\\a�Cbh4��^O�;�Xi�}h5���ɏ\Z5�eڴi_}��Gߤ{~������k�744����>� �c�I{��(K�Ya�Cr�����&��\'M}0�k�WFJ�f��ko�O	�?-(>T �=�(�W2R�f9$��k�܅�,���0�]�!@aV�����Ya�CBsf�Y�!@s\n��C��,4w!�\0�Ya�CBsf�Y	�P�f9$�\0�](�rH\n��܅f�Y	�P�f9$4w@aV��4w�0�!9(�BsrP�f�]h�¬0�!��\n��,�����Y�!�Z466*��{�¼O���C@/[�b����E�b۶m����rH�zْ%K�_�lٟ��V�q�F[Q�\Z\Z�I�&9$�Z} -H��?��X����������C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@��\"���G+ \0\0\0\0IEND�B`�',1),
('2cbc1318-2d3d-11eb-a3a6-227918fa15ea',1,'???.bpmn20.xml','2cbc1317-2d3d-11eb-a3a6-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"外出单\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"填单\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"申请人确认\" flowable:assignee=\"$INITIATOR\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${_FLOWABLE_SKIP_EXPRESSION_ENABLED==true}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"主管审核\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('2d2b2899-2d3d-11eb-a3a6-227918fa15ea',1,'???.out-factory.png','2cbc1317-2d3d-11eb-a3a6-227918fa15ea','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0�\0\0\0�@m�\0\0~IDATx���}�Uu�\0�*z\"\"��#ڨ�h%\"\"�6�\"���6zs���4�\'�5��\"{�������6D�u]5g|͔ްYCV7�̜�m}̧1�<{������y�w��/3��;����|�����s��~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��$I�޴iӬ5k����ؘ,^�X�s444$+V���4���9��(�+W�LZZZ��{���;v$˗/ߕ��j9��m)�S������rH�zYL�*��ia�\'��P�!���z��XQ�9�Cb��0@��/ޞl��O�W\r�g��6�Ta�Cr��¼{�dݢ)ɗ��o�-�SP5w9$��*+�[���C�r�}5OA�����0�_�t��9�SP5w9$��*+��?�ia��T�]�!@a���C�@�8�����)����C@�捫�����)����C@���5%�>|����t[ܧ�j�rHUV�#66���S�Y�!�\Z�/�$?��C�S�mq�����!9TQa���mX�J��q�+�i�rH�P������K��\\����<�1�X#0�]�!�Bsw#-#0�Y�!��\ns9#��F`\n��.��Pa��p�r\n��.��Pa�Y(�rH���܅f��9(�\n��;t%I��755տ��;˧M��k	�F�\Z�><���;p�]w�<y򦧟~zf\Z���Yɡ�S[[�W555w�5zV\Z���:�=ilN~�c<N��M}���3�N��o�ĉ�믿��Y�&ٶm[�gϞ$�ז�����?O���s�=���-cǎ���Yɡ�s뭷�}\Z���{���K����xCD��G?������Y�޿R��k�&>�������7�|�ٚ�P���;i�>3m�{��;����^s�h��s�.���;�y������Z�pa2z����2�W�f9$�*MMM��#F�o�Q���&O=�T�dɒ��o�M~�駬&�������U���ӧ\'��v[i��m?H��e�>?~|�aÆ�7lٲ%IwZǌ�������������/6��3gfK��عsg����b�O�s��8�Ĉ=\Z{��Q�x�t�^�{�\n��,��P%�؋�}ҤI�(�p���lI�7�,k�1�[#��F��~��4a�i�Bsr���؋S�<�H����)�\'�|�t�~��X��������\Z{_�?~kmm�j�]h�B���7G�G�؋\r�d�R��bs����xC��פ��7��Z�{f�Yɡ�����w*��)��\Z���*��y�q�[���/�V��]aV�����8o�q0\\_x���ޫ]\\y.�;�S�zj���ͱfTI,i��¬0�!9T�9W�������?��\'5:��/9M�Lݲ��%e�|�ͤ?M�>}m\\��R�\n�O�kjj�VaV����:xI��q�<�L_��bs��nYe�Z�qI�����oI�e^��QbAG{�\n��,���@���k�g�/[��O�t\\����-�L|�������777��ɲ��������\\\n��,���@����ɶ���t��Jv��c�nYe������/�z��D��GU܃�i2�Ya�Crh s(���vo����iq��ޣ[V�x��~�����\\Y!��P̡<��N�Uf�ȑ�{�����\\%#�O���W\\q�ѕ4��z������O\Z�m?��c�L�.9$i>��ȝ��?~o������U�k��\n�@��Κ5+�N���������KN�p�\r�	\'��E<��c�i�=nܸN�w�ܹe�q&�駟�Y��q\nε�^����%_�u��+��2��k�\nȡ�\"΋���y?�x�7����Oڶ͙3\'���v�����J�s�/���>��S�v�g$�v�����!k�mʔ)��h�E��G�-�:��TZ���0�(<\nhw�YQ.w����vZ��g����Ԕ�t�I��r�-m��1cFr�&�֭k�v�y�%�]w�P.��C���E�D�/�/r���o�~_}��ɹ��n[��k��VV���J�{�~G��Cͽ�r�<e{��g��������\n;Ͻ�Q�@4��\'f�7�vt;�{������ʶw6r�?�!���K/e��������/O.�����N�>��dذa�֭[��˗g�ۻ�w�|��٬�,��CḚ�ӄ#�\"�b&h�ڵY#��\'�xb�,H�:�lI(�7o��s�#q;�����39��D^�gX\\|��m�t�9�ćJ%+W��ͽ�r�;e{���������P�gĈ_W��*e��G�h�=�������4jG����rJV�cZ����t4���F#�8��C+��Ǻi�I��z������؁�w�����s�vG�/�Dn_t�EYc�����K������W���^\\�.�����\nuuuu\\���M�4�����-�Y��*���{�ȣwր#bDT�:1\"��.��NG��i�(�H.f\0b[����*k�y�.6�ݻwg�;ꨣ���ʛ���X�x�#���,�A�{wyM;�7���c��=\ZE>�y\\:���c�e�=�ޯ�wϵ�)�w�q�}�ݷ�F�;ӑ�>�����\"��.6�q�wl/6�|[�k��c{4��\Zkj��c�4/�ys�F��=^3n���؋�=�n�]:��0\\s���\Za���w���(�\r�ܑ{������a�9u��,�&L��L�<9�?�Gs/�����¥u��O�$�������c}?��[�4-��u��=ֺ���ߋϿq���5��{����1���ꫯf?>o�1���nyA/m�1��y��l���\ZmX�0WFs���ȓ�f�\"�x���{9��OƎ��ٳ�獯q;���=?�#f�b� \Z{�8=��sɔ)S��{��M��l}~i_}�{:��_�Wk�����̴��nذ�O\Z{SS���5��{�ê���Ҧ��H�t��ۑ�g�}���#���8ʎ����������{�0�AW�������x@a��i��F����h/w�;����1��3,\"�^%{��)��{V��ؑ7���;��=�Q/����zMA]]]mZ�nii�����w�}�6�o�}z�R��#� ����j�gBDa�m�Ӟ/��B��8�.Nk˛{�����[����ŷ5��b��z�;��,\nD����#3����{g#���)m�嬹��\n;��vZ��7�xc��q>��^�������u��p����JF�������cǎ��[#��GcO��j�����#�(��hbZ=��c�њ{4�(��}��t饗�;��u����V�gbM4�r��(�q$s|E����Ǻ}iż����y� ����\n�\06��Fץ��8�����|�(�x�#\'���Ÿ?����^��A��Iw�����z�ݒP��ǎ������b��5��	��W�Q�q�\\q�=b0�k:�#LG�>�����Av;���?�T|$�`���K��e�������:�ԏ���(�;v�h7���U���ˡx����u���ʡ���4v�s4��q����S�1�W����_~99r�o%W��=X�5]��\r�����9}���<��P���|\Zc�5�J�.x4�|Z\\a�Cbh4��^O�;�Xi�}h5���ɏ\Z5�eڴi_}��Gߤ{~������k�744����>� �c�I{��(K�Ya�Cr�����&��\'M}0�k�WFJ�f��ko�O	�?-(>T �=�(�W2R�f9$��k�܅�,���0�]�!@aV�����Ya�CBsf�Y�!@s\n��C��,4w!�\0�Ya�CBsf�Y	�P�f9$�\0�](�rH\n��܅f�Y	�P�f9$4w@aV��4w�0�!9(�BsrP�f�]h�¬0�!��\n��,�����Y�!�Z466*��{�¼O���C@/[�b����E�b۶m����rH�zْ%K�_�lٟ��V�q�F[Q�\Z\Z�I�&9$�Z} -H��?��X����������C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@��\"���G+ \0\0\0\0IEND�B`�',1),
('59d51655-2bc9-11eb-9d15-227918fa15ea',1,'out-factory.bpmn','59d51654-2bc9-11eb-9d15-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"外出单\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"填单\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:formProperty id=\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\" name=\"FLOWABLE_SKIP_EXPRESSION_ENABLED\" type=\"boolean\" default=\"true\"></flowable:formProperty>\n        <flowable:formProperty id=\"manager\" name=\"所属领导\" type=\"string\" default=\"manager\"></flowable:formProperty>\n      </extensionElements>\n    </startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"申请人确认\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${_FLOWABLE_SKIP_EXPRESSION_ENABLED==true}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"主管审核\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('59f71d46-2bc9-11eb-9d15-227918fa15ea',1,'out-factory.out-factory.png','59d51654-2bc9-11eb-9d15-227918fa15ea','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0�\0\0\0�@m�\0\0~IDATx���}�Uu�\0�*z\"\"��#ڨ�h%\"\"�6�\"���6zs���4�\'�5��\"{�������6D�u]5g|͔ްYCV7�̜�m}̧1�<{������y�w��/3��;����|�����s��~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��$I�޴iӬ5k����ؘ,^�X�s444$+V���4���9��(�+W�LZZZ��{���;v$˗/ߕ��j9��m)�S������rH�zYL�*��ia�\'��P�!���z��XQ�9�Cb��0@��/ޞl��O�W\r�g��6�Ta�Cr��¼{�dݢ)ɗ��o�-�SP5w9$��*+�[���C�r�}5OA�����0�_�t��9�SP5w9$��*+��?�ia��T�]�!@a���C�@�8�����)����C@�捫�����)����C@���5%�>|����t[ܧ�j�rHUV�#66���S�Y�!�\Z�/�$?��C�S�mq�����!9TQa���mX�J��q�+�i�rH�P������K��\\����<�1�X#0�]�!�Bsw#-#0�Y�!��\ns9#��F`\n��.��Pa��p�r\n��.��Pa�Y(�rH���܅f��9(�\n��;t%I��755տ��;˧M��k	�F�\Z�><���;p�]w�<y򦧟~zf\Z���Yɡ�S[[�W555w�5zV\Z���:�=ilN~�c<N��M}���3�N��o�ĉ�믿��Y�&ٶm[�gϞ$�ז�����?O���s�=���-cǎ���Yɡ�s뭷�}\Z���{���K����xCD��G?������Y�޿R��k�&>�������7�|�ٚ�P���;i�>3m�{��;����^s�h��s�.���;�y������Z�pa2z����2�W�f9$�*MMM��#F�o�Q���&O=�T�dɒ��o�M~�駬&�������U���ӧ\'��v[i��m?H��e�>?~|�aÆ�7lٲ%IwZǌ�������������/6��3gfK��عsg����b�O�s��8�Ĉ=\Z{��Q�x�t�^�{�\n��,��P%�؋�}ҤI�(�p���lI�7�,k�1�[#��F��~��4a�i�Bsr���؋S�<�H����)�\'�|�t�~��X��������\Z{_�?~kmm�j�]h�B���7G�G�؋\r�d�R��bs����xC��פ��7��Z�{f�Yɡ�����w*��)��\Z���*��y�q�[���/�V��]aV�����8o�q0\\_x���ޫ]\\y.�;�S�zj���ͱfTI,i��¬0�!9T�9W�������?��\'5:��/9M�Lݲ��%e�|�ͤ?M�>}m\\��R�\n�O�kjj�VaV����:xI��q�<�L_��bs��nYe�Z�qI�����oI�e^��QbAG{�\n��,���@���k�g�/[��O�t\\����-�L|�������777��ɲ��������\\\n��,���@����ɶ���t��Jv��c�nYe������/�z��D��GU܃�i2�Ya�Crh s(���vo����iq��ޣ[V�x��~�����\\Y!��P̡<��N�Uf�ȑ�{�����\\%#�O���W\\q�ѕ4��z������O\Z�m?��c�L�.9$i>��ȝ��?~o������U�k��\n�@��Κ5+�N���������KN�p�\r�	\'��E<��c�i�=nܸN�w�ܹe�q&�駟�Y��q\nε�^����%_�u��+��2��k�\nȡ�\"΋���y?�x�7����Oڶ͙3\'���v�����J�s�/���>��S�v�g$�v�����!k�mʔ)��h�E��G�-�:��TZ���0�(<\nhw�YQ.w����vZ��g����Ԕ�t�I��r�-m��1cFr�&�֭k�v�y�%�]w�P.��C���E�D�/�/r���o�~_}��ɹ��n[��k��VV���J�{�~G��Cͽ�r�<e{��g��������\n;Ͻ�Q�@4��\'f�7�vt;�{������ʶw6r�?�!���K/e��������/O.�����N�>��dذa�֭[��˗g�ۻ�w�|��٬�,��CḚ�ӄ#�\"�b&h�ڵY#��\'�xb�,H�:�lI(�7o��s�#q;�����39��D^�gX\\|��m�t�9�ćJ%+W��ͽ�r�;e{���������P�gĈ_W��*e��G�h�=�������4jG����rJV�cZ����t4���F#�8��C+��Ǻi�I��z������؁�w�����s�vG�/�Dn_t�EYc�����K������W���^\\�.�����\nuuuu\\���M�4�����-�Y��*���{�ȣwր#bDT�:1\"��.��NG��i�(�H.f\0b[����*k�y�.6�ݻwg�;ꨣ���ʛ���X�x�#���,�A�{wyM;�7���c��=\ZE>�y\\:���c�e�=�ޯ�wϵ�)�w�q�}�ݷ�F�;ӑ�>�����\"��.6�q�wl/6�|[�k��c{4��\Zkj��c�4/�ys�F��=^3n���؋�=�n�]:��0\\s���\Za���w���(�\r�ܑ{������a�9u��,�&L��L�<9�?�Gs/�����¥u��O�$�������c}?��[�4-��u��=ֺ���ߋϿq���5��{����1���ꫯf?>o�1���nyA/m�1��y��l���\ZmX�0WFs���ȓ�f�\"�x���{9��OƎ��ٳ�獯q;���=?�#f�b� \Z{�8=��sɔ)S��{��M��l}~i_}�{:��_�Wk�����̴��nذ�O\Z{SS���5��{�ê���Ҧ��H�t��ۑ�g�}���#���8ʎ����������{�0�AW�������x@a��i��F����h/w�;����1��3,\"�^%{��)��{V��ؑ7���;��=�Q/����zMA]]]mZ�nii�����w�}�6�o�}z�R��#� ����j�gBDa�m�Ӟ/��B��8�.Nk˛{�����[����ŷ5��b��z�;��,\nD����#3����{g#���)m�嬹��\n;��vZ��7�xc��q>��^�������u��p����JF�������cǎ��[#��GcO��j�����#�(��hbZ=��c�њ{4�(��}��t饗�;��u����V�gbM4�r��(�q$s|E����Ǻ}iż����y� ����\n�\06��Fץ��8�����|�(�x�#\'���Ÿ?����^��A��Iw�����z�ݒP��ǎ������b��5��	��W�Q�q�\\q�=b0�k:�#LG�>�����Av;���?�T|$�`���K��e�������:�ԏ���(�;v�h7���U���ˡx����u���ʡ���4v�s4��q����S�1�W����_~99r�o%W��=X�5]��\r�����9}���<��P���|\Zc�5�J�.x4�|Z\\a�Cbh4��^O�;�Xi�}h5���ɏ\Z5�eڴi_}��Gߤ{~������k�744����>� �c�I{��(K�Ya�Cr�����&��\'M}0�k�WFJ�f��ko�O	�?-(>T �=�(�W2R�f9$��k�܅�,���0�]�!@aV�����Ya�CBsf�Y�!@s\n��C��,4w!�\0�Ya�CBsf�Y	�P�f9$�\0�](�rH\n��܅f�Y	�P�f9$4w@aV��4w�0�!9(�BsrP�f�]h�¬0�!��\n��,�����Y�!�Z466*��{�¼O���C@/[�b����E�b۶m����rH�zْ%K�_�lٟ��V�q�F[Q�\Z\Z�I�&9$�Z} -H��?��X����������C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@��\"���G+ \0\0\0\0IEND�B`�',1),
('5c0b5346-2d58-11eb-b88c-227918fa15ea',1,'rehire-form.bpmn','5c0b5345-2d58-11eb-b88c-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"rehire-form\" name=\"返廠申請單\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" flowable:initiator=\"initiator\" flowable:formKey=\"rehire-form\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-345367B5-F2D6-40E7-A1B1-D802F28D51BD\" sourceRef=\"startEvent1\" targetRef=\"sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\"></sequenceFlow>\n    <endEvent id=\"sid-28104B17-66FC-492B-8654-D19352BABECE\"></endEvent>\n    <sequenceFlow id=\"sid-6A43BA7B-9987-46BC-AB2A-44F15554599B\" sourceRef=\"sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\" targetRef=\"sid-28104B17-66FC-492B-8654-D19352BABECE\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_rehire-form\">\n    <bpmndi:BPMNPlane bpmnElement=\"rehire-form\" id=\"BPMNPlane_rehire-form\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\" id=\"BPMNShape_sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-28104B17-66FC-492B-8654-D19352BABECE\" id=\"BPMNShape_sid-28104B17-66FC-492B-8654-D19352BABECE\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-6A43BA7B-9987-46BC-AB2A-44F15554599B\" id=\"BPMNEdge_sid-6A43BA7B-9987-46BC-AB2A-44F15554599B\">\n        <omgdi:waypoint x=\"274.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-345367B5-F2D6-40E7-A1B1-D802F28D51BD\" id=\"BPMNEdge_sid-345367B5-F2D6-40E7-A1B1-D802F28D51BD\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('5c2e1d87-2d58-11eb-b88c-227918fa15ea',1,'rehire-form.rehire-form.png','5c0b5345-2d58-11eb-b88c-227918fa15ea','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0f\0\0\0�\0\0\0�)�q\0\0	nIDATx���[kU��a/������G�E/�\0�5ф(F�gG��D<�	�B���ba�֎1�q�V�T�j�9&�ڌ:&ƨ���h2�d���;�f&����˛w����q\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�@�$�oܸ��ٳg_577\'���&�ijjJN�8��0U�H`\\��ɓ\'��������|�y��ar����!ғ�0�ŕ�(M���\n���Ƹ�}!��3!���J��� U�G%sN������ƹ/�+Mk&�}���\n3�����=�ܰ:�tx�[??\'����W��N�3s��!Af �0_=�y�0��	�0)��r�!�?\'���0c;��*���?\'�����7d���U�������-�|���m���9Af �0ǹ����	s���\n3�1���yr��������TaRs�����/��c��s��0i�9��;��$?��!����5�k���(P�l�l�,�@�a�e�<��Y`��s�G\Z���0y�f@��0�,̀0a��%I�I[[[��ݻ�oڴ���kjj�)S�$UUU��Ν۷r���7o����l�y�*++RQQ1?�__���i<���>�?����u�4F��o߾�֭[׿x��d�Ν�ٳg�������7��_�������\'!�ɢE�^/Y����ٳg	���M�:��a\Z���	q.s,|}�Z�!���ׯ�|���|�2��ŋ�+V�����:y��	�桅�Nq=�1~ߜ,�s�wW��<�2gΜ�СC���9��������Y��9�***�L�6�?ّ���L6nܘ���$w��I�<y2p>={�l��ӧO\'۷oO�O�>8�O���4ʭ��]�`Ar�ڵ$nݺ����̚5�7�l���(B�2;�{���\Z�Eww����_���fe$��c�s=0r�}a�\\��ͅY��RΎ�ҥKV�#]�rg+�r�S���Z)�o�<cƌ�p�|*�f,�9�)go_�����]1Rq�cÆ\r��5>U�����d�ڵ}qO��>�~��V��Xs�rS�Jy�QΎ��Iu+a����C���ŋ���͛�Y�?f	�0�V�$.{Oy���mkd�9��(��r�N9^��K�.���Y��9an�D3�pW{��j.u����h.��P����q���N�0�fa.�1��˼�W��=*����t)��+1�6�]�v%iھ}��xKi����������,̅8���f=�u[�l)�9��ϕ���g_�۬�t�̙[�`9Tl\'U�|�Տ0�h��7Ͼ�|kkkAϱxJ��!�+1�D������+,w����a��}r	�0��z�@�����E����Y�w���ħ�eH�����\'e�I����?�\n�0��\nӓ��|]\"7ܥsY�w�ҕ��?�c�[>�sqM)C�I�S�S]]�:�sOOOg������L�8q��+��CY�U�bfx,�K{������(�=淂l�Y��q�c&g�W����U\r\r\r)ҫ2��wf\r�0s>�!We���[��J�:�����Ev�{W��,��<�\\�L�V�Z�����J�ο�iӦ���Ffa�x�_8��Ӹ�/��;�J�ҥK��ֳ2\Z\Z\Z������,̣�Y�l�̙��-[֟ª�;��/x���t��=].�c�=]�L��յ�y�q?;~���\\a6e���c�zsX`��^-�����	�S�&mmm����L�0O��a���w0)CUUU�a��,���w�޽S�ǫ���������˼�����R��Qn*++k���k�W�1��@\\Q�6�,�y^9�d�9�.��\\���/�e�)�)�s�!������|?���m��eܾ�`9���0�\\ӝ��x�s�	%��3�q�\"��oٱcGR]]�j�݆O��\\c�}�𝸹����=r��ѣG�����/>��>�0s�ε���F8\'�)��@O������ڴiӕS�N�ߵ;2>�$�Ͼhjj��5k�	��oă$~�.�W��Y�}��	t����5r�{��W�����7��2O��I����[?��.#af�\Z��a�Y�a6��0�l�fa��3 �F�af@��0�,̀0a�Y�a6��0�l�f#̀03 �F�af@��0����,��3�!���J�N�8����%�E0���a�ꨄ1����W����=x�G?�J9F����v�I�J`\\��ga�v.��8M��ܯ�2\0\0\0\0\0\0\0\0\0\0\0\0���W#�y�^\0\0\0\0IEND�B`�',1),
('6748cd33-2bc8-11eb-9d15-227918fa15ea',1,'out-factory.bpmn','6748cd32-2bc8-11eb-9d15-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"外出单\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"填单\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:formProperty id=\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\" name=\"FLOWABLE_SKIP_EXPRESSION_ENABLED\" type=\"boolean\" default=\"true\"></flowable:formProperty>\n      </extensionElements>\n    </startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"申请人确认\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${_FLOWABLE_SKIP_EXPRESSION_ENABLED==true}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"主管审核\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('678d9e64-2bc8-11eb-9d15-227918fa15ea',1,'out-factory.out-factory.png','6748cd32-2bc8-11eb-9d15-227918fa15ea','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0�\0\0\0�@m�\0\0~IDATx���}�Uu�\0�*z\"\"��#ڨ�h%\"\"�6�\"���6zs���4�\'�5��\"{�������6D�u]5g|͔ްYCV7�̜�m}̧1�<{������y�w��/3��;����|�����s��~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��$I�޴iӬ5k����ؘ,^�X�s444$+V���4���9��(�+W�LZZZ��{���;v$˗/ߕ��j9��m)�S������rH�zYL�*��ia�\'��P�!���z��XQ�9�Cb��0@��/ޞl��O�W\r�g��6�Ta�Cr��¼{�dݢ)ɗ��o�-�SP5w9$��*+�[���C�r�}5OA�����0�_�t��9�SP5w9$��*+��?�ia��T�]�!@a���C�@�8�����)����C@�捫�����)����C@���5%�>|����t[ܧ�j�rHUV�#66���S�Y�!�\Z�/�$?��C�S�mq�����!9TQa���mX�J��q�+�i�rH�P������K��\\����<�1�X#0�]�!�Bsw#-#0�Y�!��\ns9#��F`\n��.��Pa��p�r\n��.��Pa�Y(�rH���܅f��9(�\n��;t%I��755տ��;˧M��k	�F�\Z�><���;p�]w�<y򦧟~zf\Z���Yɡ�S[[�W555w�5zV\Z���:�=ilN~�c<N��M}���3�N��o�ĉ�믿��Y�&ٶm[�gϞ$�ז�����?O���s�=���-cǎ���Yɡ�s뭷�}\Z���{���K����xCD��G?������Y�޿R��k�&>�������7�|�ٚ�P���;i�>3m�{��;����^s�h��s�.���;�y������Z�pa2z����2�W�f9$�*MMM��#F�o�Q���&O=�T�dɒ��o�M~�駬&�������U���ӧ\'��v[i��m?H��e�>?~|�aÆ�7lٲ%IwZǌ�������������/6��3gfK��عsg����b�O�s��8�Ĉ=\Z{��Q�x�t�^�{�\n��,��P%�؋�}ҤI�(�p���lI�7�,k�1�[#��F��~��4a�i�Bsr���؋S�<�H����)�\'�|�t�~��X��������\Z{_�?~kmm�j�]h�B���7G�G�؋\r�d�R��bs����xC��פ��7��Z�{f�Yɡ�����w*��)��\Z���*��y�q�[���/�V��]aV�����8o�q0\\_x���ޫ]\\y.�;�S�zj���ͱfTI,i��¬0�!9T�9W�������?��\'5:��/9M�Lݲ��%e�|�ͤ?M�>}m\\��R�\n�O�kjj�VaV����:xI��q�<�L_��bs��nYe�Z�qI�����oI�e^��QbAG{�\n��,���@���k�g�/[��O�t\\����-�L|�������777��ɲ��������\\\n��,���@����ɶ���t��Jv��c�nYe������/�z��D��GU܃�i2�Ya�Crh s(���vo����iq��ޣ[V�x��~�����\\Y!��P̡<��N�Uf�ȑ�{�����\\%#�O���W\\q�ѕ4��z������O\Z�m?��c�L�.9$i>��ȝ��?~o������U�k��\n�@��Κ5+�N���������KN�p�\r�	\'��E<��c�i�=nܸN�w�ܹe�q&�駟�Y��q\nε�^����%_�u��+��2��k�\nȡ�\"΋���y?�x�7����Oڶ͙3\'���v�����J�s�/���>��S�v�g$�v�����!k�mʔ)��h�E��G�-�:��TZ���0�(<\nhw�YQ.w����vZ��g����Ԕ�t�I��r�-m��1cFr�&�֭k�v�y�%�]w�P.��C���E�D�/�/r���o�~_}��ɹ��n[��k��VV���J�{�~G��Cͽ�r�<e{��g��������\n;Ͻ�Q�@4��\'f�7�vt;�{������ʶw6r�?�!���K/e��������/O.�����N�>��dذa�֭[��˗g�ۻ�w�|��٬�,��CḚ�ӄ#�\"�b&h�ڵY#��\'�xb�,H�:�lI(�7o��s�#q;�����39��D^�gX\\|��m�t�9�ćJ%+W��ͽ�r�;e{���������P�gĈ_W��*e��G�h�=�������4jG����rJV�cZ����t4���F#�8��C+��Ǻi�I��z������؁�w�����s�vG�/�Dn_t�EYc�����K������W���^\\�.�����\nuuuu\\���M�4�����-�Y��*���{�ȣwր#bDT�:1\"��.��NG��i�(�H.f\0b[����*k�y�.6�ݻwg�;ꨣ���ʛ���X�x�#���,�A�{wyM;�7���c��=\ZE>�y\\:���c�e�=�ޯ�wϵ�)�w�q�}�ݷ�F�;ӑ�>�����\"��.6�q�wl/6�|[�k��c{4��\Zkj��c�4/�ys�F��=^3n���؋�=�n�]:��0\\s���\Za���w���(�\r�ܑ{������a�9u��,�&L��L�<9�?�Gs/�����¥u��O�$�������c}?��[�4-��u��=ֺ���ߋϿq���5��{����1���ꫯf?>o�1���nyA/m�1��y��l���\ZmX�0WFs���ȓ�f�\"�x���{9��OƎ��ٳ�獯q;���=?�#f�b� \Z{�8=��sɔ)S��{��M��l}~i_}�{:��_�Wk�����̴��nذ�O\Z{SS���5��{�ê���Ҧ��H�t��ۑ�g�}���#���8ʎ����������{�0�AW�������x@a��i��F����h/w�;����1��3,\"�^%{��)��{V��ؑ7���;��=�Q/����zMA]]]mZ�nii�����w�}�6�o�}z�R��#� ����j�gBDa�m�Ӟ/��B��8�.Nk˛{�����[����ŷ5��b��z�;��,\nD����#3����{g#���)m�嬹��\n;��vZ��7�xc��q>��^�������u��p����JF�������cǎ��[#��GcO��j�����#�(��hbZ=��c�њ{4�(��}��t饗�;��u����V�gbM4�r��(�q$s|E����Ǻ}iż����y� ����\n�\06��Fץ��8�����|�(�x�#\'���Ÿ?����^��A��Iw�����z�ݒP��ǎ������b��5��	��W�Q�q�\\q�=b0�k:�#LG�>�����Av;���?�T|$�`���K��e�������:�ԏ���(�;v�h7���U���ˡx����u���ʡ���4v�s4��q����S�1�W����_~99r�o%W��=X�5]��\r�����9}���<��P���|\Zc�5�J�.x4�|Z\\a�Cbh4��^O�;�Xi�}h5���ɏ\Z5�eڴi_}��Gߤ{~������k�744����>� �c�I{��(K�Ya�Cr�����&��\'M}0�k�WFJ�f��ko�O	�?-(>T �=�(�W2R�f9$��k�܅�,���0�]�!@aV�����Ya�CBsf�Y�!@s\n��C��,4w!�\0�Ya�CBsf�Y	�P�f9$�\0�](�rH\n��܅f�Y	�P�f9$4w@aV��4w�0�!9(�BsrP�f�]h�¬0�!��\n��,�����Y�!�Z466*��{�¼O���C@/[�b����E�b۶m����rH�zْ%K�_�lٟ��V�q�F[Q�\Z\Z�I�&9$�Z} -H��?��X����������C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@��\"���G+ \0\0\0\0IEND�B`�',1),
('6d8cddac-2e03-11eb-8edb-227918fa15ea',1,'out-factory.bpmn','6d8cddab-2e03-11eb-8edb-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"外出单\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"填单\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"申请人确认\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${skip==true}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"主管审核\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('6dda616d-2e03-11eb-8edb-227918fa15ea',1,'out-factory.out-factory.png','6d8cddab-2e03-11eb-8edb-227918fa15ea','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0�\0\0\0�@m�\0\0~IDATx���}�Uu�\0�*z\"\"��#ڨ�h%\"\"�6�\"���6zs���4�\'�5��\"{�������6D�u]5g|͔ްYCV7�̜�m}̧1�<{������y�w��/3��;����|�����s��~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��$I�޴iӬ5k����ؘ,^�X�s444$+V���4���9��(�+W�LZZZ��{���;v$˗/ߕ��j9��m)�S������rH�zYL�*��ia�\'��P�!���z��XQ�9�Cb��0@��/ޞl��O�W\r�g��6�Ta�Cr��¼{�dݢ)ɗ��o�-�SP5w9$��*+�[���C�r�}5OA�����0�_�t��9�SP5w9$��*+��?�ia��T�]�!@a���C�@�8�����)����C@�捫�����)����C@���5%�>|����t[ܧ�j�rHUV�#66���S�Y�!�\Z�/�$?��C�S�mq�����!9TQa���mX�J��q�+�i�rH�P������K��\\����<�1�X#0�]�!�Bsw#-#0�Y�!��\ns9#��F`\n��.��Pa��p�r\n��.��Pa�Y(�rH���܅f��9(�\n��;t%I��755տ��;˧M��k	�F�\Z�><���;p�]w�<y򦧟~zf\Z���Yɡ�S[[�W555w�5zV\Z���:�=ilN~�c<N��M}���3�N��o�ĉ�믿��Y�&ٶm[�gϞ$�ז�����?O���s�=���-cǎ���Yɡ�s뭷�}\Z���{���K����xCD��G?������Y�޿R��k�&>�������7�|�ٚ�P���;i�>3m�{��;����^s�h��s�.���;�y������Z�pa2z����2�W�f9$�*MMM��#F�o�Q���&O=�T�dɒ��o�M~�駬&�������U���ӧ\'��v[i��m?H��e�>?~|�aÆ�7lٲ%IwZǌ�������������/6��3gfK��عsg����b�O�s��8�Ĉ=\Z{��Q�x�t�^�{�\n��,��P%�؋�}ҤI�(�p���lI�7�,k�1�[#��F��~��4a�i�Bsr���؋S�<�H����)�\'�|�t�~��X��������\Z{_�?~kmm�j�]h�B���7G�G�؋\r�d�R��bs����xC��פ��7��Z�{f�Yɡ�����w*��)��\Z���*��y�q�[���/�V��]aV�����8o�q0\\_x���ޫ]\\y.�;�S�zj���ͱfTI,i��¬0�!9T�9W�������?��\'5:��/9M�Lݲ��%e�|�ͤ?M�>}m\\��R�\n�O�kjj�VaV����:xI��q�<�L_��bs��nYe�Z�qI�����oI�e^��QbAG{�\n��,���@���k�g�/[��O�t\\����-�L|�������777��ɲ��������\\\n��,���@����ɶ���t��Jv��c�nYe������/�z��D��GU܃�i2�Ya�Crh s(���vo����iq��ޣ[V�x��~�����\\Y!��P̡<��N�Uf�ȑ�{�����\\%#�O���W\\q�ѕ4��z������O\Z�m?��c�L�.9$i>��ȝ��?~o������U�k��\n�@��Κ5+�N���������KN�p�\r�	\'��E<��c�i�=nܸN�w�ܹe�q&�駟�Y��q\nε�^����%_�u��+��2��k�\nȡ�\"΋���y?�x�7����Oڶ͙3\'���v�����J�s�/���>��S�v�g$�v�����!k�mʔ)��h�E��G�-�:��TZ���0�(<\nhw�YQ.w����vZ��g����Ԕ�t�I��r�-m��1cFr�&�֭k�v�y�%�]w�P.��C���E�D�/�/r���o�~_}��ɹ��n[��k��VV���J�{�~G��Cͽ�r�<e{��g��������\n;Ͻ�Q�@4��\'f�7�vt;�{������ʶw6r�?�!���K/e��������/O.�����N�>��dذa�֭[��˗g�ۻ�w�|��٬�,��CḚ�ӄ#�\"�b&h�ڵY#��\'�xb�,H�:�lI(�7o��s�#q;�����39��D^�gX\\|��m�t�9�ćJ%+W��ͽ�r�;e{���������P�gĈ_W��*e��G�h�=�������4jG����rJV�cZ����t4���F#�8��C+��Ǻi�I��z������؁�w�����s�vG�/�Dn_t�EYc�����K������W���^\\�.�����\nuuuu\\���M�4�����-�Y��*���{�ȣwր#bDT�:1\"��.��NG��i�(�H.f\0b[����*k�y�.6�ݻwg�;ꨣ���ʛ���X�x�#���,�A�{wyM;�7���c��=\ZE>�y\\:���c�e�=�ޯ�wϵ�)�w�q�}�ݷ�F�;ӑ�>�����\"��.6�q�wl/6�|[�k��c{4��\Zkj��c�4/�ys�F��=^3n���؋�=�n�]:��0\\s���\Za���w���(�\r�ܑ{������a�9u��,�&L��L�<9�?�Gs/�����¥u��O�$�������c}?��[�4-��u��=ֺ���ߋϿq���5��{����1���ꫯf?>o�1���nyA/m�1��y��l���\ZmX�0WFs���ȓ�f�\"�x���{9��OƎ��ٳ�獯q;���=?�#f�b� \Z{�8=��sɔ)S��{��M��l}~i_}�{:��_�Wk�����̴��nذ�O\Z{SS���5��{�ê���Ҧ��H�t��ۑ�g�}���#���8ʎ����������{�0�AW�������x@a��i��F����h/w�;����1��3,\"�^%{��)��{V��ؑ7���;��=�Q/����zMA]]]mZ�nii�����w�}�6�o�}z�R��#� ����j�gBDa�m�Ӟ/��B��8�.Nk˛{�����[����ŷ5��b��z�;��,\nD����#3����{g#���)m�嬹��\n;��vZ��7�xc��q>��^�������u��p����JF�������cǎ��[#��GcO��j�����#�(��hbZ=��c�њ{4�(��}��t饗�;��u����V�gbM4�r��(�q$s|E����Ǻ}iż����y� ����\n�\06��Fץ��8�����|�(�x�#\'���Ÿ?����^��A��Iw�����z�ݒP��ǎ������b��5��	��W�Q�q�\\q�=b0�k:�#LG�>�����Av;���?�T|$�`���K��e�������:�ԏ���(�;v�h7���U���ˡx����u���ʡ���4v�s4��q����S�1�W����_~99r�o%W��=X�5]��\r�����9}���<��P���|\Zc�5�J�.x4�|Z\\a�Cbh4��^O�;�Xi�}h5���ɏ\Z5�eڴi_}��Gߤ{~������k�744����>� �c�I{��(K�Ya�Cr�����&��\'M}0�k�WFJ�f��ko�O	�?-(>T �=�(�W2R�f9$��k�܅�,���0�]�!@aV�����Ya�CBsf�Y�!@s\n��C��,4w!�\0�Ya�CBsf�Y	�P�f9$�\0�](�rH\n��܅f�Y	�P�f9$4w@aV��4w�0�!9(�BsrP�f�]h�¬0�!��\n��,�����Y�!�Z466*��{�¼O���C@/[�b����E�b۶m����rH�zْ%K�_�lٟ��V�q�F[Q�\Z\Z�I�&9$�Z} -H��?��X����������C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@��\"���G+ \0\0\0\0IEND�B`�',1),
('78512f9a-2e06-11eb-84ba-227918fa15ea',1,'out-factory.bpmn','78512f99-2e06-11eb-84ba-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"外出单\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"填单\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"申请人确认\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${skip}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"主管审核\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('78a9fdfb-2e06-11eb-84ba-227918fa15ea',1,'out-factory.out-factory.png','78512f99-2e06-11eb-84ba-227918fa15ea','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0�\0\0\0�@m�\0\0~IDATx���}�Uu�\0�*z\"\"��#ڨ�h%\"\"�6�\"���6zs���4�\'�5��\"{�������6D�u]5g|͔ްYCV7�̜�m}̧1�<{������y�w��/3��;����|�����s��~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��$I�޴iӬ5k����ؘ,^�X�s444$+V���4���9��(�+W�LZZZ��{���;v$˗/ߕ��j9��m)�S������rH�zYL�*��ia�\'��P�!���z��XQ�9�Cb��0@��/ޞl��O�W\r�g��6�Ta�Cr��¼{�dݢ)ɗ��o�-�SP5w9$��*+�[���C�r�}5OA�����0�_�t��9�SP5w9$��*+��?�ia��T�]�!@a���C�@�8�����)����C@�捫�����)����C@���5%�>|����t[ܧ�j�rHUV�#66���S�Y�!�\Z�/�$?��C�S�mq�����!9TQa���mX�J��q�+�i�rH�P������K��\\����<�1�X#0�]�!�Bsw#-#0�Y�!��\ns9#��F`\n��.��Pa��p�r\n��.��Pa�Y(�rH���܅f��9(�\n��;t%I��755տ��;˧M��k	�F�\Z�><���;p�]w�<y򦧟~zf\Z���Yɡ�S[[�W555w�5zV\Z���:�=ilN~�c<N��M}���3�N��o�ĉ�믿��Y�&ٶm[�gϞ$�ז�����?O���s�=���-cǎ���Yɡ�s뭷�}\Z���{���K����xCD��G?������Y�޿R��k�&>�������7�|�ٚ�P���;i�>3m�{��;����^s�h��s�.���;�y������Z�pa2z����2�W�f9$�*MMM��#F�o�Q���&O=�T�dɒ��o�M~�駬&�������U���ӧ\'��v[i��m?H��e�>?~|�aÆ�7lٲ%IwZǌ�������������/6��3gfK��عsg����b�O�s��8�Ĉ=\Z{��Q�x�t�^�{�\n��,��P%�؋�}ҤI�(�p���lI�7�,k�1�[#��F��~��4a�i�Bsr���؋S�<�H����)�\'�|�t�~��X��������\Z{_�?~kmm�j�]h�B���7G�G�؋\r�d�R��bs����xC��פ��7��Z�{f�Yɡ�����w*��)��\Z���*��y�q�[���/�V��]aV�����8o�q0\\_x���ޫ]\\y.�;�S�zj���ͱfTI,i��¬0�!9T�9W�������?��\'5:��/9M�Lݲ��%e�|�ͤ?M�>}m\\��R�\n�O�kjj�VaV����:xI��q�<�L_��bs��nYe�Z�qI�����oI�e^��QbAG{�\n��,���@���k�g�/[��O�t\\����-�L|�������777��ɲ��������\\\n��,���@����ɶ���t��Jv��c�nYe������/�z��D��GU܃�i2�Ya�Crh s(���vo����iq��ޣ[V�x��~�����\\Y!��P̡<��N�Uf�ȑ�{�����\\%#�O���W\\q�ѕ4��z������O\Z�m?��c�L�.9$i>��ȝ��?~o������U�k��\n�@��Κ5+�N���������KN�p�\r�	\'��E<��c�i�=nܸN�w�ܹe�q&�駟�Y��q\nε�^����%_�u��+��2��k�\nȡ�\"΋���y?�x�7����Oڶ͙3\'���v�����J�s�/���>��S�v�g$�v�����!k�mʔ)��h�E��G�-�:��TZ���0�(<\nhw�YQ.w����vZ��g����Ԕ�t�I��r�-m��1cFr�&�֭k�v�y�%�]w�P.��C���E�D�/�/r���o�~_}��ɹ��n[��k��VV���J�{�~G��Cͽ�r�<e{��g��������\n;Ͻ�Q�@4��\'f�7�vt;�{������ʶw6r�?�!���K/e��������/O.�����N�>��dذa�֭[��˗g�ۻ�w�|��٬�,��CḚ�ӄ#�\"�b&h�ڵY#��\'�xb�,H�:�lI(�7o��s�#q;�����39��D^�gX\\|��m�t�9�ćJ%+W��ͽ�r�;e{���������P�gĈ_W��*e��G�h�=�������4jG����rJV�cZ����t4���F#�8��C+��Ǻi�I��z������؁�w�����s�vG�/�Dn_t�EYc�����K������W���^\\�.�����\nuuuu\\���M�4�����-�Y��*���{�ȣwր#bDT�:1\"��.��NG��i�(�H.f\0b[����*k�y�.6�ݻwg�;ꨣ���ʛ���X�x�#���,�A�{wyM;�7���c��=\ZE>�y\\:���c�e�=�ޯ�wϵ�)�w�q�}�ݷ�F�;ӑ�>�����\"��.6�q�wl/6�|[�k��c{4��\Zkj��c�4/�ys�F��=^3n���؋�=�n�]:��0\\s���\Za���w���(�\r�ܑ{������a�9u��,�&L��L�<9�?�Gs/�����¥u��O�$�������c}?��[�4-��u��=ֺ���ߋϿq���5��{����1���ꫯf?>o�1���nyA/m�1��y��l���\ZmX�0WFs���ȓ�f�\"�x���{9��OƎ��ٳ�獯q;���=?�#f�b� \Z{�8=��sɔ)S��{��M��l}~i_}�{:��_�Wk�����̴��nذ�O\Z{SS���5��{�ê���Ҧ��H�t��ۑ�g�}���#���8ʎ����������{�0�AW�������x@a��i��F����h/w�;����1��3,\"�^%{��)��{V��ؑ7���;��=�Q/����zMA]]]mZ�nii�����w�}�6�o�}z�R��#� ����j�gBDa�m�Ӟ/��B��8�.Nk˛{�����[����ŷ5��b��z�;��,\nD����#3����{g#���)m�嬹��\n;��vZ��7�xc��q>��^�������u��p����JF�������cǎ��[#��GcO��j�����#�(��hbZ=��c�њ{4�(��}��t饗�;��u����V�gbM4�r��(�q$s|E����Ǻ}iż����y� ����\n�\06��Fץ��8�����|�(�x�#\'���Ÿ?����^��A��Iw�����z�ݒP��ǎ������b��5��	��W�Q�q�\\q�=b0�k:�#LG�>�����Av;���?�T|$�`���K��e�������:�ԏ���(�;v�h7���U���ˡx����u���ʡ���4v�s4��q����S�1�W����_~99r�o%W��=X�5]��\r�����9}���<��P���|\Zc�5�J�.x4�|Z\\a�Cbh4��^O�;�Xi�}h5���ɏ\Z5�eڴi_}��Gߤ{~������k�744����>� �c�I{��(K�Ya�Cr�����&��\'M}0�k�WFJ�f��ko�O	�?-(>T �=�(�W2R�f9$��k�܅�,���0�]�!@aV�����Ya�CBsf�Y�!@s\n��C��,4w!�\0�Ya�CBsf�Y	�P�f9$�\0�](�rH\n��܅f�Y	�P�f9$4w@aV��4w�0�!9(�BsrP�f�]h�¬0�!��\n��,�����Y�!�Z466*��{�¼O���C@/[�b����E�b۶m����rH�zْ%K�_�lٟ��V�q�F[Q�\Z\Z�I�&9$�Z} -H��?��X����������C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@��\"���G+ \0\0\0\0IEND�B`�',1),
('9c68405e-2d55-11eb-b88c-227918fa15ea',1,'mes-requirement.bpmn','9c68405d-2d55-11eb-b88c-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"mes-requirement\" name=\"MES需求变更\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"填单\" flowable:initiator=\"initiator\" flowable:formKey=\"mes-requirement\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-33868E85-5876-4712-9136-27C22F40C24D\" name=\"填单人确认\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-07BACF0C-406A-4E40-A1FC-00A0BC020C59\" sourceRef=\"startEvent1\" targetRef=\"sid-33868E85-5876-4712-9136-27C22F40C24D\"></sequenceFlow>\n    <userTask id=\"sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\" name=\"提案部门主管\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-9D4E7218-A416-4E13-8129-6902D1CEDBD3\" sourceRef=\"sid-33868E85-5876-4712-9136-27C22F40C24D\" targetRef=\"sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\"></sequenceFlow>\n    <userTask id=\"sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\" name=\"Coordinator\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-3B1C7B5B-E126-4DBE-9960-3332CA8953FC\" sourceRef=\"sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\" targetRef=\"sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\"></sequenceFlow>\n    <userTask id=\"sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\" name=\"DEV TL\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-75B89205-F7AD-4B61-9772-F69F67FC5A4B\" sourceRef=\"sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\" targetRef=\"sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\"></sequenceFlow>\n    <userTask id=\"sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\" name=\"PSM\" flowable:formFieldValidation=\"true\"></userTask>\n    <userTask id=\"sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\" name=\"MESM\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-6F9F2036-70B8-4F2E-AF81-4B54AA19CD43\" sourceRef=\"sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\" targetRef=\"sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\"></sequenceFlow>\n    <userTask id=\"sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\" name=\"PM\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-C4E02C10-B6FB-47DF-8F9F-346B5D75275C\" sourceRef=\"sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\" targetRef=\"sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\"></sequenceFlow>\n    <sequenceFlow id=\"sid-2090AF02-C11C-4993-9CC4-F4D95E4F6C72\" sourceRef=\"sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\" targetRef=\"sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\"></sequenceFlow>\n    <endEvent id=\"sid-4C4E0E45-0E10-40C1-A1A5-B4BC491F8E1E\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-19C22622-BF57-43FF-BE8C-D74EDD41782F\" sourceRef=\"sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\" targetRef=\"sid-4C4E0E45-0E10-40C1-A1A5-B4BC491F8E1E\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_mes-requirement\">\n    <bpmndi:BPMNPlane bpmnElement=\"mes-requirement\" id=\"BPMNPlane_mes-requirement\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-33868E85-5876-4712-9136-27C22F40C24D\" id=\"BPMNShape_sid-33868E85-5876-4712-9136-27C22F40C24D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\" id=\"BPMNShape_sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\" id=\"BPMNShape_sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"465.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\" id=\"BPMNShape_sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"610.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\" id=\"BPMNShape_sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"255.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\" id=\"BPMNShape_sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"255.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\" id=\"BPMNShape_sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"465.0\" y=\"255.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-4C4E0E45-0E10-40C1-A1A5-B4BC491F8E1E\" id=\"BPMNShape_sid-4C4E0E45-0E10-40C1-A1A5-B4BC491F8E1E\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"610.0\" y=\"281.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-07BACF0C-406A-4E40-A1FC-00A0BC020C59\" id=\"BPMNEdge_sid-07BACF0C-406A-4E40-A1FC-00A0BC020C59\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C4E02C10-B6FB-47DF-8F9F-346B5D75275C\" id=\"BPMNEdge_sid-C4E02C10-B6FB-47DF-8F9F-346B5D75275C\">\n        <omgdi:waypoint x=\"419.94999999990824\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"464.9999999999807\" y=\"295.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2090AF02-C11C-4993-9CC4-F4D95E4F6C72\" id=\"BPMNEdge_sid-2090AF02-C11C-4993-9CC4-F4D95E4F6C72\">\n        <omgdi:waypoint x=\"660.0\" y=\"217.95000000000002\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"660.0\" y=\"234.99999999999994\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"225.0\" y=\"234.99999999999994\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"225.0\" y=\"255.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3B1C7B5B-E126-4DBE-9960-3332CA8953FC\" id=\"BPMNEdge_sid-3B1C7B5B-E126-4DBE-9960-3332CA8953FC\">\n        <omgdi:waypoint x=\"419.94999999999067\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"464.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-75B89205-F7AD-4B61-9772-F69F67FC5A4B\" id=\"BPMNEdge_sid-75B89205-F7AD-4B61-9772-F69F67FC5A4B\">\n        <omgdi:waypoint x=\"564.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"609.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9D4E7218-A416-4E13-8129-6902D1CEDBD3\" id=\"BPMNEdge_sid-9D4E7218-A416-4E13-8129-6902D1CEDBD3\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-6F9F2036-70B8-4F2E-AF81-4B54AA19CD43\" id=\"BPMNEdge_sid-6F9F2036-70B8-4F2E-AF81-4B54AA19CD43\">\n        <omgdi:waypoint x=\"274.94999999974334\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"295.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-19C22622-BF57-43FF-BE8C-D74EDD41782F\" id=\"BPMNEdge_sid-19C22622-BF57-43FF-BE8C-D74EDD41782F\">\n        <omgdi:waypoint x=\"564.95\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"295.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('9ca6cfff-2d55-11eb-b88c-227918fa15ea',1,'mes-requirement.mes-requirement.png','9c68405d-2d55-11eb-b88c-227918fa15ea','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0Y\0\0\0�\0\0\0 IDATx�����e��&@�BH$�(s��b��ALCb<D��t����r�b)Ŧ\\l,xAEs�T�MC���p������Z,�C��K�VN�J�Z�;���ә�uwvf��K�twfvv����}��{gf�4\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�IeYv�֭[��_������Sչ����5k��5�R2$C2$C2\r.��k�f����������ݻ�իW��@�Ȑ�!%C2$C���h݀�0���(~�)R2$C2\r,Nu��o���2�dHɐ�4�ط䏽��L��)�!�I0�������\r�̞ﺥ��8.3PtdH�dH�dHi��@W��==٦�fϭ�~@�eq����%C2$C2$CJ��T۟��!N��/7X��dH�dH�dHi��@�k��t�:���K�dH�dH��\Z\rt�6u�TsЉ�&.�!�!R\Zh4���ɐɐ)\r4�nЉg*�\Zt�:���K�dH�dH��\Z\rt����I�A\'�3X��dH�dH�dHi��@�����٦Gz�+�,�3X��dH�dH�dHi��@W��O�sȠ�(:2$C2$C2�4�h�+��-��ǡ�����:���K�dH�dH��\Z\rt靛^\\wg�}cq�wp2qɐɐɐ�@��Ώ�wnY���o�pR�mⶎ�M\\2$C2$C2�4�L�z�#uG��!�!R\Zh4Х\ZΑ�`G��ɐɐ�L�z�N*���K�dH�dH�d�T�:2$C2$C2�4�`�1�Ȑɐ�!%C`�1�Ȑ�!%C2$C`�1�Ȑ�!%C2$C4�,�޷q��9����W/Y���y���9sf��ښutt����|e��7޸���n�7��@+��ɐɐ)\r��m����{n����^{m����,[�~}��ӓ���e!����͞~��,o���~���}�k_{e���Wj��AG�dH�dH��z���Y����߾������w�Ɇ��g��n��w�̙���K/=E�:2$C2$C2�4Гy���e˖��;wn�|��5Εz�l֬Y�&�j�AǠ#C2$CJ���C��U�V=y�5�d/��b6^y�,o��]y����V&.�!�!R\Z�I%V��y�=�c)�o���{���:4���屓!�!R\Z�I!�<Ƕ��Zy��}���ɛ�S5��ĥdH�dH���ٷn��[n�{��ӊ+�͘1�	\r�2q)�!�!��nj<��ƫm������UW]��Y�rt:2$C2�dHi�)V��u�������߬����ɐ)R\Zh��;����Fj֬Y�Z[[On��A[[[g^�6�tdH�dHɐ�@3�x{�_��Y=�q���\r�F��[�G������I��AG�dH��)\r45-Y���x{�zz���_��ȗ7ڠS���t:2$C2�dHi��6o޼;w�k�k׮��{{:�G���ǠcБ!�!%CJʹ�3gf}}}um�����}�>蔏��t�AǠ#C2$CJ����n\"���ʠ�X%CJ��ɐ�	q�W�W��}���j��\r���ӧO?���.��좋.\ZpYGGGv���d�w姮R2�dH�d�:��k��{�������=`��׾��@/]�4���V�&���?�yv�9�d{��->��׳�O?=[�dI���{ٲe����ZN:�x�\\����|����K���w�yuk�|�\Z���8~���jYI�(Wd#��Ժ�E�e�Ї��V���w�=�~������k�O}�Sَ;��վϽ�ޛ�q��d�����\'�|���x���G��&n~�>���qL���/����!\r4Mg�[��*?��7�p<���vq�`S�:\Z�h~���۳�}�s�����[��_�zu1E��/X���<ޒ�����o~S��5kր�g�ƍ���_����{�3�<3۴iS�e��_x�Sy�K�*��~��YwwwQ�/�o�+��Zu�]wes�έz]��QGU4�GqDv�w��k׮�>�����ۥJY��@�� \Z�h�+��\\������#���vڀ�\"�2tx��z�1��Gջ����+�\Z��]u�U�)����i��l�*�-���|������Ƣ��:��w˖-��۵kW1.�\\T�{TV�z\r4����~��~�E��h�ׁ�z�^�A\'\Z��{���NT|�=���&�Z�W�>?�я���_�a��g>SL���կ����SOͶo�^4��3���?b �܆2E&��e(V�ˍo4�1�Tf��@��8��R����k�~b���o����?��b�9�#ns���__�o�o4��~����@�����}��~�_Ȟ}�������w\\�˸Ϗ~���O<!Cc�<��5�7�Ğx�uo�Ǫ��4�\\6��-Ɲ�o��8H��cK�;�y,��mR��?(./�e��㲸��=�_��W*\r4c�[��ֿ\\}���������_j�w\"��t�9���8�G��У���l��ǭh����.\\X|MO�:V���U�T��}�	\'+��LE�Tk�2m�l�c�0�0���e��G-V[��|�g�FGER]yVa��A��xL�YNyK\rt�rϙ3��p�8kR^����u�o��8PKxCU�����+R���K�l۶mſ�x}��(����X�	�����|��A�+7%�\r\'Ə��9����Lw�\Z����â�������w�uqP�V�c|�3�VG�����6���ҙ�t&$>��y�&�|�$Ɱ�%,�W#|i�\'�|�����~�^�7�͛���{������I$*>��XՋ��=�ܚ��Q1(E��ފ+�W1���:\Z�h��\rt4li���[���d(��ؗ�`je �t`�[:���1m�(7P��RGsy���hH��I]k~��\"��Җ�j\Z�������T�\0\'�wĖ����x����+7%������\nw��3T�2n�����h�S���X\\g�ҁ��s:F���P�4БŴ�����<�{����E���Pg=5Ќ�/�˗^w�u�\n���������\r��\r�P+бR����.Vk�����U�t:?�>�[�n��g�}vqy�`�:��j����+~������i��\Zt�\'Cq�3�xi�)H�E����D�����j�>������X勬D��.�W���h�S�PG�2�:5Rӆ���t ���TV��������8~�鉢՚�K��q�`ו��8�Q>Џ�(��p\Z�]�m�����U��8-$��՚���|2�8\rt�S���Y��<湸�{��^1~MƓ�5Ќ�9s�l�\'���o��C�Ϛ�\rt4c�O����\'c��{I��4�D��(\Z��@ǖ�Լ�U��:N��j@�ē�m�]3�O�v��=`�F��xRS[�x�q��9��U��N9�WO���h�S�]���>iG:������S��5Qq����e�Ǿr��5~�-@�D��4��m�	��Y�]W�)I��1\'�0�@W^���o�ێ�I��`�o�?�5N[�x2�`�Ud ����Z��v ���nbOr�0�{��ǥy޸q��{�lkk;�YG�h�cU0=�p��8؉��j{��ʯ���SO��c���\rNl�(�+7��<�My�̱76n/��^���_��Ag�2Tn�cU��_�…6*�Zwt�Wj���szI��@�����1^[8�Z�����)24�Jg���\rKl��F$�K��K���J<�]W�)���i���_�e$\rtzU�x�{\Z���RÜ�J��瓡�xa�b�T:�+ߦ���8��)=��m��ݿ��\'�y#�Voo�6�;v�x,oƶ5�֍z:��zk��\r���Z�Ny�_�a���Ť�L4��N���g�2CyP���}��b���XՉ&*\r41���3o޼�\'�=�i�Z4����P���M��ىF�r���\ri4�*���՛x��h4\"{��}��xv|�AΫp�g������ͻzl2���L4\"q�<m����د��	��8S�V�k]W�A�W������Ƒ6Б�g�`=5��v)+1�\r��k����vp�s�M��K�\r�2t��L������v�\ZhFeƌ�fϞ�w�V�c�9�疖���w3��NE�}y1�ĀMO��B�\Z�*Q4����,&�T���HL���v�r`�,�_��\\�=�ɀ�#���\nvP�q�&����i5\'5>�`���X錆�<��ٳ�X���f�\ZY��=���cY������&;��Dn�v/��B�c�pl�����؆Y���\nt쓎�MsjPʯ\'���+?	(��H�����ON�֬��ēk����K����7��!����nkGGǛ�����~O,�������m#�����2��Xe���o[�\n2��g�\Zy��M���X��\'Ӥ6V�c59���ޏI4�qz5N��7E�̔�T�&\"[�%CJ�S�\'����{Μ9��y�}#y��|\"�/o�7��yϳAǠ#C2$CJ��1�F��h�gΜٻdɒ�{�m===;cOYطo߮W_}��]]]�u�M7=8cƌ��8Ǫs��چAǠ#C2$CJ��q�����mmm���Ҽ^Ϋ/���w{^����\r:�!R2�d:R2�dH�d:�ĥd�c\'C2$C`�Q&.%C2$C2$C��V�!�!R\Zh4���\r:2$C2�dHi���cБ!�!%CJ���cБ!%CJ�dH����L\\J�<v2$C2e�R2$C2$C2\ZheБ!�!�!��F�ݠ#C2$CJ��\Z:�!R2�d:R2�dH�d:�ĥd�c\'C2$C`�Q&.%C2$C2$C��V�!�!R\Zh4���\r:2$C2�dHi���cБ!�!%CJ���cБ!%CJ�dH����L\\J�<v2$C2e�R2$C2$C2�Qww�?�Ʃ�|�9 CJ��ɐA[�f����^�\rP===����2�dHɐ�4��+W^�jժ7^{�}��\'�h=����my]\"CJ��ɐA�˃~A~��!N�ľ%U�����fpdH�dH�d�𫵵U�\0\0`����[\0\0\0\r4\0\0h�\0@\r\0\0\Zh\0\0�@\0��o\0\04�\0\0��\0\0\r4\0\0h�\0@\r\0\0\Zh�\0\0�@\0�\Z���RJ)��eF�\0�\Z\0\04�\0\0��\0\04�\0\0��\0\0\r4\0\0h�\0@\r\0\0\Zh\0\0�,��.�ۡn�\0��o�?�ׁ�\Z薖���\0\0��M�4�OL�>�H�%\0\0�g��Z\rt[[��~C\0\0ph]m/���\0\0P��>d/���\0\00��a~��3\0\0���di����\0\0��^h��\0\00��މ\0��Ȳ�ȭ[�.]�~�����Ygg��suuuek֬�k^2�dH�d��Ť�v�ڬ��7ۿ���ڽ{w�z��7�I�R2�d��Ŋ�I�a&������eHɐ�!��KM\Z�S��u@��)h`��̈́�PW&CJ��L����o�̶n�e�|�-E��q����%C2$C2�����{z�M/̞[q�����:��G�dH�d@]�����I+Վ痛p4?2$C2$C\0\Z�rm~���W\\g���Ȑɐh�K���W\\g���Ȑɐh�M\\&.�!�!\0F7qų�kM\\q�	G�#C2$C2��.Ֆu?�9q�u&͏ɐ���T��l�6=���Ӧ�eq�	G�#C2$C2�������琉+.3٘�dH�dH�\04Е���ٖ����Ӧ�eq�	G�#C2$C2��.��׋��0��.`��!�!\0\r��og;������7kNZ��6q[�@��!�!�)�@��c��%C2$C2��.�pV{[2i~dH�dH�\0�T=�I+�	H�#C2$C20�\Zhe�!�!��e�!�!��0q��dHɐ�!\0��K��)0q)͏�!���3cƌ���\\��ں4�-y��+˫/������]��\0&.�ɐ�)�@���]�Wg^�6�éG��w�\0��K�dH�Ԕi��&��	~hMs�Z{饗��[\0L\\&.�!R���niiimoo��r3<cƌ�;��N�r���/�K����-o��V��ӓ�[�.��;�/}�K�M�^�р���%C2$Cj�6�y�|A��Sn���ެ��7�={����+7��}^�k\0L\\&.�!R������r�<��b�y4�뮿���&�J4`�2qɐɐ�\rt�y.o�X�hQ�6�ъ��/���q��4�&�ɐ��o��湫��|��s���X�^�{\0\r�	��%C2$C��3/UW��<�m�m�(�4�&�ɐ�fo�;SsO\0��w�Uh��e�\ZzB���2$C2$C���x�����X%~���ǥ��W�x���u��V&�J�*;[ZZ>)C2$C2Ԉ:�����n���l<��D�\Z���@+WՉ�TV[	�!�!���-MׯZ�j\\�x���ϲ\\\Zhe�\Zj��_	*O`2$C2$C����-��~�`�x���ϱ]\Zhe�\Z��U^	�S�2$C2$C���������{I�����E�Z5@\rc�h��!�!j������E�ZY���φ����O�~�ɐ��Dg(��\n4��6q5��5��!�!j��\rh�K��x�u�1�d�w^��/�m߾=�;wnv�\'fGuTv��Gg\'�t�!_��K/�m۶m��&�M\\OĻ|U6=����<�����M�\\��čK�<�4s��\n������8��]�.����3�<���*>_�pav��w�W��#�8�h���Ⲹ��<.�@{⪺Z��\r�p�����O/n�j��J�&n\\j汧�3�u�\rt�Du��������D���`|���|$kooϞz�_ן}����]~���9眣���\Z��^�V�&C�dh�ƥf{�9C�N�y3{��D����w\"���^�bE��i��V|>o޼�Ecr����i�%K�d�w\\q�)��R|>��I�@�q�Vc�dȕMܸ��cO�g(^:5��7;�����Zh�~�a����uww�_����}�^�ؗ�.[���w˖-\Z�)�@�qO�WnӘ������y�\r�ũ��U�~2a�_{{�{�7r��A���\'�hh�.]Z��K��ر���\'�|���i����ث�P�[y��kr6��y�k�`2�J�&n\\j汧�3������Ο?�^�.^���{���<Ծ~@�\rQe�p�	ق���9s��������o���x���\Z�)�@����+�D8r%C7.5��3I\Z��ڝ\Z�E�v�s���=�mkk;U�\0\Z覜��	:�{l�G5N�F��k׮C�nӦM���z�4�C=��j쁞����h��m�\rthiiiMO(L+ѣ��_W��l��|�70�!%CJ���=��DǞ��r��1�Wۈ\'��<G���\r���e�!�!5�\Z��מr�t�Nt��J�.���M#�a0�$��?�qv�W�[���V�3u����%C2$Cj�6�W�O.���(k�=π���%C2$CjJ4ХF�����4α���6\0��K�dH�Ԕk��x�¼��6o����r^}���w{^���� `�2qɐɐ�@��L\\2�dH���Ki~�)0q)͏�!�!\0\r�2qɐɐh���K�dH��\Z��e�!�!��0q��dHɐ�!\0���(R2`�R�%C2$C\0\Zhe�!�!�@+�ɐ)\r4����%C2$CJ\r`�2qɐ�!%C\0&.��Q2�d�ĥ4?J�dH�\04���%C2$C2��V&.�!R\Zh\0��K�dH��\Z��e�!%CJ�\0L\\J�dH�@����6a4N���R2�d���Y�fgoo�I������ĵY��)h`+W��hժUo���k�L���VWW׶�.�!%CJ�\0\Z\\>X^��ٹ!N���7U�����f��dH�dH�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����s�w�ְ,\0\0\0\0IEND�B`�',1),
('9f32daab-2e0b-11eb-b42b-227918fa15ea',1,'out-factory.bpmn','9f32daaa-2e0b-11eb-b42b-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"外出单\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"填单\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"申请人确认\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${skip}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"主管审核\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('9fcde22c-2e0b-11eb-b42b-227918fa15ea',1,'out-factory.out-factory.png','9f32daaa-2e0b-11eb-b42b-227918fa15ea','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0�\0\0\0�@m�\0\0~IDATx���}�Uu�\0�*z\"\"��#ڨ�h%\"\"�6�\"���6zs���4�\'�5��\"{�������6D�u]5g|͔ްYCV7�̜�m}̧1�<{������y�w��/3��;����|�����s��~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��$I�޴iӬ5k����ؘ,^�X�s444$+V���4���9��(�+W�LZZZ��{���;v$˗/ߕ��j9��m)�S������rH�zYL�*��ia�\'��P�!���z��XQ�9�Cb��0@��/ޞl��O�W\r�g��6�Ta�Cr��¼{�dݢ)ɗ��o�-�SP5w9$��*+�[���C�r�}5OA�����0�_�t��9�SP5w9$��*+��?�ia��T�]�!@a���C�@�8�����)����C@�捫�����)����C@���5%�>|����t[ܧ�j�rHUV�#66���S�Y�!�\Z�/�$?��C�S�mq�����!9TQa���mX�J��q�+�i�rH�P������K��\\����<�1�X#0�]�!�Bsw#-#0�Y�!��\ns9#��F`\n��.��Pa��p�r\n��.��Pa�Y(�rH���܅f��9(�\n��;t%I��755տ��;˧M��k	�F�\Z�><���;p�]w�<y򦧟~zf\Z���Yɡ�S[[�W555w�5zV\Z���:�=ilN~�c<N��M}���3�N��o�ĉ�믿��Y�&ٶm[�gϞ$�ז�����?O���s�=���-cǎ���Yɡ�s뭷�}\Z���{���K����xCD��G?������Y�޿R��k�&>�������7�|�ٚ�P���;i�>3m�{��;����^s�h��s�.���;�y������Z�pa2z����2�W�f9$�*MMM��#F�o�Q���&O=�T�dɒ��o�M~�駬&�������U���ӧ\'��v[i��m?H��e�>?~|�aÆ�7lٲ%IwZǌ�������������/6��3gfK��عsg����b�O�s��8�Ĉ=\Z{��Q�x�t�^�{�\n��,��P%�؋�}ҤI�(�p���lI�7�,k�1�[#��F��~��4a�i�Bsr���؋S�<�H����)�\'�|�t�~��X��������\Z{_�?~kmm�j�]h�B���7G�G�؋\r�d�R��bs����xC��פ��7��Z�{f�Yɡ�����w*��)��\Z���*��y�q�[���/�V��]aV�����8o�q0\\_x���ޫ]\\y.�;�S�zj���ͱfTI,i��¬0�!9T�9W�������?��\'5:��/9M�Lݲ��%e�|�ͤ?M�>}m\\��R�\n�O�kjj�VaV����:xI��q�<�L_��bs��nYe�Z�qI�����oI�e^��QbAG{�\n��,���@���k�g�/[��O�t\\����-�L|�������777��ɲ��������\\\n��,���@����ɶ���t��Jv��c�nYe������/�z��D��GU܃�i2�Ya�Crh s(���vo����iq��ޣ[V�x��~�����\\Y!��P̡<��N�Uf�ȑ�{�����\\%#�O���W\\q�ѕ4��z������O\Z�m?��c�L�.9$i>��ȝ��?~o������U�k��\n�@��Κ5+�N���������KN�p�\r�	\'��E<��c�i�=nܸN�w�ܹe�q&�駟�Y��q\nε�^����%_�u��+��2��k�\nȡ�\"΋���y?�x�7����Oڶ͙3\'���v�����J�s�/���>��S�v�g$�v�����!k�mʔ)��h�E��G�-�:��TZ���0�(<\nhw�YQ.w����vZ��g����Ԕ�t�I��r�-m��1cFr�&�֭k�v�y�%�]w�P.��C���E�D�/�/r���o�~_}��ɹ��n[��k��VV���J�{�~G��Cͽ�r�<e{��g��������\n;Ͻ�Q�@4��\'f�7�vt;�{������ʶw6r�?�!���K/e��������/O.�����N�>��dذa�֭[��˗g�ۻ�w�|��٬�,��CḚ�ӄ#�\"�b&h�ڵY#��\'�xb�,H�:�lI(�7o��s�#q;�����39��D^�gX\\|��m�t�9�ćJ%+W��ͽ�r�;e{���������P�gĈ_W��*e��G�h�=�������4jG����rJV�cZ����t4���F#�8��C+��Ǻi�I��z������؁�w�����s�vG�/�Dn_t�EYc�����K������W���^\\�.�����\nuuuu\\���M�4�����-�Y��*���{�ȣwր#bDT�:1\"��.��NG��i�(�H.f\0b[����*k�y�.6�ݻwg�;ꨣ���ʛ���X�x�#���,�A�{wyM;�7���c��=\ZE>�y\\:���c�e�=�ޯ�wϵ�)�w�q�}�ݷ�F�;ӑ�>�����\"��.6�q�wl/6�|[�k��c{4��\Zkj��c�4/�ys�F��=^3n���؋�=�n�]:��0\\s���\Za���w���(�\r�ܑ{������a�9u��,�&L��L�<9�?�Gs/�����¥u��O�$�������c}?��[�4-��u��=ֺ���ߋϿq���5��{����1���ꫯf?>o�1���nyA/m�1��y��l���\ZmX�0WFs���ȓ�f�\"�x���{9��OƎ��ٳ�獯q;���=?�#f�b� \Z{�8=��sɔ)S��{��M��l}~i_}�{:��_�Wk�����̴��nذ�O\Z{SS���5��{�ê���Ҧ��H�t��ۑ�g�}���#���8ʎ����������{�0�AW�������x@a��i��F����h/w�;����1��3,\"�^%{��)��{V��ؑ7���;��=�Q/����zMA]]]mZ�nii�����w�}�6�o�}z�R��#� ����j�gBDa�m�Ӟ/��B��8�.Nk˛{�����[����ŷ5��b��z�;��,\nD����#3����{g#���)m�嬹��\n;��vZ��7�xc��q>��^�������u��p����JF�������cǎ��[#��GcO��j�����#�(��hbZ=��c�њ{4�(��}��t饗�;��u����V�gbM4�r��(�q$s|E����Ǻ}iż����y� ����\n�\06��Fץ��8�����|�(�x�#\'���Ÿ?����^��A��Iw�����z�ݒP��ǎ������b��5��	��W�Q�q�\\q�=b0�k:�#LG�>�����Av;���?�T|$�`���K��e�������:�ԏ���(�;v�h7���U���ˡx����u���ʡ���4v�s4��q����S�1�W����_~99r�o%W��=X�5]��\r�����9}���<��P���|\Zc�5�J�.x4�|Z\\a�Cbh4��^O�;�Xi�}h5���ɏ\Z5�eڴi_}��Gߤ{~������k�744����>� �c�I{��(K�Ya�Cr�����&��\'M}0�k�WFJ�f��ko�O	�?-(>T �=�(�W2R�f9$��k�܅�,���0�]�!@aV�����Ya�CBsf�Y�!@s\n��C��,4w!�\0�Ya�CBsf�Y	�P�f9$�\0�](�rH\n��܅f�Y	�P�f9$4w@aV��4w�0�!9(�BsrP�f�]h�¬0�!��\n��,�����Y�!�Z466*��{�¼O���C@/[�b����E�b۶m����rH�zْ%K�_�lٟ��V�q�F[Q�\Z\Z�I�&9$�Z} -H��?��X����������C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@��\"���G+ \0\0\0\0IEND�B`�',1),
('a63745e5-2e00-11eb-8699-227918fa15ea',1,'out-factory.bpmn','a63745e4-2e00-11eb-8699-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"外出单\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"填单\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"申请人确认\" flowable:assignee=\"${INITIATOR}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${skip==true}\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"主管审核\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('a68ae426-2e00-11eb-8699-227918fa15ea',1,'out-factory.out-factory.png','a63745e4-2e00-11eb-8699-227918fa15ea','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0�\0\0\0�@m�\0\0~IDATx���}�Uu�\0�*z\"\"��#ڨ�h%\"\"�6�\"���6zs���4�\'�5��\"{�������6D�u]5g|͔ްYCV7�̜�m}̧1�<{������y�w��/3��;����|�����s��~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��$I�޴iӬ5k����ؘ,^�X�s444$+V���4���9��(�+W�LZZZ��{���;v$˗/ߕ��j9��m)�S������rH�zYL�*��ia�\'��P�!���z��XQ�9�Cb��0@��/ޞl��O�W\r�g��6�Ta�Cr��¼{�dݢ)ɗ��o�-�SP5w9$��*+�[���C�r�}5OA�����0�_�t��9�SP5w9$��*+��?�ia��T�]�!@a���C�@�8�����)����C@�捫�����)����C@���5%�>|����t[ܧ�j�rHUV�#66���S�Y�!�\Z�/�$?��C�S�mq�����!9TQa���mX�J��q�+�i�rH�P������K��\\����<�1�X#0�]�!�Bsw#-#0�Y�!��\ns9#��F`\n��.��Pa��p�r\n��.��Pa�Y(�rH���܅f��9(�\n��;t%I��755տ��;˧M��k	�F�\Z�><���;p�]w�<y򦧟~zf\Z���Yɡ�S[[�W555w�5zV\Z���:�=ilN~�c<N��M}���3�N��o�ĉ�믿��Y�&ٶm[�gϞ$�ז�����?O���s�=���-cǎ���Yɡ�s뭷�}\Z���{���K����xCD��G?������Y�޿R��k�&>�������7�|�ٚ�P���;i�>3m�{��;����^s�h��s�.���;�y������Z�pa2z����2�W�f9$�*MMM��#F�o�Q���&O=�T�dɒ��o�M~�駬&�������U���ӧ\'��v[i��m?H��e�>?~|�aÆ�7lٲ%IwZǌ�������������/6��3gfK��عsg����b�O�s��8�Ĉ=\Z{��Q�x�t�^�{�\n��,��P%�؋�}ҤI�(�p���lI�7�,k�1�[#��F��~��4a�i�Bsr���؋S�<�H����)�\'�|�t�~��X��������\Z{_�?~kmm�j�]h�B���7G�G�؋\r�d�R��bs����xC��פ��7��Z�{f�Yɡ�����w*��)��\Z���*��y�q�[���/�V��]aV�����8o�q0\\_x���ޫ]\\y.�;�S�zj���ͱfTI,i��¬0�!9T�9W�������?��\'5:��/9M�Lݲ��%e�|�ͤ?M�>}m\\��R�\n�O�kjj�VaV����:xI��q�<�L_��bs��nYe�Z�qI�����oI�e^��QbAG{�\n��,���@���k�g�/[��O�t\\����-�L|�������777��ɲ��������\\\n��,���@����ɶ���t��Jv��c�nYe������/�z��D��GU܃�i2�Ya�Crh s(���vo����iq��ޣ[V�x��~�����\\Y!��P̡<��N�Uf�ȑ�{�����\\%#�O���W\\q�ѕ4��z������O\Z�m?��c�L�.9$i>��ȝ��?~o������U�k��\n�@��Κ5+�N���������KN�p�\r�	\'��E<��c�i�=nܸN�w�ܹe�q&�駟�Y��q\nε�^����%_�u��+��2��k�\nȡ�\"΋���y?�x�7����Oڶ͙3\'���v�����J�s�/���>��S�v�g$�v�����!k�mʔ)��h�E��G�-�:��TZ���0�(<\nhw�YQ.w����vZ��g����Ԕ�t�I��r�-m��1cFr�&�֭k�v�y�%�]w�P.��C���E�D�/�/r���o�~_}��ɹ��n[��k��VV���J�{�~G��Cͽ�r�<e{��g��������\n;Ͻ�Q�@4��\'f�7�vt;�{������ʶw6r�?�!���K/e��������/O.�����N�>��dذa�֭[��˗g�ۻ�w�|��٬�,��CḚ�ӄ#�\"�b&h�ڵY#��\'�xb�,H�:�lI(�7o��s�#q;�����39��D^�gX\\|��m�t�9�ćJ%+W��ͽ�r�;e{���������P�gĈ_W��*e��G�h�=�������4jG����rJV�cZ����t4���F#�8��C+��Ǻi�I��z������؁�w�����s�vG�/�Dn_t�EYc�����K������W���^\\�.�����\nuuuu\\���M�4�����-�Y��*���{�ȣwր#bDT�:1\"��.��NG��i�(�H.f\0b[����*k�y�.6�ݻwg�;ꨣ���ʛ���X�x�#���,�A�{wyM;�7���c��=\ZE>�y\\:���c�e�=�ޯ�wϵ�)�w�q�}�ݷ�F�;ӑ�>�����\"��.6�q�wl/6�|[�k��c{4��\Zkj��c�4/�ys�F��=^3n���؋�=�n�]:��0\\s���\Za���w���(�\r�ܑ{������a�9u��,�&L��L�<9�?�Gs/�����¥u��O�$�������c}?��[�4-��u��=ֺ���ߋϿq���5��{����1���ꫯf?>o�1���nyA/m�1��y��l���\ZmX�0WFs���ȓ�f�\"�x���{9��OƎ��ٳ�獯q;���=?�#f�b� \Z{�8=��sɔ)S��{��M��l}~i_}�{:��_�Wk�����̴��nذ�O\Z{SS���5��{�ê���Ҧ��H�t��ۑ�g�}���#���8ʎ����������{�0�AW�������x@a��i��F����h/w�;����1��3,\"�^%{��)��{V��ؑ7���;��=�Q/����zMA]]]mZ�nii�����w�}�6�o�}z�R��#� ����j�gBDa�m�Ӟ/��B��8�.Nk˛{�����[����ŷ5��b��z�;��,\nD����#3����{g#���)m�嬹��\n;��vZ��7�xc��q>��^�������u��p����JF�������cǎ��[#��GcO��j�����#�(��hbZ=��c�њ{4�(��}��t饗�;��u����V�gbM4�r��(�q$s|E����Ǻ}iż����y� ����\n�\06��Fץ��8�����|�(�x�#\'���Ÿ?����^��A��Iw�����z�ݒP��ǎ������b��5��	��W�Q�q�\\q�=b0�k:�#LG�>�����Av;���?�T|$�`���K��e�������:�ԏ���(�;v�h7���U���ˡx����u���ʡ���4v�s4��q����S�1�W����_~99r�o%W��=X�5]��\r�����9}���<��P���|\Zc�5�J�.x4�|Z\\a�Cbh4��^O�;�Xi�}h5���ɏ\Z5�eڴi_}��Gߤ{~������k�744����>� �c�I{��(K�Ya�Cr�����&��\'M}0�k�WFJ�f��ko�O	�?-(>T �=�(�W2R�f9$��k�܅�,���0�]�!@aV�����Ya�CBsf�Y�!@s\n��C��,4w!�\0�Ya�CBsf�Y	�P�f9$�\0�](�rH\n��܅f�Y	�P�f9$4w@aV��4w�0�!9(�BsrP�f�]h�¬0�!��\n��,�����Y�!�Z466*��{�¼O���C@/[�b����E�b۶m����rH�zْ%K�_�lٟ��V�q�F[Q�\Z\Z�I�&9$�Z} -H��?��X����������C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@��\"���G+ \0\0\0\0IEND�B`�',1),
('a83f9aa0-2d56-11eb-b88c-227918fa15ea',1,'liaison.bpmn','a83f9a9f-2d56-11eb-b88c-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"liaison\" name=\"联络单\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"填单\" flowable:initiator=\"initiator\" flowable:formKey=\"liaison\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\" name=\"填单人确认\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-8837ACC1-9927-4EF2-AB27-6113B895B400\" sourceRef=\"startEvent1\" targetRef=\"sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\"></sequenceFlow>\n    <userTask id=\"sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\" name=\"审核中\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-7BA30D19-708A-4A69-A05E-3B5FC38E05C5\" sourceRef=\"sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\" targetRef=\"sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\"></sequenceFlow>\n    <endEvent id=\"sid-7387C76A-E91A-40AA-A84A-11C8155AD7C0\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-0255207B-6BE7-449E-8B53-6D87AF68964A\" sourceRef=\"sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\" targetRef=\"sid-7387C76A-E91A-40AA-A84A-11C8155AD7C0\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_liaison\">\n    <bpmndi:BPMNPlane bpmnElement=\"liaison\" id=\"BPMNPlane_liaison\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\" id=\"BPMNShape_sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\" id=\"BPMNShape_sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-7387C76A-E91A-40AA-A84A-11C8155AD7C0\" id=\"BPMNShape_sid-7387C76A-E91A-40AA-A84A-11C8155AD7C0\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7BA30D19-708A-4A69-A05E-3B5FC38E05C5\" id=\"BPMNEdge_sid-7BA30D19-708A-4A69-A05E-3B5FC38E05C5\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8837ACC1-9927-4EF2-AB27-6113B895B400\" id=\"BPMNEdge_sid-8837ACC1-9927-4EF2-AB27-6113B895B400\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-0255207B-6BE7-449E-8B53-6D87AF68964A\" id=\"BPMNEdge_sid-0255207B-6BE7-449E-8B53-6D87AF68964A\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('a866aaa1-2d56-11eb-b88c-227918fa15ea',1,'liaison.liaison.png','a83f9a9f-2d56-11eb-b88c-227918fa15ea','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0�\0\0\0�@m�\0\0IDATx���}�V��\0�݈����6*6Z������ \"��F/cΔ2���ffTkbe�����VD���\rs]W�_�+�a���nj�9��z�ۘi�=߃g�8Ό�8��sf>�2�<�}����~�����\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�$��6l��jժ�\Z�E��\nGCCC�|���I�N���C@/���bŊ���%ٽ{��ضm[�lٲi��I���C@/�ٖ�\\5�yw:[+��`�!���2��X=��=rH�zY�S��0\'rH���0���[�\r��1���,��xN1U��JX�wnߒ�Y89�r��D<�T�]�!�d�y�W�vPQ�㻯�*����C@�\n��%OuZ�c�����!9��0�Y�H��9�)����C��,4w9$���,�qdsg�9�)����C@�\n�����ia�m\n��.��P���㖦d͇S^NM��m\n��.��P�����xN1U���X��%Y��?���>�T�]�!�D�9��n�˝�/�m�0���!9��0�����\'���;-�y�k�f`���C@��Cʹ��f9$�����̴���)����C@���<X�]�!��\n�P��4w��9(�BsrP�f9$4w�J�$�ojj\Z���o/�6mڎq���1bD2t�Ф��n�]wݵ{ҤI�z�w���](�rH����ڿ����;��3�X��Ψ�i�Jcc�mv�qb�N��M}֬Y3�N��g����k����Z�*ٲeK�k׮$�ǖ�����?O���s�=����M�F�\Z���Yɡʹ��[�>�Ei���̻K����x�D�����_����q�ݻ7�իW\'>���ѣG������܅�,��P�I��i�^p\r��X1��5�֏�3g��;�3�;w�a5��,X���׷�Y�¬0�!9Tmjjj�6������6y��\'�ŋ\'�~�m��O?e5���V^W�\\�L�>=����7��f���/]����c�&�֭KzæM��t��:r���܅�.��P�6�?��xo�����;ٮ��ؾ}{����b�O��Hq\0�{4��&Fw��Kg�*�\n��C�4c/6�	&d������]��\Z��@��K�5c�h��oOf��.4w!��l{q)~ʔ)mK�=K�O<�D�%�!�c�����c��}�}i޼y�����܅�.�Pϥ���8c?��^l��f�+t��={����믿&}m̘1�e]�Q�f9$��[��V���ӥ������-ϗx����n���_�.��]aV�����(o�q0\\_x�����.�<��)o�����9�U�K\Z�0+�rHUs����bv��?�I����۝&w�nY2qI�7�x#���ӧ��KV��Aa�iQMM��*�\n��C՘C�/)���駟��:]l�u˒�k��%e+��?ޔ&��j��*���F�\n��,��P���k�gۗ.]ڧu:.tS�]��%7�ٺukE�{sssK�,�����m]��R�f9$��3���&{���k/�dW�=6�%ww�oS)����D��GUA�2�¬0�!9ԟ9�Fk���N�괸��ޥ[�L�q��op�/�0WW�!1s(�J�iݲd����3�������?�k7_q�GWbI��[nI��������K���\Z��������9T�/��;];v��J�s���������P�+��4o�3gΌ��a�k�׿���ɥ�^��ܹ3{�Ŝw�yɴi�:����3gN�~�8����O�����g]{����믿n{��+���`��s��PO��_NN8����h{\\���SO=�3�8#ٱc�!�->j�G�C���m�\'O^_��.\\�Uz�����O�r��{��DÎ6lXr��W�=��t��e˖e�3/�\'N��e�;���n��?��m���$�����N:���Ō3�/�0Y�fM�s1����sa���n��ꫝ ��k�܏=��_;ͽos���t�3�<�F��s�2eʼ*;Ͻ�YV%s4��H��1�:�c�B\Z�Ƕ���wY`����_|1��ѿ%���_�\\r�%�[o���}��ɐ!C�͛7g������\'�|�A�Ia���Isoll�\"n��c�\\��c%&ϫ��<^|��m�p�9��M��+Vt��T�ji�e�!��m?��_�}�ݿU�\nu�����e��Q_�h�]tQr�d�G�gMy�-6��}˖�}��l��ɓ���Ǐﴹ�J@�6�a�o��SN9%+�|�Ir�q�u:��~�F~���\'��K�Vys�(6�\"߽��9����\'K�,i����L=r3�$f��8>��x^sﹸB]Z;�T�\nuuuu�\\���&L��ߕ����)뵊+y@]҈�	G��1s����~�e�u:�ϗXc���n���e�E!�ꪫ�\"��bs��񺣎:��8\0����{7�k4�x��c~<E�ܣ�Ǡ-�����s�= �bp�ǀ�?����|<��ז���㎛��=��oOg�_�+\\����f�/��BV�gϞ}@a~�W:l�o��f��h��1����Rk^����:�%�3�W�����[^��g)�c��\n����cp\rz�ԩY^�7.�4iR[nj�i�}~W��N�sW�b���M}}?�ؿ��C���=\n_o��ׯ_�}��u���Yg��}���51(���|��c?X�\r�}s��ٍ7f��8\0/��ǁu\ns�7�8�1VYf͚����1��ysϏÈU�8�3\Z{�y��g�]A�u1�,6s���|������{:��[����^���rfZ�[׭[�\'����iN�3����!e�?�Ds?�����j���u��=�x��g�}���3���8ˎ���in����P3�0�����,/?\"��P���=Va��#���ȟ�6�r\"��W�^��-o��ww�\r>\Z{:P/�g�Y�zMA]]]mZ�nii�����w�}�6�oʾ�ӗ�9fC�$c��uVpcf��;��x]�	M9�� ��>{]D����=�ژ�Ŭ X����(����m�>�4�cv�����|��0�{�{�S�b�v�i�e9u�7f\r>v9�rjjj����3��.��׵��[�hjkk�G�\Z���f�1c�ƞ&�e���������O����Eь��c�l��ǌ�=�2��G�}����u�W��.tS<��3���XVϗ�c��5��Q�������u4��o��E3hnnn��qV������J�{���+A��+>�|�z1�֤�l��C�K\'V�b`�Q~���s[s����b��}�q�]��u���8x���=b �k:���|��_�� ���=��c)>p ���K�Fᎂ�m۶��;����,�\\~��u\Zۋ�9�|���Yy�d+kq�����K����kwU���^��>�t4�8z���t��z8籧\r�tp�i�1���(�\n��C�Z�����0V��>���M��G��2mڴ�>��oґ���f3q��V|CCÿ?��#���H��\r��,f�Yɡj�������i��^�Mqe�4i�￶�ƸKP~����@\\{8.Q8��d�0+�rH�נ��Y�!@a���C�¬0�!��\n��,���(�\n��C��.f9$�\0�Yh�B\n��,���(�\n��;�0+�rH��P��f��9(�\n��;�0+�rHh�¬0�!9h�Ba�CrP���.��0+̚����Ya�CBsf�Y�!@s\n��C@Y466*����¼G���C@/[�|�֖�E�\nb˖-���rH�z��ŋ�_�t���Vű�f[Q�\Z\Z�I�&9$[} -HG���r^���_[�,��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P���j���H\0\0\0\0IEND�B`�',1),
('be835939-2d29-11eb-b92b-227918fa15ea',1,'send-email.bpmn','be835938-2d29-11eb-b92b-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"send-email\" name=\"发送邮件\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"start\" flowable:initiator=\"initiator\" flowable:formFieldValidation=\"true\"></startEvent>\n    <sequenceFlow id=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" sourceRef=\"startEvent1\" targetRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\"></sequenceFlow>\n    <endEvent id=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" name=\"end\"></endEvent>\n    <sequenceFlow id=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" sourceRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" targetRef=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\"></sequenceFlow>\n    <serviceTask id=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" name=\"SendEmail\" flowable:type=\"mail\">\n      <extensionElements>\n        <flowable:field name=\"to\">\n          <flowable:expression><![CDATA[${emailTo}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"from\">\n          <flowable:expression><![CDATA[${emailFrom}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"subject\">\n          <flowable:expression><![CDATA[${emailSubject}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"cc\">\n          <flowable:expression><![CDATA[${emailCC}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"text\">\n          <flowable:expression><![CDATA[${emailContent}]]></flowable:expression>\n        </flowable:field>\n      </extensionElements>\n    </serviceTask>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_send-email\">\n    <bpmndi:BPMNPlane bpmnElement=\"send-email\" id=\"BPMNPlane_send-email\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" id=\"BPMNShape_sid-E4D02A62-9237-4DB5-88D6-388754AE1687\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" id=\"BPMNShape_sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"165.0\" y=\"135.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" id=\"BPMNEdge_sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\">\n        <omgdi:waypoint x=\"129.94340692927761\" y=\"177.55019845363262\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"164.99999999999906\" y=\"176.4985\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" id=\"BPMNEdge_sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\">\n        <omgdi:waypoint x=\"264.9499999999882\" y=\"175.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"292.5\" y=\"175.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"292.5\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('beebb7fa-2d29-11eb-b92b-227918fa15ea',1,'send-email.send-email.png','be835938-2d29-11eb-b92b-227918fa15ea','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0f\0\0\0�\0\0\0���\0\0\r\0IDATx���}lUe�p5j�u��&��d7Y�0�db�NFc�?��D��E���\"�2A�{D����ĸ�a_�\"a�����(:�qGGD^�)T�3��lo�z-x�=�����r_z��������9���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��e�16lxa����,_�<[�l��q���f+W��,U�=8*B���=����zzz����۳�^{mg\n�+�0��HY(�M8���z{%�rѾ��S)���+a���@��`�� ���m_|�M��6��/H3P�`޷�\'�|Ww���;��9��rO���n�*��\"�9By�_�Б��O��?m����w��9���~�%�����%�v~%�3PX0�sO�o�w�����g�e�?�%\\3Pd+��[�����`�@���R��xn]�?ol�>��2��ϕ��x�V�*����9f\\�ɽ�rq�v�\\y�9��l\r����*b�\\�]<�߶V0�Y0ZZ��a0��ɿΪO�Ŷ�U0������[�`��X`���\r�_=�._�-\\3PP0��ޗ�Ǌ�v��5��W����%�1�9�eG�?���l�}�U0E�2\"�;w|��1�bW�P�@-��e?3P���3 �3 ��`�̀`̀`V�̂F�,ˎ���hy�g^�={�ΩS��0aBv��Wg���o��ƞY�fmx����g���kjj���������B�R�c-��T���O��c;�4J��_��{�w�-�ܒ=����ի��[�f{���B�vuueo��v��;����z�����I�Y	��]s�5�L�,UOoWS��훥�(�x�}�ݷoƌy�8p ��ڵk��3ghiiY?v���J0Z\n׳S�.@�W���X��G��,X�`�\r7ܐ-\\�p@�\\iɒ%�ĉ��}�,��Pihh������mjj�x��lŊ٦M��]�v��Ӟ={�w��V���̙��7�2�w=��Pnkk{sʔ)��￟\r��7f)�\'M����Y	�o��/R�(�s���j�ر#�>��<��Ϝ$�F�)G(W�cT+~^\Z5��`�C1R.�iӦ��#�-Ǌp6r)=�h_�H�����^�#�0c�\Z��=���ŝw��׮8R�����+�\Zc$��na�=��DO�H�-�No�~+��h�ʭ�#�\Z���\\1rn�n������;��~���Y�&O��Yoo��`���W�S>�����\Z�=g-�a<Z�y�1%�֭[�S�Q�رc�>혷��	f�\\G����q����3j�bE_���!��j�ĉ��g+��;fCCÎT3�q�`�En��n�X�W:����?����+fkTL�;[�\r3����\'��jiΜ9kcIi�#�U�����>G0��������K��.�η{衇�>�����n��k_�2�Zz�76��ea���Jϼ���U?p܀��}mq���������\n=�bJ�߲P�\r3qA�m۶�4�;;;��βy������э`�#���o]\n�����I�J�B����,醙�J\\�D��/Z�\\r�qMMM3nܸ��g�Z��666�$=�iڡ�_g�{\'�O�_�jjz<#N��E�X�}\"m�L�}��\n\\�����?����㎋`���:��s���;/�_��I�\\>H�]z<XS�7u���\'�ao��<X�a��ڙ��T�zGH�&ժT�S���Ϧz:�7B8�C���<==����vm�m(���O�%m7%��]�8̛7o�e��駟�{�y��y晅sܯ���wL�4)���CQ�0��\Zjh���k=b����ūx���wΘ��H����ɿ��??�;�#{ꩧ���`>�s������7��`�A���ĸ�⋏)���3�7eʔ�Z��?��?ר��Qٌ��R �m�̥�<묳����l͚5��q��u�O:�|��.�({���5�}��G��O>9;��S��{.۲eK�]�������2�ӻ�~���K/����f���g���x���O?ݷ�\\��p�	������o�M���`��m���N\Z�}P�YK�.}�F�2֧�c���0�\"��N������G�/.(=��ݸ_�Í�<yr6k֬�~�hsss~?Z\nӧO�N��P���w��w�ݏ�4��h��~��ŋ󊰎��3F0W̿�6Zy ����=���O�zs\n�E��[y�r��9*���/���1�H�2D#��C0�LQ���F�1�.=�_0W�L�^�q�����1J��1���o���wFȕ�c�j��~�?�t�M��p����v��zZ�Tt0G��t��7��C-���l���}U��K��\Z�|���keTn���bT��}���wD(W��󑉕1�+��8���M���Z]+c�ҥs�m�~��|�i��m������v�e���c�b�{��Q�_���b���8�v�\'��\r��(>�E�Z�y�VU�����v�m�k0jޑF���]u�Uy[ F���rJΝ���H���/�G�qB��_>\\0wtt�=��>fy���}�/�7���������¯.�����.7B���(�z��ώW����Fb0+�\\я~���1�ց��r�k|g9;>8��O0I#��wl�	&J0�W>�^�\'��	&#PsssS\Z9����Ko�_Oo�>��J0����@�D�`|�_�HYc�ijj��:X#�)G(�5����,����\'��s�S�cVE��/�D_yO�w��LI6B_���y�K/���8!��G��h_�X��^�,���X�K�kt�s�E(1\Z.�9�]+�b��c�=��?���Ն���Xc�`�xyKKK�;��=�yʯ��ʼ�o�ɇ���̂y����itGX�zʣk��2z	]�g���믿�qz��V��Q\\�(�}�������kqz��;I�r�3Y0�˱������Xc�{��ye��������@�m�����s8�2̂ٱ�Y	f@0f@0+�f�f%��,���3 ����@̀`V�̂�J0�Y0�Y	f@0f@0+�f�f�(����|�r�X?�7�~{%�r+W�����%렶n��l\n���J�V�Xqy[[ۗ�~�i�p��r�rkk�ǩ��WG�0�E\Z��o��ǩj^��}�P\0\0\0\0\0\0\0\0\0\0\0�!�W[� 7%\0\0\0\0IEND�B`�',1),
('ce86aff4-2d57-11eb-b88c-227918fa15ea',1,'vendor-code-request-form.bpmn','ce86aff3-2d57-11eb-b88c-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"vendor-code-request-form\" name=\"FI廠商代碼申請單\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" flowable:initiator=\"initiator\" flowable:formKey=\"vendor-code-request-form\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-E3CDDACB-2B12-4398-966D-C78588092BD6\" sourceRef=\"startEvent1\" targetRef=\"sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\"></sequenceFlow>\n    <endEvent id=\"sid-860C90D4-77B6-4336-A684-FBD28C95B009\"></endEvent>\n    <sequenceFlow id=\"sid-61149916-1C68-428E-987A-8C94F5454F96\" sourceRef=\"sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\" targetRef=\"sid-860C90D4-77B6-4336-A684-FBD28C95B009\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_vendor-code-request-form\">\n    <bpmndi:BPMNPlane bpmnElement=\"vendor-code-request-form\" id=\"BPMNPlane_vendor-code-request-form\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\" id=\"BPMNShape_sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-860C90D4-77B6-4336-A684-FBD28C95B009\" id=\"BPMNShape_sid-860C90D4-77B6-4336-A684-FBD28C95B009\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-61149916-1C68-428E-987A-8C94F5454F96\" id=\"BPMNEdge_sid-61149916-1C68-428E-987A-8C94F5454F96\">\n        <omgdi:waypoint x=\"274.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-E3CDDACB-2B12-4398-966D-C78588092BD6\" id=\"BPMNEdge_sid-E3CDDACB-2B12-4398-966D-C78588092BD6\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('ceaa3d85-2d57-11eb-b88c-227918fa15ea',1,'vendor-code-request-form.vendor-code-request-form.png','ce86aff3-2d57-11eb-b88c-227918fa15ea','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0f\0\0\0�\0\0\0�)�q\0\0	nIDATx���[kU��a/������G�E/�\0�5ф(F�gG��D<�	�B���ba�֎1�q�V�T�j�9&�ڌ:&ƨ���h2�d���;�f&����˛w����q\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�@�$�oܸ��ٳg_577\'���&�ijjJN�8��0U�H`\\��ɓ\'��������|�y��ar����!ғ�0�ŕ�(M���\n���Ƹ�}!��3!���J��� U�G%sN������ƹ/�+Mk&�}���\n3�����=�ܰ:�tx�[??\'����W��N�3s��!Af �0_=�y�0��	�0)��r�!�?\'���0c;��*���?\'�����7d���U�������-�|���m���9Af �0ǹ����	s���\n3�1���yr��������TaRs�����/��c��s��0i�9��;��$?��!����5�k���(P�l�l�,�@�a�e�<��Y`��s�G\Z���0y�f@��0�,̀0a��%I�I[[[��ݻ�oڴ���kjj�)S�$UUU��Ν۷r���7o����l�y�*++RQQ1?�__���i<���>�?����u�4F��o߾�֭[׿x��d�Ν�ٳg�������7��_�������\'!�ɢE�^/Y����ٳg	���M�:��a\Z���	q.s,|}�Z�!���ׯ�|���|�2��ŋ�+V�����:y��	�桅�Nq=�1~ߜ,�s�wW��<�2gΜ�СC���9��������Y��9�***�L�6�?ّ���L6nܘ���$w��I�<y2p>={�l��ӧO\'۷oO�O�>8�O���4ʭ��]�`Ar�ڵ$nݺ����̚5�7�l���(B�2;�{���\Z�Eww����_���fe$��c�s=0r�}a�\\��ͅY��RΎ�ҥKV�#]�rg+�r�S���Z)�o�<cƌ�p�|*�f,�9�)go_�����]1Rq�cÆ\r��5>U�����d�ڵ}qO��>�~��V��Xs�rS�Jy�QΎ��Iu+a����C���ŋ���͛�Y�?f	�0�V�$.{Oy���mkd�9��(��r�N9^��K�.���Y��9an�D3�pW{��j.u����h.��P����q���N�0�fa.�1��˼�W��=*����t)��+1�6�]�v%iھ}��xKi����������,̅8���f=�u[�l)�9��ϕ���g_�۬�t�̙[�`9Tl\'U�|�Տ0�h��7Ͼ�|kkkAϱxJ��!�+1�D������+,w����a��}r	�0��z�@�����E����Y�w���ħ�eH�����\'e�I����?�\n�0��\nӓ��|]\"7ܥsY�w�ҕ��?�c�[>�sqM)C�I�S�S]]�:�sOOOg������L�8q��+��CY�U�bfx,�K{������(�=淂l�Y��q�c&g�W����U\r\r\r)ҫ2��wf\r�0s>�!We���[��J�:�����Ev�{W��,��<�\\�L�V�Z�����J�ο�iӦ���Ffa�x�_8��Ӹ�/��;�J�ҥK��ֳ2\Z\Z\Z������,̣�Y�l�̙��-[֟ª�;��/x���t��=].�c�=]�L��յ�y�q?;~���\\a6e���c�zsX`��^-�����	�S�&mmm����L�0O��a���w0)CUUU�a��,���w�޽S�ǫ���������˼�����R��Qn*++k���k�W�1��@\\Q�6�,�y^9�d�9�.��\\���/�e�)�)�s�!������|?���m��eܾ�`9���0�\\ӝ��x�s�	%��3�q�\"��oٱcGR]]�j�݆O��\\c�}�𝸹����=r��ѣG�����/>��>�0s�ε���F8\'�)��@O������ڴiӕS�N�ߵ;2>�$�Ͼhjj��5k�	��oă$~�.�W��Y�}��	t����5r�{��W�����7��2O��I����[?��.#af�\Z��a�Y�a6��0�l�fa��3 �F�af@��0�,̀0a�Y�a6��0�l�f#̀03 �F�af@��0����,��3�!���J�N�8����%�E0���a�ꨄ1����W����=x�G?�J9F����v�I�J`\\��ga�v.��8M��ܯ�2\0\0\0\0\0\0\0\0\0\0\0\0���W#�y�^\0\0\0\0IEND�B`�',1),
('d507c503-2d28-11eb-9045-227918fa15ea',1,'send-email.bpmn','d507c502-2d28-11eb-9045-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"send-email\" name=\"发送邮件\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"start\" flowable:initiator=\"initiator\" flowable:formFieldValidation=\"true\"></startEvent>\n    <sequenceFlow id=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" sourceRef=\"startEvent1\" targetRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\"></sequenceFlow>\n    <endEvent id=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" name=\"end\"></endEvent>\n    <sequenceFlow id=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" sourceRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" targetRef=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\"></sequenceFlow>\n    <serviceTask id=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" name=\"SendEmail\" flowable:type=\"mail\">\n      <extensionElements>\n        <flowable:field name=\"to\">\n          <flowable:expression><![CDATA[${emailTo}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"from\">\n          <flowable:expression><![CDATA[${emailFrom}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"subject\">\n          <flowable:expression><![CDATA[${emailSubject}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"cc\">\n          <flowable:expression><![CDATA[${emailCC}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"text\">\n          <flowable:expression><![CDATA[${emailContent}]]></flowable:expression>\n        </flowable:field>\n      </extensionElements>\n    </serviceTask>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_send-email\">\n    <bpmndi:BPMNPlane bpmnElement=\"send-email\" id=\"BPMNPlane_send-email\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" id=\"BPMNShape_sid-E4D02A62-9237-4DB5-88D6-388754AE1687\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" id=\"BPMNShape_sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" id=\"BPMNEdge_sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" id=\"BPMNEdge_sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\">\n        <omgdi:waypoint x=\"274.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('d555e504-2d28-11eb-9045-227918fa15ea',1,'send-email.send-email.png','d507c502-2d28-11eb-9045-227918fa15ea','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0f\0\0\0�\0\0\0�)�q\0\0IDATx���mlU�p5j�1&\Z_8�ɖ����d&��֨a&j��$�74�Q�0��&��hD@\n\n�|���Q@jy.T����[/�.����~>�/=�=�-�����9�sN:	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��R:eݺu��\\���E����*WCCCZ�t�wY\r�E\'E(755������ޮ~�ڲeKZ�dɎ,�o�UB?#e��k¹=A��UB?���{*���J���){U0\'[%�Cc�������eA*��*�}�i�ζ�ϗ�m��X.<޺}Oھ�M�\nf����<}���O�6����Mj�xsz��k:�9���mL�u�<�Ӵc�p�@ł��{�_i��cՄ�W�\r�����d+��U���W���`�@��9���o�����-���x���y�7	V�T*�㌋8�W�S� .]/+�9��8[C0��Z1J.]/�l]+��,����T1�:��R���XW�\nf���<�������h�`�@%�9&�Ĭ�r����ΧfW�T(����KY�yޮ������[����9Ǵ��iK�H{�����d+#¹e��c^����mBY0�f���@/f%��,���3 ��`��K)����<�^Z2eʔcǎ�?lذ4hР4dȐ�w�uW��I��=��ӳ��`V����������nt�����Y�}-��Y}�}mV�qB�\'��i ���k{�G��7.=���i�ʕiӦMi�޽)��������,���w�}�{�Y�w��J0��[n�]V�j?������C�U?���G}t�}�ݗ��R�V�Z�&N�x`�ȑko��_	f%������Y��?�0�ҾƑ��SfϞ���;�Ls��9�@.5��4|��2z̂�����\r\Z<x���![__���x�����_��;w��Ӟ={�w�˗/OS�NM��zki8�2z�����1c�g�}�z����S�m#F���`V���P�.�Ł<}���5X�m۶����t�3GH�>$F���n功���k��\\0�)��������cI89���r�/zj�������nۖm0����=�����ɓ;�\'*��=�Xi[c�d����?�p{��+i�ܹm�ۮw������rC�H���\\�%#�&�V�f͚�����R��\Z5��V�f	f��]qJ\\qO�D�Gkk���4jx��)�)qհz���Z5f������q�f̘a�\\�bF_���iq�k���-�g�M;KV�̂���P��+��Q�֭[+���\Z%��],�jLL�~�R5M�:uUL)�Ec\no�����F0�JlC��Y��=�䓕�Ǌ�y���1q틘f]M+V�X�m,sz�NUT�:�f�ܝm�е/�766Vt�I(E��IWc�D�7o�j0����fˆ^�Su�~�w.�,���\r� Q�xO�+3�~�\r����U�\n$��x��RVoߩ�G?��T0��lCY�>�S�v�\\�s�t5&��~ݼ`��R��wU-nC���>&�j�СCV{�����R##���zW_}�)ZF��݆���l��э3���=�o����^�c>,��B����N���s]z���.˗+���<��؆��)�<�y���X�`������wbfVi W+�7l�W�K�~:��S�0���+̱\\Z=��1bD^�4��܆��Aٞz��}��ɓ����;!W;�/���<Ȳ�4mڴ��T0_r�%���J���Q0sr3e����9z���8�o��������H��Bx^t�E)����?<��qk���:+_窫�J�|��a#�g�y&�}����s�M3g�L7n�׋��\r7ܐ,\r�k���� ���k;�\'֙={v���ҙg��^|�Ŏu���t�g�S�/������S0�#f�e���j���{q��W�Ə��j]+c���ku�~��y�ر��N>���z\n��cT���=ܨQ�F�I�&���َ�/GKa	G�+�je���z�c9.M��f)��y���a_0`�`>�ʠl��~�M��{��*���e#�]]�늝��+����1�H�4D#��C0ά�*|�0���v��΂��eR��\n�/�7�1J��c$���$�;\r�_].����\\1r���J_�9���\n~�^n\r�h?��}��<�\"`!o}w���Q�!X�y�{\"T#��Z��VF�z�}-F屼f͚�9\"�KG݂��~�ە�s6�:P<Z��}��6���Ʃ���Iss���96��I�u�y��m��f/�y�]��y�r�Ҍ~o�т4*���q�����]�Wz��`.����q��!���ײ�R�;�t�>hȐ!�Y ���{�e#�e�۫�����u��7�m�}�s�9y8����#���8 W�/-��¼���Y��c>V0ǋG��q�q֬Y��8�=�\n{�%#e-�����~x�8��F�1R�P�6ĉ���1��̿9+��]�㬊rϾ�}�=娾���ūy6z��������mO?��_�}`_��f�\\�}-�m��\Z�9�$�\r�Ѯ�}1y��g�MC���d�ᮾ��q�>X�J�({;�����y�o��֌,�ߋ�}��%�s������N�����W@�=lذ�)S��gٲe_e�ڛ>�ŵ/\Z\Z\Z�x���e���b#�W�vDX0�J�k�z��r_��(���+wh���qŪ��\")1?�~��YF�Y0��@0�~̀`̀`V�̂�J0�Y0�Y	f@0+�f�f%��,���3 �3 ��`�`�̀`V�̂�J0�Y0�Y	f��-Z${O�͂y�����K�nnmm���6m��r�km���-^�x`cc��o���M8�|#�円�����V	����u�H�x=NU����Z�\0\0\0\0\0\0\0\0\0\0\0\0=��� �B�\0\0\0\0IEND�B`�',1),
('f1bf70e5-2d24-11eb-84d4-227918fa15ea',1,'send-email.bpmn','f1bf70e4-2d24-11eb-84d4-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"send-email\" name=\"发送邮件\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"start\" flowable:initiator=\"initiator\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:formProperty id=\"emailFrom\" name=\"发件人\" type=\"string\" default=\"delta@flowable.com\"></flowable:formProperty>\n        <flowable:formProperty id=\"emailTo\" name=\"收件人\" type=\"string\" default=\"delta@flowable.com\"></flowable:formProperty>\n        <flowable:formProperty id=\"emailCC\" name=\"抄送\" type=\"string\"></flowable:formProperty>\n        <flowable:formProperty id=\"emailSubject\" name=\"主题\" type=\"string\" default=\"测试\"></flowable:formProperty>\n        <flowable:formProperty id=\"emailContent\" name=\"正文\" type=\"string\" default=\"这是一个测试邮件\"></flowable:formProperty>\n      </extensionElements>\n    </startEvent>\n    <sequenceFlow id=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" sourceRef=\"startEvent1\" targetRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\"></sequenceFlow>\n    <endEvent id=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" name=\"end\"></endEvent>\n    <sequenceFlow id=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" sourceRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" targetRef=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\"></sequenceFlow>\n    <serviceTask id=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" name=\"SendEmail\" flowable:type=\"mail\">\n      <extensionElements>\n        <flowable:field name=\"to\">\n          <flowable:expression><![CDATA[${emailTo}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"from\">\n          <flowable:expression><![CDATA[${emailFrom}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"subject\">\n          <flowable:expression><![CDATA[${emailSubject}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"cc\">\n          <flowable:expression><![CDATA[${emailCC}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"text\">\n          <flowable:expression><![CDATA[${emailContent}]]></flowable:expression>\n        </flowable:field>\n      </extensionElements>\n    </serviceTask>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_send-email\">\n    <bpmndi:BPMNPlane bpmnElement=\"send-email\" id=\"BPMNPlane_send-email\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" id=\"BPMNShape_sid-E4D02A62-9237-4DB5-88D6-388754AE1687\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" id=\"BPMNShape_sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" id=\"BPMNEdge_sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" id=\"BPMNEdge_sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\">\n        <omgdi:waypoint x=\"274.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('f207c486-2d24-11eb-84d4-227918fa15ea',1,'send-email.send-email.png','f1bf70e4-2d24-11eb-84d4-227918fa15ea','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0f\0\0\0�\0\0\0�)�q\0\0IDATx���mlU�p5j�1&\Z_8�ɖ����d&��֨a&j��$�74�Q�0��&��hD@\n\n�|���Q@jy.T����[/�.����~>�/=�=�-�����9�sN:	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��R:eݺu��\\���E����*WCCCZ�t�wY\r�E\'E(755������ޮ~�ڲeKZ�dɎ,�o�UB?#e��k¹=A��UB?���{*���J���){U0\'[%�Cc�������eA*��*�}�i�ζ�ϗ�m��X.<޺}Oھ�M�\nf����<}���O�6����Mj�xsz��k:�9���mL�u�<�Ӵc�p�@ł��{�_i��cՄ�W�\r�����d+��U���W���`�@��9���o�����-���x���y�7	V�T*�㌋8�W�S� .]/+�9��8[C0��Z1J.]/�l]+��,����T1�:��R���XW�\nf���<�������h�`�@%�9&�Ĭ�r����ΧfW�T(����KY�yޮ������[����9Ǵ��iK�H{�����d+#¹e��c^����mBY0�f���@/f%��,���3 ��`��K)����<�^Z2eʔcǎ�?lذ4hР4dȐ�w�uW��I��=��ӳ��`V����������nt�����Y�}-��Y}�}mV�qB�\'��i ���k{�G��7.=���i�ʕiӦMi�޽)��������,���w�}�{�Y�w��J0��[n�]V�j?������C�U?���G}t�}�ݗ��R�V�Z�&N�x`�ȑko��_	f%������Y��?�0�ҾƑ��SfϞ���;�Ls��9�@.5��4|��2z̂�����\r\Z<x���![__���x�����_��;w��Ӟ={�w�˗/OS�NM��zki8�2z�����1c�g�}�z����S�m#F���`V���P�.�Ł<}���5X�m۶����t�3GH�>$F���n功���k��\\0�)��������cI89���r�/zj�������nۖm0����=�����ɓ;�\'*��=�Xi[c�d����?�p{��+i�ܹm�ۮw������rC�H���\\�%#�&�V�f͚�����R��\Z5��V�f	f��]qJ\\qO�D�Gkk���4jx��)�)qհz���Z5f������q�f̘a�\\�bF_���iq�k���-�g�M;KV�̂���P��+��Q�֭[+���\Z%��],�jLL�~�R5M�:uUL)�Ec\no�����F0�JlC��Y��=�䓕�Ǌ�y���1q틘f]M+V�X�m,sz�NUT�:�f�ܝm�е/�766Vt�I(E��IWc�D�7o�j0����fˆ^�Su�~�w.�,���\r� Q�xO�+3�~�\r����U�\n$��x��RVoߩ�G?��T0��lCY�>�S�v�\\�s�t5&��~ݼ`��R��wU-nC���>&�j�СCV{�����R##���zW_}�)ZF��݆���l��э3���=�o����^�c>,��B����N���s]z���.˗+���<��؆��)�<�y���X�`������wbfVi W+�7l�W�K�~:��S�0���+̱\\Z=��1bD^�4��܆��Aٞz��}��ɓ����;!W;�/���<Ȳ�4mڴ��T0_r�%���J���Q0sr3e����9z���8�o��������H��Bx^t�E)����?<��qk���:+_窫�J�|��a#�g�y&�}����s�M3g�L7n�׋��\r7ܐ,\r�k���� ���k;�\'֙={v���ҙg��^|�Ŏu���t�g�S�/������S0�#f�e���j���{q��W�Ə��j]+c���ku�~��y�ر��N>���z\n��cT���=ܨQ�F�I�&���َ�/GKa	G�+�je���z�c9.M��f)��y���a_0`�`>�ʠl��~�M��{��*���e#�]]�늝��+����1�H�4D#��C0ά�*|�0���v��΂��eR��\n�/�7�1J��c$���$�;\r�_].����\\1r���J_�9���\n~�^n\r�h?��}��<�\"`!o}w���Q�!X�y�{\"T#��Z��VF�z�}-F屼f͚�9\"�KG݂��~�ە�s6�:P<Z��}��6���Ʃ���Iss���96��I�u�y��m��f/�y�]��y�r�Ҍ~o�т4*���q�����]�Wz��`.����q��!���ײ�R�;�t�>hȐ!�Y ���{�e#�e�۫�����u��7�m�}�s�9y8����#���8 W�/-��¼���Y��c>V0ǋG��q�q֬Y��8�=�\n{�%#e-�����~x�8��F�1R�P�6ĉ���1��̿9+��]�㬊rϾ�}�=娾���ūy6z��������mO?��_�}`_��f�\\�}-�m��\Z�9�$�\r�Ѯ�}1y��g�MC���d�ᮾ��q�>X�J�({;�����y�o��֌,�ߋ�}��%�s������N�����W@�=lذ�)S��gٲe_e�ڛ>�ŵ/\Z\Z\Z�x���e���b#�W�vDX0�J�k�z��r_��(���+wh���qŪ��\")1?�~��YF�Y0��@0�~̀`̀`V�̂�J0�Y0�Y	f@0+�f�f%��,���3 �3 ��`�`�̀`V�̂�J0�Y0�Y	f��-Z${O�͂y�����K�nnmm���6m��r�km���-^�x`cc��o���M8�|#�円�����V	����u�H�x=NU����Z�\0\0\0\0\0\0\0\0\0\0\0\0=��� �B�\0\0\0\0IEND�B`�',1),
('faa37fba-2d29-11eb-9782-227918fa15ea',1,'send-email.bpmn','faa37fb9-2d29-11eb-9782-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"send-email\" name=\"发送邮件\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"start\" flowable:initiator=\"initiator\" flowable:formFieldValidation=\"true\"></startEvent>\n    <sequenceFlow id=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" sourceRef=\"startEvent1\" targetRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\"></sequenceFlow>\n    <endEvent id=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" name=\"end\"></endEvent>\n    <sequenceFlow id=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" sourceRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" targetRef=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\"></sequenceFlow>\n    <serviceTask id=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" name=\"SendEmail\" flowable:type=\"mail\">\n      <extensionElements>\n        <flowable:field name=\"to\">\n          <flowable:expression><![CDATA[${emailTo}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"from\">\n          <flowable:expression><![CDATA[${emailFrom}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"subject\">\n          <flowable:expression><![CDATA[${emailSubject}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"text\">\n          <flowable:expression><![CDATA[${emailContent}]]></flowable:expression>\n        </flowable:field>\n      </extensionElements>\n    </serviceTask>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_send-email\">\n    <bpmndi:BPMNPlane bpmnElement=\"send-email\" id=\"BPMNPlane_send-email\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" id=\"BPMNShape_sid-E4D02A62-9237-4DB5-88D6-388754AE1687\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" id=\"BPMNShape_sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"180.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" id=\"BPMNEdge_sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\">\n        <omgdi:waypoint x=\"129.9499986183554\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"180.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" id=\"BPMNEdge_sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\">\n        <omgdi:waypoint x=\"279.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('faff826b-2d29-11eb-9782-227918fa15ea',1,'send-email.send-email.png','faa37fb9-2d29-11eb-9782-227918fa15ea','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0f\0\0\0�\0\0\0�)�q\0\0IDATx���k�T�p5j�1&\Z?X�I����Ť&��ը�&�\"�B��R@Eli��5��b�RMՆ�X$H�-��^�W�Z�R嶮n����=�	����3���~ɓ=;{vgY���;�9�9�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�ORJǯ[��U�V��lٲ�t�RU�jiiI+W��:��H`P�r[[[���L����g����*�X�b{���*���HY(�p��F�km���}!Ne���V	\r.z�q@s�U�`.;4�|�]�8{u^�,H3P�`޳�;}�����k;z�9��wnە������d0G(�z����Ӓ�lN�lIS��~O0�r<�ཌྷir�Ο}��\'�3P�`�z������{��H5�5i��;��`*�����Me����\\�\nf����B��5gM����ӧ���x����k6	V�T*�㌋8�W�S� .]/+�9��8[C0��Z1J.]/�m]+��,����T1�<��Q���XW�\nf���������^~o�`�@%�9&�Ĭ�r��ϯɧfW�T(�wu�IY�Iޮ����:~2%;�s�i��3W~�v��#\\3P�VF�s���x�owt	e�T#�]�S0<��`�`�̀`V��F�R:���}̳�>�b����\'L��w�ȑi�Сi����o����)S��{��ge�k����knn�ESSӸl�z!�O���ZV���,�����XO:5h ���������~��驧�J�V�J�6mJ�w�N!>vvv�w�y\'e��n���w�q���o�y�`V��|�_��Z�U�� .�^��.�\ZD��x��=w�uW����K�Z�zu�<y�1cƬ2dȯ�̇���yY�.�C�Vm���5�(��y��-��[�����ȥ-Z�F�\Z�Uϣg�,��ESS��aÆ}[����顇J˗/O_|�EڱcG�?�ڵ+���k��3f�n��4�w\Z=�i(����9~��������~����|��ѣ/��`>(��̂t_q Ϛ5+o\r�c�֭���}�����Ҭ��H9B��\r�\\��Qs]��f�|�#��P�8qb>:>\Z�}�r,	g#�z�)G���Fʽ��o��ƭ�3X0�F��)�/�M��Ӯ8Z��x��K�\Z�%[m�0N������\\I,���v�!�U#s�-�#�c\r��p.9�I�\Z6w�ܿ�����*m�ر��6K0澈S�{�G۾8\\[��笥Qã�8O9N���5k�t�ӨY0�>��BhƁ�J�={�Qs��}q��XN��Q�FuD�m��@Y�V0���^b�^�_�j��曊�_q�Fɩt�I�\ZӬ�~��TM3f�XSJ���[��MMM�̂�X��Ӭ��y�J�c��<I�՘��EL����_}}��̯�`.������`.w{9p��뭭���bJ��2_�՘� і-[�\Z���Ʋ�Ƃ�gDT��	f�\\��r��D���}ЯT�,�=6H�\ZW�+\\��Z���JY���#�x�*�s��KV]�����Ý:W�ܻ%]������1^�e��`XU+�M��1IWcF����#殮��\Z1��8��ˎ��0b���Rt]e#fo������1o޼��\Z�1���c>��#Ī�\\\\pA�����J>�\0\n�l/z̔m�ԩ�T���ŋ�����x#fk�r��yÆ\rqu�t�Yg�N8!�s�9�\"�˥�_��ѣG��\0�|���Y���G}���1O�6mA\r�������|�E�A�����3g�T������OO>�dOU��T��|���y̔�����q�~��̿�Æ\r��^f#U:��y�����~�����!��N=��|�K/�4}���|��t�i��3�8#͙3\'mܸ1_/F��\\sM��4�/���^��+����Xg޼y���N��rJz�gzֽ����\'���NѾhkk;�w��`.G��˶��՘���4��M�8�պV��ŋg����J�	j-w�q�5\n�Ǩ6B7��{�QcǎMS�Lɗ#D��5_��¤I�~Ү8T+����{�=�q��X�6K�g,\\�0�������s�ʠl7�tӐ;�soF�[�Q߻�.׷���K.�	��1�H�4D#��C0ζ�*|�0���v��ނ��eR��\n�/�7�1J��c$���$�+u�l���rub̘1핾s����H}[��cE�����o�[�x;�s�Ξ*\r�����\Z�|��zke�����bT���~�ʥ��F���W*u=�l���x�\\O�ZC�>T�8�Rw0ioo��=�w0�[�y�y�!F�ًgjW]uU^�37��u� ���r|7n\\~�ǡ�+=�Wn0F�q0���̽�kY}U�;��w�:4|���l�������F}�fo�>wϿ��u�]��b�y������ё������|�\n���s���|c�8ˣ�=�#s�x���Ν+�#��W8���+)kaԛ���Qq���\Z9�H9B9�\'�����?3��a�<�8�wɎ�*�=�\"�����u_kx�j�������K�����=��_�}`����`>�}-����\Z�9�$�\r�Ѯ�}1y�\'�H#F���d���z���s\'�e�[�w�}��/�)/Y�dv�o���z�s	f���Z�itGYmzʍ��F@�9�s����}��W?�^��.|$�k_����|�=�,�^���F�܍pDX0�����޾r��k��{����~`��gqŪ��\")1?�~6�,#�,��k �U�3 �3 ��`�`�̀`V�̂�J0�Y0�Y	f@0f@0+�f�f%���3 �3 ��`�`�̀`̀`V���e˖	āS��`�k���r��-���Bq\0ԦM��˂y��\Z���˯nmm���_v	ǟo������yV��*�AY\\���ފ����TU�����\0\0\0\0\0\0\0\0\0\0\0\0p����� 4Toc\0\0\0\0IEND�B`�',1),
('fcbd1e56-2bcb-11eb-9e90-227918fa15ea',1,'out-factory.bpmn','fcbd1e55-2bcb-11eb-9e90-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"外出单\" isExecutable=\"true\">\n    <dataObject id=\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\" name=\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\" itemSubjectRef=\"xsd:boolean\">\n      <extensionElements>\n        <flowable:value>true</flowable:value>\n      </extensionElements>\n    </dataObject>\n    <dataObject id=\"manager\" name=\"所属领导\" itemSubjectRef=\"xsd:string\">\n      <extensionElements>\n        <flowable:value>manager</flowable:value>\n      </extensionElements>\n    </dataObject>\n    <startEvent id=\"startEvent1\" name=\"填单\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"申请人确认\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${_FLOWABLE_SKIP_EXPRESSION_ENABLED==true}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"主管审核\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('fcf3e5c7-2bcb-11eb-9e90-227918fa15ea',1,'out-factory.out-factory.png','fcbd1e55-2bcb-11eb-9e90-227918fa15ea','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0�\0\0\0�@m�\0\0~IDATx���}�Uu�\0�*z\"\"��#ڨ�h%\"\"�6�\"���6zs���4�\'�5��\"{�������6D�u]5g|͔ްYCV7�̜�m}̧1�<{������y�w��/3��;����|�����s��~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��$I�޴iӬ5k����ؘ,^�X�s444$+V���4���9��(�+W�LZZZ��{���;v$˗/ߕ��j9��m)�S������rH�zYL�*��ia�\'��P�!���z��XQ�9�Cb��0@��/ޞl��O�W\r�g��6�Ta�Cr��¼{�dݢ)ɗ��o�-�SP5w9$��*+�[���C�r�}5OA�����0�_�t��9�SP5w9$��*+��?�ia��T�]�!@a���C�@�8�����)����C@�捫�����)����C@���5%�>|����t[ܧ�j�rHUV�#66���S�Y�!�\Z�/�$?��C�S�mq�����!9TQa���mX�J��q�+�i�rH�P������K��\\����<�1�X#0�]�!�Bsw#-#0�Y�!��\ns9#��F`\n��.��Pa��p�r\n��.��Pa�Y(�rH���܅f��9(�\n��;t%I��755տ��;˧M��k	�F�\Z�><���;p�]w�<y򦧟~zf\Z���Yɡ�S[[�W555w�5zV\Z���:�=ilN~�c<N��M}���3�N��o�ĉ�믿��Y�&ٶm[�gϞ$�ז�����?O���s�=���-cǎ���Yɡ�s뭷�}\Z���{���K����xCD��G?������Y�޿R��k�&>�������7�|�ٚ�P���;i�>3m�{��;����^s�h��s�.���;�y������Z�pa2z����2�W�f9$�*MMM��#F�o�Q���&O=�T�dɒ��o�M~�駬&�������U���ӧ\'��v[i��m?H��e�>?~|�aÆ�7lٲ%IwZǌ�������������/6��3gfK��عsg����b�O�s��8�Ĉ=\Z{��Q�x�t�^�{�\n��,��P%�؋�}ҤI�(�p���lI�7�,k�1�[#��F��~��4a�i�Bsr���؋S�<�H����)�\'�|�t�~��X��������\Z{_�?~kmm�j�]h�B���7G�G�؋\r�d�R��bs����xC��פ��7��Z�{f�Yɡ�����w*��)��\Z���*��y�q�[���/�V��]aV�����8o�q0\\_x���ޫ]\\y.�;�S�zj���ͱfTI,i��¬0�!9T�9W�������?��\'5:��/9M�Lݲ��%e�|�ͤ?M�>}m\\��R�\n�O�kjj�VaV����:xI��q�<�L_��bs��nYe�Z�qI�����oI�e^��QbAG{�\n��,���@���k�g�/[��O�t\\����-�L|�������777��ɲ��������\\\n��,���@����ɶ���t��Jv��c�nYe������/�z��D��GU܃�i2�Ya�Crh s(���vo����iq��ޣ[V�x��~�����\\Y!��P̡<��N�Uf�ȑ�{�����\\%#�O���W\\q�ѕ4��z������O\Z�m?��c�L�.9$i>��ȝ��?~o������U�k��\n�@��Κ5+�N���������KN�p�\r�	\'��E<��c�i�=nܸN�w�ܹe�q&�駟�Y��q\nε�^����%_�u��+��2��k�\nȡ�\"΋���y?�x�7����Oڶ͙3\'���v�����J�s�/���>��S�v�g$�v�����!k�mʔ)��h�E��G�-�:��TZ���0�(<\nhw�YQ.w����vZ��g����Ԕ�t�I��r�-m��1cFr�&�֭k�v�y�%�]w�P.��C���E�D�/�/r���o�~_}��ɹ��n[��k��VV���J�{�~G��Cͽ�r�<e{��g��������\n;Ͻ�Q�@4��\'f�7�vt;�{������ʶw6r�?�!���K/e��������/O.�����N�>��dذa�֭[��˗g�ۻ�w�|��٬�,��CḚ�ӄ#�\"�b&h�ڵY#��\'�xb�,H�:�lI(�7o��s�#q;�����39��D^�gX\\|��m�t�9�ćJ%+W��ͽ�r�;e{���������P�gĈ_W��*e��G�h�=�������4jG����rJV�cZ����t4���F#�8��C+��Ǻi�I��z������؁�w�����s�vG�/�Dn_t�EYc�����K������W���^\\�.�����\nuuuu\\���M�4�����-�Y��*���{�ȣwր#bDT�:1\"��.��NG��i�(�H.f\0b[����*k�y�.6�ݻwg�;ꨣ���ʛ���X�x�#���,�A�{wyM;�7���c��=\ZE>�y\\:���c�e�=�ޯ�wϵ�)�w�q�}�ݷ�F�;ӑ�>�����\"��.6�q�wl/6�|[�k��c{4��\Zkj��c�4/�ys�F��=^3n���؋�=�n�]:��0\\s���\Za���w���(�\r�ܑ{������a�9u��,�&L��L�<9�?�Gs/�����¥u��O�$�������c}?��[�4-��u��=ֺ���ߋϿq���5��{����1���ꫯf?>o�1���nyA/m�1��y��l���\ZmX�0WFs���ȓ�f�\"�x���{9��OƎ��ٳ�獯q;���=?�#f�b� \Z{�8=��sɔ)S��{��M��l}~i_}�{:��_�Wk�����̴��nذ�O\Z{SS���5��{�ê���Ҧ��H�t��ۑ�g�}���#���8ʎ����������{�0�AW�������x@a��i��F����h/w�;����1��3,\"�^%{��)��{V��ؑ7���;��=�Q/����zMA]]]mZ�nii�����w�}�6�o�}z�R��#� ����j�gBDa�m�Ӟ/��B��8�.Nk˛{�����[����ŷ5��b��z�;��,\nD����#3����{g#���)m�嬹��\n;��vZ��7�xc��q>��^�������u��p����JF�������cǎ��[#��GcO��j�����#�(��hbZ=��c�њ{4�(��}��t饗�;��u����V�gbM4�r��(�q$s|E����Ǻ}iż����y� ����\n�\06��Fץ��8�����|�(�x�#\'���Ÿ?����^��A��Iw�����z�ݒP��ǎ������b��5��	��W�Q�q�\\q�=b0�k:�#LG�>�����Av;���?�T|$�`���K��e�������:�ԏ���(�;v�h7���U���ˡx����u���ʡ���4v�s4��q����S�1�W����_~99r�o%W��=X�5]��\r�����9}���<��P���|\Zc�5�J�.x4�|Z\\a�Cbh4��^O�;�Xi�}h5���ɏ\Z5�eڴi_}��Gߤ{~������k�744����>� �c�I{��(K�Ya�Cr�����&��\'M}0�k�WFJ�f��ko�O	�?-(>T �=�(�W2R�f9$��k�܅�,���0�]�!@aV�����Ya�CBsf�Y�!@s\n��C��,4w!�\0�Ya�CBsf�Y	�P�f9$�\0�](�rH\n��܅f�Y	�P�f9$4w@aV��4w�0�!9(�BsrP�f�]h�¬0�!��\n��,�����Y�!�Z466*��{�¼O���C@/[�b����E�b۶m����rH�zْ%K�_�lٟ��V�q�F[Q�\Z\Z�I�&9$�Z} -H��?��X����������C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@��\"���G+ \0\0\0\0IEND�B`�',1);

/*Table structure for table `ACT_GE_PROPERTY` */

DROP TABLE IF EXISTS `ACT_GE_PROPERTY`;

CREATE TABLE `ACT_GE_PROPERTY` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_GE_PROPERTY` */

insert  into `ACT_GE_PROPERTY`(`NAME_`,`VALUE_`,`REV_`) values 
('batch.schema.version','6.6.0.0',1),
('cfg.execution-related-entities-count','true',1),
('cfg.task-related-entities-count','true',1),
('common.schema.version','6.6.0.0',1),
('entitylink.schema.version','6.6.0.0',1),
('eventsubscription.schema.version','6.6.0.0',1),
('identitylink.schema.version','6.6.0.0',1),
('job.schema.version','6.6.0.0',1),
('next.dbid','1',1),
('schema.history','create(6.6.0.0)',1),
('schema.version','6.6.0.0',1),
('task.schema.version','6.6.0.0',1),
('variable.schema.version','6.6.0.0',1);

/*Table structure for table `ACT_HI_ACTINST` */

DROP TABLE IF EXISTS `ACT_HI_ACTINST`;

CREATE TABLE `ACT_HI_ACTINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `TRANSACTION_ORDER_` int DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_ACTINST` */

insert  into `ACT_HI_ACTINST`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values 
('3b43120c-2e04-11eb-8e8e-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','3b4275c5-2e04-11eb-8e8e-227918fa15ea','3b43120b-2e04-11eb-8e8e-227918fa15ea','startEvent1',NULL,NULL,'填单','startEvent',NULL,'2020-11-23 21:22:07.393','2020-11-23 21:22:07.409',1,16,NULL,''),
('3b45830f-2e04-11eb-8e8e-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','3b4275c5-2e04-11eb-8e8e-227918fa15ea','3b43120b-2e04-11eb-8e8e-227918fa15ea','sid-FB957372-CC09-424B-88F0-30C09C3C100F',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-23 21:22:07.409','2020-11-23 21:22:07.409',2,0,NULL,''),
('3b458310-2e04-11eb-8e8e-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','3b4275c5-2e04-11eb-8e8e-227918fa15ea','3b43120b-2e04-11eb-8e8e-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','3b4b7581-2e04-11eb-8e8e-227918fa15ea',NULL,'申请人确认','userTask','admin','2020-11-23 21:22:07.409',NULL,3,NULL,NULL,''),
('a43f984c-2e04-11eb-b39c-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','a43e38b5-2e04-11eb-b39c-227918fa15ea','a43f713b-2e04-11eb-b39c-227918fa15ea','startEvent1',NULL,NULL,'填单','startEvent',NULL,'2020-11-23 21:25:03.531','2020-11-23 21:25:03.544',1,13,NULL,''),
('a442094f-2e04-11eb-b39c-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','a43e38b5-2e04-11eb-b39c-227918fa15ea','a43f713b-2e04-11eb-b39c-227918fa15ea','sid-FB957372-CC09-424B-88F0-30C09C3C100F',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-23 21:25:03.547','2020-11-23 21:25:03.547',2,0,NULL,''),
('a4420950-2e04-11eb-b39c-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','a43e38b5-2e04-11eb-b39c-227918fa15ea','a43f713b-2e04-11eb-b39c-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','a44ae2f1-2e04-11eb-b39c-227918fa15ea',NULL,'申请人确认','userTask','admin','2020-11-23 21:25:03.547',NULL,3,NULL,NULL,''),
('df3615e5-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea','startEvent1',NULL,NULL,'填单','startEvent',NULL,'2020-11-25 02:40:29.153','2020-11-25 02:40:29.163',1,10,NULL,''),
('df37eaa8-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea','sid-FB957372-CC09-424B-88F0-30C09C3C100F',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-25 02:40:29.166','2020-11-25 02:40:29.166',2,0,NULL,''),
('df3811b9-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','df3db70a-2ef9-11eb-aabd-227918fa15ea',NULL,'申请人确认','userTask',NULL,'2020-11-25 02:40:29.166','2020-11-25 02:40:29.205',3,39,NULL,''),
('df3e052b-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea','sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-25 02:40:29.205','2020-11-25 02:40:29.205',4,0,NULL,''),
('df3e052c-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea','sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175','df3e2c3d-2ef9-11eb-aabd-227918fa15ea',NULL,'主管审核','userTask','manager','2020-11-25 02:40:29.205',NULL,5,NULL,NULL,''),
('f260e631-2e06-11eb-bbd8-227918fa15ea',1,'out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea','f25f869a-2e06-11eb-bbd8-227918fa15ea','f260e630-2e06-11eb-bbd8-227918fa15ea','startEvent1',NULL,NULL,'填单','startEvent',NULL,'2020-11-23 21:41:33.606','2020-11-23 21:41:33.617',1,11,NULL,''),
('f2637e44-2e06-11eb-bbd8-227918fa15ea',1,'out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea','f25f869a-2e06-11eb-bbd8-227918fa15ea','f260e630-2e06-11eb-bbd8-227918fa15ea','sid-FB957372-CC09-424B-88F0-30C09C3C100F',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-23 21:41:33.622','2020-11-23 21:41:33.622',2,0,NULL,''),
('f2637e45-2e06-11eb-bbd8-227918fa15ea',1,'out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea','f25f869a-2e06-11eb-bbd8-227918fa15ea','f260e630-2e06-11eb-bbd8-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','f2692396-2e06-11eb-bbd8-227918fa15ea',NULL,'申请人确认','userTask','admin','2020-11-23 21:41:33.622',NULL,3,NULL,NULL,''),
('f87f6b35-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea','startEvent1',NULL,NULL,'填单','startEvent',NULL,'2020-11-23 22:17:31.355','2020-11-23 22:17:31.368',1,13,NULL,''),
('f881b528-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea','sid-FB957372-CC09-424B-88F0-30C09C3C100F',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-23 22:17:31.370','2020-11-23 22:17:31.370',2,0,NULL,''),
('f881b529-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','f885d3da-2e0b-11eb-b5e4-227918fa15ea',NULL,'申请人确认','userTask',NULL,'2020-11-23 22:17:31.370','2020-11-23 22:17:31.398',3,28,NULL,''),
('f885faeb-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea','sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-23 22:17:31.398','2020-11-23 22:17:31.398',4,0,NULL,''),
('f885faec-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea','sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175','f88621fd-2e0b-11eb-b5e4-227918fa15ea',NULL,'主管审核','userTask','manager','2020-11-23 22:17:31.398',NULL,5,NULL,NULL,'');

/*Table structure for table `ACT_HI_ATTACHMENT` */

DROP TABLE IF EXISTS `ACT_HI_ATTACHMENT`;

CREATE TABLE `ACT_HI_ATTACHMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_ATTACHMENT` */

/*Table structure for table `ACT_HI_COMMENT` */

DROP TABLE IF EXISTS `ACT_HI_COMMENT`;

CREATE TABLE `ACT_HI_COMMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_COMMENT` */

/*Table structure for table `ACT_HI_DETAIL` */

DROP TABLE IF EXISTS `ACT_HI_DETAIL`;

CREATE TABLE `ACT_HI_DETAIL` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_DETAIL` */

/*Table structure for table `ACT_HI_ENTITYLINK` */

DROP TABLE IF EXISTS `ACT_HI_ENTITYLINK`;

CREATE TABLE `ACT_HI_ENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_ROOT_SCOPE` (`ROOT_SCOPE_ID_`,`ROOT_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_ENTITYLINK` */

/*Table structure for table `ACT_HI_IDENTITYLINK` */

DROP TABLE IF EXISTS `ACT_HI_IDENTITYLINK`;

CREATE TABLE `ACT_HI_IDENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_IDENTITYLINK` */

insert  into `ACT_HI_IDENTITYLINK`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values 
('3b4275c7-2e04-11eb-8e8e-227918fa15ea',NULL,'starter','admin',NULL,'2020-11-23 21:22:07.389','3b4275c5-2e04-11eb-8e8e-227918fa15ea',NULL,NULL,NULL,NULL),
('3b4cae02-2e04-11eb-8e8e-227918fa15ea',NULL,'assignee','admin','3b4b7581-2e04-11eb-8e8e-227918fa15ea','2020-11-23 21:22:07.456',NULL,NULL,NULL,NULL,NULL),
('3b4d4a43-2e04-11eb-8e8e-227918fa15ea',NULL,'participant','admin',NULL,'2020-11-23 21:22:07.460','3b4275c5-2e04-11eb-8e8e-227918fa15ea',NULL,NULL,NULL,NULL),
('a43efc07-2e04-11eb-b39c-227918fa15ea',NULL,'starter','admin',NULL,'2020-11-23 21:25:03.527','a43e38b5-2e04-11eb-b39c-227918fa15ea',NULL,NULL,NULL,NULL),
('a44c4282-2e04-11eb-b39c-227918fa15ea',NULL,'assignee','admin','a44ae2f1-2e04-11eb-b39c-227918fa15ea','2020-11-23 21:25:03.614',NULL,NULL,NULL,NULL,NULL),
('a44cb7b3-2e04-11eb-b39c-227918fa15ea',NULL,'participant','admin',NULL,'2020-11-23 21:25:03.617','a43e38b5-2e04-11eb-b39c-227918fa15ea',NULL,NULL,NULL,NULL),
('df35799d-2ef9-11eb-aabd-227918fa15ea',NULL,'starter','user',NULL,'2020-11-25 02:40:29.149','df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,NULL,NULL,NULL),
('df3e2c3e-2ef9-11eb-aabd-227918fa15ea',NULL,'assignee','manager','df3e2c3d-2ef9-11eb-aabd-227918fa15ea','2020-11-25 02:40:29.206',NULL,NULL,NULL,NULL,NULL),
('df3e534f-2ef9-11eb-aabd-227918fa15ea',NULL,'participant','manager',NULL,'2020-11-25 02:40:29.207','df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,NULL,NULL,NULL),
('f26049ec-2e06-11eb-bbd8-227918fa15ea',NULL,'starter','admin',NULL,'2020-11-23 21:41:33.601','f25f869a-2e06-11eb-bbd8-227918fa15ea',NULL,NULL,NULL,NULL),
('f26a0df7-2e06-11eb-bbd8-227918fa15ea',NULL,'assignee','admin','f2692396-2e06-11eb-bbd8-227918fa15ea','2020-11-23 21:41:33.665',NULL,NULL,NULL,NULL,NULL),
('f26a5c18-2e06-11eb-bbd8-227918fa15ea',NULL,'participant','admin',NULL,'2020-11-23 21:41:33.667','f25f869a-2e06-11eb-bbd8-227918fa15ea',NULL,NULL,NULL,NULL),
('f87ef5fd-2e0b-11eb-b5e4-227918fa15ea',NULL,'starter','admin',NULL,'2020-11-23 22:17:31.353','f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,NULL,NULL,NULL),
('f88621fe-2e0b-11eb-b5e4-227918fa15ea',NULL,'assignee','manager','f88621fd-2e0b-11eb-b5e4-227918fa15ea','2020-11-23 22:17:31.399',NULL,NULL,NULL,NULL,NULL),
('f886490f-2e0b-11eb-b5e4-227918fa15ea',NULL,'participant','manager',NULL,'2020-11-23 22:17:31.400','f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,NULL,NULL,NULL);

/*Table structure for table `ACT_HI_PROCINST` */

DROP TABLE IF EXISTS `ACT_HI_PROCINST`;

CREATE TABLE `ACT_HI_PROCINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_PROCINST` */

insert  into `ACT_HI_PROCINST`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`) values 
('3b4275c5-2e04-11eb-8e8e-227918fa15ea',1,'3b4275c5-2e04-11eb-8e8e-227918fa15ea',NULL,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','2020-11-23 21:22:07.389',NULL,NULL,'admin','startEvent1',NULL,NULL,NULL,'','外出单 - November 24th 2020',NULL,NULL,NULL,NULL),
('a43e38b5-2e04-11eb-b39c-227918fa15ea',1,'a43e38b5-2e04-11eb-b39c-227918fa15ea',NULL,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','2020-11-23 21:25:03.522',NULL,NULL,'admin','startEvent1',NULL,NULL,NULL,'','外出单-2020 11 24',NULL,NULL,NULL,NULL),
('df35046b-2ef9-11eb-aabd-227918fa15ea',1,'df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','2020-11-25 02:40:29.146',NULL,NULL,'user','startEvent1',NULL,NULL,NULL,'','外出单-2020 11 25',NULL,NULL,NULL,NULL),
('f25f869a-2e06-11eb-bbd8-227918fa15ea',1,'f25f869a-2e06-11eb-bbd8-227918fa15ea',NULL,'out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea','2020-11-23 21:41:33.596',NULL,NULL,'admin','startEvent1',NULL,NULL,NULL,'','外出单-2020 11 24',NULL,NULL,NULL,NULL),
('f87e80cb-2e0b-11eb-b5e4-227918fa15ea',1,'f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','2020-11-23 22:17:31.349',NULL,NULL,'admin','startEvent1',NULL,NULL,NULL,'','外出单-2020 11 24',NULL,NULL,NULL,NULL);

/*Table structure for table `ACT_HI_TASKINST` */

DROP TABLE IF EXISTS `ACT_HI_TASKINST`;

CREATE TABLE `ACT_HI_TASKINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_TASKINST` */

insert  into `ACT_HI_TASKINST`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values 
('3b4b7581-2e04-11eb-8e8e-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea',NULL,'sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','3b4275c5-2e04-11eb-8e8e-227918fa15ea','3b43120b-2e04-11eb-8e8e-227918fa15ea',NULL,NULL,NULL,NULL,NULL,'申请人确认',NULL,NULL,NULL,'admin','2020-11-23 21:22:07.409',NULL,NULL,NULL,NULL,50,'2020-11-29 05:22:07.460','out-factory',NULL,'','2020-11-23 21:22:07.460'),
('a44ae2f1-2e04-11eb-b39c-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea',NULL,'sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','a43e38b5-2e04-11eb-b39c-227918fa15ea','a43f713b-2e04-11eb-b39c-227918fa15ea',NULL,NULL,NULL,NULL,NULL,'申请人确认',NULL,NULL,NULL,'admin','2020-11-23 21:25:03.547',NULL,NULL,NULL,NULL,50,'2020-11-29 05:25:03.618','out-factory',NULL,'','2020-11-23 21:25:03.620'),
('df3db70a-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea',NULL,'sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea',NULL,NULL,NULL,NULL,NULL,'申请人确认',NULL,NULL,NULL,NULL,'2020-11-25 02:40:29.166',NULL,'2020-11-25 02:40:29.205',39,NULL,50,NULL,'out-factory',NULL,'','2020-11-25 02:40:29.205'),
('df3e2c3d-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea',NULL,'sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea',NULL,NULL,NULL,NULL,NULL,'主管审核',NULL,NULL,NULL,'manager','2020-11-25 02:40:29.205',NULL,NULL,NULL,NULL,50,'2020-11-30 10:40:29.213','out-factory',NULL,'','2020-11-25 02:40:29.214'),
('f2692396-2e06-11eb-bbd8-227918fa15ea',1,'out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea',NULL,'sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','f25f869a-2e06-11eb-bbd8-227918fa15ea','f260e630-2e06-11eb-bbd8-227918fa15ea',NULL,NULL,NULL,NULL,NULL,'申请人确认',NULL,NULL,NULL,'admin','2020-11-23 21:41:33.622',NULL,NULL,NULL,NULL,50,'2020-11-29 05:41:33.667','out-factory',NULL,'','2020-11-23 21:41:33.669'),
('f885d3da-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea',NULL,'sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea',NULL,NULL,NULL,NULL,NULL,'申请人确认',NULL,NULL,NULL,NULL,'2020-11-23 22:17:31.370',NULL,'2020-11-23 22:17:31.398',28,NULL,50,NULL,'out-factory',NULL,'','2020-11-23 22:17:31.398'),
('f88621fd-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea',NULL,'sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea',NULL,NULL,NULL,NULL,NULL,'主管审核',NULL,NULL,NULL,'manager','2020-11-23 22:17:31.399',NULL,NULL,NULL,NULL,50,'2020-11-29 06:17:31.405','out-factory',NULL,'','2020-11-23 22:17:31.406');

/*Table structure for table `ACT_HI_TSK_LOG` */

DROP TABLE IF EXISTS `ACT_HI_TSK_LOG`;

CREATE TABLE `ACT_HI_TSK_LOG` (
  `ID_` bigint NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_TSK_LOG` */

/*Table structure for table `ACT_HI_VARINST` */

DROP TABLE IF EXISTS `ACT_HI_VARINST`;

CREATE TABLE `ACT_HI_VARINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_EXE` (`EXECUTION_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_VARINST` */

insert  into `ACT_HI_VARINST`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values 
('3b4275c6-2e04-11eb-8e8e-227918fa15ea',0,'3b4275c5-2e04-11eb-8e8e-227918fa15ea','3b4275c5-2e04-11eb-8e8e-227918fa15ea',NULL,'initiator','string',NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL,'2020-11-23 21:22:07.389','2020-11-23 21:22:07.389'),
('3b431208-2e04-11eb-8e8e-227918fa15ea',0,'3b4275c5-2e04-11eb-8e8e-227918fa15ea','3b4275c5-2e04-11eb-8e8e-227918fa15ea',NULL,'summary','string',NULL,NULL,NULL,NULL,NULL,NULL,'23333',NULL,'2020-11-23 21:22:07.393','2020-11-23 21:22:07.393'),
('3b431209-2e04-11eb-8e8e-227918fa15ea',0,'3b4275c5-2e04-11eb-8e8e-227918fa15ea','3b4275c5-2e04-11eb-8e8e-227918fa15ea',NULL,'empid','long',NULL,NULL,NULL,NULL,NULL,322,'322',NULL,'2020-11-23 21:22:07.393','2020-11-23 21:22:07.393'),
('3b43120a-2e04-11eb-8e8e-227918fa15ea',0,'3b4275c5-2e04-11eb-8e8e-227918fa15ea','3b4275c5-2e04-11eb-8e8e-227918fa15ea',NULL,'description','string',NULL,NULL,NULL,NULL,NULL,NULL,'22222232',NULL,'2020-11-23 21:22:07.393','2020-11-23 21:22:07.393'),
('a43e38b6-2e04-11eb-b39c-227918fa15ea',0,'a43e38b5-2e04-11eb-b39c-227918fa15ea','a43e38b5-2e04-11eb-b39c-227918fa15ea',NULL,'initiator','string',NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL,'2020-11-23 21:25:03.525','2020-11-23 21:25:03.525'),
('a43f4a28-2e04-11eb-b39c-227918fa15ea',0,'a43e38b5-2e04-11eb-b39c-227918fa15ea','a43e38b5-2e04-11eb-b39c-227918fa15ea',NULL,'summary','string',NULL,NULL,NULL,NULL,NULL,NULL,'test',NULL,'2020-11-23 21:25:03.529','2020-11-23 21:25:03.529'),
('a43f4a29-2e04-11eb-b39c-227918fa15ea',0,'a43e38b5-2e04-11eb-b39c-227918fa15ea','a43e38b5-2e04-11eb-b39c-227918fa15ea',NULL,'empid','long',NULL,NULL,NULL,NULL,NULL,222,'222',NULL,'2020-11-23 21:25:03.529','2020-11-23 21:25:03.529'),
('a43f4a2a-2e04-11eb-b39c-227918fa15ea',0,'a43e38b5-2e04-11eb-b39c-227918fa15ea','a43e38b5-2e04-11eb-b39c-227918fa15ea',NULL,'description','string',NULL,NULL,NULL,NULL,NULL,NULL,'    222222222222222222',NULL,'2020-11-23 21:25:03.529','2020-11-23 21:25:03.529'),
('df35046c-2ef9-11eb-aabd-227918fa15ea',0,'df35046b-2ef9-11eb-aabd-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,'initiator','string',NULL,NULL,NULL,NULL,NULL,NULL,'user',NULL,'2020-11-25 02:40:29.148','2020-11-25 02:40:29.148'),
('df35a0ae-2ef9-11eb-aabd-227918fa15ea',0,'df35046b-2ef9-11eb-aabd-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,'summary','string',NULL,NULL,NULL,NULL,NULL,NULL,'summary',NULL,'2020-11-25 02:40:29.150','2020-11-25 02:40:29.150'),
('df35c7bf-2ef9-11eb-aabd-227918fa15ea',0,'df35046b-2ef9-11eb-aabd-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,'empid','long',NULL,NULL,NULL,NULL,NULL,33333,'33333',NULL,'2020-11-25 02:40:29.151','2020-11-25 02:40:29.151'),
('df35c7c0-2ef9-11eb-aabd-227918fa15ea',0,'df35046b-2ef9-11eb-aabd-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,'_FLOWABLE_SKIP_EXPRESSION_ENABLED','boolean',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2020-11-25 02:40:29.151','2020-11-25 02:40:29.151'),
('df35c7c1-2ef9-11eb-aabd-227918fa15ea',0,'df35046b-2ef9-11eb-aabd-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,'manager','string',NULL,NULL,NULL,NULL,NULL,NULL,'manager',NULL,'2020-11-25 02:40:29.151','2020-11-25 02:40:29.151'),
('df35c7c2-2ef9-11eb-aabd-227918fa15ea',0,'df35046b-2ef9-11eb-aabd-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,'description','string',NULL,NULL,NULL,NULL,NULL,NULL,'    3333333333333',NULL,'2020-11-25 02:40:29.151','2020-11-25 02:40:29.151'),
('df35c7c3-2ef9-11eb-aabd-227918fa15ea',0,'df35046b-2ef9-11eb-aabd-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,'skip','boolean',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2020-11-25 02:40:29.151','2020-11-25 02:40:29.151'),
('f25f869b-2e06-11eb-bbd8-227918fa15ea',0,'f25f869a-2e06-11eb-bbd8-227918fa15ea','f25f869a-2e06-11eb-bbd8-227918fa15ea',NULL,'initiator','string',NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL,'2020-11-23 21:41:33.599','2020-11-23 21:41:33.599'),
('f260980d-2e06-11eb-bbd8-227918fa15ea',0,'f25f869a-2e06-11eb-bbd8-227918fa15ea','f25f869a-2e06-11eb-bbd8-227918fa15ea',NULL,'summary','string',NULL,NULL,NULL,NULL,NULL,NULL,'summary',NULL,'2020-11-23 21:41:33.604','2020-11-23 21:41:33.604'),
('f260bf1e-2e06-11eb-bbd8-227918fa15ea',0,'f25f869a-2e06-11eb-bbd8-227918fa15ea','f25f869a-2e06-11eb-bbd8-227918fa15ea',NULL,'empid','long',NULL,NULL,NULL,NULL,NULL,2222,'2222',NULL,'2020-11-23 21:41:33.604','2020-11-23 21:41:33.604'),
('f260bf1f-2e06-11eb-bbd8-227918fa15ea',0,'f25f869a-2e06-11eb-bbd8-227918fa15ea','f25f869a-2e06-11eb-bbd8-227918fa15ea',NULL,'description','string',NULL,NULL,NULL,NULL,NULL,NULL,'    22222222222222222222',NULL,'2020-11-23 21:41:33.604','2020-11-23 21:41:33.604'),
('f87ea7dc-2e0b-11eb-b5e4-227918fa15ea',0,'f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,'initiator','string',NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL,'2020-11-23 22:17:31.351','2020-11-23 22:17:31.351'),
('f87f1d0e-2e0b-11eb-b5e4-227918fa15ea',0,'f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,'summary','string',NULL,NULL,NULL,NULL,NULL,NULL,'summary',NULL,'2020-11-23 22:17:31.353','2020-11-23 22:17:31.353'),
('f87f441f-2e0b-11eb-b5e4-227918fa15ea',0,'f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,'empid','long',NULL,NULL,NULL,NULL,NULL,123123,'123123',NULL,'2020-11-23 22:17:31.354','2020-11-23 22:17:31.354'),
('f87f4420-2e0b-11eb-b5e4-227918fa15ea',0,'f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,'_FLOWABLE_SKIP_EXPRESSION_ENABLED','boolean',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2020-11-23 22:17:31.354','2020-11-23 22:17:31.354'),
('f87f4421-2e0b-11eb-b5e4-227918fa15ea',0,'f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,'manager','string',NULL,NULL,NULL,NULL,NULL,NULL,'manager',NULL,'2020-11-23 22:17:31.354','2020-11-23 22:17:31.354'),
('f87f4422-2e0b-11eb-b5e4-227918fa15ea',0,'f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,'description','string',NULL,NULL,NULL,NULL,NULL,NULL,'    21313213',NULL,'2020-11-23 22:17:31.354','2020-11-23 22:17:31.354'),
('f87f4423-2e0b-11eb-b5e4-227918fa15ea',0,'f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,'skip','boolean',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2020-11-23 22:17:31.354','2020-11-23 22:17:31.354');

/*Table structure for table `ACT_ID_BYTEARRAY` */

DROP TABLE IF EXISTS `ACT_ID_BYTEARRAY`;

CREATE TABLE `ACT_ID_BYTEARRAY` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_ID_BYTEARRAY` */

/*Table structure for table `ACT_ID_GROUP` */

DROP TABLE IF EXISTS `ACT_ID_GROUP`;

CREATE TABLE `ACT_ID_GROUP` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_ID_GROUP` */

insert  into `ACT_ID_GROUP`(`ID_`,`REV_`,`NAME_`,`TYPE_`) values 
('admin',1,'admin','assignment'),
('ceo',1,'ceo','assignment'),
('manager',1,'manager','assignment'),
('user',1,'user','assignment');

/*Table structure for table `ACT_ID_INFO` */

DROP TABLE IF EXISTS `ACT_ID_INFO`;

CREATE TABLE `ACT_ID_INFO` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_ID_INFO` */

/*Table structure for table `ACT_ID_MEMBERSHIP` */

DROP TABLE IF EXISTS `ACT_ID_MEMBERSHIP`;

CREATE TABLE `ACT_ID_MEMBERSHIP` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `ACT_ID_GROUP` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `ACT_ID_USER` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_ID_MEMBERSHIP` */

insert  into `ACT_ID_MEMBERSHIP`(`USER_ID_`,`GROUP_ID_`) values 
('admin','admin'),
('ceo','ceo'),
('manager','manager'),
('employee','user'),
('user','user');

/*Table structure for table `ACT_ID_PRIV` */

DROP TABLE IF EXISTS `ACT_ID_PRIV`;

CREATE TABLE `ACT_ID_PRIV` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PRIV_NAME` (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_ID_PRIV` */

insert  into `ACT_ID_PRIV`(`ID_`,`NAME_`) values 
('dc9f0d31-2acf-11eb-80d9-227918fa15ea','access-admin'),
('dc9cea4f-2acf-11eb-80d9-227918fa15ea','access-idm'),
('dca0e1f3-2acf-11eb-80d9-227918fa15ea','access-modeler'),
('dca4b287-2acf-11eb-80d9-227918fa15ea','access-rest-api'),
('dca2ddc5-2acf-11eb-80d9-227918fa15ea','access-task');

/*Table structure for table `ACT_ID_PRIV_MAPPING` */

DROP TABLE IF EXISTS `ACT_ID_PRIV_MAPPING`;

CREATE TABLE `ACT_ID_PRIV_MAPPING` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PRIV_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_PRIV_MAPPING` (`PRIV_ID_`),
  KEY `ACT_IDX_PRIV_USER` (`USER_ID_`),
  KEY `ACT_IDX_PRIV_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_PRIV_MAPPING` FOREIGN KEY (`PRIV_ID_`) REFERENCES `ACT_ID_PRIV` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_ID_PRIV_MAPPING` */

insert  into `ACT_ID_PRIV_MAPPING`(`ID_`,`PRIV_ID_`,`USER_ID_`,`GROUP_ID_`) values 
('178b2b3f-2ad1-11eb-80d9-227918fa15ea','dc9cea4f-2acf-11eb-80d9-227918fa15ea',NULL,'admin'),
('27e2f9f0-2ad1-11eb-80d9-227918fa15ea','dc9f0d31-2acf-11eb-80d9-227918fa15ea',NULL,'manager'),
('2a939b01-2ad1-11eb-80d9-227918fa15ea','dc9f0d31-2acf-11eb-80d9-227918fa15ea',NULL,'admin'),
('2f71ca72-2ad1-11eb-80d9-227918fa15ea','dca0e1f3-2acf-11eb-80d9-227918fa15ea',NULL,'ceo'),
('332c8883-2ad1-11eb-80d9-227918fa15ea','dca0e1f3-2acf-11eb-80d9-227918fa15ea',NULL,'manager'),
('35aeeda4-2ad1-11eb-80d9-227918fa15ea','dca0e1f3-2acf-11eb-80d9-227918fa15ea',NULL,'user'),
('3aeeec25-2ad1-11eb-80d9-227918fa15ea','dca2ddc5-2acf-11eb-80d9-227918fa15ea',NULL,'ceo'),
('3e752cb6-2ad1-11eb-80d9-227918fa15ea','dca2ddc5-2acf-11eb-80d9-227918fa15ea',NULL,'manager'),
('412ea767-2ad1-11eb-80d9-227918fa15ea','dca2ddc5-2acf-11eb-80d9-227918fa15ea',NULL,'user'),
('4eaf614a-2ad1-11eb-80d9-227918fa15ea','dca4b287-2acf-11eb-80d9-227918fa15ea',NULL,'admin'),
('6538935b-2ad1-11eb-80d9-227918fa15ea','dca0e1f3-2acf-11eb-80d9-227918fa15ea',NULL,'admin'),
('696f864c-2ad1-11eb-80d9-227918fa15ea','dca2ddc5-2acf-11eb-80d9-227918fa15ea',NULL,'admin'),
('dc9e49e0-2acf-11eb-80d9-227918fa15ea','dc9cea4f-2acf-11eb-80d9-227918fa15ea','SRV-TestAdmin.ADD',NULL),
('dca01ea2-2acf-11eb-80d9-227918fa15ea','dc9f0d31-2acf-11eb-80d9-227918fa15ea','SRV-TestAdmin.ADD',NULL),
('dca1f364-2acf-11eb-80d9-227918fa15ea','dca0e1f3-2acf-11eb-80d9-227918fa15ea','SRV-TestAdmin.ADD',NULL),
('dca3ef36-2acf-11eb-80d9-227918fa15ea','dca2ddc5-2acf-11eb-80d9-227918fa15ea','SRV-TestAdmin.ADD',NULL),
('dca59ce8-2acf-11eb-80d9-227918fa15ea','dca4b287-2acf-11eb-80d9-227918fa15ea','SRV-TestAdmin.ADD',NULL);

/*Table structure for table `ACT_ID_PROPERTY` */

DROP TABLE IF EXISTS `ACT_ID_PROPERTY`;

CREATE TABLE `ACT_ID_PROPERTY` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_ID_PROPERTY` */

insert  into `ACT_ID_PROPERTY`(`NAME_`,`VALUE_`,`REV_`) values 
('schema.version','6.6.0.0',1);

/*Table structure for table `ACT_ID_TOKEN` */

DROP TABLE IF EXISTS `ACT_ID_TOKEN`;

CREATE TABLE `ACT_ID_TOKEN` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TOKEN_VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_DATE_` timestamp(3) NULL DEFAULT NULL,
  `IP_ADDRESS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_AGENT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_DATA_` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_ID_TOKEN` */

insert  into `ACT_ID_TOKEN`(`ID_`,`REV_`,`TOKEN_VALUE_`,`TOKEN_DATE_`,`IP_ADDRESS_`,`USER_AGENT_`,`USER_ID_`,`TOKEN_DATA_`) values 
('5aIDNU+dyP9nmUhznnFMow==',1,'+HFvzbhBhMdFTxXprTXWpg==','2020-11-22 18:00:48.344','/deltaflow/index','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36','admin',NULL),
('7PSx+GpehhU23DXJt9GPIA==',1,'Vw8gB+ipCQNHPoxiZ7k5uA==','2020-11-21 03:05:41.525','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36','admin',NULL),
('B47POsZCEGH4HzKnHmDJ8w==',1,'u9Yang6F3CzaGow4glimkQ==','2020-11-25 02:25:44.125','/deltaflow/tasks','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36','admin',NULL),
('BH9kCsg6bP3IwKM1bPyv4g==',1,'1iD3bpJ0klOU3CmyrzvfZw==','2020-11-25 03:03:31.219','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0','manager',NULL),
('JjeNWjww3n92cv2IfqaKSQ==',1,'ZLsRdAzI1YEcLOPqCP75NQ==','2020-11-23 03:26:43.185','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0','admin',NULL),
('JmaD1DLBIQBpKgpRbcU0yA==',1,'pWljNx5USmXZwtErIWDW3Q==','2020-11-22 18:31:28.404','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0','admin',NULL),
('MJ3gUK5two2rxwbhUuakgw==',1,'WFdgTf5Re3B0AEKmuZgAtQ==','2020-11-25 02:38:43.935','/deltaflow/tasks','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36 OPR/72.0.3815.320','manager',NULL),
('NZiGChY4yG5LSFHFIkUuwQ==',1,'hcStRwD1jNpqAAgEdMUVpw==','2020-11-25 02:39:38.749','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36 Edg/87.0.664.41','user',NULL),
('WlYotSBTGYCRikxFti0aOA==',1,'TAcjKU8t0YfV9NORzN1kqQ==','2020-11-23 23:27:28.550','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36 OPR/72.0.3815.320','manager',NULL),
('w2M8kgKp8PKtEdj30+7crQ==',1,'atrDYrtYB8OCEy8BsymfcQ==','2020-11-19 19:41:05.671','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36','admin',NULL),
('xIze1UJoISX4R0ym+Y3mkg==',1,'5SvLzV5Kgdv0r22Ts8hYdQ==','2020-11-23 23:57:50.942','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36','admin',NULL);

/*Table structure for table `ACT_ID_USER` */

DROP TABLE IF EXISTS `ACT_ID_USER`;

CREATE TABLE `ACT_ID_USER` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DISPLAY_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_ID_USER` */

insert  into `ACT_ID_USER`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`DISPLAY_NAME_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`,`TENANT_ID_`) values 
('SRV-TestAdmin.ADD',1,'Test','Administrator',NULL,'SRV-TestAdmin.ADD@deltaww.com','2wsx!QAZ',NULL,NULL),
('admin',2,'admin','delta',NULL,'admin@flowable.com','test',NULL,NULL),
('ceo',2,'ceo','delta',NULL,'ceo@flowable.com','test',NULL,NULL),
('employee',2,'employee','delta',NULL,'employee@flowable.com','test',NULL,NULL),
('manager',2,'manager','delta',NULL,'manager@flowable.com','test',NULL,NULL),
('user',2,'user','delta',NULL,'user@flowable.com','test',NULL,NULL);

/*Table structure for table `ACT_PROCDEF_INFO` */

DROP TABLE IF EXISTS `ACT_PROCDEF_INFO`;

CREATE TABLE `ACT_PROCDEF_INFO` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_PROCDEF_INFO` */

/*Table structure for table `ACT_RE_DEPLOYMENT` */

DROP TABLE IF EXISTS `ACT_RE_DEPLOYMENT`;

CREATE TABLE `ACT_RE_DEPLOYMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RE_DEPLOYMENT` */

insert  into `ACT_RE_DEPLOYMENT`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values 
('0022361f-2e08-11eb-bbd8-227918fa15ea','外出单',NULL,'out-factory','','2020-11-23 21:49:06.179',NULL,NULL,'0020fd9a-2e08-11eb-bbd8-227918fa15ea',NULL),
('2cbc1317-2d3d-11eb-a3a6-227918fa15ea','???',NULL,NULL,'','2020-11-22 21:37:13.170',NULL,NULL,'2cbc1317-2d3d-11eb-a3a6-227918fa15ea',NULL),
('59d51654-2bc9-11eb-9d15-227918fa15ea','外出单',NULL,'out-factory','','2020-11-21 01:15:36.049',NULL,NULL,'59d4c82f-2bc9-11eb-9d15-227918fa15ea',NULL),
('5c0b5345-2d58-11eb-b88c-227918fa15ea','返廠申請單',NULL,'rehire-form','','2020-11-23 00:51:48.955',NULL,NULL,'5c0ab700-2d58-11eb-b88c-227918fa15ea',NULL),
('6748cd32-2bc8-11eb-9d15-227918fa15ea','外出单',NULL,'out-factory','','2020-11-21 01:08:49.121',NULL,NULL,'6747bbbd-2bc8-11eb-9d15-227918fa15ea',NULL),
('6d8cddab-2e03-11eb-8edb-227918fa15ea','外出单',NULL,'out-factory','','2020-11-23 21:16:22.266',NULL,NULL,'6d8b08e6-2e03-11eb-8edb-227918fa15ea',NULL),
('78512f99-2e06-11eb-84ba-227918fa15ea','外出单',NULL,'out-factory','','2020-11-23 21:38:08.820',NULL,NULL,'784ff714-2e06-11eb-84ba-227918fa15ea',NULL),
('9c68405d-2d55-11eb-b88c-227918fa15ea','MES需求变更',NULL,'mes-requirement','','2020-11-23 00:32:08.448',NULL,NULL,'9c6707d8-2d55-11eb-b88c-227918fa15ea',NULL),
('9f32daaa-2e0b-11eb-b42b-227918fa15ea','外出单',NULL,'out-factory','','2020-11-23 22:15:01.536',NULL,NULL,'9f3105e5-2e0b-11eb-b42b-227918fa15ea',NULL),
('a63745e4-2e00-11eb-8699-227918fa15ea','外出单',NULL,'out-factory','','2020-11-23 20:56:28.845',NULL,NULL,'a6360d5f-2e00-11eb-8699-227918fa15ea',NULL),
('a83f9a9f-2d56-11eb-b88c-227918fa15ea','联络单',NULL,'liaison','','2020-11-23 00:39:37.811',NULL,NULL,'a83efe5a-2d56-11eb-b88c-227918fa15ea',NULL),
('be835938-2d29-11eb-b92b-227918fa15ea','发送邮件',NULL,'send-email','','2020-11-22 19:18:07.812',NULL,NULL,'be8247c4-2d29-11eb-b92b-227918fa15ea',NULL),
('ce86aff3-2d57-11eb-b88c-227918fa15ea','FI厂商代码申请单',NULL,'vendor-code-request-form','','2020-11-23 00:47:51.527',NULL,NULL,'ce8661ce-2d57-11eb-b88c-227918fa15ea',NULL),
('d507c502-2d28-11eb-9045-227918fa15ea','发送邮件',NULL,'send-email','','2020-11-22 19:11:36.093',NULL,NULL,'d4fc7a5e-2d28-11eb-9045-227918fa15ea',NULL),
('f1bf70e4-2d24-11eb-84d4-227918fa15ea','发送邮件',NULL,'send-email','','2020-11-22 18:43:46.286',NULL,NULL,'f1be3860-2d24-11eb-84d4-227918fa15ea',NULL),
('faa37fb9-2d29-11eb-9782-227918fa15ea','发送邮件',NULL,'send-email','','2020-11-22 19:19:48.686',NULL,NULL,'faa1aaf5-2d29-11eb-9782-227918fa15ea',NULL),
('fcbd1e55-2bcb-11eb-9e90-227918fa15ea','外出单',NULL,'out-factory','','2020-11-21 01:34:28.354',NULL,NULL,'fcbc33f0-2bcb-11eb-9e90-227918fa15ea',NULL);

/*Table structure for table `ACT_RE_MODEL` */

DROP TABLE IF EXISTS `ACT_RE_MODEL`;

CREATE TABLE `ACT_RE_MODEL` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RE_MODEL` */

/*Table structure for table `ACT_RE_PROCDEF` */

DROP TABLE IF EXISTS `ACT_RE_PROCDEF`;

CREATE TABLE `ACT_RE_PROCDEF` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_VERSION_` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`DERIVED_VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RE_PROCDEF` */

insert  into `ACT_RE_PROCDEF`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values 
('liaison:1:a866aaa2-2d56-11eb-b88c-227918fa15ea',3,'自定义流程表单','联络单','liaison',1,'a83f9a9f-2d56-11eb-b88c-227918fa15ea','liaison.bpmn','liaison.liaison.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('mes-requirement:1:9ca6d000-2d55-11eb-b88c-227918fa15ea',2,'自定义流程表单','MES需求变更','mes-requirement',1,'9c68405d-2d55-11eb-b88c-227918fa15ea','mes-requirement.bpmn','mes-requirement.mes-requirement.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('out-factory:1:678dc575-2bc8-11eb-9d15-227918fa15ea',1,'http://www.flowable.org/processdef','外出单','out-factory',1,'6748cd32-2bc8-11eb-9d15-227918fa15ea','out-factory.bpmn','out-factory.out-factory.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('out-factory:2:59f74457-2bc9-11eb-9d15-227918fa15ea',1,'http://www.flowable.org/processdef','外出单','out-factory',2,'59d51654-2bc9-11eb-9d15-227918fa15ea','out-factory.bpmn','out-factory.out-factory.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('out-factory:3:fcf40cd8-2bcb-11eb-9e90-227918fa15ea',1,'http://www.flowable.org/processdef','外出单','out-factory',3,'fcbd1e55-2bcb-11eb-9e90-227918fa15ea','out-factory.bpmn','out-factory.out-factory.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('out-factory:4:2d2b9dca-2d3d-11eb-a3a6-227918fa15ea',2,'固定流程表单','外出单','out-factory',4,'2cbc1317-2d3d-11eb-a3a6-227918fa15ea','???.bpmn20.xml','???.out-factory.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('out-factory:5:a68b8067-2e00-11eb-8699-227918fa15ea',2,'固定流程表单','外出单','out-factory',5,'a63745e4-2e00-11eb-8699-227918fa15ea','out-factory.bpmn','out-factory.out-factory.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea',1,'http://www.flowable.org/processdef','外出单','out-factory',6,'6d8cddab-2e03-11eb-8edb-227918fa15ea','out-factory.bpmn','out-factory.out-factory.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea',1,'http://www.flowable.org/processdef','外出单','out-factory',7,'78512f99-2e06-11eb-84ba-227918fa15ea','out-factory.bpmn','out-factory.out-factory.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('out-factory:8:00860102-2e08-11eb-bbd8-227918fa15ea',2,'固定流程表单','外出单','out-factory',8,'0022361f-2e08-11eb-bbd8-227918fa15ea','out-factory.bpmn','out-factory.out-factory.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea',2,'固定流程表单','外出单','out-factory',9,'9f32daaa-2e0b-11eb-b42b-227918fa15ea','out-factory.bpmn','out-factory.out-factory.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('rehire-form:1:5c2e1d88-2d58-11eb-b88c-227918fa15ea',3,'多部门参与表单','返廠申請單','rehire-form',1,'5c0b5345-2d58-11eb-b88c-227918fa15ea','rehire-form.bpmn','rehire-form.rehire-form.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('send-email:1:f20860c7-2d24-11eb-84d4-227918fa15ea',1,'http://www.flowable.org/processdef','发送邮件','send-email',1,'f1bf70e4-2d24-11eb-84d4-227918fa15ea','send-email.bpmn','send-email.send-email.png',NULL,0,1,1,'',NULL,NULL,NULL,0),
('send-email:2:d555e505-2d28-11eb-9045-227918fa15ea',1,'http://www.flowable.org/processdef','发送邮件','send-email',2,'d507c502-2d28-11eb-9045-227918fa15ea','send-email.bpmn','send-email.send-email.png',NULL,0,1,1,'',NULL,NULL,NULL,0),
('send-email:3:beec543b-2d29-11eb-b92b-227918fa15ea',1,'http://www.flowable.org/processdef','发送邮件','send-email',3,'be835938-2d29-11eb-b92b-227918fa15ea','send-email.bpmn','send-email.send-email.png',NULL,0,1,1,'',NULL,NULL,NULL,0),
('send-email:4:faff826c-2d29-11eb-9782-227918fa15ea',1,'http://www.flowable.org/processdef','发送邮件','send-email',4,'faa37fb9-2d29-11eb-9782-227918fa15ea','send-email.bpmn','send-email.send-email.png',NULL,0,1,1,'',NULL,NULL,NULL,0),
('vendor-code-request-form:1:ceaa3d86-2d57-11eb-b88c-227918fa15ea',3,'涉及权限表单','FI廠商代碼申請單','vendor-code-request-form',1,'ce86aff3-2d57-11eb-b88c-227918fa15ea','vendor-code-request-form.bpmn','vendor-code-request-form.vendor-code-request-form.png',NULL,1,1,1,'',NULL,NULL,NULL,0);

/*Table structure for table `ACT_RU_ACTINST` */

DROP TABLE IF EXISTS `ACT_RU_ACTINST`;

CREATE TABLE `ACT_RU_ACTINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `TRANSACTION_ORDER_` int DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_ACTI_START` (`START_TIME_`),
  KEY `ACT_IDX_RU_ACTI_END` (`END_TIME_`),
  KEY `ACT_IDX_RU_ACTI_PROC` (`PROC_INST_ID_`),
  KEY `ACT_IDX_RU_ACTI_PROC_ACT` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_RU_ACTI_EXEC` (`EXECUTION_ID_`),
  KEY `ACT_IDX_RU_ACTI_EXEC_ACT` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_ACTINST` */

insert  into `ACT_RU_ACTINST`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values 
('3b43120c-2e04-11eb-8e8e-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','3b4275c5-2e04-11eb-8e8e-227918fa15ea','3b43120b-2e04-11eb-8e8e-227918fa15ea','startEvent1',NULL,NULL,'填单','startEvent',NULL,'2020-11-23 21:22:07.393','2020-11-23 21:22:07.409',16,1,NULL,''),
('3b45830f-2e04-11eb-8e8e-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','3b4275c5-2e04-11eb-8e8e-227918fa15ea','3b43120b-2e04-11eb-8e8e-227918fa15ea','sid-FB957372-CC09-424B-88F0-30C09C3C100F',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-23 21:22:07.409','2020-11-23 21:22:07.409',0,2,NULL,''),
('3b458310-2e04-11eb-8e8e-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','3b4275c5-2e04-11eb-8e8e-227918fa15ea','3b43120b-2e04-11eb-8e8e-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','3b4b7581-2e04-11eb-8e8e-227918fa15ea',NULL,'申请人确认','userTask','admin','2020-11-23 21:22:07.409',NULL,NULL,3,NULL,''),
('a43f984c-2e04-11eb-b39c-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','a43e38b5-2e04-11eb-b39c-227918fa15ea','a43f713b-2e04-11eb-b39c-227918fa15ea','startEvent1',NULL,NULL,'填单','startEvent',NULL,'2020-11-23 21:25:03.531','2020-11-23 21:25:03.544',13,1,NULL,''),
('a442094f-2e04-11eb-b39c-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','a43e38b5-2e04-11eb-b39c-227918fa15ea','a43f713b-2e04-11eb-b39c-227918fa15ea','sid-FB957372-CC09-424B-88F0-30C09C3C100F',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-23 21:25:03.547','2020-11-23 21:25:03.547',0,2,NULL,''),
('a4420950-2e04-11eb-b39c-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','a43e38b5-2e04-11eb-b39c-227918fa15ea','a43f713b-2e04-11eb-b39c-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','a44ae2f1-2e04-11eb-b39c-227918fa15ea',NULL,'申请人确认','userTask','admin','2020-11-23 21:25:03.547',NULL,NULL,3,NULL,''),
('df3615e5-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea','startEvent1',NULL,NULL,'填单','startEvent',NULL,'2020-11-25 02:40:29.153','2020-11-25 02:40:29.163',10,1,NULL,''),
('df37eaa8-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea','sid-FB957372-CC09-424B-88F0-30C09C3C100F',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-25 02:40:29.166','2020-11-25 02:40:29.166',0,2,NULL,''),
('df3811b9-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','df3db70a-2ef9-11eb-aabd-227918fa15ea',NULL,'申请人确认','userTask',NULL,'2020-11-25 02:40:29.166','2020-11-25 02:40:29.205',39,3,NULL,''),
('df3e052b-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea','sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-25 02:40:29.205','2020-11-25 02:40:29.205',0,4,NULL,''),
('df3e052c-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea','sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175','df3e2c3d-2ef9-11eb-aabd-227918fa15ea',NULL,'主管审核','userTask','manager','2020-11-25 02:40:29.205',NULL,NULL,5,NULL,''),
('f260e631-2e06-11eb-bbd8-227918fa15ea',1,'out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea','f25f869a-2e06-11eb-bbd8-227918fa15ea','f260e630-2e06-11eb-bbd8-227918fa15ea','startEvent1',NULL,NULL,'填单','startEvent',NULL,'2020-11-23 21:41:33.606','2020-11-23 21:41:33.617',11,1,NULL,''),
('f2637e44-2e06-11eb-bbd8-227918fa15ea',1,'out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea','f25f869a-2e06-11eb-bbd8-227918fa15ea','f260e630-2e06-11eb-bbd8-227918fa15ea','sid-FB957372-CC09-424B-88F0-30C09C3C100F',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-23 21:41:33.622','2020-11-23 21:41:33.622',0,2,NULL,''),
('f2637e45-2e06-11eb-bbd8-227918fa15ea',1,'out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea','f25f869a-2e06-11eb-bbd8-227918fa15ea','f260e630-2e06-11eb-bbd8-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','f2692396-2e06-11eb-bbd8-227918fa15ea',NULL,'申请人确认','userTask','admin','2020-11-23 21:41:33.622',NULL,NULL,3,NULL,''),
('f87f6b35-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea','startEvent1',NULL,NULL,'填单','startEvent',NULL,'2020-11-23 22:17:31.355','2020-11-23 22:17:31.368',13,1,NULL,''),
('f881b528-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea','sid-FB957372-CC09-424B-88F0-30C09C3C100F',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-23 22:17:31.370','2020-11-23 22:17:31.370',0,2,NULL,''),
('f881b529-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','f885d3da-2e0b-11eb-b5e4-227918fa15ea',NULL,'申请人确认','userTask',NULL,'2020-11-23 22:17:31.370','2020-11-23 22:17:31.398',28,3,NULL,''),
('f885faeb-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea','sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-23 22:17:31.398','2020-11-23 22:17:31.398',0,4,NULL,''),
('f885faec-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea','sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175','f88621fd-2e0b-11eb-b5e4-227918fa15ea',NULL,'主管审核','userTask','manager','2020-11-23 22:17:31.398',NULL,NULL,5,NULL,'');

/*Table structure for table `ACT_RU_DEADLETTER_JOB` */

DROP TABLE IF EXISTS `ACT_RU_DEADLETTER_JOB`;

CREATE TABLE `ACT_RU_DEADLETTER_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_DJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_DEADLETTER_JOB` */

/*Table structure for table `ACT_RU_ENTITYLINK` */

DROP TABLE IF EXISTS `ACT_RU_ENTITYLINK`;

CREATE TABLE `ACT_RU_ENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_ROOT_SCOPE` (`ROOT_SCOPE_ID_`,`ROOT_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_ENTITYLINK` */

/*Table structure for table `ACT_RU_EVENT_SUBSCR` */

DROP TABLE IF EXISTS `ACT_RU_EVENT_SUBSCR`;

CREATE TABLE `ACT_RU_EVENT_SUBSCR` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_EVENT_SUBSCR` */

/*Table structure for table `ACT_RU_EXECUTION` */

DROP TABLE IF EXISTS `ACT_RU_EXECUTION`;

CREATE TABLE `ACT_RU_EXECUTION` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint DEFAULT NULL,
  `IS_CONCURRENT_` tinyint DEFAULT NULL,
  `IS_SCOPE_` tinyint DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint DEFAULT NULL,
  `IS_MI_ROOT_` tinyint DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `CACHED_ENT_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int DEFAULT NULL,
  `TASK_COUNT_` int DEFAULT NULL,
  `JOB_COUNT_` int DEFAULT NULL,
  `TIMER_JOB_COUNT_` int DEFAULT NULL,
  `SUSP_JOB_COUNT_` int DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int DEFAULT NULL,
  `EXTERNAL_WORKER_JOB_COUNT_` int DEFAULT NULL,
  `VAR_COUNT_` int DEFAULT NULL,
  `ID_LINK_COUNT_` int DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_EXECUTION` */

insert  into `ACT_RU_EXECUTION`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`) values 
('3b4275c5-2e04-11eb-8e8e-227918fa15ea',1,'3b4275c5-2e04-11eb-8e8e-227918fa15ea',NULL,NULL,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea',NULL,'3b4275c5-2e04-11eb-8e8e-227918fa15ea',NULL,1,0,1,0,0,1,NULL,'','外出单 - November 24th 2020','startEvent1','2020-11-23 21:22:07.389','admin',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
('3b43120b-2e04-11eb-8e8e-227918fa15ea',1,'3b4275c5-2e04-11eb-8e8e-227918fa15ea',NULL,'3b4275c5-2e04-11eb-8e8e-227918fa15ea','out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea',NULL,'3b4275c5-2e04-11eb-8e8e-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB',1,0,0,0,0,1,NULL,'',NULL,NULL,'2020-11-23 21:22:07.393',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
('a43e38b5-2e04-11eb-b39c-227918fa15ea',1,'a43e38b5-2e04-11eb-b39c-227918fa15ea',NULL,NULL,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea',NULL,'a43e38b5-2e04-11eb-b39c-227918fa15ea',NULL,1,0,1,0,0,1,NULL,'','外出单-2020 11 24','startEvent1','2020-11-23 21:25:03.522','admin',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
('a43f713b-2e04-11eb-b39c-227918fa15ea',1,'a43e38b5-2e04-11eb-b39c-227918fa15ea',NULL,'a43e38b5-2e04-11eb-b39c-227918fa15ea','out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea',NULL,'a43e38b5-2e04-11eb-b39c-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB',1,0,0,0,0,1,NULL,'',NULL,NULL,'2020-11-23 21:25:03.530',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
('df35046b-2ef9-11eb-aabd-227918fa15ea',1,'df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,NULL,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea',NULL,'df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,1,0,1,0,0,1,NULL,'','外出单-2020 11 25','startEvent1','2020-11-25 02:40:29.146','user',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
('df3615e4-2ef9-11eb-aabd-227918fa15ea',1,'df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,'df35046b-2ef9-11eb-aabd-227918fa15ea','out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea',NULL,'df35046b-2ef9-11eb-aabd-227918fa15ea','sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175',1,0,0,0,0,1,NULL,'',NULL,NULL,'2020-11-25 02:40:29.153',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
('f25f869a-2e06-11eb-bbd8-227918fa15ea',1,'f25f869a-2e06-11eb-bbd8-227918fa15ea',NULL,NULL,'out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea',NULL,'f25f869a-2e06-11eb-bbd8-227918fa15ea',NULL,1,0,1,0,0,1,NULL,'','外出单-2020 11 24','startEvent1','2020-11-23 21:41:33.596','admin',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
('f260e630-2e06-11eb-bbd8-227918fa15ea',1,'f25f869a-2e06-11eb-bbd8-227918fa15ea',NULL,'f25f869a-2e06-11eb-bbd8-227918fa15ea','out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea',NULL,'f25f869a-2e06-11eb-bbd8-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB',1,0,0,0,0,1,NULL,'',NULL,NULL,'2020-11-23 21:41:33.605',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
('f87e80cb-2e0b-11eb-b5e4-227918fa15ea',1,'f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,NULL,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea',NULL,'f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,1,0,1,0,0,1,NULL,'','外出单-2020 11 24','startEvent1','2020-11-23 22:17:31.349','admin',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
('f87f6b34-2e0b-11eb-b5e4-227918fa15ea',1,'f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,'f87e80cb-2e0b-11eb-b5e4-227918fa15ea','out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea',NULL,'f87e80cb-2e0b-11eb-b5e4-227918fa15ea','sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175',1,0,0,0,0,1,NULL,'',NULL,NULL,'2020-11-23 22:17:31.354',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `ACT_RU_EXTERNAL_JOB` */

DROP TABLE IF EXISTS `ACT_RU_EXTERNAL_JOB`;

CREATE TABLE `ACT_RU_EXTERNAL_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXTERNAL_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_EXTERNAL_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_EXTERNAL_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_EJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_EJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_EJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  CONSTRAINT `ACT_FK_EXTERNAL_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_EXTERNAL_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_EXTERNAL_JOB` */

/*Table structure for table `ACT_RU_HISTORY_JOB` */

DROP TABLE IF EXISTS `ACT_RU_HISTORY_JOB`;

CREATE TABLE `ACT_RU_HISTORY_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_HISTORY_JOB` */

/*Table structure for table `ACT_RU_IDENTITYLINK` */

DROP TABLE IF EXISTS `ACT_RU_IDENTITYLINK`;

CREATE TABLE `ACT_RU_IDENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_IDENT_LNK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `ACT_RU_TASK` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_IDENTITYLINK` */

insert  into `ACT_RU_IDENTITYLINK`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values 
('3b4275c7-2e04-11eb-8e8e-227918fa15ea',1,NULL,'starter','admin',NULL,'3b4275c5-2e04-11eb-8e8e-227918fa15ea',NULL,NULL,NULL,NULL,NULL),
('3b4d4a43-2e04-11eb-8e8e-227918fa15ea',1,NULL,'participant','admin',NULL,'3b4275c5-2e04-11eb-8e8e-227918fa15ea',NULL,NULL,NULL,NULL,NULL),
('a43efc07-2e04-11eb-b39c-227918fa15ea',1,NULL,'starter','admin',NULL,'a43e38b5-2e04-11eb-b39c-227918fa15ea',NULL,NULL,NULL,NULL,NULL),
('a44cb7b3-2e04-11eb-b39c-227918fa15ea',1,NULL,'participant','admin',NULL,'a43e38b5-2e04-11eb-b39c-227918fa15ea',NULL,NULL,NULL,NULL,NULL),
('df35799d-2ef9-11eb-aabd-227918fa15ea',1,NULL,'starter','user',NULL,'df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,NULL,NULL,NULL,NULL),
('df3e534f-2ef9-11eb-aabd-227918fa15ea',1,NULL,'participant','manager',NULL,'df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,NULL,NULL,NULL,NULL),
('f26049ec-2e06-11eb-bbd8-227918fa15ea',1,NULL,'starter','admin',NULL,'f25f869a-2e06-11eb-bbd8-227918fa15ea',NULL,NULL,NULL,NULL,NULL),
('f26a5c18-2e06-11eb-bbd8-227918fa15ea',1,NULL,'participant','admin',NULL,'f25f869a-2e06-11eb-bbd8-227918fa15ea',NULL,NULL,NULL,NULL,NULL),
('f87ef5fd-2e0b-11eb-b5e4-227918fa15ea',1,NULL,'starter','admin',NULL,'f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,NULL,NULL,NULL,NULL),
('f886490f-2e0b-11eb-b5e4-227918fa15ea',1,NULL,'participant','manager',NULL,'f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `ACT_RU_JOB` */

DROP TABLE IF EXISTS `ACT_RU_JOB`;

CREATE TABLE `ACT_RU_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_JOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_JOB` */

/*Table structure for table `ACT_RU_SUSPENDED_JOB` */

DROP TABLE IF EXISTS `ACT_RU_SUSPENDED_JOB`;

CREATE TABLE `ACT_RU_SUSPENDED_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_SJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_SUSPENDED_JOB` */

/*Table structure for table `ACT_RU_TASK` */

DROP TABLE IF EXISTS `ACT_RU_TASK`;

CREATE TABLE `ACT_RU_TASK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint DEFAULT NULL,
  `VAR_COUNT_` int DEFAULT NULL,
  `ID_LINK_COUNT_` int DEFAULT NULL,
  `SUB_TASK_COUNT_` int DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_IDX_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_TASK` */

insert  into `ACT_RU_TASK`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`,`IS_COUNT_ENABLED_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`SUB_TASK_COUNT_`) values 
('3b4b7581-2e04-11eb-8e8e-227918fa15ea',1,'3b43120b-2e04-11eb-8e8e-227918fa15ea','3b4275c5-2e04-11eb-8e8e-227918fa15ea','out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,'申请人确认',NULL,NULL,'sid-E086BDD7-66B2-409F-B18C-B682DD9172DB',NULL,'admin',NULL,50,'2020-11-23 21:22:07.409','2020-11-29 05:22:07.460',NULL,1,'','out-factory',NULL,1,0,0,0),
('a44ae2f1-2e04-11eb-b39c-227918fa15ea',1,'a43f713b-2e04-11eb-b39c-227918fa15ea','a43e38b5-2e04-11eb-b39c-227918fa15ea','out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,'申请人确认',NULL,NULL,'sid-E086BDD7-66B2-409F-B18C-B682DD9172DB',NULL,'admin',NULL,50,'2020-11-23 21:25:03.547','2020-11-29 05:25:03.618',NULL,1,'','out-factory',NULL,1,0,0,0),
('df3e2c3d-2ef9-11eb-aabd-227918fa15ea',1,'df3615e4-2ef9-11eb-aabd-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea','out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,'主管审核',NULL,NULL,'sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175',NULL,'manager',NULL,50,'2020-11-25 02:40:29.205','2020-11-30 10:40:29.213',NULL,1,'','out-factory',NULL,1,0,0,0),
('f2692396-2e06-11eb-bbd8-227918fa15ea',1,'f260e630-2e06-11eb-bbd8-227918fa15ea','f25f869a-2e06-11eb-bbd8-227918fa15ea','out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,'申请人确认',NULL,NULL,'sid-E086BDD7-66B2-409F-B18C-B682DD9172DB',NULL,'admin',NULL,50,'2020-11-23 21:41:33.622','2020-11-29 05:41:33.667',NULL,1,'','out-factory',NULL,1,0,0,0),
('f88621fd-2e0b-11eb-b5e4-227918fa15ea',1,'f87f6b34-2e0b-11eb-b5e4-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,'主管审核',NULL,NULL,'sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175',NULL,'manager',NULL,50,'2020-11-23 22:17:31.399','2020-11-29 06:17:31.405',NULL,1,'','out-factory',NULL,1,0,0,0);

/*Table structure for table `ACT_RU_TIMER_JOB` */

DROP TABLE IF EXISTS `ACT_RU_TIMER_JOB`;

CREATE TABLE `ACT_RU_TIMER_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_TIMER_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_TJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_TIMER_JOB` */

/*Table structure for table `ACT_RU_VARIABLE` */

DROP TABLE IF EXISTS `ACT_RU_VARIABLE`;

CREATE TABLE `ACT_RU_VARIABLE` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_RU_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_VARIABLE` */

insert  into `ACT_RU_VARIABLE`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values 
('3b4275c6-2e04-11eb-8e8e-227918fa15ea',1,'string','initiator','3b4275c5-2e04-11eb-8e8e-227918fa15ea','3b4275c5-2e04-11eb-8e8e-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL),
('3b431208-2e04-11eb-8e8e-227918fa15ea',1,'string','summary','3b4275c5-2e04-11eb-8e8e-227918fa15ea','3b4275c5-2e04-11eb-8e8e-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'23333',NULL),
('3b431209-2e04-11eb-8e8e-227918fa15ea',1,'long','empid','3b4275c5-2e04-11eb-8e8e-227918fa15ea','3b4275c5-2e04-11eb-8e8e-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,322,'322',NULL),
('3b43120a-2e04-11eb-8e8e-227918fa15ea',1,'string','description','3b4275c5-2e04-11eb-8e8e-227918fa15ea','3b4275c5-2e04-11eb-8e8e-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22222232',NULL),
('a43e38b6-2e04-11eb-b39c-227918fa15ea',1,'string','initiator','a43e38b5-2e04-11eb-b39c-227918fa15ea','a43e38b5-2e04-11eb-b39c-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL),
('a43f4a28-2e04-11eb-b39c-227918fa15ea',1,'string','summary','a43e38b5-2e04-11eb-b39c-227918fa15ea','a43e38b5-2e04-11eb-b39c-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'test',NULL),
('a43f4a29-2e04-11eb-b39c-227918fa15ea',1,'long','empid','a43e38b5-2e04-11eb-b39c-227918fa15ea','a43e38b5-2e04-11eb-b39c-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,222,'222',NULL),
('a43f4a2a-2e04-11eb-b39c-227918fa15ea',1,'string','description','a43e38b5-2e04-11eb-b39c-227918fa15ea','a43e38b5-2e04-11eb-b39c-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'    222222222222222222',NULL),
('df35046c-2ef9-11eb-aabd-227918fa15ea',1,'string','initiator','df35046b-2ef9-11eb-aabd-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'user',NULL),
('df35a0ae-2ef9-11eb-aabd-227918fa15ea',1,'string','summary','df35046b-2ef9-11eb-aabd-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'summary',NULL),
('df35c7bf-2ef9-11eb-aabd-227918fa15ea',1,'long','empid','df35046b-2ef9-11eb-aabd-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,33333,'33333',NULL),
('df35c7c0-2ef9-11eb-aabd-227918fa15ea',1,'boolean','_FLOWABLE_SKIP_EXPRESSION_ENABLED','df35046b-2ef9-11eb-aabd-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),
('df35c7c1-2ef9-11eb-aabd-227918fa15ea',1,'string','manager','df35046b-2ef9-11eb-aabd-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'manager',NULL),
('df35c7c2-2ef9-11eb-aabd-227918fa15ea',1,'string','description','df35046b-2ef9-11eb-aabd-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'    3333333333333',NULL),
('df35c7c3-2ef9-11eb-aabd-227918fa15ea',1,'boolean','skip','df35046b-2ef9-11eb-aabd-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),
('f25f869b-2e06-11eb-bbd8-227918fa15ea',1,'string','initiator','f25f869a-2e06-11eb-bbd8-227918fa15ea','f25f869a-2e06-11eb-bbd8-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL),
('f260980d-2e06-11eb-bbd8-227918fa15ea',1,'string','summary','f25f869a-2e06-11eb-bbd8-227918fa15ea','f25f869a-2e06-11eb-bbd8-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'summary',NULL),
('f260bf1e-2e06-11eb-bbd8-227918fa15ea',1,'long','empid','f25f869a-2e06-11eb-bbd8-227918fa15ea','f25f869a-2e06-11eb-bbd8-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,2222,'2222',NULL),
('f260bf1f-2e06-11eb-bbd8-227918fa15ea',1,'string','description','f25f869a-2e06-11eb-bbd8-227918fa15ea','f25f869a-2e06-11eb-bbd8-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'    22222222222222222222',NULL),
('f87ea7dc-2e0b-11eb-b5e4-227918fa15ea',1,'string','initiator','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL),
('f87f1d0e-2e0b-11eb-b5e4-227918fa15ea',1,'string','summary','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'summary',NULL),
('f87f441f-2e0b-11eb-b5e4-227918fa15ea',1,'long','empid','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,123123,'123123',NULL),
('f87f4420-2e0b-11eb-b5e4-227918fa15ea',1,'boolean','_FLOWABLE_SKIP_EXPRESSION_ENABLED','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),
('f87f4421-2e0b-11eb-b5e4-227918fa15ea',1,'string','manager','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'manager',NULL),
('f87f4422-2e0b-11eb-b5e4-227918fa15ea',1,'string','description','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'    21313213',NULL),
('f87f4423-2e0b-11eb-b5e4-227918fa15ea',1,'boolean','skip','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL);

/*Table structure for table `FLW_CHANNEL_DEFINITION` */

DROP TABLE IF EXISTS `FLW_CHANNEL_DEFINITION`;

CREATE TABLE `FLW_CHANNEL_DEFINITION` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_CHANNEL_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `FLW_CHANNEL_DEFINITION` */

/*Table structure for table `FLW_EVENT_DEFINITION` */

DROP TABLE IF EXISTS `FLW_EVENT_DEFINITION`;

CREATE TABLE `FLW_EVENT_DEFINITION` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_EVENT_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `FLW_EVENT_DEFINITION` */

/*Table structure for table `FLW_EVENT_DEPLOYMENT` */

DROP TABLE IF EXISTS `FLW_EVENT_DEPLOYMENT`;

CREATE TABLE `FLW_EVENT_DEPLOYMENT` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `FLW_EVENT_DEPLOYMENT` */

/*Table structure for table `FLW_EVENT_RESOURCE` */

DROP TABLE IF EXISTS `FLW_EVENT_RESOURCE`;

CREATE TABLE `FLW_EVENT_RESOURCE` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `FLW_EVENT_RESOURCE` */

/*Table structure for table `FLW_EV_DATABASECHANGELOG` */

DROP TABLE IF EXISTS `FLW_EV_DATABASECHANGELOG`;

CREATE TABLE `FLW_EV_DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `FLW_EV_DATABASECHANGELOG` */

insert  into `FLW_EV_DATABASECHANGELOG`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values 
('1','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2020-11-20 09:29:30',1,'EXECUTED','8:1b0c48c9cf7945be799d868a2626d687','createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...','',NULL,'3.10.3',NULL,NULL,'5835772068');

/*Table structure for table `FLW_EV_DATABASECHANGELOGLOCK` */

DROP TABLE IF EXISTS `FLW_EV_DATABASECHANGELOGLOCK`;

CREATE TABLE `FLW_EV_DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `FLW_EV_DATABASECHANGELOGLOCK` */

insert  into `FLW_EV_DATABASECHANGELOGLOCK`(`ID`,`LOCKED`,`LOCKGRANTED`,`LOCKEDBY`) values 
(1,'\0',NULL,NULL);

/*Table structure for table `FLW_RU_BATCH` */

DROP TABLE IF EXISTS `FLW_RU_BATCH`;

CREATE TABLE `FLW_RU_BATCH` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin NOT NULL,
  `SEARCH_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) DEFAULT NULL,
  `STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BATCH_DOC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `FLW_RU_BATCH` */

/*Table structure for table `FLW_RU_BATCH_PART` */

DROP TABLE IF EXISTS `FLW_RU_BATCH_PART`;

CREATE TABLE `FLW_RU_BATCH_PART` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `BATCH_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin NOT NULL,
  `SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) DEFAULT NULL,
  `STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESULT_DOC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `FLW_IDX_BATCH_PART` (`BATCH_ID_`),
  CONSTRAINT `FLW_FK_BATCH_PART_PARENT` FOREIGN KEY (`BATCH_ID_`) REFERENCES `FLW_RU_BATCH` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `FLW_RU_BATCH_PART` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
