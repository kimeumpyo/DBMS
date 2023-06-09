-- EMP테이블에서 SAL 3000이상이면 HIGT, 1000이상이면 MID, 다 아니면 LOW
SELECT * FROM EMP;

SELECT ENAME "사원명", SAL "급여",
CASE
	WHEN SAL >= 3000 THEN 'HIGH'
	WHEN SAL >= 1000 THEN 'MID'
	ELSE 'LOW'
END "급여등급"
FROM EMP;
		
SELECT AVG(CASE JOB_ID WHEN 'IT_PROG' THEN SALARY END) "평균급여" FROM EMPLOYEES;

-- CASE와 WHEN 사이에 비교하고자하는 컬럼을 넣고
-- WHEN과 THEN 사이에 비교하고자 하는 값을 넣어서 비교하는 방법입니다.

-- STADIUM 테이블에서SEAT_COUNT 0 이상 30000이하면 'S'
-- 30001이상 50000이하면 'M' 다 아니면 'L'경기장 이름과, 좌석수를 출력하시오

SELECT STADIUM_NAME "경기장", SEAT_COUNT "좌석수",
CASE
--	WHEN SEAT_COUNT BETWEEN 0 AND 30000 THEN 'S'
--	WHEN SEAT_COUNT BETWEEN 30001 AND 50000 THEN 'S'
	WHEN SEAT_COUNT >= 0 AND SEAT_COUNT <= 30000 THEN 'S'
	WHEN SEAT_COUNT > 30000 AND SEAT_COUNT <= 50000 THEN 'M'
	ELSE 'L'
END "경기장 크기"
FROM STADIUM;

-- PLAYER 테이블에서 WEIGHT가 50이상 70이하면 'L'
-- 71이상 80이하면 'M', NULL이면 '미등록', 다 아니면 'H'
-- 선수 이름과 몸무게를 함께 출력하기

SELECT PLAYER_NAME "이름", WEIGHT "몸무게",
CASE
	WHEN WEIGHT BETWEEN 50 AND 70 THEN 'L'
	WHEN WEIGHT BETWEEN 71 AND 80 THEN 'M'
	WHEN WEIGHT IS NULL THEN '미등록'
	ELSE 'H'
END "체급"
FROM PLAYER
ORDER BY "몸무게";

-- 사원테이블에서 이름이 'Michael'이고, 직종이'MK_MAN'인 사원의 급여보다
-- 많이 받는 사원들의 정보를 사번, 이름, 직종, 급여순으로 출력

-- 1) 이름이 'Michael'이고 직종이'MK_MAN'인 사원이 얼마를 받는가??
SELECT SALARY FROM EMPLOYEES 
WHERE FIRST_NAME = 'Michael' AND JOB_ID = 'MK_MAN'; -- 13000

-- 2) 13000보다 많이 받는 사원들의 정보 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES WHERE SALARY > 13000;

-- 3) 위의 두 쿼리문을 SUBQUERY를 통해 하나로 합쳐보자
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES WHERE SALARY > (SELECT SALARY FROM EMPLOYEES 
								WHERE FIRST_NAME = 'Michael' AND JOB_ID = 'MK_MAN');
							
-- 사번이 150번인 사원의 급여와 같은 급여를 받는 사원들의 정보를 사번, 이름, 급여순으로 출력하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES WHERE SALARY = (SELECT SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID = '150');

-- 급여가 사원들의 평균급여 보다 많이 받는 사람들의 이름과 급여를 조회
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);

-- 사번이 111번인 사원의 직종과 같고, 사번이 159번인 사원의 급여보다 많이받는 사원들의 정보를
-- 사번, 이름, 직종, 급여순으로 출력

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES
WHERE 	JOB_ID = (SELECT JOB_ID FROM EMPLOYEES WHERE EMPLOYEE_ID = '111')  	-- FI_ACCOUNT
	AND SALARY > (SELECT SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID = '159');	-- 8000
	
-- 사원테이블에서 직종별 평균급여를 출력하되
-- 평균급여가 Bruce 사원보다 많이 받는 직종만 조회

SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) > (SELECT SALARY FROM EMPLOYEES WHERE FIRST_NAME = 'Bruce'); -- 6000
	
-- 사원테이블에서 성이 'Bat'으로 시작하는 단어를 포함하고 있는 사원과 같은 부서에서
-- 근무하는 사원의 부서번호, 이름 출력
SELECT * FROM EMPLOYEES;

-- 사원테이블에서 성이 'Bat'으로 시작하는 단어를 포함하고 있는 사원과 같은 부서
SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME LIKE 'Bat%';

SELECT DEPARTMENT_ID, FIRST_NAME FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME LIKE 'Bat%');

-- PLAYER테이블에서 NICKNAME이 NULL인 선수들은 정태민 선수의 닉네임으로 바꾸기

-- 1) 정태민선수의 닉네임
SELECT NICKNAME FROM PLAYER WHERE PLAYER_NAME = '정태민';	-- 킹카

-- 2) NICKNAME이 NULL인 선수들을 전부 킹카로 바꾸기
UPDATE PLAYER
SET NICKNAME = (SELECT NICKNAME FROM PLAYER WHERE PLAYER_NAME = '정태민')
WHERE NICKNAME IS NULL;

SELECT * FROM PLAYER WHERE NICKNAME = '킹카';

-- 사원테이블에서 평균 급여보다 낮은 사원들의 급여를 10% 인상

-- 1) 평균 급여
SELECT AVG(SALARY) FROM EMPLOYEES;	--  6461

-- 2) 급여가  6461보다 낮은 사원들의 급여를 10% 인상
UPDATE EMPLOYEES
SET SALARY = SALARY * 1.1
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);

SELECT * FROM EMPLOYEES;

-- PLAYER 테이블에서 평균 키보다 큰 선수들을 삭제

-- 1) 평균키
SELECT AVG(HEIGHT) FROM PLAYER; -- 179

-- 2) 179보다 큰 선수 삭제
DELETE FROM PLAYER 
WHERE HEIGHT > (SELECT AVG(HEIGHT) FROM PLAYER);

SELECT * FROM PLAYER WHERE HEIGHT > 178;

----------------------------------------------------------------------------------------

--[JOIN]
-- EMP테이블의 부서번호로 DEPT테이블의 지역 검색하기
SELECT * FROM EMP;
SELECT * FROM DEPT;
-- 왼쪽에 적힌 테이블이 먼저 조회가된다
SELECT DEPT.DEPTNO, EMP.ENAME, EMP.JOB, DEPT.LOC FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO; 