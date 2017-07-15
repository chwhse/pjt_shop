-- 회원
DROP TABLE IF EXISTS Comments;
DROP TABLE IF EXISTS Reviews; 
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Users; 
CREATE TABLE Users (
	uid    varchar(20)  NOT NULL , -- 회원아이디
	upw    varchar(20)  NOT NULL , -- 회원비밀번호
	uname  varchar(20)  NOT NULL , -- 회원명
	uemail varchar(50)  NULL     , -- 회원이메일
	uaddr  varchar(120) NULL     , -- 회원주소
	uphone varchar(20)  NULL     , -- 회원전화
	ugrade BOOLEAN  NOT NULL default false -- 계정등급
);

-- 회원
ALTER TABLE Users
	ADD CONSTRAINT PK_Users -- 회원 기본키
		PRIMARY KEY (
			uid -- 회원아이디
		);


-- 상품
DROP TABLE IF EXISTS GoodsDetail; 
DROP TABLE IF EXISTS Goods; 
CREATE TABLE Goods (
	gcode     varchar(20) NOT NULL , -- 상품코드
	gname     varchar(40) NOT NULL , -- 상품명
	gcategory varchar(20) NULL     , -- 상품카테고리
	gthumb    VARCHAR(200) NULL    , -- 상품대표이미지
	gprice    INTEGER      NULL    , -- 상품가격
	gregdate  TIMESTAMP    NOT NULL default now(), -- 상품게시일
	gisexist  BOOLEAN      NOT NULL default 0 -- 존재여부
);

-- 상품
ALTER TABLE Goods
	ADD CONSTRAINT PK_Goods -- 상품 기본키
		PRIMARY KEY (
			gcode -- 상품코드
		);
		
-- 상품상세
CREATE TABLE GoodsDetail (
	gcode      varchar(20)  NOT NULL , -- 상품코드
	gdesc      VARCHAR(2000) NULL  , -- 상품설명
	gdetailimg text NULL  , -- 상품상세이미지
	gstock     INTEGER       NULL   -- 상품재고수량
);

-- 상품상세
ALTER TABLE GoodsDetail
	ADD CONSTRAINT PK_Goods_detail -- 상품상세 기본키
		PRIMARY KEY (
			gcode -- 상품코드
		);
		
-- 상품상세
ALTER TABLE GoodsDetail
	ADD CONSTRAINT FK_Goods_TO_Goods_detail -- 상품 -> 상품상세
		FOREIGN KEY (
			gcode -- 상품코드
		)
		REFERENCES Goods ( -- 상품
			gcode -- 상품코드
		);


-- 수취인정보
DROP TABLE IF EXISTS Recipient; 
CREATE TABLE Recipient (
	rcname    varchar(20)  NOT NULL , -- 수취인명
	rcemail   varchar(50)  NULL    , -- 수취인이메일
	rcaddr    varchar(120) NULL    , -- 수취인주소
	rcphone   varchar(20)  NULL    , -- 수취인전화
	rcmessage VARCHAR(120)  NULL    -- 전달메시지
);

-- 수취인정보
ALTER TABLE Recipient
	ADD CONSTRAINT PK_Recipient -- 수취인정보 기본키
		PRIMARY KEY (
			rcname -- 수취인명
		);



-- 주문

CREATE TABLE Orders (
	ocode       varchar(20) NOT NULL , -- 주문코드
	ono         varchar(20) NULL     , -- 주문번호
	uid         varchar(20) NULL     , -- 회원아이디
	oisbasket   BOOLEAN      NULL     , -- 장바구니여부
	gcode       varchar(20) NULL     , -- 상품코드
	oquantity   INTEGER      NOT NULL , -- 주문수량
	odate       TIMESTAMP    NOT NULL default now(), -- 주문날짜
	ototalprice INTEGER      NOT NULL , -- 최종가격
	rcname      varchar(20) NULL     , -- 수취인명
	ocondition  varchar(20) NULL      -- 주문상태
);

-- 주문
ALTER TABLE Orders
	ADD CONSTRAINT PK_Orders -- 주문 기본키
		PRIMARY KEY (
			ocode -- 주문코드
		);

