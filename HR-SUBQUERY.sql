--단일행 서브쿼리 - SELECT한 결과가 1행인 서브쿼리
--서브쿼리는 ()로 묶는다. 연산자보다는 오른쪽에 나온다.



SELECT SALARY
FROM EMPLOYEES
WHERE FIRST_NAME = 'Nancy';

SELECT *
FROM EMPLOYEES 
WHERE SALARY >= (SELECT SALARY 
                             FROM EMPLOYEES 
                             WHERE FIRST_NAME = 'Nancy');
                             
                             
--직원번호가 103번인 사람과 돌일한 직무를 가진 사람
SELECT JOB_ID FROM EMPLOYEES WHERE EMPLOYEE_ID = 103;

SELECT *
FROM EMPLOYEES WHERE JOB_ID = (SELECT JOB_ID FROM EMPLOYEES WHERE EMPLOYEE_ID = 103);
--주의할 점 - 단일행 서브쿼리는 반드시 하나의 행을 리턴해야 합니다.
-- 서브쿼리가 변환하는 행이 여러행이라면,  다중행 연산자를 쓰면 됩니다.
SELECT *
FROM EMPLOYEES
WHERE SALARY >= (SELECT SALARY FROM EMPLOYEES WHERE FIRST_NAME = 'DAVID';

