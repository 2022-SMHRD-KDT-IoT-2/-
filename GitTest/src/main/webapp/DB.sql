DROP TABLE t_user CASCADE CONSTRAINTS ;
DROP TABLE t_iot CASCADE CONSTRAINTS;
DROP TABLE t_request CASCADE CONSTRAINTS;
DROP TABLE t_report CASCADE CONSTRAINTS;
DROP TABLE t_advertise CASCADE CONSTRAINTS;

DROP TRIGGER t_iot_AI_TRG;
DROP SEQUENCE t_iot_SEQ;
DROP SEQUENCE t_request_SEQ;
DROP TRIGGER t_request_AI_TRG;
DROP TRIGGER t_report_AI_TRG;
DROP SEQUENCE t_report_SEQ;
DROP TRIGGER t_advertise_AI_TRG;
DROP SEQUENCE t_advertise_SEQ;

-- ���̺� ������ ���踦 ����Ͽ� �� ���� �����ص� ������ �߻����� �ʰ� ���ĵǾ����ϴ�.

-- t_user Table Create SQL
CREATE TABLE t_user
(
    user_id          VARCHAR2(30)     NOT NULL, 
    user_pw          VARCHAR2(30)     NOT NULL, 
    user_name        VARCHAR2(30)     NOT NULL, 
    user_phone       VARCHAR2(30)     NOT NULL, 
    user_email       VARCHAR2(50)     NOT NULL, 
    user_addr        VARCHAR2(200)    NOT NULL, 
    admin_yn         CHAR(1)          DEFAULT 'N' NOT NULL, 
    user_joindate    DATE             DEFAULT SYSDATE NOT NULL, 
     PRIMARY KEY (user_id)
);

COMMENT ON TABLE t_user IS '����� ���̺�';
COMMENT ON COLUMN t_user.user_id IS '����� ���̵�';
COMMENT ON COLUMN t_user.user_pw IS '����� ��й�ȣ';
COMMENT ON COLUMN t_user.user_name IS '����� �̸�';
COMMENT ON COLUMN t_user.user_phone IS '����� ��ȭ��ȣ';
COMMENT ON COLUMN t_user.user_email IS '����� �̸���';
COMMENT ON COLUMN t_user.user_addr IS '����� �ּ�';
COMMENT ON COLUMN t_user.admin_yn IS '������ ����';
COMMENT ON COLUMN t_user.user_joindate IS '����� ��������';


-- t_iot Table Create SQL
CREATE TABLE t_iot
(
    product_seq          NUMBER(12, 0)     NOT NULL, 
    product_uid          VARCHAR2(30)      NOT NULL, 
    product_loc          VARCHAR2(50)      NOT NULL, 
    product_latitude     NUMBER(17, 14)    NOT NULL, 
    product_longitude    NUMBER(17, 14)    NOT NULL, 
    product_date         DATE              DEFAULT SYSDATE NOT NULL, 
    user_id              VARCHAR2(30)      NOT NULL, 
     PRIMARY KEY (product_seq)
);



CREATE SEQUENCE t_iot_SEQ
START WITH 1
INCREMENT BY 1;


CREATE OR REPLACE TRIGGER t_iot_AI_TRG
BEFORE INSERT ON t_iot 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_iot_SEQ.NEXTVAL
    INTO :NEW.product_seq
    FROM DUAL;
END;


COMMENT ON TABLE t_iot IS '������Ʈ ��ġ ���̺�';
COMMENT ON COLUMN t_iot.product_seq IS '������Ʈ ����';
COMMENT ON COLUMN t_iot.product_uid IS '������Ʈ ���̵�';
COMMENT ON COLUMN t_iot.product_loc IS '��ġ ��ġ';
COMMENT ON COLUMN t_iot.product_latitude IS '����';
COMMENT ON COLUMN t_iot.product_longitude IS '�浵';
COMMENT ON COLUMN t_iot.product_date IS '��ġ ����';
COMMENT ON COLUMN t_iot.user_id IS '������ ���̵�';


ALTER TABLE t_iot
    ADD CONSTRAINT FK_t_iot_user_id_t_user_user_i FOREIGN KEY (user_id)
        REFERENCES t_user (user_id);



