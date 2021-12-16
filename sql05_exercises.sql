-- hr 계정의 employees 테이블 사용

-- employees 테이블 구조 확인
-- describe
desc employees;

-- 이름을 검색할 때는 First/Last Name을 붙여서 출력할 수 있도록.(|| 연산자 사용)

-- 성(Last_Name)이 'J'로 시작하는 직원들의 사번, 이름을 출력.
select EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME as FULL_NAME
from EMPLOYEES
where LAST_NAME like 'J%';
-- 성(Last_Name)에 'E' 또는 'e'가 포함된 직원들의 사번, 이름을 출력.
select EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME as FULL_NAME
from EMPLOYEES
where (LAST_NAME like '%E%') or (LAST_NAME like '%e%');

-- 위 문장의 결과와 비교
select EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME as FULL_NAME
from EMPLOYEES
where LAST_NAME in ('%E%', '%e%');
-- where LAST_NAME = '%E%' or LASTNAME = '%e%'와 같은 의미

-- 문자열 함수 이용 : upper(컬럼이름) - 대문자로 변환, lower(컬럼 이름) - 소문자 변환.
select EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME as FULL_NAME
from EMPLOYEES
where upper(LAST_NAME) like '%E%';

-- 전화번호가 '011'로 시작하는 직원들의 사번, 이름, 전화번호를 출력.
select EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME as FULL_NAME, PHONE_NUMBER
from EMPLOYEES
where PHONE_NUMBER like '011%';


-- 급여가 3000이상 5000이하인 직원들의 사번, 이름, 급여를 검색
-- 급여의 내림차순으로 출력.
select EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME as FULL_NAME, SALARY
from EMPLOYEES
where SALARY between 3000 and 5000
order by SALARY desc;

-- 수당이 있는(not null) 직원들의 사번, 이름, 급여, 연봉을 검색
-- commission_pct 컬럼 : 수당의 퍼센티지(percentage). 수당이 12개월 급여의 몇 %인 지.
-- 수당 포함 연봉 = 월급 * 12 + 특별 수당
--                = 월급 * 12 + (월급 * 12) * percentage
--                = (월급 * 12) * (1 + percentage)
select EMPLOYEE_ID, 
    FIRST_NAME || ' ' || LAST_NAME as FULL_NAME, 
    SALARY,
    COMMISSION_PCT,
    (SALARY * 12) * (1 + COMMISSION_PCT) as "12 Month SALARY"
from EMPLOYEES
where COMMISSION_PCT is not null;