-- 주문
ALTER TABLE Orders
	ADD CONSTRAINT FK_Goods_TO_Orders -- 상품 -> 주문
		FOREIGN KEY (
			gcode -- 상품코드
		)
		REFERENCES Goods ( -- 상품
			gcode -- 상품코드
		);

-- 상품후기
CREATE TABLE Reviews (
	rno      INTEGER       NOT NULL , -- 상품후기번호
	gcode    varchar(20)  NULL     , -- 상품코드
	uid      varchar(20)  NULL     , -- 회원아이디
	rtitle   varchar(100) NOT NULL , -- 상품후기제목
	rcontent TEXT          NOT NULL , -- 상품후기내용
	rregdate TIMESTAMP     NOT NULL default now(), -- 상품후기등록일
	ocode    varchar(20)  NULL      -- 주문코드
);

-- 상품후기
ALTER TABLE Reviews
	ADD CONSTRAINT PK_Review -- 상품후기 기본키
		PRIMARY KEY (
			rno -- 상품후기번호
		);


-- 상품후기
ALTER TABLE Reviews
	ADD CONSTRAINT FK_Goods_TO_Review -- 상품 -> 상품후기
		FOREIGN KEY (
			gcode -- 상품코드
		)
		REFERENCES Goods ( -- 상품
			gcode -- 상품코드
		);

-- 상품후기
ALTER TABLE Reviews
	ADD CONSTRAINT FK_Orders_TO_Review -- 주문 -> 상품후기
		FOREIGN KEY (
			ocode -- 주문코드
		)
		REFERENCES Orders ( -- 주문
			ocode -- 주문코드
		);
		
			
-- 상품후기코멘트
CREATE TABLE Comments (
	cno      INTEGER        NOT NULL , -- 상품후기코멘트번호
	rno      INTEGER        NULL  , -- 상품후기번호
	uid      varchar(20)   NULL   , -- 회원아이디
	ccontent varchar(1000) NULL   , -- 상품후기코멘트내용
	cdate    TIMESTAMP      NOT NULL default now()   -- 상품후기코멘트날짜
);

-- 상품후기코멘트
ALTER TABLE Comments
	ADD CONSTRAINT PK_Comment -- 상품후기코멘트 기본키
		PRIMARY KEY (
			cno -- 상품후기코멘트번호
		);

-- 상품후기코멘트
ALTER TABLE Comments
	ADD CONSTRAINT FK_Review_TO_Comment -- 상품후기 -> 상품후기코멘트
		FOREIGN KEY (
			rno -- 상품후기번호
		)
		REFERENCES Reviews ( -- 상품후기
			rno -- 상품후기번호
		);


-- 주문내역
DROP TABLE IF EXISTS OrdersHistory; 
CREATE TABLE OrdersHistory (
	ocode       varchar(20) NULL , -- 주문코드
	uid         varchar(20) NULL , -- 회원아이디
	ono         varchar(20) NULL , -- 주문번호
	odate       TIMESTAMP    NULL , -- 주문날짜
	oquantity   INTEGER      NULL , -- 주문수량
	ototalprice INTEGER      NULL  -- 최종가격
);



		
/*	=================================================================================*/			
		
		
		-- 게시판
DROP TABLE IF EXISTS BoardsContent;
DROP TABLE IF EXISTS Boards; 
CREATE TABLE Boards (
	bno      INTEGER       NOT NULL DEFAULT 0, -- 게시글번호
	btitle   varchar(100) NOT NULL , -- 게시글제목
	uid      varchar(20)  NULL     , -- 회원아이디
	bregdate TIMESTAMP    NOT NULL default now(), -- 게시일
	breadcnt INTEGER       DEFAULT 0  -- 게시글조회수
);

-- 게시판
ALTER TABLE Boards
	ADD CONSTRAINT PK_Boards -- 게시판 기본키
		PRIMARY KEY (
			bno -- 게시글번호
		);
		
-- 게시판내용

CREATE TABLE BoardsContent (
	bno      INTEGER NULL, -- 게시글번호
	bcontent TEXT    NULL -- 게시판내용
);

