-- EMP���̺��� SAL 3000�̻��̸� HIGT, 1000�̻��̸� MID, �� �ƴϸ� LOW
SELECT * FROM EMP;

SELECT ENAME "�����", SAL "�޿�",
CASE
	WHEN SAL >= 3000 THEN 'HIGH'
	WHEN SAL >= 1000 THEN 'MID'
	ELSE 'LOW'
END "�޿����"
FROM EMP;
		
SELECT AVG(CASE JOB_ID WHEN 'IT_PROG' THEN SALARY END) "��ձ޿�" FROM EMPLOYEES;

-- CASE�� WHEN ���̿� ���ϰ����ϴ� �÷��� �ְ�
-- WHEN�� THEN ���̿� ���ϰ��� �ϴ� ���� �־ ���ϴ� ����Դϴ�.

-- STADIUM ���̺���SEAT_COUNT 0 �̻� 30000���ϸ� 'S'
-- 30001�̻� 50000���ϸ� 'M' �� �ƴϸ� 'L'����� �̸���, �¼����� ����Ͻÿ�

SELECT STADIUM_NAME "�����", SEAT_COUNT "�¼���",
CASE
--	WHEN SEAT_COUNT BETWEEN 0 AND 30000 THEN 'S'
--	WHEN SEAT_COUNT BETWEEN 30001 AND 50000 THEN 'S'
	WHEN SEAT_COUNT >= 0 AND SEAT_COUNT <= 30000 THEN 'S'
	WHEN SEAT_COUNT > 30000 AND SEAT_COUNT <= 50000 THEN 'M'
	ELSE 'L'
END "����� ũ��"
FROM STADIUM;

-- PLAYER ���̺��� WEIGHT�� 50�̻� 70���ϸ� 'L'
-- 71�̻� 80���ϸ� 'M', NULL�̸� '�̵��', �� �ƴϸ� 'H'
-- ���� �̸��� �����Ը� �Բ� ����ϱ�

SELECT PLAYER_NAME "�̸�", WEIGHT "������",
CASE
	WHEN WEIGHT BETWEEN 50 AND 70 THEN 'L'
	WHEN WEIGHT BETWEEN 71 AND 80 THEN 'M'
	WHEN WEIGHT IS NULL THEN '�̵��'
	ELSE 'H'
END "ü��"
FROM PLAYER
ORDER BY "������";

-- ������̺��� �̸��� 'Michael'�̰�, ������'MK_MAN'�� ����� �޿�����
-- ���� �޴� ������� ������ ���, �̸�, ����, �޿������� ���

-- 1) �̸��� 'Michael'�̰� ������'MK_MAN'�� ����� �󸶸� �޴°�??
SELECT SALARY FROM EMPLOYEES 
WHERE FIRST_NAME = 'Michael' AND JOB_ID = 'MK_MAN'; -- 13000

-- 2) 13000���� ���� �޴� ������� ���� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES WHERE SALARY > 13000;

-- 3) ���� �� �������� SUBQUERY�� ���� �ϳ��� ���ĺ���
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES WHERE SALARY > (SELECT SALARY FROM EMPLOYEES 
								WHERE FIRST_NAME = 'Michael' AND JOB_ID = 'MK_MAN');
							
-- ����� 150���� ����� �޿��� ���� �޿��� �޴� ������� ������ ���, �̸�, �޿������� ����ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES WHERE SALARY = (SELECT SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID = '150');

-- �޿��� ������� ��ձ޿� ���� ���� �޴� ������� �̸��� �޿��� ��ȸ
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);

-- ����� 111���� ����� ������ ����, ����� 159���� ����� �޿����� ���̹޴� ������� ������
-- ���, �̸�, ����, �޿������� ���

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES
WHERE 	JOB_ID = (SELECT JOB_ID FROM EMPLOYEES WHERE EMPLOYEE_ID = '111')  	-- FI_ACCOUNT
	AND SALARY > (SELECT SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID = '159');	-- 8000
	
-- ������̺��� ������ ��ձ޿��� ����ϵ�
-- ��ձ޿��� Bruce ������� ���� �޴� ������ ��ȸ

SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) > (SELECT SALARY FROM EMPLOYEES WHERE FIRST_NAME = 'Bruce'); -- 6000
	
-- ������̺��� ���� 'Bat'���� �����ϴ� �ܾ �����ϰ� �ִ� ����� ���� �μ�����
-- �ٹ��ϴ� ����� �μ���ȣ, �̸� ���
SELECT * FROM EMPLOYEES;

-- ������̺��� ���� 'Bat'���� �����ϴ� �ܾ �����ϰ� �ִ� ����� ���� �μ�
SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME LIKE 'Bat%';

SELECT DEPARTMENT_ID, FIRST_NAME FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME LIKE 'Bat%');

-- PLAYER���̺��� NICKNAME�� NULL�� �������� ���¹� ������ �г������� �ٲٱ�

-- 1) ���¹μ����� �г���
SELECT NICKNAME FROM PLAYER WHERE PLAYER_NAME = '���¹�';	-- ŷī

-- 2) NICKNAME�� NULL�� �������� ���� ŷī�� �ٲٱ�
UPDATE PLAYER
SET NICKNAME = (SELECT NICKNAME FROM PLAYER WHERE PLAYER_NAME = '���¹�')
WHERE NICKNAME IS NULL;

SELECT * FROM PLAYER WHERE NICKNAME = 'ŷī';

-- ������̺��� ��� �޿����� ���� ������� �޿��� 10% �λ�

-- 1) ��� �޿�
SELECT AVG(SALARY) FROM EMPLOYEES;	--  6461

-- 2) �޿���  6461���� ���� ������� �޿��� 10% �λ�
UPDATE EMPLOYEES
SET SALARY = SALARY * 1.1
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);

SELECT * FROM EMPLOYEES;

-- PLAYER ���̺��� ��� Ű���� ū �������� ����

-- 1) ���Ű
SELECT AVG(HEIGHT) FROM PLAYER; -- 179

-- 2) 179���� ū ���� ����
DELETE FROM PLAYER 
WHERE HEIGHT > (SELECT AVG(HEIGHT) FROM PLAYER);

SELECT * FROM PLAYER WHERE HEIGHT > 178;

----------------------------------------------------------------------------------------

--[JOIN]
-- EMP���̺��� �μ���ȣ�� DEPT���̺��� ���� �˻��ϱ�
SELECT * FROM EMP;
SELECT * FROM DEPT;
-- ���ʿ� ���� ���̺��� ���� ��ȸ���ȴ�
SELECT DEPT.DEPTNO, EMP.ENAME, EMP.JOB, DEPT.LOC FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO; 