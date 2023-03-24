SELECT * FROM PLAYER;
--COMMIT;

-- 테이블에 영향을 주는 INSERT, UPDATE, DELETE는
-- 롤백을 사용하는 경우가 종종 있다.

-- PLAYER 테이블에서 TEAM_ID가 'K01'인 선수의 이름을 자신의 이름으로 바꾸기

UPDATE PLAYER
SET PLAYER_NAME = '상우'
WHERE TEAM_ID = 'K01';

-- PLAYER 테이블에서 POSITION이 'MF'인 선수 삭제하기

DELETE FROM PLAYER
WHERE "POSITION" = 'MF';

SELECT * FROM PLAYER
WHERE "POSITION" = 'MF';

SELECT PLAYER_ID AS "선수번호", PLAYER_NAME 선수이름 FROM PLAYER;

-- PLAYER테이블에서 BACK_NO를 "등번호", NICKNAME을 "선수 별명"으로 
-- 변경한뒤 조회하기
SELECT BACK_NO "등번호", NICKNAME "선수별명" FROM PLAYER;

-- 누구누구의 별명은 무엇입니다.
SELECT PLAYER_NAME||'의 별명은'||NICKNAME||'입니다.' "선수 별명" FROM PLAYER;

-- 00의 포지션은 00이다.
-- 별칭을 작전회의 라고 주기
SELECT PLAYER_NAME||'의 포지션은'||"POSITION"||'이다' "작전회의" FROM PLAYER;

-- 사원테이블에서 사원들의 이름 중 M으로 사작하는 사원의 정보를
-- 사번, 이름, 직종순으로 출력
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'M%';

SELECT * FROM EMPLOYEES;

-- 사원테이블에서 / 이름이 d로 끝나는 / 사원의 사번, 이름, 직종을 출력
-- FROM EMPLOYEES / WHERE FIRST_NAME LIKE '%d' / SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%d';

-- 사원테이블에서 / 이름에 어디에라도 a가 포함되어 있는 사원의 정보를
-- FROM EMPLOYEES / WHERE FIRST_NAME LIKE '%a%'
-- 이름 , 직종 순으로 출력
-- SELECT FIRST_NAME, JOB_ID
SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%a%';

-- 사원테이블에서 첫글자가 M이면서 총 7글자의 이름을 가진 사원의 정보를
-- 사번, 이름순으로 조회하세요.
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'M______';

-- 사원테이블에서 이름에 3번째 글자에 a가 들어가는 사원들의 정보를
-- 사번, 이름순으로 조회.
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE '__a%';




 
