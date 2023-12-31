--Dao query
--Admin Dao
--1.로그인
SELECT * FROM ADMIN WHERE AID='3' AND APW='1';
-- (2) 로그인 후 세션에 넣을 용도 : admin aid로 dto 가져오기
SELECT * FROM ADMIN WHERE AID='admin';
--FILEBOARD DAO
INSERT INTO ADMIN (AID,APW, ANAME) VALUES ('GAN2','1','김관리');

--MemberDao
--(1)회원mid중복체크
SELECT COUNT(*) FROM MEMBER WHERE MID='go'; 
--(2)회원 memail중복체크
SELECT COUNT(*) FROM MEMBER WHERE MEMAIL = 'aaa@naver.com';
--(2)회원가입
INSERT INTO MEMBER (MID,MPW,MNAME,MEMAIL,MBIRTH,MADDRESS)
    VALUES ('JENIE','1','제니','JENIE@naver.com','1982/11/05','서울시');
--(3)로그인
SELECT * FROM MEMBER WHERE MID='JENIE' AND MPW ='1';
--(4)mid로 멤버 dto가져오기 (로그인 성공시 session에 setAttibute하기 위함)
SELECT * FROM MEMBER WHERE MID='JENIE';
--(5)회원정보수정 (특정mid의 정보 수정)
UPDATE MEMBER 
    SET MPW = '1',
        MNAME = '제니',
        MEMAIL ='JENIE@naver.com',
        MBIRTH = '1982/11/05',
        MADDRESS = '뉴욕시' 
    WHERE MID = 'JENIE';
--(6)회원리스트(top-n구문)
SELECT * FROM (SELECT ROWNUM RN , A.* FROM (SELECT * FROM MVC_MEMBER ORDER BY MNAME)A)WHERE RN BETWEEN 1 AND 3;
--(7)회원수
SELECT COUNT(*) CNT FROM MEMBER;
--(8)회원탈퇴
DELETE FROM MEMBER WHERE MID ='JENIE';
ROLLBACK;
COMMIT;

--FreeBoard Dao
--1.글목록
SELECT * FROM
  (SELECT ROWNUM RN, A.* FROM (SELECT F.*, MNAME FROM FREEBOARD F, MEMBER M
                              WHERE F.MID=M.MID 
                              ORDER BY FGROUP DESC, FSTEP) A)
  WHERE RN BETWEEN 2 AND 4;
--2.글갯수
SELECT COUNT(*) CNT FROM FILEBOARD;
--3.원글쓰기
INSERT INTO FREEBOARD (FID, MID, FTITLE, FCONTENT, FFILENAME, FGROUP, FSTEP, FINDENT, FIP)
  VALUES (FREEBOARD_SEQ.NEXTVAL, 'son','축구보러 갈사람','난 공격수', 'a.docx', 
    FREEBOARD_SEQ.CURRVAL, 0,0, '192.168.0.31');
--4.HIT UP
UPDATE FREEBOARD SET FHIT = FHIT+1 WHERE FID=2;
--5.DTO가져오기
SELECT F.*, MNAME FROM FREEBOARD F, MEMBER M WHERE F.MID=M.MID AND FID=1;
-- 6. 글수정 (특정 bid의 bname, btitle, bcontent, bip 수정)
UPDATE FILEBOARD 
  SET FNAME = '홍길동',
      FTITLE = '글2-1(글3)-수정',
      FCONTENT = '본문수정',
      FIP = '127.0.0.1'
    WHERE FID=4;
--삭제
DELETE FROM FREEBOARD WHERE FID=1;
--답변글
SELECT *FROM FREEBOARD WHERE FID = 3;
UPDATE FREEBOARD SET FSTEP = FSTEP+1 WHERE FGROUP =2 AND FSTEP>0;
INSERT INTO FREEBOARD ( FID,MID,FTITLE,FCONTENT,FFILENAME ,FHIT,FGROUP,FSTEP,FINDENT,FIP) 
    VALUES (FREEBOARD_SEQ.NEXTVAL, 'gayun', '글1','',NULL,0,2,2,2,'192.1.1.1');
COMMIT;
SELECT * FROM FREEBOARD ORDER BY FGROUP DESC, FSTEP;

--THEME
--전체 출력
SELECT * FROM THEME;
SELECT * FROM THEME WHERE TID=1;
--삽입
INSERT INTO THEME (TNO, TNMAE) VALUES (THEME_SEQ.NEXTVAL, '캠핑');
--LOCATION
--전체 출력
SELECT * FROM LOCATION;
SELECT * FROM LOCATION WHERE LID='1';
--삽입
INSERT INTO LOCATION (LNO, LNMAE) VALUES ('81', '일본');

--INFO
--1.글출력(TOP-N)
SELECT * FROM (SELECT ROWNUM RN, A.* 
    FROM (SELECT I.*, LNAME, TNAME FROM INFO I, LOCATION L, THEME T WHERE I.LNO=L.LNO AND I.TNO=T.TNO)
     A) WHERE RN BETWEEN 1 AND 2; 
--2.글갯수
SELECT COUNT(*) CNT FROM INFO;
--3.원글쓰기
INSERT INTO INFO (IID, AID, ITITLE, ICONTENT, LNO,TNO, IFILENAME,IFILENAME2 ,IHIT,IIP)
    VALUES (INFO_SEQ.NEXTVAL, 'GAN','가을은 뭐가 맛있을까','가을 제철 음식은?','82',3,'꽃게.jpg','고등어.jpg',0,'192.1.1.2');
--HIT UP
UPDATE INFO SET IHIT = IHIT+1 WHERE IID = 2;
--IID로 DTO 가져오기
SELECT * FROM INFO WHERE IID=1;
--수정
UPDATE INFO 
    SET ITITLE = '단풍 구경 가자!' , 
        ICONTENT = '서울에서 가장 이쁘게 단풍이 피는곳은?' ,
        LNO = '2',
        TNO = 5,
        IFILENAME = '단풍.jpg',
        IFILENAME2 = '설악산정원연못.jpg';
--dto가져오기
SELECT I.*, LNAME, TNAME FROM INFO I, LOCATION L, THEME T WHERE I.LNO=L.LNO AND I.TNO=T.TNO;

--삭제
DELETE FROM INFO WHERE IID=2;
--중요글(IINDENT에 아이콘 삽입)
SELECT *FROM INFO WHERE IID = 3;
INSERT INTO INFO ( IID, AID, ITITLE, ICONTENT, LNO,TNO, IFILENAME,IFILENAME2 ,IHIT,IINDENT,IIP) 
    VALUES (INFO_SEQ.NEXTVAL, 'GAN', '글1','','02',2,'',NULL,0,1,'192.1.1.1');
COMMIT;
SELECT * FROM INFO ORDER ;





