-- 게시판내용
ALTER TABLE BoardsContent
	ADD CONSTRAINT FK_Boards_TO_Boards_content -- 게시판 -> 게시판내용
		FOREIGN KEY (
			bno -- 게시글번호
		)
		REFERENCES Boards ( -- 게시판
			bno -- 게시글번호
		) ON DELETE CASCADE;

		
/*	=================================================================================*/	
/*----------------------------dump data insert-------------------------- */		

	
INSERT INTO users
(uid, upw, uname, uemail, uaddr, uphone, ugrade)values
('admin', '1234', '관리자', 'admin@gmail.com', 'Daegu IT', '010-1111-1234', true);

INSERT INTO users
(uid, upw, uname, uemail, uaddr, uphone)values
('user01', '1234', '회원01', 'user01@gmail.com', '대구아이티', '010-2222-1234'),
('user02', '1234', '회원02', 'user02@gmail.com', '대구아이티', '010-3333-1234'),
('user03', '1234', '회원03', 'user03@gmail.com', '대구아이티', '010-4444-1234'),
('user04', '1234', '회원04', 'user04@gmail.com', '대구아이티', '010-5555-1234'),
('user05', '1234', '회원05', 'user05@gmail.com', '대구아이티', '010-6666-1234'),
('user06', '1234', '회원06', 'user06@gmail.com', '대구아이티', '010-7777-1234'),
('user07', '1234', '회원07', 'user07@gmail.com', '대구아이티', '010-8888-1234'),
('user08', '1234', '회원08', 'user08@gmail.com', '대구아이티', '010-9999-1234'),
('user09', '1234', '회원09', 'user09@gmail.com', '대구아이티', '010-1010-1234'),
('user10', '1234', '회원10', 'user10@gmail.com', '대구아이티', '010-0110-1234');

INSERT INTO boards
(bno, btitle, uid) values
(1, '게시물01', 'admin'),
(2, '게시물02', 'admin'),
(3, '게시물03', 'admin'),
(4, '게시물04', 'admin'),
(5, '게시물05', 'admin'),
(6, '게시물06', 'admin'),
(7, '게시물07', 'admin'),
(8, '게시물08', 'admin'),
(9, '게시물09', 'admin'),
(10, '게시물10', 'admin');

INSERT INTO boardscontent
(bno, bcontent)values
(1, '내용01'),
(2, '내용02'),
(3, '내용03'),
(4, '내용04'),
(5, '내용05'),
(6, '내용06'),
(7, '내용07'),
(8, '내용08'),
(9, '내용09'),
(10, '내용10');

select MAX(bno)+1 from boards;

select * from boards
		order by bno desc, bregdate desc;

SELECT b.bno, b.btitle, bc.bcontent, b.uid, b.bregdate, b.breadcnt
FROM boards b join boardscontent bc on b.bno=bc.bno
where b.bno = 1;

UPDATE boardscontent
	set bcontent='99999'
	where bno = 10;

select count(*) from boards;	

