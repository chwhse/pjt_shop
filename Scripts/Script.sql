
-- 회원
DROP TABLE IF EXISTS comments;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS reviews; 
DROP TABLE IF EXISTS users; 
CREATE TABLE users (
	uid    varchar(20)  NOT NULL , -- 회원아이디
	upw    varchar(20)  NOT NULL , -- 회원비밀번호
	uname  varchar(20)  NOT NULL , -- 회원명
	uemail varchar(50)  NULL     , -- 회원이메일
	uaddr  varchar(120) NULL     , -- 회원주소
	uphone varchar(20)  NULL     , -- 회원전화
	ugrade BOOLEAN  NOT NULL default false -- 계정등급
);

-- 회원
ALTER TABLE users
	ADD CONSTRAINT PK_users -- 회원 기본키
		PRIMARY KEY (
			uid -- 회원아이디
		);


-- 상품

DROP TABLE IF EXISTS goodsstock; 
DROP TABLE IF EXISTS goodsdetail; 
DROP TABLE IF EXISTS goodsdetailimg; 
DROP TABLE IF EXISTS goods; 

CREATE TABLE goods (
	gcode     varchar(20) NOT NULL , -- 상품코드
	gname     varchar(40) NOT NULL , -- 상품명
	gcategory varchar(20) NOT NULL     , -- 상품분류
	gtitleimg    VARCHAR(200) NULL    , -- 상품대표이미지
	gprice    INTEGER      NULL    , -- 상품가격
	gsupprice    INTEGER      NULL    , -- 상품공급가격
	gregdate  TIMESTAMP    NOT NULL default now(), -- 상품게시일
	gisdisplay  BOOLEAN      NOT NULL default 1 -- 진열상태
);

-- 상품
ALTER TABLE goods
	ADD CONSTRAINT PK_goods -- 상품 기본키
		PRIMARY KEY (
			gcode -- 상품코드
		);
		
-- 상품상세
CREATE TABLE goodsdetail (
	gcode      varchar(20)  NOT NULL , -- 상품코드
	gdesc      VARCHAR(2000) NULL   -- 상품설명
);


-- 상품상세
ALTER TABLE goodsdetail
	ADD CONSTRAINT PK_goods_detail -- 상품상세 기본키
		PRIMARY KEY (
			gcode -- 상품코드
		);
		
-- 상품상세
ALTER TABLE goodsdetail
	ADD CONSTRAINT FK_goods_TO_goods_detail -- 상품 -> 상품상세
		FOREIGN KEY (
			gcode -- 상품코드
		)
		REFERENCES goods ( -- 상품
			gcode -- 상품코드
		);


-- 상품재고
CREATE TABLE goodsstock (
	gcode      varchar(20)  NOT NULL , -- 상품코드		
	gstock int not null default 0   -- 상품재고
);		
		
-- 상품재고
ALTER TABLE goodsstock
	ADD CONSTRAINT FK_goods_TO_goodsstock -- 상품 -> 상품재고
		FOREIGN KEY (
			gcode -- 상품코드
		)
		REFERENCES goods ( -- 상품
			gcode -- 상품코드
		);

-- 상품상세이미지
CREATE TABLE goodsdetailimg (
	gcode      varchar(20)  NOT NULL , -- 상품코드		
	gdetailimg text NULL   -- 상품상세이미지
);		
		
-- 상품상세이미지
ALTER TABLE goodsdetailimg
	ADD CONSTRAINT FK_goods_TO_goods_detail_img -- 상품 -> 상품상세이미지
		FOREIGN KEY (
			gcode -- 상품코드
		)
		REFERENCES goods ( -- 상품
			gcode -- 상품코드
		);



DROP TABLE IF EXISTS goodscategory; 		
-- 상품분류
CREATE TABLE goodscategory (
	gcategory      varchar(20)  NOT NULL  -- 상품분류
);

-- 상품분류
ALTER TABLE goodscategory
	ADD CONSTRAINT PK_goods_category -- 상품분류 기본키
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

