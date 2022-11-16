-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.3.36-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- samp 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `samp` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `samp`;

-- 테이블 samp.area 구조 내보내기
CREATE TABLE IF NOT EXISTS `area` (
  `area_name` varchar(50) DEFAULT NULL,
  `area_num` int(11) DEFAULT NULL,
  `area_mapy` double DEFAULT NULL,
  `area_mapx` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.area:~17 rows (대략적) 내보내기
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` (`area_name`, `area_num`, `area_mapy`, `area_mapx`) VALUES
	('서울특별시', 1, 37.56451755548164, 126.978120937795),
	('부산광역시', 6, 35.17789365444628, 129.08221002681358),
	('대구광역시', 4, 35.87116264060737, 128.63043439018423),
	('인천광역시', 2, 37.53380625335662, 126.81086286685046),
	('광주광역시', 5, 35.189408480703825, 126.89866852540074),
	('대전광역시', 3, 36.34130188924131, 127.38482281394823),
	('울산광역시', 7, 35.48126250952966, 129.179551611218),
	('세종특별자치시', 8, 36.541165331362244, 127.27216862481357),
	('경기도', 31, 37.39696188568239, 127.46315483992446),
	('강원도', 32, 37.748288838430526, 128.29316003115773),
	('충청북도', 33, 36.831589925261, 127.90416121890526),
	('충청남도', 34, 36.52821061111514, 127.00878754341326),
	('경상북도', 35, 36.476715876944276, 128.71158017155932),
	('경상남도', 36, 35.43411318532695, 128.23043999172398),
	('전라북도', 37, 35.69757906073408, 127.13032184433003),
	('전라남도', 38, 34.94081590343185, 126.9974056922874),
	('제주특별자치도', 39, 33.394337911303325, 126.55684728418466);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;

-- 테이블 samp.comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `comment` (
  `planner_no` int(11) DEFAULT NULL,
  `comment_no` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(200) DEFAULT NULL,
  `comment_content` varchar(500) DEFAULT NULL,
  `reg_date` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`comment_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.comment:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- 테이블 samp.faq 구조 내보내기
CREATE TABLE IF NOT EXISTS `faq` (
  `faq_no` int(11) NOT NULL AUTO_INCREMENT,
  `faq_title` varchar(200) DEFAULT NULL,
  `faq_writer` varchar(20) DEFAULT NULL,
  `faq_content` varchar(2000) DEFAULT NULL,
  `faq_regdate` varchar(20) DEFAULT NULL,
  `faq_cnt` int(20) DEFAULT NULL,
  `filename` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`faq_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.faq:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;

-- 테이블 samp.host 구조 내보내기
CREATE TABLE IF NOT EXISTS `host` (
  `HOST_ID` varchar(50) NOT NULL,
  `HOST_BIZNAME` varchar(100) DEFAULT NULL,
  `HOST_PW` varchar(200) DEFAULT NULL,
  `HOST_NAME` varchar(100) DEFAULT NULL,
  `HOST_BIRTH` varchar(100) DEFAULT NULL,
  `HOST_EMAIL` varchar(100) DEFAULT NULL,
  `HOST_PHONE` varchar(100) DEFAULT NULL,
  `HOST_ADDR1` varchar(200) DEFAULT NULL,
  `HOST_ADDR2` varchar(200) DEFAULT NULL,
  `HOST_STATUS` varchar(100) DEFAULT NULL,
  `HOST_BIZNUM` varchar(100) DEFAULT NULL,
  `HOST_BIZIMG` varchar(100) DEFAULT NULL,
  `HOST_BANK` varchar(100) DEFAULT NULL,
  `HOST_BANKNUM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`HOST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.host:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
/*!40000 ALTER TABLE `host` ENABLE KEYS */;

-- 테이블 samp.likes 구조 내보내기
CREATE TABLE IF NOT EXISTS `likes` (
  `like_type` varchar(20) DEFAULT NULL,
  `like_id` varchar(300) DEFAULT NULL,
  `user_id` varchar(300) DEFAULT NULL,
  `like_no` int(11) DEFAULT NULL,
  `like_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.likes:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;

-- 테이블 samp.manage 구조 내보내기
CREATE TABLE IF NOT EXISTS `manage` (
  `MANAGE_ID` varchar(50) NOT NULL,
  `MANAGE_PW` varchar(200) DEFAULT NULL,
  `MANAGE_NAME` varchar(20) DEFAULT NULL,
  `MANAGE_BIRTH` varchar(50) DEFAULT NULL,
  `MANAGE_EMAIL` varchar(50) DEFAULT NULL,
  `MANAGE_PHONE` varchar(20) DEFAULT NULL,
  `MANAGE_GRADE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MANAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.manage:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `manage` DISABLE KEYS */;
/*!40000 ALTER TABLE `manage` ENABLE KEYS */;

-- 테이블 samp.memo 구조 내보내기
CREATE TABLE IF NOT EXISTS `memo` (
  `planner_no` int(11) DEFAULT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `memo_day` int(11) DEFAULT NULL,
  `memo_content` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.memo:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `memo` DISABLE KEYS */;
/*!40000 ALTER TABLE `memo` ENABLE KEYS */;

-- 테이블 samp.place 구조 내보내기
CREATE TABLE IF NOT EXISTS `place` (
  `planner_no` int(11) NOT NULL,
  `user_id` varchar(200) NOT NULL,
  `planner_date` varchar(200) NOT NULL,
  `place_name` varchar(300) NOT NULL,
  `mapy` double NOT NULL,
  `mapx` double NOT NULL,
  `img` varchar(300) NOT NULL,
  `addr` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.place:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
/*!40000 ALTER TABLE `place` ENABLE KEYS */;

-- 테이블 samp.planner 구조 내보내기
CREATE TABLE IF NOT EXISTS `planner` (
  `planner_no` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(200) NOT NULL,
  `room_name` varchar(200) DEFAULT NULL,
  `planner_start` varchar(200) NOT NULL,
  `planner_end` varchar(200) NOT NULL,
  `planner_area` varchar(200) NOT NULL,
  `planner_title` varchar(200) DEFAULT NULL,
  `planner_show` varchar(50) DEFAULT NULL,
  `planner_day` int(11) NOT NULL,
  `planner_like` int(11) DEFAULT 0,
  `planner_areaNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`planner_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.planner:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `planner` DISABLE KEYS */;
/*!40000 ALTER TABLE `planner` ENABLE KEYS */;

-- 테이블 samp.qna 구조 내보내기
CREATE TABLE IF NOT EXISTS `qna` (
  `qna_num` int(11) NOT NULL AUTO_INCREMENT COMMENT '질문번호',
  `qna_user_id` varchar(20) DEFAULT NULL COMMENT '사용자-질문자아이디',
  `qna_regdate` datetime DEFAULT current_timestamp() COMMENT '사용자-질문한날짜',
  `qna_content` varchar(2000) DEFAULT NULL COMMENT '사용자-질문한내용',
  `qna_user_email` varchar(200) DEFAULT NULL COMMENT '사용자-질문자이메일',
  `qna_admin_id` varchar(20) DEFAULT NULL COMMENT '관리자아이디',
  `qna_answer` varchar(2000) DEFAULT NULL COMMENT '답변내용',
  `qna_answer_date` datetime DEFAULT NULL COMMENT '답변날짜',
  `qna_views` int(11) DEFAULT 0 COMMENT '답변여부(완료1,미완료0)',
  `qna_title` varchar(200) DEFAULT NULL COMMENT '사용자-질문제목',
  PRIMARY KEY (`qna_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.qna:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;

-- 테이블 samp.reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `reply` (
  `planner_no` int(11) DEFAULT NULL,
  `reply_no` int(11) NOT NULL AUTO_INCREMENT,
  `comment_no` int(11) DEFAULT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `reply_content` varchar(500) DEFAULT NULL,
  `reg_date` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`reply_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.reply:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;

-- 테이블 samp.reservation 구조 내보내기
CREATE TABLE IF NOT EXISTS `reservation` (
  `RES_ID` varchar(50) NOT NULL DEFAULT '0',
  `USER_ID` varchar(50) DEFAULT NULL,
  `IMP_UID` varchar(200) DEFAULT NULL,
  `MERCHANT_UID` varchar(200) DEFAULT NULL,
  `RES_NAME` varchar(50) DEFAULT NULL,
  `RES_TEL` varchar(50) DEFAULT NULL,
  `RES_EMAIL` varchar(100) DEFAULT NULL,
  `HOST_ID` varchar(50) DEFAULT NULL,
  `ROOM_ID` varchar(50) DEFAULT NULL,
  `ROOM_NAME` varchar(100) DEFAULT NULL,
  `ROOM_IMG` varchar(300) DEFAULT NULL,
  `PAY_DATE` datetime DEFAULT NULL,
  `PAY_AMOUNT` varchar(60) DEFAULT NULL,
  `RES_NUM` varchar(20) DEFAULT NULL,
  `RES_STATUS` varchar(30) DEFAULT '0',
  `RES_CHECKIN` date DEFAULT NULL,
  `RES_CHECKOUT` date DEFAULT NULL,
  PRIMARY KEY (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.reservation:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;

-- 테이블 samp.reservation_seq 구조 내보내기
CREATE TABLE IF NOT EXISTS `reservation_seq` (
  `RES_ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.reservation_seq:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `reservation_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_seq` ENABLE KEYS */;

-- 테이블 samp.review 구조 내보내기
CREATE TABLE IF NOT EXISTS `review` (
  `REVIEW_ID` varchar(50) NOT NULL,
  `ROOM_NAME` varchar(50) DEFAULT NULL,
  `ROOM_ID` varchar(50) DEFAULT NULL,
  `HOST_ID` varchar(50) DEFAULT NULL,
  `USER_ID` varchar(50) DEFAULT NULL,
  `REVIEW_CONTENT` varchar(1000) DEFAULT NULL,
  `REVIEW_IMG` varchar(50) DEFAULT NULL,
  `STAR_POINT` double DEFAULT NULL,
  `WRITE_TIME` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`REVIEW_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.review:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;

-- 테이블 samp.review_seq 구조 내보내기
CREATE TABLE IF NOT EXISTS `review_seq` (
  `REVIEW_ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`REVIEW_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.review_seq:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `review_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_seq` ENABLE KEYS */;

-- 테이블 samp.room 구조 내보내기
CREATE TABLE IF NOT EXISTS `room` (
  `ROOM_NAME` varchar(100) DEFAULT NULL,
  `ROOM_ADDR` varchar(500) DEFAULT NULL,
  `ROOM_ADDR_DETAIL` varchar(500) DEFAULT NULL,
  `ROOM_AREA` varchar(100) DEFAULT NULL,
  `ROOM_DESC` varchar(1000) DEFAULT NULL,
  `ROOM_ID` varchar(20) NOT NULL DEFAULT '0',
  `HOST_ID` varchar(50) DEFAULT NULL,
  `ROOM_PRICE` int(11) DEFAULT NULL,
  `ROOM_IMG_NO1` varchar(300) DEFAULT NULL,
  `ROOM_IMG_NO2` varchar(300) DEFAULT NULL,
  `ROOM_IMG_NO3` varchar(300) DEFAULT NULL,
  `ROOM_IMG_NO4` varchar(300) DEFAULT NULL,
  `ROOM_IMG_NO5` varchar(300) DEFAULT NULL,
  `ROOM_MAX` int(11) DEFAULT NULL,
  `ROOM_THEME` varchar(200) DEFAULT NULL,
  `ROOM_CAT` varchar(30) DEFAULT NULL,
  `ROOM_WIFI` varchar(10) DEFAULT NULL,
  `ROOM_PET` varchar(10) DEFAULT NULL,
  `ROOM_MEAL` varchar(10) DEFAULT NULL,
  `ROOM_PARKING` varchar(10) DEFAULT NULL,
  `ROOM_SWPOOL` varchar(10) DEFAULT NULL,
  `ROOM_LIKES` varchar(10) DEFAULT '0',
  `ROOM_STARS` varchar(10) DEFAULT '0',
  PRIMARY KEY (`ROOM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.room:~27 rows (대략적) 내보내기
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` (`ROOM_NAME`, `ROOM_ADDR`, `ROOM_ADDR_DETAIL`, `ROOM_AREA`, `ROOM_DESC`, `ROOM_ID`, `HOST_ID`, `ROOM_PRICE`, `ROOM_IMG_NO1`, `ROOM_IMG_NO2`, `ROOM_IMG_NO3`, `ROOM_IMG_NO4`, `ROOM_IMG_NO5`, `ROOM_MAX`, `ROOM_THEME`, `ROOM_CAT`, `ROOM_WIFI`, `ROOM_PET`, `ROOM_MEAL`, `ROOM_PARKING`, `ROOM_SWPOOL`, `ROOM_LIKES`, `ROOM_STARS`) VALUES
	('민박전문', '경기 안양시 만안구 안양천서로177', '래미안 101동 102호', '경기', '친절히 모시겠습니다.', 'ROOM001', 'host1', 75000, 'MinbakMain1.jpg', 'MinbakSub1.jpg', NULL, NULL, NULL, 4, 'city', '민박', NULL, 'Y', 'Y', 'Y', NULL, '42', '4'),
	('강원민박', '강원 홍천군 서면 한치골길 262', '1104-4', '강원', '정성을 다하겠읍니다.', 'ROOM002', 'host1', 80000, 'MinbakMain2.jpg', 'MinbakSub2.jpg', 'MinbakSub7.jpg', 'MinbakSub8.jpg', NULL, 4, 'mountain,forest,river', '민박', NULL, 'Y', 'Y', 'Y', NULL, '33', '4.5'),
	('경남민박', '경남 김해시 인제로 197', '1층', '경남', '많이 찾아주시는 현지의 명소', 'ROOM003', 'host1', 64000, 'MinbakMain3.jpg', 'MinbakSub3.jpg', 'MinbakSub2.jpg', 'MinbakSub9.jpg', 'MinbakSub10.jpg', 4, 'sea', '민박', NULL, 'Y', 'Y', NULL, NULL, '4', '3'),
	('동해민박', '부산 해운대구 송정해변로 12-8', '508-3', '부산', '밥이 맛있는 곳', 'ROOM004', 'host1', 78000, 'MinbakMain4.jpg', 'MinbakSub4.jpg', 'MinbakSub5.jpg', NULL, NULL, 4, 'sea,river', '민박', NULL, 'Y', NULL, 'Y', NULL, '3', '3'),
	('남해민박', '경기 안양시 만안구 삼막로96번길 110', '타워 7층', '경기', '경치가 끝내줘요', 'ROOM005', 'host1', 80000, 'MinbakMain5.jpg', 'MinbakSub5.jpg', NULL, NULL, NULL, 4, 'city', '민박', NULL, 'Y', 'Y', 'Y', NULL, '7', '4.5'),
	('창원민박', '강원 동해시 임항로 99', '유원지길 45', '강원', '30년 전통의 민박집입니다.', 'ROOM006', 'host06', 45000, 'MinbakMain6.jpg', 'MinbakSub6.jpg', 'MinbakSub2.jpg', 'MinbakSub11.jpg', 'MinbakSub12.jpg', 3, 'sea,forest,river', '민박', NULL, NULL, NULL, NULL, 'Y', '66', '4.5'),
	('마산민박', '경남 남해군 삼동면 양화금로 329-31', '314-84번지', '경남', '남해에서 둘째 가라면 서러워요.', 'ROOM007', 'host07', 90000, 'MinbakMain7.jpg', 'MinbakSub7.jpg', NULL, NULL, NULL, 3, 'sea', '민박', 'Y', 'Y', 'Y', NULL, 'Y', '54', '3'),
	('진해민박', '경남 창원시 마산합포구 구산면 해양관광로 1307-111', '활초리 4-21', '경남', '친절과 정성을 다하겠습니다.', 'ROOM008', 'host08', 60000, 'MinbakMain8.jpg', 'MinbakSub8.jpg', NULL, 'MinbakSub11.jpg', 'MinbakMain9.jpg', 4, 'sea,valley', '민박', 'Y', 'Y', 'Y', NULL, 'Y', '22', '2.5'),
	('일등펜션', '경남 창원시 마산합포구 구산면 괭이바다길 231-3', '19-2번지', '경남', '안녕하세요? 마산민박입니다.', 'ROOM009', 'host09', 110000, 'pensionMain1.jpg', 'pensionSub1.jpg', 'pensionSub6.jpg', 'pensionSub7.jpg', NULL, 3, 'sea', '펜션', NULL, 'Y', 'Y', NULL, NULL, '13', '2'),
	('강남펜션', '경남 창원시 진해구 명제로 324-5', '480번지', '경남', '예약제로 운영됩니다. 전화를 먼저 주세요.', 'ROOM010', 'host10', 96000, 'pensionMain2.jpg', 'pensionSub2.jpg', 'pensionSub8.jpg', 'pensionSub9.jpg', 'pensionSub10.jpg', 4, 'sea,valley', '펜션', NULL, 'Y', NULL, NULL, 'Y', '8', '4'),
	('펜션지기', '경북 울릉군 울릉읍 울릉순환로 678', '1층', '경남', '제목 그대로 일등 펜션입니다.', 'ROOM011', 'host11', 150000, 'pensionMain3.jpg', NULL, NULL, NULL, NULL, 4, 'sea,river', '펜션', NULL, NULL, 'Y', NULL, 'Y', '45', '2'),
	('가평펜션', '서울 강남구 선릉로 524', '독채', '경북', '넓고 쾌적한 시설, 즐거운 추억을 만드세요', 'ROOM012', 'host12', 170000, 'pensionMain4.jpg', NULL, NULL, NULL, NULL, 4, 'city,valley', '펜션', NULL, 'Y', 'Y', 'Y', NULL, '9', '4.5'),
	('궁평항펜션', '서울 강남구 논현로119길 24', '7층', '서울', '족구장 완비! 단체 환영!!', 'ROOM013', 'host13', 165000, 'pensionMain5.jpg', 'pensionSub3.jpg', 'pensionSub1.jpg', 'pensionSub2.jpg', NULL, 3, 'city,river', '펜션', 'Y', 'Y', 'Y', 'Y', NULL, '81', '4.5'),
	('하이펜션', '경기 가평군 청평면 호반로 976', '독채', '서울', '근처에 낚시터가 있어 아주 좋습니다.', 'ROOM014', 'host14', 144000, 'pensionMain6.jpg', NULL, NULL, NULL, NULL, 6, 'mountain,forest,valley,river', '펜션', 'Y', 'Y', 'Y', 'Y', 'Y', '69', '1'),
	('감상펜션', '경기 화성시 서신면 궁평고잔길 99', '1층 101호', '경기', '낚시배 운영합니다.', 'ROOM015', 'host15', 150000, 'pensionMain7.jpg', 'pensionSub4.jpg', 'pensionSub3.jpg', NULL, NULL, 6, 'mountain,forest,valley', '펜션', NULL, 'Y', 'Y', 'Y', NULL, '7', '0.5'),
	('농촌펜션', '경기 화성시 서신면 궁평고잔길 85-5', '감상펜션', '경기', '방문해주신다면 친절히 모시겠습니다.', 'ROOM016', 'host16', 120000, 'pensionMain8.jpg', NULL, NULL, NULL, NULL, 6, 'mountain,forest,river', '펜션', 'Y', 'Y', 'Y', NULL, NULL, '1', '5'),
	('강근처펜션', '경기 양평군 용문면 용문산로 213-5', '농촌펜션', '경기', '산 좋고 물 좋은 곳에 위치한 펜션입니다.', 'ROOM017', 'host17', 130000, 'pensionMain9.jpg', 'pensionSub5.jpg', NULL, NULL, NULL, 8, 'mountain,forest', '펜션', 'Y', NULL, 'Y', 'Y', NULL, '33', '3'),
	('시골펜션', '경북 경주시 문무대왕면 송전기곡길 15-1', '43-9번지', '경기', '강 근처에 있어 놀기 아주 편하답니다.', 'ROOM018', 'host18', 145000, 'pensionMain10.jpg', NULL, NULL, NULL, NULL, 8, 'mountain', '펜션', 'Y', 'Y', 'Y', 'Y', NULL, '5', '3'),
	('리베라모텔', '강원 철원군 서면 태봉로 465-83', '7번지', '경북', '전 객실 바베큐장 이용이 가능합니다.', 'ROOM019', 'host19', 210000, 'MotelMain1.jpg', 'MotelSub1.jpg', 'MotelSub5.jpg', 'GuestHouseSub1.jpg', 'GuestHouseSub3.jpg', 2, 'mountain,forest', '모텔', 'Y', 'Y', 'Y', NULL, NULL, '15', '4'),
	('유림모텔', '전남 해남군 계곡면 비슬안길 185', '7-3번지', '강원', '즐겁게 물놀이 할 수 잇는 유아풀을 동반했습니다.', 'ROOM020', 'host20', 230000, 'MotelMain2.jpg', 'MotelSub2.jpg', 'MotelSub3.jpg', 'GuestHouseSub2.jpg', NULL, 8, 'mountain,forest', '모텔', 'Y', NULL, 'Y', 'Y', NULL, '88', '4'),
	('로얄모텔', '경기 안양시 만안구 안양로268번길 41', '303호', '전남', '자연풍경속 작은 궁전. 천상의 휴식을 준비하는 아담한 모텔', 'ROOM021', 'host21', 80000, 'MotelMain3.jpg', 'MotelSub3.jpg', NULL, NULL, NULL, 2, 'city,river', '모텔', 'Y', NULL, NULL, 'Y', 'Y', '11', '4'),
	('CNC모텔', '경기 수원시 권선구 구운로85번길 28', 'CNC 모텔', '경기', '몸과 마음을 재충전하는 꽃과 나무들을 선보입니다.', 'ROOM022', 'host22', 120000, 'MotelMain4.jpg', 'MotelSub4.jpg', 'MotelSub2.jpg', 'GuestHouseSub4.jpg', 'GuestHouseSub5.jpg', 2, 'city,valley,river', '모텔', NULL, 'Y', 'Y', 'Y', NULL, '22', '4'),
	('샤르망모텔', '경기 수원시 권선구 서부로1934번길 2', '샤르망 모텔', '경기', '신축건물로 전 객식 복층형 단체 모텔입니다.', 'ROOM023', 'host23', 200000, 'MotelMain5.jpg', 'MotelSub5.jpg', 'MotelSub9.jpg', 'GuestHouseSub6.jpg', NULL, 3, 'city', '모텔', 'Y', 'Y', NULL, 'Y', 'Y', '64', '3'),
	('일로와모텔', '경기 광주시 경안로 18', '4-33번지', '경기', '고급스러운 방갈로 형태의 독채하우스', 'ROOM024', 'host24', 84000, 'MotelMain6.jpg', 'MotelSub6.jpg', NULL, NULL, NULL, 4, 'city,valley,river', '모텔', 'Y', 'Y', 'Y', 'Y', 'Y', '32', '2.5'),
	('SS모텔', '경기 광주시 광주대로 133', '2층 202호', '경기', '가족, 연인, 친구, 동료와 추억을 만드는 공간입니다.', 'ROOM025', 'host25', 66000, 'MotelMain7.jpg', 'MotelSub7.jpg', 'MotelSub10.jpg', 'GuestHouseSub7.jpg', NULL, 2, 'city', '모텔', 'Y', 'Y', 'Y', NULL, 'Y', '221', '1.5'),
	('칸타빌모텔', '전북 군산시 소룡1길 5', '칸타빌', '경기', '아름다운 편백숲속에서 천천히 걷기 늦은밤 마음을 열어주는 하늘 별 빛.', 'ROOM026', 'host26', 59000, 'MotelMain8.jpg', 'MotelSub8.jpg', NULL, NULL, NULL, 4, 'mountain', '모텔', NULL, 'Y', 'Y', 'Y', NULL, '4', '3.5'),
	('모텔꿈꾸다', '전북 남원시 소리길 120', '꿈꾸다', '경기', '전객실 제트스파, 호텔급', 'ROOM027', 'host27', 89000, 'MotelMain9.jpg', 'MotelSub9.jpg', 'MotelSub4.jpg', 'GuestHouseSub8.jpg', NULL, 2, 'mountain,river', '모텔', 'Y', 'Y', 'Y', 'Y', NULL, '54', '1');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;

-- 테이블 samp.room_seq 구조 내보내기
CREATE TABLE IF NOT EXISTS `room_seq` (
  `ROOM_ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ROOM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.room_seq:~27 rows (대략적) 내보내기
/*!40000 ALTER TABLE `room_seq` DISABLE KEYS */;
INSERT INTO `room_seq` (`ROOM_ID`) VALUES
	(1),
	(2),
	(3),
	(4),
	(5),
	(6),
	(7),
	(8),
	(9),
	(10),
	(11),
	(12),
	(13),
	(14),
	(15),
	(16),
	(17),
	(18),
	(19),
	(20),
	(21),
	(22),
	(23),
	(24),
	(25),
	(26),
	(27);
/*!40000 ALTER TABLE `room_seq` ENABLE KEYS */;

-- 테이블 samp.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` varchar(50) NOT NULL,
  `user_password` varchar(200) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_birth` date DEFAULT NULL,
  `user_gender` varchar(50) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_phone` varchar(50) DEFAULT NULL,
  `user_address1` varchar(200) DEFAULT NULL,
  `user_address2` varchar(200) DEFAULT NULL,
  `user_status` varchar(50) DEFAULT '0',
  `user_type` varchar(50) NOT NULL DEFAULT 'own'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.user:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- 트리거 samp.TG_RESERVATION_INSERT 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER TG_RESERVATION_INSERT
BEFORE INSERT ON RESERVATION
FOR EACH ROW
BEGIN
INSERT INTO RESERVATION_SEQ VALUES (NULL);
SET NEW.RES_ID = CONCAT('RES', LPAD(LAST_INSERT_ID(), 3, '0'));
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 트리거 samp.TG_REVIEW_INSERT 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER TG_REVIEW_INSERT
BEFORE INSERT ON REVIEW
FOR EACH ROW
BEGIN
INSERT INTO REVIEW_SEQ VALUES (NULL);
SET NEW.REVIEW_ID = CONCAT('REVIEW', LPAD(LAST_INSERT_ID(), 5, '0'));
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 트리거 samp.TG_ROOM_INSERT 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER TG_ROOM_INSERT
BEFORE INSERT ON ROOM
FOR EACH ROW
BEGIN
INSERT INTO ROOM_SEQ VALUES (NULL);
SET NEW.ROOM_ID = CONCAT('ROOM', LPAD(LAST_INSERT_ID(), 3, '0'));
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
