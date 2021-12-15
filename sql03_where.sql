-- 테이블에서 데이터 검색
--    (1) projection : 테이블에서 원하는 컬럼들을 선택
--    (2) selection : 테이블에서 조건을 만족하는 레코드(행)들을 검색.

-- select 컬럼, ... from 테이블 where 조건식 [order by 정렬기준 컬럼];

-- 직원 테이블(EMP)에서 10번 부서에 근무하는 직원들의 부서번호, 사번, 이름을 검색
select DEPTNO, EMPNO, ENAME
from EMP
where DEPTNO = 10;

-- 비교 연산자 : =, !=, >, >=, <, <=, is null, is not null
-- 논리 연산자 : and, or, not

-- 직원 테이블에서 수당(comm)이 null이 아닌 직원들의 사번, 이름, 수당을 검색.
-- 출력 순서는 이름의 오름차순으로 정렬해서.
select EMPNO, ENAME, COMM
from EMP
where COMM is not null
order by ENAME;

-- 직원 테이블에서 급여(SAL)가 2000이상인 직원들의 이름과 급여를 검색
-- 출력 순서는 급여의 내림차순으로 정렬해서.
select ENAME, SAL
from EMP
where SAL >= 2000
order by SAL desc;

-- 직원테이블에서 급여가 2000 이상 3000이하인 직원들의 사번, 이름, 수당을 검색.
-- 급여의 내림차순으로 출력.
select EMPNO, ENAME, SAL
from EMP
where SAL >= 2000 and SAL < 3000
order by SAL desc;

select EMPNO, ENAME, SAL
from EMP
where SAL BETWEEN 2000 and 3000
order by SAL desc;

-- 직원 테이블에서 10번 또는 20번 부서에서 근무하는 직원들의 부서번호, 이름, 급여를 검색
-- 출력 순서는 (1)부서 번호 (2)이름 오름차순 정렬.

select DEPTNO, ENAME, SAL
from EMP
where DEPTNO = 10 or DEPTNO = 20
order by DEPTNO, ENAME;

select DEPTNO, ENAME, SAL
from EMP
where DEPTNO in (10, 20)
order by DEPTNO, ENAME;

-- SQL에서는 숫자만이 아니라 문자열을 비교할 때도 비교 연산자(=, !=, >, ...)을 사용함.

-- 직원 테이블에서 직책이 'CLERK'인 직원들의 직책, 이름, 급여를 출력.
-- 이름 오름차순 순서로 출력.
select JOB, ENAME, SAL
from EMP
where JOB = 'CLERK'
order by ENAME;

-- SQL에서 문자열은 작은따옴표('')를 사용.
-- 테이블에 저장된 데이터(문자열)은 대/소문자를 구분.

-- 직원 테이블에서 직책이 'CLERK' 또는 MANAGER인 직원들의 직책, 이름, 급여를 검색.
-- 출력 순서 (1) 직책 (2) 급여 오름차순 정렬.
select JOB, ENAME, SAL
from EMP
where JOB in ('CLERK', 'MANAGER')
order by JOB, SAL;

select JOB, ENAME, SAL
from EMP
where JOB ='CLERK' or JOB = 'MANAGER'
order by JOB, SAL;

-- 직원 테이블에서 20번 부서에서 근무하는 CLERK의 모든 정보를 검색
select *
from EMP
where DEPTNO = 20 and JOB = 'CLERK';

-- 직원 테이블에서 20번 부서에서 근무하거나 또는 직책이 CLERK인 직원들의 모든 정보를 검색
select *
from EMP
where DEPTNO = 20 or JOB = 'CLERK';

-- 직원 테이블에서 CLERK, ANALYST, MANAGER가 아닌 직원들의 사번, 이름, 직책, 급여를 검색
-- 사번 오름차순 정렬.
select EMPNO, ENAME, JOB, SAL
from EMP
where JOB !='CLERK' and JOB != 'ANALYST' and JOB != 'MANAGER'
order by EMPNO;

select EMPNO, ENAME, JOB, SAL
from EMP
where not (JOB = 'CLERK' or JOB = 'ANALYST' or JOB = 'MANAGER')
order by EMPNO;

select EMPNO, ENAME, JOB, SAL
from EMP
where not JOB in ('CLERK', 'ANALYST', 'MANAGER')
order by EMPNO;

select EMPNO, ENAME, JOB, SAL
from EMP
where JOB not in ('CLERK', 'ANALYST', 'MANAGER')
order by EMPNO;