CREATE TABLE orders (
	ono         int not null  AUTO_INCREMENT primary key, -- 주문번호
	ocode       varchar(50) not null , -- 주문코드
	rno       	int			 null , -- 후기번호
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
ALTER TABLE orders
	ADD CONSTRAINT PK_orders -- 주문 기본키
		PRIMARY KEY (
			ono -- 주문번호
		);
*/

		/*외래키 제약 없앰 (자바에서 처리)*/
/*-- 주문  
ALTER TABLE orders
	ADD CONSTRAINT FK_goods_TO_orders -- 상품 -> 주문
		FOREIGN KEY (
			gcode -- 상품코드
		)
		REFERENCES goods ( -- 상품
			gcode -- 상품코드
		);*/

-- 상품후기
CREATE TABLE reviews (
	rno      INTEGER       NOT NULL auto_increment primary key, -- 상품후기번호
	gcode    varchar(20)  NULL     , -- 상품코드
	uid      varchar(20)  NULL     , -- 회원아이디
	rtitle   varchar(100) NOT NULL , -- 상품후기제목
	rcontent TEXT          NOT NULL , -- 상품후기내용
	rregdate TIMESTAMP     NOT NULL default now(),
	ono      INTEGER       NOT NULL-- 상품후기등록일
);
	-- 주문
/*ALTER TABLE orders
	ADD CONSTRAINT FK_Review_TO_orders -- 상품후기 -> 주문
		FOREIGN KEY (
			rno -- 후기번호
		)
		REFERENCES reviews ( -- 후기
			rno -- 후기번호
		) ON DELETE SET NULL ON UPDATE cascade
;*/
	
/*-- 상품후기
ALTER TABLE reviews
	ADD CONSTRAINT PK_Review -- 상품후기 기본키
		PRIMARY KEY (
			rno -- 상품후기번호
		);*/


	
-- 상품후기코멘트
CREATE TABLE comments (
	cno      INTEGER        auto_increment primary key , -- 상품후기코멘트번호
	rno      INTEGER        NULL  , -- 상품후기번호
	ccontent varchar(1000) NULL   , -- 상품후기코멘트내용
	cdate    TIMESTAMP      NOT NULL default now()   -- 상품후기코멘트날짜
);

/*-- 상품후기코멘트
ALTER TABLE comments
	ADD CONSTRAINT PK_Comment -- 상품후기코멘트 기본키
		PRIMARY KEY (
			cno -- 상품후기코멘트번호
		);*/


-- 주문내역
DROP TABLE IF EXISTS ordershistory; 
CREATE TABLE ordershistory (
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
DROP TABLE IF EXISTS boardscontent;
DROP TABLE IF EXISTS boards; 
CREATE TABLE boards (
	bno      INTEGER       NOT NULL DEFAULT 0, -- 게시글번호
	btitle   varchar(100) NOT NULL , -- 게시글제목
	uid      varchar(20)  NULL     , -- 회원아이디
	bregdate TIMESTAMP    NOT NULL default now(), -- 게시일
	breadcnt INTEGER       DEFAULT 0  -- 게시글조회수
);

-- 게시판
ALTER TABLE boards
	ADD CONSTRAINT PK_boards -- 게시판 기본키
		PRIMARY KEY (
			bno -- 게시글번호
		);
		
-- 게시판내용

CREATE TABLE boardscontent (
	bno      INTEGER NULL, -- 게시글번호
	bcontent TEXT    NULL -- 게시판내용
);

-- 게시판내용
ALTER TABLE boardscontent
	ADD CONSTRAINT FK_boards_TO_boards_content -- 게시판 -> 게시판내용
		FOREIGN KEY (
			bno -- 게시글번호
		)
		REFERENCES boards ( -- 게시판
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


/*	=================================================================================*/	

	INSERT INTO goodscategory
	(gcategory)values
	('coffee'),
	('items coffee'),
	('machines coffee'),
	('etc');

	INSERT INTO goods
	(gcode, gname, gcategory, gtitleimg, gprice, gsupprice, gregdate, gisdisplay) values
	('i10001', '관리자 계정으로 로그인 시 보이는 상품', 'items coffee','',7500,5000, CURRENT_TIMESTAMP, 0),
	('i10002', '코스타리카 돈 마요 100g', 'items coffee','',7500,5000, CURRENT_TIMESTAMP, 1),
	('i10003', '코스타리카 카틀레야 게이샤 100g', 'items coffee','',16000,10000, CURRENT_TIMESTAMP, 1),
	('m10001', '파나마 핀카 자미슨 모건 게이샤 100g', 'machines coffee','',32000,20000, CURRENT_TIMESTAMP, 1),
	('m10002', '파나마 핀카 자미슨 모건 게이샤 200g', 'machines coffee','',64000,41000, CURRENT_TIMESTAMP, 1),
	('m10003', '예멘 모카 마타리 200g', 'machines coffee','',22000,15000, CURRENT_TIMESTAMP, 1),
	('e10001', '자메이카 블루마운틴 200g', 'etc','',45000,30000, CURRENT_TIMESTAMP, 1),
	('e10002', '하와이안 코나 엑스트라 팬시 200g', 'etc','',43000,28000, CURRENT_TIMESTAMP, 1),
	('e10003', '카뮤 더치 블렌드 500g', 'etc','',35000,22000, CURRENT_TIMESTAMP, 1),
	('e10004', '카뮤 블렌드 500g', 'etc','',30000,20000, CURRENT_TIMESTAMP,1),
	('e10005', '에스프레소 블렌드 500g', 'etc','',30000,20000, CURRENT_TIMESTAMP, 1),
	('e10006', '카뮤 다크 블렌드 500g', 'etc','',30000,20000, CURRENT_TIMESTAMP, 1),
	('e20001', '케냐 클래식 500g', 'etc','',35000,22000, CURRENT_TIMESTAMP, 1),
	('e20002', '에티오피아 예가체프 500g', 'etc','',37500,23000, CURRENT_TIMESTAMP, 1),
	('e20003', '에티오피아 시다모 500g', 'etc','',35000,22000, CURRENT_TIMESTAMP, 1),
	('e20004', '에티오피아 코케 500g', 'etc','',45000,30000, CURRENT_TIMESTAMP,1),
	('e20005', '인도네시아 만델링 500g', 'etc','',35000,22000, CURRENT_TIMESTAMP, 1),
	('c10001', '파푸아뉴기니 마라와카 BM 500g', 'etc','',37500,23000, CURRENT_TIMESTAMP, 1),
	('c10002', '콜롬비아 라 유니온 500g', 'etc','',37500,23000, CURRENT_TIMESTAMP, 1),
	('c10003', '과테말라 클래식 500g', 'etc','',35000,22000, CURRENT_TIMESTAMP, 1);

	INSERT INTO goodsdetail 
	(gcode, gdesc) values
	('i10001', '상세-관리자 계정으로 로그인 시 보이는 상품'),
	('i10002', '상세-코스타리카 돈 마요 100g'),
	('i10003', '상세-코스타리카 카틀레야 게이샤 100g'),
	('m10001', '상세-파나마 핀카 자미슨 모건 게이샤 100g'),
	('m10002', '상세-파나마 핀카 자미슨 모건 게이샤 200g'),
	('m10003', '상세-예멘 모카 마타리 200g'),
	('e10001', '상세-자메이카 블루마운틴 200g'),
	('e10002', '상세-하와이안 코나 엑스트라 팬시 200g'),
	('e10003', '상세-카뮤 더치 블렌드 500g'),
	('e10004', '상세-카뮤 블렌드 500g'),
	('e10005', '상세-에스프레소 블렌드 500g'),
	('e10006', '상세-카뮤 다크 블렌드 500g'),
	('e20001', '상세-케냐 클래식 500g'),
	('e20002', '상세-에티오피아 예가체프 500g'),
	('e20003', '상세-에티오피아 시다모 500g'),
	('e20004', '상세-에티오피아 코케 500g'),
	('e20005', '상세-인도네시아 만델링 500g'),
	('c10001', '상세-파푸아뉴기니 마라와카 블루마운틴 500g'),
	('c10002', '상세-콜롬비아 라 유니온 500g'),
	('c10003', '상세-과테말라 클래식 500g');
INSERT INTO goodsstock
(gcode, gstock) values
	('i10001', 40),
	('i10002', 50),
	('i10003', 60),
	('m10001', 70),
	('m10002', 80),
	('m10003', 40),
	('e10001', 30),
	('e10002', 20),
	('e10003', 20),
	('e10004', 10),
	('e10005', 20),
	('e10006', 30),
	('e20001', 40),
	('e20002', 50),
	('e20003', 60),
	('e20004', 70),
	('e20005', 60),
	('c10001', 50),
	('c10002', 40),
	('c10003', 30);
	INSERT INTO goodsdetailimg 
	(gcode, gdetailimg) values
	('i10001', ''),
	('i10002', ''),
	('i10003', ''),
	('m10001', ''),
	('m10002', ''),
	('m10003', ''),
	('e10001', ''),
	('e10002', ''),
	('e10003', ''),
	('e10004', ''),
	('e10005', ''),
	('e10006', ''),
	('e20001', ''),
	('e20002', ''),
	('e20003', ''),
	('e20004', ''),
	('e20005', ''),
	('c10001', ''),
	('c10002', ''),
	('c10003', '');

SELECT uid, rtitle, rcontent, g.gcode, gname, gcategory, gtitleimg, gprice, gsupprice, gregdate, gisdisplay 
FROM reviews r join goods g on r.gcode=g.gcode
		where g.gcode = 'c10001';
		
	select right(gcode, 5)+1 from goods where gcode='c20008';
	

	select * from goods
	where gisdisplay = true
		order by gcode desc, gregdate desc;
	
		
select MAX(gcode) from goods 
		where gcategory like CONCAT('m','%');

		
select CONCAT('m',right(gcode, 5)+1) 
from goods where gcode='m10003';



select  g.gcode, gname, gcategory, gtitleimg, gprice, gsupprice, gregdate,
		gisdisplay, gdesc, gdetailimg
		FROM goodsdetail gd join goods g
		on g.gcode = gd.gcode
		right outer join goodsdetailimg gdi
		on g.gcode = gdi.gcode
		where g.gcode = 'c90002'
		group by g.gcode;
		
		

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


INSERT INTO reviews
(gcode, uid, rtitle, rcontent, rregdate, ono) values
('c10001', 'admin', '좋구만', '강추', CURRENT_TIMESTAMP, 1),
('c10001', 'user01', '좋아요', '두번째 구매', CURRENT_TIMESTAMP, 8),
('c10001', 'user01', '별루에여', '★☆★', CURRENT_TIMESTAMP, 9),
('c10002', 'user02', '괜차나여', '다에죠부', CURRENT_TIMESTAMP, 11),
('c10002', 'user02', '나쁘지않네요', '낫배드', CURRENT_TIMESTAMP, 12),
('c10002', 'user02', '젠젠', '내돈--', CURRENT_TIMESTAMP, 13);



select ocode, o.ono, o.uid, oisbasket,  oquantity, odate, ototalprice,ocondition,
		g.gcode, gname, gcategory, gtitleimg, gprice, gsupprice, gregdate, gisdisplay, 
		o.rno, rtitle, rcontent, rregdate
		from orders o left join goods g on o.gcode=g.gcode
		left join reviews r on o.rno=r.rno
		where o.uid = 'admin' and ocondition = 1 and o.rno is null;
		
SELECT * FROM reviews r join goods g on r.gcode=g.gcode
		where rno = '1';
		
/*INSERT INTO comments
		(rno, ccontent)
		VALUES(6, "바보바보");	*/	
		
/*select * from comments where rno=6 and last_insert_id();*/
		select * from comments 
		where rno=6 and cno=(select max(cno) from comments)  
		order by cdate desc;
		
SELECT * FROM reviews r join goods g on r.gcode=g.gcode
where g.gcode='c10001';

		
		
		

		
/*	=================================================================================*/	
/*주문*/


INSERT INTO orders
(ocode, uid, rno, gcode, oquantity, oisbasket, 
odate, ototalprice, ocondition) values
('ad00001', 'admin', 1, 'c10001', 1, 0,
CURRENT_TIMESTAMP, 10000, 1),
('ad00001', 'admin', null, 'e10001', 1, 0, 
CURRENT_TIMESTAMP, 10000, -1),
('ad00001', 'admin', null, 'e10002', 1,  0,
CURRENT_TIMESTAMP, 10000, -2),
('ad00001', 'admin', null,'c10002', 1,  0,
CURRENT_TIMESTAMP, 10000, 1),
('ad00002', 'admin', null, 'c10003', 1,  0,
CURRENT_TIMESTAMP, 10000, -1),
('ad00002', 'admin', null, 'i10002', 1,  0,
CURRENT_TIMESTAMP, 10000, -1),
('ad00002', 'admin', null, 'i10002', 1, 0, 
CURRENT_TIMESTAMP, 20000, -2),
('us00003', 'user01', 2, 'c10001', 1,  0,
CURRENT_TIMESTAMP, 30000, 1),
('us00004', 'user01', 3, 'c10001', 1,  0,
CURRENT_TIMESTAMP, 10000, -1),
('us00004','user01', null, 'c10001', 1,  0,
CURRENT_TIMESTAMP, 20000, 1),
('us00005', 'user02', 4, 'c10002', 1,  0,
CURRENT_TIMESTAMP, 30000, -1),
('us00005', 'user02', 5, 'c10002', 1,  0,
CURRENT_TIMESTAMP, 30000, 1),
('us00006','user02', 6, 'c10002', 1,  0,
CURRENT_TIMESTAMP, 10000, 1);
		

select MAX(ocode)+1 from orders;
select * from orders;


select ocode, uid, oisbasket,  oquantity, odate, ototalprice, 
g.gcode, gname, gcategory, gtitleimg, gprice, gsupprice, gregdate, gisdisplay	 
from orders o
left join goods g on o.gcode=g.gcode
where ono = 4;

select ocode, ono, uid, oisbasket,  oquantity, odate, ototalprice, 
		g.gcode, gname, gcategory, gtitleimg, gprice, gsupprice, gregdate, gisdisplay 
		from orders o left join goods g on o.gcode=g.gcode
where ocode = 'us00004';

select ocode, ono, uid, oisbasket,  oquantity, odate, ototalprice,
		g.gcode, gname, gcategory, gtitleimg, gprice, gsupprice, gregdate, gisdisplay	 
		from orders o left join goods g on o.gcode=g.gcode
where uid = 'admin' and oisbasket = true;
		

select concat(left('user99',2),lpad(substring(MAX(ocode), 2)+1, 5,'0')) 
		from orders;

/*====================================================================*/


/*select ocode, o.ono, o.uid, oisbasket,  oquantity, odate, ototalprice,ocondition,
g.gcode, gname, gcategory, gtitleimg, gprice, gsupprice, gregdate, gisdisplay,
rno, rtitle, rcontent, rregdate
from orders o left join goods g on o.gcode=g.gcode
left join reviews r on o.ono=r.ono
where o.uid = 'admin'  and ocondition in (1,-1); and ocondition = 1;
	*/	
		
/*gcategory, gtitleimg, gprice, gsupprice, gregdate, gisdisplay, rno, rtitle, rcontent, 
rregdate from orders o left join goods g on o.gcode=g.gcode left join reviews r on o.ono=r.ono 
where o.uid = 'admin' and rno is null and ocondition in (1,-1);*/

		
SELECT * FROM goods g join goodsstock gs on g.gcode= gs.gcode 
where gisdisplay = true and gstock > 0 
order by g.gcode desc, gregdate desc limit 0,16 ;


select ocode, ono, uid, oisbasket, oquantity, odate, ototalprice,ocondition, g.gcode, gname, 
gcategory, gtitleimg, gprice, gsupprice, gregdate, gisdisplay from orders o left 
join goods g on o.gcode=g.gcode where uid = 'admin';


SELECT * 
		FROM orders
		group by ocode
		order by ocode desc, odate desc
		limit 1,10;
		
select  g.gcode, gname, gcategory, gtitleimg, gprice, gsupprice, gregdate,
		gisdisplay, gstock, gdesc, gdetailimg
		FROM goodsdetail gd join goods g
		on g.gcode = gd.gcode
		join goodsstock gs
		on g.gcode = gs.gcode
		right outer join goodsdetailimg gdi
		on g.gcode = gdi.gcode
		where g.gcode = 'c90005'
		group by g.gcode;
		
		select MAX(gcode) 
		from goods 
		where gcategory like CONCAT('e','%');
		
select concat(left('admin',2),lpad(MAX(substring(ocode, 3))+1, 5,'0')) from orders ;

select MAX(substring(ocode, 3)) from orders;
select max(ocode) from orders;

SELECT uid, rtitle, rcontent,rregdate, g.gcode, gname, gcategory, gtitleimg, gprice, gsupprice, gregdate, gisdisplay
		FROM reviews r join goods g on r.gcode=g.gcode
		where uid = 'admin';
		
		select ocode, o.ono, o.uid, o.rno, oisbasket,  oquantity, odate, ototalprice, ocondition,
		g.gcode, gname, gcategory, gtitleimg, gprice, gsupprice, gregdate, gisdisplay,
		rtitle, rcontent, rregdate
		from orders o left join goods g on o.gcode=g.gcode
		left join reviews r on o.rno=r.rno
		where o.uid = 'admin' and o.rno is null 
		and ocondition =1;