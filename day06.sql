SELECT * FROM PLAYER;
-- PLAYER ���̺��� POSITION�� NULL�̸� '����'���� �ٲ� �� ����ϱ�
-- SELECT PLAYER_NAME "�����̸�", NVL("POSITION",'NULL') "������" FROM PLAYER;
SELECT PLAYER_NAME "�����̸�", NVL("POSITION",'����') "������" FROM PLAYER;

-- PLAYER ���̺��� POSITION�� NULL�̸� '����', �ƴϸ� 'Ȯ��'���� �ٲ㼭 ��ȸ�ϱ�.
-- 	SELECT PLAYER_NAME "�����̸�", NVL2("POSITION",'NULL','NOT NOLL') "������" FROM PLAYER;
	SELECT PLAYER_NAME "�����̸�", NVL2("POSITION",'Ȯ��','����') "������" FROM PLAYER;
	
-- PLAYER ���̺��� NATION�� NULL�� �ƴϸ� '���', NULL�̸� '�̵��'���� �����Ͽ� ����ϱ�
	SELECT PLAYER_NAME "�����̸�", NVL2(NATION,'���','�̵��') "����" FROM PLAYER;
	
--------------------------------------------------------------------------------------

-- 1. ������ �Լ�

	-- ���� ���ϴ� ������ / 
	SELECT SALARY, SALARY/2 FROM EMPLOYEES;
	
	-- �������� ���ϴ� ������  : MOD%
	-- 10�� 3���� ���� ������ -- ������ ���̺� (DUAL)
	SELECT MOD(10,3) FROM DUAL;
	
	-- EMPLOYEES���̺��� ���, �̸��� ����ϵ� ¦�� ����� ���� ����鸸 ��ȸ�ϱ�
	SELECT * FROM EMPLOYEES;
	SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES
	WHERE MOD(EMPLOYEE_ID,2)=0;
	
	-- ������ ū �� ���� ���� : CEIL();
	SELECT CEIL(3.14) FROM DUAL; -- (4)
	SELECT CEIL(-3.14) FROM DUAL; -- (-3)
	
	-- �ݿø� �Լ� : ROUND()
	SELECT ROUND(3.141592)FROM DUAL; -- (4)
	SELECT ROUND(3.141592,4)FROM DUAL; -- (3.1416)
	
	-- �����Լ� : TRUNC()
	SELECT TRUNC(3.9) FROM DUAL; -- (3)
	
	-- ������ ���� ���ϱ� : LENGTH()
	SELECT LENGTH('JOHN') FROM DUAL; -- (4)
	
	-- ������̺��� �̸��� ���̰� 6���̻��� ����� ���, �̸��� ���
	SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES
	WHERE LENGTH(FIRST_NAME)>=6;
	--WHERE FIRST_NAME LIKE '______%';
	
	-- �����1, 0�̸�0, ������ -1�� ��ȯ�ϴ� �Լ� SIGN()
	SELECT SIGN(-123),SIGN(0),SIGN(123) FROM DUAL;	-- (-1,0,1)
	
	-- ������ �����ִ� �Լ� POWER()
	SELECT POWER(3,2) FROM DUAL; -- (9)

