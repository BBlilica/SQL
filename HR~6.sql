--집합연산자
--union - 합집합 (중복 x)
--unioN ALL - 합집합(중복 O)
--INTERSECT -교집합
--MINUS -차집합

-- 컬럼 개수가 일치해야 집합연산자 사용이 가능합니다.
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE LIKE '04%'
UNION -- 합집합 중복 X
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE DEPARTMENT_ID = 20;


SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE LIKE '04%'
UNION ALL -- 합집합 중복 O
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE DEPARTMENT_ID = 20;

SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE LIKE '04%'
INTERSECT -- 교집합 (중복만)
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE DEPARTMENT_ID = 20;

SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE LIKE '04%'
MINUS -- 차집합 (다른것만)
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE DEPARTMENT_ID = 20;

---------------------------------------------------------------------------------------------

-- 가상테이블을 합쳐서 사용할 수도 있습니다.
SELECT 'PARK', 200 FROM DUAL
UNION ALL
SELECT 'KIM', 300 FROM DUAL
UNION ALL
SELECT 'CHOI', 400 FROM DUAL;


---------------------------------------------------------------------------------------------------

--시험의 단골문제
--분석함수

SELECT FIRST_NAME,
            SALARY,
            RANK() OVER(ORDER BY SALARY DESC) AS 중복등수,
            DENSE_RANK() OVER( ORDER BY SALARY DESC) AS 중복없는등수,
            ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS 일련번호,
            ROWNUM -- 정렬이 되면 순서가 바뀜
FROM EMPLOYEES;

--그룹 함수, 행에대한 기초통계값
--SUM, AVG, MAX, MIN, COUNT - 전부 NULL이 아닌 데이터에 대해서 통계를 구합니다

SELECT SUM(SALARY), MAX(SALARY), MIN(SALARY), COUNT(SALARY) FROM EMPLOYEES;
--MIN, MAX, 날짜, 문자열에서도 적영됩니다
SELECT MIN(HIRE_DATE), MAX(HIRE_DATE), MIN(FIRST_NAME), MAX(FIRST_NAME) FROM EMPLOYEES;
-- COUNT 함수는 2가지 사용방법이있음
SELECT COUNT(COMMISSION_PCT) FROM EMPLOYEES;
SELECT COUNT(*) FROM EMPLOYEES;

--주의할점: 그룹함수는 일반컬럼과 동시에 사용이 불가능
SELECT FIRST_NAME AVG(SALARY) FROM EMPLOYEES;

--그릅함수 위에 over()를 붙이면 전체행이 출력이 되고, 그룸함수 사용이 가능함
SELECT FIRST_NAME, AVG(SALARY) OVER(), COUNT(*) OVER() FROM EMPLOYEES;

-- GI=GROUP BY 절 컬럼기준으로 그뤂핑
--SELCET DEPARTMENT_ID FRON EMPLOYEES;
--그룹함수를 함께 사용할 수 있음.
SELECT DEPARTMENT_ID SUM(SALARY), AVG(SALARY), MIN(SALARY), MAX(SALARY), COUNT(*) FROM EMPLOYEES;
                                                                
SELECT EMPLOYEE_ID, DEPARTMENT_ID, SALARY,
    CUME_DIST() OVER (ORDER BY SALARY DESC) SAL_CUME_DIST,
    PERCENT_RANK() OVER(ORDER BY SALARY DESC) SAL_PCT_RANK
    FROM EMPLOYEES;
    
SELECT FIRST_NAME, SALARY,
            ROUND(RATIO_TO_REPORT(SALARY) OVER(), 4) AS SALARY_RATIO
            FROM EMPLOYEES
            WHERE JOB_ID='IT_PROG';
            
            
            
--문제 1.
--사원 테이블에서 JOB_ID별 사원 수, 월급의 평균, 가장빠른 입사일을 구하세요. 
--월급의 평균 순으로 내림차순 정렬하세요.
--

--select JOB_ID
--        ,COUNT(*) AS 사원수
--        ,


--문제 2.
--사원 테이블에서 입사 년도 별 사원 수를 구하세요.




--문제 3.
--급여가 1000 이상인 사원들의 부서별 평균 급여를 출력하세요. 단 부서 평균 급여가 2000이상인 부서만 출력
--
--문제 3.
--부서아이디가 NULL이 아니고, 입사일은 05년도 인 사람들의 부서 급여평균과, 급여합계를 평균기준 내림차순 조회하세요.
----조건은 급여평균이 10000이상인 데이터만.
--SELECT DEPARTMENT_ID,
--    AVG(SALARY) AS 급여평균,
--    SUM(SALARY) AS 급여합계
--    FROM EMPLOYEES
--WHERE DEPARTMENT_ID IS NOT NULL AND TO_CHAR(HIRE_DATE, 'YY') = '05'
--GROUP BY DEPARTMENT_ID
--HAVING AVG(SALARY) >= 10000
--ORDER BY 급여한계;


--문제 4.
--사원 테이블에서 commission_pct(커미션) 컬럼이 null이 아닌 사람들의
--department_id(부서별) salary(월급)의 평균, 합계, count를 구합니다.
--조건 1) 월급의 평균은 커미션을 적용시킨 월급입니다.
--조건 2) 평균은 소수 2째 자리에서 절삭 하세요.
--
--문제 5.
--부서아이디가 NULL이 아니고, 입사일은 05년도 인 사람들의 부서 급여평균과, 급여합계를 평균기준 내림차순합니다
--조건) 평균이 10000이상인 데이터만
--
--문제 6.
--직업별 월급합, 총합계를 출력하세요
--
--문제 7.
--부서별, JOB_ID를 그룹핑 하여 토탈, 합계를 출력하세요.
--GROUPING() 을 이용하여 소계 합계를 표현하세요