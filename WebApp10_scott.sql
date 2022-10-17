SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TBL_SCORE;


--�� ���� ���̺� ����
DROP TABLE TBL_SCORE PURGE;
--==>> Table TBL_SCORE��(��) �����Ǿ����ϴ�.


--�� ���� ������ ����
DROP SEQUENCE SCORESEQ;
--==>> Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.

--�� �ǽ� ���̺� ����(TBL_MEMBER)
CREATE TABLE TBL_SCORE
( SID   NUMBER
, NAME  VARCHAR2(30)        NOT NULL
, KOR   NUMBER(3,0)
, ENG   NUMBER(3,0)
, MAT   NUMBER(3,0)
, CONSTRAINT SCORE_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_SCORE��(��) �����Ǿ����ϴ�.

--�� ������ ����(MEMBERSEQ)
CREATE SEQUENCE SCORESEQ
NOCACHE;
--==>> Sequence SCORESEQ��(��) �����Ǿ����ϴ�.





--�� ������ �Է� �� �Է� ������ ����
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)
VALUES(SCORESEQ.NEXTVAL, '���¹�', 90, 80, 70);
--> �� �� ����
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '���¹�', 90, 80, 70)
;
--==>>  1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '�ֵ���', 80, 70, 60)
;
--==>>  1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '������', 70, 60, 50)
;
--==>>  1 �� ��(��) ���ԵǾ����ϴ�.



--�� ���̺� ������ ��ü ��ȸ ������ ����
SELECT SID, NAME, KOR, ENG, MAT
FROM TBL_SCORE
ORDER BY SID;
--> �� �� ����
SELECT SID, NAME, KOR, ENG, MAT FROM TBL_SCORE ORDER BY SID
;
/*
1	���¹�	90	80	70
2	�ֵ���	80	70	60
3	������	70	60	50
*/


SELECT SID, NAME, KOR, ENG, MAT, KOR+ENG+MAT AS TOT, ((KOR+ENG+MAT)/3.0) AS AVG
FROM TBL_SCORE
ORDER BY SID;

--Ŀ��
COMMIT;
