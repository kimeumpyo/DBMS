-- �ּ� : �������� �ǰ��̳� ������ �޾Ƴ��°�
-- �������� �� ���α׷��� �ؼ����� ���մϴ�.
-- ���� �ּ� : --
-- ������ �ּ� : /*����*/

 /*
  * CREATE TABLE ���̺�� (
  * 	�÷���1 �ڷ���(����),
  * 	�÷���2 �ڷ���(����);
  * );
  * 	
  */
CREATE TABLE TBL_MEMBER(
	NAME VARCHAR2(10),
	AGE NUMBER(3)
);

-- TBL_MEMBER ������ �����ϱ�
-- DROP TABLE ���̺��;
DROP TABLE TBL_MEMBER;

-- �ڵ��� ���̺� ����
-- �������� : ���̺��� ������ �� Ư�� �÷��� ������ �ο��Ͽ� ������ �����͸� �˻��Ѵ�
-- �������� ����¹� 
-- CONSTRAINT �������Ǹ� ������������ (�÷���);
-- CONSTRAINT CAR_PK PRIMARY KEY(ID);
CREATE TABLE TBL_CAR(
	ID NUMBER,
	BRAND VARCHAR2(100),
	COLOR VARCHAR2(100),
	PRICE NUMBER,
	CONSTRAINT CAR_PK PRIMARY KEY(ID)
);

-- �������� ����
-- ALTER ���̺�� DROP CONSTRAINT �������� �̸�;
ALTER TABLE TBL_CAR DROP CONSTRAINT CAR_PK;

-- �������� �߰��ϱ�
-- ALTER TABLE ���̺�� ADD CONSTRAINT ���������̸� ������������(�÷���);
ALTER TABLE TBL_CAR ADD CONSTRAINT CAR_PK PRIMARY KEY(ID);

-- ���� ���̺�
CREATE TABLE TBL_ANIMAL(
	ID NUMBER PRIMARY KEY,
	"TYPE" VARCHAR2(100),-- ����Ŭ������ TYPE�� ��ɾ��̱� ������ �÷��� �̸����� ����ϰ� �ʹٸ� ""�ȿ� �־�� �Ѵ�.
	AGE NUMBER(2),
	FEED VARCHAR2(100)
);

-- ���� �������� �����ϱ�
ALTER TABLE TBL_ANIMAL DROP CONSTRAINT SYS_C006999;

-- �л� ���̺� ����
--  DEFAULT�� CHECK ��������
CREATE TABLE TBL_STUDENT(
	ID NUMBER, -- �й�
	NAME VARCHAR2(100),
	MAJOR VARCHAR2(100),-- DEFAULT(�⺻��), NOT NULL(����� �� ����)
	GENDER CHAR(1) DEFAULT 'W' NOT NULL CONSTRAINT BAN_CHAR CHECK(GENDER = 'M' OR GENDER = 'W'),
	BIRTH DATE CONSTRAINT BAN_DATE CHECK(BIRTH >= TO_DATE('1980-01-01','YYYY-MM-DD')),
	CONSTRAINT STD_PK PRIMARY KEY(ID)
);

INSERT INTO TBL_STUDENT
(ID, NAME, MAJOR, GENDER, BIRTH)
VALUES(0, 'ȫ�浿', '��ǻ�Ͱ���', 'W' , TO_DATE('1980-01-02','YYYY-MM-DD'));

SELECT ID, NAME, MAJOR, GENDER, BIRTH
FROM TBL_STUDENT;

INSERT INTO TBL_STUDENT
(ID, NAME, MAJOR, GENDER, BIRTH)
VALUES(1, 'ȫ�浿', '��ǻ�Ͱ���', 'W' , TO_DATE('1980-01-02','YYYY-MM-DD'));

INSERT INTO TBL_STUDENT
(ID, NAME, MAJOR, GENDER, BIRTH)
VALUES(2, 'ȫ�浿', '��ǻ�Ͱ���', 'M' , TO_DATE('1980-01-02','YYYY-MM-DD'));

INSERT INTO TBL_STUDENT
(ID, NAME, MAJOR, GENDER, BIRTH)
VALUES(3, 'ȫ�浿', '��ǻ�Ͱ���', 'M' , TO_DATE('2000-01-02','YYYY-MM-DD'));