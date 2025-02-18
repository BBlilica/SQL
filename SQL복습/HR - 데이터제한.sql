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
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE LAST_NAME = 'King';

--오라클은 날짜를 세기, 년, 월, 일, 시간, 분 그리고 초로 저장합니다.
--위에 