-- t_request Table Create SQL
CREATE TABLE t_request
(
    request_seq       NUMBER(12, 0)    NOT NULL, 
    request_loc       VARCHAR2(200)    NOT NULL, 
    request_name      VARCHAR2(30)     NOT NULL, 
    request_phone     VARCHAR2(30)     NOT NULL, 
    request_date      DATE             DEFAULT SYSDATE NOT NULL, 
    request_status    CHAR(1)          NOT NULL, 
    user_id           VARCHAR2(30)     NOT NULL, 
     PRIMARY KEY (request_seq)
);


CREATE SEQUENCE t_request_SEQ
START WITH 1
INCREMENT BY 1;


CREATE OR REPLACE TRIGGER t_request_AI_TRG
BEFORE INSERT ON t_request 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_request_SEQ.NEXTVAL
    INTO :NEW.request_seq
    FROM DUAL;
END;

COMMENT ON TABLE t_request IS '��ġ ��û ���̺�';
COMMENT ON COLUMN t_request.request_seq IS '��û ����';
COMMENT ON COLUMN t_request.request_loc IS '��ġ ��û ���';
COMMENT ON COLUMN t_request.request_name IS '��û�� �̸�';
COMMENT ON COLUMN t_request.request_phone IS '��û�� ��ȭ';
COMMENT ON COLUMN t_request.request_date IS '��û ����';
COMMENT ON COLUMN t_request.request_status IS 'ó�� ����';
COMMENT ON COLUMN t_request.user_id IS '������ ���̵�';


ALTER TABLE t_request
    ADD CONSTRAINT FK_t_request_user_id_t_user_us FOREIGN KEY (user_id)
        REFERENCES t_user (user_id);



-- t_report Table Create SQL
CREATE TABLE t_report
(
    report_seq        NUMBER(12, 0)     NOT NULL, 
    reporter_name     VARCHAR2(30)      NOT NULL, 
    reporter_phone    VARCHAR2(30)      NOT NULL, 
    product_seq       NUMBER(12, 0)     NOT NULL, 
    report_content    VARCHAR2(4000)    NOT NULL, 
    report_date       DATE              DEFAULT SYSDATE NOT NULL, 
     PRIMARY KEY (report_seq)
);


CREATE SEQUENCE t_report_SEQ
START WITH 1
INCREMENT BY 1;


CREATE OR REPLACE TRIGGER t_report_AI_TRG
BEFORE INSERT ON t_report 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_report_SEQ.NEXTVAL
    INTO :NEW.report_seq
    FROM DUAL;
END;



COMMENT ON TABLE t_report IS '���� ��ǰ �Ű� ���̺�';
COMMENT ON COLUMN t_report.report_seq IS '�Ű� ����';
COMMENT ON COLUMN t_report.reporter_name IS '�Ű��� �̸�';
COMMENT ON COLUMN t_report.reporter_phone IS '�Ű��� ��ȭ��ȣ';
COMMENT ON COLUMN t_report.product_seq IS '������Ʈ ����';
COMMENT ON COLUMN t_report.report_content IS '�Ű� ����';
COMMENT ON COLUMN t_report.report_date IS '�Ű� ����';


ALTER TABLE t_report
    ADD CONSTRAINT FK_t_report_product_seq_t_iot_ FOREIGN KEY (product_seq)
        REFERENCES t_iot (product_seq);


-- t_advertise Table Create SQL
CREATE TABLE t_advertise
(
    advertise_seq        NUMBER(12, 0)     NOT NULL, 
    product_seq          NUMBER(12, 0)     NOT NULL, 
    advertise_content    VARCHAR2(4000)    NOT NULL, 
    reg_date             DATE              DEFAULT SYSDATE NOT NULL, 
     PRIMARY KEY (advertise_seq)
);


CREATE SEQUENCE t_advertise_SEQ
START WITH 1
INCREMENT BY 1;


CREATE OR REPLACE TRIGGER t_advertise_AI_TRG
BEFORE INSERT ON t_advertise 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_advertise_SEQ.NEXTVAL
    INTO :NEW.advertise_seq
    FROM DUAL;
END;


COMMENT ON TABLE t_advertise IS '���� ���̺�';
COMMENT ON COLUMN t_advertise.advertise_seq IS '���� ����';
COMMENT ON COLUMN t_advertise.product_seq IS '������Ʈ ����';
COMMENT ON COLUMN t_advertise.advertise_content IS '���� ����';
COMMENT ON COLUMN t_advertise.reg_date IS '��� ����';

ALTER TABLE t_advertise
    ADD CONSTRAINT FK_t_advertise_product_seq_t_i FOREIGN KEY (product_seq)
        REFERENCES t_iot (product_seq);

