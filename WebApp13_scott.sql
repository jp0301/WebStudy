SELECT USER
FROM DUAL;
--==>> SCOTT


--�� ���� ���̺� ����
DROP TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.

--�� ���̺� ����(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( SID NUMBER
, NAME VARCHAR2(30) NOT NULL
, TEL VARCHAR2(40)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.

--�� ���� ������ ����
DROP SEQUENCE MEMBERSEQ;
--==>> Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.

--�� ������ ����
CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==>> Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.

--�� ���� ������ �Է�
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '������', '010-1111-1111');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '�ӽÿ�', '010-2222-2222');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '�ֳ���', '010-3333-3333');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '�ݺ���', '010-4444-4444');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '������', '010-5555-5555');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 5

--�� Ȯ��
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--> �� �� ����
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;
/*
1	������	010-1111-1111
2	�ӽÿ�	010-2222-2222
3	�ֳ���	010-3333-3333
4	�ݺ���	010-4444-4444
5	������	010-5555-5555
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� �ο� �� Ȯ��
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBER;
--> �� ��
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER
;

--�� ȸ�� ������ �˻�(SID)
SELECT SID, NAME, TEL
FROM TBL_MEMBER
WHERE SID=1;
--> �� �� ����
SELECT SID, NAME, TEL FROM TBL_MEMBER WHERE SID=1
;

--�� ȸ�� ������ ����
UPDATE TBL_MEMBER
SET NAME='����',TEL='010-1110-1110'
WHERE SID=1;
--> �� �� ����
UPDATE TBL_MEMBER SET NAME='����',TEL='010-1110-1110' WHERE SID=1
;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� ȸ�� ������ ���� ������ ����
DELETE 
FROM TBL_MEMBER
WHERE SID=1;
--> �� �� ����
DELETE FROM TBL_MEMBER WHERE SID=1
;

rollback;



--�� ���� ���̺� ����
DROP TABLE TBL_SCORE;
--==>> Table TBL_SCORE��(��) �����Ǿ����ϴ�.



--�� ���̺� ����(TBL_MEMBERSCORE)
CREATE TABLE TBL_MEMBERSCORE
( SID   NUMBER
, KOR   NUMBER(3)
, ENG   NUMBER(3)
, MAT   NUMBER(3)
, CONSTRAINT MEMBERSCORE_SID_PK PRIMARY KEY(SID)
, CONSTRAINT MEMBERSCORE_KOR_CK CHECK(KOR BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_ENG_CK CHECK(ENG BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_MAT_CK CHECK(MAT BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_SID_FK FOREIGN KEY(SID)
             REFERENCES TBL_MEMBER(SID)
);
--==>> Table TBL_MEMBERSCORE��(��) �����Ǿ����ϴ�.

--�� ���� ������ �Է�
INSERT INTO TBL_MEMBERSCORE(SID, KOR, ENG, MAT) VALUES(1, 90, 80, 70)
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ȯ��
SELECT SID, KOR, ENG, MAT
FROM TBL_MEMBERSCORE;
--> �� �� ����
SELECT SID, KOR, ENG, MAT FROM TBL_MEMBERSCORE
;
--==>>1	90	80	70

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� ���� �Է� �ο� �� Ȯ�� / ������ �Էµ� �ο� ��
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERSCORE;
--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE
;
--==>> 1

--�� ���� ������ �˻�(SID)
SELECT SID, KOR, ENG, MAT
FROM TBL_MEMBERSCORE
WHERE SID=1;
-->
SELECT SID, KOR, ENG, MAT FROM TBL_MEMBERSCORE WHERE SID=1
;

--�� ���� ������ ����
UPDATE TBL_MEMBERSCORE
SET KOR=99, ENG=99, MAT=99
WHERE SID=1;
--> �� �� ����
UPDATE TBL_MEMBERSCORE SET KOR=99, ENG=99, MAT=99 WHERE SID=1
;
--==>>1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

--�� Ȯ��
SELECT SID, KOR, ENG, MAT
FROM TBL_MEMBERSCORE;
--==>> 1	99	99	99

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� ���� ������ ����
DELETE
FROM TBL_MEMBERSCORE
WHERE SID=1;
--> ���� ����
DELETE FROM TBL_MEMBERSCORE WHERE SID=1
;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.


--�� ��ü ������ ��ȸ ������ ���� (SID, NAME, TEL, KOR, ENG, MAT)
SELECT A.SID, A.NAME, A.TEL, B.KOR, B.ENG, B.MAT
FROM TBL_MEMBER A, TBL_MEMBERSCORE B
WHERE A.SID = B.SID;
--> �� �� ����

-- LEFT OUTER JOIN
SELECT A.SID, A.NAME, A.TEL, B.KOR, B.ENG, B.MAT
FROM TBL_MEMBER A, TBL_MEMBERSCORE B
WHERE A.SID = B.SID(+);
/*
1	������	010-1111-1111	90	80	70
2	�ӽÿ�	010-2222-2222			
3	�ֳ���	010-3333-3333			
4	�ݺ���	010-4444-4444			
5	������	010-5555-5555			
*/

