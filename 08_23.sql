
/*emp 테이블에서 보너스를 받는 사원 중에 500과 1400이 아닌 사원들의 이름과 보너스 금액을 출력하시오 */
select ename, comm from emp where nvl(comm,0) not in(500,1400);

/*30번 부서의 사원들의 연봉을 20% 인상한 후 이름, 부서번호, 월급, 인상된 연봉 순으로 출력하시오*/
select ename 이름, deptno 부서번호, sal 월급, (sal*12)*1.2 인상된연봉 from emp where deptno = 30;

/*emp 테이블에서 이 회사의 사장의 이름과 부서번호 직급을 출력하는 쿼리문을 작성하시오*/
select ename, deptno, job from emp where mgr is NULL;

--emp 테이블의 사원 중에서 커미션을 받지 않는 사원의 월급을 15% 인상한 금액을 이름, 월급, 인상한 월급으로 출력하시요
select ename 이름, sal 사원, sal*1.15 인상된월급 from emp where comm IS null;
select ename, sal , sal*1.15, comm from emp where NVL(comm,0) =0;

--emp 테이블에서 이름에 'LA'가 들어가있지 않은 사원의 이름과 월급, 입사일을 출력하는 쿼리문을 작성하시오
select ename, sal, hiredate from emp where ename NOT LIKE '%LA%';

--emp 테이블에서 이름의 세번째 글자가 'R'이고 다섯번째 글짜가 'E'인사원의 이름과 월급, 그리고 연봉을 35%를 인상한 금액을
--추출하는 쿼리문을 작성하시오
select ename 이름, sal 월급, (sal*12*1.15) 연봉인상 from emp where ename like '_R_E%';

--사원 이름에 'TI'가 있는 사원과 첫번째 글자가 'S'로 시작하는 사원들의 이름, 월급, 직급을 출력 하세요
select ename 이름, sal 월급, job 직급 from emp where ename like 'S%' or ename like '%TI%';

--사원들의 급여를 오름차순으로 정렬하는 쿼리문을 작성하세요
select * from emp ORDER BY sal ASC;

--가장 최근에 입사한 사람부터 나오는 쿼리문을 작성하세요
select ename, hiredate from emp ORDER BY hiredate DESC;

--emp 테이블에서 급여가 많은 사원부터 출력하되 급여가 1600 이상인 사원들만 출력 하세요
select * from emp where sal >=1600 ORDER BY sal DESC;

--부서번호가 빠른 사원부터 출력하되 같은 부서내의 사원들은 최근에 입사한 사원부터 나오도록 쿼리문을 작성하세요
select ename, deptno, hiredate from emp ORDER BY deptno ASC, hiredate DESC;

--입사일이 81년 6월 1일 이후에 입사한 사원들을 출력하되 최근에 입사한 사원을 먼저 나오게 하세요
select * from emp where hiredate >='81-06-01' ORDER BY hiredate DESC;

/*emp 테이블에서 보너스를 받는 사원 중에 500과 1400이 아닌 사원들의 이름과 보너스 금액을 출력하시오 */
select ename, comm from emp where nvl(comm,0) not in(500,1400);

/*30번 부서의 사원들의 연봉을 20% 인상한 후 이름, 부서번호, 월급, 인상된 연봉 순으로 출력하시오*/
select ename 이름, deptno 부서번호, sal 월급, (sal*12)*1.2 인상된연봉 from emp where deptno = 30;

/*emp 테이블에서 이 회사의 사장의 이름과 부서번호 직급을 출력하는 쿼리문을 작성하시오*/
select ename, deptno, job from emp where mgr is NULL;

--emp 테이블의 사원 중에서 커미션을 받지 않는 사원의 월급을 15% 인상한 금액을 이름, 월급, 인상한 월급으로 출력하시요
select ename 이름, sal 사원, sal*1.15 인상된월급 from emp where comm IS null;
select ename, sal , sal*1.15, comm from emp where NVL(comm,0) =0;

--emp 테이블에서 이름에 'LA'가 들어가있지 않은 사원의 이름과 월급, 입사일을 출력하는 쿼리문을 작성하시오
select ename, sal, hiredate from emp where ename NOT LIKE '%LA%';

--emp 테이블에서 이름의 세번째 글자가 'R'이고 다섯번째 글짜가 'E'인사원의 이름과 월급, 그리고 연봉을 35%를 인상한 금액을
--추출하는 쿼리문을 작성하시오
select ename 이름, sal 월급, (sal*12*1.15) 연봉인상 from emp where ename like '_R_E%';

--사원 이름에 'TI'가 있는 사원과 첫번째 글자가 'S'로 시작하는 사원들의 이름, 월급, 직급을 출력 하세요
select ename 이름, sal 월급, job 직급 from emp where ename like 'S%' or ename like '%TI%';

--사원들의 급여를 오름차순으로 정렬하는 쿼리문을 작성하세요
select * from emp ORDER BY sal ASC;

--가장 최근에 입사한 사람부터 나오는 쿼리문을 작성하세요
select ename, hiredate from emp ORDER BY hiredate DESC;

--emp 테이블에서 급여가 많은 사원부터 출력하되 급여가 1600 이상인 사원들만 출력 하세요
select * from emp where sal >=1600 ORDER BY sal DESC;

--부서번호가 빠른 사원부터 출력하되 같은 부서내의 사원들은 최근에 입사한 사원부터 나오도록 쿼리문을 작성하세요
select ename, deptno, hiredate from emp ORDER BY deptno ASC, hiredate DESC;

--입사일이 81년 6월 1일 이후에 입사한 사원들을 출력하되 최근에 입사한 사원을 먼저 나오게 하세요
select * from emp where hiredate >='81-06-01' ORDER BY hiredate DESC;







