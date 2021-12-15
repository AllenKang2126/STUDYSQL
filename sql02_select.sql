-- alt + F10 : 새 워크시트(소스코드) 만들기

-- DQL(Data Query Language) : 데이터베이스 테이블에서 자료 검색.
-- select 컬럼1, 컬럼2, ... from 테이블 이름;

-- 부서 테이블(dept)에서 부서(dept no)와 부서 이름(name)을 검색.
select deptno, dname from dept;
SELECT deptno, dname FROM dept;
select DEPTNO, DNAME from DEPT;

-- 부서 테이블(dept)에서 모든 컬럼을 검색.
select deptno, dname, loc
from dept;
-- select한 컬럼 순서대로 출력.

select dname, loc, deptno
from dept;

select * from dept;
-- 테이블이 만들어진 컬럼 순서대로 출력.

-- 검색하는 컬럼 이름에 별명(출력문에서 보여질 컬럼 이름) 주기
-- select 컬럼이름 as 별명, ... from 테이블 이름;
select deptno as "부서 번호", dname as "부서 이름"
from dept;

-- 별명은 큰 따옴표("")로 묶어줌. 별명에 공백이 없는 경우에는 큰 따옴표를 생략 가능.

-- 원하는 컬럼에만 별명을 붙여 줄 수 있음.
select DEPTNO, dname as "부서 이름"
from DEPT;

-- 연결 연산자(||)
select DEPTNO || DNAME "부서 정보"
from DEPT;

select DNAME || '의 사무실 위치는' || LOC || '입니다.' as "부서 정보"  -- 별명만 큰 따옴표 사용
from DEPT;
-- Oracle에서 문자열(varchar, varchar2)은 작은 따옴표('')로 묶어줌.

-- 정렬해서 출력하기 : 오름차순(ascending order), 내림차순(descending order)
-- select 컬럼, ... from 테이블 이름 order by 정렬할 컬럼
-- 정렬은 오름차순 정렬이 기본이어서 asc는 생략 가능.
-- 부서 테이블(DEPT)에서 부서 번호(DEPTNO), 부서 이름(DNAME)을 부서 번호의 오름차순으로 출력.
select DEPTNO, DNAME
from DEPT
order by DEPTNO;

-- 부서 테이블(DEPT)에서 부서 번호(DEPTNO), 부서 이름(DNAME)을 부서 번호의 내림차순으로 출력.
select DEPTNO, DNAME
from DEPT
order by DEPTNO desc;

-- 직원 테이블(EMP)에서 사번(EMPNO)과 이름(ENAME)을 사번의 오름차순으로 출력.
select EMPNO, ENAME
from EMP
order by EMPNO;

-- 직원테이블(EMP)에서 이름(ENAME)과 직책(JOB)을 "SMITH는 CLERK입니다." 형식으로 출력.
select ENAME || '은(는) ' || JOB || '입니다.' as "사원 정보"
from EMP;

-- 직원테이블(EMP)에서 직책(JOB)을 검색
select JOB from EMP;

-- 중복 되지 않는 값들만 출력.
select distinct JOB from EMP;