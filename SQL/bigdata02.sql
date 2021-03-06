S---Q1---
SELECT STUDENT_NO AS 학번 ,
       STUDENT_NAME AS 이름 ,
       ENTRANCE_DATE AS 입학년도
FROM TB_STUDENT
WHERE DEPARTMENT_NO IN ('002')
ORDER BY 3

---Q2---
SELECT PROFESSOR_NAME ,
       PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE LENGTH(PROFESSOR_NAME) != 3

---Q3---
SELECT PROFESSOR_NAME AS 교수이름 ,
       121 - SUBSTR(PROFESSOR_SSN ,1,2) AS 나이
FROM TB_PROFESSOR
ORDER BY 2 ;

---Q4---
SELECT SUBSTR(PROFESSOR_NAME,2,3) AS 이름
FROM TB_PROFESSOR

---Q5---
SELECT STUDENT_NO ,
       STUDENT_NAME
FROM TB_STUDENT
WHERE SUBSTR(ENTRANCE_DATE,1,2) - SUBSTR(STUDENT_SSN,1,2) != 19

----------
SELECT TO_CHAR(TO_DATE(SUBSTR(ENTRANCE_DATE,1,2),'RR'),'YYYY'),
       TO_CHAR(TO_DATE(SUBSTR(STUDENT_SSN,1,2),'RR'),'YYYY')
FROM TB_STUDENT
-----------
SELECT STUDENT_NO,
       STUDENT_NAME
FROM TB_STUDENT
WHERE  TO_CHAR(TO_DATE(SUBSTR(ENTRANCE_DATE,1,2),'RR'),'YYYY') -
       TO_CHAR(TO_DATE(SUBSTR(STUDENT_SSN,1,2),'RR'),'YYYY') > 19 
---Q6---
SELECT TO_CHAR(TO_DATE('20201225','YYYYMMDD'),'DAY')
FROM DUAL ;

---Q7---
SELECT TO_CHAR(TO_DATE('99/10/11','YY/MM/DD'),'YYYY"년" MM"월" DD"일"') AS 일,
       TO_CHAR(TO_DATE('49/10/11','YY/MM/DD'),'YYYY"년" MM"월" DD"일"') AS 이,
       TO_CHAR(TO_DATE('99/10/11','RR/MM/DD'),'YYYY"년" MM"월" DD"일"') AS 삼,
       TO_CHAR(TO_DATE('49/10/11','RR/MM/DD'),'YYYY"년" MM"월" DD"일"') AS 사
FROM DUAL ;

---Q8---
SELECT STUDENT_NO ,
       STUDENT_NAME
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_NO,1,1) != 'A'

---Q9---
SELECT ROUND(AVG(POINT), 1)
FROM TB_GRADE
WHERE STUDENT_NO IN ('A517178')

---Q10---
SELECT DEPARTMENT_NO AS 학과번호,
       COUNT(DEPARTMENT_NO) AS "학생 수(명)"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1

---Q11---
SELECT COUNT(STUDENT_NO)-COUNT(COACH_PROFESSOR_NO)
FROM TB_STUDENT ;

---Q12---
SELECT SUBSTR(TERM_NO,1,4),
       ROUND(AVG(POINT),1)
FROM TB_GRADE
WHERE STUDENT_NO IN 'A112113'
GROUP BY SUBSTR(TERM_NO,1,4)
ORDER BY 1

---Q13---
SELECT  DEPARTMENT_NO ,
        SUM(CASE ABSENCE_YN WHEN 'Y' THEN 1
                       WHEN 'N' THEN 0
                       ELSE 0 END)
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1
