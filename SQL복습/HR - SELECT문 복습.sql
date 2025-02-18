

-- SELECT 문 
-- SELECT [DISTINCT] { * |COLUMN [[AS] ALIAS], ...}
-- FROM TABLE_NAME


--SQL 문장은 대/소문자를 구별하지 않습니다.
--SQL 문장은 할 줄 이상일 수 있습니다.
--키워드는 단축하거나 줄을 나누어 쓸 수 없습니다.
--절은 대개 줄을 나우어서 씁니다.
--탭과 들여쓰기(INDENT)는 읽기 쉽게 하기 위해 사용됩니다.

--테이블의 특정 컬럼을 호출할 때
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES;

-- 테이블의 모든 컬럼을 호출할 때
SELECT *
FROM DEPARTMENTS;

--디폴트 데이터 자리맞춤을 지정합니다.
--날짜와 문자 데이터는 왼쪽에 정렬 됩니다.
--숫자 데이터는 오른쪽에 정렬됩니다.
--디폴트 열은 대문자로 출력됩니다.
--SALARY는 숫자일 수도, 문자일 수도 있습니다.
SELECT FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES;

--곱하기와 나누기는 더하기와 빼기보다 우선순위가 높습니다.
--같은 우선순위의 연산자는 좌축에서 우측으로 계산됩니다.
--괄호는 강제로 계산의 우선순위를 바꾸거나 문장을 명료하게 하기 위해 사용합니다.
--[* / + -]
SELECT FIRST_NAME, LAST_NAME, SALARY, SALARY + SALARY * 0.1
FROM EMPLOYEES;

--NULL은 이용할 수 없거나, 지정되지 않았거나, 알 수 없거나 또는 정욕 할 수 없는 값입니다.
--NULL은 숫자 0이나 공백과는 다릅니다.
-- NULL != 0, NULL != " ";
SELECT FIRST_NAME, DEPARTMENT_ID, COMMISSION_PCT
FROM EMPLOYEES;


SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;
SELECT * FROM JOBS;

--특정 컬러만 조회하려면, 나열
SELECT EMPLOYEE_ID, FIRST_NAME, PHONE_NUMBER FROM EMPLOYEES;

-- 문자, 날짜는 왼쪽으로 표시, 숫자는 오른쪽에 나타납니다.
SELECT FIRST_NAME, HIRE_DATE, SALARY, COMMISSION_PCT FROM EMPLOYEES;

--숫자컬럼은 * / + - 가 됩니다.
SELECT FIRST_NAME, SALARY, SALARY + SALARY * 0.1 FROM EMPLOYEES;

--------------------------------------------------------------

--열 헤딩 이름을 변경합니다.
--계산할 때에 유용합니다.
--열 이름 바로 뒤에 둡니다. 열 이름과 별칭 사이에 키워드 'AS'를 넣기도 합니다.
--공백이나 특수문자 또는 대/소문자가 있으며 이중 인용부호(" ")가 필요합니다.
SELECT FIRST_NAME AS 이름, SALARY 급여
FROM EMPLOYEES;

SELECT FIRST_NAME "EMPLOYEE NAME",
            SALARY * 12 "ANNUAL SALARY"
FROM EMPLOYEES;

--SELECT 절에 포함된 리터럴은 문자 표현식 또는 숫자 입니다.
--날짜와 문자 리터럴 값은 단일 인용부호(' ')안에 있어야 합니다.
--숫자 리터럴은 단일 인용부호(' ')를 사용하지 않습니다.
--각각의 문자스트링은 리턴된 각 행에 대한 결과입니다.
--||를 이용하면 값을 연결해 줍니다.
--문자열은 +로 이을 없습니다.
SELECT FIRST_NAME || '' || LAST_NAME || '''S SALARY IS $' || SALARY AS "EMPLOYEE DETAILS"
FROM EMPLOYEES;

--의의 디폴트 출력은 중복되는 행을 포함하는 모든 행입니다.
--SELECT 절에서 DISTINCT 키워드를 사용하여 중복되는 행을 제거합니다.
SELECT DEPARTMENT_ID
FROM EMPLOYEES;

SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES;


--컬럼 별칭 ALIAS (AS 생략가능, 공백을 포함한 문자열은 (" ")로 감싸주어야 함.)
SELECT FIRST_NAME AS 이름, SALARY 급여, SALARY + SALARY * 0.1 AS "최종 급여" FROM EMPLOYEES;

--문자열 붙이기 ||
SELECT FIRST_NAME || '''님의 급여는' || SALARY || '$ 입니다.' AS SALARY
FROM EMPLOYEES;

--DISTINCT (행 - 중복제거)
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES;
SELECT DISTINCT FIRST_NAME, DEPARTMENT_ID FROM EMPLOYEES; -- 조회된 데이터 기준으로 중복을 제거

--ROWID : 데이터베이스에서 행의 주소를 반환합니다.
--ROWNUM : 쿼리에 의해 반환되는 행의 번호를 출력합니다. (아주 중요)
SELECT ROWID, ROWNUM, EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES;

-- ROWID(데이터 주소), ROWNUM(데이터 조회된 순서)
SELECT EMPLOYEE_ID, FIRST_NAME, ROWID, ROWNUM FROM EMPLOYEES;

