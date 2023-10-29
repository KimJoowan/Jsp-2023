-- 데이터베이스 생성 : jinsookdb는 데이터베이스명
CREATE DATABASE jinsookdb;

-- 사용자 생성
CREATE USER jinsook@localhost IDENTIFIED BY '1111';

-- 사용자의 db에 대한 권한 부여
GRANT ALL privileges ON jinsookdb.* TO jinsook@localhost WITH GRANT OPTION;

-- 권한 갱신
FLUSH PRIVILEGES;

-- 데이터베이스 조회
SHOW DATABASES;

-- board 테이블
CREATE TABLE BOARD(
    BCODE INT AUTO_INCREMENT PRIMARY KEY,
    SUBJECT VARCHAR(100),
    CONTENT TEXT,
    WRITER VARCHAR(50),
    REGDATE DATE
);
COMMIT;

INSERT INTO board(subject, content, writer, regdate) VALUES('안녕', '반가워요', 'gildong', SYSDATE());
INSERT INTO board(subject, content, writer, regdate) VALUES('안녕2', '반가워요2', 'gildong2', SYSDATE());
INSERT INTO board(subject, content, writer, regdate) VALUES('안녕3', '반가워요3', 'gildong3', SYSDATE());
INSERT INTO board(subject, content, writer, regdate) VALUES('안녕4', '반가워요4', 'gildong4', SYSDATE());

CREATE TABLE REPLY(
    RCODE INT AUTO_INCREMENT PRIMARY KEY,
    BCODE INT,
    REPLY VARCHAR(200),
    WRITER VARCHAR(50),
    REGDATE DATE
);
COMMIT;

INSERT INTO reply(bcode, reply, writer) VALUES(1, '저도 안녕', 'sunshin');
INSERT INTO reply(bcode, reply, writer) VALUES(1, '잘 지내고 계시죠?', 'sunyoung');

SELECT * FROM board;
SELECT * FROM reply;


DELIMITER $$
CREATE OR REPLACE PROCEDURE proc_comments(
   IN _bcode INT,
   IN _content VARCHAR(100)
)

BEGIN
   DECLARE max_ccode INT;
   
   SELECT MAX(ccode) INTO max_ccode FROM comments WHERE bcode = _bcode;
   IF max_ccode IS NULL THEN
      INSERT INTO comments(bcode, ccode, content, regate) VALUES(_bcode, 1, _content, SYSDATE());
   ELSE 
      INSERT INTO comments(bcode, ccode, content, regate) VALUES(_bcode, max_ccode+1,  _content, SYSDATE());
   END IF;
END $$

DELIMITER;



















