-- 테이블에서 데이터 검색
--    (1) projection : 테이블에서 원하는 컬럼들을 선택
--    (2) selection : 테이블에서 조건을 만족하는 레코드(행)들을 검색.

-- select 컬럼, ... from 테이블 where 조건식 [order by 정렬기준 컬럼];

-- 직원 테이블(EMP)에서 10번 부서에 근무하는 직원들의 부서번호, 사번, 이름을 검색
select DEPTNO, EMPNO, ENAME
from EMP
where DEPTNO = 10;

-- 비교 연산자 : =, !=, >, >=, <, <=, is null, is not null

-- 직원 테이블에서 수당(comm)이 null이 아닌 직원들의 사번, 이름, 수당을 검색.
-- 출력 순서는 이름의 오름차순으로 정렬해서.
select EMPNO, ENAME, COMM
from EMP
where COMM is not null;