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