-- 회원
DROP TABLE IF EXISTS Comment;
DROP TABLE IF EXISTS Review; 
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Users; 
CREATE TABLE Users (
	uid    varchar(20)  NOT NULL , -- 회원아이디
	upw    varchar(20)  NOT NULL , -- 회원비밀번호
	uname  varchar(20)  NOT NULL , -- 회원명
	uemail varchar(50)  NULL     , -- 회원이메일
	uaddr  varchar(120) NULL     , -- 회원주소
	uphone varchar(20)  NULL     , -- 회원전화
	ugrade BOOLEAN       NOT NULL  -- 계정등급
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
	gisexist  BOOLEAN      NOT NULL  -- 존재여부
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
	gdetailimg TEXT NULL  , -- 상품상세이미지
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
	ADD CONSTRAINT FK_Users_TO_Orders -- 회원 -> 주문
		FOREIGN KEY (
			uid -- 회원아이디
		)
		REFERENCES Users ( -- 회원
			uid -- 회원아이디
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
CREATE TABLE Review (
	rno      INTEGER       NOT NULL , -- 상품후기번호
	gcode    varchar(20)  NULL     , -- 상품코드
	uid      varchar(20)  NULL     , -- 회원아이디
	rtitle   varchar(100) NOT NULL , -- 상품후기제목
	rcontent TEXT          NOT NULL , -- 상품후기내용
	rregdate TIMESTAMP     NOT NULL default now(), -- 상품후기등록일
	ocode    varchar(20)  NULL      -- 주문코드
);

-- 상품후기
ALTER TABLE Review
	ADD CONSTRAINT PK_Review -- 상품후기 기본키
		PRIMARY KEY (
			rno -- 상품후기번호
		);


-- 상품후기
ALTER TABLE Review
	ADD CONSTRAINT FK_Users_TO_Review -- 회원 -> 상품후기
		FOREIGN KEY (
			uid -- 회원아이디
		)
		REFERENCES Users ( -- 회원
			uid -- 회원아이디
		);

-- 상품후기
ALTER TABLE Review
	ADD CONSTRAINT FK_Goods_TO_Review -- 상품 -> 상품후기
		FOREIGN KEY (
			gcode -- 상품코드
		)
		REFERENCES Goods ( -- 상품
			gcode -- 상품코드
		);

-- 상품후기
ALTER TABLE Review
	ADD CONSTRAINT FK_Orders_TO_Review -- 주문 -> 상품후기
		FOREIGN KEY (
			ocode -- 주문코드
		)
		REFERENCES Orders ( -- 주문
			ocode -- 주문코드
		);
		
			
-- 상품후기코멘트
CREATE TABLE Comment (
	cno      INTEGER        NOT NULL , -- 상품후기코멘트번호
	rno      INTEGER        NULL  , -- 상품후기번호
	uid      varchar(20)   NULL   , -- 회원아이디
	ccontent varchar(1000) NULL   , -- 상품후기코멘트내용
	cdate    TIMESTAMP      NOT NULL default now()   -- 상품후기코멘트날짜
);

-- 상품후기코멘트
ALTER TABLE Comment
	ADD CONSTRAINT PK_Comment -- 상품후기코멘트 기본키
		PRIMARY KEY (
			cno -- 상품후기코멘트번호
		);

-- 상품후기코멘트
ALTER TABLE Comment
	ADD CONSTRAINT FK_Review_TO_Comment -- 상품후기 -> 상품후기코멘트
		FOREIGN KEY (
			rno -- 상품후기번호
		)
		REFERENCES Review ( -- 상품후기
			rno -- 상품후기번호
		);

-- 상품후기코멘트
ALTER TABLE Comment
	ADD CONSTRAINT FK_Users_TO_Comment -- 회원 -> 상품후기코멘트
		FOREIGN KEY (
			uid -- 회원아이디
		)
		REFERENCES Users ( -- 회원
			uid -- 회원아이디
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
		
INSERT INTO boards
(bno, btitle, uid,  breadcnt) values
(1, '게시물01', 'user01', breadcnt+1),
(2, '게시물02', 'user02', breadcnt+1);

INSERT INTO boardscontent
(bno, bcontent)values
(1, '내용01'),
(2, '내용02');

select MAX(bno)+1 from boards;


select * from boards
order by bno desc, bregdate desc;