-- 2. ������ �Լ�

	-- �����͸� �빮�ڷ� �ٲ��ִ� �Լ� UPPER()
	SELECT UPPER('abc') FROM DUAL;	-- (ABC)
	
	-- ������̺��� ��� ����� �̸��� �빮�ڷ� ����ϼ���.
	SELECT UPPER(FIRST_NAME) FROM EMPLOYEES;	-- ����̸� �빮�ڷ� ���
	
	-- ������̺��� michael�̶�� �̸��� ����� ���� ���, �̸�, ����, �Ի��� �˻�
	SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, HIRE_DATE
	FROM EMPLOYEES
	WHERE UPPER(FIRST_NAME) = UPPER('michael');

	-- ���� �ҹ��ڷ� �ٲ��ִ� �Լ� LOWER();
	SELECT LOWER('ABC')	FROM DUAL;		-- (abc)
	
	-- ���ϴ� ���ڿ��� �߶���� �Լ� SUBSTR();
	SELECT SUBSTR('GOOD MORNING', 8) FROM DUAL; -- 8��°���� (RNING)
	
	SELECT SUBSTR('GOOD MORNING', 8,2) FROM DUAL; -- 8.��°���� 2���ڸ� (RN)
	
	-- �ʿ��� ������ ��ü���ִ� �Լ� REPLACE()
	SELECT REPLACE ('GOOD MORNING','GOOD','HI') FROM DUAL; -- GOOD�� HI�� �ٲ�� ���

	-- ������̺��� �μ���ȣ�� 50���� ������� �̸��� ����ϵ�, �̸��� 'el'�� ��� '**'�� ��ü�Ͽ� ���
	SELECT * FROM EMPLOYEES;
	SELECT DEPARTMENT_ID "�μ���ȣ", REPLACE(FIRST_NAME,'el','**')"����̸�" FROM EMPLOYEES
	WHERE DEPARTMENT_ID LIKE '5_';

	-- ù��° ���ڸ� �빮�ڷ� �ٲ��ִ� �Լ� : INITCAP();
	SELECT INITCAP('good morning') FROM DUAL; -- (Good Morning)
	SELECT INITCAP('good/morning') FROM DUAL; -- (Good/Morning)
	
-- 3. ��¥�Լ�

	-- ���� ��¥�� ����ϴ� Ű���� SYSDATE
	SELECT SYSDATE FROM DUAL; 	-- (2023-03-28 21:38:18)
	
	-- Ư�� ��¥�� �������� �����ִ� �Լ� : ADD_MONTHS()
	SELECT SYSDATE, ADD_MONTHS(SYSDATE,2) FROM DUAL; 
	-- ���� ��¥�� 2���� �߰�(2023-05-28 21:39:43)
	
	-- ������̺��� ��� ����� ������ �̸�, �Ի��� �Ի��Ϸκ��� 6���� ���� ��¥ ������ ���
	SELECT FIRST_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE,6) FROM EMPLOYEES;
	
	-- ����� 120���� ����� �Ի��� 3�� 6���� ° �Ǵ³� ���޿����̴�.
	-- ���� ���� ��¥�� ��ȸ�ϼ���
	SELECT EMPLOYEE_ID, FIRST_NAME, ADD_MONTHS(HIRE_DATE,42) FROM EMPLOYEES
	WHERE  EMPLOYEE_ID LIKE '120';

	-- �� ��¥ ������ �������� �����ִ� �Լ� : MONTHS_BETWEEN()
	-- 2022/03/30���� ���� ������ ���� �� ���ϱ�
	SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2022/03/30','YYYY/MM/DD'))"��¥" FROM DUAL;

	-- ��� ������� �Ի��Ϸκ��� ����� ����ߴ���, �̸�, �Ի���, ���������� ���
	SELECT * FROM EMPLOYEES;
	SELECT FIRST_NAME, HIRE_DATE, TRUNC(MONTHS_BETWEEN(SYSDATE,HIRE_DATE),1)"������" FROM EMPLOYEES;

	-- ���ñ��� �Ի�Ⱓ�� 160���� �̻��� ������� �̸�, �Ի���, �Ի��� �������� ���
	--    /    �̸�         /  �Ի���        /            �Ի��� ������                                                         /
	SELECT FIRST_NAME, HIRE_DATE, TRUNC(MONTHS_BETWEEN(SYSDATE,HIRE_DATE))"������" FROM EMPLOYEES
	--				���ñ��� �Ի�Ⱓ�� 160 �̻��� ���
	WHERE TRUNC(MONTHS_BETWEEN(SYSDATE,HIRE_DATE))>=160;
	
	
	
	
	
	
	








