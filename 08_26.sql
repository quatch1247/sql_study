--그룹 함수
--VARIANCE(expr)은 분산을 STDDEV는 표준편차를 구해 반환한다.
--SELECT 문에 그룹함수를 사용하는 경우 그룹 함수를 적용하지않는 단순컬럼은 올 수 없다.

SELECT ENAME, DEPTNO, ROUND(SAL,0) FROM EMP;

SELECT SUM(SAL) FROM EMP;
SELECT AVG(SAL) FROM EMP;
SELECT MIN(SAL), MAX(SAL) FROM EMP;

--가장 최근에 입사한 사원의 입사일과 가장 먼저 입사한 사원의 입사일을 출력하세요
SELECT MIN(HIREDATE) 먼저입사, MAX(HIREDATE) 최근입사 FROM EMP;

--30번 소속 사원중에서 커미션을 받는 사원의 수를 구하시오
SELECT COUNT(*) FROM EMP WHERE DEPTNO = 30 AND COMM >0;

--DISTINCT : 중복배제
SELECT COUNT(DEPTNO), COUNT(DISTINCT DEPTNO) FROM EMP;

SELECT COUNT(JOB), COUNT(DISTINCT JOB) FROM EMP;

--MGR 컬럼(상관의 사원번호)에서 중복을 배제하고 출력 하세요
SELECT DISTINCT(MGR) FROM EMP;

--GROUP BY 절
 SELECT AVG(SAL) FROM EMP GROUP BY(DEPTNO);
 
-- 소속 부서별 사원의 수와 커미션을 받는 사원의 수를 카운트 하세요
SELECT DEPTNO, COUNT(*), COUNT(COMM) FROM EMP GROUP BY DEPTNO;

--EMP테이블에서 년도 별로 사원들이 몇명 입사했는지 카운트 하세요
SELECT TO_CHAR(HIREDATE,'YYYY') 년도, COUNT(*) FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY');

SELECT SUBSTR(HIREDATE,1, 2) 년도, COUNT(*) FROM EMP
GROUP BY SUBSTR(HIREDATE,1, 2);

SELECT TO_CHAR(HIREDATE,'MM') 월별, COUNT(*) FROM EMP
GROUP BY TO_CHAR(HIREDATE,'MM');


--문자형으로 바꾼 입사연도를 1980년과 비교를 해서 true이면 1의 값을 주세요.
--(DECODE 1번식 '1980, 1) 1의 값을 준 (1980년도)것을 COUNT 하였다.
SELECT COUNT(DECODE(TO_CHAR(HIREDATE,'YYYY'),'1980',1)) AS "1980",
       COUNT(DECODE(TO_CHAR(HIREDATE,'YYYY'),'1980',1)) AS "1980",
       COUNT(DECODE(TO_CHAR(HIREDATE,'YYYY'),'1982',1)) AS "1982",
       COUNT(DECODE(TO_CHAR(HIREDATE,'YYYY'),'1987',1)) AS "1987"
FROM EMP;

--HAVING 절

--부서별 평균급여를 구하고 그 결과 평균 급여가 2000이상인 부서만 출력하세요.
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO HAVING AVG(SAL) >=2000;

--1981년 5월 이후 입사자 중 커미션이 NULL이거나 0인 사원의 커미션은 500으로 그렇지 않으면 기존 커미션을 출력하세요
SELECT ENAME 입사자, HIREDATE, DECODE(COMM, NULL, 500, 0, 500, COMM) 커미션
FROM EMP WHERE HIREDATE > TO_DATE(19810531) ORDER BY ENAME;

--부서별 최대값과 최소값을 구하되 최대 급여가 2900 이상인 부서만 출력
SELECT DEPTNO, MAX(SAL), MIN(SAL) FROM EMP
GROUP BY DEPTNO
HAVING MAX(SAL) < 2900;

--부서별 평균 급여를 구하고 그 결과 평균 급여가 2000 이상인 부서만 출력
SELECT DEPTNO, AVG(SAL) FROM EMP 
GROUP BY DEPTNO
HAVING AVG(SAL) >= 2900;

--급여가 1000이상인 사람들로 부서별 평균급여를 구하고 그 결과 평균 급여가 2000이상인 부서만 출력하세요
SELECT DEPTNO, AVG(SAL) FROM EMP
WHERE SAL >=1000 GROUP BY DEPTNO
HAVING AVG(SAL) >= 2000;

SELECT JOB, COUNT(*) CNT FROM EMP
WHERE DEPTNO IN (10,20,30)
GROUP BY JOB
HAVING COUNT(*) > 2;

--이름에 'LA'가 들어 있지 않고 JOB 의 합이 JOB그룹과 JOB에 속한 사원수를 출력하세요
--(JOB, 카운트, 합 형식으로 나오게 하세요)
SELECT JOB, COUNT(*), SUM(SAL)
FROM EMP
WHERE ENAME NOT LIKE'%LA%'
GROUP BY job
HAVING SUM(SAL) >3000;

--JOIN
--CROSS JOIN 두개 이상의 테이블이 조인될 때 WHERE절에 의해 공통되는 칼럼에 의한 결합이 발생하지 않는 경우의 의미

--'DALLAS' 에서 근무하는 사원의 이름과 직급과 월급과 근무지를 출력하는 쿼리문을 작성하세요
SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS';

SELECT E.ENAME, E.JOB, E.SAL,D.LOC FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND D.LOC='DALLAS';

--'RESEARCH'부서에서 근무하는 사원들의 이름, 입사일과 월급과 근무지, 근무부서명을 출력하는 쿼리문을 작성하세요

SELECT E.ENAME, E.HIREDATE, E.SAL, D.LOC, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND D.DNAME='RESEARCH';

--직급이 'MANAGER'인 사원의 이름, 월급 근무지를 출력하는 쿼리문을 작성하세요
SELECT E.ENAME, E.SAL, D.LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND E.JOB = 'MANAGER';

--'ACCOUNTING' 부서 소속 사원들의 이름과 입사일과 근무지를 출력하세요
SELECT E.ENAME, E.HIREDATE, D.LOC FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND D.DNAME ='ACCOUNTING';


--NON EQUI JOIN : 동일 컬럼이 없이 다른 조건을 사용하여 조인할 때 쓰인다.
--조인 조건이 특정 범위 내에 있는지 조사하기 위해 WHERE 절의 조인 조건으로 = 연산자와 비교연산자를 사용한다.

--각 사원의 급여가 몇 등급인지 살펴보는 쿼리문
SELECT ENAME, SAL, GRADE FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL;

--한명의 사원 이름과 DEPT 테이블 소속 부서명, 급여의 SALGRADE 테이블 등급을 출력하는 쿼리문
--(사원 테이블에는 부서 이름과 급여 등급은 없고, 부서 번호와 급여만 있다.)

 SELECT E.ENAME, D.DNAME, S.GRADE
 FROM EMP E, DEPT D, SALGRADE S
 WHERE E.DEPTNO = D.DEPTNO AND E.SAL BETWEEN S.LOSAL AND S.HISAL;
 
 SELECT ENAME, JOB, SAL, GRADE FROM EMP JOIN SALGRADE ON SAL BETWEEN LOSAL AND HISAL;
 

 
 







