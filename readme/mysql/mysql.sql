# Logback: the reliable, generic, fast and flexible logging framework.
# Copyright (C) 1999-2010, QOS.ch. All rights reserved.
#
# See http://logback.qos.ch/license.html for the applicable licensing 
# conditions.

# This SQL script creates the required tables by ch.qos.logback.classic.db.DBAppender.
#
# It is intended for MySQL databases. It has been tested on MySQL 5.1.37 
# on Linux


BEGIN;
DROP TABLE IF EXISTS logging_event_property;
DROP TABLE IF EXISTS logging_event_exception;
DROP TABLE IF EXISTS logging_event;
COMMIT;


BEGIN;
CREATE TABLE logging_event 
  (
    timestmp         BIGINT NOT NULL COMMENT '������¼�¼���ʱ���',
    formatted_message  TEXT NOT NULL COMMENT '�� org.slf4j.impl.MessageFormatter  ��ʽ���󣬱���ӵ���¼�¼�����Ϣ��',
    logger_name       VARCHAR(254) NOT NULL COMMENT 'ִ�м�¼����� logger��',
    level_string      VARCHAR(254) NOT NULL COMMENT '��¼�¼��ļ���',
    thread_name       VARCHAR(254) COMMENT '��������',
    reference_flag    SMALLINT COMMENT '���ڱ�ʶ��Щ�������쳣�� MDCproperty  ֵ�ļ�¼�¼��� ��ֵ�� ch.qos.logback.classic.db.DBHelper ���㡣���� MDC�����������Եļ�¼�¼��� reference_flag �� 1�������쳣��reference_flag �� 2�����߶������� reference_flag �� 3��',
    arg0              VARCHAR(254) COMMENT '����1',
    arg1              VARCHAR(254) COMMENT '����2',
    arg2              VARCHAR(254) COMMENT '����3',
    arg3              VARCHAR(254) COMMENT '����4',
    caller_filename   VARCHAR(254) NOT NULL COMMENT 'ִ�м�¼������ļ����� ',
    caller_class      VARCHAR(254) NOT NULL COMMENT 'ִ�м�¼������ࡣ',
    caller_method     VARCHAR(254) NOT NULL COMMENT 'ִ�м�¼����ķ�����',
    caller_line       CHAR(4) NOT NULL COMMENT 'ִ�м�¼������кš�',
    event_id          BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '��¼�¼������ݿ� ID��'
  );
COMMIT;

BEGIN;
CREATE TABLE logging_event_property
  (
    event_id	      BIGINT NOT NULL,
    mapped_key        VARCHAR(254) NOT NULL,
    mapped_value      TEXT,
    PRIMARY KEY(event_id, mapped_key),
    FOREIGN KEY (event_id) REFERENCES logging_event(event_id)
  );
COMMIT;

BEGIN;
CREATE TABLE logging_event_exception
  (
    event_id         BIGINT NOT NULL,
    i                SMALLINT NOT NULL,
    trace_line       VARCHAR(254) NOT NULL,
    PRIMARY KEY(event_id, i),
    FOREIGN KEY (event_id) REFERENCES logging_event(event_id)
  ) COMMENT='��¼ϵͳ������Ϣ';
COMMIT;