set LINESIZE 100;

--사원들의 급여를 오름차순으로 정렬하는 쿼리문을 작성하시오.
select * from emp ORDER BY sal ASC;

--emp에서 사번, 이름, 급여를 출력하는데 이름이 빠른 사람부터 출력하세요
select empno, ename,sal from emp ORDER BY ename ASC;

--듀얼테이블이란 SYS 사용자가 소유하는 테이블이며 모든 사용자가 사용할 수 있다.
--한 행으로 결과를 출력하기 위한 테이블이고 산술연산이나 가상컬럼 등의 값을 한번만 출력하고 싶을 때 많이 사용한다.

desc dual
select sysdate-1 어제, sysdate 오늘, sysdate + 1 내일 from dual;

--45.5645를 소수 세번째 자리에서 반올림하시오
select ROUND(45.5645,3) from DUAL;

--etc.
select -10, ABS(-10) from dual;
select 34.678, FLOOR(34.678) from dual;
select 35.567, TRUNC(35.567) from dual;

--1200을 14로 나눈 나머지를 구하여라.
select MOD(1200,14) from dual;

--사원번호가 홀수인 사원들을 출력하시오
select * from emp where MOD(empno,2) = 1;

--sign 함수 사용
select SIGN(100) AS sign_value11, SIGN(-100) AS sign_value22
, SIGN(0) AS sign_value33, SIGN(NULL) AS sign_value44
from dual;

--ceil함수 - 소수점 자리의 숫자를 무조건 올리는 함수
select ceil(35.234), ceil(-45.2344), ceil(-35.678)
from dual;

--문자함수(LOWER, UPPER, INITCAP 등..)

--LOWER
select 'Welcome to Oracle' "적용전", LOWER('Welcome to Oracle')"LOWER적용후" FROM DUAL;

--UPPER
select 'Welcome to Oracle' "적용전", UPPER('Welcome to Oracle')"UPPER적용후" FROM DUAL;

--INITCAP
select 'WELCOME TO ORACLE' "적용전", INITCAP('Welcome to Oracle')"INITCAP적용후" FROM DUAL;

--LENGTH
select LENGTH('Oracle'), LENGTH('오라클') FROM DUAL;

--LENGTHB
select LENGTHB('Oracle'), LENGTHB('오라클') FROM DUAL;

--INSTR
select INSTR('Welcome To Oracle', 'o') FROM DUAL;

--emp 테이블에서 'smith' 이름을 갖는 사원을 출력하시오 단 'smith'는 그대로 사용하세요
select * from emp where LOWER(ename) = 'smith';
select * from emp where ename = UPPER('smith');

--emp 테이블에서 ename, job의 첫번째 글자를 대문자로 표현하세요
select INITCAP(ename), INITCAP(job) from emp;

--SUBSTR - 시작위치부터 선택 개수 만큼 문자를 추출
select SUBSTR('Welcome to Oracle', 4, 3) FROM DUAL;
select ename, 19||substr(hiredate,1, 2)년도, substr(hiredate, 4, 2) 달 FROM emp;
select ename, concat('19',substr(hiredate, 1, 2))년도, substr(hiredate,4 ,2) from emp;

--emp 테이블의 사원중에 05월에 입사한 사원들의 이름, 월급, 입사일을 출력하는 쿼리문을 작성하세요
select ename, sal, hiredate from emp where substr(hiredate, 4, 2) = '05';

--emp 테이블의 사원중에 이름의 마지막 글자가 'S'로 끝나는 사원의 이름, 월급, 직급을 출력하는 쿼리문을 작성하시오
--2가지 방법(LIKE, SUBSTR 사용)

select ename, sal, job from emp where ename LIKE '%S';
select ename, sal, job from emp where SUBSTR(ename, length(ename), 1) = 'S';

--emp 테이블의 사원중에 이름의 마지막 글자가 'ES'로 끝나는 사원의 이름, 월급, 직급을 출력하는 쿼리문을 작성하시오
--2가지 방법(LIKE, SUBSTR 사용)

select ename, sal, job from emp where SUBSTR(ename, -2, 2) = 'ES';

--emp 테이블의 사원중 이름의 4번째 글자가 'E'인 사원의 이름, 부서번호, 월급을 출력하는 쿼리문을 3가지로 작성하세요
--3가지 방법(LIKE, INSTR, SUBSTR)

select ename, deptno, sal from emp where ename LIKE'__E%';
select ename, deptno, sal from emp where INSTR(ename,'E',4,1) = 4;
select ename, deptno, sal from emp where substr(ename,4,1) = 'E';

--emp 테이블의 ename 컬럼에서 이름의 마지막 글자가 'D'인 사원의 이름, 월급, 입사일을 출력하는 쿼리문을 작성하세요
--(3가지 방법 사용 LIKE, SUBSTR, INSTR)

select ename, sal, hiredate from emp where INSTR(ename,'D',-1,1)  = LENGTH(ename);
select ename, sal, hiredate from emp where INSTR(ename, 'D', LENGTH(ename),1) = LENGTH(ename);

--실행을 시켜보고 의미파악을 해주시길 바랍니다.
select substr('Welcome to Oralcle', 3, 4), substrb('Welcome to Oracle', 3, 4) from dual;
select substr('웰컴투오라클', 3, 4), substrb('오라클오라클', 3, 4) from dual;

--LPAD / RPAD -특정 기호로 채우는 함수
--LPAD : 오른쪽 정렬 후 왼쪽에 생긴 빈 공백에 특정 문자를 채우는 함수

select LPAD('ORACLE' , 20 , '#') FROM DUAL;

--LTRIM / RTRIM - 공백문자를 삭제하는 함수이다.
select trim('a' from 'aaaaoracleaaaa')from dual;

--날짜 함수
select sysdate from dual;

--emp 테이블의 사원들의 현재까지의 근무일자를 구하시오
select ename, ROUND(sysdate-hiredate) AS"근무일수",round((sysdate-hiredate)/365, 1) 근무연수 from emp;

--지금까지 먹은 밥그릇 수를 구하시오
--하루에 3끼로 계산

select TO_NUMBER(SYSDATE - TO_DATE('1996/09/21','YYYY-MM-DD')) * 3 그릇 FROM DUAL;

--emp 테이블에서 직원들이 근무한 개월 수를 구하는 쿼리문
SELECT ENAME, SYSDATE, HIREDATE, MONTHS_BETWEEN(SYSDATE, HIREDATE) 근무개월수 FROM EMP;