--�� ��ü ������ ��ȸ ������ ���� (SID, NAME, TEL, KOR, ENG, MAT) �� ��� ���� �� LEFT JOIN
SELECT A.SID, A.NAME, A.TEL, NVL(B.KOR, -1) AS KOR, NVL(B.ENG, -1) AS ENG, NVL(B.MAT,-1) AS MAT
FROM TBL_MEMBER A, TBL_MEMBERSCORE B
WHERE A.SID = B.SID(+);
/*
1	������	010-1111-1111	90	80	70
2	�ӽÿ�	010-2222-2222	-1	-1	-1
3	�ֳ���	010-3333-3333	-1	-1	-1
4	�ݺ���	010-4444-4444	-1	-1	-1
5	������	010-5555-5555	-1	-1	-1
*/

--�� ��ü ������ ��ȸ ���� ��(VIEW_MEMBERSCORE) ����
CREATE OR REPLACE VIEW  VIEW_MEMBERSCORE
AS
SELECT A.SID, A.NAME, A.TEL, NVL(B.KOR, -1) AS KOR, NVL(B.ENG, -1) AS ENG, NVL(B.MAT,-1) AS MAT
FROM TBL_MEMBER A, TBL_MEMBERSCORE B
WHERE A.SID = B.SID(+);
--==>> View VIEW_MEMBERSCORE��(��) �����Ǿ����ϴ�.

--�� �����Ѻ�(VIEW_MEMBERSCORE)�� Ȱ���� �� ����Ʈ ��ȸ ������ ����
--   ��ȣ, �̸�, ��������, ��������, ��������, ����, ���, ����

SELECT SID, NAME, KOR, ENG, MAT,(KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3.0 AS AVG
, RANK() OVER(ORDER BY (KOR+ENG+MAT)/3.0 DESC) AS RANK
FROM VIEW_MEMBERSCORE
ORDER BY SID;
-->
SELECT SID, NAME, KOR, ENG, MAT,(KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3.0 AS AVG, RANK() OVER(ORDER BY (KOR+ENG+MAT)/3.0 DESC) AS RANK FROM VIEW_MEMBERSCORE ORDER BY SID
;
/*
       SID NAME     KOR        ENG        MAT        TOT        AVG       RANK
---------- -------- ---------- ---------- ---------- ---------- ---------- ----------
         1 ������   90         80         70        240         80          1
         2 �ӽÿ�   -1         -1         -1         -3         -1          2
         3 �ֳ���   -1         -1         -1         -3         -1          2
         4 �ݺ���   -1         -1         -1         -3         -1          2
         5 ������   -1         -1         -1         -3         -1          2
*/

--�� ������ ��(VIEW_MEMBERSCORE)�� Ȱ���� ��ȣ �˻�
SELECT SID, NAME, KOR, ENG, MAT
FROM VIEW_MEMBERSCORE
WHERE SID=1;
--> �� �� ����
SELECT SID, NAME, KOR, ENG, MAT FROM VIEW_MEMBERSCORE WHERE SID=1
;


--�� ���� ������ ���ڵ� �� Ȯ��
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERSCORE
WHERE SID=1;
-->
SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE WHERE SID=1
;
--==>> 1





SELECT *
FROM TBL_MEMBER;

SELECT *
FROM TBL_MEMBERSCORE;





SELECT LAST_NUMBER 
FROM USER_SEQUENCES
WHERE SEQUENCE_NAME = 'MEMBERSEQ';

ALTER SEQUENCE MEMBERSEQ INCREMENT BY 1;

SELECT MEMBERSEQ.NEXTVAL
FROM DUAL;

ALTER SEQUENCE MEMBERSEQ INCREMENT BY 1;

SELECT LAST_NUMBER 
FROM USER_SEQUENCES
WHERE SEQUENCE_NAME = 'MEMBERSEQ';

ALTER SEQUENCE MEMBERSEQ RESTART START WITH 7;





