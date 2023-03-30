-- 집계함수
-- PLAYER테이블에서 키의 편균, 키가 가장 큰사람, 가장 작은사람, 모든 키의 합, 키 데이터가 들어있는 행의 개수

SELECT AVG(HEIGHT),MAX(HEIGHT),MIN(HEIGHT),SUM(HEIGHT),COUNT(HEIGHT) FROM PLAYER;

SELECT * FROM PLAYER; -- 480개의 선수정보
SELECT COUNT(HEIGHT) FROM PLAYER;	-- 447개(NULL값은 제외하기때문에)

SELECT COUNT(NVL(HEIGHT,0)) FROM PLAYER;	-- 480개 NULL값에 0을넣어 모두 표시 

-- 사원테이블의 전체 사원수를 출력
SELECT COUNT(*)"총 사원수" FROM EMPLOYEES;

-- 사원테이블에서 보너스를 받는 사원의 수를 출력
SELECT * FROM EMPLOYEES;
SELECT COUNT(COMMISSION_PCT)"상여금" FROM EMPLOYEES;

-- 사원테이블에서 직종이 SA_REP인 사원들의 평균급여, 급여 최고액, 급여 최저액, 급여의 총 합계를 출력하세요
SELECT AVG(SALARY)"평균급여", MAX(SALARY)"급여 최고액", MIN(SALARY)"급여 최저액", SUM(SALARY)"총급여" FROM EMPLOYEES
WHERE JOB_ID LIKE 'SA_REP';
--WHERE JOB_ID = 'SA_REP';

-- 사원테이블에서 부서의 개수 출력하기
-- DISTINCT : 중복되는 값은 카운트하지 않는다.
SELECT COUNT(DISTINCT DEPARTMENT_ID)"부서의 수량" FROM EMPLOYEES;

-- 사원테이블에서 부서번호가 80번인 부서의 사원들의 급여의 평균을 출력
SELECT ROUND(AVG(SALARY))"평균급여" FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80; 

-- 사원테이블에서 각 부서별 급여의 평균과 급여의 총 합을 출력
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)), SUM(SALARY) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 사원테이블에서 각 직종별 인원수를 출력
SELECT JOB_ID, COUNT(*) FROM EMPLOYEES
GROUP BY JOB_ID;

-- 사원테이블에서 각 직종별 급여의 합을 출력
SELECT JOB_ID, SUM(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID;

-- 사원테이블의 각 부서의 급여의 최대값, 최소값, 인원수를 출력하되, 
-- 급여의 최대값이 8000이상인 결과만 출력할 것
SELECT DEPARTMENT_ID"부서번호", MAX(SALARY)"최대값", MIN(SALARY)"최소값", COUNT(*)"인원수"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY)>=8000;

-- 사원테이블의 각 부서별 인원수가 20명 이상인 부서의 정보를 부서번호, 급여의 합, 급여의 평균, 인원수 순으로 출력
-- 하되, 급여의 평균은 소수점 두자리까지 출력하기
SELECT DEPARTMENT_ID"부서번호", SUM(SALARY)"합", ROUND(AVG(SALARY),2)"평균", COUNT(*)"인원수"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 20;

-- 사원테이블의 부서별, 직종별로 그룹화하여 결과를 부서번호, 직종, 인원수 순으로 출력하세요
-- 단, 직종이 'MAN'으로 끝나는 경우에만 출력
SELECT DEPARTMENT_ID"부서번호", JOB_ID"직종", COUNT(*)"인원수"
FROM EMPLOYEES
WHERE JOB_ID LIKE '%MAN'
GROUP BY DEPARTMENT_ID, JOB_ID;
--HAVING JOB_ID LIKE '%MAN';

-- 사원테이블의 각 부서별 평균 급여를 소수점 한자리까지 버림으로 출력하되, 평균급여가 10000미만인 그룹만
-- 조회해야 하며, 부서번호가 50이하인 부서만 조회하세요
SELECT DEPARTMENT_ID"부서번호", ROUND(AVG(SALARY),1)"평균급여"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING DEPARTMENT_ID <= 50 AND AVG(SALARY) < 10000;

SELECT DEPARTMENT_ID"부서번호", ROUND(AVG(SALARY),1)"평균급여"
FROM EMPLOYEES
WHERE DEPARTMENT_ID <= 50 -- 전체 테이블에 대해서의 조건
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) < 10000; -- 그룹화 하고난 다음의 조건

SELECT * FROM PLAYER ORDER BY HEIGHT;		-- 오름차순, 내림차순을 써주지 않으면 오름차순이 기본값
SELECT * FROM PLAYER ORDER BY HEIGHT DESC;	-- 키가 큰순부터
SELECT * FROM PLAYER ORDER BY 12 DESC;		-- HEIGHT가 12번째 컬럼이기 때문에 위내용과 동일

SELECT * FROM PLAYER ORDER BY HEIGHT, WEIGHT; -- 키에따른 몸무게순! 여러개 지정이 가능하다

-- 부서별, 직종별 그룹을 나눠서 인원수를 출력하되, 부서번호가 낮은순으로 정렬하세요
SELECT DEPARTMENT_ID"부서번호", JOB_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
ORDER BY DEPARTMENT_ID ASC;