/*	=================================================================================*/	
	INSERT INTO goods
	(gcode, gname, gcategory, gthumb, gprice, gregdate, gisexist) values
	('c10001', '코스타리카 돈 마요 100g', 'coffee','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif',7500, CURRENT_TIMESTAMP, 1),
	('c10002', '코스타리카 카틀레야 게이샤 100g', 'coffee','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif',16000, CURRENT_TIMESTAMP, 1),
	('c10003', '파나마 핀카 자미슨 모건 게이샤 100g', 'coffee','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif',32000, CURRENT_TIMESTAMP, 1),
	('c10004', '파나마 핀카 자미슨 모건 게이샤 200g', 'coffee','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif',64000, CURRENT_TIMESTAMP, 1),
	('c10005', '예멘 모카 마타리 200g', 'coffee','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif',22000, CURRENT_TIMESTAMP, 1),
	('c10006', '자메이카 블루마운틴 200g', 'coffee','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif',45000, CURRENT_TIMESTAMP, 1),
	('c10007', '하와이안 코나 엑스트라 팬시 200g', 'coffee','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif',43000, CURRENT_TIMESTAMP, 1),
	('c90002', '카뮤 더치 블렌드 500g', 'coffee','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif',35000, CURRENT_TIMESTAMP, 1),
	('c90003', '카뮤 블렌드 500g', 'coffee','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif',30000, CURRENT_TIMESTAMP, 1),
	('c90004', '에스프레소 블렌드 500g', 'coffee','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif',30000, CURRENT_TIMESTAMP, 1),
	('c90005', '카뮤 다크 블렌드 500g', 'coffee','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif',30000, CURRENT_TIMESTAMP, 1),
	('c20001', '케냐 클래식 500g', 'coffee','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif',35000, CURRENT_TIMESTAMP, 1),
	('c20002', '에티오피아 예가체프 500g', 'coffee','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif',37500, CURRENT_TIMESTAMP, 1),
	('c20003', '에티오피아 시다모 500g', 'coffee','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif',35000, CURRENT_TIMESTAMP, 1),
	('c20004', '에티오피아 코케 500g', 'coffee','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif',45000, CURRENT_TIMESTAMP, 1),
	('c20005', '인도네시아 만델링 500g', 'coffee','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif',35000, CURRENT_TIMESTAMP, 1),
	('c20006', '파푸아뉴기니 마라와카 블루마운틴 500g', 'coffee','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif',37500, CURRENT_TIMESTAMP, 1),
	('c20007', '콜롬비아 라 유니온 500g', 'coffee','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif',37500, CURRENT_TIMESTAMP, 1),
	('c20008', '과테말라 클래식 500g', 'coffee','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif',35000, CURRENT_TIMESTAMP, 1);

	INSERT INTO goodsdetail
	(gcode, gdesc, gdetailimg, gstock) values
	('c10001', '상세-코스타리카 돈 마요 100g', '/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif', 100),
	('c10002', '상세-코스타리카 카틀레야 게이샤 100g', '/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif', 10),
	('c10003', '상세-파나마 핀카 자미슨 모건 게이샤 100g','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif',1),
	('c10004', '상세-파나마 핀카 자미슨 모건 게이샤 200g','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif',1),
	('c10005', '상세-예멘 모카 마타리 200g','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif', 1),
	('c10006', '상세-자메이카 블루마운틴 200g','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif', 1),
	('c10007', '상세-하와이안 코나 엑스트라 팬시 200g','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif', 1),
	('c90002', '상세-카뮤 더치 블렌드 500g','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif', 1),
	('c90003', '상세-카뮤 블렌드 500g','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif', 1),
	('c90004', '상세-에스프레소 블렌드 500g','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif', 1),
	('c90005', '상세-카뮤 다크 블렌드 500g','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif', 1),
	('c20001', '상세-케냐 클래식 500g','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif', 1),
	('c20002', '상세-에티오피아 예가체프 500g','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif', 1),
	('c20003', '상세-에티오피아 시다모 500g','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif', 1),
	('c20004', '상세-에티오피아 코케 500g','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif', 1),
	('c20005', '상세-인도네시아 만델링 500g','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif', 1),
	('c20006', '상세-파푸아뉴기니 마라와카 블루마운틴 500g','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif', 1),
	('c20007', '상세-콜롬비아 라 유니온 500g','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif', 1),
	('c20008', '상세-과테말라 클래식 500g','/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif', 1);



	select * from goods
	order by gcode desc, gregdate desc;
	
	select right(gcode, 5)+1 from goods where gcode='c20008';
	
	select  g.gcode, gname, gcategory, gthumb, gprice, gregdate, gisexist, gdesc, gdetailimg, gstock
		FROM goods g join goodsdetail gd
		on g.gcode = gd.gcode
		where g.gcode = 'c20008';
	
	UPDATE goods
	SET gname='과테말라 클래식 500g', gcategory='coffee', gthumb='/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif', gprice=35000, gisexist=1
	WHERE gcode='c20008';
	
	UPDATE goodsdetail
	SET gdesc='상세-과테말라 클래식 500g', gdetailimg='/2017/07/05/s_3215e591-2e1f-4ae5-bbd2-eae7280e0c25_leaf2.gif', gstock=1
	WHERE gcode='c20008';

	

	





/*	=================================================================================*/	


