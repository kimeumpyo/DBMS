SELECT * FROM PLAYER;
--COMMIT;

-- ���̺� ������ �ִ� INSERT, UPDATE, DELETE��
-- �ѹ��� ����ϴ� ��찡 ���� �ִ�.

-- PLAYER ���̺��� TEAM_ID�� 'K01'�� ������ �̸��� �ڽ��� �̸����� �ٲٱ�

UPDATE PLAYER
SET PLAYER_NAME = '���'
WHERE TEAM_ID = 'K01';

-- PLAYER ���̺��� POSITION�� 'MF'�� ���� �����ϱ�

DELETE FROM PLAYER
WHERE "POSITION" = 'MF';

SELECT * FROM PLAYER
WHERE "POSITION" = 'MF';

SELECT PLAYER_ID AS "������ȣ", PLAYER_NAME �����̸� FROM PLAYER;

-- PLAYER���̺��� BACK_NO�� "���ȣ", NICKNAME�� "���� ����"���� 
-- �����ѵ� ��ȸ�ϱ�
SELECT BACK_NO "���ȣ", NICKNAME "��������" FROM PLAYER;

-- ���������� ������ �����Դϴ�.
SELECT PLAYER_NAME||'�� ������'||NICKNAME||'�Դϴ�.' "���� ����" FROM PLAYER;

-- 00�� �������� 00�̴�.
-- ��Ī�� ����ȸ�� ��� �ֱ�
SELECT PLAYER_NAME||'�� ��������'||"POSITION"||'�̴�' "����ȸ��" FROM PLAYER;

-- ������̺��� ������� �̸� �� M���� �����ϴ� ����� ������
-- ���, �̸�, ���������� ���
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'M%';

SELECT * FROM EMPLOYEES;

-- ������̺��� / �̸��� d�� ������ / ����� ���, �̸�, ������ ���
-- FROM EMPLOYEES / WHERE FIRST_NAME LIKE '%d' / SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%d';

-- ������̺��� / �̸��� ��𿡶� a�� ���ԵǾ� �ִ� ����� ������
-- FROM EMPLOYEES / WHERE FIRST_NAME LIKE '%a%'
-- �̸� , ���� ������ ���
-- SELECT FIRST_NAME, JOB_ID
SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%a%';

-- ������̺��� ù���ڰ� M�̸鼭 �� 7������ �̸��� ���� ����� ������
-- ���, �̸������� ��ȸ�ϼ���.
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'M______';

-- ������̺��� �̸��� 3��° ���ڿ� a�� ���� ������� ������
-- ���, �̸������� ��ȸ.
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE '__a%';




 
