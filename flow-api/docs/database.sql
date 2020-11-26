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
('0021c0ee-2e08-11eb-bbd8-227918fa15ea',1,'å¤–å‡ºå•','out-factory',7,NULL,'0020fd9a-2e08-11eb-bbd8-227918fa15ea','out-factory.app','',''),
('59d4ef43-2bc9-11eb-9d15-227918fa15ea',1,'å¤–å‡ºå•','out-factory',2,NULL,'59d4c82f-2bc9-11eb-9d15-227918fa15ea','out-factory.app','',''),
('5c0b5344-2d58-11eb-b88c-227918fa15ea',1,'è¿”å» ç”³è«‹å–®','rehire-form',1,NULL,'5c0ab700-2d58-11eb-b88c-227918fa15ea','rehire-form.app','',''),
('674830f1-2bc8-11eb-9d15-227918fa15ea',1,'å¤–å‡ºå•','out-factory',1,NULL,'6747bbbd-2bc8-11eb-9d15-227918fa15ea','out-factory.app','',''),
('6d8ba52a-2e03-11eb-8edb-227918fa15ea',1,'å¤–å‡ºå•','out-factory',5,NULL,'6d8b08e6-2e03-11eb-8edb-227918fa15ea','out-factory.app','',''),
('78509358-2e06-11eb-84ba-227918fa15ea',1,'å¤–å‡ºå•','out-factory',6,NULL,'784ff714-2e06-11eb-84ba-227918fa15ea','out-factory.app','',''),
('9c68405c-2d55-11eb-b88c-227918fa15ea',1,'MESéœ€æ±‚å˜æ›´','mes-requirement',1,NULL,'9c6707d8-2d55-11eb-b88c-227918fa15ea','mes-requirement.app','',''),
('9f323e69-2e0b-11eb-b42b-227918fa15ea',1,'å¤–å‡ºå•','out-factory',8,NULL,'9f3105e5-2e0b-11eb-b42b-227918fa15ea','out-factory.app','',''),
('a636a9a3-2e00-11eb-8699-227918fa15ea',1,'å¤–å‡ºå•','out-factory',4,NULL,'a6360d5f-2e00-11eb-8699-227918fa15ea','out-factory.app','',''),
('a83f9a9e-2d56-11eb-b88c-227918fa15ea',1,'è”ç»œå•','liaison',1,NULL,'a83efe5a-2d56-11eb-b88c-227918fa15ea','liaison.app','',''),
('be82bcf7-2d29-11eb-b92b-227918fa15ea',1,'å‘é€é‚®ä»¶','send-email',3,NULL,'be8247c4-2d29-11eb-b92b-227918fa15ea','send-email.app','',''),
('ce8688e2-2d57-11eb-b88c-227918fa15ea',1,'FIå‚å•†ä»£ç ç”³è¯·å•','vendor-code-request-form',1,NULL,'ce8661ce-2d57-11eb-b88c-227918fa15ea','vendor-code-request-form.app','',''),
('d4fd16a1-2d28-11eb-9045-227918fa15ea',1,'å‘é€é‚®ä»¶','send-email',2,NULL,'d4fc7a5e-2d28-11eb-9045-227918fa15ea','send-email.app','',''),
('f1be3863-2d24-11eb-84d4-227918fa15ea',1,'å‘é€é‚®ä»¶','send-email',1,NULL,'f1be3860-2d24-11eb-84d4-227918fa15ea','send-email.app','',''),
('faa2e378-2d29-11eb-9782-227918fa15ea',1,'å‘é€é‚®ä»¶','send-email',4,NULL,'faa1aaf5-2d29-11eb-9782-227918fa15ea','send-email.app','',''),
('fcbc8214-2bcb-11eb-9e90-227918fa15ea',1,'å¤–å‡ºå•','out-factory',3,NULL,'fcbc33f0-2bcb-11eb-9e90-227918fa15ea','out-factory.app','','');

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
('0020fd9a-2e08-11eb-bbd8-227918fa15ea','å¤–å‡ºå•',NULL,'out-factory','2020-11-23 21:49:06.171',''),
('59d4c82f-2bc9-11eb-9d15-227918fa15ea','å¤–å‡ºå•',NULL,'out-factory','2020-11-21 01:15:36.047',''),
('5c0ab700-2d58-11eb-b88c-227918fa15ea','è¿”å» ç”³è«‹å–®',NULL,'rehire-form','2020-11-23 00:51:48.951',''),
('6747bbbd-2bc8-11eb-9d15-227918fa15ea','å¤–å‡ºå•',NULL,'out-factory','2020-11-21 01:08:49.114',''),
('6d8b08e6-2e03-11eb-8edb-227918fa15ea','å¤–å‡ºå•',NULL,'out-factory','2020-11-23 21:16:22.254',''),
('784ff714-2e06-11eb-84ba-227918fa15ea','å¤–å‡ºå•',NULL,'out-factory','2020-11-23 21:38:08.812',''),
('9c6707d8-2d55-11eb-b88c-227918fa15ea','MESéœ€æ±‚å˜æ›´',NULL,'mes-requirement','2020-11-23 00:32:08.440',''),
('9f3105e5-2e0b-11eb-b42b-227918fa15ea','å¤–å‡ºå•',NULL,'out-factory','2020-11-23 22:15:01.524',''),
('a6360d5f-2e00-11eb-8699-227918fa15ea','å¤–å‡ºå•',NULL,'out-factory','2020-11-23 20:56:28.837',''),
('a83efe5a-2d56-11eb-b88c-227918fa15ea','è”ç»œå•',NULL,'liaison','2020-11-23 00:39:37.807',''),
('be8247c4-2d29-11eb-b92b-227918fa15ea','å‘é€é‚®ä»¶',NULL,'send-email','2020-11-22 19:18:07.805',''),
('ce8661ce-2d57-11eb-b88c-227918fa15ea','FIå‚å•†ä»£ç ç”³è¯·å•',NULL,'vendor-code-request-form','2020-11-23 00:47:51.525',''),
('d4fc7a5e-2d28-11eb-9045-227918fa15ea','å‘é€é‚®ä»¶',NULL,'send-email','2020-11-22 19:11:36.019',''),
('f1be3860-2d24-11eb-84d4-227918fa15ea','å‘é€é‚®ä»¶',NULL,'send-email','2020-11-22 18:43:46.278',''),
('faa1aaf5-2d29-11eb-9782-227918fa15ea','å‘é€é‚®ä»¶',NULL,'send-email','2020-11-22 19:19:48.674',''),
('fcbc33f0-2bcb-11eb-9e90-227918fa15ea','å¤–å‡ºå•',NULL,'out-factory','2020-11-21 01:34:28.348','');

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
('0020fd9b-2e08-11eb-bbd8-227918fa15ea','out-factory.bpmn','0020fd9a-2e08-11eb-bbd8-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"å¤–å‡ºå•\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"å¡«å•\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"ç”³è¯·äººç¡®è®¤\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${skip}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"ä¸»ç®¡å®¡æ ¸\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('0020fd9c-2e08-11eb-bbd8-227918fa15ea','out-factory.app','0020fd9a-2e08-11eb-bbd8-227918fa15ea','{\"key\":\"out-factory\",\"name\":\"å¤–å‡ºå•\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('0020fd9d-2e08-11eb-bbd8-227918fa15ea','form-out-factory.form','0020fd9a-2e08-11eb-bbd8-227918fa15ea','{\"name\":\"å¤–å‡ºå•\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"ä¸»æ—¨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"äººå‘˜ç¼–å·\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\",\"name\":\"å…è®¸è·³è¿‡\",\"type\":\"boolean\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"skip\",\"name\":\"æ˜¯å¦è·³è¿‡\",\"type\":\"boolean\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"æè¿°\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('59d4c830-2bc9-11eb-9d15-227918fa15ea','out-factory.bpmn','59d4c82f-2bc9-11eb-9d15-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"å¤–å‡ºå•\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"å¡«å•\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:formProperty id=\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\" name=\"FLOWABLE_SKIP_EXPRESSION_ENABLED\" type=\"boolean\" default=\"true\"></flowable:formProperty>\n        <flowable:formProperty id=\"manager\" name=\"æ‰€å±é¢†å¯¼\" type=\"string\" default=\"manager\"></flowable:formProperty>\n      </extensionElements>\n    </startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"ç”³è¯·äººç¡®è®¤\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${_FLOWABLE_SKIP_EXPRESSION_ENABLED==true}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"ä¸»ç®¡å®¡æ ¸\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('59d4c831-2bc9-11eb-9d15-227918fa15ea','out-factory.app','59d4c82f-2bc9-11eb-9d15-227918fa15ea','{\"key\":\"out-factory\",\"name\":\"å¤–å‡ºå•\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('59d4c832-2bc9-11eb-9d15-227918fa15ea','form-out-factory.form','59d4c82f-2bc9-11eb-9d15-227918fa15ea','{\"name\":\"å¤–å‡ºå•\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"ä¸»æ—¨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"äººå‘˜ç¼–å·\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"æè¿°\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('5c0ab701-2d58-11eb-b88c-227918fa15ea','rehire-form.bpmn','5c0ab700-2d58-11eb-b88c-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"rehire-form\" name=\"è¿”å» ç”³è«‹å–®\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" flowable:initiator=\"initiator\" flowable:formKey=\"rehire-form\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-345367B5-F2D6-40E7-A1B1-D802F28D51BD\" sourceRef=\"startEvent1\" targetRef=\"sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\"></sequenceFlow>\n    <endEvent id=\"sid-28104B17-66FC-492B-8654-D19352BABECE\"></endEvent>\n    <sequenceFlow id=\"sid-6A43BA7B-9987-46BC-AB2A-44F15554599B\" sourceRef=\"sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\" targetRef=\"sid-28104B17-66FC-492B-8654-D19352BABECE\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_rehire-form\">\n    <bpmndi:BPMNPlane bpmnElement=\"rehire-form\" id=\"BPMNPlane_rehire-form\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\" id=\"BPMNShape_sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-28104B17-66FC-492B-8654-D19352BABECE\" id=\"BPMNShape_sid-28104B17-66FC-492B-8654-D19352BABECE\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-6A43BA7B-9987-46BC-AB2A-44F15554599B\" id=\"BPMNEdge_sid-6A43BA7B-9987-46BC-AB2A-44F15554599B\">\n        <omgdi:waypoint x=\"274.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-345367B5-F2D6-40E7-A1B1-D802F28D51BD\" id=\"BPMNEdge_sid-345367B5-F2D6-40E7-A1B1-D802F28D51BD\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('5c0ab702-2d58-11eb-b88c-227918fa15ea','form-rehire-form.form','5c0ab700-2d58-11eb-b88c-227918fa15ea','{\"name\":\"è¿”å» ç”³è«‹å–®\",\"key\":\"rehire-form\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null}],\"outcomes\":[]}'),
('5c0ab703-2d58-11eb-b88c-227918fa15ea','rehire-form.app','5c0ab700-2d58-11eb-b88c-227918fa15ea','{\"key\":\"rehire-form\",\"name\":\"è¿”å» ç”³è«‹å–®\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('6747bbbe-2bc8-11eb-9d15-227918fa15ea','out-factory.bpmn','6747bbbd-2bc8-11eb-9d15-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"å¤–å‡ºå•\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"å¡«å•\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:formProperty id=\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\" name=\"FLOWABLE_SKIP_EXPRESSION_ENABLED\" type=\"boolean\" default=\"true\"></flowable:formProperty>\n      </extensionElements>\n    </startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"ç”³è¯·äººç¡®è®¤\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${_FLOWABLE_SKIP_EXPRESSION_ENABLED==true}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"ä¸»ç®¡å®¡æ ¸\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('6747bbbf-2bc8-11eb-9d15-227918fa15ea','out-factory.app','6747bbbd-2bc8-11eb-9d15-227918fa15ea','{\"key\":\"out-factory\",\"name\":\"å¤–å‡ºå•\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('6747bbc0-2bc8-11eb-9d15-227918fa15ea','form-out-factory.form','6747bbbd-2bc8-11eb-9d15-227918fa15ea','{\"name\":\"å¤–å‡ºå•\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"ä¸»æ—¨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"äººå‘˜ç¼–å·\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"æè¿°\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('6d8b08e7-2e03-11eb-8edb-227918fa15ea','out-factory.bpmn','6d8b08e6-2e03-11eb-8edb-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"å¤–å‡ºå•\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"å¡«å•\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"ç”³è¯·äººç¡®è®¤\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${skip==true}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"ä¸»ç®¡å®¡æ ¸\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('6d8b08e8-2e03-11eb-8edb-227918fa15ea','out-factory.app','6d8b08e6-2e03-11eb-8edb-227918fa15ea','{\"key\":\"out-factory\",\"name\":\"å¤–å‡ºå•\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('6d8b08e9-2e03-11eb-8edb-227918fa15ea','form-out-factory.form','6d8b08e6-2e03-11eb-8edb-227918fa15ea','{\"name\":\"å¤–å‡ºå•\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"ä¸»æ—¨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"äººå‘˜ç¼–å·\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"æè¿°\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('784ff715-2e06-11eb-84ba-227918fa15ea','out-factory.bpmn','784ff714-2e06-11eb-84ba-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"å¤–å‡ºå•\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"å¡«å•\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"ç”³è¯·äººç¡®è®¤\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${skip}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"ä¸»ç®¡å®¡æ ¸\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('784ff716-2e06-11eb-84ba-227918fa15ea','out-factory.app','784ff714-2e06-11eb-84ba-227918fa15ea','{\"key\":\"out-factory\",\"name\":\"å¤–å‡ºå•\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('784ff717-2e06-11eb-84ba-227918fa15ea','form-out-factory.form','784ff714-2e06-11eb-84ba-227918fa15ea','{\"name\":\"å¤–å‡ºå•\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"ä¸»æ—¨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"äººå‘˜ç¼–å·\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"æè¿°\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('9c6707d9-2d55-11eb-b88c-227918fa15ea','form-mes-requirement.form','9c6707d8-2d55-11eb-b88c-227918fa15ea','{\"name\":\"MESéœ€æ±‚å˜æ›´\",\"key\":\"mes-requirement\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"ä¸»æ—¨\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"ææ¡ˆäººå‘˜\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"éœ€æ±‚å˜æ›´æè¿°\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('9c6707da-2d55-11eb-b88c-227918fa15ea','mes-requirement.app','9c6707d8-2d55-11eb-b88c-227918fa15ea','{\"key\":\"mes-requirement\",\"name\":\"MESéœ€æ±‚å˜æ›´\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('9c6707db-2d55-11eb-b88c-227918fa15ea','mes-requirement.bpmn','9c6707d8-2d55-11eb-b88c-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"mes-requirement\" name=\"MESéœ€æ±‚å˜æ›´\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"å¡«å•\" flowable:initiator=\"initiator\" flowable:formKey=\"mes-requirement\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-33868E85-5876-4712-9136-27C22F40C24D\" name=\"å¡«å•äººç¡®è®¤\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-07BACF0C-406A-4E40-A1FC-00A0BC020C59\" sourceRef=\"startEvent1\" targetRef=\"sid-33868E85-5876-4712-9136-27C22F40C24D\"></sequenceFlow>\n    <userTask id=\"sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\" name=\"ææ¡ˆéƒ¨é—¨ä¸»ç®¡\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-9D4E7218-A416-4E13-8129-6902D1CEDBD3\" sourceRef=\"sid-33868E85-5876-4712-9136-27C22F40C24D\" targetRef=\"sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\"></sequenceFlow>\n    <userTask id=\"sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\" name=\"Coordinator\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-3B1C7B5B-E126-4DBE-9960-3332CA8953FC\" sourceRef=\"sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\" targetRef=\"sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\"></sequenceFlow>\n    <userTask id=\"sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\" name=\"DEV TL\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-75B89205-F7AD-4B61-9772-F69F67FC5A4B\" sourceRef=\"sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\" targetRef=\"sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\"></sequenceFlow>\n    <userTask id=\"sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\" name=\"PSM\" flowable:formFieldValidation=\"true\"></userTask>\n    <userTask id=\"sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\" name=\"MESM\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-6F9F2036-70B8-4F2E-AF81-4B54AA19CD43\" sourceRef=\"sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\" targetRef=\"sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\"></sequenceFlow>\n    <userTask id=\"sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\" name=\"PM\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-C4E02C10-B6FB-47DF-8F9F-346B5D75275C\" sourceRef=\"sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\" targetRef=\"sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\"></sequenceFlow>\n    <sequenceFlow id=\"sid-2090AF02-C11C-4993-9CC4-F4D95E4F6C72\" sourceRef=\"sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\" targetRef=\"sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\"></sequenceFlow>\n    <endEvent id=\"sid-4C4E0E45-0E10-40C1-A1A5-B4BC491F8E1E\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-19C22622-BF57-43FF-BE8C-D74EDD41782F\" sourceRef=\"sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\" targetRef=\"sid-4C4E0E45-0E10-40C1-A1A5-B4BC491F8E1E\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_mes-requirement\">\n    <bpmndi:BPMNPlane bpmnElement=\"mes-requirement\" id=\"BPMNPlane_mes-requirement\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-33868E85-5876-4712-9136-27C22F40C24D\" id=\"BPMNShape_sid-33868E85-5876-4712-9136-27C22F40C24D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\" id=\"BPMNShape_sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\" id=\"BPMNShape_sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"465.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\" id=\"BPMNShape_sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"610.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\" id=\"BPMNShape_sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"255.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\" id=\"BPMNShape_sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"255.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\" id=\"BPMNShape_sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"465.0\" y=\"255.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-4C4E0E45-0E10-40C1-A1A5-B4BC491F8E1E\" id=\"BPMNShape_sid-4C4E0E45-0E10-40C1-A1A5-B4BC491F8E1E\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"610.0\" y=\"281.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-07BACF0C-406A-4E40-A1FC-00A0BC020C59\" id=\"BPMNEdge_sid-07BACF0C-406A-4E40-A1FC-00A0BC020C59\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C4E02C10-B6FB-47DF-8F9F-346B5D75275C\" id=\"BPMNEdge_sid-C4E02C10-B6FB-47DF-8F9F-346B5D75275C\">\n        <omgdi:waypoint x=\"419.94999999990824\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"464.9999999999807\" y=\"295.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2090AF02-C11C-4993-9CC4-F4D95E4F6C72\" id=\"BPMNEdge_sid-2090AF02-C11C-4993-9CC4-F4D95E4F6C72\">\n        <omgdi:waypoint x=\"660.0\" y=\"217.95000000000002\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"660.0\" y=\"234.99999999999994\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"225.0\" y=\"234.99999999999994\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"225.0\" y=\"255.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3B1C7B5B-E126-4DBE-9960-3332CA8953FC\" id=\"BPMNEdge_sid-3B1C7B5B-E126-4DBE-9960-3332CA8953FC\">\n        <omgdi:waypoint x=\"419.94999999999067\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"464.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-75B89205-F7AD-4B61-9772-F69F67FC5A4B\" id=\"BPMNEdge_sid-75B89205-F7AD-4B61-9772-F69F67FC5A4B\">\n        <omgdi:waypoint x=\"564.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"609.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9D4E7218-A416-4E13-8129-6902D1CEDBD3\" id=\"BPMNEdge_sid-9D4E7218-A416-4E13-8129-6902D1CEDBD3\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-6F9F2036-70B8-4F2E-AF81-4B54AA19CD43\" id=\"BPMNEdge_sid-6F9F2036-70B8-4F2E-AF81-4B54AA19CD43\">\n        <omgdi:waypoint x=\"274.94999999974334\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"295.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-19C22622-BF57-43FF-BE8C-D74EDD41782F\" id=\"BPMNEdge_sid-19C22622-BF57-43FF-BE8C-D74EDD41782F\">\n        <omgdi:waypoint x=\"564.95\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"295.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('9f3105e6-2e0b-11eb-b42b-227918fa15ea','out-factory.bpmn','9f3105e5-2e0b-11eb-b42b-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"å¤–å‡ºå•\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"å¡«å•\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"ç”³è¯·äººç¡®è®¤\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${skip}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"ä¸»ç®¡å®¡æ ¸\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('9f3105e7-2e0b-11eb-b42b-227918fa15ea','out-factory.app','9f3105e5-2e0b-11eb-b42b-227918fa15ea','{\"key\":\"out-factory\",\"name\":\"å¤–å‡ºå•\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('9f3105e8-2e0b-11eb-b42b-227918fa15ea','form-out-factory.form','9f3105e5-2e0b-11eb-b42b-227918fa15ea','{\"name\":\"å¤–å‡ºå•\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"ä¸»æ—¨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"äººå‘˜ç¼–å·\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\",\"name\":\"å…è®¸è·³è¿‡\",\"type\":\"boolean\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"skip\",\"name\":\"æ˜¯å¦è·³è¿‡\",\"type\":\"boolean\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"manager\",\"name\":\"æ‰€å±ä¸»ç®¡\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":\"manager\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"æè¿°\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('a6363470-2e00-11eb-8699-227918fa15ea','out-factory.bpmn','a6360d5f-2e00-11eb-8699-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"å¤–å‡ºå•\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"å¡«å•\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"ç”³è¯·äººç¡®è®¤\" flowable:assignee=\"${INITIATOR}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${skip==true}\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"ä¸»ç®¡å®¡æ ¸\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('a6363471-2e00-11eb-8699-227918fa15ea','out-factory.app','a6360d5f-2e00-11eb-8699-227918fa15ea','{\"key\":\"out-factory\",\"name\":\"å¤–å‡ºå•\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('a6363472-2e00-11eb-8699-227918fa15ea','form-out-factory.form','a6360d5f-2e00-11eb-8699-227918fa15ea','{\"name\":\"å¤–å‡ºå•\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"ä¸»æ—¨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"äººå‘˜ç¼–å·\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"æè¿°\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('a83efe5b-2d56-11eb-b88c-227918fa15ea','form-liaison.form','a83efe5a-2d56-11eb-b88c-227918fa15ea','{\"name\":\"è”ç»œå•\",\"key\":\"liaison\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"subject\",\"name\":\"ä¸»é¢˜\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${subject}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"department\",\"name\":\"æ¥æ”¶å•ä½\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${department}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"content\",\"name\":\"æ­£æ–‡\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${content}\",\"layout\":null}],\"outcomes\":[]}'),
('a83efe5c-2d56-11eb-b88c-227918fa15ea','liaison.bpmn','a83efe5a-2d56-11eb-b88c-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"liaison\" name=\"è”ç»œå•\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"å¡«å•\" flowable:initiator=\"initiator\" flowable:formKey=\"liaison\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\" name=\"å¡«å•äººç¡®è®¤\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-8837ACC1-9927-4EF2-AB27-6113B895B400\" sourceRef=\"startEvent1\" targetRef=\"sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\"></sequenceFlow>\n    <userTask id=\"sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\" name=\"å®¡æ ¸ä¸­\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-7BA30D19-708A-4A69-A05E-3B5FC38E05C5\" sourceRef=\"sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\" targetRef=\"sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\"></sequenceFlow>\n    <endEvent id=\"sid-7387C76A-E91A-40AA-A84A-11C8155AD7C0\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-0255207B-6BE7-449E-8B53-6D87AF68964A\" sourceRef=\"sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\" targetRef=\"sid-7387C76A-E91A-40AA-A84A-11C8155AD7C0\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_liaison\">\n    <bpmndi:BPMNPlane bpmnElement=\"liaison\" id=\"BPMNPlane_liaison\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\" id=\"BPMNShape_sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\" id=\"BPMNShape_sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-7387C76A-E91A-40AA-A84A-11C8155AD7C0\" id=\"BPMNShape_sid-7387C76A-E91A-40AA-A84A-11C8155AD7C0\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7BA30D19-708A-4A69-A05E-3B5FC38E05C5\" id=\"BPMNEdge_sid-7BA30D19-708A-4A69-A05E-3B5FC38E05C5\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8837ACC1-9927-4EF2-AB27-6113B895B400\" id=\"BPMNEdge_sid-8837ACC1-9927-4EF2-AB27-6113B895B400\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-0255207B-6BE7-449E-8B53-6D87AF68964A\" id=\"BPMNEdge_sid-0255207B-6BE7-449E-8B53-6D87AF68964A\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('a83efe5d-2d56-11eb-b88c-227918fa15ea','liaison.app','a83efe5a-2d56-11eb-b88c-227918fa15ea','{\"key\":\"liaison\",\"name\":\"è”ç»œå•\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('be8247c5-2d29-11eb-b92b-227918fa15ea','send-email.app','be8247c4-2d29-11eb-b92b-227918fa15ea','{\"key\":\"send-email\",\"name\":\"å‘é€é‚®ä»¶\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('be8247c6-2d29-11eb-b92b-227918fa15ea','send-email.bpmn','be8247c4-2d29-11eb-b92b-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"send-email\" name=\"å‘é€é‚®ä»¶\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"start\" flowable:initiator=\"initiator\" flowable:formFieldValidation=\"true\"></startEvent>\n    <sequenceFlow id=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" sourceRef=\"startEvent1\" targetRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\"></sequenceFlow>\n    <endEvent id=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" name=\"end\"></endEvent>\n    <sequenceFlow id=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" sourceRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" targetRef=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\"></sequenceFlow>\n    <serviceTask id=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" name=\"SendEmail\" flowable:type=\"mail\">\n      <extensionElements>\n        <flowable:field name=\"to\">\n          <flowable:expression><![CDATA[${emailTo}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"from\">\n          <flowable:expression><![CDATA[${emailFrom}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"subject\">\n          <flowable:expression><![CDATA[${emailSubject}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"cc\">\n          <flowable:expression><![CDATA[${emailCC}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"text\">\n          <flowable:expression><![CDATA[${emailContent}]]></flowable:expression>\n        </flowable:field>\n      </extensionElements>\n    </serviceTask>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_send-email\">\n    <bpmndi:BPMNPlane bpmnElement=\"send-email\" id=\"BPMNPlane_send-email\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" id=\"BPMNShape_sid-E4D02A62-9237-4DB5-88D6-388754AE1687\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" id=\"BPMNShape_sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"165.0\" y=\"135.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" id=\"BPMNEdge_sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\">\n        <omgdi:waypoint x=\"129.94340692927761\" y=\"177.55019845363262\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"164.99999999999906\" y=\"176.4985\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" id=\"BPMNEdge_sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\">\n        <omgdi:waypoint x=\"264.9499999999882\" y=\"175.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"292.5\" y=\"175.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"292.5\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('ce8661cf-2d57-11eb-b88c-227918fa15ea','vendor-code-request-form.bpmn','ce8661ce-2d57-11eb-b88c-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"vendor-code-request-form\" name=\"FIå» å•†ä»£ç¢¼ç”³è«‹å–®\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" flowable:initiator=\"initiator\" flowable:formKey=\"vendor-code-request-form\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-E3CDDACB-2B12-4398-966D-C78588092BD6\" sourceRef=\"startEvent1\" targetRef=\"sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\"></sequenceFlow>\n    <endEvent id=\"sid-860C90D4-77B6-4336-A684-FBD28C95B009\"></endEvent>\n    <sequenceFlow id=\"sid-61149916-1C68-428E-987A-8C94F5454F96\" sourceRef=\"sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\" targetRef=\"sid-860C90D4-77B6-4336-A684-FBD28C95B009\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_vendor-code-request-form\">\n    <bpmndi:BPMNPlane bpmnElement=\"vendor-code-request-form\" id=\"BPMNPlane_vendor-code-request-form\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\" id=\"BPMNShape_sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-860C90D4-77B6-4336-A684-FBD28C95B009\" id=\"BPMNShape_sid-860C90D4-77B6-4336-A684-FBD28C95B009\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-61149916-1C68-428E-987A-8C94F5454F96\" id=\"BPMNEdge_sid-61149916-1C68-428E-987A-8C94F5454F96\">\n        <omgdi:waypoint x=\"274.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-E3CDDACB-2B12-4398-966D-C78588092BD6\" id=\"BPMNEdge_sid-E3CDDACB-2B12-4398-966D-C78588092BD6\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('ce8661d0-2d57-11eb-b88c-227918fa15ea','form-vendor-code-request-form.form','ce8661ce-2d57-11eb-b88c-227918fa15ea','{\"name\":\"FIå‚å•†ä»£ç ç”³è¯·å•\",\"key\":\"vendor-code-request-form\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null}],\"outcomes\":[]}'),
('ce8661d1-2d57-11eb-b88c-227918fa15ea','vendor-code-request-form.app','ce8661ce-2d57-11eb-b88c-227918fa15ea','{\"key\":\"vendor-code-request-form\",\"name\":\"FIå‚å•†ä»£ç ç”³è¯·å•\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('d4fc7a5f-2d28-11eb-9045-227918fa15ea','send-email.app','d4fc7a5e-2d28-11eb-9045-227918fa15ea','{\"key\":\"send-email\",\"name\":\"å‘é€é‚®ä»¶\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('d4fc7a60-2d28-11eb-9045-227918fa15ea','send-email.bpmn','d4fc7a5e-2d28-11eb-9045-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"send-email\" name=\"å‘é€é‚®ä»¶\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"start\" flowable:initiator=\"initiator\" flowable:formFieldValidation=\"true\"></startEvent>\n    <sequenceFlow id=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" sourceRef=\"startEvent1\" targetRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\"></sequenceFlow>\n    <endEvent id=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" name=\"end\"></endEvent>\n    <sequenceFlow id=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" sourceRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" targetRef=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\"></sequenceFlow>\n    <serviceTask id=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" name=\"SendEmail\" flowable:type=\"mail\">\n      <extensionElements>\n        <flowable:field name=\"to\">\n          <flowable:expression><![CDATA[${emailTo}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"from\">\n          <flowable:expression><![CDATA[${emailFrom}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"subject\">\n          <flowable:expression><![CDATA[${emailSubject}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"cc\">\n          <flowable:expression><![CDATA[${emailCC}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"text\">\n          <flowable:expression><![CDATA[${emailContent}]]></flowable:expression>\n        </flowable:field>\n      </extensionElements>\n    </serviceTask>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_send-email\">\n    <bpmndi:BPMNPlane bpmnElement=\"send-email\" id=\"BPMNPlane_send-email\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" id=\"BPMNShape_sid-E4D02A62-9237-4DB5-88D6-388754AE1687\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" id=\"BPMNShape_sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" id=\"BPMNEdge_sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" id=\"BPMNEdge_sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\">\n        <omgdi:waypoint x=\"274.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('f1be3861-2d24-11eb-84d4-227918fa15ea','send-email.app','f1be3860-2d24-11eb-84d4-227918fa15ea','{\"key\":\"send-email\",\"name\":\"å‘é€é‚®ä»¶\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('f1be3862-2d24-11eb-84d4-227918fa15ea','send-email.bpmn','f1be3860-2d24-11eb-84d4-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"send-email\" name=\"å‘é€é‚®ä»¶\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"start\" flowable:initiator=\"initiator\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:formProperty id=\"emailFrom\" name=\"å‘ä»¶äºº\" type=\"string\" default=\"delta@flowable.com\"></flowable:formProperty>\n        <flowable:formProperty id=\"emailTo\" name=\"æ”¶ä»¶äºº\" type=\"string\" default=\"delta@flowable.com\"></flowable:formProperty>\n        <flowable:formProperty id=\"emailCC\" name=\"æŠ„é€\" type=\"string\"></flowable:formProperty>\n        <flowable:formProperty id=\"emailSubject\" name=\"ä¸»é¢˜\" type=\"string\" default=\"æµ‹è¯•\"></flowable:formProperty>\n        <flowable:formProperty id=\"emailContent\" name=\"æ­£æ–‡\" type=\"string\" default=\"è¿™æ˜¯ä¸€ä¸ªæµ‹è¯•é‚®ä»¶\"></flowable:formProperty>\n      </extensionElements>\n    </startEvent>\n    <sequenceFlow id=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" sourceRef=\"startEvent1\" targetRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\"></sequenceFlow>\n    <endEvent id=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" name=\"end\"></endEvent>\n    <sequenceFlow id=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" sourceRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" targetRef=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\"></sequenceFlow>\n    <serviceTask id=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" name=\"SendEmail\" flowable:type=\"mail\">\n      <extensionElements>\n        <flowable:field name=\"to\">\n          <flowable:expression><![CDATA[${emailTo}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"from\">\n          <flowable:expression><![CDATA[${emailFrom}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"subject\">\n          <flowable:expression><![CDATA[${emailSubject}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"cc\">\n          <flowable:expression><![CDATA[${emailCC}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"text\">\n          <flowable:expression><![CDATA[${emailContent}]]></flowable:expression>\n        </flowable:field>\n      </extensionElements>\n    </serviceTask>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_send-email\">\n    <bpmndi:BPMNPlane bpmnElement=\"send-email\" id=\"BPMNPlane_send-email\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" id=\"BPMNShape_sid-E4D02A62-9237-4DB5-88D6-388754AE1687\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" id=\"BPMNShape_sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" id=\"BPMNEdge_sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" id=\"BPMNEdge_sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\">\n        <omgdi:waypoint x=\"274.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('faa1aaf6-2d29-11eb-9782-227918fa15ea','send-email.app','faa1aaf5-2d29-11eb-9782-227918fa15ea','{\"key\":\"send-email\",\"name\":\"å‘é€é‚®ä»¶\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('faa1aaf7-2d29-11eb-9782-227918fa15ea','send-email.bpmn','faa1aaf5-2d29-11eb-9782-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"send-email\" name=\"å‘é€é‚®ä»¶\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"start\" flowable:initiator=\"initiator\" flowable:formFieldValidation=\"true\"></startEvent>\n    <sequenceFlow id=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" sourceRef=\"startEvent1\" targetRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\"></sequenceFlow>\n    <endEvent id=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" name=\"end\"></endEvent>\n    <sequenceFlow id=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" sourceRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" targetRef=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\"></sequenceFlow>\n    <serviceTask id=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" name=\"SendEmail\" flowable:type=\"mail\">\n      <extensionElements>\n        <flowable:field name=\"to\">\n          <flowable:expression><![CDATA[${emailTo}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"from\">\n          <flowable:expression><![CDATA[${emailFrom}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"subject\">\n          <flowable:expression><![CDATA[${emailSubject}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"text\">\n          <flowable:expression><![CDATA[${emailContent}]]></flowable:expression>\n        </flowable:field>\n      </extensionElements>\n    </serviceTask>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_send-email\">\n    <bpmndi:BPMNPlane bpmnElement=\"send-email\" id=\"BPMNPlane_send-email\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" id=\"BPMNShape_sid-E4D02A62-9237-4DB5-88D6-388754AE1687\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" id=\"BPMNShape_sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"180.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" id=\"BPMNEdge_sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\">\n        <omgdi:waypoint x=\"129.9499986183554\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"180.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" id=\"BPMNEdge_sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\">\n        <omgdi:waypoint x=\"279.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('fcbc33f1-2bcb-11eb-9e90-227918fa15ea','out-factory.bpmn','fcbc33f0-2bcb-11eb-9e90-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"å¤–å‡ºå•\" isExecutable=\"true\">\n    <dataObject id=\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\" name=\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\" itemSubjectRef=\"xsd:boolean\">\n      <extensionElements>\n        <flowable:value>true</flowable:value>\n      </extensionElements>\n    </dataObject>\n    <dataObject id=\"manager\" name=\"æ‰€å±é¢†å¯¼\" itemSubjectRef=\"xsd:string\">\n      <extensionElements>\n        <flowable:value>manager</flowable:value>\n      </extensionElements>\n    </dataObject>\n    <startEvent id=\"startEvent1\" name=\"å¡«å•\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"ç”³è¯·äººç¡®è®¤\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${_FLOWABLE_SKIP_EXPRESSION_ENABLED==true}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"ä¸»ç®¡å®¡æ ¸\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>'),
('fcbc33f2-2bcb-11eb-9e90-227918fa15ea','out-factory.app','fcbc33f0-2bcb-11eb-9e90-227918fa15ea','{\"key\":\"out-factory\",\"name\":\"å¤–å‡ºå•\",\"description\":\"\",\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\",\"usersAccess\":null,\"groupsAccess\":null}'),
('fcbc33f3-2bcb-11eb-9e90-227918fa15ea','form-out-factory.form','fcbc33f0-2bcb-11eb-9e90-227918fa15ea','{\"name\":\"å¤–å‡ºå•\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"ä¸»æ—¨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"äººå‘˜ç¼–å·\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"æè¿°\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}');

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
('1670ce87-2bc7-11eb-9d15-227918fa15ea','å¤–å‡ºå•','out-factory','',NULL,'2020-11-21 00:59:23.370000','admin','2020-11-23 21:37:53.842000','admin',1,'{\"modelId\":\"1670ce87-2bc7-11eb-9d15-227918fa15ea\",\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"properties\":{\"process_id\":\"out-factory\",\"name\":\"å¤–å‡ºå•\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.flowable.org/processdef\",\"process_historylevel\":\"\",\"isexecutable\":true,\"dataproperties\":\"null\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\",\"escalationdefinitions\":\"\",\"process_potentialstarteruser\":\"\",\"process_potentialstartergroup\":\"\",\"iseagerexecutionfetch\":\"false\"},\"childShapes\":[{\"resourceId\":\"startEvent1\",\"properties\":{\"overrideid\":\"\",\"name\":\"å¡«å•\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formreference\":{\"id\":\"e5975ad8-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"å¤–å‡ºå•\",\"key\":\"out-factory\"},\"formfieldvalidation\":true,\"formproperties\":null},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\"}],\"bounds\":{\"lowerRight\":{\"x\":130,\"y\":193},\"upperLeft\":{\"x\":100,\"y\":163}},\"dockers\":[]},{\"resourceId\":\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\",\"properties\":{\"overrideid\":\"\",\"name\":\"ç”³è¯·äººç¡®è®¤\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"type\":\"initiator\"}}},\"formkeydefinition\":\"\",\"formreference\":{\"id\":\"e5975ad8-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"å¤–å‡ºå•\",\"key\":\"out-factory\"},\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"${skip}\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\"}],\"bounds\":{\"lowerRight\":{\"x\":275,\"y\":218},\"upperLeft\":{\"x\":175,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"}],\"bounds\":{\"lowerRight\":{\"x\":174.15625,\"y\":178},\"upperLeft\":{\"x\":130.609375,\"y\":178}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"}},{\"resourceId\":\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\",\"properties\":{\"overrideid\":\"\",\"name\":\"ä¸»ç®¡å®¡æ ¸\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"${manager}\"}},\"formkeydefinition\":\"\",\"formreference\":{\"id\":\"e5975ad8-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"å¤–å‡ºå•\",\"key\":\"out-factory\"},\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[{\"event\":\"create\",\"implementation\":\"com.deltaww.flowapi.listener.AutoAssigneeListener\",\"className\":\"com.deltaww.flowapi.listener.AutoAssigneeListener\",\"expression\":\"\",\"delegateExpression\":\"\",\"fields\":[],\"$$hashKey\":\"uiGrid-000D\"}]},\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\"}],\"bounds\":{\"lowerRight\":{\"x\":420,\"y\":218},\"upperLeft\":{\"x\":320,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"}],\"bounds\":{\"lowerRight\":{\"x\":319.15625,\"y\":178},\"upperLeft\":{\"x\":275.84375,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"}},{\"resourceId\":\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\",\"properties\":{\"overrideid\":\"\",\"name\":\"ç»“æŸ\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":493,\"y\":192},\"upperLeft\":{\"x\":465,\"y\":164}},\"dockers\":[]},{\"resourceId\":\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"}],\"bounds\":{\"lowerRight\":{\"x\":464.375,\"y\":178},\"upperLeft\":{\"x\":420.390625,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"}}],\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"}}','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ÿ\0\0\0@\0\0\0Õ”¡j\0\0üIDATxÚíœÏO“wÇ9xØaÇvØaGÿ€vğ@²«‰;`”şHm˜„ÖF©2ä@Œ¶q$™	Û$!sá‡f	36cBË´„¬ì°d6CãpŒ\0j…‚¾û~HkZƒ}úˆ~ûz%ß4OÚ><}ó~?ßßOE\0\0\0\0\0\0\0\0\0ÀÛˆRj_2™ì‹ÇãëÑhT\rW\"‘ˆŠÅbtq¡¯Yú‚Ä˜CCCjvvV­¬¬[æææÔİ»wçµQ«Ğ×}ÁR#™nÌ<ƒ®èšj}ÍÑ, MÑr0f®hsfĞ×}ÁÒgÛêŸ˜ıA%\"¡ÍWÃÌ©Ğ×}¡Äæ|˜øIıñË—/Ê¿‰~Ì‰¾„¿ÂÿçÀùsÊ1æD_Â_á—æh¾9ås¢/á/ƒğßş¦ÀœrŒ9Ñ—ğ—É€_¾9B_Â_&áÿ{¸½ÀœrŒ9Ñ—ğştjªÀ”/ys¢/á70üÛÓ”&ê^†}áèó¼M¡/áÌ‰¾„ŸğcNô5)ü•••û=úÉ‘#Gšôëyy­®®>pìØ±÷ŞÈè?¶ßëõvúışûN§sM_„r¹\\ëgÎœyÔÜÜ<zöìÙCr‘„Ÿğ£oi8|øğ‡:g—uØS’·-JZ¿÷µ|Î®xßãñôè»Ìò72ãããjiiI	ËËËêÁƒêæÍ›*lƒÁ™p8\\Iø	?úZC‡ú „;ôÆÆÆõŞŞ^Õ××§äUW¸ù7]ªJ^Û;ÿ®^½º QÛ±¶¶¦†‡‡U]]]¦¾¾ş;ÂOøÑ·8tëtÉH°C¡Ğ†T°[1==-ï¿h	è¼Ö—¬Æ×\'›º~ızJíyØÃéÓ§Wkjj¾\'ü„}‹ªñ7ƒ/-j©T_G~W ªÑÙÖÖv_A*•R>Ÿ/­o_`NÂ¾»êã§sÁß\ry7€´ÓéüÈRs_ŸàéëšúÛ111¡Ün÷}®0\'áGß5÷/K€/\\¸°¾“\Zÿe.^¼˜h·rí)‹„Ãái}®fDúU—JÌiŸ9·Ò}íÓWfÊr£ú“““EåMÆ\0ÇºÔşEOê/İ»w/m5ü###«ò#m.×Ä)sÚ«1úÚ§¯ÌãËqCCÃ¢•Ì555-eÿ{aÏsÓyV©@9—Âˆ9íÕ}mÕwB^»»»W­d®§§gs°P}a¥â‹l)åhNôµ?üoRc™Ç·‚|?{®ó¦×ü4ûiö¡¯ÌÑËqWW×³½®ù‡‰Ä¬ÕğÇãñy›úüø1àg”¾¹>ÿÉ“\'-µƒÁE«}şö+W®ŒX\rÿ¹sç’vŒö3ÅTŸ¡S}2;¦d	}±ÓëÙÖÄ\\Ñûl²ËzŸ,,,<·0Ï¿æt:ç˜ç\'üè»ãÜm6ıOœ8‘‘…r»]X\'ßË†ßZ…++üB¡PQµ¿\\ÈñãÇ³Âğ£ïÎÉnİıM¬›ï²T~§KêåóÙàZŞê+kûõ‰vvvívmÿ©S§u­ÿ-kû	?úµÄwL‚ìõz7nİºµ9pşªõÛ·oËfº\\s_¾÷q©š!ûåĞÒÒ’xİènW_MMÍ¢Çãùj/ööcNô5aWŸt•uîúr3n·[]ºtIåoémmmUº†ÏŸ&ì³´¦ÿU-\0é¸\\®ùk×®MoµŸ_6ø|¾çµµµãú³ŸVì˜}Mz˜‡ìğs8‘íÖèE\\—Ïí¾I+ ]ßm~×$ËveqÆï÷\'ÀÏº¶ÿŒ\'ù~ôµ§+ ÏŒ—lİ-yMÿ.ƒ9Ñ—x~Ì‰¾„ŸğcNô%ü„s¢/á\'ü˜}	?áÇœèKø	?æD_ÂOø1\'ú~Â9Ñ?áG_x‰F£ådÎemÎúš£/X ‹MË–âr0çÔÔÔÚœcèk¾`ÁÁÁCwîÜy:33óÌä\ZIŒ‰DşÑ¥\n}ÍÑ,¢ÿaõ{TšlÒg3°Èï\ZÛ+c¢/\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€ü1íe]J1›\0\0\0\0IEND®B`‚',0,''),
('29d7751a-2d58-11eb-b88c-227918fa15ea','è¿”å» ç”³è«‹å–®','rehire-form','',NULL,'2020-11-23 00:50:24.459000','admin','2020-11-23 00:51:13.197000','admin',1,'{\"modelId\":\"29d7751a-2d58-11eb-b88c-227918fa15ea\",\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"properties\":{\"process_id\":\"rehire-form\",\"name\":\"è¿”å» ç”³è«‹å–®\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.flowable.org/processdef\",\"process_historylevel\":\"\",\"isexecutable\":true,\"dataproperties\":\"\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\",\"escalationdefinitions\":\"\",\"process_potentialstarteruser\":\"\",\"process_potentialstartergroup\":\"\",\"iseagerexecutionfetch\":\"false\"},\"childShapes\":[{\"resourceId\":\"startEvent1\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formreference\":{\"id\":\"46afcbbb-2d58-11eb-b88c-227918fa15ea\",\"name\":\"è¿”å» ç”³è«‹å–®\",\"key\":\"rehire-form\"},\"formfieldvalidation\":true,\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-345367B5-F2D6-40E7-A1B1-D802F28D51BD\"}],\"bounds\":{\"lowerRight\":{\"x\":130,\"y\":193},\"upperLeft\":{\"x\":100,\"y\":163}},\"dockers\":[]},{\"resourceId\":\"sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-6A43BA7B-9987-46BC-AB2A-44F15554599B\"}],\"bounds\":{\"lowerRight\":{\"x\":275,\"y\":218},\"upperLeft\":{\"x\":175,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-345367B5-F2D6-40E7-A1B1-D802F28D51BD\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\"}],\"bounds\":{\"lowerRight\":{\"x\":174.15625,\"y\":178},\"upperLeft\":{\"x\":130.609375,\"y\":178}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\"}},{\"resourceId\":\"sid-28104B17-66FC-492B-8654-D19352BABECE\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":348,\"y\":192},\"upperLeft\":{\"x\":320,\"y\":164}},\"dockers\":[]},{\"resourceId\":\"sid-6A43BA7B-9987-46BC-AB2A-44F15554599B\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-28104B17-66FC-492B-8654-D19352BABECE\"}],\"bounds\":{\"lowerRight\":{\"x\":319.375,\"y\":178},\"upperLeft\":{\"x\":275.390625,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-28104B17-66FC-492B-8654-D19352BABECE\"}}],\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"}}','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0å\0\0\0T\0\0\0}_ğÆ\0\0ÊIDATxÚíMLTW€]¸èÂ…‹.ºè¢‹.\\vÑE—,š¦‹&m\ZQcJ¢pR›†TIIhI1¡\r‰]5UGmL,iŠÚIJŠt¤@)Šà00x{™gDG”7ïÍó}ÉÉ8/óî7ç¾sï»lÛ\0\0\0\0\0\0\0\0°U1Ælë»yóæêàà éïï\'lÆÀÀ€	ƒÿJxéY`òÚµkfzzÚD£Q\"É˜™™1W¯^}(‚î¦w-4C\"¤ãbF%s†è]`²\"’ó!R®Ğ»Àz-„D®Hiè]àš”&ÍØ­nsw eíQŸ#RBš¤|46w.5›ßª{\Zú\\#RB\Z¤]ùbVèqäCJHƒ”wúO$”R#RR\"% ¥wI©Ç‘)!\rRŞèH(¥G>¤„4M‰Üûõ»uBêsÄCJH—”KKfô—ÎõYRëqäCJH±”:ùç³	‡¯zœ¹J¤„TJ)™ğöÅÆ„BZ¡_\'c\"%¤@ÊWÉ˜PNDDJpOÊÍi\"\"%¤°úJ % %RRH	H‰”`âââ7J„ªªªËF\n\n\nŒ×ë]’¯İ÷ù|—åyq~~ş¤$¶Š”ÒŸß•~½{ß¾}5òxB%¼ç½tÊ¸³®®®çàÁƒ­­­Ñ@ `&&&Ìüü¼QM86×¯_µµµÍˆ¬óÒà¯¥áo\"%‘Rîß¿ÿmé¿~‘0¤‰çe!ı|zïŞ½ßÊ¿ßOYãššš>WÏŸ?¿¶õâë077gÎ;7+tjÏ=\"%RfKÈËËÛÏˆK<\Z¿ßoz{{M__ßZ´··›ŠŠŠu‚ÊÏõJV}ËÕÖÖÖ¶=z4¦YÑúsååå÷å“¤)‘2†©;D®Ÿ-ÉZZZÌÈÈˆ‰ÅböñÎÎN#™ÕsAâ3W\ZØĞĞğMsssÌ\Z¢ÚE‡¶\"÷_Ù &Ræ®”q!o«X•••«ÃÃÃ›êç“““kÙó™ÌyÂÑ<y2_3d²B>+¦Ç3}(‹”¹)¥Y­yøğáUÌ..\\xš5µèéXQ§¬¬ì±İ!ëË_”ÆNfrñ)sSÊø5¤^#®$#¤…şéÇóD^sEFˆ$İÀãÇÿ¨E7±wH\ZÙ”H™IUV«¨³Ù!ëFhQ(-Cš‰“š‡”,¹<;;ëŠ”Z••Oÿ4#%RfH–Ôi#—l«Nöu-9r$³ÂvkjjªOŸ>mÜ¤¡¡á®¼¥é:	ò]‘ÈCÊÜ‘r£snÍCj•Õi†††Ö²¥Œ³İøcÇ\rë¹I ˜Ğ‹ê4 kXñÂ‰BÊ-+eÂs.Éa—÷ù|+M{Ø%‰˜¢¢¢hüÿ~ÇVã+++çœ.ğ<O8Ö”>š\'è……”[^Êuç\\2X>?uêTÌ­şî÷ûâó—öşx®|b,;5\r²ÑôˆN°fĞ	zz¢2g¤´bTµ(ãİİİÖ¢‚\ZÛO­%Lg ¥{Rfê9×Ğesn¡¯Ôb‚Í”_støjÍOft¦Ì±kJ\n=9^è±®)ÛÚÚ–İêïr½:ŸÔ5eT_™aJ${ª¯ñyÊ\'nJY__\'ó”,`ñ@VÍSêŠÒÒÒ(+zVôdÈŠ¥±±ñ·Ö¾vttŒ°ö)Yûºùl¹S²å¢w‰H–¼Ï]\"H™Ùr­\n{èĞ¡åŒ¼KD‰ßO¹âôı”òËœÉ\')¹Ÿ²ºº:æÔı”×Nd<üeSSSÔ‰äµş`ç¤Ìdâ;„¬û*3nçgª±_ÕÖÖFíeeÈºTVVö7{ô e6œÿ{ô<±³GnGéjCËËË?*))yØÓÓ³ªÕÓ×­²vuuİÓØÍØŠ»Ù9sÆTUU½°›RÒP-şHJï9µ¶¶>Òù—Dû¾ƒÁyùt¹WXX8+<ëúv{H‰”.Ve_gßWùä±Û±‚yLİH¸èóùşöz½‹Ú0ù\"EEEç’^ÜfÛ&ÌH‰”¯¨ÎîÒ%yÏï®0\'=İH‰”€”RR\"% %”€”H	HI % %RR\"%RR\"%\0R\"% %R\"% %RRH	H‰”€”RR\"%ä6ƒƒƒHä|DDÊzØ\"NNOO#’ƒ‡¿)Cô.°E øthhèÁÔÔÔc„J>Cªã»é]`é@ŸÈ\'û-réµa;ôı!$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0d\'ÿù¬’ÌF*}\0\0\0\0IEND®B`‚',0,''),
('45c41353-2d55-11eb-b88c-227918fa15ea','MESéœ€æ±‚å˜æ›´','mes-requirement','',NULL,'2020-11-23 00:29:43.088000','admin','2020-11-23 00:31:19.913000','admin',1,'{\"name\":\"MESéœ€æ±‚å˜æ›´\",\"key\":\"mes-requirement\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"ä¸»æ—¨\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"ææ¡ˆäººå‘˜\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"éœ€æ±‚å˜æ›´æè¿°\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0\0o\0\0\0VÆı\0\0³IDATxœíİß+ëqÇñó¿ºÕ®(¤”V\\¸ ?.¤Œ©mH’ÌH­ùf¿P³4¹B±oÙ°}J^çâÔÊİùÊúzŸó|Ö£&ß–Ï.^Í÷bûåœ\0Xğ+ì?\0\0şƒÀ€\03,\0f0X\0Ì`°\0˜Á`0ƒÁ`ƒÀŒÀƒu}}İy¼¿¿ú\0ü?\rV&“Q,S2™T£ÑĞææfè\0ğÿ4Xêïï×àà šÍ¦2™ŒÔÛÛúA\0üûÿKøğğ çœutt$çœ–——C?€7İ˜Á`0#Ğ`u+‹ˆÌÄ`‘™,\"2ƒEDfêê`E\"ù¾¯¡¡!¥R)íììhbbB///!—ˆ,×õÁ\Z•ïûúøøĞÂÂ‚®¯¯C:*Y¯«ƒ•Ëå$IétZÅbQ777jµZj·Ûaœ•ˆŒÇ=,\"2Ó·\0„‰Á`ƒÀ€\03,\0f0X\0Ì`°\0˜Á`0ƒÁ`ƒÀ€+›Íêşş^ÏÏÏj·Ûj·ÛZYYùtÍŞŞ^çq£ÑĞóó³ŞŞŞB?(\0û\rÖğğ°R©”*•Š^^^455¥d2©ÉÉÉÎ5ñx¼ó¸Z­ªR©(›Í†~P\0ö\Z¬ññqİßßkqqQÍfSÅbQÙlV±X¬sM³Ùì<n4\Zò<ïÓïà«\rÖîî®ööö4??/ß÷‹Åt||¬ÉÉIµZ----É9§\rµZ-ÕëuMOOË÷ıĞ\nÀ>nº0ƒÁ`‘LD?\"‹ˆÌÄ`‘™,\"2ƒEDfêê`E\"]^^*+ŸÏ+‘Hhuu•/R%¢/ÕõÁŠF£Ÿçææøªz\"úr]¬‡‡IÒİİôúúª÷÷w½¿¿‡qV\"2÷°ˆÈLß>X\0&€\03,\0f0X\0Ì`°\0˜Á`0ƒÁ`ƒÀ€\03,\0f\Z¬jµªB¡ B¡ ××W9çtpp ÓÓÓÎ5\'\'\'rÎéöö¶sm.—ûô<WWWªT*rÎ©V«…ş\"\0°!Ğ`•J%e2E\"ù¾¯l6Û(çœúúúÔh4FåÜŸo~ÎçóJ§ÓŸ§Õj©§§GÕjUççç¡¿\0l4X[[[ÚÚÚR©TÒÅÅ…œsÊårw[333š™™Ñìì¬œs*\nZ[[ÓÙÙ™¶··uxx¨t:­±±1Õj5•ËeÀ_4X+++ÚİİÕÕÕ•|ßW½^×úúºœûóîËó<­¯¯Ëó<Õëuy§……y§££#*‘HhddD‰DBçÉó<•ËåĞ_\0?7İ˜Á`0ƒH&¢ƒEDfb°ˆÈL™‰Á\"\"31XDd&‹ˆÌÄ`‘™,\"2ƒEDfb°ˆÈL™‰Á\"\"31XDd&‹ˆÌÄ`‘™,\"2ƒEDfb°ˆÈL™‰Á\"\"31XDd&‹ˆÌÄ`‘™,\"2ƒEDfb°ˆÈL™‰Á\"\"3}û`@˜,\0f0X\0Ì`°\0˜Á`0ƒÁ`ƒÀ€\03,\0f0X\0Ìø\rö>kEK½Í\0\0\0\0IEND®B`‚',2,''),
('46afcbbb-2d58-11eb-b88c-227918fa15ea','è¿”å» ç”³è«‹å–®','rehire-form','',NULL,'2020-11-23 00:51:13.123000','admin','2020-11-23 00:51:19.252000','admin',1,'{\"name\":\"è¿”å» ç”³è«‹å–®\",\"key\":\"rehire-form\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null}],\"outcomes\":[]}','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0\0l\0\0\0ĞR­\0\0­IDATxœíİ!K,QÆa¿­MÌ67Û4Zƒ†…IÚ…~€	ŠM˜°¬ìœâß&ÜvWæ¾ŞçOX¶ì)o8aÏ^k­\0ìÍı\0ş–Áb, †Áb, †Áb, †Áb, †Áb, ÆNƒuyyY­µ:;;«ãããêº®...ªµV×××µ^¯k½^Ï~(àwúÖ`íïï×jµª®ëªµVWWWÕZ3XÀ¤v\Z¬¾ï«ïûz}}­aêíí­ú¾ÿúnÇ\ZÇqöC¿“;, †Ábì4X’4UKRLKRLKRLKRL“ÖÁÁA\rÃPGGGussS···urrR›Íf¦ãJJnòÁZ,5C}||Ôùùy=??ÏtTIéM:X÷÷÷UUuwwW«Õª^^^j»İÖ8sœURxî°$Åôãƒ0\'ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄØi°6›ÍŸßßßg?\0ğÿøÖËÏ‹Å¢NOO«ëºz||¬ÖZ===yù˜Ô·ëğğ°¾ª_.—Õš§êi¹Ãb, †Ábø‹dIÿDKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRL?>X\0s2X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄø!eAÎÅÔ¿/\0\0\0\0IEND®B`‚',2,''),
('534cb54d-2d58-11eb-b88c-227918fa15ea','è¿”å» ç”³è«‹å–®','rehire-form','','','2020-11-23 00:51:34.284000','admin','2020-11-23 00:51:48.931000','admin',2,'{\"models\":[{\"id\":\"29d7751a-2d58-11eb-b88c-227918fa15ea\",\"name\":\"è¿”å» ç”³è«‹å–®\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T06:51:13.197+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}',NULL,3,''),
('5920a125-2d56-11eb-b88c-227918fa15ea','è”ç»œå•','liaison','',NULL,'2020-11-23 00:37:25.068000','admin','2020-11-23 00:39:00.439000','admin',1,'{\"name\":\"è”ç»œå•\",\"key\":\"liaison\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"subject\",\"name\":\"ä¸»é¢˜\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${subject}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"department\",\"name\":\"æ¥æ”¶å•ä½\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${department}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"content\",\"name\":\"æ­£æ–‡\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${content}\",\"layout\":null}],\"outcomes\":[]}','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0\0o\0\0\0VÆı\0\0æIDATxœíİ¿k“{Æaÿa»9ÔE‡‚“UŠ`DĞÚÁ VA;¸ˆC©ƒhEÛAµÑÚ†äÅû:Ÿx\Z^Ÿx}à‚:äYnÒwHN´ÖPÁ‰®_\0Àe°€2P†ÁÊ0X@(Ã`e, ƒ”a°€2&¬­­­Î_4ğwšh°?~œ^¯—åååüüù3KKKÙÛÛË…òãÇÎfÛDƒõôéÓœ:u*óóóÙßßÏÉ“\'óåË—\\½zµóC€Ù7ñ¿„ı~?­µ|ıú5kkkY[[Ëh4ÊÇ;?˜mºe, Œ‰K’¦•Á’T&ƒ%©LKR™–¤2Mu°æææ2rúôéÜºu+>ÌÂÂB::WRå¦>XgÏÍ`0È¯_¿råÊ•lmmutª¤êMu°={–$Y]]Í‹/²½½Ñh”ñxÜÅ­’Šç–¤2û`tÉ`e, ƒ”a°€2P†ÁÊ0X@(Ã`e, ƒ”1Ñ`­¯¯§µ–áp˜ñxœÖZÆãñÑÏïŞ½Kk-›››i­e0d8v~$0&şæçÍÍÍ|ÿş=­µìîî¦ßïçÕ«WùğáC<y’‹/æÚµki­åŞ½{¹téRÎŸ?ßù¡@}\rÖââbîß¿Ÿdee%­µìììäÎ;i­¥×ëåÌ™3éõzÙØØÈşş~ç³c¢Ázıúuvwwsûöíìíí¥µk}}=i­åÆG¿³³“7oŞäıû÷\nÔç¡;P†ÁÊğÉ’şˆ–¤2,Ie2X’Êd°$•iªƒ577—·oßæúõëyşüynŞ¼™••_¤*é·šú`;wîè÷ÅÅE_U/é·›ê`õûı$É§OŸòíÛ·‡Ãæğğ°‹[%Ï3,Ie:öÁè’ÁÊ0X@(Ã`e, ƒ”a°€2P†ÁÊ0X@(ã·ëóçÏi­ååË—üåÖİ»w;?˜}ÿ{°=z”ÑhÔù!Àì›h°._¾|¤×ëeuu5­µ,--e{{»óc€Ùæ¡;P†ÁÊğÉ’şˆ–¤2,Ie2X’Êd°$•É`I*“Á’T&ƒ%©LKR™–¤2,Ie2X’Êd°$•É`I*“Á’T&ƒ%©LKR™–¤2,Ie2X’Êd°$•É`I*“Á’T&ƒ%©LKR™–¤2,Ie2X’Êd°$•éØ K(Ã`e, ƒ”a°€2P†ÁÊ0X@(Ã`eü¬\r•9Ïƒ~\0\0\0\0IEND®B`‚',2,''),
('5c4e9a62-2d54-11eb-b88c-227918fa15ea','MESéœ€æ±‚å˜æ›´','mes-requirement','',NULL,'2020-11-23 00:23:10.662000','admin','2020-11-23 00:29:43.197000','admin',1,'{\"modelId\":\"5c4e9a62-2d54-11eb-b88c-227918fa15ea\",\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"properties\":{\"process_id\":\"mes-requirement\",\"name\":\"MESéœ€æ±‚å˜æ›´\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.flowable.org/processdef\",\"process_historylevel\":\"\",\"isexecutable\":true,\"dataproperties\":\"\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\",\"escalationdefinitions\":\"\",\"process_potentialstarteruser\":\"\",\"process_potentialstartergroup\":\"\",\"iseagerexecutionfetch\":\"false\"},\"childShapes\":[{\"resourceId\":\"startEvent1\",\"properties\":{\"overrideid\":\"\",\"name\":\"å¡«å•\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formreference\":{\"id\":\"45c41353-2d55-11eb-b88c-227918fa15ea\",\"name\":\"MESéœ€æ±‚å˜æ›´\",\"key\":\"mes-requirement\"},\"formfieldvalidation\":true,\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-07BACF0C-406A-4E40-A1FC-00A0BC020C59\"}],\"bounds\":{\"lowerRight\":{\"x\":130,\"y\":193},\"upperLeft\":{\"x\":100,\"y\":163}},\"dockers\":[]},{\"resourceId\":\"sid-33868E85-5876-4712-9136-27C22F40C24D\",\"properties\":{\"overrideid\":\"\",\"name\":\"å¡«å•äººç¡®è®¤\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-9D4E7218-A416-4E13-8129-6902D1CEDBD3\"}],\"bounds\":{\"lowerRight\":{\"x\":275,\"y\":218},\"upperLeft\":{\"x\":175,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-07BACF0C-406A-4E40-A1FC-00A0BC020C59\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-33868E85-5876-4712-9136-27C22F40C24D\"}],\"bounds\":{\"lowerRight\":{\"x\":174.15625,\"y\":178},\"upperLeft\":{\"x\":130.609375,\"y\":178}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-33868E85-5876-4712-9136-27C22F40C24D\"}},{\"resourceId\":\"sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\",\"properties\":{\"overrideid\":\"\",\"name\":\"ææ¡ˆéƒ¨é—¨ä¸»ç®¡\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-3B1C7B5B-E126-4DBE-9960-3332CA8953FC\"}],\"bounds\":{\"lowerRight\":{\"x\":420,\"y\":218},\"upperLeft\":{\"x\":320,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-9D4E7218-A416-4E13-8129-6902D1CEDBD3\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\"}],\"bounds\":{\"lowerRight\":{\"x\":319.15625,\"y\":178},\"upperLeft\":{\"x\":275.84375,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\"}},{\"resourceId\":\"sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\",\"properties\":{\"overrideid\":\"\",\"name\":\"Coordinator\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-75B89205-F7AD-4B61-9772-F69F67FC5A4B\"}],\"bounds\":{\"lowerRight\":{\"x\":565,\"y\":218},\"upperLeft\":{\"x\":465,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-3B1C7B5B-E126-4DBE-9960-3332CA8953FC\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\"}],\"bounds\":{\"lowerRight\":{\"x\":464.15625,\"y\":178},\"upperLeft\":{\"x\":420.84375,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\"}},{\"resourceId\":\"sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\",\"properties\":{\"overrideid\":\"\",\"name\":\"DEV TL\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-2090AF02-C11C-4993-9CC4-F4D95E4F6C72\"}],\"bounds\":{\"lowerRight\":{\"x\":710,\"y\":218},\"upperLeft\":{\"x\":610,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-75B89205-F7AD-4B61-9772-F69F67FC5A4B\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\"}],\"bounds\":{\"lowerRight\":{\"x\":609.15625,\"y\":178},\"upperLeft\":{\"x\":565.84375,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\"}},{\"resourceId\":\"sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\",\"properties\":{\"overrideid\":\"\",\"name\":\"PSM\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-6F9F2036-70B8-4F2E-AF81-4B54AA19CD43\"}],\"bounds\":{\"lowerRight\":{\"x\":275,\"y\":335},\"upperLeft\":{\"x\":175,\"y\":255}},\"dockers\":[]},{\"resourceId\":\"sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\",\"properties\":{\"overrideid\":\"\",\"name\":\"MESM\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C4E02C10-B6FB-47DF-8F9F-346B5D75275C\"}],\"bounds\":{\"lowerRight\":{\"x\":420,\"y\":335},\"upperLeft\":{\"x\":320,\"y\":255}},\"dockers\":[]},{\"resourceId\":\"sid-6F9F2036-70B8-4F2E-AF81-4B54AA19CD43\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\"}],\"bounds\":{\"lowerRight\":{\"x\":319.15625,\"y\":295},\"upperLeft\":{\"x\":275.84375,\"y\":295}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\"}},{\"resourceId\":\"sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\",\"properties\":{\"overrideid\":\"\",\"name\":\"PM\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-19C22622-BF57-43FF-BE8C-D74EDD41782F\"}],\"bounds\":{\"lowerRight\":{\"x\":565,\"y\":335},\"upperLeft\":{\"x\":465,\"y\":255}},\"dockers\":[]},{\"resourceId\":\"sid-C4E02C10-B6FB-47DF-8F9F-346B5D75275C\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\"}],\"bounds\":{\"lowerRight\":{\"x\":464.15625,\"y\":295},\"upperLeft\":{\"x\":420.84375,\"y\":295}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\"}},{\"resourceId\":\"sid-2090AF02-C11C-4993-9CC4-F4D95E4F6C72\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\"}],\"bounds\":{\"lowerRight\":{\"x\":660,\"y\":254.625},\"upperLeft\":{\"x\":225,\"y\":218.18749999999994}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":660,\"y\":234.99999999999994},{\"x\":225,\"y\":234.99999999999994},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\"}},{\"resourceId\":\"sid-4C4E0E45-0E10-40C1-A1A5-B4BC491F8E1E\",\"properties\":{\"overrideid\":\"\",\"name\":\"ç»“æŸ\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":638,\"y\":309},\"upperLeft\":{\"x\":610,\"y\":281}},\"dockers\":[]},{\"resourceId\":\"sid-19C22622-BF57-43FF-BE8C-D74EDD41782F\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-4C4E0E45-0E10-40C1-A1A5-B4BC491F8E1E\"}],\"bounds\":{\"lowerRight\":{\"x\":609.375,\"y\":295},\"upperLeft\":{\"x\":565.390625,\"y\":295}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-4C4E0E45-0E10-40C1-A1A5-B4BC491F8E1E\"}}],\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"}}','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0b\0\0\0wUçU\0\0çIDATxÚíÏKi‡ëÂöÏØ]öĞÃö°Çö´¼\'±Ú¤ñ·»â<ôR\n=ô²—<,TJ=<ÔKÙ-ÑDŠ‘ZØâRZÛ\nÙnL‹mÕ¦jäİ÷•LHÓÄq&}Íû<ğ¨)ú|óï;3Î{æ\0\0\0\0\0\0\0\0\0\0œn„MkkkSÉdò`vvVÌÌÌh3lÛ‰Dâ¥íxãŒ³¦¨/,,ˆ\r±»»«İÈd2\"¿‘oÁgœ5D%tiÜ=[›)]\n½+“{ÕKoİœ½ğÆÙçº£¦x¥RN¡Wç®iShYä}/½utvÛg3œëZ›U\n‘‡öŠ,¼ôÖÑÙmoœÍpÖ*D\Z¹È•šK·5s=(œ	W‹¬ÖŠN¡İ‹\Z\"º:{y@á%D¼(²SàÒÑÈ!¢³³WÎí¬ÅrFÇáõrÆoœÍéoB„á€Â¹vü~ÿW–eıÿ\rB¾nË×	õï„Ş8ã|$20Ú;::6&\'\'Ÿ¤Óé÷B²¹¹)¦§§3ápxóüùó?\"xãŒsYZ[[ŒD\"¯={–eX__ıııÛ###­LxãŒóø|¾¦ÎÎÎTP…úzWW×z?EÆgœŒD£Ñœ¨‚ññqqõêÕß(2Ş8ã\\`ppği2™¬&CÄÊÊŠ~y’ïæäğ™TäbgS¼Mt6µ¿Ï\\¼xqW@­†\n…NXd‘s5VÁY5˜!!bœ³©ı}(}ŠŠtâqšŠl¢7Ÿµ9Î\'\n‘p8œ­v&òöí[qáÂ…Ó=¦ö8Óß–«=\'²´´$†††sâ	oœq. gÍccc[¹Üÿ_ ¹téÒ~___ˆ\"ã3Î\n…ænŞ¼¹}TÜ¾}û §§ç/îÁgœËŞp&g$±áááW‹‹‹9ç‰:²¼¼,äLe;‰Ü÷ûı_r0á3Î±,ë\\8···ï¨³Ëòõ½\n0–›3B„\ng@‘ñÆgB„á€Â™!D8 p&D(œ	ŠŒ7Î8\"„Î§rÛhj8²^o£i‚7Îæôw]I$/tİ1İ©Tê–Û›è³9ı]Wb±Xóüüüët:ıNÇ„V¶mû¹-xãŒ³¦Hs2	—Ô”J­Í4\ZêçYõªÀ&zãìÎÏ{÷î]íû\04¥³³óó@ °í÷û?£\Z\0pl,ËúF†Èc*\05ÑÖÖö“‘?¨\0Ô:ùU†H”J\0@M¨\0‘ã*\0µÎDşTK\Z*\0µÎDÈùšJx_hÁ`4êP—y9Êë\"T\Zî!D\0€\0B\0 BxÌïÊNE\0à¸!â+\n€šg#TÀ\0„MkkkSÉdò@=JN§gLØ¶-‰ÄK9ÚñÆ4E5ÕÂÂ‚Ğõr™LFÄãñ7n?¸ÅDoS?kğõ[©´©Ü=[›)]šk×ígP–zëæì…·‰ÎPÊ=\rÛi®Õ¹k:=RßÓ§½ëèì¶·‰ÎPÊíËá4×CûŠ1ûÎèèìõ,&8Ã\'“6¯ÒÑ¹^!ÂFNàjc©õ±Ó\\îE]½Sœ¡Î!â4UéhäÑÙÙ«1É>Ñr†½xÙ—–\Zoœ!D·	ƒßZ–Õ.Ë1ÒÖÖöÏçk\"	h,¼q>2<îWxÜáªüÚ¤…7Î•fƒ2(öU`D\"‘½ññq155%ÔkwwwÎ	õ>ÆÂçf 2 ²*$®_¿~ÍfE1¹\\NÜ¸q£xVò=©@cásg	£DÁäädaiÃ9\Zoœ\09ë,aJg ¥¨Ioo/³\Z«2ù%ùLò6Ñ¹Ø;æğÜG5¨÷åCd„d DÊ5Vá¹¯ªÁ	ãœK¼ŸªWuµ\ZÔûòÿï2ÉĞ !âæf§ÅÛDg·?kf\"„Ëœk]ÎœÍoy™ãœ!Â‰UœOtufbbBTsu&şÍÕ\ZoœKïÙw‚dooï£HÑå]Á«4Ş8Dñ«İİİ¢øÕ¢%w¬ÒXxã|ôŒ¤ÒßÎ¨%3\Zoœ«=Gr6?39ü+^u5AĞXxã„!Bˆ\"„!Bˆ\"„!Bˆ\"@cá3ÔrÛhj8²^o£i‚·©Ÿ5xL\"‘x¡ë.ñÎH¥R·ÜŞäÙDoS?kğ˜X,Ö<??ÿ:N¿Óñ·’j*Û¶ŸËÑ‚7Î )òC;\'ÓIM#ÕzT£¡~U¯šÊDoS?k\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¨–ÿ\0•zw\ZeÅc\0\0\0\0IEND®B`‚',0,''),
('5eef80ba-2bc8-11eb-9d15-227918fa15ea','å¤–å‡ºå•','out-factory','','','2020-11-21 01:08:35.114000','admin','2020-11-23 22:15:01.427000','admin',9,'{\"models\":[{\"id\":\"1670ce87-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"å¤–å‡ºå•\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-21T07:08:14.341+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}',NULL,3,''),
('8e54d196-2d57-11eb-b88c-227918fa15ea','FIå» å•†ä»£ç¢¼ç”³è«‹å–®','vendor-code-request-form','',NULL,'2020-11-23 00:46:03.568000','admin','2020-11-23 00:46:51.838000','admin',1,'{\"modelId\":\"8e54d196-2d57-11eb-b88c-227918fa15ea\",\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"properties\":{\"process_id\":\"vendor-code-request-form\",\"name\":\"FIå» å•†ä»£ç¢¼ç”³è«‹å–®\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.flowable.org/processdef\",\"process_historylevel\":\"\",\"isexecutable\":true,\"dataproperties\":\"\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\",\"escalationdefinitions\":\"\",\"process_potentialstarteruser\":\"\",\"process_potentialstartergroup\":\"\",\"iseagerexecutionfetch\":\"false\"},\"childShapes\":[{\"resourceId\":\"startEvent1\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formreference\":{\"id\":\"aae549c7-2d57-11eb-b88c-227918fa15ea\",\"name\":\"FIå‚å•†ä»£ç ç”³è¯·å•\",\"key\":\"vendor-code-request-form\"},\"formfieldvalidation\":true,\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-E3CDDACB-2B12-4398-966D-C78588092BD6\"}],\"bounds\":{\"lowerRight\":{\"x\":130,\"y\":193},\"upperLeft\":{\"x\":100,\"y\":163}},\"dockers\":[]},{\"resourceId\":\"sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-61149916-1C68-428E-987A-8C94F5454F96\"}],\"bounds\":{\"lowerRight\":{\"x\":275,\"y\":218},\"upperLeft\":{\"x\":175,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-E3CDDACB-2B12-4398-966D-C78588092BD6\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\"}],\"bounds\":{\"lowerRight\":{\"x\":174.15625,\"y\":178},\"upperLeft\":{\"x\":130.609375,\"y\":178}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\"}},{\"resourceId\":\"sid-860C90D4-77B6-4336-A684-FBD28C95B009\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":348,\"y\":192},\"upperLeft\":{\"x\":320,\"y\":164}},\"dockers\":[]},{\"resourceId\":\"sid-61149916-1C68-428E-987A-8C94F5454F96\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-860C90D4-77B6-4336-A684-FBD28C95B009\"}],\"bounds\":{\"lowerRight\":{\"x\":319.375,\"y\":178},\"upperLeft\":{\"x\":275.390625,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-860C90D4-77B6-4336-A684-FBD28C95B009\"}}],\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"}}','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0å\0\0\0T\0\0\0}_ğÆ\0\0ÊIDATxÚíMLTW€]¸èÂ…‹.ºè¢‹.\\vÑE—,š¦‹&m\ZQcJ¢pR›†TIIhI1¡\r‰]5UGmL,iŠÚIJŠt¤@)Šà00x{™gDG”7ïÍó}ÉÉ8/óî7ç¾sï»lÛ\0\0\0\0\0\0\0\0°U1Ælë»yóæêàà éïï\'lÆÀÀ€	ƒÿJxéY`òÚµkfzzÚD£Q\"É˜™™1W¯^}(‚î¦w-4C\"¤ãbF%s†è]`²\"’ó!R®Ğ»Àz-„D®Hiè]àš”&ÍØ­nsw eíQŸ#RBš¤|46w.5›ßª{\Zú\\#RB\Z¤]ùbVèqäCJHƒ”wúO$”R#RR\"% ¥wI©Ç‘)!\rRŞèH(¥G>¤„4M‰Üûõ»uBêsÄCJH—”KKfô—ÎõYRëqäCJH±”:ùç³	‡¯zœ¹J¤„TJ)™ğöÅÆ„BZ¡_\'c\"%¤@ÊWÉ˜PNDDJpOÊÍi\"\"%¤°úJ % %RRH	H‰”`âââ7J„ªªªËF\n\n\nŒ×ë]’¯İ÷ù|—åyq~~ş¤$¶Š”ÒŸß•~½{ß¾}5òxB%¼ç½tÊ¸³®®®çàÁƒ­­­Ñ@ `&&&Ìüü¼QM86×¯_µµµÍˆ¬óÒà¯¥áo\"%‘Rîß¿ÿmé¿~‘0¤‰çe!ı|zïŞ½ßÊ¿ßOYãššš>WÏŸ?¿¶õâë077gÎ;7+tjÏ=\"%RfKÈËËÛÏˆK<\Z¿ßoz{{M__ßZ´··›ŠŠŠu‚ÊÏõJV}ËÕÖÖÖ¶=z4¦YÑúsååå÷å“¤)‘2†©;D®Ÿ-ÉZZZÌÈÈˆ‰ÅböñÎÎN#™ÕsAâ3W\ZØĞĞğMsssÌ\Z¢ÚE‡¶\"÷_Ù &Ræ®”q!o«X•••«ÃÃÃ›êç“““kÙó™ÌyÂÑ<y2_3d²B>+¦Ç3}(‹”¹)¥Y­yøğáUÌ..\\xš5µèéXQ§¬¬ì±İ!ëË_”ÆNfrñ)sSÊø5¤^#®$#¤…şéÇóD^sEFˆ$İÀãÇÿ¨E7±wH\ZÙ”H™IUV«¨³Ù!ëFhQ(-Cš‰“š‡”,¹<;;ëŠ”Z••Oÿ4#%RfH–Ôi#—l«Nöu-9r$³ÂvkjjªOŸ>mÜ¤¡¡á®¼¥é:	ò]‘ÈCÊÜ‘r£snÍCj•Õi†††Ö²¥Œ³İøcÇ\rë¹I ˜Ğ‹ê4 kXñÂ‰BÊ-+eÂs.Éa—÷ù|+M{Ø%‰˜¢¢¢hüÿ~ÇVã+++çœ.ğ<O8Ö”>š\'è……”[^Êuç\\2X>?uêTÌ­şî÷ûâó—öşx®|b,;5\r²ÑôˆN°fĞ	zz¢2g¤´bTµ(ãİİİÖ¢‚\ZÛO­%Lg ¥{Rfê9×Ğesn¡¯Ôb‚Í”_støjÍOft¦Ì±kJ\n=9^è±®)ÛÚÚ–İêïr½:ŸÔ5eT_™aJ${ª¯ñyÊ\'nJY__\'ó”,`ñ@VÍSêŠÒÒÒ(+zVôdÈŠ¥±±ñ·Ö¾vttŒ°ö)Yûºùl¹S²å¢w‰H–¼Ï]\"H™Ùr­\n{èĞ¡åŒ¼KD‰ßO¹âôı”òËœÉ\')¹Ÿ²ºº:æÔı”×Nd<üeSSSÔ‰äµş`ç¤Ìdâ;„¬û*3nçgª±_ÕÖÖFíeeÈºTVVö7{ô e6œÿ{ô<±³GnGéjCËËË?*))yØÓÓ³ªÕÓ×­²vuuİÓØÍØŠ»Ù9sÆTUU½°›RÒP-şHJï9µ¶¶>Òù—Dû¾ƒÁyùt¹WXX8+<ëúv{H‰”.Ve_gßWùä±Û±‚yLİH¸èóùşöz½‹Ú0ù\"EEEç’^ÜfÛ&ÌH‰”¯¨ÎîÒ%yÏï®0\'=İH‰”€”RR\"% %”€”H	HI % %RR\"%RR\"%\0R\"% %R\"% %RRH	H‰”€”RR\"%ä6ƒƒƒHä|DDÊzØ\"NNOO#’ƒ‡¿)Cô.°E øthhèÁÔÔÔc„J>Cªã»é]`é@ŸÈ\'û-réµa;ôı!$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0d\'ÿù¬’ÌF*}\0\0\0\0IEND®B`‚',0,''),
('9231a865-2d55-11eb-b88c-227918fa15ea','MESéœ€æ±‚å˜æ›´','mes-requirement','','','2020-11-23 00:31:51.313000','admin','2020-11-23 00:32:08.366000','admin',2,'{\"models\":[{\"id\":\"5c4e9a62-2d54-11eb-b88c-227918fa15ea\",\"name\":\"MESéœ€æ±‚å˜æ›´\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T06:29:43.197+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}',NULL,3,''),
('a02ca5f7-2d56-11eb-b88c-227918fa15ea','è”ç»œå•','liaison','','','2020-11-23 00:39:24.265000','admin','2020-11-23 00:39:37.768000','admin',2,'{\"models\":[{\"id\":\"fbbf99a4-2d55-11eb-b88c-227918fa15ea\",\"name\":\"è”ç»œå•\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T06:37:25.131+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}',NULL,3,''),
('aae549c7-2d57-11eb-b88c-227918fa15ea','FIå‚å•†ä»£ç ç”³è¯·å•','vendor-code-request-form','',NULL,'2020-11-23 00:46:51.749000','admin','2020-11-23 00:47:00.055000','admin',1,'{\"name\":\"FIå‚å•†ä»£ç ç”³è¯·å•\",\"key\":\"vendor-code-request-form\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null}],\"outcomes\":[]}','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0\0l\0\0\0ĞR­\0\0­IDATxœíİ!K,QÆa¿­MÌ67Û4Zƒ†…IÚ…~€	ŠM˜°¬ìœâß&ÜvWæ¾ŞçOX¶ì)o8aÏ^k­\0ìÍı\0ş–Áb, †Áb, †Áb, †Áb, †Áb, ÆNƒuyyY­µ:;;«ãããêº®...ªµV×××µ^¯k½^Ï~(àwúÖ`íïï×jµª®ëªµVWWWÕZ3XÀ¤v\Z¬¾ï«ïûz}}­aêíí­ú¾ÿúnÇ\ZÇqöC¿“;, †Ábì4X’4UKRLKRLKRLKRL“ÖÁÁA\rÃPGGGussS···urrR›Íf¦ãJJnòÁZ,5C}||Ôùùy=??ÏtTIéM:X÷÷÷UUuwwW«Õª^^^j»İÖ8sœURxî°$Åôãƒ0\'ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄØi°6›ÍŸßßßg?\0ğÿøÖËÏ‹Å¢NOO«ëºz||¬ÖZ===yù˜Ô·ëğğ°¾ª_.—Õš§êi¹Ãb, †Ábø‹dIÿDKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRLKRL?>X\0s2X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄ0X@ƒÄø!eAÎÅÔ¿/\0\0\0\0IEND®B`‚',2,''),
('c506bdcb-2d57-11eb-b88c-227918fa15ea','FIå‚å•†ä»£ç ç”³è¯·å•','vendor-code-request-form','','','2020-11-23 00:47:35.589000','admin','2020-11-23 00:47:51.500000','admin',2,'{\"models\":[{\"id\":\"8e54d196-2d57-11eb-b88c-227918fa15ea\",\"name\":\"FIå» å•†ä»£ç¢¼ç”³è«‹å–®\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T06:46:51.838+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}',NULL,3,''),
('e0d829dc-2d23-11eb-84d4-227918fa15ea','å‘é€é‚®ä»¶','send-email','',NULL,'2020-11-22 18:36:07.533000','admin','2020-11-22 19:19:38.292000','admin',1,'{\"modelId\":\"e0d829dc-2d23-11eb-84d4-227918fa15ea\",\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"properties\":{\"process_id\":\"send-email\",\"name\":\"å‘é€é‚®ä»¶\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.flowable.org/processdef\",\"process_historylevel\":\"\",\"isexecutable\":true,\"dataproperties\":\"\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\",\"escalationdefinitions\":\"\",\"process_potentialstarteruser\":\"\",\"process_potentialstartergroup\":\"\",\"iseagerexecutionfetch\":\"false\"},\"childShapes\":[{\"resourceId\":\"startEvent1\",\"properties\":{\"overrideid\":\"\",\"name\":\"start\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"formproperties\":null},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\"}],\"bounds\":{\"lowerRight\":{\"x\":130,\"y\":193},\"upperLeft\":{\"x\":100,\"y\":163}},\"dockers\":[]},{\"resourceId\":\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\"}],\"bounds\":{\"lowerRight\":{\"x\":179.5859375,\"y\":178},\"upperLeft\":{\"x\":130.375,\"y\":178}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\"}},{\"resourceId\":\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\",\"properties\":{\"overrideid\":\"\",\"name\":\"end\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":348,\"y\":192},\"upperLeft\":{\"x\":320,\"y\":164}},\"dockers\":[]},{\"resourceId\":\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\"}],\"bounds\":{\"lowerRight\":{\"x\":320,\"y\":178},\"upperLeft\":{\"x\":280.5625,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\"}},{\"resourceId\":\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\",\"properties\":{\"overrideid\":\"\",\"name\":\"SendEmail\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"mailtaskheaders\":\"\",\"mailtaskto\":\"${emailTo}\",\"mailtaskfrom\":\"${emailFrom}\",\"mailtasksubject\":\"${emailSubject}\",\"mailtaskcc\":\"\",\"mailtaskbcc\":\"\",\"mailtasktext\":\"${emailContent}\",\"mailtasktextvar\":\"\",\"mailtaskhtml\":\"\",\"mailtaskhtmlvar\":\"\",\"mailtaskcharset\":\"\",\"type\":\"http://b3mn.org/stencilset/bpmn2.0#UserTask\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"MailTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\"}],\"bounds\":{\"lowerRight\":{\"x\":280,\"y\":218},\"upperLeft\":{\"x\":180,\"y\":138}},\"dockers\":[]}],\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"}}','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0å\0\0\0T\0\0\0}_ğÆ\0\0«IDATxÚíMLTW€]¸è¢]tÑE]tÙE]²hš.š´iDqP@~Œ!(	Œ?Il\ZRkjBcX`J\r‰]¶U˜âh\Z“†´¥?³0j¡À ¢#ã80x{Îd)øæ½ñÍÌ÷%\'q\0/ÌıæÜ{î}—M›\0\0\0\0\0\0\0\0\0Ê	cÌæ7nŒ\\½zuullÌ\\¼x‘°£££&\nİ‘ğÓ³À6*äåË—M4\Z5Éd’È3æççÍ¥K—î‹ [é]`Íé¸˜IÉœazØB‡¬ˆä|ˆ”+ô.°…Î…È)\r½\\“ræî’iş-}E8¤„—$åBìá“CáÙ´”zµş-z/|H	…’òÎıxZÂçÅ¿wbˆ”P¨L¹)‘)á%HÙqîwóÍÏÿ˜ë³÷ÒW}Œ”H	”R‹9ÖRCEÌ~^[ÏéçQüAJpYÊµCTÍÙÏëc†±H	dJ¤æ”Ì)‘¨¾\"%À³¤Üè:%\n˜)g—rîè¹›µã‡@J(€”ì}EJğ°”RR\"% %”€”H	Ï§¶¶ö•:¡¥¥åÂ®]»\"ÕÕÕ‰ªª*ã÷ûÉs·Ày\\[YYù*R¥\"¥ôç·¤_oİ±cG›\\èUÂïóùŞy™2néèèÚ½{÷ROOO2šééi‹ÅŒÇM$1W®\\IõööÎ‹¬1iğÒğ×’(F)wîÜù†ôß>‘0¬‰çY!ı<º}ûö¯åãwÖ¸îîîOUÆ³gÏ¦YÜ‹‹‹æÌ™3’Aç¶mÛö>RÅ\"eEEÅæLFLXâÉ¨Ğôõõ™ááa322’şş~ÓÔÔô” òuÃ’U_wµíííıû÷ïOiV´ƒ~]ccãmy\'éDJÂëRê´KäúŞ’ìØ±cfrrÒ¤R©œ}üôéÓF2«%æ’Ä\'®4°««ë«C‡¥¬!ª]th+r_/V1‘²<¤Ìù‡ŠÕÜÜ¼:11ñBı|ff&=³2çGxôèÑJÍù\n™-¦§Šq(‹”¥/¥Y­¹wïŞUÌ.çÏŸ’5µèéXQ§¡¡á¡İ!ë³˜ššŠKcgŠ­øƒ”¥/ef©sÄ•|„´Ğ?sáóùË÷\\‘â{y7ğğáÃßiQÇ\rdì–Fö#%á)µÊju^tÈš-\ne²eX3q^ë’%—\\‘R«²òrW³1R\"¥G²¤.{™²­:Ù×µ8´oß¾TFÌ&Û\rlkkk=qâ„q“®®®¿äQïéäö“DR–®”¹^ckR«¬N3>>Î–2:üÕvã80¡ßÈM‚Áà´Nª=$¥5ÌX÷…CÊ’rİ×X’ÃÛúï@`%×²‡]‰„©©©Ifşï7m5¾¹¹yÑéÏZ\"‘ˆ¦ôk”rİ)KJÊ§^cÉ`Uúøøñã)·ú{__ßRfıÒŞÊ•wŒe§–Ar-è«‡¥|ê…CÊ’”ÒŠkzÕ¢Œ[Z›\nÚl7¾äÚKèµ@JwÂk¯³[è–¼¼6)¾–ÓğÕZŸôt¦,ó9%…2+ôXsÊŞŞŞe·ú»ÌWcyÍ)Ë´úÊ’H™.‰Eõ5³NùØM);;;ÿôÒ:%›Ê{ó€ç×)uGO}}}’=HÉìèQ<xÎ­½¯§Nšdï+ÁŞ×Ï–[$[Æİ¸KD²ämî!¼z—È={–=y—ˆ’¹ŸrÅéû)å‡ÿpS‘”åu?ekkkÊ©û)¯Èxø³îîî¤\'È÷ú›“ˆ\"8y lİWé¹“²ª±Ÿ···\'íeeÈú¨¡¡ágôEzFÏc;gôèq”®6´±±ñƒºººûCCC«Z=İh•u``à¦4ÀivD)fwòäIÓÒÒò¿Óì´pT†jñGRú€Èù §§ç®¿¬wîk(ŠÉ»ËÍêêêiä—®·‡”HébUv#ç¾ÊçÌÊuĞ±‚uL=Hø!Üòûıqm˜ü\0‰šššiŸÏ÷£NnKáf¤ä„ôì?º%oí	éz\0sŞË€”H	HI % %RRH	H‰”€”RR\"%\0R\"% %R %RRH	H‰”€”RR\"% %”€”H	°–±±1$r>\"å\n½l\n…f¢Ñ(\"9‘Hä[‘2Lï[ƒÁÇÇÇïÍÍÍ=D¨ü3¤\n9:::%±•Ş¶‘ô‘¼³ÿ¢C.¶Ca„\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ïóò‹”cF1\Z\0\0\0\0IEND®B`‚',0,''),
('e5975ad8-2bc7-11eb-9d15-227918fa15ea','å¤–å‡ºå•','out-factory','',NULL,'2020-11-21 01:05:11.531000','admin','2020-11-23 22:14:42.888000','admin',1,'{\"name\":\"å¤–å‡ºå•\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"ä¸»æ—¨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"äººå‘˜ç¼–å·\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\",\"name\":\"å…è®¸è·³è¿‡\",\"type\":\"boolean\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"skip\",\"name\":\"æ˜¯å¦è·³è¿‡\",\"type\":\"boolean\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"manager\",\"name\":\"æ‰€å±ä¸»ç®¡\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":\"manager\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"æè¿°\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0\0º\0\0\05pŸ\0\0:IDATxœíİßKÓÇñï?ÖUttÙE—y#İ‰ÆLïÌº0#’ÈˆJ±…F©‘ı˜Á0	ú!f‰ŠX8”-ç|kîu®Î âÀÙÑõáåy>á5ú¾y±&¸\"B\0ààŸ¤¿\0øo1X\0l0X\0l0X\0l0X\0l0X\0l0X\0l0X\0l0X\0l0X\0l0X\0lÔ=X…BA¡™™år9õõõ©¯¯O¡«W¯jee%ñ£\0Mÿó+¬J¥¢ˆPOOzzz”Ïç?ÀÑvàÿ¶¶¶ªµµ5ñC\0}u\rÖÈÈHÍôôôo%}€£7İØ¨k°vww !}°ˆˆ\ZQµZe°ˆÈ#‹ˆlb°ˆÈ¦†Ö?ÔÖÖ¦¶¶¶?¾ğ·oßşæDtjø+¬|>¯R©$IÊf³º|ù²ªÕªfgg“¸—ˆŒû+ƒµ´´$IÚßß×…$‰Á\"¢ºã=,\"²‰Á\"\"›\Z2X\0$€\r€\r€\r€\r€\r€\r€\r€\r€\r€\r€†V±XTDhccãÇ\0 ^¬öövµ··+\"488¨‹/j``@ïŞ½Óää¤\"Bãããµç÷÷÷kkk+ñÃø©{°¾ÿ®·oß*\"”ËåT.—U.—J§Ó\ZÔØØ˜¦¦¦tïŞ=¥Ói¥ÓiÍÎÎ&~,\0ouÖüü¼\"B›››ÊçóZYYÑææ¦\"BoŞ¼ÑÓ§O511¡µµµÚ¿yüøqâ‡ğÇ›î\0l0X\0lÔ5XÕj\0İşşşáQ#ªVù\n\"2‰Á\"\"›,\"²‰Á\"\"›,\"²‰Á\"\"›,\"²‰Á\"\"›\Z2X\0$€\r€\r€\r€\r€\r€\r€\r€\r€\r€\r€\r€\r€ºkww÷7ÿéyËËËŠutt(\"4<<œø¡\0üè÷aıûñ³gÏêøñãúùó§¦§§ÕÙÙY{¼\\.+•JéóçÏZ\\\\Lü`\0¾e°:::tşüyE„º»»•Ëå”ËåÔÕÕ¥\\.§T*¥R©Ä`8V¡PPD¨··W½½½zõêUíù½½½Š)ŸÏ×»yófâ‡ğS×`ıúõë7Ió\0ş¿ğSB\06,\06,\06,\06,\06,\06,\06,\06,\06,\06,\06,\06,\06,\06,\06,\06,\06e°Nœ8¡“\'O*\"´´´¤¥¥%>}ZÇSD(•J)\"´½½øÁ\0|Ê‡Pœ9sFÍÍÍŠ\r\r\réÔ©SjnnV6›ÕÎÎR©”\n…Bà@e°ÖÖÖ4::ªíímuww+\"ôéÓ\'uuu©R©Ô^a-..jtt4ñ£x:ğ`íìì(\"T,U,U.—U,U©TT,ÚÚÚR¥R©=¯T*%~8\0?|j\0ü”€\r€\r€\r€\r€\r€\r€\r€\r€\r€\r€\r€\r€\r€\r€º«P(h||\\¡ááa­®®*“É(“ÉèÃ‡Še2™Úóïß¿¯©©)-..jss3ñcx«k°^¾|©¦¦&½xñBSSSš™™QD¨­­­öœÕÕÕÚŸ›ššj?ø±\0¼Õ5X¯_¿V&“ÑÌÌŒ\n…‚²Ù¬îŞ½«k×®i}}]_¿~Õ³gÏ499©íím-,,èöíÛzğàAâ‡ğW×`=zôHŠˆÚ`õ÷÷«¯¯OO<ÑÜÜœŞ¿¯¹¹9}ùòEóóóš››ÓÄÄDâ‡ğÇ›î\0l0X\0lèc¾ˆˆ£jµÊ`‘GÙÄ`‘M\r¬b±¨t:­t:ıÇ^^^ş›wÑ¨á¯°òù¼ööö$I?~Ô;w´¿¿¯ÙÙÙ$î%\"ãşÊ`-,,ÔşŞÒÒ\"IÕïa‘MÙÔÁ€$1X\0l0X\0l0X\0l0X\0l0X\0l0X\0l0X\0l0X\0l0X\0l0X\0l0X\0l0X\0lÔ5Xƒƒƒºuë–ÆÆÆ400 ˆĞĞĞ®\\¹¢‘‘uvvªT*%~€£©®ÁZXXĞõë×ÕÒÒ¢sçÎibbBÊf³‰àè«k°¶¶¶ôæÍ\r\r\réÒ¥KZ__×Ã‡•ÍfuãÆÄp´ñ\0\0u\rÖŞŞ\04Ä¡Q#âC(ˆÈ&‹ˆlb°ˆÈ&‹ˆlb°ˆÈ&‹ˆlb°ˆÈ&‹ˆlb°ˆÈ&‹ˆlb°ˆÈ&‹ˆlb°ˆÈ&‹ˆlb°ˆÈ&‹ˆlb°ˆÈ&‹ˆlb°ˆÈ&‹ˆlb°ˆÈ&‹ˆlb°ˆÈ&‹ˆlb°ˆÈ&‹ˆlb°ˆÈ&‹ˆljÈ`@’,\06,\06,\06,\06,\06,\06,\06,\06,\06,\06,\06şò­°×ú~Ì\0\0\0\0IEND®B`‚',2,''),
('e96a6b2d-2d24-11eb-84d4-227918fa15ea','å‘é€é‚®ä»¶','send-email','','','2020-11-22 18:43:32.307000','admin','2020-11-22 19:19:48.608000','admin',5,'{\"models\":[{\"id\":\"e0d829dc-2d23-11eb-84d4-227918fa15ea\",\"name\":\"å‘é€é‚®ä»¶\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T00:43:07.638+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}',NULL,3,''),
('fbbf99a4-2d55-11eb-b88c-227918fa15ea','è”ç»œå•','liaison','',NULL,'2020-11-23 00:34:48.150000','admin','2020-11-23 00:37:25.131000','admin',1,'{\"modelId\":\"fbbf99a4-2d55-11eb-b88c-227918fa15ea\",\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"properties\":{\"process_id\":\"liaison\",\"name\":\"è”ç»œå•\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.flowable.org/processdef\",\"process_historylevel\":\"\",\"isexecutable\":true,\"dataproperties\":\"\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\",\"escalationdefinitions\":\"\",\"process_potentialstarteruser\":\"\",\"process_potentialstartergroup\":\"\",\"iseagerexecutionfetch\":\"false\"},\"childShapes\":[{\"resourceId\":\"startEvent1\",\"properties\":{\"overrideid\":\"\",\"name\":\"å¡«å•\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formreference\":{\"id\":\"5920a125-2d56-11eb-b88c-227918fa15ea\",\"name\":\"è”ç»œå•\",\"key\":\"liaison\"},\"formfieldvalidation\":true,\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-8837ACC1-9927-4EF2-AB27-6113B895B400\"}],\"bounds\":{\"lowerRight\":{\"x\":130,\"y\":193},\"upperLeft\":{\"x\":100,\"y\":163}},\"dockers\":[]},{\"resourceId\":\"sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\",\"properties\":{\"overrideid\":\"\",\"name\":\"å¡«å•äººç¡®è®¤\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-7BA30D19-708A-4A69-A05E-3B5FC38E05C5\"}],\"bounds\":{\"lowerRight\":{\"x\":275,\"y\":218},\"upperLeft\":{\"x\":175,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-8837ACC1-9927-4EF2-AB27-6113B895B400\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\"}],\"bounds\":{\"lowerRight\":{\"x\":174.15625,\"y\":178},\"upperLeft\":{\"x\":130.609375,\"y\":178}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\"}},{\"resourceId\":\"sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\",\"properties\":{\"overrideid\":\"\",\"name\":\"å®¡æ ¸ä¸­\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formfieldvalidation\":true,\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"categorydefinition\":\"\",\"taskidvariablename\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-0255207B-6BE7-449E-8B53-6D87AF68964A\"}],\"bounds\":{\"lowerRight\":{\"x\":420,\"y\":218},\"upperLeft\":{\"x\":320,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-7BA30D19-708A-4A69-A05E-3B5FC38E05C5\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\"}],\"bounds\":{\"lowerRight\":{\"x\":319.15625,\"y\":178},\"upperLeft\":{\"x\":275.84375,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\"}},{\"resourceId\":\"sid-7387C76A-E91A-40AA-A84A-11C8155AD7C0\",\"properties\":{\"overrideid\":\"\",\"name\":\"ç»“æŸ\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":493,\"y\":192},\"upperLeft\":{\"x\":465,\"y\":164}},\"dockers\":[]},{\"resourceId\":\"sid-0255207B-6BE7-449E-8B53-6D87AF68964A\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-7387C76A-E91A-40AA-A84A-11C8155AD7C0\"}],\"bounds\":{\"lowerRight\":{\"x\":464.375,\"y\":178},\"upperLeft\":{\"x\":420.390625,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-7387C76A-E91A-40AA-A84A-11C8155AD7C0\"}}],\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"}}','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ÿ\0\0\0@\0\0\0Õ”¡j\0\0üIDATxÚíœÏO“wÇ9xØaÇvØaGÿ€vğ@²«‰;`”şHm˜„ÖF©2ä@Œ¶q$™	Û$!sá‡f	36cBË´„¬ì°d6CãpŒ\0j…‚¾û~HkZƒ}úˆ~ûz%ß4OÚ><}ó~?ßßOE\0\0\0\0\0\0\0\0\0ÀÛˆRj_2™ì‹ÇãëÑhT\rW\"‘ˆŠÅbtq¡¯Yú‚Ä˜CCCjvvV­¬¬[æææÔİ»wçµQ«Ğ×}ÁR#™nÌ<ƒ®èšj}ÍÑ, MÑr0f®hsfĞ×}ÁÒgÛêŸ˜ıA%\"¡ÍWÃÌ©Ğ×}¡Äæ|˜øIıñË—/Ê¿‰~Ì‰¾„¿ÂÿçÀùsÊ1æD_Â_á—æh¾9ås¢/á/ƒğßş¦ÀœrŒ9Ñ—ğ—É€_¾9B_Â_&áÿ{¸½ÀœrŒ9Ñ—ğştjªÀ”/ys¢/á70üÛÓ”&ê^†}áèó¼M¡/áÌ‰¾„ŸğcNô5)ü•••û=úÉ‘#Gšôëyy­®®>pìØ±÷ŞÈè?¶ßëõvúışûN§sM_„r¹\\ëgÎœyÔÜÜ<zöìÙCr‘„Ÿğ£oi8|øğ‡:g—uØS’·-JZ¿÷µ|Î®xßãñôè»Ìò72ãããjiiI	ËËËêÁƒêæÍ›*lƒÁ™p8\\Iø	?úZC‡ú „;ôÆÆÆõŞŞ^Õ××§äUW¸ù7]ªJ^Û;ÿ®^½º QÛ±¶¶¦†‡‡U]]]¦¾¾ş;ÂOøÑ·8tëtÉH°C¡Ğ†T°[1==-ï¿h	è¼Ö—¬Æ×\'›º~ızJíyØÃéÓ§Wkjj¾\'ü„}‹ªñ7ƒ/-j©T_G~W ªÑÙÖÖv_A*•R>Ÿ/­o_`NÂ¾»êã§sÁß\ry7€´ÓéüÈRs_ŸàéëšúÛ111¡Ün÷}®0\'áGß5÷/K€/\\¸°¾“\Zÿe.^¼˜h·rí)‹„Ãái}®fDúU—JÌiŸ9·Ò}íÓWfÊr£ú“““EåMÆ\0ÇºÔşEOê/İ»w/m5ü###«ò#m.×Ä)sÚ«1úÚ§¯ÌãËqCCÃ¢•Ì555-eÿ{aÏsÓyV©@9—Âˆ9íÕ}mÕwB^»»»W­d®§§gs°P}a¥â‹l)åhNôµ?üoRc™Ç·‚|?{®ó¦×ü4ûiö¡¯ÌÑËqWW×³½®ù‡‰Ä¬ÕğÇãñy›úüø1àg”¾¹>ÿÉ“\'-µƒÁE«}şö+W®ŒX\rÿ¹sç’vŒö3ÅTŸ¡S}2;¦d	}±ÓëÙÖÄ\\Ñûl²ËzŸ,,,<·0Ï¿æt:ç˜ç\'üè»ãÜm6ıOœ8‘‘…r»]X\'ßË†ßZ…++üB¡PQµ¿\\ÈñãÇ³Âğ£ïÎÉnİıM¬›ï²T~§KêåóÙàZŞê+kûõ‰vvvívmÿ©S§u­ÿ-kû	?úµÄwL‚ìõz7nİºµ9pşªõÛ·oËfº\\s_¾÷q©š!ûåĞÒÒ’xİènW_MMÍ¢Çãùj/ööcNô5aWŸt•uîúr3n·[]ºtIåoémmmUº†ÏŸ&ì³´¦ÿU-\0é¸\\®ùk×®MoµŸ_6ø|¾çµµµãú³ŸVì˜}Mz˜‡ìğs8‘íÖèE\\—Ïí¾I+ ]ßm~×$ËveqÆï÷\'ÀÏº¶ÿŒ\'ù~ôµ§+ ÏŒ—lİ-yMÿ.ƒ9Ñ—x~Ì‰¾„ŸğcNô%ü„s¢/á\'ü˜}	?áÇœèKø	?æD_ÂOø1\'ú~Â9Ñ?áG_x‰F£ådÎemÎúš£/X ‹MË–âr0çÔÔÔÚœcèk¾`ÁÁÁCwîÜy:33óÌä\ZIŒ‰DşÑ¥\n}ÍÑ,¢ÿaõ{TšlÒg3°Èï\ZÛ+c¢/\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€ü1íe]J1›\0\0\0\0IEND®B`‚',0,'');

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
('00142c59-2e08-11eb-bbd8-227918fa15ea','å¤–å‡ºå•','out-factory','','','2020-11-21 01:08:35.114000','admin','2020-11-23 21:49:06.087000','admin',NULL,7,'{\"models\":[{\"id\":\"1670ce87-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"å¤–å‡ºå•\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-21T07:08:14.341+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','5eef80ba-2bc8-11eb-9d15-227918fa15ea',3,''),
('59d16cce-2bc9-11eb-9d15-227918fa15ea','å¤–å‡ºå•','out-factory','','','2020-11-21 01:08:35.114000','admin','2020-11-21 01:15:36.025000','admin',NULL,2,'{\"models\":[{\"id\":\"1670ce87-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"å¤–å‡ºå•\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-21T07:08:14.341+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','5eef80ba-2bc8-11eb-9d15-227918fa15ea',3,''),
('5c07a9bf-2d58-11eb-b88c-227918fa15ea','è¿”å» ç”³è«‹å–®','rehire-form','','','2020-11-23 00:51:34.284000','admin','2020-11-23 00:51:48.931000','admin',NULL,1,'{\"models\":[{\"id\":\"29d7751a-2d58-11eb-b88c-227918fa15ea\",\"name\":\"è¿”å» ç”³è«‹å–®\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T06:51:13.197+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','534cb54d-2d58-11eb-b88c-227918fa15ea',3,''),
('673da99c-2bc8-11eb-9d15-227918fa15ea','å¤–å‡ºå•','out-factory','','','2020-11-21 01:08:35.114000','admin','2020-11-21 01:08:49.048000','admin',NULL,1,'{\"models\":[{\"id\":\"1670ce87-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"å¤–å‡ºå•\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-21T07:08:14.341+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','5eef80ba-2bc8-11eb-9d15-227918fa15ea',3,''),
('6d819305-2e03-11eb-8edb-227918fa15ea','å¤–å‡ºå•','out-factory','','','2020-11-21 01:08:35.114000','admin','2020-11-23 21:16:22.192000','admin',NULL,5,'{\"models\":[{\"id\":\"1670ce87-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"å¤–å‡ºå•\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-21T07:08:14.341+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','5eef80ba-2bc8-11eb-9d15-227918fa15ea',3,''),
('78482ee3-2e06-11eb-84ba-227918fa15ea','å¤–å‡ºå•','out-factory','','','2020-11-21 01:08:35.114000','admin','2020-11-23 21:38:08.761000','admin',NULL,6,'{\"models\":[{\"id\":\"1670ce87-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"å¤–å‡ºå•\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-21T07:08:14.341+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','5eef80ba-2bc8-11eb-9d15-227918fa15ea',3,''),
('9c5bbd37-2d55-11eb-b88c-227918fa15ea','MESéœ€æ±‚å˜æ›´','mes-requirement','','','2020-11-23 00:31:51.313000','admin','2020-11-23 00:32:08.366000','admin',NULL,1,'{\"models\":[{\"id\":\"5c4e9a62-2d54-11eb-b88c-227918fa15ea\",\"name\":\"MESéœ€æ±‚å˜æ›´\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T06:29:43.197+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','9231a865-2d55-11eb-b88c-227918fa15ea',3,''),
('9f2238d4-2e0b-11eb-b42b-227918fa15ea','å¤–å‡ºå•','out-factory','','','2020-11-21 01:08:35.114000','admin','2020-11-23 22:15:01.427000','admin',NULL,8,'{\"models\":[{\"id\":\"1670ce87-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"å¤–å‡ºå•\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-21T07:08:14.341+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','5eef80ba-2bc8-11eb-9d15-227918fa15ea',3,''),
('a62f087e-2e00-11eb-8699-227918fa15ea','å¤–å‡ºå•','out-factory','','','2020-11-21 01:08:35.114000','admin','2020-11-23 20:56:28.791000','admin',NULL,4,'{\"models\":[{\"id\":\"1670ce87-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"å¤–å‡ºå•\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-21T07:08:14.341+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','5eef80ba-2bc8-11eb-9d15-227918fa15ea',3,''),
('a8390ae9-2d56-11eb-b88c-227918fa15ea','è”ç»œå•','liaison','','','2020-11-23 00:39:24.265000','admin','2020-11-23 00:39:37.768000','admin',NULL,1,'{\"models\":[{\"id\":\"fbbf99a4-2d55-11eb-b88c-227918fa15ea\",\"name\":\"è”ç»œå•\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T06:37:25.131+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','a02ca5f7-2d56-11eb-b88c-227918fa15ea',3,''),
('bd89797a-2d57-11eb-b88c-227918fa15ea','FI','vendor-code-request-form','',NULL,'2020-11-23 00:47:10.170000','admin','2020-11-23 00:47:10.170000','admin','2020-11-23 00:47:23.024000',1,'{}','b5e01c19-2d57-11eb-b88c-227918fa15ea',3,''),
('be76d613-2d29-11eb-b92b-227918fa15ea','å‘é€é‚®ä»¶','send-email','','','2020-11-22 18:43:32.307000','admin','2020-11-22 19:18:07.726000','admin',NULL,3,'{\"models\":[{\"id\":\"e0d829dc-2d23-11eb-84d4-227918fa15ea\",\"name\":\"å‘é€é‚®ä»¶\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T00:43:07.638+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','e96a6b2d-2d24-11eb-84d4-227918fa15ea',3,''),
('ce82913d-2d57-11eb-b88c-227918fa15ea','FIå‚å•†ä»£ç ç”³è¯·å•','vendor-code-request-form','','','2020-11-23 00:47:35.589000','admin','2020-11-23 00:47:51.500000','admin',NULL,1,'{\"models\":[{\"id\":\"8e54d196-2d57-11eb-b88c-227918fa15ea\",\"name\":\"FIå» å•†ä»£ç¢¼ç”³è«‹å–®\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T06:46:51.838+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','c506bdcb-2d57-11eb-b88c-227918fa15ea',3,''),
('d4f4b22d-2d28-11eb-9045-227918fa15ea','å‘é€é‚®ä»¶','send-email','','','2020-11-22 18:43:32.307000','admin','2020-11-22 19:11:35.968000','admin',NULL,2,'{\"models\":[{\"id\":\"e0d829dc-2d23-11eb-84d4-227918fa15ea\",\"name\":\"å‘é€é‚®ä»¶\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T00:43:07.638+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','e96a6b2d-2d24-11eb-84d4-227918fa15ea',3,''),
('f1af6c4f-2d24-11eb-84d4-227918fa15ea','å‘é€é‚®ä»¶','send-email','','','2020-11-22 18:43:32.307000','admin','2020-11-22 18:43:46.181000','admin',NULL,1,'{\"models\":[{\"id\":\"e0d829dc-2d23-11eb-84d4-227918fa15ea\",\"name\":\"å‘é€é‚®ä»¶\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T00:43:07.638+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','e96a6b2d-2d24-11eb-84d4-227918fa15ea',3,''),
('fa9798d4-2d29-11eb-9782-227918fa15ea','å‘é€é‚®ä»¶','send-email','','','2020-11-22 18:43:32.307000','admin','2020-11-22 19:19:48.608000','admin',NULL,4,'{\"models\":[{\"id\":\"e0d829dc-2d23-11eb-84d4-227918fa15ea\",\"name\":\"å‘é€é‚®ä»¶\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-23T00:43:07.638+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','e96a6b2d-2d24-11eb-84d4-227918fa15ea',3,''),
('fcb5a43f-2bcb-11eb-9e90-227918fa15ea','å¤–å‡ºå•','out-factory','','','2020-11-21 01:08:35.114000','admin','2020-11-21 01:34:28.305000','admin',NULL,3,'{\"models\":[{\"id\":\"1670ce87-2bc7-11eb-9d15-227918fa15ea\",\"name\":\"å¤–å‡ºå•\",\"version\":1,\"modelType\":0,\"description\":\"\",\"stencilSetId\":null,\"createdBy\":\"admin\",\"lastUpdatedBy\":\"admin\",\"lastUpdated\":\"2020-11-21T07:08:14.341+00:00\"}],\"theme\":\"theme-1\",\"icon\":\"glyphicon-asterisk\"}','5eef80ba-2bc8-11eb-9d15-227918fa15ea',3,'');

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
('0088e735-2e08-11eb-bbd8-227918fa15ea','å¤–å‡ºå•',7,'out-factory',NULL,'0087d5c3-2e08-11eb-bbd8-227918fa15ea','','form-out-factory.form',NULL),
('59f9191a-2bc9-11eb-9d15-227918fa15ea','å¤–å‡ºå•',2,'out-factory',NULL,'59f87cd8-2bc9-11eb-9d15-227918fa15ea','','form-out-factory.form',NULL),
('5c2f560b-2d58-11eb-b88c-227918fa15ea','è¿”å» ç”³è«‹å–®',1,'rehire-form',NULL,'5c2e1d89-2d58-11eb-b88c-227918fa15ea','','form-rehire-form.form',NULL),
('67920b38-2bc8-11eb-9d15-227918fa15ea','å¤–å‡ºå•',1,'out-factory',NULL,'67900f66-2bc8-11eb-9d15-227918fa15ea','','form-out-factory.form',NULL),
('6ddf1c61-2e03-11eb-8edb-227918fa15ea','å¤–å‡ºå•',5,'out-factory',NULL,'6ddd479f-2e03-11eb-8edb-227918fa15ea','','form-out-factory.form',NULL),
('78ad806f-2e06-11eb-84ba-227918fa15ea','å¤–å‡ºå•',6,'out-factory',NULL,'78ace42d-2e06-11eb-84ba-227918fa15ea','','form-out-factory.form',NULL),
('9ca919f3-2d55-11eb-b88c-227918fa15ea','MESéœ€æ±‚å˜æ›´',1,'mes-requirement',NULL,'9ca87db1-2d55-11eb-b88c-227918fa15ea','','form-mes-requirement.form',NULL),
('9fd471e0-2e0b-11eb-b42b-227918fa15ea','å¤–å‡ºå•',8,'out-factory',NULL,'9fd29d1e-2e0b-11eb-b42b-227918fa15ea','','form-out-factory.form',NULL),
('a68f29ea-2e00-11eb-8699-227918fa15ea','å¤–å‡ºå•',4,'out-factory',NULL,'a68df168-2e00-11eb-8699-227918fa15ea','','form-out-factory.form',NULL),
('a867e325-2d56-11eb-b88c-227918fa15ea','è”ç»œå•',1,'liaison',NULL,'a86746e3-2d56-11eb-b88c-227918fa15ea','','form-liaison.form',NULL),
('ceab9d19-2d57-11eb-b88c-227918fa15ea','FIå‚å•†ä»£ç ç”³è¯·å•',1,'vendor-code-request-form',NULL,'ceaa8ba7-2d57-11eb-b88c-227918fa15ea','','form-vendor-code-request-form.form',NULL),
('fcf6a4eb-2bcb-11eb-9e90-227918fa15ea','å¤–å‡ºå•',3,'out-factory',NULL,'fcf5e199-2bcb-11eb-9e90-227918fa15ea','','form-out-factory.form',NULL);

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
('0087d5c3-2e08-11eb-bbd8-227918fa15ea','å¤–å‡ºå•',NULL,'2020-11-23 21:49:06.845','','0020fd9a-2e08-11eb-bbd8-227918fa15ea'),
('59f87cd8-2bc9-11eb-9d15-227918fa15ea','å¤–å‡ºå•',NULL,'2020-11-21 01:15:36.281','','59d4c82f-2bc9-11eb-9d15-227918fa15ea'),
('5c2e1d89-2d58-11eb-b88c-227918fa15ea','è¿”å» ç”³è«‹å–®',NULL,'2020-11-23 00:51:49.183','','5c0ab700-2d58-11eb-b88c-227918fa15ea'),
('67900f66-2bc8-11eb-9d15-227918fa15ea','å¤–å‡ºå•',NULL,'2020-11-21 01:08:49.588','','6747bbbd-2bc8-11eb-9d15-227918fa15ea'),
('6ddd479f-2e03-11eb-8edb-227918fa15ea','å¤–å‡ºå•',NULL,'2020-11-23 21:16:22.793','','6d8b08e6-2e03-11eb-8edb-227918fa15ea'),
('78ace42d-2e06-11eb-84ba-227918fa15ea','å¤–å‡ºå•',NULL,'2020-11-23 21:38:09.421','','784ff714-2e06-11eb-84ba-227918fa15ea'),
('9ca87db1-2d55-11eb-b88c-227918fa15ea','MESéœ€æ±‚å˜æ›´',NULL,'2020-11-23 00:32:08.869','','9c6707d8-2d55-11eb-b88c-227918fa15ea'),
('9fd29d1e-2e0b-11eb-b42b-227918fa15ea','å¤–å‡ºå•',NULL,'2020-11-23 22:15:02.583','','9f3105e5-2e0b-11eb-b42b-227918fa15ea'),
('a68df168-2e00-11eb-8699-227918fa15ea','å¤–å‡ºå•',NULL,'2020-11-23 20:56:29.413','','a6360d5f-2e00-11eb-8699-227918fa15ea'),
('a86746e3-2d56-11eb-b88c-227918fa15ea','è”ç»œå•',NULL,'2020-11-23 00:39:38.071','','a83efe5a-2d56-11eb-b88c-227918fa15ea'),
('ceaa8ba7-2d57-11eb-b88c-227918fa15ea','FIå‚å•†ä»£ç ç”³è¯·å•',NULL,'2020-11-23 00:47:51.762','','ce8661ce-2d57-11eb-b88c-227918fa15ea'),
('fcf5e199-2bcb-11eb-9e90-227918fa15ea','å¤–å‡ºå•',NULL,'2020-11-21 01:34:28.726','','fcbc33f0-2bcb-11eb-9e90-227918fa15ea');

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
('0087d5c4-2e08-11eb-bbd8-227918fa15ea','form-out-factory.form','0087d5c3-2e08-11eb-bbd8-227918fa15ea','{\"name\":\"å¤–å‡ºå•\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"ä¸»æ—¨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"äººå‘˜ç¼–å·\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\",\"name\":\"å…è®¸è·³è¿‡\",\"type\":\"boolean\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"skip\",\"name\":\"æ˜¯å¦è·³è¿‡\",\"type\":\"boolean\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"æè¿°\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('3156e01e-2df0-11eb-a430-227918fa15ea','form-fcf6a4eb-2bcb-11eb-9e90-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"222222\",\"description\":\"    22222222222222222\"}}'),
('3abd3c17-2e00-11eb-8699-227918fa15ea','form-fcf6a4eb-2bcb-11eb-9e90-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"5555555555\",\"description\":\"    55555555555555555555555\"}}'),
('3b44e6cd-2e04-11eb-8e8e-227918fa15ea','form-6ddf1c61-2e03-11eb-8edb-227918fa15ea',NULL,'{\"values\":{\"summary\":\"23333\",\"empid\":\"322\",\"description\":\"22222232\"}}'),
('40d81cf9-2dfe-11eb-b3f3-227918fa15ea','form-fcf6a4eb-2bcb-11eb-9e90-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"1111\",\"description\":\"11111111111\"}}'),
('59f87cd9-2bc9-11eb-9d15-227918fa15ea','form-out-factory.form','59f87cd8-2bc9-11eb-9d15-227918fa15ea','{\"name\":\"å¤–å‡ºå•\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"ä¸»æ—¨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"äººå‘˜ç¼–å·\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"æè¿°\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('5c2e1d8a-2d58-11eb-b88c-227918fa15ea','form-rehire-form.form','5c2e1d89-2d58-11eb-b88c-227918fa15ea','{\"name\":\"è¿”å» ç”³è«‹å–®\",\"key\":\"rehire-form\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null}],\"outcomes\":[]}'),
('6760f3d9-2bc9-11eb-9d15-227918fa15ea','form-59f9191a-2bc9-11eb-9d15-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"11111111111\",\"description\":\"11111111111\"}}'),
('676909bc-2df0-11eb-9bca-227918fa15ea','form-fcf6a4eb-2bcb-11eb-9e90-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"3333333333333333\",\"description\":\"    3333333333333333333333\"}}'),
('67900f67-2bc8-11eb-9d15-227918fa15ea','form-out-factory.form','67900f66-2bc8-11eb-9d15-227918fa15ea','{\"name\":\"å¤–å‡ºå•\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"ä¸»æ—¨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"äººå‘˜ç¼–å·\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"æè¿°\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('6ddd47a0-2e03-11eb-8edb-227918fa15ea','form-out-factory.form','6ddd479f-2e03-11eb-8edb-227918fa15ea','{\"name\":\"å¤–å‡ºå•\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"ä¸»æ—¨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"äººå‘˜ç¼–å·\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"æè¿°\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('78ace42e-2e06-11eb-84ba-227918fa15ea','form-out-factory.form','78ace42d-2e06-11eb-84ba-227918fa15ea','{\"name\":\"å¤–å‡ºå•\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"ä¸»æ—¨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"äººå‘˜ç¼–å·\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"æè¿°\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('7bb91f72-2bca-11eb-9e90-227918fa15ea','form-59f9191a-2bc9-11eb-9d15-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"1111111111\",\"description\":\"11111111111111\"}}'),
('9ca87db2-2d55-11eb-b88c-227918fa15ea','form-mes-requirement.form','9ca87db1-2d55-11eb-b88c-227918fa15ea','{\"name\":\"MESéœ€æ±‚å˜æ›´\",\"key\":\"mes-requirement\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"ä¸»æ—¨\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"ææ¡ˆäººå‘˜\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"éœ€æ±‚å˜æ›´æè¿°\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('9fd29d1f-2e0b-11eb-b42b-227918fa15ea','form-out-factory.form','9fd29d1e-2e0b-11eb-b42b-227918fa15ea','{\"name\":\"å¤–å‡ºå•\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"ä¸»æ—¨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"äººå‘˜ç¼–å·\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\",\"name\":\"å…è®¸è·³è¿‡\",\"type\":\"boolean\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"skip\",\"name\":\"æ˜¯å¦è·³è¿‡\",\"type\":\"boolean\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"manager\",\"name\":\"æ‰€å±ä¸»ç®¡\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":true,\"overrideId\":true,\"placeholder\":\"manager\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"æè¿°\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('9fe9c24b-2df0-11eb-8e96-227918fa15ea','form-fcf6a4eb-2bcb-11eb-9e90-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"44444444444444444\",\"description\":\"    444444444444444\"}}'),
('a2c783c1-2bc8-11eb-9d15-227918fa15ea','form-67920b38-2bc8-11eb-9d15-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"111111\",\"description\":\"1111111111111\"}}'),
('a4411eed-2e04-11eb-b39c-227918fa15ea','form-6ddf1c61-2e03-11eb-8edb-227918fa15ea',NULL,'{\"values\":{\"summary\":\"test\",\"empid\":\"222\",\"description\":\"    222222222222222222\"}}'),
('a68df169-2e00-11eb-8699-227918fa15ea','form-out-factory.form','a68df168-2e00-11eb-8699-227918fa15ea','{\"name\":\"å¤–å‡ºå•\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"ä¸»æ—¨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"äººå‘˜ç¼–å·\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"æè¿°\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}'),
('a86746e4-2d56-11eb-b88c-227918fa15ea','form-liaison.form','a86746e3-2d56-11eb-b88c-227918fa15ea','{\"name\":\"è”ç»œå•\",\"key\":\"liaison\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"subject\",\"name\":\"ä¸»é¢˜\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${subject}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"department\",\"name\":\"æ¥æ”¶å•ä½\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${department}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"content\",\"name\":\"æ­£æ–‡\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${content}\",\"layout\":null}],\"outcomes\":[]}'),
('b01fe4f3-2e00-11eb-8699-227918fa15ea','form-a867e325-2d56-11eb-b88c-227918fa15ea',NULL,'{\"values\":{\"subject\":\"äºŒåå››\",\"department\":\"2222222222\",\"content\":\"222222222222222222\"}}'),
('ceaa8ba8-2d57-11eb-b88c-227918fa15ea','form-vendor-code-request-form.form','ceaa8ba7-2d57-11eb-b88c-227918fa15ea','{\"name\":\"FIå‚å•†ä»£ç ç”³è¯·å•\",\"key\":\"vendor-code-request-form\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"label\",\"name\":\"Label\",\"type\":\"multi-line-text\",\"value\":null,\"required\":false,\"readOnly\":false,\"overrideId\":false,\"placeholder\":null,\"layout\":null}],\"outcomes\":[]}'),
('d5a5f3f8-2d6d-11eb-aadf-227918fa15ea','form-fcf6a4eb-2bcb-11eb-9e90-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"1111111111\",\"description\":\"    1111111111111111111\"}}'),
('d805df43-2d4c-11eb-9afa-227918fa15ea','form-fcf6a4eb-2bcb-11eb-9e90-227918fa15ea',NULL,'{\"values\":{\"summary\":\"test\",\"empid\":\"11\",\"description\":\"1\"}}'),
('df372756-2ef9-11eb-aabd-227918fa15ea','form-9fd471e0-2e0b-11eb-b42b-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"33333\",\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\":true,\"manager\":\"manager\",\"description\":\"    3333333333333\",\"skip\":true}}'),
('f26245c2-2e06-11eb-bbd8-227918fa15ea','form-78ad806f-2e06-11eb-84ba-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"2222\",\"description\":\"    22222222222222222222\"}}'),
('f880f1d6-2e0b-11eb-b5e4-227918fa15ea','form-9fd471e0-2e0b-11eb-b42b-227918fa15ea',NULL,'{\"values\":{\"summary\":\"summary\",\"empid\":\"123123\",\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\":true,\"manager\":\"manager\",\"description\":\"    21313213\",\"skip\":true}}'),
('fcf5e19a-2bcb-11eb-9e90-227918fa15ea','form-out-factory.form','fcf5e199-2bcb-11eb-9e90-227918fa15ea','{\"name\":\"å¤–å‡ºå•\",\"key\":\"out-factory\",\"version\":0,\"fields\":[{\"fieldType\":\"FormField\",\"id\":\"summary\",\"name\":\"ä¸»æ—¨\",\"type\":\"text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${summary}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"empid\",\"name\":\"äººå‘˜ç¼–å·\",\"type\":\"integer\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${empid}\",\"layout\":null},{\"fieldType\":\"FormField\",\"id\":\"description\",\"name\":\"æè¿°\",\"type\":\"multi-line-text\",\"value\":null,\"required\":true,\"readOnly\":false,\"overrideId\":true,\"placeholder\":\"${description}\",\"layout\":null}],\"outcomes\":[]}');

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
('00223620-2e08-11eb-bbd8-227918fa15ea',1,'out-factory.bpmn','0022361f-2e08-11eb-bbd8-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"å¤–å‡ºå•\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"å¡«å•\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"ç”³è¯·äººç¡®è®¤\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${skip}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"ä¸»ç®¡å®¡æ ¸\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('00860101-2e08-11eb-bbd8-227918fa15ea',1,'out-factory.out-factory.png','0022361f-2e08-11eb-bbd8-227918fa15ea','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0÷\0\0\0ä\0\0\0…@m¦\0\0~IDATxÚíİ}ˆUuŸ\0ğ*z\"\"‚ú#Ú¨Øh%\"\"ˆ6Ú\"‚ˆè‰6zs¦§Ü4³\'ª5éÅ\"{µ—­ˆ·6DÌu]5g|Í”Ş°YCV7µÌœÆm}Ì§1Ó<{¾Ïì™ë¼ÜÑy¹wæó/3÷Ü;÷Şï|¿ç÷ûsîï~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ô³$IŞ´iÓ¬5kÖüÖØØ˜,^¼Xôs444$+V¬øŸ4êäŠ9ô²(Ê+W®LZZZ’½{÷ŠŠ;v$Ë—/ß•é›äj9ô²m)ÊSœ÷¦£°õrHµzYL£*Š•iaŞ\'‡ÄPË! —Åz‚XQ…9‘Cb¨å0@…ù/ŞlúôOÉW\rgßÇ6ÅTa–Cr¨ÂÂ¼{ç¶dİ¢)É—óïo±-îSP5w9$‡€*+Ì[¿ú·CŠrß}5OAÕÜåª­0¯_út§…9îSP5w9$‡€*+Ìë?ÚiaûTÍ]É!@aš»’CÀ@æ8²¹³Â÷)¨š»’C@•æ«ş©ÓÂ÷)¨š»’C@•æ·5%ë>|äĞéÔt[Ü§ jîrHUV˜#66ãÂÛS…YÉ! \Zó/¿$?şçC§SÓmqŸ‚ª¹Ë!9TQa«‡mXõJ§ë¥qŸ+ŒiîrHÕP˜ÓÑÔöK’ÿ\\øå<â1ñX#0Í]É! Bsw#-#0…YÉ! Ê\ns9#­®F`\n¬æ.‡äPa…ùp‹r\n¬æ.‡äPa…Y(ÌrHš»ĞÜ…f¡¹9(Ì\n³š;t%I’ß755Õ¿óÎ;Ë§M›¶kÂ„	ûF\Z•><©««;p×]wí<yò¦§Ÿ~zf\Z£¹…YÉ¡S[[ûW555w§5zV\ZÓØõ:=ilNï›“~ıc<N‡¢M}öìÙ3¦NºoâÄ‰Éë¯¿¬Y³&Ù¶m[²gÏ$Ä×–––äóÏ?OÒæŸÜsÏ=î½÷Ş-cÇ£¹…YÉ¡şsë­·ş}\Z‹ÓØ{°™—KÓÇ×éxCDÚÄG?ñÄ¿ÜÿıYãŞ¿R®µk×&>øàşúúúõ7ß|óÙš»P˜åê;iƒ>3mĞ{ĞĞ;Š•ƒ©^sèhıè¹sç.¹óÎ;“yóæõ¨©—Z¸pa2zôèÖÁ2ŠW˜f9$‡*MMMÍğ#Füo±Q×ÖÖ&O=õT²dÉ’äÛo¿M~úé§¬&ÿüóÏÙÌëªU«’éÓ§\'·İv[iƒßm?Hû²eË>?~|²aÃ†¤7lÙ²%IwZÇŒóš»ĞÜåêÕÆş‡´ï/6õ™3gfK¥åØ¹sgöøø¹b“OŸsŒ8ˆÄˆ=\Z{¹‰Q®x¾tô^õ{„\n³Â,‡äP%Ø‹}Ò¤IÙ(ıpÄÏÅlIƒ7‚,kì1ß[#öFğ·ß~ûÎ4a†iîBsrèÈÖØ‹Sñ<òHÛÔûáŠ)û\'Ÿ|²tŠ~˜îXİÓñ¿üñÇ÷Æ\Z{_š?~kmmíjÍ]hîB¾´±7GìGÚØ‹\r¾d¿R‡¬bsæÌù—xCıõ×¤¯7®¹Z§{f…YÉ¡§»×Øw*¾«)úâ\Z¼éù*µÇyìqº[øòË/÷Vëè]aV˜åª€æ¾8o¼q0\\_xï½÷ŒŞ«]\\y.¢;’SŞzjôèÑÍ±fTI,iüÂ¬0Ë!9TÉ9W”Ë¢‹Ñõ?şØ\'5:¢/9MîLİ²ÊÄ%eß|óÍ¤?MŸ>}m\\ú°Rş\nÓO‹kjjşVaV˜åªÄ:xIÙìqÏ<óL_×ébsÿ£nYeâZñqIÙşôñÇoI“e^¥ıQbAG{Ğ\n³Â,‡äĞ@æĞÁkÅg÷/[¶¬Oët\\è¦ğ»ÌÓ-«L|ÌöíÛûµ¹777·¤É²µ‚ÿ¨Úö ‹\\\n³Â,‡äĞ@æĞÁÉ¶÷öt¥âJv…ßc«nYeâÓİòé/ñzñéD•şGUÜƒi2…Ya–Crh s(ÖüvoşÖÕiq…×Ş£[V™xãÂ~ÀÁ€„Â\\Y!‡ÄPÌ¡<ú»Në–UfäÈ‘ú{äŞÚÚÚ\\%#÷OãÚÍW\\qÅÑ•4¥ºzõêäüóÏO\ZÛm?öØcãL£.9$i>—İÈ®?~o¯¹ÿı÷ÿUákîí\nò@¬—Îš5+ŠNöµô¾Ø»şúë³KNŞpÃ\rÉ	\'œE<ş˜ci»=nÜ¸NŸwîÜ¹eıq&Åé§ŸïY»íq\nÎµ×^›ÔÕÕ%_ıuÛö+¯¼2¹æškæ\nÈ¡\"Î‹¾à‚y?óxã7²üøä“OÚ¶Í™3\'Ûöá‡vú¼¯¼òJ–s‘/İ—¶>õÔSÙvÆg$»víÒÜËÌ!kî”mÊ”)ûûhùE‹ıG…-¿:®şTZû£0Ç(<\nhwÑYQ.wäşî»ïvZ¨ãg‹¯ÕÔÔ”œtÒIí¶İrË-mŸ1cFrá…&ëÖ­kÛvŞyç%×]wİP.Ì–CåşŸED“/½/râøão÷~_}õÕÉ¹çÛn[äÉk¯½VV¾ÆãJ›{¼~GCÍ½ër´<e{öÙgßìïóÜÓçü\n;Ï½ÃQÖ@4÷‰\'f…7¾vt;š{Áøş­·ŞÊ¶w6rŸ?ş!¯óÒK/eëèßÍüòË/O.¹ä’äí·ßNÎ>ûìdØ°aÉÖ­[“åË—gÏÛ»úwœ|òÉÙ¬Â,ÌCEÌ°”Ó„#ÿ\"Ïb&híÚµY#Û\'xb–,HÎ:ë¬lI(7oîñsñ#q;¾æÛòæ39ùëD^ÆgX\\|ñÅmùtÎ9çÄ‡J%+W®êÍ½Ûr;e{øá‡ÿúî»ïş­¯P·gÄˆ_Wã*eä¿GÆhî=¹§ÿ÷ÙóÄ4jGÓı§œrJV cZö¸ãët4–ìÒF#¿8À¥C+£¹ÇºiäIéßzö¾Å×âöØËwüº‹…Çs›vG‘/ÏDn_tÑEYcÿı÷“¥K—¶íäßÇW—Ÿí^\\¡.­ûúã\nuuuu\\¡®ÊMš4é¿ûëÚò‹-šY­×*®”‘{ŞÈ£wÖ€#bDTú:1\"‹û.»ì²NGõùiì(ÄH.f\0b[’«®º*kîyÁ.6÷İ»wg;ê¨£²ïæÊ›–ïêXxÿ#¯â½ë,¢A›{wyM;7¾æÇcäÍ=\ZE>İy\\:ÍÿØceË=±Ş¯¹wÏµå)ÛwÜqó}÷İ·¯Fï;Ó‘ã>®óæİÒ\"œß.6÷qÅwl/6Ó|[ékÄãc{4ìø\ZkjÅûcª4/ÀysF³±=^3nçë¨ÑØ‹Í=¦nó‚]:« 0\\sƒ»\Za£Èwğâ½î(Š\r¸Ü‘{ø·£ÁÇÎaÌ9uêÔ,¯&L˜L<9»?òGs/«¹÷ù§Â¥uú€O…$êëë›úúóÜc}?ö»[—4-ßıu¥Í=ÖºóÈ×ß‹Ï¿qãÆì¾5Åô{¬ŸÆ÷1ÊÊóê«¯f?>oî1ŸÿnyA/mî1½ºyóæl´àÅ\ZmX§0WFsµìÈ“f„\"âxŠÒÑ{9Ï¹OÆåìÙ³³ç¯q;¶çÍ=?#fb™ \Z{Ì8=÷ÜsÉ”)S²Ÿ{ñÅMË÷l}~i_}{:ĞÛ_µWk½æÿ“åÌ´˜·nØ°¡O\Z{SSÓÜô5¶§{Ãªõÿ¨Ò¦åãHæt§¬Û‘ûgŸ}–Î#§ø¾8ÊéùâøÅæ½»‘{ì0ÄAWùï£´üˆüx@a®¢iùîFîñŞh/wä;¡ùÑò1€ˆ3,\"ÿ^%{ŞØ)ĞÜ{V¯ÓØ‘7áø»;Ò=İQ/®³ï®æzMA]]]mZ¤niiéÕÆşİwß}”6Šoª}z§R¦å#¢ Æí˜ÖìjägBDam¥Ó/¼ğBö¸8ˆ.NkË›{¾æ£¯ä¿[œœîÅ·5÷˜b‘zş;Äè,\nDÜ£øØ#3…¹ºš{g#÷˜É)mîå¬¹—\n;§vZ‘“7Şxc–Ïq>½æ^¾šššáùÁuùşp§èãçJFì¦ã›ÚÚÚÑcÇİİ[#ø±GcOñÁjÿ¿éÏÂ#™(²hbZ=¦ÔcÔÑš{4í(–ñ}œÖté¥—¶;½ôuâÀ¸˜VÏgbM4¦rãû(Äq$s|E¸Ø¢ùÇº}iÅ¼¹¹¹íyã ªÙñÅ\nó\06÷îF×¥£ì8‹¢³õö|¶(îxÿ#\'âûÈÅ¸?¾ÆíØ^¼ŞA¬Iwô³À‡z¨İ’P¬ûÇæŞãü¨bƒ5ø¨	ñ÷WîQñqğ\\q=b0Ôk:Ù#LGñ»>øàƒ¿ÁAv;Ÿşù?ÅT|$à`ø©¤K‡ÆeŞèóÆç½æÅ:¦Ôôüè(¸;vìh7½ßÕUÊæÊË¡x¿Š§¼u•ô¾Ê¡×ë4v›s4ù¨q¡›•çSö1³W‹ò—_~99räo%WÅÛ=Xê5]¬é¤\r¢±¾¾¾9}µöä<ö´P¼—î|\Zc¦5›J¿.x4ú|Z\\a–Cbh4÷¼^O‘;ÌXi}h5ù›¢É\Z5ªeÚ´i_}ôÑGß¤{~Ûó›‰‰kÅ744üû£>º İcÜI{ƒí(K…Ya–Cr¨ÒëõÁ&¿¯\'M}0ÖkÊWFJ“fâÁkoO	Ê?-(>T ®=—(ÌW2R˜f9$‡ÔkĞÜ…Â,‡ä 0Í]È!@aV˜åĞÜ…Ya–CBsf…YÉ!@s\n³’C€Â,4w!‡\0…Ya–CBsf…Y	ÍP˜f9$‡\0Í](ÌrH\n³ĞÜ…f…Y	ÍP˜f9$4w@aV˜å4w¡0Ë!9(ÌBsrP˜fÍ]hî€Â¬0Ë!¡¹\n³Â,‡ä ¹…YÉ! Z466*ˆ•{ÒÂ¼O‰¡–C@/[±bÅö––E±bÛ¶mÿšæõrHµzÙ’%K®_¶lÙŸøá‡VÅqàF[Q”\Z\Z¾Iã&9$†Z} -H÷ö?é¼X¯ıñÿ¾¾š‹²’C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@Áÿ\"òĞÔG+ \0\0\0\0IEND®B`‚',1),
('2cbc1318-2d3d-11eb-a3a6-227918fa15ea',1,'???.bpmn20.xml','2cbc1317-2d3d-11eb-a3a6-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"å¤–å‡ºå•\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"å¡«å•\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"ç”³è¯·äººç¡®è®¤\" flowable:assignee=\"$INITIATOR\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${_FLOWABLE_SKIP_EXPRESSION_ENABLED==true}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"ä¸»ç®¡å®¡æ ¸\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('2d2b2899-2d3d-11eb-a3a6-227918fa15ea',1,'???.out-factory.png','2cbc1317-2d3d-11eb-a3a6-227918fa15ea','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0÷\0\0\0ä\0\0\0…@m¦\0\0~IDATxÚíİ}ˆUuŸ\0ğ*z\"\"‚ú#Ú¨Øh%\"\"ˆ6Ú\"‚ˆè‰6zs¦§Ü4³\'ª5éÅ\"{µ—­ˆ·6DÌu]5g|Í”Ş°YCV7µÌœÆm}Ì§1Ó<{¾Ïì™ë¼ÜÑy¹wæó/3÷Ü;÷Şï|¿ç÷ûsîï~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ô³$IŞ´iÓ¬5kÖüÖØØ˜,^¼Xôs444$+V¬øŸ4êäŠ9ô²(Ê+W®LZZZ’½{÷ŠŠ;v$Ë—/ß•é›äj9ô²m)ÊSœ÷¦£°õrHµzYL£*Š•iaŞ\'‡ÄPË! —Åz‚XQ…9‘Cb¨å0@…ù/ŞlúôOÉW\rgßÇ6ÅTa–Cr¨ÂÂ¼{ç¶dİ¢)É—óïo±-îSP5w9$‡€*+Ì[¿ú·CŠrß}5OAÕÜåª­0¯_út§…9îSP5w9$‡€*+Ìë?ÚiaûTÍ]É!@aš»’CÀ@æ8²¹³Â÷)¨š»’C@•æ«ş©ÓÂ÷)¨š»’C@•æ·5%ë>|äĞéÔt[Ü§ jîrHUV˜#66ãÂÛS…YÉ! \Zó/¿$?şçC§SÓmqŸ‚ª¹Ë!9TQa«‡mXõJ§ë¥qŸ+ŒiîrHÕP˜ÓÑÔöK’ÿ\\øå<â1ñX#0Í]É! Bsw#-#0…YÉ! Ê\ns9#­®F`\n¬æ.‡äPa…ùp‹r\n¬æ.‡äPa…Y(ÌrHš»ĞÜ…f¡¹9(Ì\n³š;t%I’ß755Õ¿óÎ;Ë§M›¶kÂ„	ûF\Z•><©««;p×]wí<yò¦§Ÿ~zf\Z£¹…YÉ¡S[[ûW555w§5zV\ZÓØõ:=ilNï›“~ıc<N‡¢M}öìÙ3¦NºoâÄ‰Éë¯¿¬Y³&Ù¶m[²gÏ$Ä×–––äóÏ?OÒæŸÜsÏ=î½÷Ş-cÇ£¹…YÉ¡şsë­·ş}\Z‹ÓØ{°™—KÓÇ×éxCDÚÄG?ñÄ¿ÜÿıYãŞ¿R®µk×&>øàşúúúõ7ß|óÙš»P˜åê;iƒ>3mĞ{ĞĞ;Š•ƒ©^sèhıè¹sç.¹óÎ;“yóæõ¨©—Z¸pa2zôèÖÁ2ŠW˜f9$‡*MMMÍğ#Füo±Q×ÖÖ&O=õT²dÉ’äÛo¿M~úé§¬&ÿüóÏÙÌëªU«’éÓ§\'·İv[iƒßm?Hû²eË>?~|²aÃ†¤7lÙ²%IwZÇŒóš»ĞÜåêÕÆş‡´ï/6õ™3gfK¥åØ¹sgöøø¹b“OŸsŒ8ˆÄˆ=\Z{¹‰Q®x¾tô^õ{„\n³Â,‡äP%Ø‹}Ò¤IÙ(ıpÄÏÅlIƒ7‚,kì1ß[#öFğ·ß~ûÎ4a†iîBsrèÈÖØ‹Sñ<òHÛÔûáŠ)û\'Ÿ|²tŠ~˜îXİÓñ¿üñÇ÷Æ\Z{_š?~kmmíjÍ]hîB¾´±7GìGÚØ‹\r¾d¿R‡¬bsæÌù—xCıõ×¤¯7®¹Z§{f…YÉ¡§»×Øw*¾«)úâ\Z¼éù*µÇyìqº[øòË/÷Vëè]aV˜åª€æ¾8o¼q0\\_xï½÷ŒŞ«]\\y.¢;’SŞzjôèÑÍ±fTI,iüÂ¬0Ë!9TÉ9W”Ë¢‹Ñõ?şØ\'5:¢/9MîLİ²ÊÄ%eß|óÍ¤?MŸ>}m\\ú°Rş\nÓO‹kjjşVaV˜åªÄ:xIÙìqÏ<óL_×ébsÿ£nYeâZñqIÙşôñÇoI“e^¥ıQbAG{Ğ\n³Â,‡äĞ@æĞÁkÅg÷/[¶¬Oët\\è¦ğ»ÌÓ-«L|ÌöíÛûµ¹777·¤É²µ‚ÿ¨Úö ‹\\\n³Â,‡äĞ@æĞÁÉ¶÷öt¥âJv…ßc«nYeâÓİòé/ñzñéD•şGUÜƒi2…Ya–Crh s(ÖüvoşÖÕiq…×Ş£[V™xãÂ~ÀÁ€„Â\\Y!‡ÄPÌ¡<ú»Në–UfäÈ‘ú{äŞÚÚÚ\\%#÷OãÚÍW\\qÅÑ•4¥ºzõêäüóÏO\ZÛm?öØcãL£.9$i>—İÈ®?~o¯¹ÿı÷ÿUákîí\nò@¬—Îš5+ŠNöµô¾Ø»şúë³KNŞpÃ\rÉ	\'œE<ş˜ci»=nÜ¸NŸwîÜ¹eıq&Åé§ŸïY»íq\nÎµ×^›ÔÕÕ%_ıuÛö+¯¼2¹æškæ\nÈ¡\"Î‹¾à‚y?óxã7²üøä“OÚ¶Í™3\'Ûöá‡vú¼¯¼òJ–s‘/İ—¶>õÔSÙvÆg$»víÒÜËÌ!kî”mÊ”)ûûhùE‹ıG…-¿:®şTZû£0Ç(<\nhwÑYQ.wäşî»ïvZ¨ãg‹¯ÕÔÔ”œtÒIí¶İrË-mŸ1cFrá…&ëÖ­kÛvŞyç%×]wİP.Ì–CåşŸED“/½/râøão÷~_}õÕÉ¹çÛn[äÉk¯½VV¾ÆãJ›{¼~GCÍ½ër´<e{öÙgßìïóÜÓçü\n;Ï½ÃQÖ@4÷‰\'f…7¾vt;š{Áøş­·ŞÊ¶w6rŸ?ş!¯óÒK/eëèßÍüòË/O.¹ä’äí·ßNÎ>ûìdØ°aÉÖ­[“åË—gÏÛ»úwœ|òÉÙ¬Â,ÌCEÌ°”Ó„#ÿ\"Ïb&híÚµY#Û\'xb–,HÎ:ë¬lI(7oîñsñ#q;¾æÛòæ39ùëD^ÆgX\\|ñÅmùtÎ9çÄ‡J%+W®êÍ½Ûr;e{øá‡ÿúî»ïş­¯P·gÄˆ_Wã*eä¿GÆhî=¹§ÿ÷ÙóÄ4jGÓı§œrJV cZö¸ãët4–ìÒF#¿8À¥C+£¹ÇºiäIéßzö¾Å×âöØËwüº‹…Çs›vG‘/ÏDn_tÑEYcÿı÷“¥K—¶íäßÇW—Ÿí^\\¡.­ûúã\nuuuu\\¡®ÊMš4é¿ûëÚò‹-šY­×*®”‘{ŞÈ£wÖ€#bDTú:1\"‹û.»ì²NGõùiì(ÄH.f\0b[’«®º*kîyÁ.6÷İ»wg;ê¨£²ïæÊ›–ïêXxÿ#¯â½ë,¢A›{wyM;7¾æÇcäÍ=\ZE>İy\\:ÍÿØceË=±Ş¯¹wÏµå)ÛwÜqó}÷İ·¯Fï;Ó‘ã>®óæİÒ\"œß.6÷qÅwl/6Ó|[ékÄãc{4ìø\ZkjÅûcª4/ÀysF³±=^3nçë¨ÑØ‹Í=¦nó‚]:« 0\\sƒ»\Za£Èwğâ½î(Š\r¸Ü‘{ø·£ÁÇÎaÌ9uêÔ,¯&L˜L<9»?òGs/«¹÷ù§Â¥uú€O…$êëë›úúóÜc}?ö»[—4-ßıu¥Í=ÖºóÈ×ß‹Ï¿qãÆì¾5Åô{¬ŸÆ÷1ÊÊóê«¯f?>oî1ŸÿnyA/mî1½ºyóæl´àÅ\ZmX§0WFsµìÈ“f„\"âxŠÒÑ{9Ï¹OÆåìÙ³³ç¯q;¶çÍ=?#fb™ \Z{Ì8=÷ÜsÉ”)S²Ÿ{ñÅMË÷l}~i_}{:ĞÛ_µWk½æÿ“åÌ´˜·nØ°¡O\Z{SSÓÜô5¶§{Ãªõÿ¨Ò¦åãHæt§¬Û‘ûgŸ}–Î#§ø¾8ÊéùâøÅæ½»‘{ì0ÄAWùï£´üˆüx@a®¢iùîFîñŞh/wä;¡ùÑò1€ˆ3,\"ÿ^%{ŞØ)ĞÜ{V¯ÓØ‘7áø»;Ò=İQ/®³ï®æzMA]]]mZ¤niiéÕÆşİwß}”6Šoª}z§R¦å#¢ Æí˜ÖìjägBDam¥Ó/¼ğBö¸8ˆ.NkË›{¾æ£¯ä¿[œœîÅ·5÷˜b‘zş;Äè,\nDÜ£øØ#3…¹ºš{g#÷˜É)mîå¬¹—\n;§vZ‘“7Şxc–Ïq>½æ^¾šššáùÁuùşp§èãçJFì¦ã›ÚÚÚÑcÇİİ[#ø±GcOñÁjÿ¿éÏÂ#™(²hbZ=¦ÔcÔÑš{4í(–ñ}œÖté¥—¶;½ôuâÀ¸˜VÏgbM4¦rãû(Äq$s|E¸Ø¢ùÇº}iÅ¼¹¹¹íyã ªÙñÅ\nó\06÷îF×¥£ì8‹¢³õö|¶(îxÿ#\'âûÈÅ¸?¾ÆíØ^¼ŞA¬Iwô³À‡z¨İ’P¬ûÇæŞãü¨bƒ5ø¨	ñ÷WîQñqğ\\q=b0Ôk:Ù#LGñ»>øàƒ¿ÁAv;Ÿşù?ÅT|$à`ø©¤K‡ÆeŞèóÆç½æÅ:¦Ôôüè(¸;vìh7½ßÕUÊæÊË¡x¿Š§¼u•ô¾Ê¡×ë4v›s4ù¨q¡›•çSö1³W‹ò—_~99räo%WÅÛ=Xê5]¬é¤\r¢±¾¾¾9}µöä<ö´P¼—î|\Zc¦5›J¿.x4ú|Z\\a–Cbh4÷¼^O‘;ÌXi}h5ù›¢É\Z5ªeÚ´i_}ôÑGß¤{~Ûó›‰‰kÅ744üû£>º İcÜI{ƒí(K…Ya–Cr¨ÒëõÁ&¿¯\'M}0ÖkÊWFJ“fâÁkoO	Ê?-(>T ®=—(ÌW2R˜f9$‡ÔkĞÜ…Â,‡ä 0Í]È!@aV˜åĞÜ…Ya–CBsf…YÉ!@s\n³’C€Â,4w!‡\0…Ya–CBsf…Y	ÍP˜f9$‡\0Í](ÌrH\n³ĞÜ…f…Y	ÍP˜f9$4w@aV˜å4w¡0Ë!9(ÌBsrP˜fÍ]hî€Â¬0Ë!¡¹\n³Â,‡ä ¹…YÉ! Z466*ˆ•{ÒÂ¼O‰¡–C@/[±bÅö––E±bÛ¶mÿšæõrHµzÙ’%K®_¶lÙŸøá‡VÅqàF[Q”\Z\Z¾Iã&9$†Z} -H÷ö?é¼X¯ıñÿ¾¾š‹²’C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@Áÿ\"òĞÔG+ \0\0\0\0IEND®B`‚',1),
('59d51655-2bc9-11eb-9d15-227918fa15ea',1,'out-factory.bpmn','59d51654-2bc9-11eb-9d15-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"å¤–å‡ºå•\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"å¡«å•\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:formProperty id=\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\" name=\"FLOWABLE_SKIP_EXPRESSION_ENABLED\" type=\"boolean\" default=\"true\"></flowable:formProperty>\n        <flowable:formProperty id=\"manager\" name=\"æ‰€å±é¢†å¯¼\" type=\"string\" default=\"manager\"></flowable:formProperty>\n      </extensionElements>\n    </startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"ç”³è¯·äººç¡®è®¤\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${_FLOWABLE_SKIP_EXPRESSION_ENABLED==true}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"ä¸»ç®¡å®¡æ ¸\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('59f71d46-2bc9-11eb-9d15-227918fa15ea',1,'out-factory.out-factory.png','59d51654-2bc9-11eb-9d15-227918fa15ea','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0÷\0\0\0ä\0\0\0…@m¦\0\0~IDATxÚíİ}ˆUuŸ\0ğ*z\"\"‚ú#Ú¨Øh%\"\"ˆ6Ú\"‚ˆè‰6zs¦§Ü4³\'ª5éÅ\"{µ—­ˆ·6DÌu]5g|Í”Ş°YCV7µÌœÆm}Ì§1Ó<{¾Ïì™ë¼ÜÑy¹wæó/3÷Ü;÷Şï|¿ç÷ûsîï~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ô³$IŞ´iÓ¬5kÖüÖØØ˜,^¼Xôs444$+V¬øŸ4êäŠ9ô²(Ê+W®LZZZ’½{÷ŠŠ;v$Ë—/ß•é›äj9ô²m)ÊSœ÷¦£°õrHµzYL£*Š•iaŞ\'‡ÄPË! —Åz‚XQ…9‘Cb¨å0@…ù/ŞlúôOÉW\rgßÇ6ÅTa–Cr¨ÂÂ¼{ç¶dİ¢)É—óïo±-îSP5w9$‡€*+Ì[¿ú·CŠrß}5OAÕÜåª­0¯_út§…9îSP5w9$‡€*+Ìë?ÚiaûTÍ]É!@aš»’CÀ@æ8²¹³Â÷)¨š»’C@•æ«ş©ÓÂ÷)¨š»’C@•æ·5%ë>|äĞéÔt[Ü§ jîrHUV˜#66ãÂÛS…YÉ! \Zó/¿$?şçC§SÓmqŸ‚ª¹Ë!9TQa«‡mXõJ§ë¥qŸ+ŒiîrHÕP˜ÓÑÔöK’ÿ\\øå<â1ñX#0Í]É! Bsw#-#0…YÉ! Ê\ns9#­®F`\n¬æ.‡äPa…ùp‹r\n¬æ.‡äPa…Y(ÌrHš»ĞÜ…f¡¹9(Ì\n³š;t%I’ß755Õ¿óÎ;Ë§M›¶kÂ„	ûF\Z•><©««;p×]wí<yò¦§Ÿ~zf\Z£¹…YÉ¡S[[ûW555w§5zV\ZÓØõ:=ilNï›“~ıc<N‡¢M}öìÙ3¦NºoâÄ‰Éë¯¿¬Y³&Ù¶m[²gÏ$Ä×–––äóÏ?OÒæŸÜsÏ=î½÷Ş-cÇ£¹…YÉ¡şsë­·ş}\Z‹ÓØ{°™—KÓÇ×éxCDÚÄG?ñÄ¿ÜÿıYãŞ¿R®µk×&>øàşúúúõ7ß|óÙš»P˜åê;iƒ>3mĞ{ĞĞ;Š•ƒ©^sèhıè¹sç.¹óÎ;“yóæõ¨©—Z¸pa2zôèÖÁ2ŠW˜f9$‡*MMMÍğ#Füo±Q×ÖÖ&O=õT²dÉ’äÛo¿M~úé§¬&ÿüóÏÙÌëªU«’éÓ§\'·İv[iƒßm?Hû²eË>?~|²aÃ†¤7lÙ²%IwZÇŒóš»ĞÜåêÕÆş‡´ï/6õ™3gfK¥åØ¹sgöøø¹b“OŸsŒ8ˆÄˆ=\Z{¹‰Q®x¾tô^õ{„\n³Â,‡äP%Ø‹}Ò¤IÙ(ıpÄÏÅlIƒ7‚,kì1ß[#öFğ·ß~ûÎ4a†iîBsrèÈÖØ‹Sñ<òHÛÔûáŠ)û\'Ÿ|²tŠ~˜îXİÓñ¿üñÇ÷Æ\Z{_š?~kmmíjÍ]hîB¾´±7GìGÚØ‹\r¾d¿R‡¬bsæÌù—xCıõ×¤¯7®¹Z§{f…YÉ¡§»×Øw*¾«)úâ\Z¼éù*µÇyìqº[øòË/÷Vëè]aV˜åª€æ¾8o¼q0\\_xï½÷ŒŞ«]\\y.¢;’SŞzjôèÑÍ±fTI,iüÂ¬0Ë!9TÉ9W”Ë¢‹Ñõ?şØ\'5:¢/9MîLİ²ÊÄ%eß|óÍ¤?MŸ>}m\\ú°Rş\nÓO‹kjjşVaV˜åªÄ:xIÙìqÏ<óL_×ébsÿ£nYeâZñqIÙşôñÇoI“e^¥ıQbAG{Ğ\n³Â,‡äĞ@æĞÁkÅg÷/[¶¬Oët\\è¦ğ»ÌÓ-«L|ÌöíÛûµ¹777·¤É²µ‚ÿ¨Úö ‹\\\n³Â,‡äĞ@æĞÁÉ¶÷öt¥âJv…ßc«nYeâÓİòé/ñzñéD•şGUÜƒi2…Ya–Crh s(ÖüvoşÖÕiq…×Ş£[V™xãÂ~ÀÁ€„Â\\Y!‡ÄPÌ¡<ú»Në–UfäÈ‘ú{äŞÚÚÚ\\%#÷OãÚÍW\\qÅÑ•4¥ºzõêäüóÏO\ZÛm?öØcãL£.9$i>—İÈ®?~o¯¹ÿı÷ÿUákîí\nò@¬—Îš5+ŠNöµô¾Ø»şúë³KNŞpÃ\rÉ	\'œE<ş˜ci»=nÜ¸NŸwîÜ¹eıq&Åé§ŸïY»íq\nÎµ×^›ÔÕÕ%_ıuÛö+¯¼2¹æškæ\nÈ¡\"Î‹¾à‚y?óxã7²üøä“OÚ¶Í™3\'Ûöá‡vú¼¯¼òJ–s‘/İ—¶>õÔSÙvÆg$»víÒÜËÌ!kî”mÊ”)ûûhùE‹ıG…-¿:®şTZû£0Ç(<\nhwÑYQ.wäşî»ïvZ¨ãg‹¯ÕÔÔ”œtÒIí¶İrË-mŸ1cFrá…&ëÖ­kÛvŞyç%×]wİP.Ì–CåşŸED“/½/râøão÷~_}õÕÉ¹çÛn[äÉk¯½VV¾ÆãJ›{¼~GCÍ½ër´<e{öÙgßìïóÜÓçü\n;Ï½ÃQÖ@4÷‰\'f…7¾vt;š{Áøş­·ŞÊ¶w6rŸ?ş!¯óÒK/eëèßÍüòË/O.¹ä’äí·ßNÎ>ûìdØ°aÉÖ­[“åË—gÏÛ»úwœ|òÉÙ¬Â,ÌCEÌ°”Ó„#ÿ\"Ïb&híÚµY#Û\'xb–,HÎ:ë¬lI(7oîñsñ#q;¾æÛòæ39ùëD^ÆgX\\|ñÅmùtÎ9çÄ‡J%+W®êÍ½Ûr;e{øá‡ÿúî»ïş­¯P·gÄˆ_Wã*eä¿GÆhî=¹§ÿ÷ÙóÄ4jGÓı§œrJV cZö¸ãët4–ìÒF#¿8À¥C+£¹ÇºiäIéßzö¾Å×âöØËwüº‹…Çs›vG‘/ÏDn_tÑEYcÿı÷“¥K—¶íäßÇW—Ÿí^\\¡.­ûúã\nuuuu\\¡®ÊMš4é¿ûëÚò‹-šY­×*®”‘{ŞÈ£wÖ€#bDTú:1\"‹û.»ì²NGõùiì(ÄH.f\0b[’«®º*kîyÁ.6÷İ»wg;ê¨£²ïæÊ›–ïêXxÿ#¯â½ë,¢A›{wyM;7¾æÇcäÍ=\ZE>İy\\:ÍÿØceË=±Ş¯¹wÏµå)ÛwÜqó}÷İ·¯Fï;Ó‘ã>®óæİÒ\"œß.6÷qÅwl/6Ó|[ékÄãc{4ìø\ZkjÅûcª4/ÀysF³±=^3nçë¨ÑØ‹Í=¦nó‚]:« 0\\sƒ»\Za£Èwğâ½î(Š\r¸Ü‘{ø·£ÁÇÎaÌ9uêÔ,¯&L˜L<9»?òGs/«¹÷ù§Â¥uú€O…$êëë›úúóÜc}?ö»[—4-ßıu¥Í=ÖºóÈ×ß‹Ï¿qãÆì¾5Åô{¬ŸÆ÷1ÊÊóê«¯f?>oî1ŸÿnyA/mî1½ºyóæl´àÅ\ZmX§0WFsµìÈ“f„\"âxŠÒÑ{9Ï¹OÆåìÙ³³ç¯q;¶çÍ=?#fb™ \Z{Ì8=÷ÜsÉ”)S²Ÿ{ñÅMË÷l}~i_}{:ĞÛ_µWk½æÿ“åÌ´˜·nØ°¡O\Z{SSÓÜô5¶§{Ãªõÿ¨Ò¦åãHæt§¬Û‘ûgŸ}–Î#§ø¾8ÊéùâøÅæ½»‘{ì0ÄAWùï£´üˆüx@a®¢iùîFîñŞh/wä;¡ùÑò1€ˆ3,\"ÿ^%{ŞØ)ĞÜ{V¯ÓØ‘7áø»;Ò=İQ/®³ï®æzMA]]]mZ¤niiéÕÆşİwß}”6Šoª}z§R¦å#¢ Æí˜ÖìjägBDam¥Ó/¼ğBö¸8ˆ.NkË›{¾æ£¯ä¿[œœîÅ·5÷˜b‘zş;Äè,\nDÜ£øØ#3…¹ºš{g#÷˜É)mîå¬¹—\n;§vZ‘“7Şxc–Ïq>½æ^¾šššáùÁuùşp§èãçJFì¦ã›ÚÚÚÑcÇİİ[#ø±GcOñÁjÿ¿éÏÂ#™(²hbZ=¦ÔcÔÑš{4í(–ñ}œÖté¥—¶;½ôuâÀ¸˜VÏgbM4¦rãû(Äq$s|E¸Ø¢ùÇº}iÅ¼¹¹¹íyã ªÙñÅ\nó\06÷îF×¥£ì8‹¢³õö|¶(îxÿ#\'âûÈÅ¸?¾ÆíØ^¼ŞA¬Iwô³À‡z¨İ’P¬ûÇæŞãü¨bƒ5ø¨	ñ÷WîQñqğ\\q=b0Ôk:Ù#LGñ»>øàƒ¿ÁAv;Ÿşù?ÅT|$à`ø©¤K‡ÆeŞèóÆç½æÅ:¦Ôôüè(¸;vìh7½ßÕUÊæÊË¡x¿Š§¼u•ô¾Ê¡×ë4v›s4ù¨q¡›•çSö1³W‹ò—_~99räo%WÅÛ=Xê5]¬é¤\r¢±¾¾¾9}µöä<ö´P¼—î|\Zc¦5›J¿.x4ú|Z\\a–Cbh4÷¼^O‘;ÌXi}h5ù›¢É\Z5ªeÚ´i_}ôÑGß¤{~Ûó›‰‰kÅ744üû£>º İcÜI{ƒí(K…Ya–Cr¨ÒëõÁ&¿¯\'M}0ÖkÊWFJ“fâÁkoO	Ê?-(>T ®=—(ÌW2R˜f9$‡ÔkĞÜ…Â,‡ä 0Í]È!@aV˜åĞÜ…Ya–CBsf…YÉ!@s\n³’C€Â,4w!‡\0…Ya–CBsf…Y	ÍP˜f9$‡\0Í](ÌrH\n³ĞÜ…f…Y	ÍP˜f9$4w@aV˜å4w¡0Ë!9(ÌBsrP˜fÍ]hî€Â¬0Ë!¡¹\n³Â,‡ä ¹…YÉ! Z466*ˆ•{ÒÂ¼O‰¡–C@/[±bÅö––E±bÛ¶mÿšæõrHµzÙ’%K®_¶lÙŸøá‡VÅqàF[Q”\Z\Z¾Iã&9$†Z} -H÷ö?é¼X¯ıñÿ¾¾š‹²’C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@Áÿ\"òĞÔG+ \0\0\0\0IEND®B`‚',1),
('5c0b5346-2d58-11eb-b88c-227918fa15ea',1,'rehire-form.bpmn','5c0b5345-2d58-11eb-b88c-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"rehire-form\" name=\"è¿”å» ç”³è«‹å–®\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" flowable:initiator=\"initiator\" flowable:formKey=\"rehire-form\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-345367B5-F2D6-40E7-A1B1-D802F28D51BD\" sourceRef=\"startEvent1\" targetRef=\"sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\"></sequenceFlow>\n    <endEvent id=\"sid-28104B17-66FC-492B-8654-D19352BABECE\"></endEvent>\n    <sequenceFlow id=\"sid-6A43BA7B-9987-46BC-AB2A-44F15554599B\" sourceRef=\"sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\" targetRef=\"sid-28104B17-66FC-492B-8654-D19352BABECE\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_rehire-form\">\n    <bpmndi:BPMNPlane bpmnElement=\"rehire-form\" id=\"BPMNPlane_rehire-form\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\" id=\"BPMNShape_sid-0F6E5EC1-F13F-4EB9-95B0-306DE8FC4399\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-28104B17-66FC-492B-8654-D19352BABECE\" id=\"BPMNShape_sid-28104B17-66FC-492B-8654-D19352BABECE\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-6A43BA7B-9987-46BC-AB2A-44F15554599B\" id=\"BPMNEdge_sid-6A43BA7B-9987-46BC-AB2A-44F15554599B\">\n        <omgdi:waypoint x=\"274.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-345367B5-F2D6-40E7-A1B1-D802F28D51BD\" id=\"BPMNEdge_sid-345367B5-F2D6-40E7-A1B1-D802F28D51BD\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('5c2e1d87-2d58-11eb-b88c-227918fa15ea',1,'rehire-form.rehire-form.png','5c0b5345-2d58-11eb-b88c-227918fa15ea','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0f\0\0\0ä\0\0\0«)q\0\0	nIDATxÚíİ[kUéÀa/¼˜Ñ¡…ÎGèE/ü\0í…5Ñ„(F­gGªD<à	œB„ÁÁbaµÖ1ãq¤VÑT‘jë9&ÆÚŒ:&Æ¨«ï›º§Ûh2ÛdïåŞ;Ïf&‰ãà¬õË›w¯µö¸q\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Œ@’$ãoÜ¸ñõÙ³g_577\'&åijjJNœ8ñï0UH`\\ŒòÉ“\'“®®®¤¯¯Ï|¤yøğarüøñÇ!Ò“•0ÆÅ•²(MœûÂ\núª£Æ¸¸}!ŠÅ3!ÌıJãâ§ U˜G%sNÁøş»äÆ¹/“+Mk&ş}ü˜˜\n3ğÂü´»=¹Ü°:¹txù[??\'¨Â¤æ»WşôN”3sïÊ!Af í0_=¶yÈ0ÇÏ	ª0)‡ùrãš!Ã?\'¨Â³0c;Ìñ*Œ¡Â?\'¨Â¤æë§7d˜ãçU˜”Ãü¨½-¹|´şİmŒğ±ø9Af å0Ç¹ù·¯Ş	sü˜˜\n3ğ1ÂüüyrıÌïßİÆ‹ŸTaRs¼³ïÚé/†ÜcŸs÷Ÿ0i„9¬„;®·$?òÛ!£œ™ø5ñk­…(P˜l•lõ,Ì@ÊaÎe•<ÜêY`…Ès˜G\ZåÌ¬0y³f@˜0Â,Ì€0a†á%IòI[[[İîİ»oÚ´éñÂ…ûkjj’)S¦$UUU¯çÎÛ·råÊ›7oŞæçÂl„yä*++RQQ1?œ__‡¹æi<×Âô†¹>·?üõóøuê4Fƒ¼oß¾¯Ö­[×¿xñâdçÎÉÙ³g“ööö¤··7‰â_»ºº’óçÏ\'!ÜÉ¢E‹^/Y²äÖìÙ³g	³æÜM:õ×a\ZÃô½	q.s,|}•Z!Àµë×¯¾|ùòè¾|ù2ÉÕÅ‹“+V¼¬««»:yòäŸ	³æ¡…¸Nq=ò1~ßœ,§swWÉã<Ø2gÎœäĞ¡CäÁ9’ÔÖÖö”ËêY˜…9ß***¦L›6í?Ù‘­¬¬L6nÜ˜´´´$wîÜI<y2p>={ölà§ÕÓ§O\'Û·oO¦OŸ>8ÎO­Ë4Ê­­­]°`AríÚµ$nİº•„È÷Ìš5ë7Âl„ù­(Bú2;È{öìØ\ZÌEww÷À×Ç_—èğïœ¥fe$®”c”s=0rÿ}aÕ\\òßÍ…Y˜ó¹RÎòÒ¥KVÇ#]Ürg+çrÙSÛùZ)¿oå<cÆŒîpÀ|*Ìf,‡9î)go_Ô××ÿ°]1Rq›cÃ†\rƒ·5>U¶ÒŞÂødíÚµ}qO¹>Ü~ìúV˜ÍXsˆrSöJy´QÎó •óIu+aû÷ïÿCüúâÅ‹¤ĞæÍ›×Yª?f	³0V¼$.{Oy¤ÛÃmkdï9ÛÒ(áÕr¼N9^—†K—.õ•êªY˜…9anÌD3¾pW{÷îµj.uñ¾ø‚ßh.‹ûPµµµqŸ­˜N–0¿fa.ä1ïÔË¼àWµ=*Èù¯Öt)İ¥+1ñ6ë]»v%iÚ¾}ûÅxKi½“ù±¯±¢¢âÂ,Ì…8†ŞÜf=ğu[¶l)ô9–æÏ•®ÄÄg_ÄÛ¬ÓtæÌ™[á`9Tl\'UÖ|ó¾Õ0óh¡7Ï¾ø|kkkAÏ±xJÖË!¥+1ñD©†¹³³³+,w‹ø¤úaõ“}r	³0æzó@¢çûE¿Áâ‚Yÿw•®ÄÄ§ÄeH”–øûÅ\'eûI•½ú‰?\n³0æ\nÓ“ùç|]\"7Ü¥sY¿w¯Ò•˜ø?îcå[>ÊsqM)C™IûSºS]]ı:ísOOOg‰¬˜ÏÅçLœ8q¼­+æÑCYÏU¶bfx,èK{ùşıûÿ(ò=æ·‚lY˜óqÙc&g«W¯¾öU\r\r\r)Ò«2¾wf\r²0s>!We³­[·îJû:æúúúÃEvó{WÈÂ,Ìù<†\\ÇLÎV­ZõÓùóç¿JñÎ¿ŞiÓ¦ı«ïFfaxç_8îûÓ¸ó/¾§;ÿJÜÒ¥Kÿ™Ö³2\Z\Z\Zö”êıûÂ,Ì£åYälæÌ™“—-[ÖŸÂª¹;¬–/xºœñt¹Â=].œc¯=]®LÔÕÕµúyÌq?;~ÿ±½\\a6eş üc…zsX`½Ì^-—ê¹Æÿ–	ñSõ&mmmÃïÑáLŒ0O™æaŞÁäµw0)CUUU•aåü,ßïùwïŞ½SáÇ«ÛŞóÏóÿÄ÷üË¼˜÷ü´R¶…Qn*++kã§ækåWÊ1Êá@\\Qê6Â,Ìy^9×dÇ9ó.ÙñªŠ\\¯¾ˆ/ôeï)Ç)‡s!¾›‡Õóã|?Š»·mÛöeÜ¾ˆ`9ü¹³0â\\ÓÖèxs¼	%®†3Ûq»\"ŞÑoÙ±cGR]]ıjĞİ†OËå\\c˜}°ğ¸¹®®®óÂ…=ròÑ£G÷†°Ÿ‹/>”Ó>—0s¡ÎµìËèF8\'í)­@OŠ®©©éÚ´iÓ•S§Nİßµ;2>Š$ŠÏ¾hjjúóš5k¾	ßíoÄƒ$~ç.·W„…Y˜}®½	tÿ‡¹Ï5rß{ïW¶øÍış7ã«2O®ŠI‰÷ãÇ[?Ëù.#afç\Z³ƒa„Y˜a6Â³0Âl„fa„Ù3 ÌF˜af@˜0Â,Ì€0a„Y˜a6Â³0Âl„f#Ì€03 ÌF˜af@˜0£ÖÜÜ,ˆÅ3½!ÌıJãNœ8ÑÑÕÕ%ŠE0ííía¾ê¨„1®¥¥åW­­­ß=xğ G?ŞJ9F¹©©év˜IJ`\\ˆÁga¥v.ş÷8MêÿÜ¯Š2\0\0\0\0\0\0\0\0\0\0\0\0äÑ¾W#Üy€^\0\0\0\0IEND®B`‚',1),
('6748cd33-2bc8-11eb-9d15-227918fa15ea',1,'out-factory.bpmn','6748cd32-2bc8-11eb-9d15-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"å¤–å‡ºå•\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"å¡«å•\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:formProperty id=\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\" name=\"FLOWABLE_SKIP_EXPRESSION_ENABLED\" type=\"boolean\" default=\"true\"></flowable:formProperty>\n      </extensionElements>\n    </startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"ç”³è¯·äººç¡®è®¤\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${_FLOWABLE_SKIP_EXPRESSION_ENABLED==true}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"ä¸»ç®¡å®¡æ ¸\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('678d9e64-2bc8-11eb-9d15-227918fa15ea',1,'out-factory.out-factory.png','6748cd32-2bc8-11eb-9d15-227918fa15ea','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0÷\0\0\0ä\0\0\0…@m¦\0\0~IDATxÚíİ}ˆUuŸ\0ğ*z\"\"‚ú#Ú¨Øh%\"\"ˆ6Ú\"‚ˆè‰6zs¦§Ü4³\'ª5éÅ\"{µ—­ˆ·6DÌu]5g|Í”Ş°YCV7µÌœÆm}Ì§1Ó<{¾Ïì™ë¼ÜÑy¹wæó/3÷Ü;÷Şï|¿ç÷ûsîï~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ô³$IŞ´iÓ¬5kÖüÖØØ˜,^¼Xôs444$+V¬øŸ4êäŠ9ô²(Ê+W®LZZZ’½{÷ŠŠ;v$Ë—/ß•é›äj9ô²m)ÊSœ÷¦£°õrHµzYL£*Š•iaŞ\'‡ÄPË! —Åz‚XQ…9‘Cb¨å0@…ù/ŞlúôOÉW\rgßÇ6ÅTa–Cr¨ÂÂ¼{ç¶dİ¢)É—óïo±-îSP5w9$‡€*+Ì[¿ú·CŠrß}5OAÕÜåª­0¯_út§…9îSP5w9$‡€*+Ìë?ÚiaûTÍ]É!@aš»’CÀ@æ8²¹³Â÷)¨š»’C@•æ«ş©ÓÂ÷)¨š»’C@•æ·5%ë>|äĞéÔt[Ü§ jîrHUV˜#66ãÂÛS…YÉ! \Zó/¿$?şçC§SÓmqŸ‚ª¹Ë!9TQa«‡mXõJ§ë¥qŸ+ŒiîrHÕP˜ÓÑÔöK’ÿ\\øå<â1ñX#0Í]É! Bsw#-#0…YÉ! Ê\ns9#­®F`\n¬æ.‡äPa…ùp‹r\n¬æ.‡äPa…Y(ÌrHš»ĞÜ…f¡¹9(Ì\n³š;t%I’ß755Õ¿óÎ;Ë§M›¶kÂ„	ûF\Z•><©««;p×]wí<yò¦§Ÿ~zf\Z£¹…YÉ¡S[[ûW555w§5zV\ZÓØõ:=ilNï›“~ıc<N‡¢M}öìÙ3¦NºoâÄ‰Éë¯¿¬Y³&Ù¶m[²gÏ$Ä×–––äóÏ?OÒæŸÜsÏ=î½÷Ş-cÇ£¹…YÉ¡şsë­·ş}\Z‹ÓØ{°™—KÓÇ×éxCDÚÄG?ñÄ¿ÜÿıYãŞ¿R®µk×&>øàşúúúõ7ß|óÙš»P˜åê;iƒ>3mĞ{ĞĞ;Š•ƒ©^sèhıè¹sç.¹óÎ;“yóæõ¨©—Z¸pa2zôèÖÁ2ŠW˜f9$‡*MMMÍğ#Füo±Q×ÖÖ&O=õT²dÉ’äÛo¿M~úé§¬&ÿüóÏÙÌëªU«’éÓ§\'·İv[iƒßm?Hû²eË>?~|²aÃ†¤7lÙ²%IwZÇŒóš»ĞÜåêÕÆş‡´ï/6õ™3gfK¥åØ¹sgöøø¹b“OŸsŒ8ˆÄˆ=\Z{¹‰Q®x¾tô^õ{„\n³Â,‡äP%Ø‹}Ò¤IÙ(ıpÄÏÅlIƒ7‚,kì1ß[#öFğ·ß~ûÎ4a†iîBsrèÈÖØ‹Sñ<òHÛÔûáŠ)û\'Ÿ|²tŠ~˜îXİÓñ¿üñÇ÷Æ\Z{_š?~kmmíjÍ]hîB¾´±7GìGÚØ‹\r¾d¿R‡¬bsæÌù—xCıõ×¤¯7®¹Z§{f…YÉ¡§»×Øw*¾«)úâ\Z¼éù*µÇyìqº[øòË/÷Vëè]aV˜åª€æ¾8o¼q0\\_xï½÷ŒŞ«]\\y.¢;’SŞzjôèÑÍ±fTI,iüÂ¬0Ë!9TÉ9W”Ë¢‹Ñõ?şØ\'5:¢/9MîLİ²ÊÄ%eß|óÍ¤?MŸ>}m\\ú°Rş\nÓO‹kjjşVaV˜åªÄ:xIÙìqÏ<óL_×ébsÿ£nYeâZñqIÙşôñÇoI“e^¥ıQbAG{Ğ\n³Â,‡äĞ@æĞÁkÅg÷/[¶¬Oët\\è¦ğ»ÌÓ-«L|ÌöíÛûµ¹777·¤É²µ‚ÿ¨Úö ‹\\\n³Â,‡äĞ@æĞÁÉ¶÷öt¥âJv…ßc«nYeâÓİòé/ñzñéD•şGUÜƒi2…Ya–Crh s(ÖüvoşÖÕiq…×Ş£[V™xãÂ~ÀÁ€„Â\\Y!‡ÄPÌ¡<ú»Në–UfäÈ‘ú{äŞÚÚÚ\\%#÷OãÚÍW\\qÅÑ•4¥ºzõêäüóÏO\ZÛm?öØcãL£.9$i>—İÈ®?~o¯¹ÿı÷ÿUákîí\nò@¬—Îš5+ŠNöµô¾Ø»şúë³KNŞpÃ\rÉ	\'œE<ş˜ci»=nÜ¸NŸwîÜ¹eıq&Åé§ŸïY»íq\nÎµ×^›ÔÕÕ%_ıuÛö+¯¼2¹æškæ\nÈ¡\"Î‹¾à‚y?óxã7²üøä“OÚ¶Í™3\'Ûöá‡vú¼¯¼òJ–s‘/İ—¶>õÔSÙvÆg$»víÒÜËÌ!kî”mÊ”)ûûhùE‹ıG…-¿:®şTZû£0Ç(<\nhwÑYQ.wäşî»ïvZ¨ãg‹¯ÕÔÔ”œtÒIí¶İrË-mŸ1cFrá…&ëÖ­kÛvŞyç%×]wİP.Ì–CåşŸED“/½/râøão÷~_}õÕÉ¹çÛn[äÉk¯½VV¾ÆãJ›{¼~GCÍ½ër´<e{öÙgßìïóÜÓçü\n;Ï½ÃQÖ@4÷‰\'f…7¾vt;š{Áøş­·ŞÊ¶w6rŸ?ş!¯óÒK/eëèßÍüòË/O.¹ä’äí·ßNÎ>ûìdØ°aÉÖ­[“åË—gÏÛ»úwœ|òÉÙ¬Â,ÌCEÌ°”Ó„#ÿ\"Ïb&híÚµY#Û\'xb–,HÎ:ë¬lI(7oîñsñ#q;¾æÛòæ39ùëD^ÆgX\\|ñÅmùtÎ9çÄ‡J%+W®êÍ½Ûr;e{øá‡ÿúî»ïş­¯P·gÄˆ_Wã*eä¿GÆhî=¹§ÿ÷ÙóÄ4jGÓı§œrJV cZö¸ãët4–ìÒF#¿8À¥C+£¹ÇºiäIéßzö¾Å×âöØËwüº‹…Çs›vG‘/ÏDn_tÑEYcÿı÷“¥K—¶íäßÇW—Ÿí^\\¡.­ûúã\nuuuu\\¡®ÊMš4é¿ûëÚò‹-šY­×*®”‘{ŞÈ£wÖ€#bDTú:1\"‹û.»ì²NGõùiì(ÄH.f\0b[’«®º*kîyÁ.6÷İ»wg;ê¨£²ïæÊ›–ïêXxÿ#¯â½ë,¢A›{wyM;7¾æÇcäÍ=\ZE>İy\\:ÍÿØceË=±Ş¯¹wÏµå)ÛwÜqó}÷İ·¯Fï;Ó‘ã>®óæİÒ\"œß.6÷qÅwl/6Ó|[ékÄãc{4ìø\ZkjÅûcª4/ÀysF³±=^3nçë¨ÑØ‹Í=¦nó‚]:« 0\\sƒ»\Za£Èwğâ½î(Š\r¸Ü‘{ø·£ÁÇÎaÌ9uêÔ,¯&L˜L<9»?òGs/«¹÷ù§Â¥uú€O…$êëë›úúóÜc}?ö»[—4-ßıu¥Í=ÖºóÈ×ß‹Ï¿qãÆì¾5Åô{¬ŸÆ÷1ÊÊóê«¯f?>oî1ŸÿnyA/mî1½ºyóæl´àÅ\ZmX§0WFsµìÈ“f„\"âxŠÒÑ{9Ï¹OÆåìÙ³³ç¯q;¶çÍ=?#fb™ \Z{Ì8=÷ÜsÉ”)S²Ÿ{ñÅMË÷l}~i_}{:ĞÛ_µWk½æÿ“åÌ´˜·nØ°¡O\Z{SSÓÜô5¶§{Ãªõÿ¨Ò¦åãHæt§¬Û‘ûgŸ}–Î#§ø¾8ÊéùâøÅæ½»‘{ì0ÄAWùï£´üˆüx@a®¢iùîFîñŞh/wä;¡ùÑò1€ˆ3,\"ÿ^%{ŞØ)ĞÜ{V¯ÓØ‘7áø»;Ò=İQ/®³ï®æzMA]]]mZ¤niiéÕÆşİwß}”6Šoª}z§R¦å#¢ Æí˜ÖìjägBDam¥Ó/¼ğBö¸8ˆ.NkË›{¾æ£¯ä¿[œœîÅ·5÷˜b‘zş;Äè,\nDÜ£øØ#3…¹ºš{g#÷˜É)mîå¬¹—\n;§vZ‘“7Şxc–Ïq>½æ^¾šššáùÁuùşp§èãçJFì¦ã›ÚÚÚÑcÇİİ[#ø±GcOñÁjÿ¿éÏÂ#™(²hbZ=¦ÔcÔÑš{4í(–ñ}œÖté¥—¶;½ôuâÀ¸˜VÏgbM4¦rãû(Äq$s|E¸Ø¢ùÇº}iÅ¼¹¹¹íyã ªÙñÅ\nó\06÷îF×¥£ì8‹¢³õö|¶(îxÿ#\'âûÈÅ¸?¾ÆíØ^¼ŞA¬Iwô³À‡z¨İ’P¬ûÇæŞãü¨bƒ5ø¨	ñ÷WîQñqğ\\q=b0Ôk:Ù#LGñ»>øàƒ¿ÁAv;Ÿşù?ÅT|$à`ø©¤K‡ÆeŞèóÆç½æÅ:¦Ôôüè(¸;vìh7½ßÕUÊæÊË¡x¿Š§¼u•ô¾Ê¡×ë4v›s4ù¨q¡›•çSö1³W‹ò—_~99räo%WÅÛ=Xê5]¬é¤\r¢±¾¾¾9}µöä<ö´P¼—î|\Zc¦5›J¿.x4ú|Z\\a–Cbh4÷¼^O‘;ÌXi}h5ù›¢É\Z5ªeÚ´i_}ôÑGß¤{~Ûó›‰‰kÅ744üû£>º İcÜI{ƒí(K…Ya–Cr¨ÒëõÁ&¿¯\'M}0ÖkÊWFJ“fâÁkoO	Ê?-(>T ®=—(ÌW2R˜f9$‡ÔkĞÜ…Â,‡ä 0Í]È!@aV˜åĞÜ…Ya–CBsf…YÉ!@s\n³’C€Â,4w!‡\0…Ya–CBsf…Y	ÍP˜f9$‡\0Í](ÌrH\n³ĞÜ…f…Y	ÍP˜f9$4w@aV˜å4w¡0Ë!9(ÌBsrP˜fÍ]hî€Â¬0Ë!¡¹\n³Â,‡ä ¹…YÉ! Z466*ˆ•{ÒÂ¼O‰¡–C@/[±bÅö––E±bÛ¶mÿšæõrHµzÙ’%K®_¶lÙŸøá‡VÅqàF[Q”\Z\Z¾Iã&9$†Z} -H÷ö?é¼X¯ıñÿ¾¾š‹²’C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@Áÿ\"òĞÔG+ \0\0\0\0IEND®B`‚',1),
('6d8cddac-2e03-11eb-8edb-227918fa15ea',1,'out-factory.bpmn','6d8cddab-2e03-11eb-8edb-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"å¤–å‡ºå•\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"å¡«å•\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"ç”³è¯·äººç¡®è®¤\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${skip==true}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"ä¸»ç®¡å®¡æ ¸\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('6dda616d-2e03-11eb-8edb-227918fa15ea',1,'out-factory.out-factory.png','6d8cddab-2e03-11eb-8edb-227918fa15ea','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0÷\0\0\0ä\0\0\0…@m¦\0\0~IDATxÚíİ}ˆUuŸ\0ğ*z\"\"‚ú#Ú¨Øh%\"\"ˆ6Ú\"‚ˆè‰6zs¦§Ü4³\'ª5éÅ\"{µ—­ˆ·6DÌu]5g|Í”Ş°YCV7µÌœÆm}Ì§1Ó<{¾Ïì™ë¼ÜÑy¹wæó/3÷Ü;÷Şï|¿ç÷ûsîï~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ô³$IŞ´iÓ¬5kÖüÖØØ˜,^¼Xôs444$+V¬øŸ4êäŠ9ô²(Ê+W®LZZZ’½{÷ŠŠ;v$Ë—/ß•é›äj9ô²m)ÊSœ÷¦£°õrHµzYL£*Š•iaŞ\'‡ÄPË! —Åz‚XQ…9‘Cb¨å0@…ù/ŞlúôOÉW\rgßÇ6ÅTa–Cr¨ÂÂ¼{ç¶dİ¢)É—óïo±-îSP5w9$‡€*+Ì[¿ú·CŠrß}5OAÕÜåª­0¯_út§…9îSP5w9$‡€*+Ìë?ÚiaûTÍ]É!@aš»’CÀ@æ8²¹³Â÷)¨š»’C@•æ«ş©ÓÂ÷)¨š»’C@•æ·5%ë>|äĞéÔt[Ü§ jîrHUV˜#66ãÂÛS…YÉ! \Zó/¿$?şçC§SÓmqŸ‚ª¹Ë!9TQa«‡mXõJ§ë¥qŸ+ŒiîrHÕP˜ÓÑÔöK’ÿ\\øå<â1ñX#0Í]É! Bsw#-#0…YÉ! Ê\ns9#­®F`\n¬æ.‡äPa…ùp‹r\n¬æ.‡äPa…Y(ÌrHš»ĞÜ…f¡¹9(Ì\n³š;t%I’ß755Õ¿óÎ;Ë§M›¶kÂ„	ûF\Z•><©««;p×]wí<yò¦§Ÿ~zf\Z£¹…YÉ¡S[[ûW555w§5zV\ZÓØõ:=ilNï›“~ıc<N‡¢M}öìÙ3¦NºoâÄ‰Éë¯¿¬Y³&Ù¶m[²gÏ$Ä×–––äóÏ?OÒæŸÜsÏ=î½÷Ş-cÇ£¹…YÉ¡şsë­·ş}\Z‹ÓØ{°™—KÓÇ×éxCDÚÄG?ñÄ¿ÜÿıYãŞ¿R®µk×&>øàşúúúõ7ß|óÙš»P˜åê;iƒ>3mĞ{ĞĞ;Š•ƒ©^sèhıè¹sç.¹óÎ;“yóæõ¨©—Z¸pa2zôèÖÁ2ŠW˜f9$‡*MMMÍğ#Füo±Q×ÖÖ&O=õT²dÉ’äÛo¿M~úé§¬&ÿüóÏÙÌëªU«’éÓ§\'·İv[iƒßm?Hû²eË>?~|²aÃ†¤7lÙ²%IwZÇŒóš»ĞÜåêÕÆş‡´ï/6õ™3gfK¥åØ¹sgöøø¹b“OŸsŒ8ˆÄˆ=\Z{¹‰Q®x¾tô^õ{„\n³Â,‡äP%Ø‹}Ò¤IÙ(ıpÄÏÅlIƒ7‚,kì1ß[#öFğ·ß~ûÎ4a†iîBsrèÈÖØ‹Sñ<òHÛÔûáŠ)û\'Ÿ|²tŠ~˜îXİÓñ¿üñÇ÷Æ\Z{_š?~kmmíjÍ]hîB¾´±7GìGÚØ‹\r¾d¿R‡¬bsæÌù—xCıõ×¤¯7®¹Z§{f…YÉ¡§»×Øw*¾«)úâ\Z¼éù*µÇyìqº[øòË/÷Vëè]aV˜åª€æ¾8o¼q0\\_xï½÷ŒŞ«]\\y.¢;’SŞzjôèÑÍ±fTI,iüÂ¬0Ë!9TÉ9W”Ë¢‹Ñõ?şØ\'5:¢/9MîLİ²ÊÄ%eß|óÍ¤?MŸ>}m\\ú°Rş\nÓO‹kjjşVaV˜åªÄ:xIÙìqÏ<óL_×ébsÿ£nYeâZñqIÙşôñÇoI“e^¥ıQbAG{Ğ\n³Â,‡äĞ@æĞÁkÅg÷/[¶¬Oët\\è¦ğ»ÌÓ-«L|ÌöíÛûµ¹777·¤É²µ‚ÿ¨Úö ‹\\\n³Â,‡äĞ@æĞÁÉ¶÷öt¥âJv…ßc«nYeâÓİòé/ñzñéD•şGUÜƒi2…Ya–Crh s(ÖüvoşÖÕiq…×Ş£[V™xãÂ~ÀÁ€„Â\\Y!‡ÄPÌ¡<ú»Në–UfäÈ‘ú{äŞÚÚÚ\\%#÷OãÚÍW\\qÅÑ•4¥ºzõêäüóÏO\ZÛm?öØcãL£.9$i>—İÈ®?~o¯¹ÿı÷ÿUákîí\nò@¬—Îš5+ŠNöµô¾Ø»şúë³KNŞpÃ\rÉ	\'œE<ş˜ci»=nÜ¸NŸwîÜ¹eıq&Åé§ŸïY»íq\nÎµ×^›ÔÕÕ%_ıuÛö+¯¼2¹æškæ\nÈ¡\"Î‹¾à‚y?óxã7²üøä“OÚ¶Í™3\'Ûöá‡vú¼¯¼òJ–s‘/İ—¶>õÔSÙvÆg$»víÒÜËÌ!kî”mÊ”)ûûhùE‹ıG…-¿:®şTZû£0Ç(<\nhwÑYQ.wäşî»ïvZ¨ãg‹¯ÕÔÔ”œtÒIí¶İrË-mŸ1cFrá…&ëÖ­kÛvŞyç%×]wİP.Ì–CåşŸED“/½/râøão÷~_}õÕÉ¹çÛn[äÉk¯½VV¾ÆãJ›{¼~GCÍ½ër´<e{öÙgßìïóÜÓçü\n;Ï½ÃQÖ@4÷‰\'f…7¾vt;š{Áøş­·ŞÊ¶w6rŸ?ş!¯óÒK/eëèßÍüòË/O.¹ä’äí·ßNÎ>ûìdØ°aÉÖ­[“åË—gÏÛ»úwœ|òÉÙ¬Â,ÌCEÌ°”Ó„#ÿ\"Ïb&híÚµY#Û\'xb–,HÎ:ë¬lI(7oîñsñ#q;¾æÛòæ39ùëD^ÆgX\\|ñÅmùtÎ9çÄ‡J%+W®êÍ½Ûr;e{øá‡ÿúî»ïş­¯P·gÄˆ_Wã*eä¿GÆhî=¹§ÿ÷ÙóÄ4jGÓı§œrJV cZö¸ãët4–ìÒF#¿8À¥C+£¹ÇºiäIéßzö¾Å×âöØËwüº‹…Çs›vG‘/ÏDn_tÑEYcÿı÷“¥K—¶íäßÇW—Ÿí^\\¡.­ûúã\nuuuu\\¡®ÊMš4é¿ûëÚò‹-šY­×*®”‘{ŞÈ£wÖ€#bDTú:1\"‹û.»ì²NGõùiì(ÄH.f\0b[’«®º*kîyÁ.6÷İ»wg;ê¨£²ïæÊ›–ïêXxÿ#¯â½ë,¢A›{wyM;7¾æÇcäÍ=\ZE>İy\\:ÍÿØceË=±Ş¯¹wÏµå)ÛwÜqó}÷İ·¯Fï;Ó‘ã>®óæİÒ\"œß.6÷qÅwl/6Ó|[ékÄãc{4ìø\ZkjÅûcª4/ÀysF³±=^3nçë¨ÑØ‹Í=¦nó‚]:« 0\\sƒ»\Za£Èwğâ½î(Š\r¸Ü‘{ø·£ÁÇÎaÌ9uêÔ,¯&L˜L<9»?òGs/«¹÷ù§Â¥uú€O…$êëë›úúóÜc}?ö»[—4-ßıu¥Í=ÖºóÈ×ß‹Ï¿qãÆì¾5Åô{¬ŸÆ÷1ÊÊóê«¯f?>oî1ŸÿnyA/mî1½ºyóæl´àÅ\ZmX§0WFsµìÈ“f„\"âxŠÒÑ{9Ï¹OÆåìÙ³³ç¯q;¶çÍ=?#fb™ \Z{Ì8=÷ÜsÉ”)S²Ÿ{ñÅMË÷l}~i_}{:ĞÛ_µWk½æÿ“åÌ´˜·nØ°¡O\Z{SSÓÜô5¶§{Ãªõÿ¨Ò¦åãHæt§¬Û‘ûgŸ}–Î#§ø¾8ÊéùâøÅæ½»‘{ì0ÄAWùï£´üˆüx@a®¢iùîFîñŞh/wä;¡ùÑò1€ˆ3,\"ÿ^%{ŞØ)ĞÜ{V¯ÓØ‘7áø»;Ò=İQ/®³ï®æzMA]]]mZ¤niiéÕÆşİwß}”6Šoª}z§R¦å#¢ Æí˜ÖìjägBDam¥Ó/¼ğBö¸8ˆ.NkË›{¾æ£¯ä¿[œœîÅ·5÷˜b‘zş;Äè,\nDÜ£øØ#3…¹ºš{g#÷˜É)mîå¬¹—\n;§vZ‘“7Şxc–Ïq>½æ^¾šššáùÁuùşp§èãçJFì¦ã›ÚÚÚÑcÇİİ[#ø±GcOñÁjÿ¿éÏÂ#™(²hbZ=¦ÔcÔÑš{4í(–ñ}œÖté¥—¶;½ôuâÀ¸˜VÏgbM4¦rãû(Äq$s|E¸Ø¢ùÇº}iÅ¼¹¹¹íyã ªÙñÅ\nó\06÷îF×¥£ì8‹¢³õö|¶(îxÿ#\'âûÈÅ¸?¾ÆíØ^¼ŞA¬Iwô³À‡z¨İ’P¬ûÇæŞãü¨bƒ5ø¨	ñ÷WîQñqğ\\q=b0Ôk:Ù#LGñ»>øàƒ¿ÁAv;Ÿşù?ÅT|$à`ø©¤K‡ÆeŞèóÆç½æÅ:¦Ôôüè(¸;vìh7½ßÕUÊæÊË¡x¿Š§¼u•ô¾Ê¡×ë4v›s4ù¨q¡›•çSö1³W‹ò—_~99räo%WÅÛ=Xê5]¬é¤\r¢±¾¾¾9}µöä<ö´P¼—î|\Zc¦5›J¿.x4ú|Z\\a–Cbh4÷¼^O‘;ÌXi}h5ù›¢É\Z5ªeÚ´i_}ôÑGß¤{~Ûó›‰‰kÅ744üû£>º İcÜI{ƒí(K…Ya–Cr¨ÒëõÁ&¿¯\'M}0ÖkÊWFJ“fâÁkoO	Ê?-(>T ®=—(ÌW2R˜f9$‡ÔkĞÜ…Â,‡ä 0Í]È!@aV˜åĞÜ…Ya–CBsf…YÉ!@s\n³’C€Â,4w!‡\0…Ya–CBsf…Y	ÍP˜f9$‡\0Í](ÌrH\n³ĞÜ…f…Y	ÍP˜f9$4w@aV˜å4w¡0Ë!9(ÌBsrP˜fÍ]hî€Â¬0Ë!¡¹\n³Â,‡ä ¹…YÉ! Z466*ˆ•{ÒÂ¼O‰¡–C@/[±bÅö––E±bÛ¶mÿšæõrHµzÙ’%K®_¶lÙŸøá‡VÅqàF[Q”\Z\Z¾Iã&9$†Z} -H÷ö?é¼X¯ıñÿ¾¾š‹²’C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@Áÿ\"òĞÔG+ \0\0\0\0IEND®B`‚',1),
('78512f9a-2e06-11eb-84ba-227918fa15ea',1,'out-factory.bpmn','78512f99-2e06-11eb-84ba-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"å¤–å‡ºå•\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"å¡«å•\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"ç”³è¯·äººç¡®è®¤\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${skip}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"ä¸»ç®¡å®¡æ ¸\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('78a9fdfb-2e06-11eb-84ba-227918fa15ea',1,'out-factory.out-factory.png','78512f99-2e06-11eb-84ba-227918fa15ea','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0÷\0\0\0ä\0\0\0…@m¦\0\0~IDATxÚíİ}ˆUuŸ\0ğ*z\"\"‚ú#Ú¨Øh%\"\"ˆ6Ú\"‚ˆè‰6zs¦§Ü4³\'ª5éÅ\"{µ—­ˆ·6DÌu]5g|Í”Ş°YCV7µÌœÆm}Ì§1Ó<{¾Ïì™ë¼ÜÑy¹wæó/3÷Ü;÷Şï|¿ç÷ûsîï~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ô³$IŞ´iÓ¬5kÖüÖØØ˜,^¼Xôs444$+V¬øŸ4êäŠ9ô²(Ê+W®LZZZ’½{÷ŠŠ;v$Ë—/ß•é›äj9ô²m)ÊSœ÷¦£°õrHµzYL£*Š•iaŞ\'‡ÄPË! —Åz‚XQ…9‘Cb¨å0@…ù/ŞlúôOÉW\rgßÇ6ÅTa–Cr¨ÂÂ¼{ç¶dİ¢)É—óïo±-îSP5w9$‡€*+Ì[¿ú·CŠrß}5OAÕÜåª­0¯_út§…9îSP5w9$‡€*+Ìë?ÚiaûTÍ]É!@aš»’CÀ@æ8²¹³Â÷)¨š»’C@•æ«ş©ÓÂ÷)¨š»’C@•æ·5%ë>|äĞéÔt[Ü§ jîrHUV˜#66ãÂÛS…YÉ! \Zó/¿$?şçC§SÓmqŸ‚ª¹Ë!9TQa«‡mXõJ§ë¥qŸ+ŒiîrHÕP˜ÓÑÔöK’ÿ\\øå<â1ñX#0Í]É! Bsw#-#0…YÉ! Ê\ns9#­®F`\n¬æ.‡äPa…ùp‹r\n¬æ.‡äPa…Y(ÌrHš»ĞÜ…f¡¹9(Ì\n³š;t%I’ß755Õ¿óÎ;Ë§M›¶kÂ„	ûF\Z•><©««;p×]wí<yò¦§Ÿ~zf\Z£¹…YÉ¡S[[ûW555w§5zV\ZÓØõ:=ilNï›“~ıc<N‡¢M}öìÙ3¦NºoâÄ‰Éë¯¿¬Y³&Ù¶m[²gÏ$Ä×–––äóÏ?OÒæŸÜsÏ=î½÷Ş-cÇ£¹…YÉ¡şsë­·ş}\Z‹ÓØ{°™—KÓÇ×éxCDÚÄG?ñÄ¿ÜÿıYãŞ¿R®µk×&>øàşúúúõ7ß|óÙš»P˜åê;iƒ>3mĞ{ĞĞ;Š•ƒ©^sèhıè¹sç.¹óÎ;“yóæõ¨©—Z¸pa2zôèÖÁ2ŠW˜f9$‡*MMMÍğ#Füo±Q×ÖÖ&O=õT²dÉ’äÛo¿M~úé§¬&ÿüóÏÙÌëªU«’éÓ§\'·İv[iƒßm?Hû²eË>?~|²aÃ†¤7lÙ²%IwZÇŒóš»ĞÜåêÕÆş‡´ï/6õ™3gfK¥åØ¹sgöøø¹b“OŸsŒ8ˆÄˆ=\Z{¹‰Q®x¾tô^õ{„\n³Â,‡äP%Ø‹}Ò¤IÙ(ıpÄÏÅlIƒ7‚,kì1ß[#öFğ·ß~ûÎ4a†iîBsrèÈÖØ‹Sñ<òHÛÔûáŠ)û\'Ÿ|²tŠ~˜îXİÓñ¿üñÇ÷Æ\Z{_š?~kmmíjÍ]hîB¾´±7GìGÚØ‹\r¾d¿R‡¬bsæÌù—xCıõ×¤¯7®¹Z§{f…YÉ¡§»×Øw*¾«)úâ\Z¼éù*µÇyìqº[øòË/÷Vëè]aV˜åª€æ¾8o¼q0\\_xï½÷ŒŞ«]\\y.¢;’SŞzjôèÑÍ±fTI,iüÂ¬0Ë!9TÉ9W”Ë¢‹Ñõ?şØ\'5:¢/9MîLİ²ÊÄ%eß|óÍ¤?MŸ>}m\\ú°Rş\nÓO‹kjjşVaV˜åªÄ:xIÙìqÏ<óL_×ébsÿ£nYeâZñqIÙşôñÇoI“e^¥ıQbAG{Ğ\n³Â,‡äĞ@æĞÁkÅg÷/[¶¬Oët\\è¦ğ»ÌÓ-«L|ÌöíÛûµ¹777·¤É²µ‚ÿ¨Úö ‹\\\n³Â,‡äĞ@æĞÁÉ¶÷öt¥âJv…ßc«nYeâÓİòé/ñzñéD•şGUÜƒi2…Ya–Crh s(ÖüvoşÖÕiq…×Ş£[V™xãÂ~ÀÁ€„Â\\Y!‡ÄPÌ¡<ú»Në–UfäÈ‘ú{äŞÚÚÚ\\%#÷OãÚÍW\\qÅÑ•4¥ºzõêäüóÏO\ZÛm?öØcãL£.9$i>—İÈ®?~o¯¹ÿı÷ÿUákîí\nò@¬—Îš5+ŠNöµô¾Ø»şúë³KNŞpÃ\rÉ	\'œE<ş˜ci»=nÜ¸NŸwîÜ¹eıq&Åé§ŸïY»íq\nÎµ×^›ÔÕÕ%_ıuÛö+¯¼2¹æškæ\nÈ¡\"Î‹¾à‚y?óxã7²üøä“OÚ¶Í™3\'Ûöá‡vú¼¯¼òJ–s‘/İ—¶>õÔSÙvÆg$»víÒÜËÌ!kî”mÊ”)ûûhùE‹ıG…-¿:®şTZû£0Ç(<\nhwÑYQ.wäşî»ïvZ¨ãg‹¯ÕÔÔ”œtÒIí¶İrË-mŸ1cFrá…&ëÖ­kÛvŞyç%×]wİP.Ì–CåşŸED“/½/râøão÷~_}õÕÉ¹çÛn[äÉk¯½VV¾ÆãJ›{¼~GCÍ½ër´<e{öÙgßìïóÜÓçü\n;Ï½ÃQÖ@4÷‰\'f…7¾vt;š{Áøş­·ŞÊ¶w6rŸ?ş!¯óÒK/eëèßÍüòË/O.¹ä’äí·ßNÎ>ûìdØ°aÉÖ­[“åË—gÏÛ»úwœ|òÉÙ¬Â,ÌCEÌ°”Ó„#ÿ\"Ïb&híÚµY#Û\'xb–,HÎ:ë¬lI(7oîñsñ#q;¾æÛòæ39ùëD^ÆgX\\|ñÅmùtÎ9çÄ‡J%+W®êÍ½Ûr;e{øá‡ÿúî»ïş­¯P·gÄˆ_Wã*eä¿GÆhî=¹§ÿ÷ÙóÄ4jGÓı§œrJV cZö¸ãët4–ìÒF#¿8À¥C+£¹ÇºiäIéßzö¾Å×âöØËwüº‹…Çs›vG‘/ÏDn_tÑEYcÿı÷“¥K—¶íäßÇW—Ÿí^\\¡.­ûúã\nuuuu\\¡®ÊMš4é¿ûëÚò‹-šY­×*®”‘{ŞÈ£wÖ€#bDTú:1\"‹û.»ì²NGõùiì(ÄH.f\0b[’«®º*kîyÁ.6÷İ»wg;ê¨£²ïæÊ›–ïêXxÿ#¯â½ë,¢A›{wyM;7¾æÇcäÍ=\ZE>İy\\:ÍÿØceË=±Ş¯¹wÏµå)ÛwÜqó}÷İ·¯Fï;Ó‘ã>®óæİÒ\"œß.6÷qÅwl/6Ó|[ékÄãc{4ìø\ZkjÅûcª4/ÀysF³±=^3nçë¨ÑØ‹Í=¦nó‚]:« 0\\sƒ»\Za£Èwğâ½î(Š\r¸Ü‘{ø·£ÁÇÎaÌ9uêÔ,¯&L˜L<9»?òGs/«¹÷ù§Â¥uú€O…$êëë›úúóÜc}?ö»[—4-ßıu¥Í=ÖºóÈ×ß‹Ï¿qãÆì¾5Åô{¬ŸÆ÷1ÊÊóê«¯f?>oî1ŸÿnyA/mî1½ºyóæl´àÅ\ZmX§0WFsµìÈ“f„\"âxŠÒÑ{9Ï¹OÆåìÙ³³ç¯q;¶çÍ=?#fb™ \Z{Ì8=÷ÜsÉ”)S²Ÿ{ñÅMË÷l}~i_}{:ĞÛ_µWk½æÿ“åÌ´˜·nØ°¡O\Z{SSÓÜô5¶§{Ãªõÿ¨Ò¦åãHæt§¬Û‘ûgŸ}–Î#§ø¾8ÊéùâøÅæ½»‘{ì0ÄAWùï£´üˆüx@a®¢iùîFîñŞh/wä;¡ùÑò1€ˆ3,\"ÿ^%{ŞØ)ĞÜ{V¯ÓØ‘7áø»;Ò=İQ/®³ï®æzMA]]]mZ¤niiéÕÆşİwß}”6Šoª}z§R¦å#¢ Æí˜ÖìjägBDam¥Ó/¼ğBö¸8ˆ.NkË›{¾æ£¯ä¿[œœîÅ·5÷˜b‘zş;Äè,\nDÜ£øØ#3…¹ºš{g#÷˜É)mîå¬¹—\n;§vZ‘“7Şxc–Ïq>½æ^¾šššáùÁuùşp§èãçJFì¦ã›ÚÚÚÑcÇİİ[#ø±GcOñÁjÿ¿éÏÂ#™(²hbZ=¦ÔcÔÑš{4í(–ñ}œÖté¥—¶;½ôuâÀ¸˜VÏgbM4¦rãû(Äq$s|E¸Ø¢ùÇº}iÅ¼¹¹¹íyã ªÙñÅ\nó\06÷îF×¥£ì8‹¢³õö|¶(îxÿ#\'âûÈÅ¸?¾ÆíØ^¼ŞA¬Iwô³À‡z¨İ’P¬ûÇæŞãü¨bƒ5ø¨	ñ÷WîQñqğ\\q=b0Ôk:Ù#LGñ»>øàƒ¿ÁAv;Ÿşù?ÅT|$à`ø©¤K‡ÆeŞèóÆç½æÅ:¦Ôôüè(¸;vìh7½ßÕUÊæÊË¡x¿Š§¼u•ô¾Ê¡×ë4v›s4ù¨q¡›•çSö1³W‹ò—_~99räo%WÅÛ=Xê5]¬é¤\r¢±¾¾¾9}µöä<ö´P¼—î|\Zc¦5›J¿.x4ú|Z\\a–Cbh4÷¼^O‘;ÌXi}h5ù›¢É\Z5ªeÚ´i_}ôÑGß¤{~Ûó›‰‰kÅ744üû£>º İcÜI{ƒí(K…Ya–Cr¨ÒëõÁ&¿¯\'M}0ÖkÊWFJ“fâÁkoO	Ê?-(>T ®=—(ÌW2R˜f9$‡ÔkĞÜ…Â,‡ä 0Í]È!@aV˜åĞÜ…Ya–CBsf…YÉ!@s\n³’C€Â,4w!‡\0…Ya–CBsf…Y	ÍP˜f9$‡\0Í](ÌrH\n³ĞÜ…f…Y	ÍP˜f9$4w@aV˜å4w¡0Ë!9(ÌBsrP˜fÍ]hî€Â¬0Ë!¡¹\n³Â,‡ä ¹…YÉ! Z466*ˆ•{ÒÂ¼O‰¡–C@/[±bÅö––E±bÛ¶mÿšæõrHµzÙ’%K®_¶lÙŸøá‡VÅqàF[Q”\Z\Z¾Iã&9$†Z} -H÷ö?é¼X¯ıñÿ¾¾š‹²’C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@Áÿ\"òĞÔG+ \0\0\0\0IEND®B`‚',1),
('9c68405e-2d55-11eb-b88c-227918fa15ea',1,'mes-requirement.bpmn','9c68405d-2d55-11eb-b88c-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"mes-requirement\" name=\"MESéœ€æ±‚å˜æ›´\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"å¡«å•\" flowable:initiator=\"initiator\" flowable:formKey=\"mes-requirement\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-33868E85-5876-4712-9136-27C22F40C24D\" name=\"å¡«å•äººç¡®è®¤\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-07BACF0C-406A-4E40-A1FC-00A0BC020C59\" sourceRef=\"startEvent1\" targetRef=\"sid-33868E85-5876-4712-9136-27C22F40C24D\"></sequenceFlow>\n    <userTask id=\"sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\" name=\"ææ¡ˆéƒ¨é—¨ä¸»ç®¡\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-9D4E7218-A416-4E13-8129-6902D1CEDBD3\" sourceRef=\"sid-33868E85-5876-4712-9136-27C22F40C24D\" targetRef=\"sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\"></sequenceFlow>\n    <userTask id=\"sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\" name=\"Coordinator\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-3B1C7B5B-E126-4DBE-9960-3332CA8953FC\" sourceRef=\"sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\" targetRef=\"sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\"></sequenceFlow>\n    <userTask id=\"sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\" name=\"DEV TL\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-75B89205-F7AD-4B61-9772-F69F67FC5A4B\" sourceRef=\"sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\" targetRef=\"sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\"></sequenceFlow>\n    <userTask id=\"sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\" name=\"PSM\" flowable:formFieldValidation=\"true\"></userTask>\n    <userTask id=\"sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\" name=\"MESM\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-6F9F2036-70B8-4F2E-AF81-4B54AA19CD43\" sourceRef=\"sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\" targetRef=\"sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\"></sequenceFlow>\n    <userTask id=\"sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\" name=\"PM\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-C4E02C10-B6FB-47DF-8F9F-346B5D75275C\" sourceRef=\"sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\" targetRef=\"sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\"></sequenceFlow>\n    <sequenceFlow id=\"sid-2090AF02-C11C-4993-9CC4-F4D95E4F6C72\" sourceRef=\"sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\" targetRef=\"sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\"></sequenceFlow>\n    <endEvent id=\"sid-4C4E0E45-0E10-40C1-A1A5-B4BC491F8E1E\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-19C22622-BF57-43FF-BE8C-D74EDD41782F\" sourceRef=\"sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\" targetRef=\"sid-4C4E0E45-0E10-40C1-A1A5-B4BC491F8E1E\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_mes-requirement\">\n    <bpmndi:BPMNPlane bpmnElement=\"mes-requirement\" id=\"BPMNPlane_mes-requirement\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-33868E85-5876-4712-9136-27C22F40C24D\" id=\"BPMNShape_sid-33868E85-5876-4712-9136-27C22F40C24D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\" id=\"BPMNShape_sid-9E02A53C-8F0C-4B08-A7ED-46875520B424\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\" id=\"BPMNShape_sid-962F5DA8-4C49-46EC-AC02-75726D74F3BD\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"465.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\" id=\"BPMNShape_sid-712F5FB9-B139-4A54-B5F0-0C9963B866D6\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"610.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\" id=\"BPMNShape_sid-1B1D89A5-C026-4A31-927F-32BD7888BD59\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"255.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\" id=\"BPMNShape_sid-A57DF6D0-FE5C-4D32-B8EC-ECEA13271C76\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"255.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\" id=\"BPMNShape_sid-18F650C5-F8DF-4D17-AD0B-FCCB1F242C4D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"465.0\" y=\"255.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-4C4E0E45-0E10-40C1-A1A5-B4BC491F8E1E\" id=\"BPMNShape_sid-4C4E0E45-0E10-40C1-A1A5-B4BC491F8E1E\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"610.0\" y=\"281.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-07BACF0C-406A-4E40-A1FC-00A0BC020C59\" id=\"BPMNEdge_sid-07BACF0C-406A-4E40-A1FC-00A0BC020C59\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C4E02C10-B6FB-47DF-8F9F-346B5D75275C\" id=\"BPMNEdge_sid-C4E02C10-B6FB-47DF-8F9F-346B5D75275C\">\n        <omgdi:waypoint x=\"419.94999999990824\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"464.9999999999807\" y=\"295.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2090AF02-C11C-4993-9CC4-F4D95E4F6C72\" id=\"BPMNEdge_sid-2090AF02-C11C-4993-9CC4-F4D95E4F6C72\">\n        <omgdi:waypoint x=\"660.0\" y=\"217.95000000000002\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"660.0\" y=\"234.99999999999994\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"225.0\" y=\"234.99999999999994\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"225.0\" y=\"255.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3B1C7B5B-E126-4DBE-9960-3332CA8953FC\" id=\"BPMNEdge_sid-3B1C7B5B-E126-4DBE-9960-3332CA8953FC\">\n        <omgdi:waypoint x=\"419.94999999999067\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"464.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-75B89205-F7AD-4B61-9772-F69F67FC5A4B\" id=\"BPMNEdge_sid-75B89205-F7AD-4B61-9772-F69F67FC5A4B\">\n        <omgdi:waypoint x=\"564.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"609.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9D4E7218-A416-4E13-8129-6902D1CEDBD3\" id=\"BPMNEdge_sid-9D4E7218-A416-4E13-8129-6902D1CEDBD3\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-6F9F2036-70B8-4F2E-AF81-4B54AA19CD43\" id=\"BPMNEdge_sid-6F9F2036-70B8-4F2E-AF81-4B54AA19CD43\">\n        <omgdi:waypoint x=\"274.94999999974334\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"295.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-19C22622-BF57-43FF-BE8C-D74EDD41782F\" id=\"BPMNEdge_sid-19C22622-BF57-43FF-BE8C-D74EDD41782F\">\n        <omgdi:waypoint x=\"564.95\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"295.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('9ca6cfff-2d55-11eb-b88c-227918fa15ea',1,'mes-requirement.mes-requirement.png','9c68405d-2d55-11eb-b88c-227918fa15ea','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0Ğ\0\0Y\0\0\0±\0\0\0 IDATxÚíİŒœe¹ğ&@BH$Ä(sˆ‡b‘ ALCb<D½t…¦’¶r b)Å¦\\l,xAEsĞTÂMC°öôpÙİÒ…†Z,ÒC¡¶KËVNÁJ—Zà;ßó¾ë·Ó™½uwvf÷÷Ktwfvv»óß÷}¾÷{gfÚ4\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 IeYväÖ­[—®_¿şİîîî¬³³SÕ¹ººº²5kÖü5¯R2$C2$C2\r.œµk×f½½½ÙşıûÕÕîİ»³Õ«W¿™@—È’!%C2$CĞÀâhİ€Ó0Ïşü(~³)R2$C2\r,NuùƒoœÊ2¤dHÉÉ4°Ø·ä½¡L†”)’!‚I0èüıÙÖ\r¿Ìïº¥¨ø8.3PtdH†dH†dHi Ñ@WÔŞ==Ù¦‡fÏ­¸~@ÅeqÁÂÄ%C2$C2$CJºTÛŸÿÃ!NªÏ/7X˜¸dH†dH†dHi Ñ@—kó£·Õtâ:ƒ…‰K†dH†dH†”\Z\rt©6uŞTsĞ‰ë&.’!’!R\Zh4ĞƒÉÉ)\r4ŒnĞ‰g*×\Ztâ:ƒ…‰K†dH†dH†”\Z\rt©¶¬ûIÍA\'®3X˜¸dH†dH†dHi Ñ@—êõÙ¦GzÊ+¿,®3X˜¸dH†dH†dHi Ñ@WÔËOİsÈ —(:2$C2$C2¤4Ğh +ëí·³-ÿÇ¡§¼òËâ:ƒ…‰K†dH†dH†”\Z\rté›^\\wgÍ}cqwp2qÉÉÉÒ@£ÎÆwnY™ıñ¡oÖpRÅmâ¶àM\\2$C2$C2¤4ĞLÉz¨#uGğ’!’!R\Zh4Ğ¥\ZÎ‘ú`Gğ—ÉÉÉL©z´N*ƒ‡‰K†dH†dH†d¦T­:2$C2$C2¤4Ğ`Ğ1èÈÉ’!%C`Ğ1èÈ’!%C2$C`Ğ1èÈ’!%C2$C4,ËŞ·qãÆ9¿şõ¯W/Y²äÍyóæ˜9sfÖÚÚšutt¼÷•¯|eÿ7Ş¸õ¶Ûn»7¯Õ@+ƒÉÉ)\rô”mœï¿ÿş{n½õÖ×^{mö³Ÿı,[¿~}ÖÓÓ“õõõe!şíííÍ~úé,o°³¯~õ«ï}ík_{eöìÙWj •AG†dH†dH†”zÊÈåYßşö·ß¾şúë‹æøwŞÉ†ëÙgŸÍn¸á†wæÌ™³ùÒK/=E­:2$C2$C2¤4Ğ“yÕùÈeË–­œ;wn¶|ùò5Î•zè¡lÖ¬Yû&Ëj´AÇ #C2$CJ†”šCšçU«V=yÍ5×d/¾øb6^yå•,oÆ÷]yå•ÿ®V&.’!’!R\ZèI%V£y=Íc)îoöìÙ{ÛÚÚ:4ĞÊÄå±“!’!R\ZèI!ö<Ç¶±Zy®¶}ùå—ïÉ›èS5ĞÊÄ¥dH†dH†”ºÙ·n¼ï–[nÙ{ÇÓŠ+öÍ˜1ã	\r´2q)’!’!¥nj<ğÀÆ«müãÿÈÆÛUW]µ«Y·rt:2$C2¤dHi )VŸãuã¥êêá¹çÛß¬«ĞƒÉ)R\Zh¦Å;ÆçåêFjÖ¬Y»Z[[On”ßA[[[g^Ÿ6ètdH†dHÉÒ@3¤x{î_üâY=İqÇÏæ\rô‚FùÄ[’GÅàÓÒÒòIƒAG†dH†”)\r45-Y²äÍx{îzzüñÇ_ÉÿÈ—7Ú Sª«Åt:2$C2¤dHi ™6oŞ¼;wî¬k½k×®Şü{{:ıGñåÁÇ cĞ‘!’!%CJÍ´™3gf}}}um ãûåÔ}>è”âãt˜AÇ #C2$CJ†”šân\"ã½áÊ ÓX%CJ†”Éš	qÅW¼Wïè}ûöíj’è\rùÑúÓ§O?²§½.»ì²ì¢‹.\ZpYGGGvşùçdšwå§®R2¤dH†dˆ:¸æškö×{ô«¯¾úçß=`°©×¾±Ô@/]º4ş˜ªVÜ&İşç?ÿyvÎ9çd{÷î->ıõ×³ÓO?=[²dIÍï‘î{Ù²eÃú™âZN:é¤xÌ\\ßëóŸÿ|Ñà¿ôÒKı—ŸwŞyukø|â\Z×Åï8~÷éãjYI¹(Wd#®‹ÔºïE‹eúĞ‡Š­Vñùİwß=à~Ó÷ºöÚk³O}êSÙ;ªşÕ¾Ï½÷Ş›qÆ‡dªœëøÚ\'Ÿ|²ÿ²x ¸ì‘G‘¡&n~>úèâqLŸüã/² ù‘!\r4MgáÂ…[êı*?üğ7è«p<ÑÖÖvqå`Sï:\Z—h~¢ÚÛÛ³Ï}îsıŸ¿õÖ[ı·_½zu1E“Ÿ/X° ø<Ş’½Ö÷øÍo~S³™5kÖ€ægãÆÙñÇ_³¿ç{²3Ï<3Û´iSÿeÑÀ_xá…SyâªK†*èÏ~ö³YwwwQ‹/îo +›ßZu×]wesçÎ­z]ÜÇQGU4±GqDvçwöÿk×®Í>ö±™‹Û¥JY¬Ö@Çï \Z©h¤+¯‹\\¾ÿıïğı#ÿ§vÚ€Ë\"«2tx·ñ·zÌ1ÇGÕ»¾òÊ+‹\Zíı]uÕUÙ)§œ¢ùi°¹l¨*ÿ-ÇØò| ø¹ËÍÕÆ¢³Î:«øwË–-ı·ÛµkW1.Å\\Të{TVùz\r4£öİï~÷õ~èE‹­h°×®z”^ÏA\'\Zçô{ì±ÅÀNT|×=øàƒ&¢Z×Wû>?úÑŠë«ı_¢aşÌg>SL¤¿úÕ¯Š‰éÔSOÍ¶oß^4ëñ3Äåƒı?b ¬Ü†2E&®ºe(VùËo4Ğ1Tf¥Ü@Çƒ8ëÍRøÄç©âkâ~bòŠÁ›o¾¹ÈÙ?øÁb…9î#nsÿı÷__ÍoÜo4ìÕ~ÆøúÔ@Çí‡ÓÄÇ}Åı~á_È}öÙâûÇçÇw\\‘Ë¸Ï~ô£ÙO<!CcĞ<Çï57ÑÄxâ‰uo ÇªÓü4Î\\6’Ç-ÆÛo¿½8HÏcK‹;ñy,ÈÄmRıà?(./ŸeËã²¸®ü=Ê_—¾W*\r4câ[ßúÖ¿\\}õÕïÖñûÚÛÛ_j¤w\"®ñt¢9ˆ£ë8GşĞ£¢¹¨l óÇ­hŠ¢á‰ë.\\X|MO­:V´ã¶åUÄT±ò}Â	\'+˜ÑLE³Tkµ2m¨l–cõ0š0ƒÎøeèÑG-V[¢©|æ™g¬FGER]yVa¨­A‘¿xL£YNyK\rt¬rÏ™3§Æpè8kR^ÜÆuñoùò8PKxCU¬–ËĞè+Râ÷ÍKºlÛ¶mÅ¿ñx}ãß(¶ñÄÁXŒ	óçÏÏŞ|óÍA¯+7%±\r\'ÆØÚ9ÛÆ÷LwÕ\ZàôñøÃ¢¹ƒñßıîwÅuqPŸVÊc|‰3ÕVGúóÉĞÄ6ĞåËÒ™³t&$>®ÜyŠ&»|¶$â±®µ%,İW#|i \'|€ùŸ§Ÿ~º^Û7îÍ›çµÍø{ªç“£ŠI$*>‹èXÕ‹ëÏ=÷Üš«ÓQ1(Eó“ŞŠ+úW1£‰Š:\Z§høË\rt4li¡Úş[ƒÎØd(šÍØ—`je Ãt`[:ø‰Ç1mÇ(7PµöRGsyŠƒ®hH¢ÑI]k~µë\"ƒñ½Ò–¥j\ZèÃû§ƒãò–°Té\0\'¶wÄ–¯—âóxÉÓÁ®+7%±š²ÿÆ\nwÚÖ3TÛ2n¼ñÆâãh„S¢âX\\gÆÒâ´Òs:FúóÉPã4Ğ‘Å´¥£ÖŒ¸<{¿üòËEÓãØPg=5ĞŒ›/ùË—^wİuê°\n½§½½ı™¶¶¶\rôĞ\rôP+Ğ±R“š¡¸.VkâóŸşô§Uèt:?­>­[·nÀõgŸ}vqy¬`§:§´j÷Ÿ§Ÿ+~ÖòÀ•š¦i÷Í\ZtÆ\'Cqº3“xiœ)HÍE¬¼¥ŒD¥­±úÍjÜ>®ƒ¨¸Xå‹¬D¢É.ßW¹âÔhÊS¬PG“2Ò:5RÓ†ñäØt —¶¤TV¬ÊĞáı¿ãï8~Çé‰¢ÕšëKÊÆqù`×•›’8ƒQ>Ğæ(¾×p\Zè¸]ºmüœñÿUçø8-$ÄÇÕš ‘ş|2Ô8\rtŒSÕ«òYª¸<æ¹¸ü{ßû^1~MÆ“â5ĞŒ«9sælŒ\'§Øo«ÏCíÏšê\rt4c½Oºˆû‰\'cÅä{Iãã4ÑD¥Á(\Z˜Ô@Ç–Ô¼§UÊÊ:N½Åj@¬Ä“ã”mì]3èŒO†vïŞ=`ÛFüÛxRS[x¢q‰†9òUœÎN9ŠWO‰•¾h¬S“]™£ø>iG:õ—´Sîñ5Qq€–ÔÒe±Ç¾rÚÄ5~Š-@éŒDå4¶¤m©	íYƒ]W­)I·1\'­0Õ@W^«ĞñoìÛûIÍÿ`ßo¸?Ÿ5N[ã²x2á`Ud æ™·âÌZœ«v ¨¦nbOrŞ0í{ñÅÇ¥yŞ¸qã²ü{ìlkk;µYGõh cU0=‰p°è8Ø‰£îj{ £Ê¯ÄñÔSO§üc‰Ë\rNlå(ï+7ĞÑ<µMyüÌ±76n/–^éãë_ÿºAgœ2Tn cUø‹_üâ€¦6*¶ZwtÜWj ÓÊszIÂÔ@ç¾ı¯€1^[8†Zü¥­)24úJg­â÷\rKl±ˆF$®K¯ÆK±ÚÙJ<ƒ]W­)‰ƒéi÷»—_åe$\rtzU–x²{\ZëÒíRÃœÎJŒôç“¡ÆxaÚbóT:+ß¦üä¿ô8§¹)=¶£m «İ¿šË\'Ñy#ôVooï˜6Ï;vìx,oÆ¶5ëÖz:·Şzkÿ«\rÄéÊZNy—_…a°ŠÛÅ¤“L4ä©ùN•Ñg¼2CyP‰¯}„±b™š÷XÕ‰&*\r41èÅÏ3oŞ¼ş\'¤=•iŸZ4õ±ÏPüî£éM¯¿Ù‰Fºr¢ˆï\ri4ñª*©¡‰Õ›xù¹h4\"{±Ï}¨èxv|ìAÎ«p¤g¾¶®µÍ»zl2¿ÿÈL4\"qÚ<m£‰¿áØ¯œö	ÇŒ8S‘V‘k]W­AWö‰ıÊÑè¤Æ‘6Ğ‘¿gâ`=5şév)+1¾\rõ³k ¯vpÏsŒMñ¸ÅKÒ\rö2tå—ÏL—Å©§®vÿ\ZhFeÆŒ³fÏ½w¬V¢cå9šç–––šıw3ƒNE§}y1Ä€MO¼âB¬\ZÇ*Q4Öñ›¸,&¿T±ê“HLåËãvñr`Ñ,•_«¹\\ñ=ãÉ€±#­èÄ\nvPñq¬&ÇıÄÇi5\'5>Ñ`ÇşÙXéŒ†¹<øíÙ³§X¡Îàfâ\ZYÅï=­ğÇcY‰ƒ£Ê×ì&;¶åDnâv/¼ğBÿcÍplë‰ìÄŞ÷Ø†YˆëÒ\ntì“ïMsjPÊ¯\'·û+?	(­HãŸşô§šON¬Ö¬ÇıÄ“kíŠŸK†¼ù„7Á!¢áäÍnkGGÇ›¿ÿıïÿ~O,Üóıïÿ—±m#¯™“á÷2•XeŒ©Øo[Ş\n2Öïgâ\ZyÅÁMÄÄX‹\'Ó¤6V„c59‚âà©ŞI4âqz5N©§7EˆÌ”ŸT«&\"[š%CJ†S±\'º½½½{Îœ9»yæ™}#yç|\"¼/oÀ7Ä›yÏ³AÇ #C2$CJ†”1šFú’h¤gÎœÙ»dÉ’ç{ì±m===;cOYØ·oß®W_}õÏ]]]ÿuÓM7=8cÆŒ­Ñ8Çªs³¾Ú†AÇ #C2$CJ†”qØòÆøÃmmm×æñÒ¼^Î«/öåüw{^Ëãí¹›ñ\r:’!R2¤d:R2¤dH†d:ÊÄ¥dÈc\'C2$C`ĞQ&.%C2$C2$C V’!’!R\Zh4ĞşØ\r:2$C2¤dHi Á cĞ‘!’!%CJ†À cĞ‘!%CJ†dH†À £L\\J†<v2$C2eâR2$C2$C2\ZheĞ‘!’!’!¥Fíİ #C2$CJ†”\Z:’!R2¤d:R2¤dH†d:ÊÄ¥dÈc\'C2$C`ĞQ&.%C2$C2$C V’!’!R\Zh4ĞşØ\r:2$C2¤dHi Á cĞ‘!’!%CJ†À cĞ‘!%CJ†dH†À £L\\J†<v2$C2eâR2$C2$C2“Qww·?öÆ©¾|Ğ9 CJ†”ÉA[³fÍÎŞŞ^ğ\rP===¿ÍÍ2¤dHÉÉ4°•+W^´jÕª7^{íµ}şğ\'îh=œ®®®my]\"CJ†”ÉAƒËƒ~A~´¸!N¹Ä¾%U÷ŠßûæfpdH†dH†dèğ«µµU†\0\0`¸¢ö[\0\0\0\r4\0\0h \0@\r\0\0\Zh\0\0Ğ@\0€Úo\0\04Ğ\0\0 \0\0\r4\0\0h \0@\r\0\0\Zh¿\0\0Ğ@\0€\Z˜ƒRJ)ÕìeFµ\0€\Z\0\04Ğ\0\0 \0\04Ğ\0\0 \0\0\r4\0\0h \0@\r\0\0\Zh\0\0Ğ,·¶.ÆÛ¡nğ›\0€ÿo ?‘×Á\Zè–––ü¦\0\0àŸMôƒƒ4ĞOLŸ>ıH¿%\0\0øgı‰Z\rt[[ÛÅ~C\0\0ph]m/ô«Ï\0\0P½>d/´½Ï\0\00ˆ¼a~Àê3\0\0¿şdiïó¿ù\0\0ÀÒ^h«Ï\0\00¼úŞ‰\0€ºÈ²ìÈ­[·.]¿~ı»İİİYgg§ªsuuuekÖ¬ùk^2¤dH†d ÁÅ¤µvíÚ¬··7Û¿¿š Ú½{w¶zõê7óIìR2¤d ÅŠI«a&¯ı›eHÉ’!€§KM\ZSùÄu@†”)h`±÷Í„ÑPW&CJ†”L‚‰ëïoìÌ¶nøeö|×-EÅÇq™ÉÆÄ%C2$C2 ®¨½{z²M/Ì[qı€ŠËâ:æG†dH†d@]ªíÏÿáI+Õç—›p4?2$C2$C\0\Zèrm~ô¶šW\\gÂÑüÈÉh Kµ©ó¦šW\\gÂÑüÈÉh M\\&.’!’!\0F7qÅ³İkM\\q	Gó#C2$C2 .Õ–u?©9qÅu&ÍÉÉ€ºT¯÷lÌ6=²èĞÓ¦ùeq	Gó#C2$C2 ®¨—Ÿºç‰+.3Ù˜¸dH†dH†\04Ğ•õöÛÙ–ÇÿãĞÓ¦ùeq	Gó#C2$C2 .½û×‹ëî¬¹÷0®ó.`š’!’!\0\rôÛog;·¬ÌşøĞ7kNZ©â6q[«@š’!’!€)Ù@µÚcÈÄ%C2$C2 .ÕpV{[2i~dH†dH†\0¦T=ÚI+•	Hó#C2$C20¥\Zheâ’!’!ÀÄeâ’!’!¥0q™¸dHÉ’!\0—‰K†”)0q)Í’!’¡‰3cÆŒ·´´\\İÚÚº4¯-yíÍ+Ë«/¯—óëÈÿ]·Ó\0&.—É©)Û@·µµ]œWg^û6ÌÃ©GóÛwè\0—‰K†dH†Ô”i ó&øä¼	~hMsµZ{é¥—¢[\0L\\&.’!R“ºniiimooÿßr3<cÆŒì;ßùN¶råÊì/ùKö·¿ı-o½õVÖÓÓ“­[·.»ã;²/}éK•Mô^«Ñ€‰ËÄ%C2$CjÒ6Ğyó|AŞğ¾Snœï½÷Ş¬··7={ö·¯+7Òù}^©k\0L\\&.’!R“ª•çró<şübµy4âë®¿şúÊ&ÚJ4`â2qÉÉš\rtìy.oÛX´hQÿ6ÑŠí‹/®ÜÎqªî4Ğ&—É©¦o óæ¹«¼ò|¸Ís¹‰®X‰^«{\0\r´	ÃÄ%C2$Cª©3/UWŞó<Úmƒmç(ï‰¶•4Ğ&—É©fo ;SsO\0÷İwŸUhÀÄeâ\ZzBÊëÓ2$C2$Cœ¡xçÀôÄÁX%~ıõ×Ç¥Wç¨x‰»“u V&®J§*;[ZZ>)C2$C2Ôˆ:øöÜÅín¿ıöl<ÅëD—\ZèºĞ@+WÕ‰«TV[	’!’!šÈå—-M×¯Zµj\\èx³•ÒÏ²\\\Zheâ\Zjâê_	*O`2$C2$C™¡üó-éò±~ò`¥xÇÂÒÏ±]\Zheâ\ZÖÄU^	ŠSª2$C2$C™¡¼ö¥ÏÇê¥ë{I»Ò÷îÓE€Z5@\rc²h¸’!’!j”ª‡ò÷ÓE€ZYùîÊÏ†–––¦OŸ~¤ÉÉĞDg(ŞĞ\n4 6q5êÄ5 é‘!’!j„Ù\rh K•ÿxıuÌ1Çdçw^öÂ/×mß¾=›;wnvâ‰\'fGuTvôÑGg\'tÒ!_÷ÒK/—mÛ¶mÀå&®M\\OÄ»|U6=–¡‘<îåËÊ×M†\\ÉĞÄKÍ<ö4s†¼\n ®˜¨Î8ãŒâ]¥.»ì²âó3Ï<³¸î¬³Î*>_¸pav÷İw÷Wúº#8¢h€îºë®â²¸ø<.×@{âªºZØÈ\rôp÷øøôÓO/n—j²äJ†&n\\jæ±§™3äu \rtÅDuşùç÷õõŸÇDŸÇÊ`|ş‘|$kooÏzê©_×Ÿ}öÙÅ—]~ùåÙ9çœ£Ä\ZÉã^ÎV¹&C®dhâÆ¥f{š9CñN„y3{ ïDØÑÑñw\"š¦^±bEñùi§V|>oŞ¼§EcrŠ•òiÔ%K–dÇw\\qÙ)§œR|>ÍIİ@÷qŸVcÇdÈ•MÜ¸ÔÌcO³g(^:5¶ñ7;î»ï¾òêóZh ~¯aÔñÇŸuww÷_ƒä¹çÛ}å^ÕØ—ÿ.[¶¬øwË–-\Zè)Ğ@çqOŸWnÓ˜¹’¡‰—šyì™\rôÅ©¹Uè±~2aÜ_{{û{¥7réĞA€º¡\'ªhh–.]Zœ–K×íØ±£ÿã\'Ÿ|²ÿÔiùëâãØ«ÍPü[y‰kr6ĞÃyÜkå`2äJ†&n\\jæ±§Ù3òÆöÑÔàÎŸ?Ì^Ò.^ºîºë®{§¼ú<Ô¾~@İ\rQepÂ	Ù‚Š•Ã9sæ·»ğÂùº›o¾¹øxñâÅ\Zè)Ô@õ¸§Ï+ŸD8r%C7.5óØ3I\Zè“óÚ\ZİE‹vÍsş–÷=ïmkk;U÷\0\Zè¦œ¨â	:Ç{l±G5N¡F³³k×®C¾nÓ¦MÅÇñ¯zê4ĞC=îÓjì¹’¡Æh ›mì™\rthiiiMO(L+Ñ£İÎ_W±òlëĞ|—70!%CJ††±=³ÜDÇèØr¯¢1ÜWÛˆ\'–÷<GåÍù\rºÀÄeâ’!’!5é\Zè´×rt¼Nt¼ÙJ¬.§í±M#Şa0Ş$åÇ?şqvÅW¼[ñî‡ñVá3u€‰ËÄ%C2$CjÒ6ĞW¢O.¿¼İ(k­=Ï€‰ËÄ%C2$CjJ4Ğ¥Fú’ƒô‘4Î±êìÕ6\0—‰K†dH†Ô”k “xÇÂ¼‘¾6oŒ—æõr^}›åøw{^Ëãí¹½Ã `â2qÉÉÒ@˜¸L\\2¤dHÉ€‰Ki~”)0q)Í’!’!\0\r´2qÉÉh •‰K†dH†”\ZÀÄeâ’!’!¥0q™¸dHÉ’!\0—Òü(R2`âRš%C2$C\0\Zheâ’!’!Ğ@+—É)\r4€‰ËÄ%C2$CJ\r`â2qÉ’!%C\0&.¥ùQ2¤dÀÄ¥4?J†dH†\04ĞÊÄ%C2$C2 V&.’!R\Zh\0—‰K†dH†”\ZÀÄeâ’!%CJ†\0L\\Jó£dHÉ@ãëîî6a4Nõå×R2¤d ­Y³fgoo¯I£ª§§ç·ùÄµY†”)h`+W®¼hÕªUo¼öÚkûL·â“VWW×¶¼.‘!%CJ†\0\Z\\>X^ĞÙÙ¹!NÛÅŞ7U÷Šßûæf´dH†dH†\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 éü¦s¯wäÖ°,\0\0\0\0IEND®B`‚',1),
('9f32daab-2e0b-11eb-b42b-227918fa15ea',1,'out-factory.bpmn','9f32daaa-2e0b-11eb-b42b-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"å¤–å‡ºå•\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"å¡«å•\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"ç”³è¯·äººç¡®è®¤\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${skip}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"ä¸»ç®¡å®¡æ ¸\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('9fcde22c-2e0b-11eb-b42b-227918fa15ea',1,'out-factory.out-factory.png','9f32daaa-2e0b-11eb-b42b-227918fa15ea','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0÷\0\0\0ä\0\0\0…@m¦\0\0~IDATxÚíİ}ˆUuŸ\0ğ*z\"\"‚ú#Ú¨Øh%\"\"ˆ6Ú\"‚ˆè‰6zs¦§Ü4³\'ª5éÅ\"{µ—­ˆ·6DÌu]5g|Í”Ş°YCV7µÌœÆm}Ì§1Ó<{¾Ïì™ë¼ÜÑy¹wæó/3÷Ü;÷Şï|¿ç÷ûsîï~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ô³$IŞ´iÓ¬5kÖüÖØØ˜,^¼Xôs444$+V¬øŸ4êäŠ9ô²(Ê+W®LZZZ’½{÷ŠŠ;v$Ë—/ß•é›äj9ô²m)ÊSœ÷¦£°õrHµzYL£*Š•iaŞ\'‡ÄPË! —Åz‚XQ…9‘Cb¨å0@…ù/ŞlúôOÉW\rgßÇ6ÅTa–Cr¨ÂÂ¼{ç¶dİ¢)É—óïo±-îSP5w9$‡€*+Ì[¿ú·CŠrß}5OAÕÜåª­0¯_út§…9îSP5w9$‡€*+Ìë?ÚiaûTÍ]É!@aš»’CÀ@æ8²¹³Â÷)¨š»’C@•æ«ş©ÓÂ÷)¨š»’C@•æ·5%ë>|äĞéÔt[Ü§ jîrHUV˜#66ãÂÛS…YÉ! \Zó/¿$?şçC§SÓmqŸ‚ª¹Ë!9TQa«‡mXõJ§ë¥qŸ+ŒiîrHÕP˜ÓÑÔöK’ÿ\\øå<â1ñX#0Í]É! Bsw#-#0…YÉ! Ê\ns9#­®F`\n¬æ.‡äPa…ùp‹r\n¬æ.‡äPa…Y(ÌrHš»ĞÜ…f¡¹9(Ì\n³š;t%I’ß755Õ¿óÎ;Ë§M›¶kÂ„	ûF\Z•><©««;p×]wí<yò¦§Ÿ~zf\Z£¹…YÉ¡S[[ûW555w§5zV\ZÓØõ:=ilNï›“~ıc<N‡¢M}öìÙ3¦NºoâÄ‰Éë¯¿¬Y³&Ù¶m[²gÏ$Ä×–––äóÏ?OÒæŸÜsÏ=î½÷Ş-cÇ£¹…YÉ¡şsë­·ş}\Z‹ÓØ{°™—KÓÇ×éxCDÚÄG?ñÄ¿ÜÿıYãŞ¿R®µk×&>øàşúúúõ7ß|óÙš»P˜åê;iƒ>3mĞ{ĞĞ;Š•ƒ©^sèhıè¹sç.¹óÎ;“yóæõ¨©—Z¸pa2zôèÖÁ2ŠW˜f9$‡*MMMÍğ#Füo±Q×ÖÖ&O=õT²dÉ’äÛo¿M~úé§¬&ÿüóÏÙÌëªU«’éÓ§\'·İv[iƒßm?Hû²eË>?~|²aÃ†¤7lÙ²%IwZÇŒóš»ĞÜåêÕÆş‡´ï/6õ™3gfK¥åØ¹sgöøø¹b“OŸsŒ8ˆÄˆ=\Z{¹‰Q®x¾tô^õ{„\n³Â,‡äP%Ø‹}Ò¤IÙ(ıpÄÏÅlIƒ7‚,kì1ß[#öFğ·ß~ûÎ4a†iîBsrèÈÖØ‹Sñ<òHÛÔûáŠ)û\'Ÿ|²tŠ~˜îXİÓñ¿üñÇ÷Æ\Z{_š?~kmmíjÍ]hîB¾´±7GìGÚØ‹\r¾d¿R‡¬bsæÌù—xCıõ×¤¯7®¹Z§{f…YÉ¡§»×Øw*¾«)úâ\Z¼éù*µÇyìqº[øòË/÷Vëè]aV˜åª€æ¾8o¼q0\\_xï½÷ŒŞ«]\\y.¢;’SŞzjôèÑÍ±fTI,iüÂ¬0Ë!9TÉ9W”Ë¢‹Ñõ?şØ\'5:¢/9MîLİ²ÊÄ%eß|óÍ¤?MŸ>}m\\ú°Rş\nÓO‹kjjşVaV˜åªÄ:xIÙìqÏ<óL_×ébsÿ£nYeâZñqIÙşôñÇoI“e^¥ıQbAG{Ğ\n³Â,‡äĞ@æĞÁkÅg÷/[¶¬Oët\\è¦ğ»ÌÓ-«L|ÌöíÛûµ¹777·¤É²µ‚ÿ¨Úö ‹\\\n³Â,‡äĞ@æĞÁÉ¶÷öt¥âJv…ßc«nYeâÓİòé/ñzñéD•şGUÜƒi2…Ya–Crh s(ÖüvoşÖÕiq…×Ş£[V™xãÂ~ÀÁ€„Â\\Y!‡ÄPÌ¡<ú»Në–UfäÈ‘ú{äŞÚÚÚ\\%#÷OãÚÍW\\qÅÑ•4¥ºzõêäüóÏO\ZÛm?öØcãL£.9$i>—İÈ®?~o¯¹ÿı÷ÿUákîí\nò@¬—Îš5+ŠNöµô¾Ø»şúë³KNŞpÃ\rÉ	\'œE<ş˜ci»=nÜ¸NŸwîÜ¹eıq&Åé§ŸïY»íq\nÎµ×^›ÔÕÕ%_ıuÛö+¯¼2¹æškæ\nÈ¡\"Î‹¾à‚y?óxã7²üøä“OÚ¶Í™3\'Ûöá‡vú¼¯¼òJ–s‘/İ—¶>õÔSÙvÆg$»víÒÜËÌ!kî”mÊ”)ûûhùE‹ıG…-¿:®şTZû£0Ç(<\nhwÑYQ.wäşî»ïvZ¨ãg‹¯ÕÔÔ”œtÒIí¶İrË-mŸ1cFrá…&ëÖ­kÛvŞyç%×]wİP.Ì–CåşŸED“/½/râøão÷~_}õÕÉ¹çÛn[äÉk¯½VV¾ÆãJ›{¼~GCÍ½ër´<e{öÙgßìïóÜÓçü\n;Ï½ÃQÖ@4÷‰\'f…7¾vt;š{Áøş­·ŞÊ¶w6rŸ?ş!¯óÒK/eëèßÍüòË/O.¹ä’äí·ßNÎ>ûìdØ°aÉÖ­[“åË—gÏÛ»úwœ|òÉÙ¬Â,ÌCEÌ°”Ó„#ÿ\"Ïb&híÚµY#Û\'xb–,HÎ:ë¬lI(7oîñsñ#q;¾æÛòæ39ùëD^ÆgX\\|ñÅmùtÎ9çÄ‡J%+W®êÍ½Ûr;e{øá‡ÿúî»ïş­¯P·gÄˆ_Wã*eä¿GÆhî=¹§ÿ÷ÙóÄ4jGÓı§œrJV cZö¸ãët4–ìÒF#¿8À¥C+£¹ÇºiäIéßzö¾Å×âöØËwüº‹…Çs›vG‘/ÏDn_tÑEYcÿı÷“¥K—¶íäßÇW—Ÿí^\\¡.­ûúã\nuuuu\\¡®ÊMš4é¿ûëÚò‹-šY­×*®”‘{ŞÈ£wÖ€#bDTú:1\"‹û.»ì²NGõùiì(ÄH.f\0b[’«®º*kîyÁ.6÷İ»wg;ê¨£²ïæÊ›–ïêXxÿ#¯â½ë,¢A›{wyM;7¾æÇcäÍ=\ZE>İy\\:ÍÿØceË=±Ş¯¹wÏµå)ÛwÜqó}÷İ·¯Fï;Ó‘ã>®óæİÒ\"œß.6÷qÅwl/6Ó|[ékÄãc{4ìø\ZkjÅûcª4/ÀysF³±=^3nçë¨ÑØ‹Í=¦nó‚]:« 0\\sƒ»\Za£Èwğâ½î(Š\r¸Ü‘{ø·£ÁÇÎaÌ9uêÔ,¯&L˜L<9»?òGs/«¹÷ù§Â¥uú€O…$êëë›úúóÜc}?ö»[—4-ßıu¥Í=ÖºóÈ×ß‹Ï¿qãÆì¾5Åô{¬ŸÆ÷1ÊÊóê«¯f?>oî1ŸÿnyA/mî1½ºyóæl´àÅ\ZmX§0WFsµìÈ“f„\"âxŠÒÑ{9Ï¹OÆåìÙ³³ç¯q;¶çÍ=?#fb™ \Z{Ì8=÷ÜsÉ”)S²Ÿ{ñÅMË÷l}~i_}{:ĞÛ_µWk½æÿ“åÌ´˜·nØ°¡O\Z{SSÓÜô5¶§{Ãªõÿ¨Ò¦åãHæt§¬Û‘ûgŸ}–Î#§ø¾8ÊéùâøÅæ½»‘{ì0ÄAWùï£´üˆüx@a®¢iùîFîñŞh/wä;¡ùÑò1€ˆ3,\"ÿ^%{ŞØ)ĞÜ{V¯ÓØ‘7áø»;Ò=İQ/®³ï®æzMA]]]mZ¤niiéÕÆşİwß}”6Šoª}z§R¦å#¢ Æí˜ÖìjägBDam¥Ó/¼ğBö¸8ˆ.NkË›{¾æ£¯ä¿[œœîÅ·5÷˜b‘zş;Äè,\nDÜ£øØ#3…¹ºš{g#÷˜É)mîå¬¹—\n;§vZ‘“7Şxc–Ïq>½æ^¾šššáùÁuùşp§èãçJFì¦ã›ÚÚÚÑcÇİİ[#ø±GcOñÁjÿ¿éÏÂ#™(²hbZ=¦ÔcÔÑš{4í(–ñ}œÖté¥—¶;½ôuâÀ¸˜VÏgbM4¦rãû(Äq$s|E¸Ø¢ùÇº}iÅ¼¹¹¹íyã ªÙñÅ\nó\06÷îF×¥£ì8‹¢³õö|¶(îxÿ#\'âûÈÅ¸?¾ÆíØ^¼ŞA¬Iwô³À‡z¨İ’P¬ûÇæŞãü¨bƒ5ø¨	ñ÷WîQñqğ\\q=b0Ôk:Ù#LGñ»>øàƒ¿ÁAv;Ÿşù?ÅT|$à`ø©¤K‡ÆeŞèóÆç½æÅ:¦Ôôüè(¸;vìh7½ßÕUÊæÊË¡x¿Š§¼u•ô¾Ê¡×ë4v›s4ù¨q¡›•çSö1³W‹ò—_~99räo%WÅÛ=Xê5]¬é¤\r¢±¾¾¾9}µöä<ö´P¼—î|\Zc¦5›J¿.x4ú|Z\\a–Cbh4÷¼^O‘;ÌXi}h5ù›¢É\Z5ªeÚ´i_}ôÑGß¤{~Ûó›‰‰kÅ744üû£>º İcÜI{ƒí(K…Ya–Cr¨ÒëõÁ&¿¯\'M}0ÖkÊWFJ“fâÁkoO	Ê?-(>T ®=—(ÌW2R˜f9$‡ÔkĞÜ…Â,‡ä 0Í]È!@aV˜åĞÜ…Ya–CBsf…YÉ!@s\n³’C€Â,4w!‡\0…Ya–CBsf…Y	ÍP˜f9$‡\0Í](ÌrH\n³ĞÜ…f…Y	ÍP˜f9$4w@aV˜å4w¡0Ë!9(ÌBsrP˜fÍ]hî€Â¬0Ë!¡¹\n³Â,‡ä ¹…YÉ! Z466*ˆ•{ÒÂ¼O‰¡–C@/[±bÅö––E±bÛ¶mÿšæõrHµzÙ’%K®_¶lÙŸøá‡VÅqàF[Q”\Z\Z¾Iã&9$†Z} -H÷ö?é¼X¯ıñÿ¾¾š‹²’C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@Áÿ\"òĞÔG+ \0\0\0\0IEND®B`‚',1),
('a63745e5-2e00-11eb-8699-227918fa15ea',1,'out-factory.bpmn','a63745e4-2e00-11eb-8699-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"å¤–å‡ºå•\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"å¡«å•\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"ç”³è¯·äººç¡®è®¤\" flowable:assignee=\"${INITIATOR}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${skip==true}\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"ä¸»ç®¡å®¡æ ¸\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('a68ae426-2e00-11eb-8699-227918fa15ea',1,'out-factory.out-factory.png','a63745e4-2e00-11eb-8699-227918fa15ea','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0÷\0\0\0ä\0\0\0…@m¦\0\0~IDATxÚíİ}ˆUuŸ\0ğ*z\"\"‚ú#Ú¨Øh%\"\"ˆ6Ú\"‚ˆè‰6zs¦§Ü4³\'ª5éÅ\"{µ—­ˆ·6DÌu]5g|Í”Ş°YCV7µÌœÆm}Ì§1Ó<{¾Ïì™ë¼ÜÑy¹wæó/3÷Ü;÷Şï|¿ç÷ûsîï~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ô³$IŞ´iÓ¬5kÖüÖØØ˜,^¼Xôs444$+V¬øŸ4êäŠ9ô²(Ê+W®LZZZ’½{÷ŠŠ;v$Ë—/ß•é›äj9ô²m)ÊSœ÷¦£°õrHµzYL£*Š•iaŞ\'‡ÄPË! —Åz‚XQ…9‘Cb¨å0@…ù/ŞlúôOÉW\rgßÇ6ÅTa–Cr¨ÂÂ¼{ç¶dİ¢)É—óïo±-îSP5w9$‡€*+Ì[¿ú·CŠrß}5OAÕÜåª­0¯_út§…9îSP5w9$‡€*+Ìë?ÚiaûTÍ]É!@aš»’CÀ@æ8²¹³Â÷)¨š»’C@•æ«ş©ÓÂ÷)¨š»’C@•æ·5%ë>|äĞéÔt[Ü§ jîrHUV˜#66ãÂÛS…YÉ! \Zó/¿$?şçC§SÓmqŸ‚ª¹Ë!9TQa«‡mXõJ§ë¥qŸ+ŒiîrHÕP˜ÓÑÔöK’ÿ\\øå<â1ñX#0Í]É! Bsw#-#0…YÉ! Ê\ns9#­®F`\n¬æ.‡äPa…ùp‹r\n¬æ.‡äPa…Y(ÌrHš»ĞÜ…f¡¹9(Ì\n³š;t%I’ß755Õ¿óÎ;Ë§M›¶kÂ„	ûF\Z•><©««;p×]wí<yò¦§Ÿ~zf\Z£¹…YÉ¡S[[ûW555w§5zV\ZÓØõ:=ilNï›“~ıc<N‡¢M}öìÙ3¦NºoâÄ‰Éë¯¿¬Y³&Ù¶m[²gÏ$Ä×–––äóÏ?OÒæŸÜsÏ=î½÷Ş-cÇ£¹…YÉ¡şsë­·ş}\Z‹ÓØ{°™—KÓÇ×éxCDÚÄG?ñÄ¿ÜÿıYãŞ¿R®µk×&>øàşúúúõ7ß|óÙš»P˜åê;iƒ>3mĞ{ĞĞ;Š•ƒ©^sèhıè¹sç.¹óÎ;“yóæõ¨©—Z¸pa2zôèÖÁ2ŠW˜f9$‡*MMMÍğ#Füo±Q×ÖÖ&O=õT²dÉ’äÛo¿M~úé§¬&ÿüóÏÙÌëªU«’éÓ§\'·İv[iƒßm?Hû²eË>?~|²aÃ†¤7lÙ²%IwZÇŒóš»ĞÜåêÕÆş‡´ï/6õ™3gfK¥åØ¹sgöøø¹b“OŸsŒ8ˆÄˆ=\Z{¹‰Q®x¾tô^õ{„\n³Â,‡äP%Ø‹}Ò¤IÙ(ıpÄÏÅlIƒ7‚,kì1ß[#öFğ·ß~ûÎ4a†iîBsrèÈÖØ‹Sñ<òHÛÔûáŠ)û\'Ÿ|²tŠ~˜îXİÓñ¿üñÇ÷Æ\Z{_š?~kmmíjÍ]hîB¾´±7GìGÚØ‹\r¾d¿R‡¬bsæÌù—xCıõ×¤¯7®¹Z§{f…YÉ¡§»×Øw*¾«)úâ\Z¼éù*µÇyìqº[øòË/÷Vëè]aV˜åª€æ¾8o¼q0\\_xï½÷ŒŞ«]\\y.¢;’SŞzjôèÑÍ±fTI,iüÂ¬0Ë!9TÉ9W”Ë¢‹Ñõ?şØ\'5:¢/9MîLİ²ÊÄ%eß|óÍ¤?MŸ>}m\\ú°Rş\nÓO‹kjjşVaV˜åªÄ:xIÙìqÏ<óL_×ébsÿ£nYeâZñqIÙşôñÇoI“e^¥ıQbAG{Ğ\n³Â,‡äĞ@æĞÁkÅg÷/[¶¬Oët\\è¦ğ»ÌÓ-«L|ÌöíÛûµ¹777·¤É²µ‚ÿ¨Úö ‹\\\n³Â,‡äĞ@æĞÁÉ¶÷öt¥âJv…ßc«nYeâÓİòé/ñzñéD•şGUÜƒi2…Ya–Crh s(ÖüvoşÖÕiq…×Ş£[V™xãÂ~ÀÁ€„Â\\Y!‡ÄPÌ¡<ú»Në–UfäÈ‘ú{äŞÚÚÚ\\%#÷OãÚÍW\\qÅÑ•4¥ºzõêäüóÏO\ZÛm?öØcãL£.9$i>—İÈ®?~o¯¹ÿı÷ÿUákîí\nò@¬—Îš5+ŠNöµô¾Ø»şúë³KNŞpÃ\rÉ	\'œE<ş˜ci»=nÜ¸NŸwîÜ¹eıq&Åé§ŸïY»íq\nÎµ×^›ÔÕÕ%_ıuÛö+¯¼2¹æškæ\nÈ¡\"Î‹¾à‚y?óxã7²üøä“OÚ¶Í™3\'Ûöá‡vú¼¯¼òJ–s‘/İ—¶>õÔSÙvÆg$»víÒÜËÌ!kî”mÊ”)ûûhùE‹ıG…-¿:®şTZû£0Ç(<\nhwÑYQ.wäşî»ïvZ¨ãg‹¯ÕÔÔ”œtÒIí¶İrË-mŸ1cFrá…&ëÖ­kÛvŞyç%×]wİP.Ì–CåşŸED“/½/râøão÷~_}õÕÉ¹çÛn[äÉk¯½VV¾ÆãJ›{¼~GCÍ½ër´<e{öÙgßìïóÜÓçü\n;Ï½ÃQÖ@4÷‰\'f…7¾vt;š{Áøş­·ŞÊ¶w6rŸ?ş!¯óÒK/eëèßÍüòË/O.¹ä’äí·ßNÎ>ûìdØ°aÉÖ­[“åË—gÏÛ»úwœ|òÉÙ¬Â,ÌCEÌ°”Ó„#ÿ\"Ïb&híÚµY#Û\'xb–,HÎ:ë¬lI(7oîñsñ#q;¾æÛòæ39ùëD^ÆgX\\|ñÅmùtÎ9çÄ‡J%+W®êÍ½Ûr;e{øá‡ÿúî»ïş­¯P·gÄˆ_Wã*eä¿GÆhî=¹§ÿ÷ÙóÄ4jGÓı§œrJV cZö¸ãët4–ìÒF#¿8À¥C+£¹ÇºiäIéßzö¾Å×âöØËwüº‹…Çs›vG‘/ÏDn_tÑEYcÿı÷“¥K—¶íäßÇW—Ÿí^\\¡.­ûúã\nuuuu\\¡®ÊMš4é¿ûëÚò‹-šY­×*®”‘{ŞÈ£wÖ€#bDTú:1\"‹û.»ì²NGõùiì(ÄH.f\0b[’«®º*kîyÁ.6÷İ»wg;ê¨£²ïæÊ›–ïêXxÿ#¯â½ë,¢A›{wyM;7¾æÇcäÍ=\ZE>İy\\:ÍÿØceË=±Ş¯¹wÏµå)ÛwÜqó}÷İ·¯Fï;Ó‘ã>®óæİÒ\"œß.6÷qÅwl/6Ó|[ékÄãc{4ìø\ZkjÅûcª4/ÀysF³±=^3nçë¨ÑØ‹Í=¦nó‚]:« 0\\sƒ»\Za£Èwğâ½î(Š\r¸Ü‘{ø·£ÁÇÎaÌ9uêÔ,¯&L˜L<9»?òGs/«¹÷ù§Â¥uú€O…$êëë›úúóÜc}?ö»[—4-ßıu¥Í=ÖºóÈ×ß‹Ï¿qãÆì¾5Åô{¬ŸÆ÷1ÊÊóê«¯f?>oî1ŸÿnyA/mî1½ºyóæl´àÅ\ZmX§0WFsµìÈ“f„\"âxŠÒÑ{9Ï¹OÆåìÙ³³ç¯q;¶çÍ=?#fb™ \Z{Ì8=÷ÜsÉ”)S²Ÿ{ñÅMË÷l}~i_}{:ĞÛ_µWk½æÿ“åÌ´˜·nØ°¡O\Z{SSÓÜô5¶§{Ãªõÿ¨Ò¦åãHæt§¬Û‘ûgŸ}–Î#§ø¾8ÊéùâøÅæ½»‘{ì0ÄAWùï£´üˆüx@a®¢iùîFîñŞh/wä;¡ùÑò1€ˆ3,\"ÿ^%{ŞØ)ĞÜ{V¯ÓØ‘7áø»;Ò=İQ/®³ï®æzMA]]]mZ¤niiéÕÆşİwß}”6Šoª}z§R¦å#¢ Æí˜ÖìjägBDam¥Ó/¼ğBö¸8ˆ.NkË›{¾æ£¯ä¿[œœîÅ·5÷˜b‘zş;Äè,\nDÜ£øØ#3…¹ºš{g#÷˜É)mîå¬¹—\n;§vZ‘“7Şxc–Ïq>½æ^¾šššáùÁuùşp§èãçJFì¦ã›ÚÚÚÑcÇİİ[#ø±GcOñÁjÿ¿éÏÂ#™(²hbZ=¦ÔcÔÑš{4í(–ñ}œÖté¥—¶;½ôuâÀ¸˜VÏgbM4¦rãû(Äq$s|E¸Ø¢ùÇº}iÅ¼¹¹¹íyã ªÙñÅ\nó\06÷îF×¥£ì8‹¢³õö|¶(îxÿ#\'âûÈÅ¸?¾ÆíØ^¼ŞA¬Iwô³À‡z¨İ’P¬ûÇæŞãü¨bƒ5ø¨	ñ÷WîQñqğ\\q=b0Ôk:Ù#LGñ»>øàƒ¿ÁAv;Ÿşù?ÅT|$à`ø©¤K‡ÆeŞèóÆç½æÅ:¦Ôôüè(¸;vìh7½ßÕUÊæÊË¡x¿Š§¼u•ô¾Ê¡×ë4v›s4ù¨q¡›•çSö1³W‹ò—_~99räo%WÅÛ=Xê5]¬é¤\r¢±¾¾¾9}µöä<ö´P¼—î|\Zc¦5›J¿.x4ú|Z\\a–Cbh4÷¼^O‘;ÌXi}h5ù›¢É\Z5ªeÚ´i_}ôÑGß¤{~Ûó›‰‰kÅ744üû£>º İcÜI{ƒí(K…Ya–Cr¨ÒëõÁ&¿¯\'M}0ÖkÊWFJ“fâÁkoO	Ê?-(>T ®=—(ÌW2R˜f9$‡ÔkĞÜ…Â,‡ä 0Í]È!@aV˜åĞÜ…Ya–CBsf…YÉ!@s\n³’C€Â,4w!‡\0…Ya–CBsf…Y	ÍP˜f9$‡\0Í](ÌrH\n³ĞÜ…f…Y	ÍP˜f9$4w@aV˜å4w¡0Ë!9(ÌBsrP˜fÍ]hî€Â¬0Ë!¡¹\n³Â,‡ä ¹…YÉ! Z466*ˆ•{ÒÂ¼O‰¡–C@/[±bÅö––E±bÛ¶mÿšæõrHµzÙ’%K®_¶lÙŸøá‡VÅqàF[Q”\Z\Z¾Iã&9$†Z} -H÷ö?é¼X¯ıñÿ¾¾š‹²’C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@Áÿ\"òĞÔG+ \0\0\0\0IEND®B`‚',1),
('a83f9aa0-2d56-11eb-b88c-227918fa15ea',1,'liaison.bpmn','a83f9a9f-2d56-11eb-b88c-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"liaison\" name=\"è”ç»œå•\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"å¡«å•\" flowable:initiator=\"initiator\" flowable:formKey=\"liaison\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\" name=\"å¡«å•äººç¡®è®¤\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-8837ACC1-9927-4EF2-AB27-6113B895B400\" sourceRef=\"startEvent1\" targetRef=\"sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\"></sequenceFlow>\n    <userTask id=\"sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\" name=\"å®¡æ ¸ä¸­\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-7BA30D19-708A-4A69-A05E-3B5FC38E05C5\" sourceRef=\"sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\" targetRef=\"sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\"></sequenceFlow>\n    <endEvent id=\"sid-7387C76A-E91A-40AA-A84A-11C8155AD7C0\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-0255207B-6BE7-449E-8B53-6D87AF68964A\" sourceRef=\"sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\" targetRef=\"sid-7387C76A-E91A-40AA-A84A-11C8155AD7C0\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_liaison\">\n    <bpmndi:BPMNPlane bpmnElement=\"liaison\" id=\"BPMNPlane_liaison\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\" id=\"BPMNShape_sid-BB836425-7C40-48DC-A59E-2AD704CA7DF1\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\" id=\"BPMNShape_sid-B77C750E-DE59-438E-B87C-E2ACA53B76E1\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-7387C76A-E91A-40AA-A84A-11C8155AD7C0\" id=\"BPMNShape_sid-7387C76A-E91A-40AA-A84A-11C8155AD7C0\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7BA30D19-708A-4A69-A05E-3B5FC38E05C5\" id=\"BPMNEdge_sid-7BA30D19-708A-4A69-A05E-3B5FC38E05C5\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8837ACC1-9927-4EF2-AB27-6113B895B400\" id=\"BPMNEdge_sid-8837ACC1-9927-4EF2-AB27-6113B895B400\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-0255207B-6BE7-449E-8B53-6D87AF68964A\" id=\"BPMNEdge_sid-0255207B-6BE7-449E-8B53-6D87AF68964A\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('a866aaa1-2d56-11eb-b88c-227918fa15ea',1,'liaison.liaison.png','a83f9a9f-2d56-11eb-b88c-227918fa15ea','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0÷\0\0\0ä\0\0\0…@m¦\0\0IDATxÚíİ}ˆVõ\0ğİˆˆ şˆ6*6Z‰ˆ¢¶ˆ \"ºÑF/cÎ”2‰–›ffTkbe‘½ÚËÆVD·¤­\rs]WÍ_³+½a³†¬nj™9ÛzÍÛ˜i=ßƒgö8ÎŒã8óÌsf>ø2ó<ç™}¾óış~¿óö»ß\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0–$ÉÑ6l˜¹jÕªß\Z“E‹‰\nGCCC²|ùòÿI£N‰Á˜C@/‹¢¼bÅŠ¤¥¥%Ù½{·è§Ø¶m[²lÙ²i‘¾I‰Á–C@/‹Ù–¢\\5Åyw:[+‡Ä`Ë! —Å2ª¢X=‘æ=rH¶zYì¯S«ª0\'rH¶ú©0ÿåÏ[“\rŸş1ùªá±,âóxN1U˜åJX˜wnß’¬Y89ùrŞıD<ÛTÍ]É! d…yóWÿvPQÎã»¯æ*¨š»’C@Ù\nóÚ%OuZ˜c›‚ª¹Ë!9”¬0¯YôH§…9¶)¨š»’C€Â,4w9$‡€ş,Ìqdsg…9¶)¨š»’C@É\nóú•ÿÔiam\nªæ.‡äP²Âüã–¦dÍ‡S^NMŸ‹m\nªæ.‡äP²Â±ñ³æxN1U˜åÊX˜ù%Yÿñ?¼œš>ÛTÍ]É! D…9®¶nåËî/m®0¦¹Ë!9”¡0§³©­ë\'ÿ¹à;-ÊyÄkâµf`š»’C@•æCÍ´ÌÀf9$‡€’æîÌ´ºš)°š»’C@•æå<XÍ]É! Ê\n³P˜å4w¡¹9(ÌBsrP˜f9$4wèJ’$¿ojj\ZıöÛo/›6mÚqãÆí1bD2tèĞ¤®®nß]wİµ{Ò¤Izê©wÒøÍ](ÌrHõŸÚÚÚ¿ª©©¹;­Ñ3ÓXŸÆÎ¨×iìJccºmvúqb¼N‡¤M}Ö¬Y3¦NºgüøñÉk¯½–¬Zµ*Ù²eK²k×®$ÄÇ–––äóÏ?OÒæŸÜsÏ=ûî½÷ŞM£F\Z©¹…YÉ¡Ê¹õÖ[ÿ>EiìŞßÌ»KÒ××éxƒDÚÄëüñ_î¿ÿş¬qïİ»7é®Õ«W\'>øàŞÑ£G¯½ùæ›ÏÖÜ…Â,‡äPßIô™iƒ^p\r½£X1ê5ÏÖ3gÎâ;ï¼3™;wîa5õö,XÔ××·”Y¼Â¬0Ë!9Tmjjj†6ì‹º¶¶6yòÉ\'“Å‹\'ß~ûmòÓO?e5ùçŸÎV^W®\\™LŸ>=¹í¶ÛÚ7øfñ´±/]ºô“±cÇ&ëÖ­KzÃ¦M›’t Ğ:räÈĞÜ…æ.‡äP¯6ö?¤Íxo±©¿óÎ;Ù®ÒîØ¾}{öúøºb“O¿çHq\0‰{4öî&FwÅ÷Kgï¥*Ì\n³’CÕ4c/6ö	&d³ôˆ¯‹]°í\Z¼ü@ÙÇKñ½5cïhûí·oOfˆæ.4w!‡l{q)~Ê”)mKï=KöO<ñDû%ú!ºc¹—ãÿØcí}ì}iŞ¼y­µµµÒÜ…æ.äPÏ¥½¡8c?ÒÆ^lğífğ+tÈ›={ö¿Äúë¯¿&}mÌ˜1Íe]îQ˜f9$‡ú[œîVÜÇŞÓ¥ø®–è‹ûà-Ï—xÖç±Çén•ğå—_î.ëì]aV˜åª‚æ¾(o¼q0\\_xï½÷ÌŞË.®<ÑÉ)o‡«¾¾¾9öUÓK\Z§0+ÌrHUsÅåòƒèbvıã?öI£èÛ&w¦nY2qIÙ7Şx#©¤éÓ§¯KVËÿAaùiQMMÍß*Ì\n³’CÕ˜Cû/)›½îé§Ÿîë:]lîuË’‰kÅÇ%e+éã?Ş”&ËÜjû£*ÄüFĞ\n³Â,‡äPæĞşkÅgÛ—.]Ú§u:.tSø]æê–%7ÙºukE›{sssKš,›«øªm]üãR˜f9$‡ú3‡öß&{¾·¤k/®dWø=6ë–%wwËoS)ñóâîDÕşGUAÇ2™Â¬0Ë!9ÔŸ9”Fkş¸·Nëê´¸ÂÏŞ¥[–L¼qıáopĞ/¡0WWÈ!1s(J×iİ²d†¾¯Ò3÷ÖÖÖæ’ÌÜ?k7_qÅGWbIõ–[nI®¿şú«««K®¹æ\Z…¸¼³®ŠæØ9T¸/»™;];vìîJïsÿşûïÿ«Ê÷¹P+µ¿4oî3gÎŒ‚ÓaÄkò×¿şúëÉ¥—^šìÜ¹3{§ÅœwŞyÉ´iÓ:ıù÷3gN·~§8“âôÓO÷ì€çãg]{íµÙàãë¯¿n{şÊ+¯¬Ø`¤Ês¿äPOãå—_NN8á„ìıîh{\\šúÔSO=è¹3Î8#Ù±cÇ!ó->jîGCö¹Óm“\'O^_é£å.\\øUz´üŸâêOír¥›{¬¤DÃ6lXrõÕW·=ÑtşúeË–e…3/È\'NÌÇe„;ûï¾ûnöš?üğ mõõõ$ššš’“N:©ÓÁÅŒ3’/¼0Y³fMÛs1¸¸îºësaî×ên¼úê« ‹¯kßÜ=öØ_;Í½osÈÑòtÛ3Ï<óF¥ÏsŸ2eÊ¼*;Ï½ÃYV%s4õ¼HÆç1‹:æ˜c²B\ZŸÇ¶ùóçwY`óˆíıœ_|1ÛŞÑ¿%šùå—_\\rÉ%É[o½•œ}öÙÉ!C’Í›7g‰øâù®ş\'Ÿ|òA»Iaî÷êIsollÌ\"nãcş\\ŞÜc%&Ï«ÈË<^|ñÅmùpÎ9çÄM¡’+Vt¹êTŒjiöeË!ç¹Óm?üğ_ß}÷İ¿Uğ\nu»ÒÙè×e¼âQ_æhÚ]tQrÁdŸGÍgMy±-6÷ô}Ë–×}ôÑlÛäÉ“³ÇãÇï´¹ÇJ@¼6–aÛo‹ƒSN9%+ğŸ|òIrÜqÇu:›Ë~ûF~üñÇ\'çŸ¾K‡Vys(6í\"ß½¹¹9ùşûï\'K–,iäŸÇÇâL=r3ò$füñ8>Æãx^sï¹¸B]Z;÷Tâ\nuuuuû\\¡®ä&L˜ğß•º¶üÂ…ß)ëµŠ+y@]Òˆ˜	GÄç½1s¥ÕØ~Ùe—u:«Ï—Xc™ş†nˆ»ùeÏE!¹êª«²\"übsİñº£:ªí8\0…¹º›{7ïk4íxïâc~<EŞÜ£ĞÇ -¶ÇÀñÜsÏ= ×bp¹Ç€´?¦£ı²|<¯¹×–§Ûî¸ã›ï»ï¾=˜½oOg_¸+\\÷šû¡fî/¼ğBVˆgÏ}@a~å•W:lîo¾ùföºhØñ1ö©·ÇRk^Àóæ:ß%ß3ç¿Wü®Åæ¿[^ğãg)Ìcæ÷\nÇÑàcp\rzêÔ©Y^Œ7.™4iR[njîiî}~W¸´NïsW¸bôèÑM}}?÷Ø¿£ÀCí—ìÍ=\n_oÏÜ×¯_Ÿ}Ÿ˜uÅòûYg•}ƒü51(ˆ¯|ŞÜc?Xä\r¡}såÙ7f³½8\0/öÛÇu\nsõ7÷8ø1VYfÍš•½Çñ1ÇóysÏÃˆUŸ8 3\Z{ì²yöÙg³]Añu1Ğ,6sûÜû|ÿü’¾ºŸ{:ÑÛ[œµ—µ^óÿÉrfZÌ[×­[×\'½©©iNú3¶¦£À!eı?ªDs?ñÄÛ¨ëjæ±˜u´Ï=¢xÄügŸ}–Î3¯ø¼8ËåùâinÅæıP3÷0Äïœ³×Ä,/?\"ÿP˜ÀÌ=Vaò£å#¯â‰ÈŸı6Ér\"ö¹W¶^§±-oÂñww¤\r>\Z{:P/îgßYæzMA]]]mZ¤niiéÕÆşİwß}”6ŠoÊ¾¼Ó—…9fCÑ$c–¤uVpcf·;³£x]œ	M9ùÀ çŸ>{]D§µåÍ=ÿÚ˜½Å¬ XÄùÌé(¾­¹Çmü>±4Ûcv—Ÿª³ø|À¡0—{Ÿ{ûSábğvÚi§e9uã7f\r>v9®rjjj†æ×å3ø.ÑÇ×µ›±[hjkkëG\Zµ³·fğ1cÆ&âƒeÿ¿éËÂû¹óÙOœ¯§¡EÑŒ£c¶lÑôÇŒ“=Å2µG}ŸÅçãu«W¯Î.tS<½ñ3ãÀ¸XVÏ—ûcæ§5ÅçQÈãûÄçñûu4ÿØo§ÊE3hnnnû¾qVÌì¿øâ…¹J›{¼ñæ+Añç+>ñ|ñz1ãÖ¤õl÷ĞC°K\'Vb`ĞQ~Å÷Ís[sïõüˆbƒ}ğq]üıu÷¨ø8x®¸=b Ôk:¦³ø|ğÁ_à »íÏ=÷Üc)>p ü¿¦K‡Fá‚½mÛ¶–÷;ºøÂ,‡\\~¶ëu\ZÛ‹Í9š|œº‰Yy¾d+kqå¹”¿ôÒKÉğáÃkwU¼¥^ÓÅ>t4×8zôèætöÕz8ç±§\rà½tpğiŒ1öÙ(Ì\n³’CÕZ¯‹§Èõ0VØÇ>¸šüMÑäGŒÑ2mÚ´¯>úè£oÒ‘ßÖüf3q˜¸V|CCÃ¿?òÈ#óÓã†H’ı\r´£,f…YÉ¡j¯×û›üÃiê±^ÓMqe¤4iÆï¿¶ñÆ¸KP~· ¸©@\\{8.Q8¯d¤0+ÌrH©× ¹…YÉ!@aš»C€Â¬0Ë!¡¹\n³Â,‡„æ(Ì\n³’C€æ.f9$‡\0…YhîB\n³Â,‡„æ(Ì\n³š; 0+ÌrHš»P˜åf¡¹9(Ì\n³š; 0+ÌrHhî€Â¬0Ë!9hîBa–CrP˜…æ.ä 0+Ìš»ĞÜ…Ya–CBsf…YÉ!@s\n³’C@Y466*ˆÕ»ÒÂ¼G‰Á–C@/[¾|ùÖ––E±\nbË–-ÿšæµrH¶zÙâÅ‹¯_ºtéŸøá‡VÅ±ÿf[Q”\Z\Z¾Iã&9$[} -HGûŸÆr^ì¯ø_[æ¢,‡ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Pğ´ÙjÍÀê¡H\0\0\0\0IEND®B`‚',1),
('be835939-2d29-11eb-b92b-227918fa15ea',1,'send-email.bpmn','be835938-2d29-11eb-b92b-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"send-email\" name=\"å‘é€é‚®ä»¶\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"start\" flowable:initiator=\"initiator\" flowable:formFieldValidation=\"true\"></startEvent>\n    <sequenceFlow id=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" sourceRef=\"startEvent1\" targetRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\"></sequenceFlow>\n    <endEvent id=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" name=\"end\"></endEvent>\n    <sequenceFlow id=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" sourceRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" targetRef=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\"></sequenceFlow>\n    <serviceTask id=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" name=\"SendEmail\" flowable:type=\"mail\">\n      <extensionElements>\n        <flowable:field name=\"to\">\n          <flowable:expression><![CDATA[${emailTo}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"from\">\n          <flowable:expression><![CDATA[${emailFrom}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"subject\">\n          <flowable:expression><![CDATA[${emailSubject}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"cc\">\n          <flowable:expression><![CDATA[${emailCC}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"text\">\n          <flowable:expression><![CDATA[${emailContent}]]></flowable:expression>\n        </flowable:field>\n      </extensionElements>\n    </serviceTask>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_send-email\">\n    <bpmndi:BPMNPlane bpmnElement=\"send-email\" id=\"BPMNPlane_send-email\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" id=\"BPMNShape_sid-E4D02A62-9237-4DB5-88D6-388754AE1687\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" id=\"BPMNShape_sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"165.0\" y=\"135.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" id=\"BPMNEdge_sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\">\n        <omgdi:waypoint x=\"129.94340692927761\" y=\"177.55019845363262\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"164.99999999999906\" y=\"176.4985\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" id=\"BPMNEdge_sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\">\n        <omgdi:waypoint x=\"264.9499999999882\" y=\"175.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"292.5\" y=\"175.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"292.5\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('beebb7fa-2d29-11eb-b92b-227918fa15ea',1,'send-email.send-email.png','be835938-2d29-11eb-b92b-227918fa15ea','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0f\0\0\0á\0\0\0ûäÂ\0\0\r\0IDATxÚíİ}lUep5j×u£ã&®Ñd7Yş0Ædb²NFcæ?ãÇD¬¶E«¬ \"Ì2Aã{D‹ñŸÕÄ¸ºa_â\"a‚•ŠÃ(:ĞqGGD^¤)T3Ïïlo÷z-x‹=··íç“ür_zú‚ó½Ïıç9÷¨£\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Š—eÙ16lxaõêÕß,_¾<[¶l™ªqµ¶¶f+W®ü,U³=8*B¹½½=ëêêÊzzzÔÕöíÛ³×^{mg\né+í•0ÊÅHY(×M8÷¤ôz{%ŒrÑ¾ŠõS)˜÷Û+a”‹§@¬«`Îì• ˜«m_|•M›·6¯¸/H3Pã`Ş·¯\'û|Wwßã•ë;û‚9î—ïúrOöåînÁ*˜\"ƒ9Byîª²_¿Ğ‘½ò‡O²¶?mËîøßwû‚9îÇó‹~¿%›™¶ù÷%Îv~%œ3PX0¶sOöoÏwôñ÷Õôg×e›?Û%\\3Pd+ãåµ[«æç÷±`Ì@ÑÁí‹RğÎxn]ö?olÌ>ìü2¯¸Ï•¾¾xİVÁ*˜¢‚9f\\ÄÉ½òrqåvñ\\yÏ9¾Çl\rÁÌıµ*b”\\¹]<×ß¶V0‚Y0ZZ‚¨a0ÿÿÉ¿ÎªOşÅ¶‚U0ó’ê§Ëıæ÷[«`ŠæX`«şª\ræ_=¿._š-\\3PP0ïéŞ—ıÇŠòvÅü5›²WÿÔù%Ù1Ï9–eG€?µòÃlï¾}ÂU0E¶2\"œ;w|õ½1úbW·PÌ@-‚Ùe?3PçÁ¬3 ˜3 ˜•`³Ì€`Ì€`V‚Ì‚F¬,Ëïèèhyæ™g^›={öÎ©S§îŸ0aBvõÕWgÍÍÍo¼ñÆY³fmxğÁç¦úgÁ¬ó‘kjjú‡†††›ÒñõBªRíc-ÕŞT¥¯ÍO·Óc;é4JùÅ_ü¯{ï½wÿ-·Ü’=ñÄÙêÕ«³­[·f{÷îÍBÜvuueo¿ıv–‚;»ùæ›Şzë­¯¿şúI‚Y	æê]sÍ5¿Lµ,UOoWS¯¦í›¥Õ(‘xâ}÷İ·oÆŒyè8p «ÖÚµk³™3ghiiY?vìØÌJ0Z\n×³S¸.@÷WíÃáXãÈGÉÇ,X°`Å\r7Ü-\\¸p@\\iÉ’%ÙÄ‰»ë}ô,˜óPihh¸º±±ñ‹òmjjÊxàlÅŠÙ¦M›²]»våÇÓ={òw««V­ÊæÌ™“7®2œw=ĞPnkk{sÊ”)Ùûï¿Ÿ\r†7f)ä»\'Mšô¯‚Y	æo…ò/R(ä¹sçæ­ÁjìØ±#ß>¾¯< ÓÏœ$ÍF)G(W»cT+~^\Z5×í«¹`ÌC1R.åiÓ¦å£ã#ß-ÇŠp6r)=åh_ÖH¹¿‘óµ×^»#í0c³\ZÍÁ=åòöÅwŞÙ×®8RÑæ¸ÿşû+Û\Zc$ÛğnaÏ=÷ôDO¹H‹-êNo»~+˜ÕhæÊ­å#å\ZÊåá\\1rn—nÃØüùóÿ;ş‡~ıõ×YÑ&OÜYoo³³`®•˜WŞS>ÒöÅáÚ\Zå=g-a<ZyÊ1%®Ö­[×S‹QóØ±cÿ>í˜·§Û	fÁ\\GÁ¼¬šqâ®óæÍ3jîbE_œğû!ÓâjâÄ‰Ñg+º;fCCÃT3Óqª`ÌEnªŸn›X©W:á£ÚÏ?ÿ¼ã+fkTL¥;[Ò\r3±ÌúÉ\'ŸÌjiÎœ9kcIiÁ#æUÌñŒå¬§>G0æ¥ÖÁ²´ıKÛô.³Î·{è¡‡Š>ÆÊ÷ıé’n˜‰k_Ä2ëZzã76¦ea­–ÊJÏ¼ò€ÌõU?pÜ€« }mqåº÷Úù×ÛÚÚ\n=ÆbJÙß²PÒ\r3qA¢mÛ¶Õ4˜;;;»ÒÎ²y¨‚¹üà‰Ñ`½#æƒ¹o]\nèŞåÏöI¿J±B°ìïØ,é†™¸J\\é‚Dµ¿/Z—\\rÉqMMM3nÜ¸§ÇgÆZÿÉ666ş$=şiÚ¡_g²{\'äOÏ_Ÿjjz<#Nî¥º··EñXº}\"móLº}¶÷\n\\ßÌÑïÛ?œƒù¸ã‹`©Éï:÷Üs³óÎ;/¿_äïIÁ\\>HÕ]z<XSä7u®¼\'é†ao¬Ö<XÚaö¥Ú™êÓT›zGHµ&ÕªTËS½Ü²Ï¦z:Â7B8ğC½¡á<==¡¾vmºm(Ÿ–ÔOı%m7%½ü]¼8Ì›7oeéÙé§Ÿ{ì±y˜yæ™…sÜ¯¬ÁúwLš4)¯‘ÌCQµ0Øí\Zjhüøñk=bîîîî¬Å«xúÛËwÎ˜¡×Hï¯åÉ¿óÏ??²;î¸#{ê©§úª¨`>çœs²Ç¼¯Šø7”`®AÀ¿×Ä¸øâ‹)»®²3‡7eÊ”Z÷˜?ùä“?×¨ÇüQÙŒŒ»R ÿmÛÌ¥ğ<ë¬³²ÆÆÆlÍš5ùóqğÄu®O:é¤|›‹.º({ï½÷¾5ò}ôÑG³“O>9;õÔS³ç{.Û²eK¾]Œ¼¯¸âŠü¶2˜Ó»€~ƒôÒK/íûØfÁ‚Ùgœ‘xâ‰ÙÓO?İ·í\\pÂ	ùßí‹öööoıM‚¹ª`îä²mô˜©N\ZÅ}PëYK—.}¹F³2Ö§ƒcÎáæ0×\"˜§Nú­ÖÂÑG/.(=£Úİ¸_ŞÃš<yr6kÖ¬ü~„hsss~?Z\nÓ§OÿN»âP­ŒòŸw÷İw÷İë4Äıh³”~ÆâÅ‹óŠ°¯3F0WÌ¿6Zy ›•Á€=üğÃOÖzs\nƒEµ˜[y¨r­ƒ9*‚øÂ/ì·è1ÇHµ2D#´ËC0ÚLQ¥¯•Fß1Ú.=ß_0W¶LÊ^éqùıÒïÿ1JÇ1’ïïoÌıówFÈ•Ìc¦j·ß~û?ŞtÓMßÔpåßŞôvşÃzZTt0Gû¡tÿÍ7ßÌC-¶²±l÷îİ}U‚åKß¡\Zá|¨íúkeTn×ß×bT÷ß}÷İüwD(Wºó‘‰•1¨+ÿâ³8­üæ¦M›ö—Z]+céÒ¥sëmı~ÑÁ|Úi§åm‡½¶´´ä¡vÙe—å÷cÊbô{£¤QÑ_ÛôbšÏô8Ôv•\'ÿª\ræÒ(>ŞE•Z‚yğ¸VU»îºëÆŞvÛmûk0jŞ‘FËïŒ¶«Ë]uÕUy[ FŸ§œrJÎùHúòË/ÏGÁqB®Ô_>\\0wttä=ßØ>fy´Çü}Á/ñ7ÆÉÆùóçæÁæÂ¯.—±ƒ®.7B¤°è(úzÌÑÏWğÃõáFb0+Á\\Ñ~µ¨ë1§ÖòÑr½k|g9;>8µ¨O0I#½éwló	&J0çW>Ü^À\'˜ô	&#PsssS\Z9ïìÏüKoÙ_Oo¯>ö™J0ÿŸ¸Ä@éDà`|æ_ÅHYc¤ijjšœ:X#ç)G(Ç5‘ëõß,˜óœ\'”‡séS²cVEµ³/âD_yO¹w…ëLI6B_ÍÓèyçK/½ôÕ8!¸ã‘GùÏh_ÄXÏÿ^Á,˜‡òX‹K”ktÌsE(1\Z.µ9¢]+úbñÈc=–?ş›ŠÕ†»ëıXcú`é•xyKKKç;ï¼Ó=yÊ¯¼òÊ¼ìoÅÉ‡áĞçÌ‚y¨µòitGXízÊ£k§¹2zÂ„	]³gÏşãë¯¿şqzÕŞVºğQ\\(®}ÑÚÚú›»îºkqzµß;I¼r—3Â‚Y0×Ë±ÖĞûÈÃéXcğ{Ïñye·ô®÷ÿ¨÷Â@¥mõø±ôs8®2Ì‚Ù±‚Y	f@0f@0+ÁfÁf%˜Á,˜Á¬3 ˜³½³@Ì€`V‚Ì‚ÌJ0‚Y0‚Y	f@0f@0+ÁfÁf(˜º±|ùrX?µ7ó~{%Œr+W®ÜÖÕÕ%ë ¶nİúl\næõöJåV¬Xqy[[Û—Ÿ~úi·pº‘r„rkkëÇ©®´WG¥0øE\Z©½o££Ç©j^ñß}½P\0\0\0\0\0\0\0\0\0\0\0€!ğW[Á 7%\0\0\0\0IEND®B`‚',1),
('ce86aff4-2d57-11eb-b88c-227918fa15ea',1,'vendor-code-request-form.bpmn','ce86aff3-2d57-11eb-b88c-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"vendor-code-request-form\" name=\"FIå» å•†ä»£ç¢¼ç”³è«‹å–®\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" flowable:initiator=\"initiator\" flowable:formKey=\"vendor-code-request-form\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\" flowable:formFieldValidation=\"true\"></userTask>\n    <sequenceFlow id=\"sid-E3CDDACB-2B12-4398-966D-C78588092BD6\" sourceRef=\"startEvent1\" targetRef=\"sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\"></sequenceFlow>\n    <endEvent id=\"sid-860C90D4-77B6-4336-A684-FBD28C95B009\"></endEvent>\n    <sequenceFlow id=\"sid-61149916-1C68-428E-987A-8C94F5454F96\" sourceRef=\"sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\" targetRef=\"sid-860C90D4-77B6-4336-A684-FBD28C95B009\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_vendor-code-request-form\">\n    <bpmndi:BPMNPlane bpmnElement=\"vendor-code-request-form\" id=\"BPMNPlane_vendor-code-request-form\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\" id=\"BPMNShape_sid-BC344DB7-47CA-4885-B01D-746CE6AA1B47\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-860C90D4-77B6-4336-A684-FBD28C95B009\" id=\"BPMNShape_sid-860C90D4-77B6-4336-A684-FBD28C95B009\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-61149916-1C68-428E-987A-8C94F5454F96\" id=\"BPMNEdge_sid-61149916-1C68-428E-987A-8C94F5454F96\">\n        <omgdi:waypoint x=\"274.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-E3CDDACB-2B12-4398-966D-C78588092BD6\" id=\"BPMNEdge_sid-E3CDDACB-2B12-4398-966D-C78588092BD6\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('ceaa3d85-2d57-11eb-b88c-227918fa15ea',1,'vendor-code-request-form.vendor-code-request-form.png','ce86aff3-2d57-11eb-b88c-227918fa15ea','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0f\0\0\0ä\0\0\0«)q\0\0	nIDATxÚíİ[kUéÀa/¼˜Ñ¡…ÎGèE/ü\0í…5Ñ„(F­gGªD<à	œB„ÁÁbaµÖ1ãq¤VÑT‘jë9&ÆÚŒ:&Æ¨«ï›º§Ûh2ÛdïåŞ;Ïf&‰ãà¬õË›w¯µö¸q\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Œ@’$ãoÜ¸ñõÙ³g_577\'&åijjJNœ8ñï0UH`\\ŒòÉ“\'“®®®¤¯¯Ï|¤yøğarüøñÇ!Ò“•0ÆÅ•²(MœûÂ\núª£Æ¸¸}!ŠÅ3!ÌıJãâ§ U˜G%sNÁøş»äÆ¹/“+Mk&ş}ü˜˜\n3ğÂü´»=¹Ü°:¹txù[??\'¨Â¤æ»WşôN”3sïÊ!Af í0_=¶yÈ0ÇÏ	ª0)‡ùrãš!Ã?\'¨Â³0c;Ìñ*Œ¡Â?\'¨Â¤æë§7d˜ãçU˜”Ãü¨½-¹|´şİmŒğ±ø9Af å0Ç¹ù·¯Ş	sü˜˜\n3ğ1ÂüüyrıÌïßİÆ‹ŸTaRs¼³ïÚé/†ÜcŸs÷Ÿ0i„9¬„;®·$?òÛ!£œ™ø5ñk­…(P˜l•lõ,Ì@ÊaÎe•<ÜêY`…Ès˜G\ZåÌ¬0y³f@˜0Â,Ì€0a†á%IòI[[[İîİ»oÚ´éñÂ…ûkjj’)S¦$UUU¯çÎÛ·råÊ›7oŞæçÂl„yä*++RQQ1?œ__‡¹æi<×Âô†¹>·?üõóøuê4Fƒ¼oß¾¯Ö­[×¿xñâdçÎÉÙ³g“ööö¤··7‰â_»ºº’óçÏ\'!ÜÉ¢E‹^/Y²äÖìÙ³g	³æÜM:õ×a\ZÃô½	q.s,|}•Z!Àµë×¯¾|ùòè¾|ù2ÉÕÅ‹“+V¼¬««»:yòäŸ	³æ¡…¸Nq=ò1~ßœ,§swWÉã<Ø2gÎœäĞ¡CäÁ9’ÔÖÖö”ËêY˜…9ß***¦L›6í?Ù‘­¬¬L6nÜ˜´´´$wîÜI<y2p>={ölà§ÕÓ§O\'Û·oO¦OŸ>8ÎO­Ë4Ê­­­]°`AríÚµ$nİº•„È÷Ìš5ë7Âl„ù­(Bú2;È{öìØ\ZÌEww÷À×Ç_—èğïœ¥fe$®”c”s=0rÿ}aÕ\\òßÍ…Y˜ó¹RÎòÒ¥KVÇ#]Ürg+çrÙSÛùZ)¿oå<cÆŒîpÀ|*Ìf,‡9î)go_Ô××ÿ°]1Rq›cÃ†\rƒ·5>U¶ÒŞÂødíÚµ}qO¹>Ü~ìúV˜ÍXsˆrSöJy´QÎó •óIu+aû÷ïÿCüúâÅ‹¤ĞæÍ›×Yª?f	³0V¼$.{Oy¤ÛÃmkdï9ÛÒ(áÕr¼N9^—†K—.õ•êªY˜…9anÌD3¾pW{÷îµj.uñ¾ø‚ßh.‹ûPµµµqŸ­˜N–0¿fa.ä1ïÔË¼àWµ=*Èù¯Öt)İ¥+1ñ6ë]»v%iÚ¾}ûÅxKi½“ù±¯±¢¢âÂ,Ì…8†ŞÜf=ğu[¶l)ô9–æÏ•®ÄÄg_ÄÛ¬ÓtæÌ™[á`9Tl\'UÖ|ó¾Õ0óh¡7Ï¾ø|kkkAÏ±xJÖË!¥+1ñD©†¹³³³+,w‹ø¤úaõ“}r	³0æzó@¢çûE¿Áâ‚Yÿw•®ÄÄ§ÄeH”–øûÅ\'eûI•½ú‰?\n³0æ\nÓ“ùç|]\"7Ü¥sY¿w¯Ò•˜ø?îcå[>ÊsqM)C™IûSºS]]ı:ísOOOg‰¬˜ÏÅçLœ8q¼­+æÑCYÏU¶bfx,èK{ùşıûÿ(ò=æ·‚lY˜óqÙc&g«W¯¾öU\r\r\r)Ò«2¾wf\r²0s>!We³­[·îJû:æúúúÃEvó{WÈÂ,Ìù<†\\ÇLÎV­ZõÓùóç¿JñÎ¿ŞiÓ¦ı«ïFfaxç_8îûÓ¸ó/¾§;ÿJÜÒ¥Kÿ™Ö³2\Z\Z\Zö”êıûÂ,Ì£åYälæÌ™“—-[ÖŸÂª¹;¬–/xºœñt¹Â=].œc¯=]®LÔÕÕµúyÌq?;~ÿ±½\\a6eş üc…zsX`½Ì^-—ê¹Æÿ–	ñSõ&mmmÃïÑáLŒ0O™æaŞÁäµw0)CUUU•aåü,ßïùwïŞ½SáÇ«ÛŞóÏóÿÄ÷üË¼˜÷ü´R¶…Qn*++kã§ækåWÊ1Êá@\\Qê6Â,Ìy^9×dÇ9ó.ÙñªŠ\\¯¾ˆ/ôeï)Ç)‡s!¾›‡Õóã|?Š»·mÛöeÜ¾ˆ`9ü¹³0â\\ÓÖèxs¼	%®†3Ûq»\"ŞÑoÙ±cGR]]ıjĞİ†OËå\\c˜}°ğ¸¹®®®óÂ…=ròÑ£G÷†°Ÿ‹/>”Ó>—0s¡ÎµìËèF8\'í)­@OŠ®©©éÚ´iÓ•S§Nİßµ;2>Š$ŠÏ¾hjjúóš5k¾	ßíoÄƒ$~ç.·W„…Y˜}®½	tÿ‡¹Ï5rß{ïW¶øÍış7ã«2O®ŠI‰÷ãÇ[?Ëù.#afç\Z³ƒa„Y˜a6Â³0Âl„fa„Ù3 ÌF˜af@˜0Â,Ì€0a„Y˜a6Â³0Âl„f#Ì€03 ÌF˜af@˜0£ÖÜÜ,ˆÅ3½!ÌıJãNœ8ÑÑÕÕ%ŠE0ííía¾ê¨„1®¥¥åW­­­ß=xğ G?ŞJ9F¹©©év˜IJ`\\ˆÁga¥v.ş÷8MêÿÜ¯Š2\0\0\0\0\0\0\0\0\0\0\0\0äÑ¾W#Üy€^\0\0\0\0IEND®B`‚',1),
('d507c503-2d28-11eb-9045-227918fa15ea',1,'send-email.bpmn','d507c502-2d28-11eb-9045-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"send-email\" name=\"å‘é€é‚®ä»¶\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"start\" flowable:initiator=\"initiator\" flowable:formFieldValidation=\"true\"></startEvent>\n    <sequenceFlow id=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" sourceRef=\"startEvent1\" targetRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\"></sequenceFlow>\n    <endEvent id=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" name=\"end\"></endEvent>\n    <sequenceFlow id=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" sourceRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" targetRef=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\"></sequenceFlow>\n    <serviceTask id=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" name=\"SendEmail\" flowable:type=\"mail\">\n      <extensionElements>\n        <flowable:field name=\"to\">\n          <flowable:expression><![CDATA[${emailTo}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"from\">\n          <flowable:expression><![CDATA[${emailFrom}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"subject\">\n          <flowable:expression><![CDATA[${emailSubject}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"cc\">\n          <flowable:expression><![CDATA[${emailCC}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"text\">\n          <flowable:expression><![CDATA[${emailContent}]]></flowable:expression>\n        </flowable:field>\n      </extensionElements>\n    </serviceTask>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_send-email\">\n    <bpmndi:BPMNPlane bpmnElement=\"send-email\" id=\"BPMNPlane_send-email\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" id=\"BPMNShape_sid-E4D02A62-9237-4DB5-88D6-388754AE1687\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" id=\"BPMNShape_sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" id=\"BPMNEdge_sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" id=\"BPMNEdge_sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\">\n        <omgdi:waypoint x=\"274.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('d555e504-2d28-11eb-9045-227918fa15ea',1,'send-email.send-email.png','d507c502-2d28-11eb-9045-227918fa15ea','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0f\0\0\0ä\0\0\0«)q\0\0IDATxÚíİmlUõp5jŒ1&\Z_8£É–ŒÆøÆd&ÓøÖ¨a&j‘¢$¢74øQã0¾™&†éÂ†hD@\n\nÈ|„‰Q@jy.TÿÎïŒ[/—.´÷ÚÛ~>É/=½=í-åœïıßß9ÿsN:	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€R:eİºu¯®\\¹òÇE‹¥…ª*WCCCZºtéwY\r±E\'E(755¥ÖÖÖÔŞŞ®~¦Ú²eKZ²dÉ,¤o´UB?#e¡ÜkÂ¹=A¯µUB?í¡Ø{*æı¶Jèç¢Ç){U0\'[%æ²Ccó÷»Óø«òŠeA*˜*ó¾}íiëÎ¶Ï—®méæX.<Şº}OÚ¾«M°\nf ’Á¡<}ù—éO¯6§·şıMjüxszàŸk:‚9–ãñ¹mL³uş<ÿÓ´c·pÌ@Å‚ù»{Ò_iîâcÕ„—W§\rßí®‚¨d+ãÍU›ÊæWşõ•`Ì@¥ƒ9Ú…à½oæêôëÓ-ÛóŠåx¬ğõy«7	VÁT*˜ãŒ‹8¸WÜS .]/+î9Ç÷8[C0æÎZ1J.]/ël]+˜Á,˜­­ÁT1˜:ø×RöÁ¿XW°\nf ÂÁ<¿¹üÓåŞøh£`Ì@%ƒ9&˜Ä¬¿rƒù¯¬Î§fWÁT(˜÷´íKYüyŞ®˜õş×éí[˜’ç9Ç´ìğiK¿H{÷í®‚¨d+#Â¹eÛîc^ÄèûmBY0Õf—ıÌ@/f%˜Á,˜Á¬3 ˜•`†ÿK)ŞÜÜ<ò¥—^Z2eÊ”cÇİ?lØ°4hĞ 4dÈƒwİuWû¤I“Ö=ñÄÓ³úµ`V‚ùÄÕ××ÿ¢®®nt¶½šÕçYíŠ}-«½Y}™}mVöqB¬\'úi ¿öÚk{ä‘Gö7.=ÿüóiåÊ•iÓ¦MiïŞ½)ÄÇÖÖÖôÁ¤,¸Óİwß}ğ{îYÇwŒÌJ0—ï–[nù]V³j?ÄåÔÛÙúC¤U?‘ğğG}tß}÷İ—‡îR¹V­Z•&Nœx`äÈ‘koºé¦_	f%˜»–…ëÅY¸Î?0î¬šúÒ¾Æ‘£äSfÏ½øÎ;ïLsæÌ9®@.5şü4|øğ¶¾2zÌ‚¹§ÕÕÕ\r\Z<xğ÷Å![__Ÿüñ´xñâôõ×_§;wæûÓ={òw«Ë—/OS§NM·Şzki8ï2zî£¡ÜØØøî˜1cÒgŸ}–zÂúõëSòm#FŒø½`V‚ù°P¾.ÒÅ<}úô¼5XmÛ¶åëÇ÷tö3GH³>$FÊÊånåŠŸ—škşÕ\\0æ)‡òøñãóÑñ‰ˆï‹–cI89÷•r´/zj¤ÜÙÈù¶ÛnÛ–m0³êÏÁ=åâöÅäÉ“;Ú\'*Ú=öXi[c€d«íÆé?üp{ô”+iîÜ¹mÙÛ®w³êÏÁœ…rCñH¹»¡\\Î%#ç&éVÃfÍšõ÷øıá‡R¥\Z5ª¥Vßf	fÁÜ]qJ\\qOùDÛGkk÷œµ4jx´ç)Ç)qÕ°zõêöZ5fÁÜÁ¼°šqà®fÌ˜aÔ\\ëbF_ğëÎiqÇkøğá-ÑgëM;KV¿Ì‚¹’ÛPÌÔ+ğ‹QíÖ­[+²ÅÙ\Z%§Ò],éjLL³~á…R5M:uUL)íEc\noûÖÕÕıF0æJlC‡¦Yçë=ùä“•ŞÇŠƒy‚¤«1qí‹˜f]M+V¬XŸm,szÛNUTó:ıfÁÜmèĞµ/ò¯766Vt‹I(E¿ËIWcâ‚D›7o®j0·´´´fË†^¼SuŒ~Šw.Á,˜»³\rº QşxOô+3‹~\r’®ÆÄUâ\n$ª–x¾¸RVoß©ŠG?ñöT0æîlCYµ>ï©Sävê\\Ñsï•t5&şã~İ¼`ËÏR‚¹wU-nC…ªö>&éjÌĞ¡CV{ÄÜÖÖÖR##æ÷âzW_}õ)ZFÌİİ†Š®«lÄÌÑ3¦½Ú=æo¾ùæÓ^Şc>,ûBù´ÓN‹«Ês]zé¥é²Ë.Ë—+ùœ½<˜Ø†ô˜)Û<ğyµÏÊX°`Á›½ô¬ŒwbfVi W+˜7lØWâKçŸ~:õÔSó0½ğÂ+Ì±\\Z=õï1bD^ı4˜»Ü†œ•AÙzê©ª}óäÉ“çö²ó˜;!W;˜/¿üò<È²Ë4mÚ´ªT0_rÉ%é¹çë¨Jü›úQ0sr3e»ÿşû9zôè«8óoïàÁƒ¿¨ÅÙH•æBx^tÑE)û¥÷ß?<ú…qk¯³Î:+_çª«®JŸ|òÉa#ßgy&}öÙéÜsÏM3gÎL7nÌ×‹‘÷\r7Ü,\ræk®¹¦Ó ½öÚk;¾\'Ö™={vºà‚Ò™g™^|ñÅu¯¸âŠtÆgä¿S´/šššûúS0—#fşeÛışjÌü‹{qšùWãÆÿßj]+cÁ‚Ókuş~¥ƒyìØ±‡µN>ùäüz\n…ÇcT¡ËÅ=Ü¨Q£F¥I“&åË¢Ù™/GKaÂ„	G´+ºjeÿ¼‡z¨c9.MËÑf)üŒyóæåa_0`€`>×Ê l·ß~ûM÷Ş{ïş*Œš·e#Á]]®ëŠõÊ+¯ì·è1ÇHµ4D#´‹C0Î¬‰*|­0úÑváñÎ‚¹´eRüó\nŸ/7ş1JÏc$ßÙï$˜;\ræŠ_].ÛÇºº\\1räÈæJ_9úÙñ\n~¬^n\ræh?–ß}÷İ<Ô\"`!o}wíÚÕQ¥!Xüyá{\"T#œ»Z¯³VFéz}-Få±¼fÍšü9\"”KGİ‚¹Ë~ôÛ•ºs6À:P<Z®Õ}Ÿ6–‹ãÆ©•ºƒIssóìì96»ƒI×uŞyçåm‡½f/”y¨]ıõyÅrÌÒŒ~oÔÑ‚4*úËñqôèÑù™]­Wzğ¯Ü`.ŒâãÀq¡å!˜Ëß×²ÚR;˜t“>hÈ!õY ìéé{şe#ÁeÙÛ«¯ÜóïèuóÍ7çm}sÎ9y8·´´ä#éæ£à8 Wè/-˜³Â¼çëÇYÇÛc>V0Ç‹Güq°qÖ¬Y‚ù8Å=ÿ\n{â%#e-Œ¾¦¾¾~xÜ8µ§FÎ1RPÎ6Ä‰µş·1óÏÌ¿9+çÂ]²ã¬ŠrÏ¾ˆ}Å=å¨¾°¯ÑÅ«y6zŞñúë¯ïîÆÁmO?ıô_£}`_ø»fÁ\\‰}-«mÅÁ\Zç9Ç$”\rÚÑ®ˆ}1yäÙgŸMC‡ı±d¶á®¾²¯q”>XöJ¼({;İòá‡¶ÏyÊo½õÖŒ,Øß‹ƒ}©Ï%˜s¥öµâÓèN°šô”ûW@ß=lØ°Ö)S¦ügÙ²e_e¯Ú›>ŠÅµ/\Z\Z\ZŞxğÁçe¯öëb#‰Wî¾vDX0æJïk‡zÿñr_Ü×(¿÷÷+wh¾ÿ—qÅªÂ•«â\")1?¦~öåYF‚Y0Û×@0«~Ì€`Ì€`V‚Ì‚ÌJ0‚Y0‚Y	f@0+ÁfÁf%˜Á,˜Á¬3 ˜3 ˜•`³`³Ì€`V‚Ì‚ÌJ0‚Y0‚Y	f Û-Z${OíÍ‚y¿­ú¹¥K—nnmmŠ½ 6mÚôrÌkm•ĞÏ-^¼x`ccãöo¿ı¶M8ş|#åå†††¯²ºÑV	œ”…ÁuÙHí½x=NUõŠ¿ûZ¡\0\0\0\0\0\0\0\0\0\0\0\0=èÊäœ íBÌ\0\0\0\0IEND®B`‚',1),
('f1bf70e5-2d24-11eb-84d4-227918fa15ea',1,'send-email.bpmn','f1bf70e4-2d24-11eb-84d4-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"send-email\" name=\"å‘é€é‚®ä»¶\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"start\" flowable:initiator=\"initiator\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:formProperty id=\"emailFrom\" name=\"å‘ä»¶äºº\" type=\"string\" default=\"delta@flowable.com\"></flowable:formProperty>\n        <flowable:formProperty id=\"emailTo\" name=\"æ”¶ä»¶äºº\" type=\"string\" default=\"delta@flowable.com\"></flowable:formProperty>\n        <flowable:formProperty id=\"emailCC\" name=\"æŠ„é€\" type=\"string\"></flowable:formProperty>\n        <flowable:formProperty id=\"emailSubject\" name=\"ä¸»é¢˜\" type=\"string\" default=\"æµ‹è¯•\"></flowable:formProperty>\n        <flowable:formProperty id=\"emailContent\" name=\"æ­£æ–‡\" type=\"string\" default=\"è¿™æ˜¯ä¸€ä¸ªæµ‹è¯•é‚®ä»¶\"></flowable:formProperty>\n      </extensionElements>\n    </startEvent>\n    <sequenceFlow id=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" sourceRef=\"startEvent1\" targetRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\"></sequenceFlow>\n    <endEvent id=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" name=\"end\"></endEvent>\n    <sequenceFlow id=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" sourceRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" targetRef=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\"></sequenceFlow>\n    <serviceTask id=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" name=\"SendEmail\" flowable:type=\"mail\">\n      <extensionElements>\n        <flowable:field name=\"to\">\n          <flowable:expression><![CDATA[${emailTo}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"from\">\n          <flowable:expression><![CDATA[${emailFrom}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"subject\">\n          <flowable:expression><![CDATA[${emailSubject}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"cc\">\n          <flowable:expression><![CDATA[${emailCC}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"text\">\n          <flowable:expression><![CDATA[${emailContent}]]></flowable:expression>\n        </flowable:field>\n      </extensionElements>\n    </serviceTask>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_send-email\">\n    <bpmndi:BPMNPlane bpmnElement=\"send-email\" id=\"BPMNPlane_send-email\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" id=\"BPMNShape_sid-E4D02A62-9237-4DB5-88D6-388754AE1687\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" id=\"BPMNShape_sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" id=\"BPMNEdge_sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" id=\"BPMNEdge_sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\">\n        <omgdi:waypoint x=\"274.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('f207c486-2d24-11eb-84d4-227918fa15ea',1,'send-email.send-email.png','f1bf70e4-2d24-11eb-84d4-227918fa15ea','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0f\0\0\0ä\0\0\0«)q\0\0IDATxÚíİmlUõp5jŒ1&\Z_8£É–ŒÆøÆd&ÓøÖ¨a&j‘¢$¢74øQã0¾™&†éÂ†hD@\n\nÈ|„‰Q@jy.TÿÎïŒ[/—.´÷ÚÛ~>É/=½=í-åœïıßß9ÿsN:	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€R:eİºu¯®\\¹òÇE‹¥…ª*WCCCZºtéwY\r±E\'E(755¥ÖÖÖÔŞŞ®~¦Ú²eKZ²dÉ,¤o´UB?#e¡ÜkÂ¹=A¯µUB?í¡Ø{*æı¶Jèç¢Ç){U0\'[%æ²Ccó÷»Óø«òŠeA*˜*ó¾}íiëÎ¶Ï—®méæX.<Şº}OÚ¾«M°\nf ’Á¡<}ù—éO¯6§·şıMjüxszàŸk:‚9–ãñ¹mL³uş<ÿÓ´c·pÌ@Å‚ù»{Ò_iîâcÕ„—W§\rßí®‚¨d+ãÍU›ÊæWşõ•`Ì@¥ƒ9Ú…à½oæêôëÓ-ÛóŠåx¬ğõy«7	VÁT*˜ãŒ‹8¸WÜS .]/+î9Ç÷8[C0æÎZ1J.]/ël]+˜Á,˜­­ÁT1˜:ø×RöÁ¿XW°\nf ÂÁ<¿¹üÓåŞøh£`Ì@%ƒ9&˜Ä¬¿rƒù¯¬Î§fWÁT(˜÷´íKYüyŞ®˜õş×éí[˜’ç9Ç´ìğiK¿H{÷í®‚¨d+#Â¹eÛîc^ÄèûmBY0Õf—ıÌ@/f%˜Á,˜Á¬3 ˜•`†ÿK)ŞÜÜ<ò¥—^Z2eÊ”cÇİ?lØ°4hĞ 4dÈƒwİuWû¤I“Ö=ñÄÓ³úµ`V‚ùÄÕ××ÿ¢®®nt¶½šÕçYíŠ}-«½Y}™}mVöqB¬\'úi ¿öÚk{ä‘Gö7.=ÿüóiåÊ•iÓ¦MiïŞ½)ÄÇÖÖÖôÁ¤,¸Óİwß}ğ{îYÇwŒÌJ0—ï–[nù]V³j?ÄåÔÛÙúC¤U?‘ğğG}tß}÷İ—‡îR¹V­Z•&Nœx`äÈ‘koºé¦_	f%˜»–…ëÅY¸Î?0î¬šúÒ¾Æ‘£äSfÏ½øÎ;ïLsæÌ9®@.5şü4|øğ¶¾2zÌ‚¹§ÕÕÕ\r\Z<xğ÷Å![__Ÿüñ´xñâôõ×_§;wæûÓ={òw«Ë—/OS§NM·Şzki8ï2zî£¡ÜØØøî˜1cÒgŸ}–zÂúõëSòm#FŒø½`V‚ù°P¾.ÒÅ<}úô¼5XmÛ¶åëÇ÷tö3GH³>$FÊÊånåŠŸ—škşÕ\\0æ)‡òøñãóÑñ‰ˆï‹–cI89÷•r´/zj¤ÜÙÈù¶ÛnÛ–m0³êÏÁ=åâöÅäÉ“;Ú\'*Ú=öXi[c€d«íÆé?üp{ô”+iîÜ¹mÙÛ®w³êÏÁœ…rCñH¹»¡\\Î%#ç&éVÃfÍšõ÷øıá‡R¥\Z5ª¥Vßf	fÁÜ]qJ\\qOùDÛGkk÷œµ4jx´ç)Ç)qÕ°zõêöZ5fÁÜÁ¼°šqà®fÌ˜aÔ\\ëbF_ğëÎiqÇkøğá-ÑgëM;KV¿Ì‚¹’ÛPÌÔ+ğ‹QíÖ­[+²ÅÙ\Z%§Ò],éjLL³~á…R5M:uUL)íEc\noûÖÕÕıF0æJlC‡¦Yçë=ùä“•ŞÇŠƒy‚¤«1qí‹˜f]M+V¬XŸm,szÛNUTó:ıfÁÜmèĞµ/ò¯766Vt‹I(E¿ËIWcâ‚D›7o®j0·´´´fË†^¼SuŒ~Šw.Á,˜»³\rº QşxOô+3‹~\r’®ÆÄUâ\n$ª–x¾¸RVoß©ŠG?ñöT0æîlCYµ>ï©Sävê\\Ñsï•t5&şã~İ¼`ËÏR‚¹wU-nC…ªö>&éjÌĞ¡CV{ÄÜÖÖÖR##æ÷âzW_}õ)ZFÌİİ†Š®«lÄÌÑ3¦½Ú=æo¾ùæÓ^Şc>,ûBù´ÓN‹«Ês]zé¥é²Ë.Ë—+ùœ½<˜Ø†ô˜)Û<ğyµÏÊX°`Á›½ô¬ŒwbfVi W+˜7lØWâKçŸ~:õÔSó0½ğÂ+Ì±\\Z=õï1bD^ı4˜»Ü†œ•AÙzê©ª}óäÉ“çö²ó˜;!W;˜/¿üò<È²Ë4mÚ´ªT0_rÉ%é¹çë¨Jü›úQ0sr3e»ÿşû9zôè«8óoïàÁƒ¿¨ÅÙH•æBx^tÑE)û¥÷ß?<ú…qk¯³Î:+_çª«®JŸ|òÉa#ßgy&}öÙéÜsÏM3gÎL7nÌ×‹‘÷\r7Ü,\ræk®¹¦Ó ½öÚk;¾\'Ö™={vºà‚Ò™g™^|ñÅu¯¸âŠtÆgä¿S´/šššûúS0—#fşeÛışjÌü‹{qšùWãÆÿßj]+cÁ‚Ókuş~¥ƒyìØ±‡µN>ùäüz\n…ÇcT¡ËÅ=Ü¨Q£F¥I“&åË¢Ù™/GKaÂ„	G´+ºjeÿ¼‡z¨c9.MËÑf)üŒyóæåa_0`€`>×Ê l·ß~ûM÷Ş{ïş*Œš·e#Á]]®ëŠõÊ+¯ì·è1ÇHµ4D#´‹C0Î¬‰*|­0úÑváñÎ‚¹´eRüó\nŸ/7ş1JÏc$ßÙï$˜;\ræŠ_].ÛÇºº\\1räÈæJ_9úÙñ\n~¬^n\ræh?–ß}÷İ<Ô\"`!o}wíÚÕQ¥!Xüyá{\"T#œ»Z¯³VFéz}-Få±¼fÍšü9\"”KGİ‚¹Ë~ôÛ•ºs6À:P<Z®Õ}Ÿ6–‹ãÆ©•ºƒIssóìì96»ƒI×uŞyçåm‡½f/”y¨]ıõyÅrÌÒŒ~oÔÑ‚4*úËñqôèÑù™]­Wzğ¯Ü`.ŒâãÀq¡å!˜Ëß×²ÚR;˜t“>hÈ!õY ìéé{şe#ÁeÙÛ«¯ÜóïèuóÍ7çm}sÎ9y8·´´ä#éæ£à8 Wè/-˜³Â¼çëÇYÇÛc>V0Ç‹Güq°qÖ¬Y‚ù8Å=ÿ\n{â%#e-Œ¾¦¾¾~xÜ8µ§FÎ1RPÎ6Ä‰µş·1óÏÌ¿9+çÂ]²ã¬ŠrÏ¾ˆ}Å=å¨¾°¯ÑÅ«y6zŞñúë¯ïîÆÁmO?ıô_£}`_ø»fÁ\\‰}-«mÅÁ\Zç9Ç$”\rÚÑ®ˆ}1yäÙgŸMC‡ı±d¶á®¾²¯q”>XöJ¼({;İòá‡¶ÏyÊo½õÖŒ,Øß‹ƒ}©Ï%˜s¥öµâÓèN°šô”ûW@ß=lØ°Ö)S¦ügÙ²e_e¯Ú›>ŠÅµ/\Z\Z\ZŞxğÁçe¯öëb#‰Wî¾vDX0æJïk‡zÿñr_Ü×(¿÷÷+wh¾ÿ—qÅªÂ•«â\")1?¦~öåYF‚Y0Û×@0«~Ì€`Ì€`V‚Ì‚ÌJ0‚Y0‚Y	f@0+ÁfÁf%˜Á,˜Á¬3 ˜3 ˜•`³`³Ì€`V‚Ì‚ÌJ0‚Y0‚Y	f Û-Z${OíÍ‚y¿­ú¹¥K—nnmmŠ½ 6mÚôrÌkm•ĞÏ-^¼x`ccãöo¿ı¶M8ş|#åå†††¯²ºÑV	œ”…ÁuÙHí½x=NUõŠ¿ûZ¡\0\0\0\0\0\0\0\0\0\0\0\0=èÊäœ íBÌ\0\0\0\0IEND®B`‚',1),
('faa37fba-2d29-11eb-9782-227918fa15ea',1,'send-email.bpmn','faa37fb9-2d29-11eb-9782-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"send-email\" name=\"å‘é€é‚®ä»¶\" isExecutable=\"true\">\n    <startEvent id=\"startEvent1\" name=\"start\" flowable:initiator=\"initiator\" flowable:formFieldValidation=\"true\"></startEvent>\n    <sequenceFlow id=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" sourceRef=\"startEvent1\" targetRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\"></sequenceFlow>\n    <endEvent id=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" name=\"end\"></endEvent>\n    <sequenceFlow id=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" sourceRef=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" targetRef=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\"></sequenceFlow>\n    <serviceTask id=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" name=\"SendEmail\" flowable:type=\"mail\">\n      <extensionElements>\n        <flowable:field name=\"to\">\n          <flowable:expression><![CDATA[${emailTo}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"from\">\n          <flowable:expression><![CDATA[${emailFrom}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"subject\">\n          <flowable:expression><![CDATA[${emailSubject}]]></flowable:expression>\n        </flowable:field>\n        <flowable:field name=\"text\">\n          <flowable:expression><![CDATA[${emailContent}]]></flowable:expression>\n        </flowable:field>\n      </extensionElements>\n    </serviceTask>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_send-email\">\n    <bpmndi:BPMNPlane bpmnElement=\"send-email\" id=\"BPMNPlane_send-email\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E4D02A62-9237-4DB5-88D6-388754AE1687\" id=\"BPMNShape_sid-E4D02A62-9237-4DB5-88D6-388754AE1687\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"320.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\" id=\"BPMNShape_sid-4329CEE2-F1D9-4BF6-9218-38C62659F72E\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"180.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\" id=\"BPMNEdge_sid-B4DA1B3A-508B-4E50-8C7C-218F8E66DCFA\">\n        <omgdi:waypoint x=\"129.9499986183554\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"180.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\" id=\"BPMNEdge_sid-9BAB4ACD-DA8A-4FEE-AD68-2649B32CD9E8\">\n        <omgdi:waypoint x=\"279.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('faff826b-2d29-11eb-9782-227918fa15ea',1,'send-email.send-email.png','faa37fb9-2d29-11eb-9782-227918fa15ea','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0f\0\0\0ä\0\0\0«)q\0\0IDATxÚíİkŒTåp5jŒ1&\Z?X£I›”ÆøÅ¤&ÕøÕ¨±&â\"‹BˆR@Elià5¢ÆbüRMÕ†ÑX$H¹-¸°^¨WØZñRå¶®n²°‚¼=Ï	³ã³°3îÌü~É“=;{vgYÎùÏ;Ï9ï9ƒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ĞORJÇ¯[·î…U«Vı°lÙ²´téRUåjiiI+W®ü:«á¶H`P„r[[[êììLİİİêgª¯¾ú*­X±b{Ò×Ú*¡ÁÅHY(˜pîÎFĞkm•Ğà¢}!NeÁ¼×V	\r.zœq@s²U‚`.;4¶|û]š8{u^±,H3På`Ş³§;}³£«çó•k;z‚9–wnÛ•¶íì¬‚¨d0G(Ïzí³ô§ÚÓ’ÿlN­lISÿù~O0Çr<¾à½ir¶ÎŸ}”¶\'œ3P±`şzû®ôÇçÛ{‚øH5é¹5iÃ×;„«`*ÙÊø×êMeóóÿş\\°\nf ÒÁí‹BğŞ5gMúÇëëÓ§ÛòŠåx¬ğõ…k6	VÁT*˜ãŒ‹8¸WÜS .]/+î9Ç÷8[C0æŞZ1J.]/ëm]+˜Á,˜­­ÁT1˜<ø×QöÁ¿XW°\nf ÂÁ¼¨½üÓå^~o£`Ì@%ƒ9&˜Ä¬¿rƒùÏ¯É§fWÁT(˜wuíIYşIŞ®˜ûöé•:~2%;ÎsiÙà3W~švïÙ#\\3PÉVF„sÇÖïx£owt	eÁT#˜]öS0<˜•`³`³Ì€`V‚™F”R:©½½}Ì³Ï>»búôéÛ\'L˜°wäÈ‘ièĞ¡iøğáûo½õÖî)S¦¬{øá‡geõkÁ¬óÑknnşESSÓ¸lÿz!«O²ÚûZV»³ú,ûÚÜìã¤XO:5h ¿øâ‹»ÿşû÷Ş~ûíé©§J«V­J›6mJ»wïN!>vvv¦wŞy\'eÁn»í¶ıwÜqÇú›o¾y´`V‚¹|×_ıï²ZšU÷ .§^ÉÖ.­\ZDÀ£xà=wİuWºûöíKåZ½zuš<yò¾1cÆ¬2dÈ¯³Ì‡–…ëyY¸.êC÷Vmõ¾¯5ú(ùøyóæ-¿å–[ÒüùóûÈ¥-Z”F\ZÕUÏ£gÁ,˜ESSÓĞaÃ†}[²ÍÍÍé¡‡JË—/O_|ñEÚ±cG¾?íÚµ+·úÚk¯¥3f¤n¸¡4œw\Z=×i(·¶¶¾9~üøôñÇ§ş°~ıú”…|×èÑ£/˜•`>(”¯Ì‚t_q Ïš5+o\r–cëÖ­ùúñ}ÅıÌÑÒ¬ÄH9B¹Ü\r£\\ñó²Qs]¾šfÁ|´#åâP8qb>:>\Zñ}Ñr,	g#çzé)Gû¢¿FÊ½œo¼ñÆ­Ù3X0«Fæè)·/¦M›ÖÓ®8ZÑæxğÁKÛ\Zƒ%[m·0Nºï¾ûº£§\\I,èÊŞv½!˜U#sÊ-Å#åc\råâp.9·I·\Z6wîÜ¿Çè÷ßŸ*mìØ±õô6K0æ¾ˆSâŠ{ÊGÛ¾8\\[£¸ç¬¥QÃ£å8O9N‰«†5kÖt×Ó¨Y0æ>óÒBhÆ»J˜={¶Qs­‹}qÀïXN‹ë«Q£FuDŸm ï@YıV0æşÚ^b¦^á€_Œj¿ùæ›Šì_q¶FÉ©tçIº\ZÓ¬Ÿ~úéTM3fÌXSJøšÂ[Á¥MMM¿Ì‚ùX·—Ó¬óõyä‘JïcÅÁ<IÒÕ˜¸öEL³®¦×_}}¶±Ì¯…`.ª…½ˆ³`.w{9pí‹üë­­­İÇbJÑï2_ÒÕ˜¸ Ñ–-[ª\ZÌÙÆ²¡Æ‚¹gDT¼Ã	fÁ\\îörà‚Dùãı}Ğ¯TÌ,ú=6Hº\ZW‰+\\¨ZâùâJYµÌÅ#¢xË*˜s¹ÛKV]…Ïûë¹Ã:WôÜ»%]‰ÿ¸ŸÃ1^°eÀ”`XU+ÛMµ÷1IWcFŒ±¿Ú#æ®®®\Z1¿×8¸ì²Ë×Ê0bîËöRt]e#foüøñİÕî1oŞ¼ù£\Zì1ÈõĞc>ñÄ#Äªò\\\\pAºğÂóåJ>ç\0\næŸl/zÌ”mêÔ©ŸTû¬ŒÅ‹ÿ«†ÎÊx#fk•rµ‚yÃ†\rqu¾tÖYg¥N8!ÓsÎ9§\"ÁË¥Õ_ÿÑ£GçÕ\0Á|ÈíÅY”íÑG}ºÚç1O›6mA\rœÇÜë¹ÚÁ|ÑEåA–½€¦™3göT¥‚ùüóÏOO>ùdOUâßT§Á|ÄíÅyÌ”íî»ïşå¸qã~¨âÌ¿İÃ†\rû´^f#U:˜áyî¹ç¦ìï–Ş~ûíüñè!Æí¾N=õÔ|K/½4}øá‡|üñtÚi§¥3Î8#Í™3\'mÜ¸1_/FŞ×\\sMş±4˜/¿üò^ƒôŠ+®èùXgŞ¼yéì³ÏN§œrJzæ™gzÖ½øâ‹ÓÉ\'ŸœÿNÑ¾hkk;èwª×`.GÌüË¶û½Õ˜ù÷â4ó¯ÆMœ8ñÕºVÆâÅ‹gÕÓüıJó„	j-wÜqù5\nÇ¨6B7–‹{¸QcÇMS¦LÉ—#D³5_–Â¤I“~Ò®8T+£øçİ{ï½=Ëq¹ÊX6Kág,\\¸0¯ëøÚàÁƒs×Ê l7İtÓ;ï¼soFÍ[³Qß»®.×·Šø’K.é	·è1ÇHµ4D#´‹C0Î¶‰*|­0úÑváñŞ‚¹´eRüó\nŸ/7ş1JÏc$ßÛï$˜+u¹lÛïêrubÌ˜1í•¾sô³ãüH}[ÁücEû¡°üæ›oæ¡[Ùx;¼sçÎ*\rÁâÏß¡\Zá|¨õzke”®×Û×bTËï¿ÿ~şÊ¥£îFæıèW*u=æl€µ¯x´\\OûZCŠ>TÜ8µRw0iooŸ—=Çw0é[yæ™yÛ!F¯Ù‹gjW]uU^±37£ßu¸ Šşr|7n\\~¦Ç¡Ö+=øWn0Fñq0¹ĞòÌ½ïkY}U;˜ìw“:4|øğælçßÕß÷üËF}¯fo¯>wÏ¿¾×u×]—·bôyúé§çáÜÑÑ‘¤¯¾úê|ä\nıåÃsöâ˜÷|cı8Ë£¯=æ#s¼xÄïçÎ+˜#îùW8Ø÷ü+)kaÔ›æææQqãÔş\Z9ÇH9B9Û\'×ãßËÌ?3ÿaä<²8œwÉ³*Ê=û\"ô÷”£êu_kxñj·¿ôÒKßÃÁ­=öØ_£}`½ş­³`>Ö}-«­ÅÁ\Zç9Ç$”\rÚÑ®ˆ}1yä‰\'H#FŒø¡d¶áÎzŞ×Ôs\'ßeÙ[çwß}·«/ç)/Y²dvìoÅÁ‡zïs	fÁÜûZñitGYmzÊĞ×F@9²súôéÿ}õÕW?Ï^µ·.|$Šk_´´´¼|Ï=÷,Ì^í×ÅF¯ÜpDX0æşÜ×ôŞ¾r£ìkôŞ{û•İ~`¾ÿgqÅªÂ•«â\")1?¦~6Ú,#Á,˜ík ˜U3 ˜3 ˜•`³`³Ì€`V‚Ì‚ÌJ0‚Y0‚Y	f@0f@0+ÁfÁf%˜Á¬3 ˜3 ˜•`³`³Ì€`Ì€`V‚¨ˆeË–	ÄS»³`Şk«„·råÊ-Bq\0Ô¦M›Ë‚y­­\ZÜòåË¯nmmİöå—_v	ÇŸo¤¡ÜÒÒòyV×Ú*AY\\™ÔŞŠ·ÑÑãTU¯ø»¯Ê\0\0\0\0\0\0\0\0\0\0\0\0p”şµ‡œ 4Toc\0\0\0\0IEND®B`‚',1),
('fcbd1e56-2bcb-11eb-9e90-227918fa15ea',1,'out-factory.bpmn','fcbd1e55-2bcb-11eb-9e90-227918fa15ea','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"out-factory\" name=\"å¤–å‡ºå•\" isExecutable=\"true\">\n    <dataObject id=\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\" name=\"_FLOWABLE_SKIP_EXPRESSION_ENABLED\" itemSubjectRef=\"xsd:boolean\">\n      <extensionElements>\n        <flowable:value>true</flowable:value>\n      </extensionElements>\n    </dataObject>\n    <dataObject id=\"manager\" name=\"æ‰€å±é¢†å¯¼\" itemSubjectRef=\"xsd:string\">\n      <extensionElements>\n        <flowable:value>manager</flowable:value>\n      </extensionElements>\n    </dataObject>\n    <startEvent id=\"startEvent1\" name=\"å¡«å•\" flowable:initiator=\"initiator\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" name=\"ç”³è¯·äººç¡®è®¤\" flowable:assignee=\"${initiator}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\" flowable:skipExpression=\"${_FLOWABLE_SKIP_EXPRESSION_ENABLED==true}\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" sourceRef=\"startEvent1\" targetRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\"></sequenceFlow>\n    <userTask id=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" name=\"ä¸»ç®¡å®¡æ ¸\" flowable:assignee=\"${manager}\" flowable:formKey=\"out-factory\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <flowable:taskListener event=\"create\" class=\"com.deltaww.flowapi.listener.AutoAssigneeListener\"></flowable:taskListener>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" sourceRef=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" targetRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\"></sequenceFlow>\n    <endEvent id=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" name=\"ç»“æŸ\"></endEvent>\n    <sequenceFlow id=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" sourceRef=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" targetRef=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_out-factory\">\n    <bpmndi:BPMNPlane bpmnElement=\"out-factory\" id=\"BPMNPlane_out-factory\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\" id=\"BPMNShape_sid-E086BDD7-66B2-409F-B18C-B682DD9172DB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\" id=\"BPMNShape_sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"320.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\" id=\"BPMNShape_sid-52A44D3B-7206-486E-8F26-58E536F8AFDB\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"465.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\" id=\"BPMNEdge_sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40\">\n        <omgdi:waypoint x=\"274.9499999999907\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"319.9999999999807\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\" id=\"BPMNEdge_sid-C1DDC6AA-BE98-4CC6-AB71-8C8C99AEDC5C\">\n        <omgdi:waypoint x=\"419.95000000000005\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FB957372-CC09-424B-88F0-30C09C3C100F\" id=\"BPMNEdge_sid-FB957372-CC09-424B-88F0-30C09C3C100F\">\n        <omgdi:waypoint x=\"129.9499984899576\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.9999999999917\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('fcf3e5c7-2bcb-11eb-9e90-227918fa15ea',1,'out-factory.out-factory.png','fcbd1e55-2bcb-11eb-9e90-227918fa15ea','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0÷\0\0\0ä\0\0\0…@m¦\0\0~IDATxÚíİ}ˆUuŸ\0ğ*z\"\"‚ú#Ú¨Øh%\"\"ˆ6Ú\"‚ˆè‰6zs¦§Ü4³\'ª5éÅ\"{µ—­ˆ·6DÌu]5g|Í”Ş°YCV7µÌœÆm}Ì§1Ó<{¾Ïì™ë¼ÜÑy¹wæó/3÷Ü;÷Şï|¿ç÷ûsîï~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ô³$IŞ´iÓ¬5kÖüÖØØ˜,^¼Xôs444$+V¬øŸ4êäŠ9ô²(Ê+W®LZZZ’½{÷ŠŠ;v$Ë—/ß•é›äj9ô²m)ÊSœ÷¦£°õrHµzYL£*Š•iaŞ\'‡ÄPË! —Åz‚XQ…9‘Cb¨å0@…ù/ŞlúôOÉW\rgßÇ6ÅTa–Cr¨ÂÂ¼{ç¶dİ¢)É—óïo±-îSP5w9$‡€*+Ì[¿ú·CŠrß}5OAÕÜåª­0¯_út§…9îSP5w9$‡€*+Ìë?ÚiaûTÍ]É!@aš»’CÀ@æ8²¹³Â÷)¨š»’C@•æ«ş©ÓÂ÷)¨š»’C@•æ·5%ë>|äĞéÔt[Ü§ jîrHUV˜#66ãÂÛS…YÉ! \Zó/¿$?şçC§SÓmqŸ‚ª¹Ë!9TQa«‡mXõJ§ë¥qŸ+ŒiîrHÕP˜ÓÑÔöK’ÿ\\øå<â1ñX#0Í]É! Bsw#-#0…YÉ! Ê\ns9#­®F`\n¬æ.‡äPa…ùp‹r\n¬æ.‡äPa…Y(ÌrHš»ĞÜ…f¡¹9(Ì\n³š;t%I’ß755Õ¿óÎ;Ë§M›¶kÂ„	ûF\Z•><©««;p×]wí<yò¦§Ÿ~zf\Z£¹…YÉ¡S[[ûW555w§5zV\ZÓØõ:=ilNï›“~ıc<N‡¢M}öìÙ3¦NºoâÄ‰Éë¯¿¬Y³&Ù¶m[²gÏ$Ä×–––äóÏ?OÒæŸÜsÏ=î½÷Ş-cÇ£¹…YÉ¡şsë­·ş}\Z‹ÓØ{°™—KÓÇ×éxCDÚÄG?ñÄ¿ÜÿıYãŞ¿R®µk×&>øàşúúúõ7ß|óÙš»P˜åê;iƒ>3mĞ{ĞĞ;Š•ƒ©^sèhıè¹sç.¹óÎ;“yóæõ¨©—Z¸pa2zôèÖÁ2ŠW˜f9$‡*MMMÍğ#Füo±Q×ÖÖ&O=õT²dÉ’äÛo¿M~úé§¬&ÿüóÏÙÌëªU«’éÓ§\'·İv[iƒßm?Hû²eË>?~|²aÃ†¤7lÙ²%IwZÇŒóš»ĞÜåêÕÆş‡´ï/6õ™3gfK¥åØ¹sgöøø¹b“OŸsŒ8ˆÄˆ=\Z{¹‰Q®x¾tô^õ{„\n³Â,‡äP%Ø‹}Ò¤IÙ(ıpÄÏÅlIƒ7‚,kì1ß[#öFğ·ß~ûÎ4a†iîBsrèÈÖØ‹Sñ<òHÛÔûáŠ)û\'Ÿ|²tŠ~˜îXİÓñ¿üñÇ÷Æ\Z{_š?~kmmíjÍ]hîB¾´±7GìGÚØ‹\r¾d¿R‡¬bsæÌù—xCıõ×¤¯7®¹Z§{f…YÉ¡§»×Øw*¾«)úâ\Z¼éù*µÇyìqº[øòË/÷Vëè]aV˜åª€æ¾8o¼q0\\_xï½÷ŒŞ«]\\y.¢;’SŞzjôèÑÍ±fTI,iüÂ¬0Ë!9TÉ9W”Ë¢‹Ñõ?şØ\'5:¢/9MîLİ²ÊÄ%eß|óÍ¤?MŸ>}m\\ú°Rş\nÓO‹kjjşVaV˜åªÄ:xIÙìqÏ<óL_×ébsÿ£nYeâZñqIÙşôñÇoI“e^¥ıQbAG{Ğ\n³Â,‡äĞ@æĞÁkÅg÷/[¶¬Oët\\è¦ğ»ÌÓ-«L|ÌöíÛûµ¹777·¤É²µ‚ÿ¨Úö ‹\\\n³Â,‡äĞ@æĞÁÉ¶÷öt¥âJv…ßc«nYeâÓİòé/ñzñéD•şGUÜƒi2…Ya–Crh s(ÖüvoşÖÕiq…×Ş£[V™xãÂ~ÀÁ€„Â\\Y!‡ÄPÌ¡<ú»Në–UfäÈ‘ú{äŞÚÚÚ\\%#÷OãÚÍW\\qÅÑ•4¥ºzõêäüóÏO\ZÛm?öØcãL£.9$i>—İÈ®?~o¯¹ÿı÷ÿUákîí\nò@¬—Îš5+ŠNöµô¾Ø»şúë³KNŞpÃ\rÉ	\'œE<ş˜ci»=nÜ¸NŸwîÜ¹eıq&Åé§ŸïY»íq\nÎµ×^›ÔÕÕ%_ıuÛö+¯¼2¹æškæ\nÈ¡\"Î‹¾à‚y?óxã7²üøä“OÚ¶Í™3\'Ûöá‡vú¼¯¼òJ–s‘/İ—¶>õÔSÙvÆg$»víÒÜËÌ!kî”mÊ”)ûûhùE‹ıG…-¿:®şTZû£0Ç(<\nhwÑYQ.wäşî»ïvZ¨ãg‹¯ÕÔÔ”œtÒIí¶İrË-mŸ1cFrá…&ëÖ­kÛvŞyç%×]wİP.Ì–CåşŸED“/½/râøão÷~_}õÕÉ¹çÛn[äÉk¯½VV¾ÆãJ›{¼~GCÍ½ër´<e{öÙgßìïóÜÓçü\n;Ï½ÃQÖ@4÷‰\'f…7¾vt;š{Áøş­·ŞÊ¶w6rŸ?ş!¯óÒK/eëèßÍüòË/O.¹ä’äí·ßNÎ>ûìdØ°aÉÖ­[“åË—gÏÛ»úwœ|òÉÙ¬Â,ÌCEÌ°”Ó„#ÿ\"Ïb&híÚµY#Û\'xb–,HÎ:ë¬lI(7oîñsñ#q;¾æÛòæ39ùëD^ÆgX\\|ñÅmùtÎ9çÄ‡J%+W®êÍ½Ûr;e{øá‡ÿúî»ïş­¯P·gÄˆ_Wã*eä¿GÆhî=¹§ÿ÷ÙóÄ4jGÓı§œrJV cZö¸ãët4–ìÒF#¿8À¥C+£¹ÇºiäIéßzö¾Å×âöØËwüº‹…Çs›vG‘/ÏDn_tÑEYcÿı÷“¥K—¶íäßÇW—Ÿí^\\¡.­ûúã\nuuuu\\¡®ÊMš4é¿ûëÚò‹-šY­×*®”‘{ŞÈ£wÖ€#bDTú:1\"‹û.»ì²NGõùiì(ÄH.f\0b[’«®º*kîyÁ.6÷İ»wg;ê¨£²ïæÊ›–ïêXxÿ#¯â½ë,¢A›{wyM;7¾æÇcäÍ=\ZE>İy\\:ÍÿØceË=±Ş¯¹wÏµå)ÛwÜqó}÷İ·¯Fï;Ó‘ã>®óæİÒ\"œß.6÷qÅwl/6Ó|[ékÄãc{4ìø\ZkjÅûcª4/ÀysF³±=^3nçë¨ÑØ‹Í=¦nó‚]:« 0\\sƒ»\Za£Èwğâ½î(Š\r¸Ü‘{ø·£ÁÇÎaÌ9uêÔ,¯&L˜L<9»?òGs/«¹÷ù§Â¥uú€O…$êëë›úúóÜc}?ö»[—4-ßıu¥Í=ÖºóÈ×ß‹Ï¿qãÆì¾5Åô{¬ŸÆ÷1ÊÊóê«¯f?>oî1ŸÿnyA/mî1½ºyóæl´àÅ\ZmX§0WFsµìÈ“f„\"âxŠÒÑ{9Ï¹OÆåìÙ³³ç¯q;¶çÍ=?#fb™ \Z{Ì8=÷ÜsÉ”)S²Ÿ{ñÅMË÷l}~i_}{:ĞÛ_µWk½æÿ“åÌ´˜·nØ°¡O\Z{SSÓÜô5¶§{Ãªõÿ¨Ò¦åãHæt§¬Û‘ûgŸ}–Î#§ø¾8ÊéùâøÅæ½»‘{ì0ÄAWùï£´üˆüx@a®¢iùîFîñŞh/wä;¡ùÑò1€ˆ3,\"ÿ^%{ŞØ)ĞÜ{V¯ÓØ‘7áø»;Ò=İQ/®³ï®æzMA]]]mZ¤niiéÕÆşİwß}”6Šoª}z§R¦å#¢ Æí˜ÖìjägBDam¥Ó/¼ğBö¸8ˆ.NkË›{¾æ£¯ä¿[œœîÅ·5÷˜b‘zş;Äè,\nDÜ£øØ#3…¹ºš{g#÷˜É)mîå¬¹—\n;§vZ‘“7Şxc–Ïq>½æ^¾šššáùÁuùşp§èãçJFì¦ã›ÚÚÚÑcÇİİ[#ø±GcOñÁjÿ¿éÏÂ#™(²hbZ=¦ÔcÔÑš{4í(–ñ}œÖté¥—¶;½ôuâÀ¸˜VÏgbM4¦rãû(Äq$s|E¸Ø¢ùÇº}iÅ¼¹¹¹íyã ªÙñÅ\nó\06÷îF×¥£ì8‹¢³õö|¶(îxÿ#\'âûÈÅ¸?¾ÆíØ^¼ŞA¬Iwô³À‡z¨İ’P¬ûÇæŞãü¨bƒ5ø¨	ñ÷WîQñqğ\\q=b0Ôk:Ù#LGñ»>øàƒ¿ÁAv;Ÿşù?ÅT|$à`ø©¤K‡ÆeŞèóÆç½æÅ:¦Ôôüè(¸;vìh7½ßÕUÊæÊË¡x¿Š§¼u•ô¾Ê¡×ë4v›s4ù¨q¡›•çSö1³W‹ò—_~99räo%WÅÛ=Xê5]¬é¤\r¢±¾¾¾9}µöä<ö´P¼—î|\Zc¦5›J¿.x4ú|Z\\a–Cbh4÷¼^O‘;ÌXi}h5ù›¢É\Z5ªeÚ´i_}ôÑGß¤{~Ûó›‰‰kÅ744üû£>º İcÜI{ƒí(K…Ya–Cr¨ÒëõÁ&¿¯\'M}0ÖkÊWFJ“fâÁkoO	Ê?-(>T ®=—(ÌW2R˜f9$‡ÔkĞÜ…Â,‡ä 0Í]È!@aV˜åĞÜ…Ya–CBsf…YÉ!@s\n³’C€Â,4w!‡\0…Ya–CBsf…Y	ÍP˜f9$‡\0Í](ÌrH\n³ĞÜ…f…Y	ÍP˜f9$4w@aV˜å4w¡0Ë!9(ÌBsrP˜fÍ]hî€Â¬0Ë!¡¹\n³Â,‡ä ¹…YÉ! Z466*ˆ•{ÒÂ¼O‰¡–C@/[±bÅö––E±bÛ¶mÿšæõrHµzÙ’%K®_¶lÙŸøá‡VÅqàF[Q”\Z\Z¾Iã&9$†Z} -H÷ö?é¼X¯ıñÿ¾¾š‹²’C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@Áÿ\"òĞÔG+ \0\0\0\0IEND®B`‚',1);

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
('3b43120c-2e04-11eb-8e8e-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','3b4275c5-2e04-11eb-8e8e-227918fa15ea','3b43120b-2e04-11eb-8e8e-227918fa15ea','startEvent1',NULL,NULL,'å¡«å•','startEvent',NULL,'2020-11-23 21:22:07.393','2020-11-23 21:22:07.409',1,16,NULL,''),
('3b45830f-2e04-11eb-8e8e-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','3b4275c5-2e04-11eb-8e8e-227918fa15ea','3b43120b-2e04-11eb-8e8e-227918fa15ea','sid-FB957372-CC09-424B-88F0-30C09C3C100F',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-23 21:22:07.409','2020-11-23 21:22:07.409',2,0,NULL,''),
('3b458310-2e04-11eb-8e8e-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','3b4275c5-2e04-11eb-8e8e-227918fa15ea','3b43120b-2e04-11eb-8e8e-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','3b4b7581-2e04-11eb-8e8e-227918fa15ea',NULL,'ç”³è¯·äººç¡®è®¤','userTask','admin','2020-11-23 21:22:07.409',NULL,3,NULL,NULL,''),
('a43f984c-2e04-11eb-b39c-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','a43e38b5-2e04-11eb-b39c-227918fa15ea','a43f713b-2e04-11eb-b39c-227918fa15ea','startEvent1',NULL,NULL,'å¡«å•','startEvent',NULL,'2020-11-23 21:25:03.531','2020-11-23 21:25:03.544',1,13,NULL,''),
('a442094f-2e04-11eb-b39c-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','a43e38b5-2e04-11eb-b39c-227918fa15ea','a43f713b-2e04-11eb-b39c-227918fa15ea','sid-FB957372-CC09-424B-88F0-30C09C3C100F',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-23 21:25:03.547','2020-11-23 21:25:03.547',2,0,NULL,''),
('a4420950-2e04-11eb-b39c-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','a43e38b5-2e04-11eb-b39c-227918fa15ea','a43f713b-2e04-11eb-b39c-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','a44ae2f1-2e04-11eb-b39c-227918fa15ea',NULL,'ç”³è¯·äººç¡®è®¤','userTask','admin','2020-11-23 21:25:03.547',NULL,3,NULL,NULL,''),
('df3615e5-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea','startEvent1',NULL,NULL,'å¡«å•','startEvent',NULL,'2020-11-25 02:40:29.153','2020-11-25 02:40:29.163',1,10,NULL,''),
('df37eaa8-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea','sid-FB957372-CC09-424B-88F0-30C09C3C100F',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-25 02:40:29.166','2020-11-25 02:40:29.166',2,0,NULL,''),
('df3811b9-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','df3db70a-2ef9-11eb-aabd-227918fa15ea',NULL,'ç”³è¯·äººç¡®è®¤','userTask',NULL,'2020-11-25 02:40:29.166','2020-11-25 02:40:29.205',3,39,NULL,''),
('df3e052b-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea','sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-25 02:40:29.205','2020-11-25 02:40:29.205',4,0,NULL,''),
('df3e052c-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea','sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175','df3e2c3d-2ef9-11eb-aabd-227918fa15ea',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','manager','2020-11-25 02:40:29.205',NULL,5,NULL,NULL,''),
('f260e631-2e06-11eb-bbd8-227918fa15ea',1,'out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea','f25f869a-2e06-11eb-bbd8-227918fa15ea','f260e630-2e06-11eb-bbd8-227918fa15ea','startEvent1',NULL,NULL,'å¡«å•','startEvent',NULL,'2020-11-23 21:41:33.606','2020-11-23 21:41:33.617',1,11,NULL,''),
('f2637e44-2e06-11eb-bbd8-227918fa15ea',1,'out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea','f25f869a-2e06-11eb-bbd8-227918fa15ea','f260e630-2e06-11eb-bbd8-227918fa15ea','sid-FB957372-CC09-424B-88F0-30C09C3C100F',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-23 21:41:33.622','2020-11-23 21:41:33.622',2,0,NULL,''),
('f2637e45-2e06-11eb-bbd8-227918fa15ea',1,'out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea','f25f869a-2e06-11eb-bbd8-227918fa15ea','f260e630-2e06-11eb-bbd8-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','f2692396-2e06-11eb-bbd8-227918fa15ea',NULL,'ç”³è¯·äººç¡®è®¤','userTask','admin','2020-11-23 21:41:33.622',NULL,3,NULL,NULL,''),
('f87f6b35-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea','startEvent1',NULL,NULL,'å¡«å•','startEvent',NULL,'2020-11-23 22:17:31.355','2020-11-23 22:17:31.368',1,13,NULL,''),
('f881b528-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea','sid-FB957372-CC09-424B-88F0-30C09C3C100F',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-23 22:17:31.370','2020-11-23 22:17:31.370',2,0,NULL,''),
('f881b529-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','f885d3da-2e0b-11eb-b5e4-227918fa15ea',NULL,'ç”³è¯·äººç¡®è®¤','userTask',NULL,'2020-11-23 22:17:31.370','2020-11-23 22:17:31.398',3,28,NULL,''),
('f885faeb-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea','sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-23 22:17:31.398','2020-11-23 22:17:31.398',4,0,NULL,''),
('f885faec-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea','sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175','f88621fd-2e0b-11eb-b5e4-227918fa15ea',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','manager','2020-11-23 22:17:31.398',NULL,5,NULL,NULL,'');

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
('3b4275c5-2e04-11eb-8e8e-227918fa15ea',1,'3b4275c5-2e04-11eb-8e8e-227918fa15ea',NULL,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','2020-11-23 21:22:07.389',NULL,NULL,'admin','startEvent1',NULL,NULL,NULL,'','å¤–å‡ºå• - November 24th 2020',NULL,NULL,NULL,NULL),
('a43e38b5-2e04-11eb-b39c-227918fa15ea',1,'a43e38b5-2e04-11eb-b39c-227918fa15ea',NULL,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','2020-11-23 21:25:03.522',NULL,NULL,'admin','startEvent1',NULL,NULL,NULL,'','å¤–å‡ºå•-2020 11 24',NULL,NULL,NULL,NULL),
('df35046b-2ef9-11eb-aabd-227918fa15ea',1,'df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','2020-11-25 02:40:29.146',NULL,NULL,'user','startEvent1',NULL,NULL,NULL,'','å¤–å‡ºå•-2020 11 25',NULL,NULL,NULL,NULL),
('f25f869a-2e06-11eb-bbd8-227918fa15ea',1,'f25f869a-2e06-11eb-bbd8-227918fa15ea',NULL,'out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea','2020-11-23 21:41:33.596',NULL,NULL,'admin','startEvent1',NULL,NULL,NULL,'','å¤–å‡ºå•-2020 11 24',NULL,NULL,NULL,NULL),
('f87e80cb-2e0b-11eb-b5e4-227918fa15ea',1,'f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','2020-11-23 22:17:31.349',NULL,NULL,'admin','startEvent1',NULL,NULL,NULL,'','å¤–å‡ºå•-2020 11 24',NULL,NULL,NULL,NULL);

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
('3b4b7581-2e04-11eb-8e8e-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea',NULL,'sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','3b4275c5-2e04-11eb-8e8e-227918fa15ea','3b43120b-2e04-11eb-8e8e-227918fa15ea',NULL,NULL,NULL,NULL,NULL,'ç”³è¯·äººç¡®è®¤',NULL,NULL,NULL,'admin','2020-11-23 21:22:07.409',NULL,NULL,NULL,NULL,50,'2020-11-29 05:22:07.460','out-factory',NULL,'','2020-11-23 21:22:07.460'),
('a44ae2f1-2e04-11eb-b39c-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea',NULL,'sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','a43e38b5-2e04-11eb-b39c-227918fa15ea','a43f713b-2e04-11eb-b39c-227918fa15ea',NULL,NULL,NULL,NULL,NULL,'ç”³è¯·äººç¡®è®¤',NULL,NULL,NULL,'admin','2020-11-23 21:25:03.547',NULL,NULL,NULL,NULL,50,'2020-11-29 05:25:03.618','out-factory',NULL,'','2020-11-23 21:25:03.620'),
('df3db70a-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea',NULL,'sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea',NULL,NULL,NULL,NULL,NULL,'ç”³è¯·äººç¡®è®¤',NULL,NULL,NULL,NULL,'2020-11-25 02:40:29.166',NULL,'2020-11-25 02:40:29.205',39,NULL,50,NULL,'out-factory',NULL,'','2020-11-25 02:40:29.205'),
('df3e2c3d-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea',NULL,'sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea',NULL,NULL,NULL,NULL,NULL,'ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'manager','2020-11-25 02:40:29.205',NULL,NULL,NULL,NULL,50,'2020-11-30 10:40:29.213','out-factory',NULL,'','2020-11-25 02:40:29.214'),
('f2692396-2e06-11eb-bbd8-227918fa15ea',1,'out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea',NULL,'sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','f25f869a-2e06-11eb-bbd8-227918fa15ea','f260e630-2e06-11eb-bbd8-227918fa15ea',NULL,NULL,NULL,NULL,NULL,'ç”³è¯·äººç¡®è®¤',NULL,NULL,NULL,'admin','2020-11-23 21:41:33.622',NULL,NULL,NULL,NULL,50,'2020-11-29 05:41:33.667','out-factory',NULL,'','2020-11-23 21:41:33.669'),
('f885d3da-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea',NULL,'sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea',NULL,NULL,NULL,NULL,NULL,'ç”³è¯·äººç¡®è®¤',NULL,NULL,NULL,NULL,'2020-11-23 22:17:31.370',NULL,'2020-11-23 22:17:31.398',28,NULL,50,NULL,'out-factory',NULL,'','2020-11-23 22:17:31.398'),
('f88621fd-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea',NULL,'sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea',NULL,NULL,NULL,NULL,NULL,'ä¸»ç®¡å®¡æ ¸',NULL,NULL,NULL,'manager','2020-11-23 22:17:31.399',NULL,NULL,NULL,NULL,50,'2020-11-29 06:17:31.405','out-factory',NULL,'','2020-11-23 22:17:31.406');

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
('0022361f-2e08-11eb-bbd8-227918fa15ea','å¤–å‡ºå•',NULL,'out-factory','','2020-11-23 21:49:06.179',NULL,NULL,'0020fd9a-2e08-11eb-bbd8-227918fa15ea',NULL),
('2cbc1317-2d3d-11eb-a3a6-227918fa15ea','???',NULL,NULL,'','2020-11-22 21:37:13.170',NULL,NULL,'2cbc1317-2d3d-11eb-a3a6-227918fa15ea',NULL),
('59d51654-2bc9-11eb-9d15-227918fa15ea','å¤–å‡ºå•',NULL,'out-factory','','2020-11-21 01:15:36.049',NULL,NULL,'59d4c82f-2bc9-11eb-9d15-227918fa15ea',NULL),
('5c0b5345-2d58-11eb-b88c-227918fa15ea','è¿”å» ç”³è«‹å–®',NULL,'rehire-form','','2020-11-23 00:51:48.955',NULL,NULL,'5c0ab700-2d58-11eb-b88c-227918fa15ea',NULL),
('6748cd32-2bc8-11eb-9d15-227918fa15ea','å¤–å‡ºå•',NULL,'out-factory','','2020-11-21 01:08:49.121',NULL,NULL,'6747bbbd-2bc8-11eb-9d15-227918fa15ea',NULL),
('6d8cddab-2e03-11eb-8edb-227918fa15ea','å¤–å‡ºå•',NULL,'out-factory','','2020-11-23 21:16:22.266',NULL,NULL,'6d8b08e6-2e03-11eb-8edb-227918fa15ea',NULL),
('78512f99-2e06-11eb-84ba-227918fa15ea','å¤–å‡ºå•',NULL,'out-factory','','2020-11-23 21:38:08.820',NULL,NULL,'784ff714-2e06-11eb-84ba-227918fa15ea',NULL),
('9c68405d-2d55-11eb-b88c-227918fa15ea','MESéœ€æ±‚å˜æ›´',NULL,'mes-requirement','','2020-11-23 00:32:08.448',NULL,NULL,'9c6707d8-2d55-11eb-b88c-227918fa15ea',NULL),
('9f32daaa-2e0b-11eb-b42b-227918fa15ea','å¤–å‡ºå•',NULL,'out-factory','','2020-11-23 22:15:01.536',NULL,NULL,'9f3105e5-2e0b-11eb-b42b-227918fa15ea',NULL),
('a63745e4-2e00-11eb-8699-227918fa15ea','å¤–å‡ºå•',NULL,'out-factory','','2020-11-23 20:56:28.845',NULL,NULL,'a6360d5f-2e00-11eb-8699-227918fa15ea',NULL),
('a83f9a9f-2d56-11eb-b88c-227918fa15ea','è”ç»œå•',NULL,'liaison','','2020-11-23 00:39:37.811',NULL,NULL,'a83efe5a-2d56-11eb-b88c-227918fa15ea',NULL),
('be835938-2d29-11eb-b92b-227918fa15ea','å‘é€é‚®ä»¶',NULL,'send-email','','2020-11-22 19:18:07.812',NULL,NULL,'be8247c4-2d29-11eb-b92b-227918fa15ea',NULL),
('ce86aff3-2d57-11eb-b88c-227918fa15ea','FIå‚å•†ä»£ç ç”³è¯·å•',NULL,'vendor-code-request-form','','2020-11-23 00:47:51.527',NULL,NULL,'ce8661ce-2d57-11eb-b88c-227918fa15ea',NULL),
('d507c502-2d28-11eb-9045-227918fa15ea','å‘é€é‚®ä»¶',NULL,'send-email','','2020-11-22 19:11:36.093',NULL,NULL,'d4fc7a5e-2d28-11eb-9045-227918fa15ea',NULL),
('f1bf70e4-2d24-11eb-84d4-227918fa15ea','å‘é€é‚®ä»¶',NULL,'send-email','','2020-11-22 18:43:46.286',NULL,NULL,'f1be3860-2d24-11eb-84d4-227918fa15ea',NULL),
('faa37fb9-2d29-11eb-9782-227918fa15ea','å‘é€é‚®ä»¶',NULL,'send-email','','2020-11-22 19:19:48.686',NULL,NULL,'faa1aaf5-2d29-11eb-9782-227918fa15ea',NULL),
('fcbd1e55-2bcb-11eb-9e90-227918fa15ea','å¤–å‡ºå•',NULL,'out-factory','','2020-11-21 01:34:28.354',NULL,NULL,'fcbc33f0-2bcb-11eb-9e90-227918fa15ea',NULL);

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
('liaison:1:a866aaa2-2d56-11eb-b88c-227918fa15ea',3,'è‡ªå®šä¹‰æµç¨‹è¡¨å•','è”ç»œå•','liaison',1,'a83f9a9f-2d56-11eb-b88c-227918fa15ea','liaison.bpmn','liaison.liaison.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('mes-requirement:1:9ca6d000-2d55-11eb-b88c-227918fa15ea',2,'è‡ªå®šä¹‰æµç¨‹è¡¨å•','MESéœ€æ±‚å˜æ›´','mes-requirement',1,'9c68405d-2d55-11eb-b88c-227918fa15ea','mes-requirement.bpmn','mes-requirement.mes-requirement.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('out-factory:1:678dc575-2bc8-11eb-9d15-227918fa15ea',1,'http://www.flowable.org/processdef','å¤–å‡ºå•','out-factory',1,'6748cd32-2bc8-11eb-9d15-227918fa15ea','out-factory.bpmn','out-factory.out-factory.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('out-factory:2:59f74457-2bc9-11eb-9d15-227918fa15ea',1,'http://www.flowable.org/processdef','å¤–å‡ºå•','out-factory',2,'59d51654-2bc9-11eb-9d15-227918fa15ea','out-factory.bpmn','out-factory.out-factory.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('out-factory:3:fcf40cd8-2bcb-11eb-9e90-227918fa15ea',1,'http://www.flowable.org/processdef','å¤–å‡ºå•','out-factory',3,'fcbd1e55-2bcb-11eb-9e90-227918fa15ea','out-factory.bpmn','out-factory.out-factory.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('out-factory:4:2d2b9dca-2d3d-11eb-a3a6-227918fa15ea',2,'å›ºå®šæµç¨‹è¡¨å•','å¤–å‡ºå•','out-factory',4,'2cbc1317-2d3d-11eb-a3a6-227918fa15ea','???.bpmn20.xml','???.out-factory.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('out-factory:5:a68b8067-2e00-11eb-8699-227918fa15ea',2,'å›ºå®šæµç¨‹è¡¨å•','å¤–å‡ºå•','out-factory',5,'a63745e4-2e00-11eb-8699-227918fa15ea','out-factory.bpmn','out-factory.out-factory.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea',1,'http://www.flowable.org/processdef','å¤–å‡ºå•','out-factory',6,'6d8cddab-2e03-11eb-8edb-227918fa15ea','out-factory.bpmn','out-factory.out-factory.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea',1,'http://www.flowable.org/processdef','å¤–å‡ºå•','out-factory',7,'78512f99-2e06-11eb-84ba-227918fa15ea','out-factory.bpmn','out-factory.out-factory.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('out-factory:8:00860102-2e08-11eb-bbd8-227918fa15ea',2,'å›ºå®šæµç¨‹è¡¨å•','å¤–å‡ºå•','out-factory',8,'0022361f-2e08-11eb-bbd8-227918fa15ea','out-factory.bpmn','out-factory.out-factory.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea',2,'å›ºå®šæµç¨‹è¡¨å•','å¤–å‡ºå•','out-factory',9,'9f32daaa-2e0b-11eb-b42b-227918fa15ea','out-factory.bpmn','out-factory.out-factory.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('rehire-form:1:5c2e1d88-2d58-11eb-b88c-227918fa15ea',3,'å¤šéƒ¨é—¨å‚ä¸è¡¨å•','è¿”å» ç”³è«‹å–®','rehire-form',1,'5c0b5345-2d58-11eb-b88c-227918fa15ea','rehire-form.bpmn','rehire-form.rehire-form.png',NULL,1,1,1,'',NULL,NULL,NULL,0),
('send-email:1:f20860c7-2d24-11eb-84d4-227918fa15ea',1,'http://www.flowable.org/processdef','å‘é€é‚®ä»¶','send-email',1,'f1bf70e4-2d24-11eb-84d4-227918fa15ea','send-email.bpmn','send-email.send-email.png',NULL,0,1,1,'',NULL,NULL,NULL,0),
('send-email:2:d555e505-2d28-11eb-9045-227918fa15ea',1,'http://www.flowable.org/processdef','å‘é€é‚®ä»¶','send-email',2,'d507c502-2d28-11eb-9045-227918fa15ea','send-email.bpmn','send-email.send-email.png',NULL,0,1,1,'',NULL,NULL,NULL,0),
('send-email:3:beec543b-2d29-11eb-b92b-227918fa15ea',1,'http://www.flowable.org/processdef','å‘é€é‚®ä»¶','send-email',3,'be835938-2d29-11eb-b92b-227918fa15ea','send-email.bpmn','send-email.send-email.png',NULL,0,1,1,'',NULL,NULL,NULL,0),
('send-email:4:faff826c-2d29-11eb-9782-227918fa15ea',1,'http://www.flowable.org/processdef','å‘é€é‚®ä»¶','send-email',4,'faa37fb9-2d29-11eb-9782-227918fa15ea','send-email.bpmn','send-email.send-email.png',NULL,0,1,1,'',NULL,NULL,NULL,0),
('vendor-code-request-form:1:ceaa3d86-2d57-11eb-b88c-227918fa15ea',3,'æ¶‰åŠæƒé™è¡¨å•','FIå» å•†ä»£ç¢¼ç”³è«‹å–®','vendor-code-request-form',1,'ce86aff3-2d57-11eb-b88c-227918fa15ea','vendor-code-request-form.bpmn','vendor-code-request-form.vendor-code-request-form.png',NULL,1,1,1,'',NULL,NULL,NULL,0);

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
('3b43120c-2e04-11eb-8e8e-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','3b4275c5-2e04-11eb-8e8e-227918fa15ea','3b43120b-2e04-11eb-8e8e-227918fa15ea','startEvent1',NULL,NULL,'å¡«å•','startEvent',NULL,'2020-11-23 21:22:07.393','2020-11-23 21:22:07.409',16,1,NULL,''),
('3b45830f-2e04-11eb-8e8e-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','3b4275c5-2e04-11eb-8e8e-227918fa15ea','3b43120b-2e04-11eb-8e8e-227918fa15ea','sid-FB957372-CC09-424B-88F0-30C09C3C100F',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-23 21:22:07.409','2020-11-23 21:22:07.409',0,2,NULL,''),
('3b458310-2e04-11eb-8e8e-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','3b4275c5-2e04-11eb-8e8e-227918fa15ea','3b43120b-2e04-11eb-8e8e-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','3b4b7581-2e04-11eb-8e8e-227918fa15ea',NULL,'ç”³è¯·äººç¡®è®¤','userTask','admin','2020-11-23 21:22:07.409',NULL,NULL,3,NULL,''),
('a43f984c-2e04-11eb-b39c-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','a43e38b5-2e04-11eb-b39c-227918fa15ea','a43f713b-2e04-11eb-b39c-227918fa15ea','startEvent1',NULL,NULL,'å¡«å•','startEvent',NULL,'2020-11-23 21:25:03.531','2020-11-23 21:25:03.544',13,1,NULL,''),
('a442094f-2e04-11eb-b39c-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','a43e38b5-2e04-11eb-b39c-227918fa15ea','a43f713b-2e04-11eb-b39c-227918fa15ea','sid-FB957372-CC09-424B-88F0-30C09C3C100F',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-23 21:25:03.547','2020-11-23 21:25:03.547',0,2,NULL,''),
('a4420950-2e04-11eb-b39c-227918fa15ea',1,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea','a43e38b5-2e04-11eb-b39c-227918fa15ea','a43f713b-2e04-11eb-b39c-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','a44ae2f1-2e04-11eb-b39c-227918fa15ea',NULL,'ç”³è¯·äººç¡®è®¤','userTask','admin','2020-11-23 21:25:03.547',NULL,NULL,3,NULL,''),
('df3615e5-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea','startEvent1',NULL,NULL,'å¡«å•','startEvent',NULL,'2020-11-25 02:40:29.153','2020-11-25 02:40:29.163',10,1,NULL,''),
('df37eaa8-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea','sid-FB957372-CC09-424B-88F0-30C09C3C100F',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-25 02:40:29.166','2020-11-25 02:40:29.166',0,2,NULL,''),
('df3811b9-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','df3db70a-2ef9-11eb-aabd-227918fa15ea',NULL,'ç”³è¯·äººç¡®è®¤','userTask',NULL,'2020-11-25 02:40:29.166','2020-11-25 02:40:29.205',39,3,NULL,''),
('df3e052b-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea','sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-25 02:40:29.205','2020-11-25 02:40:29.205',0,4,NULL,''),
('df3e052c-2ef9-11eb-aabd-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea','df3615e4-2ef9-11eb-aabd-227918fa15ea','sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175','df3e2c3d-2ef9-11eb-aabd-227918fa15ea',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','manager','2020-11-25 02:40:29.205',NULL,NULL,5,NULL,''),
('f260e631-2e06-11eb-bbd8-227918fa15ea',1,'out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea','f25f869a-2e06-11eb-bbd8-227918fa15ea','f260e630-2e06-11eb-bbd8-227918fa15ea','startEvent1',NULL,NULL,'å¡«å•','startEvent',NULL,'2020-11-23 21:41:33.606','2020-11-23 21:41:33.617',11,1,NULL,''),
('f2637e44-2e06-11eb-bbd8-227918fa15ea',1,'out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea','f25f869a-2e06-11eb-bbd8-227918fa15ea','f260e630-2e06-11eb-bbd8-227918fa15ea','sid-FB957372-CC09-424B-88F0-30C09C3C100F',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-23 21:41:33.622','2020-11-23 21:41:33.622',0,2,NULL,''),
('f2637e45-2e06-11eb-bbd8-227918fa15ea',1,'out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea','f25f869a-2e06-11eb-bbd8-227918fa15ea','f260e630-2e06-11eb-bbd8-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','f2692396-2e06-11eb-bbd8-227918fa15ea',NULL,'ç”³è¯·äººç¡®è®¤','userTask','admin','2020-11-23 21:41:33.622',NULL,NULL,3,NULL,''),
('f87f6b35-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea','startEvent1',NULL,NULL,'å¡«å•','startEvent',NULL,'2020-11-23 22:17:31.355','2020-11-23 22:17:31.368',13,1,NULL,''),
('f881b528-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea','sid-FB957372-CC09-424B-88F0-30C09C3C100F',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-23 22:17:31.370','2020-11-23 22:17:31.370',0,2,NULL,''),
('f881b529-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB','f885d3da-2e0b-11eb-b5e4-227918fa15ea',NULL,'ç”³è¯·äººç¡®è®¤','userTask',NULL,'2020-11-23 22:17:31.370','2020-11-23 22:17:31.398',28,3,NULL,''),
('f885faeb-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea','sid-D2A7423F-91E0-430D-AA1A-09A1C246CA40',NULL,NULL,NULL,'sequenceFlow',NULL,'2020-11-23 22:17:31.398','2020-11-23 22:17:31.398',0,4,NULL,''),
('f885faec-2e0b-11eb-b5e4-227918fa15ea',1,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','f87f6b34-2e0b-11eb-b5e4-227918fa15ea','sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175','f88621fd-2e0b-11eb-b5e4-227918fa15ea',NULL,'ä¸»ç®¡å®¡æ ¸','userTask','manager','2020-11-23 22:17:31.398',NULL,NULL,5,NULL,'');

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
('3b4275c5-2e04-11eb-8e8e-227918fa15ea',1,'3b4275c5-2e04-11eb-8e8e-227918fa15ea',NULL,NULL,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea',NULL,'3b4275c5-2e04-11eb-8e8e-227918fa15ea',NULL,1,0,1,0,0,1,NULL,'','å¤–å‡ºå• - November 24th 2020','startEvent1','2020-11-23 21:22:07.389','admin',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
('3b43120b-2e04-11eb-8e8e-227918fa15ea',1,'3b4275c5-2e04-11eb-8e8e-227918fa15ea',NULL,'3b4275c5-2e04-11eb-8e8e-227918fa15ea','out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea',NULL,'3b4275c5-2e04-11eb-8e8e-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB',1,0,0,0,0,1,NULL,'',NULL,NULL,'2020-11-23 21:22:07.393',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
('a43e38b5-2e04-11eb-b39c-227918fa15ea',1,'a43e38b5-2e04-11eb-b39c-227918fa15ea',NULL,NULL,'out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea',NULL,'a43e38b5-2e04-11eb-b39c-227918fa15ea',NULL,1,0,1,0,0,1,NULL,'','å¤–å‡ºå•-2020 11 24','startEvent1','2020-11-23 21:25:03.522','admin',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
('a43f713b-2e04-11eb-b39c-227918fa15ea',1,'a43e38b5-2e04-11eb-b39c-227918fa15ea',NULL,'a43e38b5-2e04-11eb-b39c-227918fa15ea','out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea',NULL,'a43e38b5-2e04-11eb-b39c-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB',1,0,0,0,0,1,NULL,'',NULL,NULL,'2020-11-23 21:25:03.530',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
('df35046b-2ef9-11eb-aabd-227918fa15ea',1,'df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,NULL,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea',NULL,'df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,1,0,1,0,0,1,NULL,'','å¤–å‡ºå•-2020 11 25','startEvent1','2020-11-25 02:40:29.146','user',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
('df3615e4-2ef9-11eb-aabd-227918fa15ea',1,'df35046b-2ef9-11eb-aabd-227918fa15ea',NULL,'df35046b-2ef9-11eb-aabd-227918fa15ea','out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea',NULL,'df35046b-2ef9-11eb-aabd-227918fa15ea','sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175',1,0,0,0,0,1,NULL,'',NULL,NULL,'2020-11-25 02:40:29.153',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
('f25f869a-2e06-11eb-bbd8-227918fa15ea',1,'f25f869a-2e06-11eb-bbd8-227918fa15ea',NULL,NULL,'out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea',NULL,'f25f869a-2e06-11eb-bbd8-227918fa15ea',NULL,1,0,1,0,0,1,NULL,'','å¤–å‡ºå•-2020 11 24','startEvent1','2020-11-23 21:41:33.596','admin',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
('f260e630-2e06-11eb-bbd8-227918fa15ea',1,'f25f869a-2e06-11eb-bbd8-227918fa15ea',NULL,'f25f869a-2e06-11eb-bbd8-227918fa15ea','out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea',NULL,'f25f869a-2e06-11eb-bbd8-227918fa15ea','sid-E086BDD7-66B2-409F-B18C-B682DD9172DB',1,0,0,0,0,1,NULL,'',NULL,NULL,'2020-11-23 21:41:33.605',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
('f87e80cb-2e0b-11eb-b5e4-227918fa15ea',1,'f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,NULL,'out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea',NULL,'f87e80cb-2e0b-11eb-b5e4-227918fa15ea',NULL,1,0,1,0,0,1,NULL,'','å¤–å‡ºå•-2020 11 24','startEvent1','2020-11-23 22:17:31.349','admin',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL),
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
('3b4b7581-2e04-11eb-8e8e-227918fa15ea',1,'3b43120b-2e04-11eb-8e8e-227918fa15ea','3b4275c5-2e04-11eb-8e8e-227918fa15ea','out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,'ç”³è¯·äººç¡®è®¤',NULL,NULL,'sid-E086BDD7-66B2-409F-B18C-B682DD9172DB',NULL,'admin',NULL,50,'2020-11-23 21:22:07.409','2020-11-29 05:22:07.460',NULL,1,'','out-factory',NULL,1,0,0,0),
('a44ae2f1-2e04-11eb-b39c-227918fa15ea',1,'a43f713b-2e04-11eb-b39c-227918fa15ea','a43e38b5-2e04-11eb-b39c-227918fa15ea','out-factory:6:6dda616e-2e03-11eb-8edb-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,'ç”³è¯·äººç¡®è®¤',NULL,NULL,'sid-E086BDD7-66B2-409F-B18C-B682DD9172DB',NULL,'admin',NULL,50,'2020-11-23 21:25:03.547','2020-11-29 05:25:03.618',NULL,1,'','out-factory',NULL,1,0,0,0),
('df3e2c3d-2ef9-11eb-aabd-227918fa15ea',1,'df3615e4-2ef9-11eb-aabd-227918fa15ea','df35046b-2ef9-11eb-aabd-227918fa15ea','out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,'ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175',NULL,'manager',NULL,50,'2020-11-25 02:40:29.205','2020-11-30 10:40:29.213',NULL,1,'','out-factory',NULL,1,0,0,0),
('f2692396-2e06-11eb-bbd8-227918fa15ea',1,'f260e630-2e06-11eb-bbd8-227918fa15ea','f25f869a-2e06-11eb-bbd8-227918fa15ea','out-factory:7:78a9fdfc-2e06-11eb-84ba-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,'ç”³è¯·äººç¡®è®¤',NULL,NULL,'sid-E086BDD7-66B2-409F-B18C-B682DD9172DB',NULL,'admin',NULL,50,'2020-11-23 21:41:33.622','2020-11-29 05:41:33.667',NULL,1,'','out-factory',NULL,1,0,0,0),
('f88621fd-2e0b-11eb-b5e4-227918fa15ea',1,'f87f6b34-2e0b-11eb-b5e4-227918fa15ea','f87e80cb-2e0b-11eb-b5e4-227918fa15ea','out-factory:9:9fcde22d-2e0b-11eb-b42b-227918fa15ea',NULL,NULL,NULL,NULL,NULL,NULL,'ä¸»ç®¡å®¡æ ¸',NULL,NULL,'sid-ABCBD09C-DB79-4EE8-BB28-96FEBAAFF175',NULL,'manager',NULL,50,'2020-11-23 22:17:31.399','2020-11-29 06:17:31.405',NULL,1,'','out-factory',NULL,1,0,0,0);

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
