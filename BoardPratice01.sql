SELECT USER
FROM DUAL;

--�� �Խù� ��ȣ�� �ִ밪�� ���� ������ ����
SELECT NVL(MAX(NUM), 0) AS MAXNUM
FROM TBL_BOARD;

--�� �Խù� �ۼ� ������ ����
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
VALUES(1, '����', '1234', 'soo@test.com', '�����׽�Ʈ', '�����׽�Ʈ', '211.238.142.60', 0, SYSDATE);

--�� DB ���ڵ��� ������ �������� ������ ����
-- ����¡�� ������ �������� ���� ����� ���̴�.
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD;

--�� Ư�� ������(���۹�ȣ ~ ����ȣ) �Խù��� ����� �о���� ������ ����
--   ��ȣ, �̸�, ����, ��ȸ��, �ۼ���
SELECT NUM, NAME, SUBJECT,HITCOUNT, CREATED
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (
    SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
    FROM TBL_BOARD
    ORDER BY NUM DESC
    ) DATA
)
WHERE RNUM >= 1 AND RNUM<= 10;

--�� Ư�� �Խù� ��ȸ�� ���� ��ȸ Ƚ�� ���� ������ ����
UPDATE TBL_BOARD
SET HITCOUNT = HITCOUNT + 1
WHERE NUM = 1;

--�� Ư�� �Խù��� ������ �о���� ������ ����
SELECT NUM, NAME, SUBJECT, PWD, EMAIL, CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
FROM TBL_BOARD
WHERE NUM = 1;

--�� Ư�� �Խù��� �����ϴ�(�����ϴ�) ������ ����
DELETE
FROM TBL_BOARD
WHERE NUM = 1;

--�� Ư�� �Խù��� �����ϴ� ������ ����
UPDATE TBL_BOARD
SET NAME='' , PWD='', EMAIL='', SUBJECT='', CONTENT=''
WHERE NUM=1;

--�� ���� �����ϴ� �Խù��� ���� �Խù�
SELECT NVL(MAX(NUM), -1) AS NEXTNUM
FROM TBL_BOARD
WHERE NUM > 500;

--�� ���� �����ϴ� �Խù��� ���� �Խù�
SELECT NVL(MIN(NUM), -1) AS BEFORENUM
FROM TBL_BOARD
WHERE NUM < 500;

--�� �Խù� �˻� ��� ���� ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD
WHERE SUBJECT LIKE '%����%';

SELECT COUNT(*) AS COUNT
FROM TBL_BOARD
WHERE CONTENT LIKE '%����%';

SELECT COUNT(*) AS COUNT
FROM TBL_BOARD
WHERE NAME LIKE '%����%';




