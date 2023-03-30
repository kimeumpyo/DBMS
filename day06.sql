SELECT * FROM PLAYER;
-- PLAYER 테이블에서 POSITION이 NULL이면 '미정'으로 바꾼 후 출력하기
-- SELECT PLAYER_NAME "선수이름", NVL("POSITION",'NULL') "포지션" FROM PLAYER;
SELECT PLAYER_NAME "선수이름", NVL("POSITION",'미정') "포지션" FROM PLAYER;

-- PLAYER 테이블에서 POSITION이 NULL이면 '미정', 아니면 '확정'으로 바꿔서 조회하기.
-- 	SELECT PLAYER_NAME "선수이름", NVL2("POSITION",'NULL','NOT NOLL') "포지션" FROM PLAYER;
	SELECT PLAYER_NAME "선수이름", NVL2("POSITION",'확정','미정') "포지션" FROM PLAYER;
	
-- PLAYER 테이블에서 NATION이 NULL이 아니면 '등록', NULL이면 '미등록'으로 변경하여 출력하기
	SELECT PLAYER_NAME "선수이름", NVL2(NATION,'등록','미등록') "국가" FROM PLAYER;
	
--------------------------------------------------------------------------------------

-- 1. 숫자형 함수

	-- 몫을 구하는 나누기 / 
	SELECT SALARY, SALARY/2 FROM EMPLOYEES;
	
	-- 나머지를 구하는 나누기  : MOD%
	-- 10을 3으로 나눈 나머지 -- 가상의 테이블 (DUAL)
	SELECT MOD(10,3) FROM DUAL;
	
	-- EMPLOYEES테이블에서 사번, 이름을 출력하되 짝수 사번을 가진 사원들만 조회하기
	SELECT * FROM EMPLOYEES;
	SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES
	WHERE MOD(EMPLOYEE_ID,2)=0;
	
	-- 값보다 큰 최 근접 정수 : CEIL();
	SELECT CEIL(3.14) FROM DUAL; -- (4)
	SELECT CEIL(-3.14) FROM DUAL; -- (-3)
	
	-- 반올림 함수 : ROUND()
	SELECT ROUND(3.141592)FROM DUAL; -- (4)
	SELECT ROUND(3.141592,4)FROM DUAL; -- (3.1416)
	
	-- 버림함수 : TRUNC()
	SELECT TRUNC(3.9) FROM DUAL; -- (3)
	
	-- 글자의 길이 구하기 : LENGTH()
	SELECT LENGTH('JOHN') FROM DUAL; -- (4)
	
	-- 사원테이블에서 이름의 길이가 6자이상인 사원의 사번, 이름을 출력
	SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES
	WHERE LENGTH(FIRST_NAME)>=6;
	--WHERE FIRST_NAME LIKE '______%';
	
	-- 양수면1, 0이면0, 음수면 -1을 반환하는 함수 SIGN()
	SELECT SIGN(-123),SIGN(0),SIGN(123) FROM DUAL;	-- (-1,0,1)
	
	-- 제곱을 구해주는 함수 POWER()
	SELECT POWER(3,2) FROM DUAL; -- (9)

-- 2. 문자형 함수

	-- 데이터를 대문자로 바꿔주는 함수 UPPER()
	SELECT UPPER('abc') FROM DUAL;	-- (ABC)
	
	-- 사원테이블의 모든 사원의 이름을 대문자로 출력하세요.
	SELECT UPPER(FIRST_NAME) FROM EMPLOYEES;	-- 모든이름 대문자로 출력
	
	-- 사원테이블에서 michael이라는 이름의 사원에 대한 사번, 이름, 직종, 입사일 검색
	SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, HIRE_DATE
	FROM EMPLOYEES
	WHERE UPPER(FIRST_NAME) = UPPER('michael');

	-- 전부 소문자로 바꿔주는 함수 LOWER();
	SELECT LOWER('ABC')	FROM DUAL;		-- (abc)
	
	-- 원하는 문자열만 잘라오는 함수 SUBSTR();
	SELECT SUBSTR('GOOD MORNING', 8) FROM DUAL; -- 8번째부터 (RNING)
	
	SELECT SUBSTR('GOOD MORNING', 8,2) FROM DUAL; -- 8.번째부터 2글자만 (RN)
	
	-- 필요한 문장을 교체해주는 함수 REPLACE()
	SELECT REPLACE ('GOOD MORNING','GOOD','HI') FROM DUAL; -- GOOD이 HI로 바뀌어 출력

	-- 사원테이블에서 부서번호가 50번인 사원들의 이름을 출력하되, 이름중 'el'을 모두 '**'로 대체하여 출력
	SELECT * FROM EMPLOYEES;
	SELECT DEPARTMENT_ID "부서번호", REPLACE(FIRST_NAME,'el','**')"사원이름" FROM EMPLOYEES
	WHERE DEPARTMENT_ID LIKE '5_';

	-- 첫번째 글자만 대문자로 바꿔주는 함수 : INITCAP();
	SELECT INITCAP('good morning') FROM DUAL; -- (Good Morning)
	SELECT INITCAP('good/morning') FROM DUAL; -- (Good/Morning)
	
-- 3. 날짜함수

	-- 현재 날짜를 기억하는 키워드 SYSDATE
	SELECT SYSDATE FROM DUAL; 	-- (2023-03-28 21:38:18)
	
	-- 특정 날짜에 개월수를 더해주는 함수 : ADD_MONTHS()
	SELECT SYSDATE, ADD_MONTHS(SYSDATE,2) FROM DUAL; 
	-- 현재 날짜에 2개월 추가(2023-05-28 21:39:43)
	
	-- 사원테이블에서 모든 사원의 정보를 이름, 입사일 입사일로부터 6개월 뒤의 날짜 순으로 출력
	SELECT FIRST_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE,6) FROM EMPLOYEES;
	
	-- 사번이 120번인 사원이 입사후 3년 6개월 째 되는날 진급예정이다.
	-- 진급 예정 날짜를 조회하세요
	SELECT EMPLOYEE_ID, FIRST_NAME, ADD_MONTHS(HIRE_DATE,42) FROM EMPLOYEES
	WHERE  EMPLOYEE_ID LIKE '120';

	-- 두 날짜 사이의 개월수를 구해주는 함수 : MONTHS_BETWEEN()
	-- 2022/03/30부터 오늘 사이의 개월 수 구하기
	SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2022/03/30','YYYY/MM/DD'))"날짜" FROM DUAL;

	-- 모든 사원들이 입사일로부터 몇개월이 경과했는지, 이름, 입사일, 개월순으로 출력
	SELECT * FROM EMPLOYEES;
	SELECT FIRST_NAME, HIRE_DATE, TRUNC(MONTHS_BETWEEN(SYSDATE,HIRE_DATE),1)"개월수" FROM EMPLOYEES;

	-- 오늘까지 입사기간이 160개월 이상인 사원들의 이름, 입사일, 입사후 개월수를 출력
	--    /    이름         /  입사일        /            입사후 개월수                                                         /
	SELECT FIRST_NAME, HIRE_DATE, TRUNC(MONTHS_BETWEEN(SYSDATE,HIRE_DATE))"개월수" FROM EMPLOYEES
	--				오늘까지 입사기간이 160 이상인 사원
	WHERE TRUNC(MONTHS_BETWEEN(SYSDATE,HIRE_DATE))>=160;
	
	
	
	
	
	
	








