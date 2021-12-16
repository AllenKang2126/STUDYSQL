-- scott 계정 사용

-- 함수(function)
-- (1) 단일 행 함수 :
--     행(row)이 하나씩 함수의 argument로 전달되고, 행 마다 결과를 리턴하는 함수.
-- (2) 그룹함수(다중 행 함수) :
--     여러 개의 행(row)이 한꺼번에 함수의 argument로 전달되고,
--     여러 개의 행에서 하나의 결과를 리턴하는 함수.

-- 단일 행 함수의 예
select ENAME, lower(ENAME)
from EMP;

select HIREDATE, to_char(HIREDATE, 'RR/MM/DD')
from EMP;

-- nvl(컬럼이름, value) : 컬럼의 값이 null이 아니면 자기 자신을 리턴, null이면 value를 리턴.
-- nvl2(컬럼이름, value1, value2) : 컬럼이 값이 null 아니면 value1을, null이면 value2를 리턴.
select COMM, nvl(COMM, -1), nvl(COMM, COMM, -1)
from EMP;


-- 그룹 함수(다중 행 함수)의 예 :
-- count(개수), sum(합계), avg(평균), max(최댓값), min(최솟값), variance(분산), stddev(표준편차)
select count(ENAME), count(MGR), count(COMM)
from EMP;

select sum(SAL), avg(SAL), max(SAL), min(SAL),
    variance(SAL), stddev(SAL)
from EMP;


-- 목적 : 부서별 급여의 최댓값, 최솟값 찾기
select max(SAL), min(SAL)
from EMP
where DEPTNO = 30;

select DEPTNO,
    max(SAL), min(SAL)
from EMP
group by DEPTNO
order by DEPTNO;

-- 부서별 급여의 평균, 표준편차
select DEPTNO,
    round(avg(SAL), 2) as AVG_SAL, 
    round(stddev(SAL), 2) as SD_SAL
from EMP
group by DEPTNO
order by DEPTNO;


-- 직책별 직원수, 급여의 최댓값, 평균, 최솟값 검색.
-- 소수점 2자리까지 표시, 직책 오름차순 정렬
select job, count(*), max(SAL),
    round(avg(SAL), 2) as AVG_SAL,
    min(SAL)
from EMP
group by JOB
order by JOB;


-- 부서별, 직책별 부서번호, 직책, 직원수, 급여 평균 검색
select DEPTNO, job, count(*), round(avg(SAL), 2) as AVG_SAL
from EMP
group by DEPTNO, job
order by DEPTNO, job;

-- 소수점 2자리까지 표시. 정렬 순서는 (1) 부서 번호 (2) 직책 오름차순
select to_char(HIREDATE, 'YYYY') as YEAR, count(*) as COUNT
from EMP
group by to_char(HIREDATE, 'YYYY')
order by year;
-- select 절에서 만든 별명은 where, group by, having에서는 사용할 수 없고,
-- order by에서만 사용 가능!

/* SELECT 구문 순서
select 컬럼, ...
from 테이블
where (그룹 묶기 전에 검사할)조건식
group by 그룹을 묶어줄 컬럼, ...
having 그룹을 묶은 다음에 검사할 조건식
order by 출력 순서를 설정할 컬럼, ... 
*/

-- 부서별 부서 번호, 급여 평균을 검색.
-- 부서별 급여 평균이 2000 이상인 부서들만 출력.
-- 부서 번호 오름차순을 정렬 출력.
select DEPTNO, round(avg(SAL), 2) as AVG_SAL
from EMP
group by DEPTNO
having avg(SAL) >= 2000
order by DEPTNO;

-- emp 테이블에서 mgr가 null이 아닌 직원들 중에서
-- 부서별 급여 평균을 검색. 부서 번호 오름차순 출력.
select DEPTNO, avg(SAL)
from EMP
where mgr is not null
group by DEPTNO
order by DEPTNO;


-- 직책별 사원수를 검색.
-- 직책이 PRESIDENT는 제외.
-- 직책별 사원수가 3명 이상인 경우만 선택.
-- 직책 오름차순 출력.
select JOB, count(*) as COUNT
from EMP
where job != 'PRESIDENT'
group by JOB
having count(*) >= 3
order by JOB;

-- 입사연도, 부서 번호, 입사연도별 부서별 입사한 사원수 검색.
-- 1980년 제외.
-- 연도별 부서별 사원수가 2명 이상인 경우 선택.
-- 연도 오름차순 출력.
select to_char(HIREDATE, 'YYYY') as YEAR, DEPTNO, count(*)
from EMP
where to_char(HIREDATE, 'YYYY') != '1980'
group by to_char(HIREDATE, 'YYYY'), DEPTNO
having count(*) >= 2
order by YEAR;

select to_char(HIREDATE, 'YYYY') as YEAR, DEPTNO, count(*)
from EMP
group by to_char(HIREDATE, 'YYYY'), DEPTNO
having to_char(HIREDATE, 'YYYY') != '1980' and count(*) >= 2
order by YEAR;
