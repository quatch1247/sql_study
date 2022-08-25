--ADD_MONTH : 특정개월 수를 더한 날짜를 구하는 함수
--emp 테이블에서 입사 날짜에서 4개월을 추가한 결과값을 나타내는 쿼리문
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 4) FROM EMP;

--NEXT_DAY : 해달날짜부터 명시된 요일을 만나면, 해당되는 날짜를 반환하는 함수
--오늘을 기준으로 가장 가까운 다음 수요일은 언제인지 알아보는 쿼리문
SELECT SYSDATE, NEXT_DAY(SYSDATE,'수요일') FROM DUAL;

SELECT SYS_CONTEXT('USERENV', 'LANGUAGE') "NLS SET" FROM DUAL;
SELECT * FROM nls_session_parameters WHERE PARAMETER in
('NLS_LANGUAHE', 'NLS_TERRITORY','NLS_DATE_FORMAT',
'NLS_DATE_LANGUAGE', 'NLS_SORT');

SELECT HIREDATE, LAST_DAY(HIREDATE) FROM EMP;

--포맷형식
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM DUAL;

--emp테이블에서 사원들의 입사일을 출력하되, 요일까지 함께 출력하는 쿼리문
SELECT HIREDATE, TO_CHAR(HIREDATE,'YYYY/MM/DD DAY') FROM EMP;

--현재 날짜와 시간을 출력하는 쿼리문
SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD, HH24:MI:SS') FROM DUAL;

--각 지역별 통화 기호를 앞에 붙이고 천 단위마다 콤마를 붙여서 출력하는 쿼리문
SELECT ENAME, SAL, TO_CHAR(SAL,'L999,999')FROM EMP;

--TO_DATE : 문자열을 날짜형으로 변환하는 함수

--1981년 2월 20일에 입사한 사원을 검색하는 쿼리문
SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE=19810220;

--=>에러 이유는 입사일 컬럼의 데이터 형은 DATE이므로 WHERE절에 숫자형으로 기술하면
--데이터형이 일치하지 않기 때문에 오류가 발생한다.
--오류가 발생하지 않게 하려면, 비교할 두 데이터의 자료형태를 맞추어야한다.
SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE=TO_DATE(19810220,'YYYY/MM/DD');

--몇일이 지났는지 현재 날짜에서 2021/12/20을 뺀 결과물을 출력하는 쿼리문
SELECT SYSDATE, TRUNC(SYSDATE- TO_DATE('2021/12/20','YYYY/MM/DD'))FROM DUAL;

--TO_NUMBER
SELECT TO_NUMBER('20,000','99,999')-TO_NUMBER('10,000', '99,999')FROM DUAL;

--emp 테이블에서 급여를 원화표시 88,950처럼 나오게 하고 이름, 급여 형식으로 출력하세오
SELECT ENAME AS "이름", TO_CHAR(SAL,'L999,999') AS "급여" FROM EMP;

--NUL 함수 : NULL 값을 0 또는 다른 값으로 변환하기 위해 사용하는 함수
SELECT * FROM EMP WHERE mgr is NULL;

--커미션을 받지 않은 사원의 월급을 1500원 인상해 지급하고 COMM 컬럼에 인상된 금액을 표시하세요.
--(단 숫자 0은 받는 걸로 취급함)
SELECT ENAME, SAL, COMM, NVL(comm,1500), SAL + nvl(comm,1500) AS "인상된 금액" FROM emp where comm is NULL;

--9월에 입사한 사원의 COMM을 2000원 추가하여 월급을 산출하세요 SAL+COMM 값이 나오도록 쿼리를 만드세요.
SELECT ENAME, HIREDATE,SAL,COMM,SAL + NVL(comm,0) + 2000 AS "인상된 월급" from emp WHERE SUBSTR(hiredate, 4,2) = '09'; 

--emp 테이블에서 상관이 없는 사원만 출력하되 MGL 컬럼에 NULL 대신 'CEO'라고 출력 되도록 하세요.
SELECT ename, mgr, NVL(TO_CHAR(mgr,'9999'),'CEO') from emp where mgr is null;

--음수 표시
SELECT TO_CHAR(-7856,'99,999PT') FROM DUAL;
SELECT TO_CHAR(-7856,'99,999MI') FROM DUAL;

--DECODE 
SELECT DEPTNO, DECODE(DEPTNO, 10,'A', 2,'B','DEFAULT') FROM EMP ORDER BY DEPTNO;

--직급에 따라 급여를 인상한다, 직급이 ANAIYST 인 사원은 5%인상, SALESMAN 10% MANAGER 15% CLERK 20%인상한 금액을 출력하세요
SELECT ENAME,SAL,JOB, DECODE(JOB, 'ANAIYST', SAL * 1.05,
                                'SALESMAN',SAL * 1.1, 
                                'MANAGER', SAL * 1.2,
                                'CLERK', SAL * 1.2, SAL) AS "UPSAL"
FROM EMP;

--이름 글자 수에 따라 월급을 인상합니다.4글자 10% / 5글자 20% / 6글자 30% 인상한 결과를 작성하세요.
SELECT ENAME, LENGTH(ENAME),  SAL,  DECODE(LENGTH(ENAME), 4, SAL*1.1,
                                                        5, SAL*1.2,
                                                        6, SAL*1.3,
                                                        SAL) AS "UPSAL"
FROM EMP;
                                       
--CASE 함수 :  조건에 따라 다른 처리가 가능한 함수
--DECODE함수는 조건이 일치 하는 경우에만 적용하지만 CASE 함수는 다양한 비교 연산자를 사용하여 조건 제시 및 범위지정을 할 수 있다.

--부서번호에 해당하는 부서명을 구하는 쿼리문을 작성하시오
SELECT ENAME, DEPTNO,
CASE WHEN DEPTNO = 10 THEN 'ACCOUNTING'
     WHEN DEPTNO = 20 THEN 'RESEARCH'
     WHEN DEPTNO = 30 THEN 'SALES'
     WHEN DEPTNO = 40 THEN 'OPERATIONS'
     ELSE 'default'
     END as dname
FROM EMP;     

--직급에 따라 급여를 인상한다, 직급이 ANAIYST 인 사원은 5%인상, SALESMAN 10% MANAGER 15% CLERK 20%인상한 금액을 출력하세요
SELECT ENAME, JOB, SAL,
CASE WHEN JOB = 'ANAIYST' THEN sal * 1.05
     WHEN JOB = 'SALESMAN' THEN sal * 1.1
     WHEN JOB = 'MAMAGER' THEN sal * 1.15
     WHEN JOB = 'CLERK' THEN sal * 1.2
     END AS "인상된 월급"
FROM EMP;

--직급이 MANAGER 인 사람만 나오는데,
--부서 번호가 10이면 'NEW YORK'
--          20이면 'Dallas'
--그 외는 'Unknown'으로 나오게 하세요
SELECT ENAME, JOB, CASE WHEN DEPTNO = 10 THEN 'NEW YORK'
                        WHEN DEPTNO = 20 THEN 'Dallas'
                        ELSE 'Unknown'
                        END AS "근무지"
FROM EMP
WHERE JOB = 'MANAGER';


     

