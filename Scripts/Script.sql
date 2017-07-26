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
DROP TABLE IF EXISTS GoodsDetailImg; 
DROP TABLE IF EXISTS Goods; 

CREATE TABLE Goods (
	gcode     varchar(20) NOT NULL , -- 상품코드
	gname     varchar(40) NOT NULL , -- 상품명
	gcategory varchar(20) NOT NULL     , -- 상품분류
	gtitleimg    VARCHAR(200) NULL    , -- 상품대표이미지
	gprice    INTEGER      NULL    , -- 상품가격
	gsupprice    INTEGER      NULL    , -- 상품공급가격
	gregdate  TIMESTAMP    NOT NULL default now(), -- 상품게시일
	gisdisplay  BOOLEAN      NOT NULL default 1, -- 진열상태
	gisonsale  BOOLEAN      NOT NULL default 1 -- 판매상태
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


-- 상품상세이미지
CREATE TABLE GoodsDetailImg (
	gcode      varchar(20)  NOT NULL , -- 상품코드		
	gdetailimg text NULL   -- 상품상세이미지
);		
		
-- 상품상세이미지
ALTER TABLE GoodsDetailImg
	ADD CONSTRAINT FK_Goods_TO_Goods_detail_img -- 상품 -> 상품상세이미지
		FOREIGN KEY (
			gcode -- 상품코드
		)
		REFERENCES Goods ( -- 상품
			gcode -- 상품코드
		);



DROP TABLE IF EXISTS GoodsCategory; 		
-- 상품분류
CREATE TABLE GoodsCategory (
	gcategory      varchar(20)  NOT NULL  -- 상품분류
);

-- 상품분류
ALTER TABLE GoodsCategory
	ADD CONSTRAINT PK_Goods_Category -- 상품분류 기본키
		PRIMARY KEY (
			gcategory -- 상품분류
		);
		
/*
-- 수취인정보
DROP TABLE IF EXISTS Recipient; 
CREATE TABLE Recipient (
	rcno	  int		not null, -- 수취인번호
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
			rcno -- 수취인번호
		);

*/
-- 주문

CREATE TABLE Orders (
	ono         int not null  AUTO_INCREMENT primary key, -- 주문번호
	ocode       varchar(50) not null , -- 주문코드
	uid         varchar(20) NULL     , -- 회원아이디
	oisbasket   BOOLEAN      default 1, -- 장바구니여부
	gcode       varchar(20) NULL     , -- 상품코드
	oquantity   INTEGER      NULL default 0, -- 주문수량
	odate       TIMESTAMP    NOT NULL default now(), -- 주문날짜
	ototalprice INTEGER      NULL  default 0,-- 최종가격
	ocondition  INTEGER     NOT NULL  default 0-- 주문상태
);

/*
-- 주문
ALTER TABLE Orders
	ADD CONSTRAINT PK_Orders -- 주문 기본키
		PRIMARY KEY (
			ono -- 주문번호
		);
*/

		/*외래키 제약 없앰 (자바에서 처리)*/
/*-- 주문  
ALTER TABLE Orders
	ADD CONSTRAINT FK_Goods_TO_Orders -- 상품 -> 주문
		FOREIGN KEY (
			gcode -- 상품코드
		)
		REFERENCES Goods ( -- 상품
			gcode -- 상품코드
		);*/

-- 상품후기
CREATE TABLE Reviews (
	rno      INTEGER       NOT NULL auto_increment primary key, -- 상품후기번호
	gcode    varchar(20)  NULL     , -- 상품코드
	uid      varchar(20)  NULL     , -- 회원아이디
	rtitle   varchar(100) NOT NULL , -- 상품후기제목
	rcontent TEXT          NOT NULL , -- 상품후기내용
	rregdate TIMESTAMP     NOT NULL default now(), -- 상품후기등록일
	risexist boolean       NOT NULL default 0, -- 상품후기여부
	ono      int  		  NULL  -- 주문번호	
);

/*-- 상품후기
ALTER TABLE Reviews
	ADD CONSTRAINT PK_Review -- 상품후기 기본키
		PRIMARY KEY (
			rno -- 상품후기번호
		);*/

		/*외래키 제약 없앰 (자바에서 처리)*/
/*
-- 상품후기
ALTER TABLE Reviews
	ADD CONSTRAINT FK_Goods_TO_Review -- 상품 -> 상품후기
		FOREIGN KEY (
			gcode -- 상품코드
		)
		REFERENCES Goods ( -- 상품
			gcode -- 상품코드
		);
*/

				/*외래키 제약 없앰 (자바에서 처리)*/
/*-- 상품후기
ALTER TABLE Reviews
	ADD CONSTRAINT FK_Orders_TO_Review -- 주문 -> 상품후기
		FOREIGN KEY (
			ocode -- 주문코드
		)
		REFERENCES Orders ( -- 주문
			ocode -- 주문코드
		);
		
	*/		
-- 상품후기코멘트
CREATE TABLE Comments (
	cno      INTEGER        auto_increment primary key , -- 상품후기코멘트번호
	rno      INTEGER        NULL  , -- 상품후기번호
	ccontent varchar(1000) NULL   , -- 상품후기코멘트내용
	cdate    TIMESTAMP      NOT NULL default now()   -- 상품후기코멘트날짜
);

/*-- 상품후기코멘트
ALTER TABLE Comments
	ADD CONSTRAINT PK_Comment -- 상품후기코멘트 기본키
		PRIMARY KEY (
			cno -- 상품후기코멘트번호
		);*/


-- 주문내역
DROP TABLE IF EXISTS OrdersHistory; 
CREATE TABLE OrdersHistory (
	ono         int  NULL , -- 주문번호	
	ocode       varchar(50) NULL , -- 주문코드
	uid         varchar(20) NULL , -- 회원아이디
	odate       TIMESTAMP    NULL , -- 주문날짜
	oquantity   INTEGER      NULL , -- 주문수량
	ototalprice INTEGER      NULL default 0, -- 최종가격
	ocondition  INTEGER     NOT NULL  default 0-- 주문상태	
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
(2, '게시물02', 'user01'),
(3, '게시물03', 'user01'),
(4, '게시물04', 'user01'),
(5, '게시물05', 'user02'),
(6, '게시물06', 'user02'),
(7, '게시물07', 'user03'),
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

	INSERT INTO goodscategory
	(gcategory)values
	('coffee'),
	('items coffee'),
	('machines coffee'),
	('etc');

	INSERT INTO goods
	(gcode, gname, gcategory, gtitleimg, gprice, gsupprice, gregdate, gisdisplay, gisonsale) values
	('c10000', '관리자 계정으로 로그인 시 보이는 상품', 'coffee','imgEx',7500,5000, CURRENT_TIMESTAMP, 0, 0),
	('c10001', '코스타리카 돈 마요 100g', 'coffee','imgEx',7500,5000, CURRENT_TIMESTAMP, 1, 1),
	('c10002', '코스타리카 카틀레야 게이샤 100g', 'coffee','imgEx',16000,10000, CURRENT_TIMESTAMP, 1, 1),
	('m10003', '파나마 핀카 자미슨 모건 게이샤 100g', 'machines coffee','imgEx',32000,20000, CURRENT_TIMESTAMP, 1, 1),
	('m10004', '파나마 핀카 자미슨 모건 게이샤 200g', 'machines coffee','imgEx',64000,41000, CURRENT_TIMESTAMP, 0, 1),
	('m10005', '예멘 모카 마타리 200g', 'machines coffee','imgEx',22000,15000, CURRENT_TIMESTAMP, 0, 1),
	('c10006', '자메이카 블루마운틴 200g', 'coffee','',45000,30000, CURRENT_TIMESTAMP, 0, 1),
	('c10007', '하와이안 코나 엑스트라 팬시 200g', 'coffee','imgEx',43000,28000, CURRENT_TIMESTAMP, 0, 1),
	('c90002', '카뮤 더치 블렌드 500g', 'coffee','imgEx',35000,22000, CURRENT_TIMESTAMP, 0, 1),
	('c90003', '카뮤 블렌드 500g', 'coffee','imgEx',30000,20000, CURRENT_TIMESTAMP, 1, 1),
	('c90004', '에스프레소 블렌드 500g', 'coffee','imgEx',30000,20000, CURRENT_TIMESTAMP, 1, 1),
	('c90005', '카뮤 다크 블렌드 500g', 'coffee','imgEx',30000,20000, CURRENT_TIMESTAMP, 1, 1),
	('c20001', '케냐 클래식 500g', 'coffee','imgEx',35000,22000, CURRENT_TIMESTAMP, 1, 1),
	('c20002', '에티오피아 예가체프 500g', 'coffee','imgEx',37500,23000, CURRENT_TIMESTAMP, 1, 1),
	('c20003', '에티오피아 시다모 500g', 'coffee','imgEx',35000,22000, CURRENT_TIMESTAMP, 1, 1),
	('c20004', '에티오피아 코케 500g', 'coffee','imgEx',45000,30000, CURRENT_TIMESTAMP, 1, 1),
	('c20005', '인도네시아 만델링 500g', 'coffee','imgEx',35000,22000, CURRENT_TIMESTAMP, 1, 1),
	('c20006', '파푸아뉴기니 마라와카 블루마운틴 500g', 'coffee','imgEx',37500,23000, CURRENT_TIMESTAMP, 1, 1),
	('c20007', '콜롬비아 라 유니온 500g', 'coffee','imgEx',37500,23000, CURRENT_TIMESTAMP, 1, 0),
	('c20008', '과테말라 클래식 500g', 'coffee','imgEx',35000,22000, CURRENT_TIMESTAMP, 1, 1);

	INSERT INTO goodsdetail 
	(gcode, gdesc,gstock) values
	('c10000', '상세-관리자 계정으로 로그인 시 보이는 상품',   100),
	('c10001', '상세-코스타리카 돈 마요 100g',  100),
	('c10002', '상세-코스타리카 카틀레야 게이샤 100g',  10),
	('m10003', '상세-파나마 핀카 자미슨 모건 게이샤 100g',1),
	('m10004', '상세-파나마 핀카 자미슨 모건 게이샤 200g',1),
	('m10005', '상세-예멘 모카 마타리 200g', 1),
	('c10006', '상세-자메이카 블루마운틴 200g', 1),
	('c10007', '상세-하와이안 코나 엑스트라 팬시 200g', 1),
	('c90002', '상세-카뮤 더치 블렌드 500g', 1),
	('c90003', '상세-카뮤 블렌드 500g', 1),
	('c90004', '상세-에스프레소 블렌드 500g', 1),
	('c90005', '상세-카뮤 다크 블렌드 500g', 1),
	('c20001', '상세-케냐 클래식 500g', 1),
	('c20002', '상세-에티오피아 예가체프 500g', 1),
	('c20003', '상세-에티오피아 시다모 500g', 1),
	('c20004', '상세-에티오피아 코케 500g', 1),
	('c20005', '상세-인도네시아 만델링 500g', 1),
	('c20006', '상세-파푸아뉴기니 마라와카 블루마운틴 500g', 1),
	('c20007', '상세-콜롬비아 라 유니온 500g', 1),
	('c20008', '상세-과테말라 클래식 500g', 1);

	INSERT INTO goodsdetailimg 
	(gcode, gdetailimg) values
	('c10000','imgEx'),
	('c10000','imgEx'),
	('c10000','imgEx'),
	('c10001','imgEx'),
	('c10001','imgEx'),
	('c10001','imgEx'),
	('c10002','imgEx'),
	('c10002','imgEx'),
	('c10002','imgEx'),
	('m10003','imgEx'),
	('m10003','imgEx'),
	('m10003','imgEx'),
	('m10003','imgEx'),
	('m10004','imgEx'),
	('m10004','imgEx'),
	('m10004','imgEx'),
	('m10005','imgEx'),
	('c10006','imgEx'),
	('c10007','imgEx'),
	('c90002','imgEx'),
	('c90003','imgEx'),
	('c90004','imgEx'),
	('c90005','imgEx'),
	('c20001','imgEx'),
	('c20002','imgEx'),
	('c20003','imgEx'),
	('c20004','imgEx'),
	('c20005','imgEx'),
	('c20006','imgEx'),
	('c20007','imgEx'),
	('c20008','imgEx');



	select * from goods
	order by gcode desc, gregdate desc;
	
	select right(gcode, 5)+1 from goods where gcode='c20008';
	
	select  g.gcode, gname, gcategory, gtitleimg, gprice, gsupprice, gregdate,
	gisdisplay, gisonsale, gdesc, gdetailimg, gstock
		FROM goodsdetail gd join goods g
		on g.gcode = gd.gcode
		right outer join goodsdetailimg gdi
		on g.gcode = gdi.gcode
		where g.gcode = 'm10007'
		group by g.gcode;
/*	
	UPDATE goods
	SET gname='과테말라 클래식 500g', gcategory='coffee', gtitleimg= gprice=35000, gisdisplay=1
	WHERE gcode='c20007';
	
	UPDATE goodsdetail
	SET gdesc='상세-과테말라 클래식 500g',  gstock=1
	WHERE gcode='c20007';
	*/

	select * from goods
	where gisdisplay = true
		order by gcode desc, gregdate desc;
	
		
INSERT INTO goods
(gcode, gname, gcategory, gtitleimg, gprice, gsupprice, gregdate, gisdisplay, gisonsale) values
('c10998', '관리자 계정으로 로그인 시 보이는 상품2', 'coffee','imgEx',7500,5000, CURRENT_TIMESTAMP, 0, 0);
INSERT INTO goodsdetail
(gcode, gdesc,gstock) values
('c10998', '상세-관리자 계정으로 로그인 시 보이는 상품2', 100);
INSERT INTO goodsdetailimg
(gcode, gdetailimg) values
('c10998','imgEx'),
('c10998','imgEx');
		
select MAX(gcode) from goods 
		where gcategory like CONCAT('m','%');

		
select CONCAT('m',right(gcode, 5)+1) 
from goods where gcode='m10003';

/*INSERT INTO goodsdetail
		(gcode, gdesc, gdetailimg, gstock) values
		('c50009','상세설명','',100);*/
/*	=================================================================================*/	

/*
INSERT INTO reviews
(rno, gcode, uid, rtitle, rcontent, rregdate, ocode)
VALUES(000001, 'c10999', 'admin', '리뷰제목', '리뷰내용:너무좋아요', CURRENT_TIMESTAMP, 'a00001');
*/


select MAX(rno)+1 from reviews;


SELECT * FROM reviews where rno = 1;

SELECT * FROM goods
		where gname like CONCAT('%','3','%') and gisdisplay = true
		order by gcode desc,gregdate desc
		limit 0,10;
select count(*) from goods WHERE gname like CONCAT('%','1','%');		
	

/*	=================================================================================*/	
/*	=================================================================================*/	
/*리뷰*/


		
		
		

		
/*	=================================================================================*/	
/*주문*/


INSERT INTO orders
(ocode,uid, oisbasket, gcode, oquantity, 
odate, ototalprice, ocondition) values
('ad00002', 'admin', 1, 'c90002', 2, 
CURRENT_TIMESTAMP, 10000, 1),
('ad00002', 'admin', 1, 'c90002', 2, 
CURRENT_TIMESTAMP, 10000, 1),
('ad00002', 'admin', 1, 'c90002', 2, 
CURRENT_TIMESTAMP, 10000, 1),
('ad00002', 'admin', 1, 'c90002', 2, 
CURRENT_TIMESTAMP, 10000, 1),
('ad00002', 'admin', 1, 'c90002', 1, 
CURRENT_TIMESTAMP, 20000, 1),
('us00003', 'user01', 1, 'c90002', 1, 
CURRENT_TIMESTAMP, 30000, 1),
('us00004', 'user01', 1, 'c90002', 2, 
CURRENT_TIMESTAMP, 10000, -1),
('us00004','user01', 1, 'c90002', 3, 
CURRENT_TIMESTAMP, 20000, 1),
('us00004', 'user02', 1, 'c90002', 3, 
CURRENT_TIMESTAMP, 30000, -1),
('us00004', 'user02', 1, 'c90002', 3, 
CURRENT_TIMESTAMP, 30000, 0),
('us00005','user02', 0, 'c90002', 5, 
CURRENT_TIMESTAMP, 10000, 0);
		
UPDATE orders
SET oisbasket=1, oquantity=2,  ototalprice=40000
WHERE ocode='us00003';


SELECT ocode, ono, uid, oisbasket, gcode, oquantity, odate, ototalprice
FROM orders;


/*
INSERT INTO orders
(ocode, uid, oisbasket, gcode, oquantity, odate, ototalprice)
VALUES('us00007', 'admin', 1, 'c10999', 3, CURRENT_TIMESTAMP, 90000);
*/


select MAX(ocode)+1 from orders;
select * from orders;


select ocode, uid, oisbasket,  oquantity, odate, ototalprice, 
g.gcode, gname, gcategory, gtitleimg, gprice, gsupprice, gregdate, gisdisplay, gisonsale	 
from orders o
left join goods g on o.gcode=g.gcode
where ono = 4;

select ocode, ono, uid, oisbasket,  oquantity, odate, ototalprice, 
		g.gcode, gname, gcategory, gtitleimg, gprice, gsupprice, gregdate, gisdisplay, gisonsale	 
		from orders o left join goods g on o.gcode=g.gcode
where ocode = 'us00004';

select ocode, ono, uid, oisbasket,  oquantity, odate, ototalprice,
		g.gcode, gname, gcategory, gtitleimg, gprice, gsupprice, gregdate, gisdisplay, gisonsale	 
		from orders o left join goods g on o.gcode=g.gcode
		where uid = 'admin' and oisbasket = true;
		
select ocode from orders;

select concat(left('user99',2),lpad(substring(MAX(ocode), 2)+1, 5,'0')) 
		from orders;

/*====================================================================*/
/*리뷰*/

INSERT INTO reviews
(gcode, uid, rtitle, rcontent, rregdate, risexist, ono) values
('c10001', 'admin', '리뷰01', '리뷰01-상세', CURRENT_TIMESTAMP, true, 1),
('c10001', 'user01', '리뷰03', '리뷰03-상세', CURRENT_TIMESTAMP, true, 3),
('c10001', 'user01', '리뷰04', '리뷰04-상세', CURRENT_TIMESTAMP, true,4),
('c10001', 'user02', '리뷰06', '리뷰06-상세', CURRENT_TIMESTAMP, true,6),
('c10001', 'user02', '리뷰07', '리뷰07-상세', CURRENT_TIMESTAMP, true,7),
('c10001', 'user02', '리뷰09', '리뷰09-상세', CURRENT_TIMESTAMP, true,8);



select ocode, o.ono, o.uid, oisbasket,  oquantity, odate, ototalprice,ocondition,
		g.gcode, gname, gcategory, gtitleimg, gprice, gsupprice, gregdate, gisdisplay, gisonsale,
		rno, rtitle, rcontent, rregdate, risexist
		from orders o left join goods g on o.gcode=g.gcode
		left join reviews r on o.ono=r.ono
		where o.uid = 'admin' and ocondition = 1 and (risexist = 0 or risexist is null);
		
SELECT * FROM reviews r join goods g on r.gcode=g.gcode
		where rno = '1';
/*		
INSERT INTO comments
		(rno, ccontent)
		VALUES(1, "바보바보");		*/