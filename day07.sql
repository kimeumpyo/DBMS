-- �����Լ�
-- PLAYER���̺��� Ű�� ���, Ű�� ���� ū���, ���� �������, ��� Ű�� ��, Ű �����Ͱ� ����ִ� ���� ����

SELECT AVG(HEIGHT),MAX(HEIGHT),MIN(HEIGHT),SUM(HEIGHT),COUNT(HEIGHT) FROM PLAYER;

SELECT * FROM PLAYER; -- 480���� ��������
SELECT COUNT(HEIGHT) FROM PLAYER;	-- 447��(NULL���� �����ϱ⶧����)

SELECT COUNT(NVL(HEIGHT,0)) FROM PLAYER;	-- 480�� NULL���� 0���־� ��� ǥ�� 

-- ������̺��� ��ü ������� ���
SELECT COUNT(*)"�� �����" FROM EMPLOYEES;

-- ������̺��� ���ʽ��� �޴� ����� ���� ���
SELECT * FROM EMPLOYEES;
SELECT COUNT(COMMISSION_PCT)"�󿩱�" FROM EMPLOYEES;

-- ������̺��� ������ SA_REP�� ������� ��ձ޿�, �޿� �ְ��, �޿� ������, �޿��� �� �հ踦 ����ϼ���
SELECT AVG(SALARY)"��ձ޿�", MAX(SALARY)"�޿� �ְ��", MIN(SALARY)"�޿� ������", SUM(SALARY)"�ѱ޿�" FROM EMPLOYEES
WHERE JOB_ID LIKE 'SA_REP';
--WHERE JOB_ID = 'SA_REP';

-- ������̺��� �μ��� ���� ����ϱ�
-- DISTINCT : �ߺ��Ǵ� ���� ī��Ʈ���� �ʴ´�.
SELECT COUNT(DISTINCT DEPARTMENT_ID)"�μ��� ����" FROM EMPLOYEES;

-- ������̺��� �μ���ȣ�� 80���� �μ��� ������� �޿��� ����� ���
SELECT ROUND(AVG(SALARY))"��ձ޿�" FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80; 

-- ������̺��� �� �μ��� �޿��� ��հ� �޿��� �� ���� ���
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)), SUM(SALARY) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- ������̺��� �� ������ �ο����� ���
SELECT JOB_ID, COUNT(*) FROM EMPLOYEES
GROUP BY JOB_ID;

-- ������̺��� �� ������ �޿��� ���� ���
SELECT JOB_ID, SUM(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID;

-- ������̺��� �� �μ��� �޿��� �ִ밪, �ּҰ�, �ο����� ����ϵ�, 
-- �޿��� �ִ밪�� 8000�̻��� ����� ����� ��
SELECT DEPARTMENT_ID"�μ���ȣ", MAX(SALARY)"�ִ밪", MIN(SALARY)"�ּҰ�", COUNT(*)"�ο���"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY)>=8000;

-- ������̺��� �� �μ��� �ο����� 20�� �̻��� �μ��� ������ �μ���ȣ, �޿��� ��, �޿��� ���, �ο��� ������ ���
-- �ϵ�, �޿��� ����� �Ҽ��� ���ڸ����� ����ϱ�
SELECT DEPARTMENT_ID"�μ���ȣ", SUM(SALARY)"��", ROUND(AVG(SALARY),2)"���", COUNT(*)"�ο���"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 20;

-- ������̺��� �μ���, �������� �׷�ȭ�Ͽ� ����� �μ���ȣ, ����, �ο��� ������ ����ϼ���
-- ��, ������ 'MAN'���� ������ ��쿡�� ���
SELECT DEPARTMENT_ID"�μ���ȣ", JOB_ID"����", COUNT(*)"�ο���"
FROM EMPLOYEES
WHERE JOB_ID LIKE '%MAN'
GROUP BY DEPARTMENT_ID, JOB_ID;
--HAVING JOB_ID LIKE '%MAN';

-- ������̺��� �� �μ��� ��� �޿��� �Ҽ��� ���ڸ����� �������� ����ϵ�, ��ձ޿��� 10000�̸��� �׷츸
-- ��ȸ�ؾ� �ϸ�, �μ���ȣ�� 50������ �μ��� ��ȸ�ϼ���
SELECT DEPARTMENT_ID"�μ���ȣ", ROUND(AVG(SALARY),1)"��ձ޿�"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING DEPARTMENT_ID <= 50 AND AVG(SALARY) < 10000;

SELECT DEPARTMENT_ID"�μ���ȣ", ROUND(AVG(SALARY),1)"��ձ޿�"
FROM EMPLOYEES
WHERE DEPARTMENT_ID <= 50 -- ��ü ���̺� ���ؼ��� ����
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) < 10000; -- �׷�ȭ �ϰ� ������ ����

SELECT * FROM PLAYER ORDER BY HEIGHT;		-- ��������, ���������� ������ ������ ���������� �⺻��
SELECT * FROM PLAYER ORDER BY HEIGHT DESC;	-- Ű�� ū������
SELECT * FROM PLAYER ORDER BY 12 DESC;		-- HEIGHT�� 12��° �÷��̱� ������ ������� ����

SELECT * FROM PLAYER ORDER BY HEIGHT, WEIGHT; -- Ű������ �����Լ�! ������ ������ �����ϴ�

-- �μ���, ������ �׷��� ������ �ο����� ����ϵ�, �μ���ȣ�� ���������� �����ϼ���
SELECT DEPARTMENT_ID"�μ���ȣ", JOB_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
ORDER BY DEPARTMENT_ID ASC;


