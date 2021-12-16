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

-- 숫자, 날짜, 문자열 타입들은 모두 크기 (대/소) 비교가 가능.

-- '1987/01/01' (포함) 이후에 입사한 사원들의 레코드(모든 컬럼)를 검색.
-- 입사일 오름차순으로 출력.
select *
from EMP
where HIREDATE >= '1987/01/01'
order by HIREDATE;

-- to_date(날짜 문자열, 날짜 포맷 문자열) : 문자열을 date 타입으로 변환.
-- 연/월/일, 월/일/연(미국식), 일/월/연(영국식) YYYY/MM/DD
-- 21/12/13, 13/12/21
select *
from EMP
where HIREDATE >= to_date('87/01/01','RR/MM/DD')
order by HIREDATE;

-- 이름이 'D' 이후의 문자를 이름으로 갖는 직원들의 레코드를 검색. 이름의 오름차순으로 출력.
select *
from EMP
where ENAME >= 'D'
order by ENAME;

-- 특정 문자(열)로 시작하는 단어를 검색
-- 'A'로 시작하는 이름을 갖는 직원들의 이름을 오름차순으로 출력.
select ENAME
from EMP
where ENAME like 'A%'  -- 이름(ENAME)의 글자 수 는 제한이 없고 A로 시작.
order by ENAME;

select ENAME
from EMP
where ENAME like 'A_' -- 이름이(ENAME)이 두 글자로 이루어져 있고, A로 시작.
order by ENAME;

select *
from EMP
where JOB like '_LERK';  -- ALERK, BLERK, CLERK, DLERK, ...

-- 직원 이름에 'E'가 포함된 직원들의 레코드(모든 컬럼)를 검색. 이름 오름차순 출력.
select *
from EMP
where ENAME like '%E%'
order by ENAME;

-- 30번 부서에서 일하는 직책이 SALES로 시작하는 직원들의
-- 사번, 이름, 급여, 부서번호, 직책을 검색. 사번 오름차순 출력.
select EMPNO, ENAME, SAL, DEPTNO, JOB
from EMP
where (DEPTNO = 30) and (JOB like 'SALES%')
order by EMPNO;

-- 20번, 30번 부서에서 일하는 직원들 중에서 급여가 2000을 초과하는
-- 직원들의 사번, 부서번호, 이름, 급여를 검색
-- 출력 순서 (1) 부서번호 오름차순 (2) 사번 오름차순
select EMPNO, DEPTNO, ENAME, SAL
from EMP
where DEPTNO in (20, 30) and SAL > 2000
order by DEPTNO, EMPNO;

-- 수당이 null이고, 매니저는 있고(not null), 직책이 MANAGER 또는 CLERK인
-- 직원들의 레코드를 검색. 사번 오름차순으로 출력.
select *
from EMP
where COMM is null
    and MGR is not null
    and JOB in ('MANAGER', 'CLERK')
order by EMPNO;
