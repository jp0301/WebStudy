select USER
from DUAL;
--==>> SCOTT

--�� ������ ��ü ��ȸ
SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG 
FROM TBL_SCORE
ORDER BY SID;
--> �� �� ����
SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG  FROM TBL_SCORE ORDER BY SID
;

--�� ������ �߰� �Է�
--> �� �� ����
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '�ڿ���', 80, 70, 90)
;


--�� ��ü �ο� �� ��ȸ
SELECT COUNT(*) FROM TBL_SCORE;


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

