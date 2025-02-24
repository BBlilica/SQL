--데이터 제한 "WHERE"
--질의에 의해 검색되는 행을 제한할 수 있습니다.

--EX) 부서번호가 90인 모든 사원을 호출하고 싶다.
--SELECT FIRST_NAME, DEPARTMENMT_ID
--FROM EMPLOYEES
--WHERE DEPARTMENT_ID = 90;

--구문형식에서
-- WHERE : 조건을 만족하는 행으로 질의를 제한합니다.
-- CONDITION(S) : 열 이름, 표현식, 상수 그리고 비교 연산자로 구성됩니다.
SELECT FIRST_NAME, JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

--컬럼 이름은 대소문자를 구분하지 않지만 값의 대소문자는 구별합니다.
--문자스트링과 날짜 값은 단일 인용부호''로 둘러싸여 있습니다.
--문자 값은 대/소문자를 구분하고, 날짜 값은 형식을 구분합니다.
--디폴트 날짜형식은 'DD-MON-YY'입니다.
--04/01/30로 표기된 이유는.. SQL Developer의 환경설정 날짜 형식이 RR/MM/DD 이기 때문입니다.
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE LAST_NAME = 'King';

--연산자
-- =  같다
-- > 보다 크다
-- >= 보다 크거나 같다
-- < 보다 작다
-- <= 보다 작거나 같다
--<> 같지 않다.
SELECT FIRST_NAME, SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE SALARY >= 15000;

SELECT FIRST_NAME, SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE JOB_ID='IT_PROG';

SELECT FIRST_NAME, SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE SALARY >= 15000;

SELECT FIRST_NAME, SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE SALARY < 10000;

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID <> 50;


SELECT FIRST_NAME, SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE='04/01/30'; -- 날짜는 문자열로 찾으면 됩니다.
--데이터는 대/소문자를 구분합니다.
SELECT FIRST_NAME, SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE FIRST_NAME='Steven';

--BETWEEN 연산자
--BETWEEN A AND B (이상~이하)
--값의 범위에 해당하는 행을 출력하기 위해 BETWEEN 연산자를 사용합니다.
--하한 값을 먼저 명시해야 합니다.
--하한 값과 상한 값을 모두 포함합니다.
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN 10000 AND 15000;

SELECT * FROM EMPLOYEES WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';
