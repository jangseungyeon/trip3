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
DROP DATABASE IF EXISTS `samp`;
CREATE DATABASE IF NOT EXISTS `samp` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `samp`;

-- 테이블 samp.area 구조 내보내기
DROP TABLE IF EXISTS `area`;
CREATE TABLE IF NOT EXISTS `area` (
  `area_name` varchar(50) DEFAULT NULL,
  `area_num` int(11) DEFAULT NULL,
  `area_mapy` double DEFAULT NULL,
  `area_mapx` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.area:~17 rows (대략적) 내보내기
DELETE FROM `area`;
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
DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `planner_no` int(11) DEFAULT NULL,
  `comment_no` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(200) DEFAULT NULL,
  `comment_content` varchar(500) DEFAULT NULL,
  `reg_date` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`comment_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.comment:~2 rows (대략적) 내보내기
DELETE FROM `comment`;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`planner_no`, `comment_no`, `user_id`, `comment_content`, `reg_date`) VALUES
	(9, 1, 'user222', '광주 여행 좋아요!', '2022-11-18 17:21:41'),
	(9, 2, 'user01', '광주 갈때 꼭 무등산 가셔야 합니다 추천111@@@', '2022-11-19 10:13:30'),
	(9, 3, 'user03', '저도 다음에 광주갈때 이거 참고해야겠네요 감사합니다', '2022-11-20 12:30:45');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- 테이블 samp.faq 구조 내보내기
DROP TABLE IF EXISTS `faq`;
CREATE TABLE IF NOT EXISTS `faq` (
  `faq_no` int(11) NOT NULL AUTO_INCREMENT,
  `faq_title` varchar(200) DEFAULT NULL,
  `faq_writer` varchar(20) DEFAULT NULL,
  `faq_content` varchar(2000) DEFAULT NULL,
  `faq_regdate` varchar(20) DEFAULT NULL,
  `faq_cnt` int(20) DEFAULT NULL,
  `filename` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`faq_no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.faq:~10 rows (대략적) 내보내기
DELETE FROM `faq`;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` (`faq_no`, `faq_title`, `faq_writer`, `faq_content`, `faq_regdate`, `faq_cnt`, `filename`) VALUES
	(1, 'tripONplan  홈페이지 오픈', '관리자', 'tripONplan의 홈페이지가 오픈 하였습니다. 숙소와 플래너 위주의 주 메뉴로 상품의 가격과 여행 계획의 플래닝에 포커스를 맞추었습니다. 숙소탭에서는 그 상품을 보다 쉽게 찾을수 있는 검색엔진, 플래너탭에서는 고객 스스로 편하게 상세일정을 계획하도록 안내하고 있습니다. \r\n\r\n감사합니다.', '2022-10-03', 0, NULL),
	(2, '체크인, 체크아웃 시간은 언제인가요?', '관리자', '일반적으로 체크인은 14:00이후, 체크아웃은 11:00 ~12;00 입니다\r\n호텔마다, 지역마다 차이가 있으며 늦게 체크인(21:00이후)하는 경우에는 호텔측에 도착예정시간과 LATE CHECK-IN 정보를 통보해주셔야 됩니다.\r\nEARLY CHECK-IN, LATE CHECK-OUT은 호텔객실사정에 따라 배정되는 관계로 현지에서 직접 요청하셔야 됩니다.', '2022-10-04', 0, NULL),
	(3, '1:1문의 및 게시판 이용관련, 주의사항 안내', '관리자', '안녕하세요. tripONplan입니다.\r\n\r\n최근 타사에 구글링(구글 검색으로 특정인의 개인정보 및 사생활을 알아내는 행위)을 통해 개인정보유출 사례가\r\n\r\n빈번히 발생하고 있어 고객분들의 피해가 발생하지 않도록 사전 예방 안내를 드립니다.\r\n\r\n\r\n\r\ntripONplan은 고객의 개인정보보호를 위해 고객정보 암호화, 보안프로그램, 방화벽 등 다양한 방법으로 대처 및 개선을\r\n\r\n지속적으로 진행해오고 있습니다. 또한 위와 같은 사례에 대해서도 사전에 감지, 전담 직원을 배치하여 일일 모니터링을\r\n\r\n통해 그 위험을 최소화하고 있습니다.\r\n\r\n\r\n\r\n하지만  자유롭게 직접 작성하는 게시판 특성상 기술적 제약사항이 있기에  1:1문의, 여행후기 등의  글작성 할 경우에는\r\n\r\n주민등록번호, 전화번호, 이메일 주소 등과 같은 개인정보는 절대 기재하지 마시고, 필요할 경우 직원상담을 통하여\r\n\r\n안내 받아주시기 바랍니다.\r\n\r\n\r\n\r\n감사합니다.\r\n', '2022-10-05', 0, NULL),
	(4, '<주의사항> 최근 해킹사고가 빈번하게 발생함에 따라 고객 여러분의 주의가 각별히 필요합니다', '관리자', '안녕하십니까\r\ntripONplan의 시스템 관리자입니다\r\n\r\n최근 해킹사고가 빈번하게 발생함에 따라 고객 여러분의 주의가 각별히 필요하므로 아래와 같은 주의사항을 전해 드립니다.\r\n\r\n1. 알 수 없는 사용자로부터 전송된 메일 열람 금지\r\n2. MS Explorer 브라우저에서 불필요한 실행파일 다운로드 금지\r\n3. 최신 보안 업데이트 실시\r\n4. 사용자 패스워드의 변경(최소 8자리, 영문자 숫자 포함)\r\n5. 바이러스 백신 업데이트\r\n일반사용자를 대상으로 하는 해킹프로그램의 유포가 급증하고 있으며, 이로 인한 개인정보 유출사고가 우려되므로 고객 여러분의 주의가 필요합니다.', '2022-10-07', 0, NULL),
	(5, '<주의사항>비밀번호 변경요청', '관리자', '안녕하세요, tripONplan입니다. 최근 일부 사이트에서 회원들의 ID, 비밀번호, 주민등록번호 등 개인정보가 유출되는 사고가 발생되어, 고객님들의 안전한 서비스 이용을 위해 비밀번호 변경에 대한 안내말씀을 드리고자 합니다. \r\n1. 타 사이트와 동일한 비밀번호를 사용하시는 경우 비밀번호를 꼭 변경해 주세요! 타 사이트와 동일한 비밀번호를 사용하시는 경우, 보안이 취약한 외부 사이트의 개인정보유출로 인해 비밀번호까지 도용될 수 있습니다. 번거로우시더라도  사이트 별 비밀번호를 다르게 변경해 주세요! \r\n2. 오랫동안 변경하지 않은 비밀번호를 꼭 변경해 주세요! 오랫동안 비밀번호를 바꾸지 않으셨거나 쉬운 숫자/영문단어를 이용해 만든 비밀번호는 그 만큼 유추하기도 쉬어 도용될 가능성이 높아집니다. 안전한 이용을 위해 오래된 비밀번호는 아래 안내에 따라 꼭 변경해 주세요! \r\n3. 비밀번호를 변경하실 때는 이렇게 만들어 보세요! ① 6~16자의 영문대소문자, 숫자, 특수문자만 가능합니다. (사용 가능한 특수문자 32자 : ! " # $ % & \' ( ) * + , - . / : ; < = > ? @ [ ＼ ] ^ _ ` { | } ~) ② 영문, 숫자, 특수문자를 혼용하시면 보다 안전합니다. ③ 학번, 전화번호 혹은 연속된 숫자 및 문자, 사전에 포함된 단어 등 타인이 쉽게 알아낼 수 있는 비밀번호 사용은 위험합니다. ④ 타 사이트와 동일한 비밀번호의 사용, 이전에 사용했던 비밀번호의 재사용은 안전하지 않을 수 있습니다. ⑤ 비밀번호는 비밀번호 안전도에 따라 3~6개월에 한번씩 주기적으로 바꾸어 사용하시는 것이 안전합니다. ⑥ 비밀번호는 길수록, 그리고 많이 혼용할수록 안전합니다. [사용 불가능한 비밀번호] ① 공백은 비밀번호로 사용불가능 합니다. ② 숫자만으로 이루어진 비밀번호는 사용불가능 합니다. ③ 동일한 문자를 많이 포함할 경우 사용불가능 합니다. ④ ID, 주민등록번호, 생일 등의 개인정보로만 이루어진 비밀번호는 사용불가능 합니다. ⑤ 안전조치 된 당시의 비밀번호는 안전하지 않으므로 사용불가능 합니다. \r\n4. 고객의 회원정보는 철저하게 보호되고 있습니다! tripONplan는 고객님들의 개인정보를 보호하고 안전한 서비스를 제공하는 것을 최우선 가치로 삼고 있습니다. 이를 위해 최고수준의 보안기술을 바탕으로 보안로그인, IP보안, 아이디가입잠금 등 다양한 개인정보보호장치를 도입해 운영하고 있습니다. 또한, 세계 최초로 전사개인정보보호부문 ISO/IEC27001 국제표준인증을 획득해 표준화된 개인정보관리체계를 구축하고, 내?외부 개인정보보호전문가로 구성된 \'개인정보보호위원회’를 통해 고객의 개인정보를 철저하게 보호하고 있습니다. 앞으로도 더욱 안전하고 믿을 수 있는 tripONplan이 되도록 노력하겠습니다. \r\n감사합니다.', '2022-10-12', 0, NULL),
	(6, '[중요] 상담 서비스 시간 변경 안내', '관리자', '안녕하세요. tripONplan을 이용해 주시는 고객분들께 안내드립니다. \r\n\r\n \r\n\r\n상담 시간 아래와 같이 변경되어 이용에 참고 부탁 드립니다.\r\n\r\n \r\n\r\n- 기존 : 평일 업무 기준 09시~20시까지 운영 (주말, 공휴일은 이용이 불가)\r\n\r\n- 변경 : 평일 업무 기준 09시~18시까지 운영 (주말, 공휴일은 이용이 불가)\r\n\r\n\r\n \r\n감사합니다.', '2022-10-13', 0, NULL),
	(7, '카카오 장애로 인한 안내', '관리자', '안녕하세요, tripONplan 입니다.\r\n\r\n\r\n\r\n현재 카카오 서비스 장애로 일부 기능이 원활하지 않습니다.\r\n\r\n\r\n\r\n가입 및 로그인은 다른 서비스(이메일, 네이버 등)를 통해 정상 이용이 가능하시고,\r\n\r\n결제 및 예약에 대한 내용은 타 결제수단 이용을 부탁드립니다.\r\n\r\n\r\n\r\n감사합니다.', '2022-10-16', 0, NULL),
	(8, '카카오 장애에 따른 서비스 복구 안내 (10.17)', '관리자', '안녕하세요, tripONplan 입니다.\r\n\r\n\r\n\r\n10월 17일 현재 tripONplan 내에서 사용하는 카카오 관련 서비스가 모두 정상 복구되었습니다.\r\n\r\n\r\n\r\n감사합니다.', '2022-10-17', 0, NULL),
	(9, '12월 tripONplan 시스템 정기점검 일정', '관리자', '안녕하세요. tripONplan 입니다. \r\n\r\n \r\n\r\n원활한 서비스 유지를 위해 아래와 같이 시스템 정기점검이 진행 되오니\r\n\r\n사이트 이용에 참고 부탁드립니다.\r\n\r\n \r\n\r\n \r\n\r\n \r\n\r\n---------     아             래     ---------\r\n\r\n \r\n\r\n \r\n\r\n \r\n\r\n1. 작업 일시\r\n\r\n   - 2022년 12월 9일 (금) : 02:00 ~ 07:00 (총 5시간)\r\n\r\n \r\n\r\n2. 영향 범위\r\n\r\n  - 서비스 전체\r\n\r\n \r\n\r\n \r\n\r\n※ 서비스 재개는 시스템 점검 상황에 따라 변경될 수 있습니다.\r\n\r\n \r\n\r\n고객님들의 많은 양해 부탁드립니다.\r\n\r\n감사합니다. ', '2022-11-07', 0, NULL),
	(10, '1:1문의 및 게시판 이용관련, 주의사항 안내', '관리자', '안녕하세요. tripONplan입니다.\r\n\r\n최근 타사에 구글링(구글 검색으로 특정인의 개인정보 및 사생활을 알아내는 행위)을 통해 개인정보유출 사례가\r\n\r\n빈번히 발생하고 있어 고객분들의 피해가 발생하지 않도록 사전 예방 안내를 드립니다.\r\n\r\n\r\n\r\ntripONplan은 고객의 개인정보보호를 위해 고객정보 암호화, 보안프로그램, 방화벽 등 다양한 방법으로 대처 및 개선을\r\n\r\n지속적으로 진행해오고 있습니다. 또한 위와 같은 사례에 대해서도 사전에 감지, 전담 직원을 배치하여 일일 모니터링을\r\n\r\n통해 그 위험을 최소화하고 있습니다.\r\n\r\n\r\n\r\n하지만  자유롭게 직접 작성하는 게시판 특성상 기술적 제약사항이 있기에  1:1문의, 여행후기 등의  글작성 할 경우에는\r\n\r\n주민등록번호, 전화번호, 이메일 주소 등과 같은 개인정보는 절대 기재하지 마시고, 필요할 경우 직원상담을 통하여\r\n\r\n안내 받아주시기 바랍니다.\r\n\r\n\r\n\r\n감사합니다.\r\n', '2022-11-17', 0, NULL);
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;

-- 테이블 samp.host 구조 내보내기
DROP TABLE IF EXISTS `host`;
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

-- 테이블 데이터 samp.host:~40 rows (대략적) 내보내기
DELETE FROM `host`;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` (`HOST_ID`, `HOST_BIZNAME`, `HOST_PW`, `HOST_NAME`, `HOST_BIRTH`, `HOST_EMAIL`, `HOST_PHONE`, `HOST_ADDR1`, `HOST_ADDR2`, `HOST_STATUS`, `HOST_BIZNUM`, `HOST_BIZIMG`, `HOST_BANK`, `HOST_BANKNUM`) VALUES
	('host01', '민박전문', '1111', '현성규', '1987-10-18', 'a05005@nate.com', '01040201018', '안양시 만안구 안양천서로177', '래미안 101동 102호', '0', '-', '-', '우리은행', '1002-042-909090'),
	('host02', '강원민박', '1111', '복수미', '1992-05-03', 'soomi@triponplan', '01012341234', '강원 홍천군 서면 한치골길 262', '1104-4', '0', '-', '-', '농협', '123-456-78910'),
	('host03', '경남민박', '1111', '임시우', '1992-04-03', 'siwoo@triponplan', '01012341234', '경남 김해시 인제로 197', '1층', '0', '-', '-', '농협', '123-456-78910'),
	('host04', '부산민박', '1111', '심문호', '1980-10-11', 'moonho@triponplan', '01012341234', '부산 해운대구 송정해변로 12-8', '508-3', '0', '-', '-', '농협', '123-456-78910'),
	('host05', '안양민박', '1111', '오윤정', '1977-09-25', 'yoonjung@triponplan', '01012341234', '경기 안양시 만안구 삼막로96번길 110', '타워 7층', '0', '-', '-', '농협', '123-456-78910'),
	('host06', '동해민박', '1111', '설윤정', '1993-04-15', 'yoonj2@triponplan', '01012341234', '강원 동해시 임항로 99', '유원지길 45', '0', '-', '-', '농협', '123-456-78910'),
	('host07', '남해민박', '1111', '하민준', '1988-03-27', 'minjunha@triponplan', '01012341234', '경남 남해군 삼동면 양화금로 329-31', '314-84번지', '0', '-', '-', '농협', '123-456-78910'),
	('host08', '창원민박', '1111', '서원옥', '1964-05-04', 'seo1234@triponplan', '01012341234', '경남 창원시 마산합포구 구산면 해양관광로 1307-111', '활초리 4-21', '0', '-', '-', '농협', '123-456-78910'),
	('host09', '마산민박', '1111', '심채원', '1952-03-03', 'sim0303@triponplan', '01012341234', '경남 창원시 마산합포구 구산면 괭이바다길 231-3', '19-2번지', '0', '-', '-', '농협', '123-456-78910'),
	('host10', '진해민박', '1111', '복광일', '1999-07-13', 'kwangil2@triponplan', '01012341234', '경남 창원시 진해구 명제로 324-5', '480번지', '0', '-', '-', '농협', '123-456-78910'),
	('host11', '일등펜션', '1111', '남소영', '1975-04-30', 'namso123@triponplan', '01012341234', '경북 울릉군 울릉읍 울릉순환로 678', '1층', '0', '-', '-', '농협', '123-456-78910'),
	('host12', '강남펜션', '1111', '표종철', '1965-08-27', 'pyojong@triponplan', '01012341234', '서울 강남구 선릉로 524', '독채', '0', '-', '-', '농협', '123-456-78910'),
	('host13', '펜션지기', '1111', '류세욱', '1993-11-12', 'ryu1993@triponplan', '01012341234', '서울 강남구 논현로119길 24', '7층', '0', '-', '-', '농협', '123-456-78910'),
	('host14', '가평펜션', '1111', '정수영', '1987-10-14', 'jungsoo@triponplan', '01012341234', '경기 가평군 청평면 호반로 976', '독채', '0', '-', '-', '농협', '123-456-78910'),
	('host15', '궁평항펜션', '1111', '남궁정환', '1974-09-09', 'nagkoong@triponplan', '01012341234', '경기 화성시 서신면 궁평고잔길 99', '1층 101호', '0', '-', '-', '농협', '123-456-78910'),
	('host16', '하이펜션', '1111', '정종환', '1966-04-22', 'jungjong@triponplan', '01012341234', '경기 화성시 서신면 궁평고잔길 85-5', '1층', '0', '-', '-', '농협', '123-456-78910'),
	('host17', '감상펜션', '1111', '공연재', '1984-12-24', 'Yeon-jae@triponplan', '01012341234', '경기 양평군 용문면 용문산로 213-5', '감상펜션', '0', '-', '-', '농협', '123-456-78910'),
	('host18', '농촌펜션', '1111', '공소희', '1983-03-13', 'oshee0313@triponplan', '01012341234', '경북 경주시 문무대왕면 송전기곡길 15-1', '농촌펜션', '0', '-', '-', '농협', '123-456-78910'),
	('host19', '강근처펜션', '1111', '임원철', '1989-05-04', 'wonchul@triponplan', '01012341234', '강원 철원군 서면 태봉로 465-83 ', '43-9번지', '0', '-', '-', '농협', '123-456-78910'),
	('host20', '시골펜션', '1111', '유민아', '1970-10-02', 'youminah@triponplan', '01012341234', '전남 해남군 계곡면 비슬안길 185', '7번지', '0', '-', '-', '농협', '123-456-78910'),
	('host21', '리베라모텔', '1111', '송바다', '1971-11-23', 'songsea@triponplan', '01012341234', '경기 안양시 만안구 안양로268번길 41', '13번지', '0', '-', '-', '농협', '123-456-78910'),
	('host22', '유림모텔', '1111', '오새롬', '1969-08-15', 'newroom@triponplan', '01012341234', '경기 수원시 권선구 구운로85번길 28', '7-3번지', '0', '-', '-', '농협', '123-456-78910'),
	('host23', '로얄모텔', '1111', '이나봄', '1995-03-25', 'leenabom@triponplan', '01012341234', '경기 수원시 권선구 서부로1934번길 2', '303호', '0', '-', '-', '농협', '123-456-78910'),
	('host24', 'CNC모텔', '1111', '강조은', '1987-04-09', 'joenkang@triponplan', '01012341234', '경기 광주시 경안로 18', '-', '0', '-', '-', '농협', '123-456-78910'),
	('host25', '샤르망모텔', '1111', '심단비', '1968-05-18', 'simdanbi@triponplan', '01012341234', '경기 광주시 광주대로 133', '샤르망 모텔', '0', '-', '-', '농협', '123-456-78910'),
	('host26', '일로와모텔', '1111', '남아라', '1980-05-23', 'iknownam@triponplan', '01012341234', '전북 군산시 소룡1길 5', '4-33번지', '0', '-', '-', '농협', '123-456-78910'),
	('host27', 'SS모텔', '1111', '김아람', '1973-10-19', 'aramkim@triponplan', '01012341234', '전북 남원시 소리길 120', '2층 202호', '0', '-', '-', '농협', '123-456-78910'),
	('host28', '모텔꿈꾸다', '1111', '문보라', '1966-11-03', 'moonbo@triponplan', '01012341234', '경북 안동시 풍천면 검무로 10-1', '꿈꾸다', '0', '-', '-', '농협', '123-456-78910'),
	('host29', '칸타빌모텔', '1111', '정새론', '1985-04-13', 'saerone@triponplan', '01012341234', '서울 동작구 시흥대로 596', '-', '0', '-', '-', '농협', '123-456-78910'),
	('host30', 'ST모텔', '1111', '권나봄', '1992-03-22', 'youseeme@triponplan', '01012341234', '경기 평택시 포승읍 평택항로184번길 3-10', 'ST빌딩 3~5층', '0', '-', '-', '농협', '123-456-78910'),
	('host31', '돈키호텔', '1111', '송아리', '1993-04-30', 'songari@triponplan', '01012341234', '경북 안동시 강남2길 60-16', '돈키호텔', '0', '-', '-', '농협', '123-456-78910'),
	('host32', '코암호텔', '1111', '배구슬', '1977-06-23', 'shipmarble@triponplan', '01012341234', '경기 용인시 처인구 포곡읍 마성로 420', '66-3번지', '0', '-', '-', '농협', '123-456-78910'),
	('host33', '에버덴호텔', '1111', '이나리', '1984-06-19', 'standup@triponplan', '01012341234', '서울 종로구 삼봉로 71', '호텔 에버덴', '0', '-', '-', '농협', '123-456-78910'),
	('host34', 'SJ호텔', '1111', '장새롬', '1997-04-03', 'jangsae@triponplan', '01012341234', '경기 수원시 팔달구 덕영대로 902', '호텔 JS', '0', '-', '-', '농협', '123-456-78910'),
	('host35', '펠리스호텔', '1111', '박하늘', '1986-05-31', 'skypark@triponplan', '01012341234', '경북 영덕군 강구면 영덕대게로 423', '호텔 펠리스', '0', '-', '-', '농협', '123-456-78910'),
	('host36', '호텔인까페', '1111', '김슬기', '1987-01-03', 'seulgikim@triponplan', '01012341234', '경기 성남시 수정구 창곡동 566', '3층 301호, 302호', '0', '-', '-', '농협', '123-456-78910'),
	('host37', '프라자호텔', '1111', '류새벽', '1980-11-23', 'dawn@triponplan', '01012341234', '서울 중구 동호로 354', '프라자 호텔', '0', '-', '-', '농협', '123-456-78910'),
	('host38', '허브호텔', '1111', '한으뜸', '1983-12-12', 'topofworld@triponplan', '01012341234', '경기 이천시 마장면 서이천로 449-79', '허브 호텔', '0', '-', '-', '농협', '123-456-78910'),
	('host39', '빠삐용호텔', '1111', '백힘찬', '2001-03-06', 'strongman@triponplan', '01012341234', '경기 광명시 일직로12번길', '빠삐용 호텔', '0', '-', '-', '농협', '123-456-78910'),
	('host40', '안양호텔', '1111', '양한결', '1959-04-03', 'hangyul@triponplan', '01012341234', '서울 구로구 경인로 624', '안양 호텔', '0', '-', '-', '농협', '123-456-78910');
/*!40000 ALTER TABLE `host` ENABLE KEYS */;

-- 테이블 samp.likes 구조 내보내기
DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `like_type` varchar(20) DEFAULT NULL,
  `like_id` varchar(300) DEFAULT NULL,
  `user_id` varchar(300) DEFAULT NULL,
  `like_no` int(11) DEFAULT NULL,
  `like_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.likes:~2 rows (대략적) 내보내기
DELETE FROM `likes`;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` (`like_type`, `like_id`, `user_id`, `like_no`, `like_count`) VALUES
	('1', 'user222', 'user222', 9, 1),
	('2', 'ROOM027', NULL, NULL, 0);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;

-- 테이블 samp.manage 구조 내보내기
DROP TABLE IF EXISTS `manage`;
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
DELETE FROM `manage`;
/*!40000 ALTER TABLE `manage` DISABLE KEYS */;
INSERT INTO `manage` (`MANAGE_ID`, `MANAGE_PW`, `MANAGE_NAME`, `MANAGE_BIRTH`, `MANAGE_EMAIL`, `MANAGE_PHONE`, `MANAGE_GRADE`) VALUES
	('manage', '1111', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `manage` ENABLE KEYS */;

-- 테이블 samp.memo 구조 내보내기
DROP TABLE IF EXISTS `memo`;
CREATE TABLE IF NOT EXISTS `memo` (
  `planner_no` int(11) DEFAULT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `memo_day` int(11) DEFAULT NULL,
  `memo_content` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.memo:~47 rows (대략적) 내보내기
DELETE FROM `memo`;
/*!40000 ALTER TABLE `memo` DISABLE KEYS */;
INSERT INTO `memo` (`planner_no`, `user_id`, `memo_day`, `memo_content`) VALUES
	(1, 'user222', 1, ' 찐빵 먹으러 GOGO!'),
	(1, 'user222', 2, '대구에 있는 멋진 한옥 공원'),
	(1, 'user222', 3, '공룡공원 멋지다!'),
	(1, 'user222', 4, '멋진 야경 뷰 낙동강 보'),
	(1, 'user222', 5, ' 퇴계 이황 선생님이 학문을 가르치시던 곳'),
	(2, 'user222', 1, ' 문화마을가야지 '),
	(2, 'user222', 2, ' 깨끗한 농촌 문화 마을'),
	(2, 'user222', 3, ' 국내 최대 민간 농원 핑크 뮬리 유명'),
	(2, 'user222', 4, ' 최초 군립 식물원'),
	(3, 'user222', 1, '국립공원 제9호 등산 가자!'),
	(3, 'user222', 2, '신비로운 가야역사'),
	(3, 'user222', 3, ''),
	(3, 'user222', 4, ' 최초 군립 식물원'),
	(4, 'user222', 1, ' 일본군 진지 어두운 역사 탐험, 헨드릭 하멜이 표류한 섬'),
	(4, 'user222', 2, '제주라면 역시 오름 등산이지!'),
	(5, 'user222', 1, '단아한 한옥 성당, 강남 한복판 거닐자 ㄱㄱ!, 서울에서 수상 레포츠를?!'),
	(5, 'user222', 2, '1000만 외국인 관광객이 즐겨 찾는 국제적인 관광명소 구로거리공원'),
	(5, 'user222', 3, '강남 시티 투어 버스, 한강 하류 유명 습지'),
	(6, 'user222', 1, '굴을 채취하는 아낙네 3명 탑, 간월암'),
	(6, 'user222', 2, '해양수산부 선정 아름다운 어촌'),
	(6, 'user222', 3, ' 조선후기 유동수를 추모하기 위해 창건한 서원'),
	(7, 'user222', 1, '우리나라에서 가장 먼저 일출 보고 손칼국수 때리자!'),
	(7, 'user222', 2, ' 우체통에 간절하게 담은 편지를 실어보내자'),
	(7, 'user222', 3, ' 추운 겨울엔 역시 온천이지!'),
	(7, 'user222', 4, ' 주상절리는 언제나 봐도 신기해'),
	(8, 'user222', 1, '부산에서 두번째로 큰 섬'),
	(8, 'user222', 2, '뷰 좋은 휴게소 산책 갈만한 곳'),
	(8, 'user222', 3, ' 산책하기 좋은 공원222'),
	(8, 'user222', 4, ' 산책하기 좋은 해변길333'),
	(8, 'user222', 5, ' 오랜 역사를 지닌 백화점'),
	(8, 'user222', 6, '오리고기 뜯어보자!'),
	(8, 'user222', 7, '고등어 뜯고 돈까스도 맛보고'),
	(9, 'user222', 1, '가족들끼리 놀러가서 자연을 있는 힘껏 만끽 가능한 공원'),
	(9, 'user222', 2, '가서 활 좀 쏴보고 캠핑도 하고 일석 이조!'),
	(9, 'user222', 3, '임금님께 하사받은 병풍과 거문고를 보관하는곳'),
	(9, 'user222', 4, ' 한정식의 진수'),
	(9, 'user222', 5, ' 무등산 주상절리도 보고 삼일절 역사 체험도 해보고'),
	(9, 'user222', 6, ' 러시아 음식도 맛보고 삼계탕도 맛보고 끝!'),
	(10, 'user222', 1, '대구에 있는 멋진 한옥 공원'),
	(10, 'user222', 2, ' 드라마 유명 촬영지 및 피톤치드 제대로 느낄수 있는곳'),
	(10, 'user222', 3, '멋진 야경 뷰 낙동강 보'),
	(10, 'user222', 4, ' 퇴계 이황 선생님이 학문을 가르치시던 곳'),
	(11, 'user222', 1, ' 최초 군립 식물원'),
	(11, 'user222', 2, '국립공원 제9호 등산 가자!'),
	(11, 'user222', 3, '신비로운 가야역사'),
	(11, 'user222', 4, ' 경산 시장 경주 시장 구경 가보자!');
/*!40000 ALTER TABLE `memo` ENABLE KEYS */;

-- 테이블 samp.place 구조 내보내기
DROP TABLE IF EXISTS `place`;
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

-- 테이블 데이터 samp.place:~62 rows (대략적) 내보내기
DELETE FROM `place`;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
INSERT INTO `place` (`planner_no`, `user_id`, `planner_date`, `place_name`, `mapy`, `mapx`, `img`, `addr`) VALUES
	(1, 'user222', '1', '가창 찐빵 골목', 35.8027142041, 128.622223298, 'http://tong.visitkorea.or.kr/cms/resource/70/1876170_image2_1.jpg', '대구광역시 달성군 가창면 가창로 1099'),
	(1, 'user222', '2', '경상감영공원', 35.8720530283, 128.5923073375, 'http://tong.visitkorea.or.kr/cms/resource/11/1575311_image2_1.jpg', '대구광역시 중구 경상감영길 99'),
	(1, 'user222', '3', '고산골', 35.8191841675, 128.6007580634, 'http://tong.visitkorea.or.kr/cms/resource/52/2366152_image2_1.jpg', '대구광역시 남구 고산3길 95-1'),
	(1, 'user222', '4', '강정고령보', 35.8411597415, 128.4650416326, 'http://tong.visitkorea.or.kr/cms/resource/15/2704115_image2_1.jpg', '대구광역시 달성군 다사읍 강정본길 57'),
	(1, 'user222', '5', '고산골 메타쉐콰이어길', 35.8300524321, 128.6034408589, 'http://tong.visitkorea.or.kr/cms/resource/36/2478936_image2_1.JPG', '대구광역시 남구 용두2길 43'),
	(1, 'user222', '5', '고산서당', 35.8526436717, 128.7186911959, '/resources/img/map.png', '대구광역시 수성구 성동로37길 39-3'),
	(2, 'user222', '1', '가래실 문화마을', 36.0328070074, 128.8892738816, '/resources/img/map.png', '경상북도 영천시 화산면 가래실로 364'),
	(2, 'user222', '1', '가산산성마을', 36.0501079498, 128.597812985, 'http://tong.visitkorea.or.kr/cms/resource/63/2629063_image2_1.bmp', '경상북도 칠곡군 가산면 가산로 891'),
	(2, 'user222', '1', '가산수피아', 36.0861545517, 128.4850691574, 'http://tong.visitkorea.or.kr/cms/resource/29/2638129_image2_1.JPG', '경상북도 칠곡군 가산면 학하들안2길 105'),
	(2, 'user222', '4', '가야산 야생화식물원', 35.80312761, 128.1418573045, 'http://tong.visitkorea.or.kr/cms/resource/99/2724199_image2_1.jpg', '경상북도 성주군 수륜면 가야산식물원길 49'),
	(3, 'user222', '1', '가야산국립공원(백운동 지구)', 35.8001779432, 128.1418101673, '/resources/img/map.png', '경북 성주군 수륜면 백운리'),
	(3, 'user222', '2', '가야산역사신화테마관', 35.801063941, 128.1410602092, 'http://tong.visitkorea.or.kr/cms/resource/16/2733516_image2_1.png', '경상북도 성주군 수륜면 가야산식물원길 21'),
	(3, 'user222', '4', '가야산 야생화식물원', 35.80312761, 128.1418573045, 'http://tong.visitkorea.or.kr/cms/resource/99/2724199_image2_1.jpg', '경상북도 성주군 수륜면 가야산식물원길 49'),
	(4, 'user222', '1', '가마오름', 33.3056418997, 126.247054307, '/resources/img/map.png', '제주특별자치도 제주시 한경면 청수서5길'),
	(4, 'user222', '1', '가파도', 33.1664326869, 126.2735884192, '/resources/img/map.png', '제주특별자치도 서귀포시 대정읍 가파로'),
	(4, 'user222', '2', '가세오름', 33.331425303, 126.7815518045, '/resources/img/map.png', '제주특별자치도 서귀포시 표선면 세화로'),
	(4, 'user222', '2', '가시오름', 33.2236315617, 126.2500169782, '/resources/img/map.png', '제주특별자치도 서귀포시 대정읍 하모이삼로21번길 1'),
	(5, 'user222', '1', '가회동성당', 37.5820858828, 126.9846616856, 'http://tong.visitkorea.or.kr/cms/resource/61/2780561_image2_1.png', '서울특별시 종로구 북촌로 57'),
	(5, 'user222', '1', '강남', 37.4970465429, 127.0281573537, 'http://tong.visitkorea.or.kr/cms/resource/08/1984608_image2_1.jpg', '서울특별시 강남구 역삼동'),
	(5, 'user222', '1', '거북선나루터', 37.5182707714, 126.9676539295, 'http://tong.visitkorea.or.kr/cms/resource/84/2791384_image2_1.jpg', '서울 용산구 이촌동 302-183'),
	(5, 'user222', '2', '강남 마이스 관광특구', 37.5118092746, 127.0591318945, '/resources/img/map.png', '서울특별시 강남구 영동대로 513'),
	(5, 'user222', '2', '거리공원', 37.4997993352, 126.8916141551, 'http://tong.visitkorea.or.kr/cms/resource/86/2780786_image2_1.png', '서울특별시 구로구 공원로 28'),
	(5, 'user222', '3', '강남 시티투어 (트롤리버스)', 37.5269874797, 127.0264344408, 'http://tong.visitkorea.or.kr/cms/resource/75/1258175_image2_1.jpg', '서울특별시 강남구 압구정로 161'),
	(5, 'user222', '3', '강서습지생태공원', 37.5860879769, 126.8171490732, 'http://tong.visitkorea.or.kr/cms/resource/81/1894481_image2_1.jpg', '서울특별시 강서구 양천로27길 279-23'),
	(6, 'user222', '1', '간월도 어리굴젓 기념탑', 36.6057304945, 126.4136207466, 'http://tong.visitkorea.or.kr/cms/resource/48/188448_image2_1.jpg', '충청남도 서산시 부석면 간월도리'),
	(6, 'user222', '1', '간월암(서산)', 36.6037195733, 126.4111793532, '/resources/img/map.png', '충청남도 서산시 부석면 간월도1길 119-29'),
	(6, 'user222', '2', '간월도마을', 36.6192846446, 126.4227029018, 'http://tong.visitkorea.or.kr/cms/resource/20/2518020_image2_1.jpg', '충청남도 서산시 부석면 간월도리'),
	(6, 'user222', '3', '간곡서원', 36.1824820312, 126.9083485111, '/resources/img/map.png', '충청남도 부여군 임천면 성흥로283번길 31-4'),
	(7, 'user222', '1', '간절곶 소망길', 35.3546337414, 129.3492110511, 'http://tong.visitkorea.or.kr/cms/resource/24/2355124_image2_1.JPG', '울산광역시 울주군 서생면 나사리'),
	(7, 'user222', '1', '간절곶 보광 보리밥 손칼국수', 35.3459146391, 129.3153142444, 'http://tong.visitkorea.or.kr/cms/resource/38/2848638_image2_1.jpg', '울산광역시 울주군 해맞이로 787'),
	(7, 'user222', '2', '간절곶소망우체통', 35.3588057199, 129.3611487843, 'http://tong.visitkorea.or.kr/cms/resource/24/2871524_image2_1.JPG', '울산광역시 울주군 서생면 대송리'),
	(7, 'user222', '3', '강동 해수온천', 35.6138565417, 129.4505699154, 'http://tong.visitkorea.or.kr/cms/resource/68/1588168_image2_1.jpg', '울산광역시 북구 동해안로 1418'),
	(7, 'user222', '4', '강동 화암 주상절리', 35.6341985442, 129.4424755991, 'http://tong.visitkorea.or.kr/cms/resource/11/1357511_image2_1.jpg', '울산광역시 북구 산하동 952-1번지 일원'),
	(8, 'user222', '1', '가덕도', 35.022963833, 128.8169442487, 'http://tong.visitkorea.or.kr/cms/resource/61/2716261_image2_1.jpg', '부산광역시 강서구 천성동 308-2'),
	(8, 'user222', '2', '가덕해양파크휴게소', 35.0230581337, 128.809630994, 'http://tong.visitkorea.or.kr/cms/resource/60/2793060_image2_1.jpg', '부산광역시 강서구 거가대로 2571'),
	(8, 'user222', '3', '가야공원 / 가야산책공원', 35.1483453258, 129.0276891748, '/resources/img/map.png', '부산광역시 부산진구 엄광로 118'),
	(8, 'user222', '4', '감지해변', 35.0625336062, 129.0764900502, 'http://tong.visitkorea.or.kr/cms/resource/18/2798118_image2_1.JPG', '부산광역시 영도구 감지길 110'),
	(8, 'user222', '5', '갤럭시 (롯데백화점 센텀시티점)', 35.1698809351, 129.1310907002, 'http://tong.visitkorea.or.kr/cms/resource/04/1016304_image2_1.jpg', '부산광역시 해운대구 센텀남대로 59'),
	(8, 'user222', '6', '감나무집', 35.2442128801, 129.0557979895, 'http://tong.visitkorea.or.kr/cms/resource/30/1982630_image2_1.jpg', '부산광역시 금정구 공해2길 2'),
	(8, 'user222', '7', '감천 아지매 밥집', 35.0938066405, 129.0088589663, 'http://tong.visitkorea.or.kr/cms/resource/80/2484380_image2_1.jpg', '부산광역시 사하구 옥천로75번길 17'),
	(8, 'user222', '7', '가가와', 35.1448074253, 129.0598281416, '/resources/img/map.png', '부산광역시 부산진구  중앙번영로 (6)'),
	(9, 'user222', '1', '경암근린공원', 35.1783276722, 126.8000950217, '/resources/img/map.png', '광주광역시 광산구 하남대로54번안길 133'),
	(9, 'user222', '2', '관덕정의 각궁', 35.1419253355, 126.9118638245, 'http://tong.visitkorea.or.kr/cms/resource/48/566648_image2_1.jpg', '광주광역시 남구 사직길 49'),
	(9, 'user222', '2', '광산구 국민여가 친환경 오토캠핑장', 35.1953634646, 126.7303952125, '/resources/img/map.png', '광주광역시 광산구 탑동길 345'),
	(9, 'user222', '3', '경장각', 35.1843631887, 126.8052666353, 'http://tong.visitkorea.or.kr/cms/resource/19/1587419_image2_1.jpg', '광주광역시 광산구 용아로 460'),
	(9, 'user222', '3', '광산구 국민여가 친환경 오토캠핑장', 35.1953634646, 126.7303952125, '/resources/img/map.png', '광주광역시 광산구 탑동길 345'),
	(9, 'user222', '4', '거목한정식', 35.1457276824, 126.9117581828, 'http://tong.visitkorea.or.kr/cms/resource/29/1892629_image2_1.jpg', '광주광역시 남구 천변좌로364번길 3-6 거목한정식'),
	(9, 'user222', '5', '광석대 (무등산권 국가지질공원)', 35.1441458348, 126.9890013959, 'http://tong.visitkorea.or.kr/cms/resource/64/2614764_image2_1.bmp', '광주광역시 북구 무등로 1550'),
	(9, 'user222', '5', '광주 3·1 만세운동 기념비', 35.136761993, 126.9096947007, 'http://tong.visitkorea.or.kr/cms/resource/92/741492_image2_1.jpg', '광주광역시 남구 백서로 13'),
	(9, 'user222', '6', '고려인마을 가족카페', 35.1727006363, 126.8063834945, '/resources/img/map.png', '광주광역시 광산구 산정공원로60번길 4'),
	(9, 'user222', '6', '고려조삼계탕', 35.1025740395, 126.9010324321, 'http://tong.visitkorea.or.kr/cms/resource/58/2859058_image2_1.jpg', '광주광역시 남구 효우로130번길 20'),
	(10, 'user222', '1', '경상감영공원', 35.8720530283, 128.5923073375, 'http://tong.visitkorea.or.kr/cms/resource/11/1575311_image2_1.jpg', '대구광역시 중구 경상감영길 99'),
	(10, 'user222', '2', '고산골 메타쉐콰이어길', 35.8300524321, 128.6034408589, 'http://tong.visitkorea.or.kr/cms/resource/36/2478936_image2_1.JPG', '대구광역시 남구 용두2길 43'),
	(10, 'user222', '3', '강정고령보', 35.8411597415, 128.4650416326, 'http://tong.visitkorea.or.kr/cms/resource/15/2704115_image2_1.jpg', '대구광역시 달성군 다사읍 강정본길 57'),
	(10, 'user222', '4', '고산서당', 35.8526436717, 128.7186911959, '/resources/img/map.png', '대구광역시 수성구 성동로37길 39-3'),
	(11, 'user222', '1', '가야산 야생화식물원', 35.80312761, 128.1418573045, 'http://tong.visitkorea.or.kr/cms/resource/99/2724199_image2_1.jpg', '경상북도 성주군 수륜면 가야산식물원길 49'),
	(11, 'user222', '2', '가야산국립공원(백운동 지구)', 35.8001779432, 128.1418101673, '/resources/img/map.png', '경북 성주군 수륜면 백운리'),
	(11, 'user222', '3', '가야산역사신화테마관', 35.801063941, 128.1410602092, 'http://tong.visitkorea.or.kr/cms/resource/16/2733516_image2_1.png', '경상북도 성주군 수륜면 가야산식물원길 21'),
	(11, 'user222', '4', '경산장 (5, 10일)', 35.821416965, 128.7358072292, 'http://tong.visitkorea.or.kr/cms/resource/42/1952842_image2_1.jpg', '경상북도 경산시 중앙로16길 20-1'),
	(11, 'user222', '4', '경주 성동시장', 35.8464897643, 129.2151477703, 'http://tong.visitkorea.or.kr/cms/resource/46/1968746_image2_1.jpg', '경상북도 경주시 원화로281번길 11');
/*!40000 ALTER TABLE `place` ENABLE KEYS */;

-- 테이블 samp.planner 구조 내보내기
DROP TABLE IF EXISTS `planner`;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.planner:~12 rows (대략적) 내보내기
DELETE FROM `planner`;
/*!40000 ALTER TABLE `planner` DISABLE KEYS */;
INSERT INTO `planner` (`planner_no`, `user_id`, `room_name`, `planner_start`, `planner_end`, `planner_area`, `planner_title`, `planner_show`, `planner_day`, `planner_like`, `planner_areaNum`) VALUES
	(1, 'user222', NULL, '2022-11-21', '2022-11-25', '대구광역시', '즐거운 여행입니다 하하', 'Y', 5, 0, 4),
	(2, 'user222', NULL, '2022-11-21', '2022-11-25', '경상북도', '경상북도 즐겁다', 'Y', 5, 0, 35),
	(3, 'user222', NULL, '2023-01-10', '2023-01-13', '경상북도', '두명이서~', 'Y', 4, 0, 35),
	(4, 'user222', NULL, '2022-11-29', '2022-11-30', '제주특별자치도', '제주 부부여행', 'Y', 2, 0, 39),
	(5, 'user222', NULL, '2022-11-28', '2022-11-30', '서울특별시', '둘이서 서울 여행', 'Y', 3, 0, 1),
	(6, 'user222', NULL, '2022-11-28', '2022-11-30', '충청남도', '강쥐랑 여행~!', 'Y', 3, 0, 34),
	(7, 'user222', NULL, '2022-11-27', '2022-11-30', '울산광역시', '울산여행!!!!!!!!!!!!!!!!!', 'Y', 4, 0, 7),
	(8, 'user222', NULL, '2022-11-30', '2022-12-06', '부산광역시', '부산으로 간다', 'Y', 7, 0, 6),
	(9, 'user222', NULL, '2023-01-16', '2023-01-21', '광주광역시', '처음으로 광주여행', 'Y', 6, 1, 5),
	(10, 'user222', NULL, '2022-11-30', '2022-12-03', '대구광역시', '대구로 떠나는 즉흥여행', 'Y', 4, 0, 4),
	(11, 'user222', NULL, '2022-11-27', '2022-11-30', '경상북도', '경상북도~! 가자고~!', 'Y', 4, 0, 35);
/*!40000 ALTER TABLE `planner` ENABLE KEYS */;

-- 테이블 samp.qna 구조 내보내기
DROP TABLE IF EXISTS `qna`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.qna:~0 rows (대략적) 내보내기
DELETE FROM `qna`;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;

-- 테이블 samp.reply 구조 내보내기
DROP TABLE IF EXISTS `reply`;
CREATE TABLE IF NOT EXISTS `reply` (
  `planner_no` int(11) DEFAULT NULL,
  `reply_no` int(11) NOT NULL AUTO_INCREMENT,
  `comment_no` int(11) DEFAULT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `reply_content` varchar(500) DEFAULT NULL,
  `reg_date` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`reply_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.reply:~2 rows (대략적) 내보내기
DELETE FROM `reply`;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` (`planner_no`, `reply_no`, `comment_no`, `user_id`, `reply_content`, `reg_date`) VALUES
	(9, 1, 1, 'Sao425', '저도 광주 여행 갈때 참고해야겠네요', '2022-11-18 18:18:25'),
	(9, 2, 1, 'Lucy785', '언제 여행 가세요? 저도 갈게요!', '2022-11-18 20:10:13');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;

-- 테이블 samp.reservation 구조 내보내기
DROP TABLE IF EXISTS `reservation`;
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

-- 테이블 데이터 samp.reservation:~154 rows (대략적) 내보내기
DELETE FROM `reservation`;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` (`RES_ID`, `USER_ID`, `IMP_UID`, `MERCHANT_UID`, `RES_NAME`, `RES_TEL`, `RES_EMAIL`, `HOST_ID`, `ROOM_ID`, `ROOM_NAME`, `ROOM_IMG`, `PAY_DATE`, `PAY_AMOUNT`, `RES_NUM`, `RES_STATUS`, `RES_CHECKIN`, `RES_CHECKOUT`) VALUES
	('RES001', 'user07', '-', '-', '박하늘', '01089012345', 'jungjong@triponplan.ga', 'host16', 'ROOM165', '하이펜션', 'pensionMain6.jpg', '2022-11-12 00:00:00', '120000', '2', '0', '2022-11-12', '2022-11-12'),
	('RES002', 'user01', '-', '-', '이상호', '01012341234', 'sanghoho@triponplan.ga', 'host16', 'ROOM165', '하이펜션', 'pensionMain6.jpg', '2022-11-12 00:00:00', '120000', '2', '0', '2022-11-13', '2022-11-13'),
	('RES003', 'user13', '-', '-', '권나봄', '01078901234', 'newroom@triponplan.ga', 'host16', 'ROOM165', '하이펜션', 'pensionMain6.jpg', '2022-11-13 00:00:00', '120000', '2', '1', '2022-11-14', '2022-11-14'),
	('RES004', 'user14', '-', '-', '송아리', '01089012345', 'leenabom@triponplan.ga', 'host16', 'ROOM165', '하이펜션', 'pensionMain6.jpg', '2022-11-14 00:00:00', '120000', '2', '1', '2022-11-15', '2022-11-16'),
	('RES005', 'user01', '-', '-', '이상호', '01012341234', 'sanghoho@triponplan.ga', 'host16', 'ROOM165', '하이펜션', 'pensionMain6.jpg', '2022-11-14 00:00:00', '120000', '2', '1', '2022-11-17', '2022-11-18'),
	('RES006', 'user24', '-', '-', '권나봄', '01023456789', 'standup@triponplan.ga', 'host16', 'ROOM165', '하이펜션', 'pensionMain6.jpg', '2022-11-15 00:00:00', '120000', '2', '1', '2022-11-19', '2022-11-20'),
	('RES007', 'user31', '-', '-', '류새벽', '01023456789', 'ryu1993@triponplan.ga', 'host16', 'ROOM165', '하이펜션', 'pensionMain6.jpg', '2022-11-16 00:00:00', '120000', '2', '1', '2022-11-21', '2022-11-21'),
	('RES008', 'user40', '-', '-', '박하늘', '01089012345', 'joenkang@triponplan.ga', 'host16', 'ROOM165', '하이펜션', 'pensionMain6.jpg', '2022-11-16 00:00:00', '120000', '2', '1', '2022-11-22', '2022-11-22'),
	('RES009', 'user42', '-', '-', '류새벽', '01023456789', 'iknownam@triponplan.ga', 'host16', 'ROOM165', '하이펜션', 'pensionMain6.jpg', '2022-11-16 00:00:00', '120000', '2', '1', '2022-11-23', '2022-11-23'),
	('RES010', 'user50', '-', '-', '장새롬', '01034567890', 'jangsae@triponplan.ga', 'host16', 'ROOM165', '하이펜션', 'pensionMain6.jpg', '2022-11-16 00:00:00', '120000', '2', '1', '2022-11-24', '2022-11-24'),
	('RES011', 'user58', '-', '-', '송아리', '01034567890', 'Yeon-jae@triponplan.ga', 'host16', 'ROOM165', '하이펜션', 'pensionMain6.jpg', '2022-11-17 00:00:00', '120000', '2', '1', '2022-11-25', '2022-11-25'),
	('RES012', 'user76', '-', '-', '한으뜸', '01078901234', 'skypark@triponplan.ga', 'host16', 'ROOM165', '하이펜션', 'pensionMain6.jpg', '2022-11-17 00:00:00', '120000', '2', '1', '2022-11-27', '2022-11-27'),
	('RES013', 'user84', '-', '-', '박하늘', '01089012345', 'oshee0313@triponplan.ga', 'host16', 'ROOM165', '하이펜션', 'pensionMain6.jpg', '2022-11-17 00:00:00', '120000', '2', '1', '2022-11-29', '2022-11-29'),
	('RES014', 'user01', '-', '-', '이상호', '01012341234', 'sanghoho@triponplan.ga', 'host13', 'ROOM162', '펜션지기', 'pensionMain3.jpg', '2022-11-10 00:00:00', '165000', '2', '0', '2022-11-10', '2022-11-11'),
	('RES015', 'user08', '-', '-', '김슬기', '01090123456', 'Yeon-jae@triponplan.ga', 'host13', 'ROOM162', '펜션지기', 'pensionMain3.jpg', '2022-11-11 00:00:00', '165000', '2', '0', '2022-11-13', '2022-11-15'),
	('RES016', 'user16', '-', '-', '이나리', '01023456789', 'simdanbi@triponplan.ga', 'host13', 'ROOM162', '펜션지기', 'pensionMain3.jpg', '2022-11-11 00:00:00', '165000', '2', '1', '2022-11-17', '2022-11-18'),
	('RES017', 'user25', '-', '-', '송아리', '01034567890', 'jangsae@triponplan.ga', 'host13', 'ROOM162', '펜션지기', 'pensionMain3.jpg', '2022-11-11 00:00:00', '165000', '2', '1', '2022-11-19', '2022-11-20'),
	('RES018', 'user32', '-', '-', '한으뜸', '01034567890', 'jungjong@triponplan.ga', 'host13', 'ROOM162', '펜션지기', 'pensionMain3.jpg', '2022-11-13 00:00:00', '165000', '2', '1', '2022-11-21', '2022-11-22'),
	('RES019', 'user43', '-', '-', '한으뜸', '01034567890', 'aramkim@triponplan.ga', 'host13', 'ROOM162', '펜션지기', 'pensionMain3.jpg', '2022-11-13 00:00:00', '165000', '2', '1', '2022-11-23', '2022-11-23'),
	('RES020', 'user51', '-', '-', '박하늘', '01056789012', 'skypark@triponplan.ga', 'host13', 'ROOM162', '펜션지기', 'pensionMain3.jpg', '2022-11-14 00:00:00', '165000', '2', '1', '2022-11-24', '2022-11-24'),
	('RES021', 'user59', '-', '-', '배구슬', '01056789012', 'oshee0313@triponplan.ga', 'host13', 'ROOM162', '펜션지기', 'pensionMain3.jpg', '2022-11-14 00:00:00', '165000', '2', '1', '2022-11-25', '2022-11-25'),
	('RES022', 'user68', '-', '-', '권나봄', '01078901234', 'aramkim@triponplan.ga', 'host13', 'ROOM162', '펜션지기', 'pensionMain3.jpg', '2022-11-14 00:00:00', '165000', '2', '1', '2022-11-26', '2022-11-26'),
	('RES023', 'user77', '-', '-', '백힘찬', '01089012345', 'seulgikim@triponplan.ga', 'host13', 'ROOM162', '펜션지기', 'pensionMain3.jpg', '2022-11-14 00:00:00', '165000', '2', '1', '2022-11-27', '2022-11-27'),
	('RES024', 'user85', '-', '-', '김슬기', '01090123456', 'wonchul@triponplan.ga', 'host13', 'ROOM162', '펜션지기', 'pensionMain3.jpg', '2022-11-14 00:00:00', '165000', '2', '1', '2022-11-29', '2022-11-29'),
	('RES025', 'user92', '-', '-', '배구슬', '01078901234', 'iknownam@triponplan.ga', 'host13', 'ROOM162', '펜션지기', 'pensionMain3.jpg', '2022-11-15 00:00:00', '165000', '2', '1', '2022-11-30', '2022-11-30'),
	('RES026', 'user101', '-', '-', '권나봄', '01078901234', 'skypark@triponplan.ga', 'host13', 'ROOM162', '펜션지기', 'pensionMain3.jpg', '2022-11-16 00:00:00', '165000', '2', '1', '2022-12-03', '2022-12-03'),
	('RES027', 'user110', '-', '-', '백힘찬', '01078901234', 'wonchul@triponplan.ga', 'host13', 'ROOM162', '펜션지기', 'pensionMain3.jpg', '2022-11-17 00:00:00', '165000', '2', '1', '2022-12-05', '2022-12-05'),
	('RES028', 'user116', '-', '-', '장새롬', '01067890123', 'simdanbi@triponplan.ga', 'host13', 'ROOM162', '펜션지기', 'pensionMain3.jpg', '2022-11-17 00:00:00', '165000', '2', '1', '2022-12-07', '2022-12-07'),
	('RES029', 'user122', '-', '-', '양한결', '01034567890', 'songari@triponplan.ga', 'host13', 'ROOM162', '펜션지기', 'pensionMain3.jpg', '2022-11-17 00:00:00', '165000', '2', '1', '2022-12-08', '2022-12-08'),
	('RES030', 'user128', '-', '-', '박하늘', '01023456789', 'kwangil2@triponplan.ga', 'host13', 'ROOM162', '펜션지기', 'pensionMain3.jpg', '2022-11-17 00:00:00', '165000', '2', '1', '2022-12-09', '2022-12-09'),
	('RES031', 'user132', '-', '-', '백힘찬', '01056789012', 'jungjong@triponplan.ga', 'host13', 'ROOM162', '펜션지기', 'pensionMain3.jpg', '2022-11-17 00:00:00', '165000', '2', '1', '2022-12-10', '2022-12-10'),
	('RES032', 'user136', '-', '-', '배구슬', '01078901234', 'youminah@triponplan.ga', 'host13', 'ROOM162', '펜션지기', 'pensionMain3.jpg', '2022-11-17 00:00:00', '165000', '2', '1', '2022-12-11', '2022-12-11'),
	('RES033', 'user33', '-', '-', '백힘찬', '01023456789', 'Yeon-jae@triponplan.ga', 'host29', 'ROOM177', '칸타빌모텔', 'MotelMain8.jpg', '2022-11-11 00:00:00', '110000', '2', '1', '2022-11-21', '2022-11-22'),
	('RES034', 'user44', '-', '-', '백힘찬', '01056789012', 'moonbo@triponplan.ga', 'host08', 'ROOM157', '창원민박', 'MinbakMain6.jpg', '2022-11-12 00:00:00', '60000', '2', '1', '2022-11-23', '2022-11-23'),
	('RES035', 'user52', '-', '-', '김슬기', '01067890123', 'seulgikim@triponplan.ga', 'host10', 'ROOM159', '진해민박', 'MinbakMain8.jpg', '2022-11-13 00:00:00', '96000', '2', '1', '2022-11-24', '2022-11-24'),
	('RES036', 'user60', '-', '-', '이나리', '01067890123', 'wonchul@triponplan.ga', 'host01', 'ROOM175', '일로와모텔', 'MotelMain6.jpg', '2022-11-13 00:00:00', '59000', '2', '1', '2022-11-25', '2022-11-25'),
	('RES037', 'user69', '-', '-', '송아리', '01089012345', 'moonbo@triponplan.ga', 'host11', 'ROOM160', '일등펜션', 'pensionMain1.jpg', '2022-11-13 00:00:00', '150000', '2', '1', '2022-11-26', '2022-11-26'),
	('RES038', 'user78', '-', '-', '양한결', '01090123456', 'kwangil2@triponplan.ga', 'host22', 'ROOM171', '유림모텔', 'MotelMain2.jpg', '2022-11-15 00:00:00', '120000', '2', '1', '2022-11-27', '2022-11-27'),
	('RES039', 'user86', '-', '-', '류새벽', '01023456789', 'youminah@triponplan.ga', 'host20', 'ROOM169', '시골펜션', 'pensionMain10.jpg', '2022-11-15 00:00:00', '230000', '2', '1', '2022-11-29', '2022-11-29'),
	('RES040', 'user93', '-', '-', '이나리', '01067890123', 'aramkim@triponplan.ga', 'host01', 'ROOM174', '샤르망모텔', 'MotelMain5.jpg', '2022-11-13 00:00:00', '66000', '2', '1', '2022-11-30', '2022-11-30'),
	('RES041', 'user99', '-', '-', '백힘찬', '01056789012', 'standup@triponplan.ga', 'host01', 'ROOM174', '샤르망모텔', 'MotelMain5.jpg', '2022-11-13 00:00:00', '66000', '2', '1', '2022-12-01', '2022-12-01'),
	('RES042', 'user100', '-', '-', '양한결', '01067890123', 'jangsae@triponplan.ga', 'host01', 'ROOM174', '샤르망모텔', 'MotelMain5.jpg', '2022-11-15 00:00:00', '66000', '2', '1', '2022-12-02', '2022-12-02'),
	('RES043', 'user102', '-', '-', '송아리', '01089012345', 'seulgikim@triponplan.ga', 'host01', 'ROOM174', '샤르망모텔', 'MotelMain5.jpg', '2022-11-15 00:00:00', '66000', '2', '1', '2022-12-03', '2022-12-03'),
	('RES044', 'user109', '-', '-', '한으뜸', '01067890123', 'oshee0313@triponplan.ga', 'host01', 'ROOM174', '샤르망모텔', 'MotelMain5.jpg', '2022-11-17 00:00:00', '66000', '2', '1', '2022-12-04', '2022-12-04'),
	('RES045', 'user103', '-', '-', '배구슬', '01090123456', 'kwangil2@triponplan.ga', 'host01', 'ROOM152', '민박전문', 'MinbakMain1.jpg', '2022-11-16 00:00:00', '75000', '2', '1', '2022-12-03', '2022-12-03'),
	('RES046', 'user61', '-', '-', '장새롬', '01078901234', 'youminah@triponplan.ga', 'host28', 'ROOM178', '모텔꿈꾸다', 'MotelMain9.jpg', '2022-11-17 00:00:00', '60000', '2', '1', '2022-11-25', '2022-11-25'),
	('RES047', 'user62', '-', '-', '박하늘', '01089012345', 'songsea@triponplan.ga', 'host09', 'ROOM158', '마산민박', 'MinbakMain7.jpg', '2022-11-16 00:00:00', '110000', '2', '1', '2022-11-25', '2022-11-25'),
	('RES048', 'user70', '-', '-', '배구슬', '01090123456', 'saerone@triponplan.ga', 'host21', 'ROOM170', '리베라모텔', 'MotelMain1.jpg', '2022-11-16 00:00:00', '80000', '2', '1', '2022-11-26', '2022-11-26'),
	('RES049', 'user02', '-', '-', '권나봄', '01023456789', 'sim0303@triponplan.ga', 'host23', 'ROOM172', '로얄모텔', 'MotelMain3.jpg', '2022-10-31 00:00:00', '200000', '2', '0', '2022-11-10', '2022-11-11'),
	('RES050', 'user01', '-', '-', '이상호', '01012341234', 'sanghoho@triponplan.ga', 'host23', 'ROOM172', '로얄모텔', 'MotelMain3.jpg', '2022-11-06 00:00:00', '200000', '2', '0', '2022-11-13', '2022-11-15'),
	('RES051', 'user17', '-', '-', '장새롬', '01034567890', 'iknownam@triponplan.ga', 'host23', 'ROOM172', '로얄모텔', 'MotelMain3.jpg', '2022-11-08 00:00:00', '200000', '2', '1', '2022-11-17', '2022-11-18'),
	('RES052', 'user26', '-', '-', '배구슬', '01056789012', 'skypark@triponplan.ga', 'host23', 'ROOM172', '로얄모텔', 'MotelMain3.jpg', '2022-11-09 00:00:00', '200000', '2', '1', '2022-11-19', '2022-11-20'),
	('RES053', 'user34', '-', '-', '양한결', '01034567890', 'oshee0313@triponplan.ga', 'host23', 'ROOM172', '로얄모텔', 'MotelMain3.jpg', '2022-11-09 00:00:00', '200000', '2', '1', '2022-11-21', '2022-11-22'),
	('RES054', 'user45', '-', '-', '양한결', '01067890123', 'saerone@triponplan.ga', 'host23', 'ROOM172', '로얄모텔', 'MotelMain3.jpg', '2022-11-09 00:00:00', '200000', '2', '1', '2022-11-23', '2022-11-23'),
	('RES055', 'user53', '-', '-', '류새벽', '01067890123', 'kwangil2@triponplan.ga', 'host23', 'ROOM172', '로얄모텔', 'MotelMain3.jpg', '2022-11-10 00:00:00', '200000', '2', '1', '2022-11-24', '2022-11-24'),
	('RES056', 'user63', '-', '-', '김슬기', '01090123456', 'newroom@triponplan.ga', 'host23', 'ROOM172', '로얄모텔', 'MotelMain3.jpg', '2022-11-11 00:00:00', '200000', '2', '1', '2022-11-25', '2022-11-25'),
	('RES057', 'user71', '-', '-', '이나리', '01023456789', 'youseeme@triponplan.ga', 'host23', 'ROOM172', '로얄모텔', 'MotelMain3.jpg', '2022-11-12 00:00:00', '200000', '2', '1', '2022-11-26', '2022-11-26'),
	('RES058', 'user79', '-', '-', '권나봄', '01023456789', 'namso123@triponplan.ga', 'host23', 'ROOM172', '로얄모텔', 'MotelMain3.jpg', '2022-11-13 00:00:00', '200000', '2', '1', '2022-11-27', '2022-11-27'),
	('RES059', 'user87', '-', '-', '한으뜸', '01034567890', 'songsea@triponplan.ga', 'host23', 'ROOM172', '로얄모텔', 'MotelMain3.jpg', '2022-11-13 00:00:00', '200000', '2', '1', '2022-11-29', '2022-11-29'),
	('RES060', 'user94', '-', '-', '장새롬', '01078901234', 'moonbo@triponplan.ga', 'host23', 'ROOM172', '로얄모텔', 'MotelMain3.jpg', '2022-11-13 00:00:00', '200000', '2', '1', '2022-11-30', '2022-11-30'),
	('RES061', 'user104', '-', '-', '이나리', '01023456789', 'namso123@triponplan.ga', 'host23', 'ROOM172', '로얄모텔', 'MotelMain3.jpg', '2022-11-15 00:00:00', '200000', '2', '1', '2022-12-03', '2022-12-03'),
	('RES062', 'user111', '-', '-', '양한결', '01089012345', 'youminah@triponplan.ga', 'host23', 'ROOM172', '로얄모텔', 'MotelMain3.jpg', '2022-11-15 00:00:00', '200000', '2', '1', '2022-12-05', '2022-12-05'),
	('RES067', 'user117', '-', '-', '박하늘', '01067890123', 'iknownam@triponplan.ga', 'host23', 'ROOM172', '로얄모텔', 'MotelMain3.jpg', '2022-11-16 00:00:00', '200000', '2', '1', '2022-12-07', '2022-12-07'),
	('RES068', 'user123', '-', '-', '권나봄', '01056789012', 'shipmarble@triponplan.ga', 'host23', 'ROOM172', '로얄모텔', 'MotelMain3.jpg', '2022-11-16 00:00:00', '200000', '2', '1', '2022-12-08', '2022-12-08'),
	('RES069', 'user137', '-', '-', '이나리', '01089012345', 'songsea@triponplan.ga', 'host23', 'ROOM172', '로얄모텔', 'MotelMain3.jpg', '2022-11-17 00:00:00', '200000', '2', '1', '2022-12-11', '2022-12-15'),
	('RES070', 'user149', '-', '-', '장새롬', '01067890123', 'standup@triponplan.ga', 'host23', 'ROOM172', '로얄모텔', 'MotelMain3.jpg', '2022-11-17 00:00:00', '200000', '2', '1', '2022-12-21', '2022-12-24'),
	('RES071', 'user01', '-', '-', '이상호', '01012341234', 'sanghoho@triponplan.ga', 'host06', 'ROOM155', '동해민박', 'MinbakMain4.jpg', '2022-11-15 00:00:00', '45000', '2', '1', '2022-11-15', '2022-11-17'),
	('RES072', 'user18', '-', '-', '박하늘', '01056789012', 'aramkim@triponplan.ga', 'host18', 'ROOM167', '농촌펜션', 'pensionMain8.jpg', '2022-11-16 00:00:00', '145000', '2', '1', '2022-11-17', '2022-11-22'),
	('RES073', 'user41', '-', '-', '김슬기', '01090123456', 'simdanbi@triponplan.ga', 'host07', 'ROOM156', '남해민박', 'MinbakMain5.jpg', '2022-11-16 00:00:00', '90000', '2', '1', '2022-11-22', '2022-11-25'),
	('RES074', 'user23', '-', '-', '양한결', '01090123456', 'shipmarble@triponplan.ga', 'host15', 'ROOM164', '궁평항펜션', 'pensionMain5.jpg', '2022-11-14 00:00:00', '150000', '2', '1', '2022-11-18', '2022-11-29'),
	('RES075', 'user03', '-', '-', '송아리', '01034567890', 'kwangil2@triponplan.ga', 'host01', 'ROOM154', '경남민박', 'MinbakMain3.jpg', '2022-10-31 00:00:00', '64000', '2', '0', '2022-11-10', '2022-11-11'),
	('RES076', 'user09', '-', '-', '류새벽', '01023456789', 'oshee0313@triponplan.ga', 'host01', 'ROOM154', '경남민박', 'MinbakMain3.jpg', '2022-11-06 00:00:00', '64000', '2', '0', '2022-11-13', '2022-11-15'),
	('RES077', 'user19', '-', '-', '김슬기', '01067890123', 'moonbo@triponplan.ga', 'host01', 'ROOM154', '경남민박', 'MinbakMain3.jpg', '2022-11-08 00:00:00', '64000', '2', '1', '2022-11-17', '2022-11-18'),
	('RES078', 'user27', '-', '-', '이나리', '01067890123', 'seulgikim@triponplan.ga', 'host01', 'ROOM154', '경남민박', 'MinbakMain3.jpg', '2022-11-09 00:00:00', '64000', '2', '1', '2022-11-19', '2022-11-20'),
	('RES079', 'user35', '-', '-', '권나봄', '01056789012', 'wonchul@triponplan.ga', 'host01', 'ROOM154', '경남민박', 'MinbakMain3.jpg', '2022-11-09 00:00:00', '64000', '2', '1', '2022-11-21', '2022-11-22'),
	('RES080', 'user46', '-', '-', '권나봄', '01078901234', 'youseeme@triponplan.ga', 'host01', 'ROOM154', '경남민박', 'MinbakMain3.jpg', '2022-11-09 00:00:00', '64000', '2', '1', '2022-11-23', '2022-11-23'),
	('RES081', 'user54', '-', '-', '한으뜸', '01078901234', 'namso123@triponplan.ga', 'host01', 'ROOM154', '경남민박', 'MinbakMain3.jpg', '2022-11-10 00:00:00', '64000', '2', '1', '2022-11-24', '2022-11-24'),
	('RES082', 'user64', '-', '-', '류새벽', '01023456789', 'leenabom@triponplan.ga', 'host01', 'ROOM154', '경남민박', 'MinbakMain3.jpg', '2022-11-11 00:00:00', '64000', '2', '1', '2022-11-25', '2022-11-25'),
	('RES083', 'user72', '-', '-', '장새롬', '01034567890', 'songari@triponplan.ga', 'host01', 'ROOM154', '경남민박', 'MinbakMain3.jpg', '2022-11-12 00:00:00', '64000', '2', '1', '2022-11-26', '2022-11-26'),
	('RES084', 'user80', '-', '-', '송아리', '01034567890', 'pyojong@triponplan.ga', 'host01', 'ROOM154', '경남민박', 'MinbakMain3.jpg', '2022-11-13 00:00:00', '64000', '2', '1', '2022-11-27', '2022-11-27'),
	('RES085', 'user88', '-', '-', '백힘찬', '01023456789', 'newroom@triponplan.ga', 'host01', 'ROOM154', '경남민박', 'MinbakMain3.jpg', '2022-11-13 00:00:00', '64000', '2', '1', '2022-11-29', '2022-11-29'),
	('RES086', 'user95', '-', '-', '박하늘', '01089012345', 'saerone@triponplan.ga', 'host01', 'ROOM154', '경남민박', 'MinbakMain3.jpg', '2022-11-13 00:00:00', '64000', '2', '1', '2022-11-30', '2022-11-30'),
	('RES087', 'user105', '-', '-', '장새롬', '01034567890', 'pyojong@triponplan.ga', 'host01', 'ROOM154', '경남민박', 'MinbakMain3.jpg', '2022-11-15 00:00:00', '64000', '2', '1', '2022-12-03', '2022-12-03'),
	('RES088', 'user112', '-', '-', '권나봄', '01090123456', 'songsea@triponplan.ga', 'host01', 'ROOM154', '경남민박', 'MinbakMain3.jpg', '2022-11-15 00:00:00', '64000', '2', '1', '2022-12-05', '2022-12-05'),
	('RES089', 'user118', '-', '-', '김슬기', '01078901234', 'aramkim@triponplan.ga', 'host01', 'ROOM154', '경남민박', 'MinbakMain3.jpg', '2022-11-16 00:00:00', '64000', '2', '1', '2022-12-07', '2022-12-07'),
	('RES090', 'user124', '-', '-', '송아리', '01067890123', 'standup@triponplan.ga', 'host01', 'ROOM154', '경남민박', 'MinbakMain3.jpg', '2022-11-16 00:00:00', '64000', '2', '1', '2022-12-08', '2022-12-08'),
	('RES091', 'user129', '-', '-', '김슬기', '01034567890', 'namso123@triponplan.ga', 'host01', 'ROOM154', '경남민박', 'MinbakMain3.jpg', '2022-11-17 00:00:00', '64000', '2', '1', '2022-12-09', '2022-12-09'),
	('RES092', 'user133', '-', '-', '양한결', '01067890123', 'Yeon-jae@triponplan.ga', 'host01', 'ROOM154', '경남민박', 'MinbakMain3.jpg', '2022-11-17 00:00:00', '64000', '2', '1', '2022-12-10', '2022-12-10'),
	('RES093', 'user04', '-', '-', '배구슬', '01056789012', 'namso123@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-10 00:00:00', '80000', '2', '0', '2022-11-10', '2022-11-11'),
	('RES094', 'user10', '-', '-', '한으뜸', '01034567890', 'wonchul@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-11 00:00:00', '80000', '2', '0', '2022-11-13', '2022-11-15'),
	('RES095', 'user20', '-', '-', '류새벽', '01067890123', 'saerone@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-11 00:00:00', '80000', '2', '1', '2022-11-17', '2022-11-18'),
	('RES096', 'user28', '-', '-', '장새롬', '01078901234', 'kwangil2@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-11 00:00:00', '80000', '2', '1', '2022-11-19', '2022-11-20'),
	('RES097', 'user36', '-', '-', '송아리', '01067890123', 'youminah@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-13 00:00:00', '80000', '2', '1', '2022-11-21', '2022-11-22'),
	('RES098', 'user47', '-', '-', '송아리', '01089012345', 'songari@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-13 00:00:00', '80000', '2', '1', '2022-11-23', '2022-11-23'),
	('RES099', 'user55', '-', '-', '백힘찬', '01089012345', 'pyojong@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-14 00:00:00', '80000', '2', '1', '2022-11-24', '2022-11-24'),
	('RES100', 'user65', '-', '-', '한으뜸', '01034567890', 'joenkang@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-14 00:00:00', '80000', '2', '1', '2022-11-25', '2022-11-25'),
	('RES101', 'user73', '-', '-', '박하늘', '01056789012', 'shipmarble@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-14 00:00:00', '80000', '2', '1', '2022-11-26', '2022-11-26'),
	('RES102', 'user81', '-', '-', '배구슬', '01056789012', 'ryu1993@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-14 00:00:00', '80000', '2', '1', '2022-11-27', '2022-11-27'),
	('RES103', 'user89', '-', '-', '양한결', '01034567890', 'leenabom@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-14 00:00:00', '80000', '2', '1', '2022-11-29', '2022-11-29'),
	('RES104', 'user96', '-', '-', '김슬기', '01090123456', 'youseeme@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-15 00:00:00', '80000', '2', '1', '2022-11-30', '2022-11-30'),
	('RES105', 'user106', '-', '-', '박하늘', '01056789012', 'ryu1993@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-16 00:00:00', '80000', '2', '1', '2022-12-03', '2022-12-03'),
	('RES106', 'user113', '-', '-', '송아리', '01023456789', 'newroom@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-17 00:00:00', '80000', '2', '1', '2022-12-05', '2022-12-05'),
	('RES107', 'user119', '-', '-', '류새벽', '01089012345', 'moonbo@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-17 00:00:00', '80000', '2', '1', '2022-12-07', '2022-12-07'),
	('RES108', 'user125', '-', '-', '배구슬', '01078901234', 'jangsae@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-17 00:00:00', '80000', '2', '1', '2022-12-08', '2022-12-08'),
	('RES109', 'user130', '-', '-', '류새벽', '01023456789', 'pyojong@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-17 00:00:00', '80000', '2', '1', '2022-12-09', '2022-12-09'),
	('RES110', 'user134', '-', '-', '권나봄', '01078901234', 'oshee0313@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-17 00:00:00', '80000', '2', '1', '2022-12-10', '2022-12-10'),
	('RES111', 'user138', '-', '-', '장새롬', '01090123456', 'newroom@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-17 00:00:00', '80000', '2', '1', '2022-12-11', '2022-12-11'),
	('RES112', 'user141', '-', '-', '류새벽', '01056789012', 'simdanbi@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-17 00:00:00', '80000', '2', '1', '2022-12-13', '2022-12-15'),
	('RES113', 'user143', '-', '-', '백힘찬', '01078901234', 'aramkim@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-17 00:00:00', '80000', '2', '1', '2022-12-16', '2022-12-16'),
	('RES114', 'user146', '-', '-', '송아리', '01023456789', 'youseeme@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-17 00:00:00', '80000', '2', '1', '2022-12-17', '2022-12-19'),
	('RES115', 'user150', '-', '-', '박하늘', '01067890123', 'jangsae@triponplan.ga', 'host01', 'ROOM153', '강원민박', 'MinbakMain2.jpg', '2022-11-17 00:00:00', '80000', '2', '1', '2022-12-22', '2022-12-25'),
	('RES116', 'user15', '-', '-', '배구슬', '01090123456', 'joenkang@triponplan.ga', 'host12', 'ROOM161', '강남펜션', 'pensionMain2.jpg', '2022-11-16 00:00:00', '170000', '2', '1', '2022-11-16', '2022-11-17'),
	('RES117', 'user05', '-', '-', '이나리', '01067890123', 'pyojong@triponplan.ga', 'host19', 'ROOM168', '강근처펜션', 'pensionMain9.jpg', '2022-10-31 00:00:00', '210000', '2', '0', '2022-11-10', '2022-11-11'),
	('RES118', 'user11', '-', '-', '백힘찬', '01056789012', 'youminah@triponplan.ga', 'host19', 'ROOM168', '강근처펜션', 'pensionMain9.jpg', '2022-11-06 00:00:00', '210000', '2', '0', '2022-11-13', '2022-11-15'),
	('RES119', 'user21', '-', '-', '한으뜸', '01078901234', 'youseeme@triponplan.ga', 'host19', 'ROOM168', '강근처펜션', 'pensionMain9.jpg', '2022-11-08 00:00:00', '210000', '2', '1', '2022-11-17', '2022-11-18'),
	('RES120', 'user29', '-', '-', '박하늘', '01089012345', 'namso123@triponplan.ga', 'host19', 'ROOM168', '강근처펜션', 'pensionMain9.jpg', '2022-11-09 00:00:00', '210000', '2', '1', '2022-11-19', '2022-11-20'),
	('RES121', 'user37', '-', '-', '배구슬', '01078901234', 'songsea@triponplan.ga', 'host19', 'ROOM168', '강근처펜션', 'pensionMain9.jpg', '2022-11-09 00:00:00', '210000', '2', '1', '2022-11-21', '2022-11-22'),
	('RES122', 'user48', '-', '-', '배구슬', '01090123456', 'shipmarble@triponplan.ga', 'host19', 'ROOM168', '강근처펜션', 'pensionMain9.jpg', '2022-11-09 00:00:00', '210000', '2', '1', '2022-11-23', '2022-11-23'),
	('RES123', 'user56', '-', '-', '양한결', '01090123456', 'ryu1993@triponplan.ga', 'host19', 'ROOM168', '강근처펜션', 'pensionMain9.jpg', '2022-11-10 00:00:00', '210000', '2', '1', '2022-11-24', '2022-11-24'),
	('RES124', 'user66', '-', '-', '백힘찬', '01056789012', 'simdanbi@triponplan.ga', 'host19', 'ROOM168', '강근처펜션', 'pensionMain9.jpg', '2022-11-11 00:00:00', '210000', '2', '1', '2022-11-25', '2022-11-25'),
	('RES125', 'user74', '-', '-', '김슬기', '01067890123', 'standup@triponplan.ga', 'host19', 'ROOM168', '강근처펜션', 'pensionMain9.jpg', '2022-11-12 00:00:00', '210000', '2', '1', '2022-11-26', '2022-11-26'),
	('RES126', 'user82', '-', '-', '이나리', '01067890123', 'jungjong@triponplan.ga', 'host19', 'ROOM168', '강근처펜션', 'pensionMain9.jpg', '2022-11-13 00:00:00', '210000', '2', '1', '2022-11-27', '2022-11-27'),
	('RES127', 'user90', '-', '-', '권나봄', '01056789012', 'joenkang@triponplan.ga', 'host19', 'ROOM168', '강근처펜션', 'pensionMain9.jpg', '2022-11-13 00:00:00', '210000', '2', '1', '2022-11-29', '2022-11-29'),
	('RES128', 'user97', '-', '-', '류새벽', '01023456789', 'songari@triponplan.ga', 'host19', 'ROOM168', '강근처펜션', 'pensionMain9.jpg', '2022-11-13 00:00:00', '210000', '2', '1', '2022-11-30', '2022-11-30'),
	('RES129', 'user107', '-', '-', '김슬기', '01034567890', 'jungjong@triponplan.ga', 'host19', 'ROOM168', '강근처펜션', 'pensionMain9.jpg', '2022-11-15 00:00:00', '210000', '2', '1', '2022-12-03', '2022-12-03'),
	('RES130', 'user114', '-', '-', '배구슬', '01034567890', 'leenabom@triponplan.ga', 'host19', 'ROOM168', '강근처펜션', 'pensionMain9.jpg', '2022-11-15 00:00:00', '210000', '2', '1', '2022-12-05', '2022-12-05'),
	('RES131', 'user120', '-', '-', '한으뜸', '01090123456', 'saerone@triponplan.ga', 'host19', 'ROOM168', '강근처펜션', 'pensionMain9.jpg', '2022-11-16 00:00:00', '210000', '2', '1', '2022-12-07', '2022-12-07'),
	('RES132', 'user126', '-', '-', '이나리', '01089012345', 'skypark@triponplan.ga', 'host19', 'ROOM168', '강근처펜션', 'pensionMain9.jpg', '2022-11-16 00:00:00', '210000', '2', '1', '2022-12-08', '2022-12-08'),
	('RES133', 'user38', '-', '-', '이나리', '01067890123', 'newroom@triponplan.ga', 'host17', 'ROOM166', '감상펜션', 'pensionMain7.jpg', '2022-11-16 00:00:00', '130000', '2', '1', '2022-11-21', '2022-11-22'),
	('RES134', 'user06', '-', '-', '장새롬', '01078901234', 'ryu1993@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-10-31 00:00:00', '144000', '2', '0', '2022-11-10', '2022-11-11'),
	('RES135', 'user12', '-', '-', '양한결', '01067890123', 'songsea@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-11-06 00:00:00', '144000', '2', '0', '2022-11-13', '2022-11-15'),
	('RES136', 'user22', '-', '-', '백힘찬', '01089012345', 'songari@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-11-08 00:00:00', '144000', '2', '1', '2022-11-17', '2022-11-18'),
	('RES137', 'user30', '-', '-', '김슬기', '01090123456', 'pyojong@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-11-09 00:00:00', '144000', '2', '1', '2022-11-19', '2022-11-20'),
	('RES138', 'user39', '-', '-', '장새롬', '01078901234', 'leenabom@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-11-09 00:00:00', '144000', '2', '1', '2022-11-21', '2022-11-22'),
	('RES139', 'user49', '-', '-', '이나리', '01023456789', 'standup@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-11-09 00:00:00', '144000', '2', '1', '2022-11-23', '2022-11-23'),
	('RES140', 'user57', '-', '-', '권나봄', '01023456789', 'jungjong@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-11-10 00:00:00', '144000', '2', '1', '2022-11-24', '2022-11-24'),
	('RES141', 'user67', '-', '-', '양한결', '01067890123', 'iknownam@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-11-11 00:00:00', '144000', '2', '1', '2022-11-25', '2022-11-25'),
	('RES142', 'user75', '-', '-', '류새벽', '01067890123', 'jangsae@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-11-12 00:00:00', '144000', '2', '1', '2022-11-26', '2022-11-26'),
	('RES143', 'user83', '-', '-', '장새롬', '01078901234', 'Yeon-jae@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-11-13 00:00:00', '144000', '2', '1', '2022-11-27', '2022-11-27'),
	('RES144', 'user91', '-', '-', '송아리', '01067890123', 'simdanbi@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-11-13 00:00:00', '144000', '2', '1', '2022-11-29', '2022-11-29'),
	('RES145', 'user98', '-', '-', '한으뜸', '01034567890', 'shipmarble@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-11-13 00:00:00', '144000', '2', '1', '2022-11-30', '2022-11-30'),
	('RES146', 'user108', '-', '-', '류새벽', '01056789012', 'Yeon-jae@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-11-15 00:00:00', '144000', '2', '1', '2022-12-03', '2022-12-03'),
	('RES147', 'user115', '-', '-', '이나리', '01056789012', 'joenkang@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-11-15 00:00:00', '144000', '2', '1', '2022-12-05', '2022-12-05'),
	('RES148', 'user121', '-', '-', '백힘찬', '01023456789', 'youseeme@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-11-16 00:00:00', '144000', '2', '1', '2022-12-07', '2022-12-07'),
	('RES149', 'user127', '-', '-', '장새롬', '01090123456', 'seulgikim@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-11-16 00:00:00', '144000', '2', '1', '2022-12-08', '2022-12-08'),
	('RES150', 'user131', '-', '-', '한으뜸', '01034567890', 'ryu1993@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-11-16 00:00:00', '144000', '2', '1', '2022-12-09', '2022-12-09'),
	('RES151', 'user135', '-', '-', '송아리', '01067890123', 'wonchul@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-11-16 00:00:00', '144000', '2', '1', '2022-12-10', '2022-12-10'),
	('RES152', 'user139', '-', '-', '박하늘', '01023456789', 'leenabom@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-11-16 00:00:00', '144000', '2', '1', '2022-12-11', '2022-12-11'),
	('RES153', 'user140', '-', '-', '김슬기', '01034567890', 'joenkang@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-11-16 00:00:00', '144000', '2', '1', '2022-12-12', '2022-12-12'),
	('RES154', 'user142', '-', '-', '한으뜸', '01067890123', 'iknownam@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-11-16 00:00:00', '144000', '2', '1', '2022-12-13', '2022-12-13'),
	('RES155', 'user144', '-', '-', '양한결', '01089012345', 'moonbo@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-11-16 00:00:00', '144000', '2', '1', '2022-12-16', '2022-12-16'),
	('RES156', 'user147', '-', '-', '배구슬', '01034567890', 'songari@triponplan.ga', 'host14', 'ROOM163', '가평펜션', 'pensionMain4.jpg', '2022-11-16 00:00:00', '144000', '2', '1', '2022-12-18', '2022-12-18'),
	('RES157', 'user145', '-', '-', '권나봄', '01090123456', 'saerone@triponplan.ga', 'host27', 'ROOM176', 'SS모텔', 'MotelMain7.jpg', '2022-11-13 00:00:00', '89000', '2', '1', '2022-12-16', '2022-12-16'),
	('RES158', 'user148', '-', '-', '이나리', '01056789012', 'shipmarble@triponplan.ga', 'host24', 'ROOM173', 'CNC모텔', 'MotelMain4.jpg', '2022-11-17 00:00:00', '84000', '2', '1', '2022-12-18', '2022-12-18');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;

-- 테이블 samp.reservation_seq 구조 내보내기
DROP TABLE IF EXISTS `reservation_seq`;
CREATE TABLE IF NOT EXISTS `reservation_seq` (
  `RES_ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`RES_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.reservation_seq:~157 rows (대략적) 내보내기
DELETE FROM `reservation_seq`;
/*!40000 ALTER TABLE `reservation_seq` DISABLE KEYS */;
INSERT INTO `reservation_seq` (`RES_ID`) VALUES
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
	(27),
	(28),
	(29),
	(30),
	(31),
	(32),
	(33),
	(34),
	(35),
	(36),
	(37),
	(38),
	(39),
	(40),
	(41),
	(42),
	(43),
	(44),
	(45),
	(46),
	(47),
	(48),
	(49),
	(50),
	(51),
	(52),
	(53),
	(54),
	(55),
	(56),
	(57),
	(58),
	(59),
	(60),
	(61),
	(62),
	(63),
	(64),
	(65),
	(66),
	(67),
	(68),
	(69),
	(70),
	(71),
	(72),
	(73),
	(74),
	(75),
	(76),
	(77),
	(78),
	(79),
	(80),
	(81),
	(82),
	(83),
	(84),
	(85),
	(86),
	(87),
	(88),
	(89),
	(90),
	(91),
	(92),
	(93),
	(94),
	(95),
	(96),
	(97),
	(98),
	(99),
	(100),
	(101),
	(102),
	(103),
	(104),
	(105),
	(106),
	(107),
	(108),
	(109),
	(110),
	(111),
	(112),
	(113),
	(114),
	(115),
	(116),
	(117),
	(118),
	(119),
	(120),
	(121),
	(122),
	(123),
	(124),
	(125),
	(126),
	(127),
	(128),
	(129),
	(130),
	(131),
	(132),
	(133),
	(134),
	(135),
	(136),
	(137),
	(138),
	(139),
	(140),
	(141),
	(142),
	(143),
	(144),
	(145),
	(146),
	(147),
	(148),
	(149),
	(150),
	(151),
	(152),
	(153),
	(154),
	(155),
	(156),
	(157),
	(158);
/*!40000 ALTER TABLE `reservation_seq` ENABLE KEYS */;

-- 테이블 samp.review 구조 내보내기
DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `REVIEW_ID` varchar(50) NOT NULL,
  `ROOM_NAME` varchar(50) DEFAULT NULL,
  `ROOM_ID` varchar(50) DEFAULT NULL,
  `HOST_ID` varchar(50) DEFAULT NULL,
  `USER_ID` varchar(50) DEFAULT NULL,
  `REVIEW_CONTENT` varchar(1000) DEFAULT NULL,
  `REVIEW_IMG` varchar(50) DEFAULT NULL,
  `STAR_POINT` double DEFAULT NULL,
  `WRITE_DATE` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`REVIEW_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.review:~45 rows (대략적) 내보내기
DELETE FROM `review`;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` (`REVIEW_ID`, `ROOM_NAME`, `ROOM_ID`, `HOST_ID`, `USER_ID`, `REVIEW_CONTENT`, `REVIEW_IMG`, `STAR_POINT`, `WRITE_DATE`) VALUES
	('REVIEW00001', '강남펜션', 'ROOM161', 'host12', 'user15', '친절한 주인분 만나서 잘 놀다 갑니다. 좋았어요. ', 'pensionMain2.jpg', 5, '2022-11-17 00:00:00'),
	('REVIEW00002', '샤르망모텔', 'ROOM174', 'host01', 'user100', '그냥 그랬어요', 'MotelMain5.jpg', 3, '2022-11-17 00:00:00'),
	('REVIEW00003', '경남민박', 'ROOM154', 'host01', 'user27', '최악의 민박 리뷰 시작합니다..', '', 1, '2022-11-17 00:00:00'),
	('REVIEW00004', '경남민박', 'ROOM154', 'host01', 'user95', '한국 좋아요. 김치 좋아요. 사랑해요 연예가중계', '', 5, '2022-11-17 00:00:00'),
	('REVIEW00005', '경남민박', 'ROOM154', 'host01', 'user129', '힐링 제대로 하고 가요', '', 3.5, '2022-11-17 00:00:00'),
	('REVIEW00006', '경남민박', 'ROOM154', 'host01', 'user133', '조식 제공이 좋았어요', '', 4.5, '2022-11-17 00:00:00'),
	('REVIEW00007', '강원민박', 'ROOM153', 'host01', 'user04', '수영장이 깨끗하고 넓네요', '', 4, '2022-11-17 00:00:00'),
	('REVIEW00008', '강원민박', 'ROOM153', 'host01', 'user65', '다시 오고 싶어요.', '', 3.4, '2022-11-17 00:00:00'),
	('REVIEW00009', '샤르망모텔', 'ROOM174', 'host01', 'user102', '시설이 너무 낡았어요.', '', 3, '2022-11-16 00:00:00'),
	('REVIEW00010', '샤르망모텔', 'ROOM174', 'host01', 'user99', '음식 맛있고 경치 좋고 그래요', '', 5, '2022-11-15 00:00:00'),
	('REVIEW00011', '경남민박', 'ROOM154', 'host01', 'user54', '정말 재밌게 잘 놀다 갑니다 ^^', '', 4.5, '2022-11-15 00:00:00'),
	('REVIEW00012', '경남민박', 'ROOM154', 'host01', 'user46', '벌레가 나왔어요. 음식은 맛있었어요.', '', 3, '2022-11-14 00:00:00'),
	('REVIEW00013', '로얄모텔', 'ROOM172', 'host23', 'user02', '좋았어요 재 방문 의사 있습니다', 'MotelMain3.jpg', 4, '2022-11-13 00:00:00'),
	('REVIEW00014', '일로와모텔', 'ROOM175', 'host01', 'user60', '다신 오고 싶지 않아요.. 시설이 정말.', 'MotelMain6.jpg', 2, '2022-11-13 00:00:00'),
	('REVIEW00015', '경남민박', 'ROOM154', 'host01', 'user35', '최악의 숙소를 발견해버렸죠', 'MinbakMain3.jpg', 3, '2022-11-13 00:00:00'),
	('REVIEW00016', '하이펜션', 'ROOM165', 'host16', 'user07', '너무 좋았어요!', 'pensionMain6.jpg', 4, '2022-11-12 00:00:00'),
	('REVIEW00017', '강근처펜션', 'ROOM168', 'host19', 'user05', '시설이 별로.. 주인은 친절..', 'pensionMain9.jpg', 3.4, '2022-11-12 00:00:00'),
	('REVIEW00018', '샤르망모텔', 'ROOM174', 'host01', 'user93', '주인분 너무 좋았어요. 친절 그 자체', '', 4, '2022-11-12 00:00:00'),
	('REVIEW00019', '경남민박', 'ROOM154', 'host01', 'user09', '만족스러웠어요', '', 5, '2022-11-12 00:00:00'),
	('REVIEW00020', '경남민박', 'ROOM154', 'host01', 'user19', '인생의 전부를 올인했어요', '', 3.5, '2022-11-12 00:00:00'),
	('REVIEW00021', '경남민박', 'ROOM154', 'host01', 'user88', '경치 좋아요. 놀기 좋아요.', '', 3.5, '2022-11-12 00:00:00'),
	('REVIEW00022', '경남민박', 'ROOM154', 'host01', 'user124', '재밌는 여행이었습니다', '', 5, '2022-11-12 00:00:00'),
	('REVIEW00023', '강원민박', 'ROOM153', 'host01', 'user55', '강추합니다', '', 4.5, '2022-11-12 00:00:00'),
	('REVIEW00024', '강원민박', 'ROOM153', 'host01', 'user96', '잘 쉬다 갑니다.', '', 4.5, '2022-11-12 00:00:00'),
	('REVIEW00025', '강원민박', 'ROOM153', 'host01', 'user106', '사장님 친절히 챙겨주셔서 감사해요.', 'MinbakMain2.jpg', 3.5, '2022-11-12 00:00:00'),
	('REVIEW00026', '경남민박', 'ROOM154', 'host01', 'user03', '재 방문 의사 있습니다. 서비스 좋아요. 경치 시설 좋아요', '', 5, '2022-11-11 00:00:00'),
	('REVIEW00027', '강원민박', 'ROOM153', 'host01', 'user04', '시설이 만족스러웠어요…. 주인분은 조금 불친절', '', 3.5, '2022-11-11 00:00:00'),
	('REVIEW00028', '가평펜션', 'ROOM163', 'host14', 'user06', '시설, 경치 뭐 하나 빠지는게 없네요. 좋았습니당.', 'pensionMain4.jpg', 4.5, '2022-11-11 00:00:00'),
	('REVIEW00029', '샤르망모텔', 'ROOM174', 'host01', 'user109', '부모님 모시고 갔는데 대 만족', '', 3.4, '2022-11-05 00:00:00'),
	('REVIEW00030', '경남민박', 'ROOM154', 'host01', 'user64', '벌레가 나왔지만 나쁘지 안항ㅆ어요.', '', 4, '2022-11-05 00:00:00'),
	('REVIEW00031', '경남민박', 'ROOM154', 'host01', 'user105', '음식이 아주 맛있더라고요. ', '', 5, '2022-11-05 00:00:00'),
	('REVIEW00032', '강원민박', 'ROOM153', 'host01', 'user10', '근처 야경이 너무 좋고 눈호강 했어요~~', '', 4, '2022-11-05 00:00:00'),
	('REVIEW00033', '강원민박', 'ROOM153', 'host01', 'user28', '시설이 너무 나빴어요', '', 1, '2022-11-05 00:00:00'),
	('REVIEW00034', '강원민박', 'ROOM153', 'host01', 'user73', '재 방문 의사 있습니다.', '', 4.5, '2022-11-05 00:00:00'),
	('REVIEW00035', '민박전문', 'ROOM152', 'host01', 'user103', '경치 하나는 끝내주더라고여', 'MinbakMain1.jpg', 4.5, '2022-11-04 00:00:00'),
	('REVIEW00036', '경남민박', 'ROOM154', 'host01', 'user72', '주인아저씨.. 음식이 맛있어요', '', 4, '2022-11-04 00:00:00'),
	('REVIEW00037', '경남민박', 'ROOM154', 'host01', 'user112', '좋은 추억 남기고 갑니다.', '', 4.5, '2022-11-04 00:00:00'),
	('REVIEW00038', '강원민박', 'ROOM153', 'host01', 'user20', '놀거리가 너무 많아서 좋았어요', '', 4, '2022-11-04 00:00:00'),
	('REVIEW00039', '강원민박', 'ROOM153', 'host01', 'user36', '시설이 너무 더럽고 낡았어요', '', 1, '2022-11-04 00:00:00'),
	('REVIEW00040', '강원민박', 'ROOM153', 'host01', 'user81', '조식이 맛있네여', '', 3.5, '2022-11-04 00:00:00'),
	('REVIEW00041', '경남민박', 'ROOM154', 'host01', 'user03', '좋은 추억 만들어 주셔서 감사합니다.', '', 3.5, '2022-11-02 00:00:00'),
	('REVIEW00042', '경남민박', 'ROOM154', 'host01', 'user80', '시설 is good', '', 5, '2022-11-02 00:00:00'),
	('REVIEW00043', '경남민박', 'ROOM154', 'host01', 'user118', '뭐 soso.. 그냥 그랬어요.', 'MinbakMain3.jpg', 2, '2022-11-02 00:00:00'),
	('REVIEW00044', '강원민박', 'ROOM153', 'host01', 'user47', '사장님이 너무 까칠했어요 비추합니다 -_-', '', 2.5, '2022-11-02 00:00:00'),
	('REVIEW00045', '강원민박', 'ROOM153', 'host01', 'user89', '벌레 많았던 것 빼곤.. 시설 좋았고 경치 좋았고 음식 맛있어서 좋았습니다.', '', 3.5, '2022-11-02 00:00:00');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;

-- 테이블 samp.review_seq 구조 내보내기
DROP TABLE IF EXISTS `review_seq`;
CREATE TABLE IF NOT EXISTS `review_seq` (
  `REVIEW_ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`REVIEW_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.review_seq:~44 rows (대략적) 내보내기
DELETE FROM `review_seq`;
/*!40000 ALTER TABLE `review_seq` DISABLE KEYS */;
INSERT INTO `review_seq` (`REVIEW_ID`) VALUES
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
	(27),
	(28),
	(29),
	(30),
	(31),
	(32),
	(33),
	(34),
	(35),
	(36),
	(37),
	(38),
	(39),
	(40),
	(41),
	(42),
	(43),
	(44),
	(45);
/*!40000 ALTER TABLE `review_seq` ENABLE KEYS */;

-- 테이블 samp.room 구조 내보내기
DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `ROOM_NAME` varchar(100) DEFAULT NULL,
  `ROOM_ADDR` varchar(500) DEFAULT NULL,
  `ROOM_ADDR_DETAIL` varchar(500) DEFAULT NULL,
  `ROOM_AREA` varchar(100) DEFAULT NULL,
  `ROOM_DESC` varchar(1000) DEFAULT NULL,
  `ROOM_ID` varchar(20) NOT NULL DEFAULT '0',
  `HOST_ID` varchar(50) DEFAULT NULL,
  `ROOM_PRICE` varchar(30) DEFAULT NULL,
  `ROOM_IMG_NO1` varchar(300) DEFAULT NULL,
  `ROOM_IMG_NO2` varchar(300) DEFAULT NULL,
  `ROOM_IMG_NO3` varchar(300) DEFAULT NULL,
  `ROOM_IMG_NO4` varchar(300) DEFAULT NULL,
  `ROOM_IMG_NO5` varchar(300) DEFAULT NULL,
  `ROOM_POINTS` varchar(100) DEFAULT NULL,
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
DELETE FROM `room`;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` (`ROOM_NAME`, `ROOM_ADDR`, `ROOM_ADDR_DETAIL`, `ROOM_AREA`, `ROOM_DESC`, `ROOM_ID`, `HOST_ID`, `ROOM_PRICE`, `ROOM_IMG_NO1`, `ROOM_IMG_NO2`, `ROOM_IMG_NO3`, `ROOM_IMG_NO4`, `ROOM_IMG_NO5`, `ROOM_POINTS`, `ROOM_MAX`, `ROOM_THEME`, `ROOM_CAT`, `ROOM_WIFI`, `ROOM_PET`, `ROOM_MEAL`, `ROOM_PARKING`, `ROOM_SWPOOL`, `ROOM_LIKES`, `ROOM_STARS`) VALUES
	('민박전문', '경기 안양시 만안구 안양천서로177', '래미안 101동 102호', '경기', '친절히 모시겠습니다.', 'ROOM001', 'host01', '75000', 'MinbakMain1.jpg', 'MinbakSub1.jpg', NULL, NULL, NULL, NULL, 4, 'city', 'minbak', NULL, 'Y', 'Y', 'Y', NULL, '42', '4'),
	('강원민박', '강원 홍천군 서면 한치골길 262', '1104-4', '강원', '정성을 다하겠읍니다.', 'ROOM002', 'host01', '80000', 'MinbakMain2.jpg', 'MinbakSub2.jpg', 'MinbakSub7.jpg', 'MinbakSub8.jpg', NULL, NULL, 4, 'mountain,forest,river', 'minbak', NULL, 'Y', 'Y', 'Y', NULL, '33', '4.5'),
	('경남민박', '경남 김해시 인제로 197', '1층', '경남', '많이 찾아주시는 현지의 명소', 'ROOM003', 'host01', '64000', 'MinbakMain3.jpg', 'MinbakSub3.jpg', 'MinbakSub2.jpg', 'MinbakSub9.jpg', 'MinbakSub10.jpg', NULL, 4, 'sea', 'minbak', NULL, 'Y', 'Y', NULL, NULL, '4', '3'),
	('동해민박', '부산 해운대구 송정해변로 12-8', '508-3', '부산', '밥이 맛있는 곳', 'ROOM004', 'host01', '78000', 'MinbakMain4.jpg', 'MinbakSub4.jpg', 'MinbakSub5.jpg', NULL, NULL, NULL, 4, 'sea,river', 'minbak', NULL, 'Y', NULL, 'Y', NULL, '3', '3'),
	('안양민박', '경기 안양시 만안구 삼막로96번길 110', '타워 7층', '안양', '경치가 끝내줘요', 'ROOM005', 'host01', '80000', 'MinbakMain5.jpg', 'MinbakSub5.jpg', NULL, NULL, NULL, NULL, 4, 'city', 'minbak', NULL, 'Y', 'Y', 'Y', NULL, '7', '4.5'),
	('창원민박', '강원 동해시 임항로 99', '유원지길 45', '강원', '30년 전통의 민박집입니다.', 'ROOM006', 'host06', '45000', 'MinbakMain6.jpg', 'MinbakSub6.jpg', 'MinbakSub2.jpg', 'MinbakSub11.jpg', 'MinbakSub12.jpg', NULL, 3, 'sea,forest,river', 'minbak', NULL, NULL, NULL, NULL, 'Y', '66', '4.5'),
	('마산민박', '경남 남해군 삼동면 양화금로 329-31', '314-84번지', '경남', '남해에서 둘째 가라면 서러워요.', 'ROOM007', 'host07', '90000', 'MinbakMain7.jpg', 'MinbakSub7.jpg', NULL, NULL, NULL, NULL, 3, 'sea', 'minbak', 'Y', 'Y', 'Y', NULL, 'Y', '54', '3'),
	('진해민박', '경남 창원시 마산합포구 구산면 해양관광로 1307-111', '활초리 4-21', '경남', '친절과 정성을 다하겠습니다.', 'ROOM008', 'host08', '60000', 'MinbakMain8.jpg', 'MinbakSub8.jpg', NULL, 'MinbakSub11.jpg', 'MinbakMain9.jpg', NULL, 4, 'sea,valley', 'minbak', 'Y', 'Y', 'Y', NULL, 'Y', '22', '2.5'),
	('일등펜션', '경남 창원시 마산합포구 구산면 괭이바다길 231-3', '19-2번지', '경남', '안녕하세요? 마산민박입니다.', 'ROOM009', 'host09', '110000', 'pensionMain1.jpg', 'pensionSub1.jpg', 'pensionSub6.jpg', 'pensionSub7.jpg', NULL, NULL, 3, 'sea', 'pension', NULL, 'Y', 'Y', NULL, NULL, '13', '2'),
	('강남펜션', '경남 창원시 진해구 명제로 324-5', '480번지', '경남', '예약제로 운영됩니다. 전화를 먼저 주세요.', 'ROOM010', 'host10', '96000', 'pensionMain2.jpg', 'pensionSub2.jpg', 'pensionSub8.jpg', 'pensionSub9.jpg', 'pensionSub10.jpg', NULL, 4, 'sea,valley', 'pension', NULL, 'Y', NULL, NULL, 'Y', '8', '4'),
	('펜션지기', '경북 울릉군 울릉읍 울릉순환로 678', '1층', '경북', '제목 그대로 일등 펜션입니다.', 'ROOM011', 'host11', '150000', 'pensionMain3.jpg', NULL, NULL, NULL, NULL, NULL, 4, 'sea,river', 'pension', NULL, NULL, 'Y', NULL, 'Y', '45', '2'),
	('가평펜션', '경기 가평군 설악면 어비산길 154', '독채', '경기', '넓고 쾌적한 시설, 즐거운 추억을 만드세요', 'ROOM012', 'host12', '170000', 'pensionMain4.jpg', NULL, NULL, NULL, NULL, NULL, 4, 'city,valley', 'pension', NULL, 'Y', 'Y', 'Y', NULL, '9', '4.5'),
	('궁평항펜션', '서울 강남구 논현로119길 24', '7층', '서울', '족구장 완비! 단체 환영!!', 'ROOM013', 'host13', '165000', 'pensionMain5.jpg', 'pensionSub3.jpg', 'pensionSub1.jpg', 'pensionSub2.jpg', NULL, NULL, 3, 'city,river', 'pension', 'Y', 'Y', 'Y', 'Y', NULL, '81', '4.5'),
	('하이펜션', '경기 가평군 청평면 호반로 976', '독채', '경기', '근처에 낚시터가 있어 아주 좋습니다.', 'ROOM014', 'host14', '144000', 'pensionMain6.jpg', NULL, NULL, NULL, NULL, NULL, 6, 'mountain,forest,valley,river', 'pension', 'Y', 'Y', 'Y', 'Y', 'Y', '69', '1'),
	('감상펜션', '경기 화성시 서신면 궁평고잔길 99', '1층 101호', '경기', '낚시배 운영합니다.', 'ROOM015', 'host15', '150000', 'pensionMain7.jpg', 'pensionSub4.jpg', 'pensionSub3.jpg', NULL, NULL, NULL, 6, 'mountain,forest,valley', 'pension', NULL, 'Y', 'Y', 'Y', NULL, '7', '0.5'),
	('농촌펜션', '경기 화성시 서신면 궁평고잔길 85-5', '감상펜션', '경기', '방문해주신다면 친절히 모시겠습니다.', 'ROOM016', 'host16', '120000', 'pensionMain8.jpg', NULL, NULL, NULL, NULL, NULL, 6, 'mountain,forest,river', 'pension', 'Y', 'Y', 'Y', NULL, NULL, '1', '5'),
	('강근처펜션', '경기 양평군 용문면 용문산로 213-5', '농촌펜션', '경기', '산 좋고 물 좋은 곳에 위치한 펜션입니다.', 'ROOM017', 'host17', '130000', 'pensionMain9.jpg', 'pensionSub5.jpg', NULL, NULL, NULL, NULL, 8, 'mountain,forest', 'pension', 'Y', NULL, 'Y', 'Y', NULL, '33', '3'),
	('시골펜션', '경북 경주시 문무대왕면 송전기곡길 15-1', '43-9번지', '경북', '강 근처에 있어 놀기 아주 편하답니다.', 'ROOM018', 'host18', '145000', 'pensionMain10.jpg', NULL, NULL, NULL, NULL, NULL, 8, 'mountain', 'pension', 'Y', 'Y', 'Y', 'Y', NULL, '5', '3'),
	('리베라모텔', '강원 철원군 서면 태봉로 465-83', '7번지', '강원', '전 객실 바베큐장 이용이 가능합니다.', 'ROOM019', 'host19', '210000', 'MotelMain1.jpg', 'MotelSub1.jpg', 'MotelSub5.jpg', 'GuestHouseSub1.jpg', 'GuestHouseSub3.jpg', NULL, 2, 'mountain,forest', 'motel', 'Y', 'Y', 'Y', NULL, NULL, '15', '4'),
	('유림모텔', '전남 해남군 계곡면 비슬안길 185', '7-3번지', '전남', '즐겁게 물놀이 할 수 잇는 유아풀을 동반했습니다.', 'ROOM020', 'host20', '230000', 'MotelMain2.jpg', 'MotelSub2.jpg', 'MotelSub3.jpg', 'GuestHouseSub2.jpg', NULL, NULL, 8, 'mountain,forest', 'motel', 'Y', NULL, 'Y', 'Y', NULL, '88', '4'),
	('로얄모텔', '경기 안양시 만안구 안양로268번길 41', '303호', '경기', '자연풍경속 작은 궁전. 천상의 휴식을 준비하는 아담한 모텔', 'ROOM021', 'host21', '80000', 'MotelMain3.jpg', 'MotelSub3.jpg', NULL, NULL, NULL, NULL, 2, 'city,river', 'motel', 'Y', NULL, NULL, 'Y', 'Y', '11', '4'),
	('CNC모텔', '경기 수원시 권선구 구운로85번길 28', 'CNC 모텔', '경기', '몸과 마음을 재충전하는 꽃과 나무들을 선보입니다.', 'ROOM022', 'host22', '120000', 'MotelMain4.jpg', 'MotelSub4.jpg', 'MotelSub2.jpg', 'GuestHouseSub4.jpg', 'GuestHouseSub5.jpg', NULL, 2, 'city,valley,river', 'motel', NULL, 'Y', 'Y', 'Y', NULL, '24', '4'),
	('샤르망모텔', '경기 수원시 권선구 서부로1934번길 2', '샤르망 모텔', '경기', '신축건물로 전 객식 복층형 단체 모텔입니다.', 'ROOM023', 'host23', '200000', 'MotelMain5.jpg', 'MotelSub5.jpg', 'MotelSub9.jpg', 'GuestHouseSub6.jpg', NULL, NULL, 3, 'city', 'motel', 'Y', 'Y', NULL, 'Y', 'Y', '64', '3'),
	('일로와모텔', '경기 광주시 경안로 18', '4-33번지', '경기', '고급스러운 방갈로 형태의 독채하우스', 'ROOM024', 'host24', '84000', 'MotelMain6.jpg', 'MotelSub6.jpg', NULL, NULL, NULL, NULL, 4, 'city,valley,river', 'motel', 'Y', 'Y', 'Y', 'Y', 'Y', '32', '2.5'),
	('SS모텔', '경기 광주시 광주대로 133', '2층 202호', '경기', '가족, 연인, 친구, 동료와 추억을 만드는 공간입니다.', 'ROOM025', 'host25', '66000', 'MotelMain7.jpg', 'MotelSub7.jpg', 'MotelSub10.jpg', 'GuestHouseSub7.jpg', NULL, NULL, 2, 'city', 'motel', 'Y', 'Y', 'Y', NULL, 'Y', '221', '1.5'),
	('칸타빌모텔', '전북 군산시 소룡1길 5', '칸타빌', '전북', '아름다운 편백숲속에서 천천히 걷기 늦은밤 마음을 열어주는 하늘 별 빛.', 'ROOM026', 'host26', '59000', 'MotelMain8.jpg', 'MotelSub8.jpg', NULL, NULL, NULL, NULL, 4, 'mountain', 'motel', NULL, 'Y', 'Y', 'Y', NULL, '4', '3.5'),
	('모텔꿈꾸다', '전북 남원시 소리길 120', '꿈꾸다', '전북', '전객실 제트스파, 호텔급', 'ROOM027', 'host27', '89000', 'MotelMain9.jpg', 'MotelSub9.jpg', 'MotelSub4.jpg', 'GuestHouseSub8.jpg', NULL, NULL, 2, 'mountain,river', 'motel', 'Y', 'Y', 'Y', 'Y', NULL, '57', '0');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;

-- 테이블 samp.room_seq 구조 내보내기
DROP TABLE IF EXISTS `room_seq`;
CREATE TABLE IF NOT EXISTS `room_seq` (
  `ROOM_ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ROOM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.room_seq:~25 rows (대략적) 내보내기
DELETE FROM `room_seq`;
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
DROP TABLE IF EXISTS `user`;
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
  `user_type` varchar(50) NOT NULL DEFAULT 'own',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 samp.user:~157 rows (대략적) 내보내기
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `user_password`, `user_name`, `user_birth`, `user_gender`, `user_email`, `user_phone`, `user_address1`, `user_address2`, `user_status`, `user_type`) VALUES
	('user01', '1111', '이상호', '1952-03-03', 'f', 'sanghoho@triponplan.ga', '01012341234', '안양시 만안구 양화로36번길 32', '뉴베스트빌 101동 102호', '0', 'own'),
	('user02', '1111', '권나봄', '1999-07-13', 'm', 'sim0303@triponplan.ga', '01023456789', '경남 창원시 마산합포구 구산면 괭이바다길 231-3', '101동 301호', '0', 'own'),
	('user03', '1111', '송아리', '1975-04-30', 'm', 'kwangil2@triponplan.ga', '01034567890', '경남 창원시 진해구 명제로 324-5', '202동 303호', '0', 'own'),
	('user04', '1111', '배구슬', '1965-08-27', 'f', 'namso123@triponplan.ga', '01056789012', '경북 울릉군 울릉읍 울릉순환로 678', '1004동 1001호', '0', 'own'),
	('user05', '1111', '이나리', '1993-11-12', 'f', 'pyojong@triponplan.ga', '01067890123', '경남 창원시 진해구 명제로 324-5', '102동 202호', '0', 'own'),
	('user06', '1111', '장새롬', '1987-10-14', 'f', 'ryu1993@triponplan.ga', '01078901234', '경북 울릉군 울릉읍 울릉순환로 678', '503동 604호', '0', 'own'),
	('user07', '1111', '박하늘', '1966-04-22', 'f', 'jungjong@triponplan.ga', '01089012345', '서울 강남구 선릉로 524', '3동 609호', '0', 'own'),
	('user08', '1111', '김슬기', '1984-12-24', 'm', 'Yeon-jae@triponplan.ga', '01090123456', '서울 강남구 논현로119길 24', '124-50호', '0', 'own'),
	('user09', '1111', '류새벽', '1983-03-13', 'm', 'oshee0313@triponplan.ga', '01023456789', '경기 화성시 서신면 궁평고잔길 85-5', '101동 301호', '0', 'own'),
	('user10', '1111', '한으뜸', '1989-05-04', 'm', 'wonchul@triponplan.ga', '01034567890', '경남 창원시 진해구 명제로 324-5', '202동 303호', '0', 'own'),
	('user100', '1111', '양한결', '1971-11-23', 'f', 'jangsae@triponplan.ga', '01067890123', '서울 강남구 논현로119길 24', '503동 604호', '0', 'own'),
	('user101', '1111', '권나봄', '1969-08-15', 'f', 'skypark@triponplan.ga', '01078901234', '서울 강남구 선릉로 524', '3동 609호', '0', 'own'),
	('user102', '1111', '송아리', '1995-03-25', 'm', 'seulgikim@triponplan.ga', '01089012345', '서울 강남구 논현로119길 24', '1004동 1001호', '0', 'own'),
	('user103', '1111', '배구슬', '1975-04-30', 'm', 'kwangil2@triponplan.ga', '01090123456', '경기 화성시 서신면 궁평고잔길 85-5', '102동 202호', '0', 'own'),
	('user104', '1111', '이나리', '1965-08-27', 'f', 'namso123@triponplan.ga', '01023456789', '경남 창원시 진해구 명제로 324-5', '503동 604호', '0', 'own'),
	('user105', '1111', '장새롬', '1993-11-12', 'f', 'pyojong@triponplan.ga', '01034567890', '경북 울릉군 울릉읍 울릉순환로 678', '3동 609호', '0', 'own'),
	('user106', '1111', '박하늘', '1987-10-14', 'f', 'ryu1993@triponplan.ga', '01056789012', '강원 철원군 서면 태봉로 465-83 ', '124-50호', '0', 'own'),
	('user107', '1111', '김슬기', '1966-04-22', 'f', 'jungjong@triponplan.ga', '01034567890', '전남 해남군 계곡면 비슬안길 185', '101동 301호', '0', 'own'),
	('user108', '1111', '류새벽', '1984-12-24', 'm', 'Yeon-jae@triponplan.ga', '01056789012', '경기 안양시 만안구 안양로268번길 41', '202동 303호', '0', 'own'),
	('user109', '1111', '한으뜸', '1983-03-13', 'm', 'oshee0313@triponplan.ga', '01067890123', '경기 수원시 권선구 구운로85번길 28', '1004동 1001호', '0', 'own'),
	('user11', '1111', '백힘찬', '1970-10-02', 'f', 'youminah@triponplan.ga', '01056789012', '경북 울릉군 울릉읍 울릉순환로 678', '1004동 1001호', '0', 'own'),
	('user110', '1111', '백힘찬', '1989-05-04', 'm', 'wonchul@triponplan.ga', '01078901234', '경기 수원시 권선구 서부로1934번길 2', '303호', '0', 'own'),
	('user111', '1111', '양한결', '1970-10-02', 'f', 'youminah@triponplan.ga', '01089012345', '경기 광주시 경안로 18', '101호', '0', 'own'),
	('user112', '1111', '권나봄', '1971-11-23', 'f', 'songsea@triponplan.ga', '01090123456', '경기 광주시 광주대로 133', '202동 303호', '0', 'own'),
	('user113', '1111', '송아리', '1969-08-15', 'm', 'newroom@triponplan.ga', '01023456789', '경북 울릉군 울릉읍 울릉순환로 678', '1004동 1001호', '0', 'own'),
	('user114', '1111', '배구슬', '1995-03-25', 'f', 'leenabom@triponplan.ga', '01034567890', '경북 울릉군 울릉읍 울릉순환로 678', '503동 604호', '0', 'own'),
	('user115', '1111', '이나리', '1987-04-09', 'f', 'joenkang@triponplan.ga', '01056789012', '서울 강남구 선릉로 524', '3동 609호', '0', 'own'),
	('user116', '1111', '장새롬', '1968-05-18', 'f', 'simdanbi@triponplan.ga', '01067890123', '서울 강남구 논현로119길 24', '124-50호', '0', 'own'),
	('user117', '1111', '박하늘', '1980-05-23', 'f', 'iknownam@triponplan.ga', '01067890123', '서울 강남구 선릉로 524', '101동 301호', '0', 'own'),
	('user118', '1111', '김슬기', '1973-10-19', 'f', 'aramkim@triponplan.ga', '01078901234', '서울 강남구 논현로119길 24', '202동 303호', '0', 'own'),
	('user119', '1111', '류새벽', '1966-11-03', 'f', 'moonbo@triponplan.ga', '01089012345', '경기 화성시 서신면 궁평고잔길 85-5', '1004동 1001호', '0', 'own'),
	('user12', '1111', '양한결', '1971-11-23', 'f', 'songsea@triponplan.ga', '01067890123', '서울 강남구 선릉로 524', '102동 202호', '0', 'own'),
	('user120', '1111', '한으뜸', '1966-04-22', 'f', 'saerone@triponplan.ga', '01090123456', '경남 창원시 진해구 명제로 324-5', '303호', '0', 'own'),
	('user121', '1111', '백힘찬', '1984-12-24', 'm', 'youseeme@triponplan.ga', '01023456789', '경북 울릉군 울릉읍 울릉순환로 678', '101호', '0', 'own'),
	('user122', '1111', '양한결', '1983-03-13', 'm', 'songari@triponplan.ga', '01034567890', '강원 철원군 서면 태봉로 465-83 ', '202동 303호', '0', 'own'),
	('user123', '1111', '권나봄', '1989-05-04', 'm', 'shipmarble@triponplan.ga', '01056789012', '전남 해남군 계곡면 비슬안길 185', '101동 301호', '0', 'own'),
	('user124', '1111', '송아리', '1970-10-02', 'm', 'standup@triponplan.ga', '01067890123', '경기 안양시 만안구 안양로268번길 41', '202동 303호', '0', 'own'),
	('user125', '1111', '배구슬', '1971-11-23', 'f', 'jangsae@triponplan.ga', '01078901234', '경북 울릉군 울릉읍 울릉순환로 678', '503동 604호', '0', 'own'),
	('user126', '1111', '이나리', '1969-08-15', 'f', 'skypark@triponplan.ga', '01089012345', '서울 강남구 선릉로 524', '3동 609호', '0', 'own'),
	('user127', '1111', '장새롬', '1995-03-25', 'm', 'seulgikim@triponplan.ga', '01090123456', '서울 강남구 논현로119길 24', '124-50호', '0', 'own'),
	('user128', '1111', '박하늘', '1975-04-30', 'm', 'kwangil2@triponplan.ga', '01023456789', '경기 화성시 서신면 궁평고잔길 85-5', '101동 301호', '0', 'own'),
	('user129', '1111', '김슬기', '1965-08-27', 'f', 'namso123@triponplan.ga', '01034567890', '경남 창원시 진해구 명제로 324-5', '202동 303호', '0', 'own'),
	('user13', '1111', '권나봄', '1969-08-15', 'm', 'newroom@triponplan.ga', '01078901234', '서울 강남구 논현로119길 24', '503동 604호', '0', 'own'),
	('user130', '1111', '류새벽', '1993-11-12', 'f', 'pyojong@triponplan.ga', '01023456789', '경북 울릉군 울릉읍 울릉순환로 678', '1004동 1001호', '0', 'own'),
	('user131', '1111', '한으뜸', '1987-10-14', 'f', 'ryu1993@triponplan.ga', '01034567890', '서울 강남구 선릉로 524', '102동 202호', '0', 'own'),
	('user132', '1111', '백힘찬', '1966-04-22', 'f', 'jungjong@triponplan.ga', '01056789012', '서울 강남구 논현로119길 24', '503동 604호', '0', 'own'),
	('user133', '1111', '양한결', '1984-12-24', 'm', 'Yeon-jae@triponplan.ga', '01067890123', '서울 강남구 선릉로 524', '3동 609호', '0', 'own'),
	('user134', '1111', '권나봄', '1983-03-13', 'm', 'oshee0313@triponplan.ga', '01078901234', '서울 강남구 논현로119길 24', '1004동 1001호', '0', 'own'),
	('user135', '1111', '송아리', '1989-05-04', 'm', 'wonchul@triponplan.ga', '01067890123', '경기 화성시 서신면 궁평고잔길 85-5', '102동 202호', '0', 'own'),
	('user136', '1111', '배구슬', '1970-10-02', 'f', 'youminah@triponplan.ga', '01078901234', '경남 창원시 진해구 명제로 324-5', '503동 604호', '0', 'own'),
	('user137', '1111', '이나리', '1971-11-23', 'f', 'songsea@triponplan.ga', '01089012345', '경북 울릉군 울릉읍 울릉순환로 678', '3동 609호', '0', 'own'),
	('user138', '1111', '장새롬', '1969-08-15', 'm', 'newroom@triponplan.ga', '01090123456', '강원 철원군 서면 태봉로 465-83 ', '124-50호', '0', 'own'),
	('user139', '1111', '박하늘', '1995-03-25', 'f', 'leenabom@triponplan.ga', '01023456789', '전남 해남군 계곡면 비슬안길 185', '101동 301호', '0', 'own'),
	('user14', '1111', '송아리', '1995-03-25', 'f', 'leenabom@triponplan.ga', '01089012345', '서울 강남구 선릉로 524', '3동 609호', '0', 'own'),
	('user140', '1111', '김슬기', '1987-04-09', 'f', 'joenkang@triponplan.ga', '01034567890', '경기 안양시 만안구 안양로268번길 41', '202동 303호', '0', 'own'),
	('user141', '1111', '류새벽', '1968-05-18', 'f', 'simdanbi@triponplan.ga', '01056789012', '경기 수원시 권선구 구운로85번길 28', '1004동 1001호', '0', 'own'),
	('user142', '1111', '한으뜸', '1980-05-23', 'f', 'iknownam@triponplan.ga', '01067890123', '경기 수원시 권선구 서부로1934번길 2', '303호', '0', 'own'),
	('user143', '1111', '백힘찬', '1973-10-19', 'f', 'aramkim@triponplan.ga', '01078901234', '경기 광주시 경안로 18', '101호', '0', 'own'),
	('user144', '1111', '양한결', '1966-11-03', 'f', 'moonbo@triponplan.ga', '01089012345', '경기 광주시 광주대로 133', '202동 303호', '0', 'own'),
	('user145', '1111', '권나봄', '1966-04-22', 'f', 'saerone@triponplan.ga', '01090123456', '경북 울릉군 울릉읍 울릉순환로 678', '1004동 1001호', '0', 'own'),
	('user146', '1111', '송아리', '1984-12-24', 'm', 'youseeme@triponplan.ga', '01023456789', '경기 안양시 만안구 안양로268번길 41', '202동 303호', '0', 'own'),
	('user147', '1111', '배구슬', '1983-03-13', 'm', 'songari@triponplan.ga', '01034567890', '경기 수원시 권선구 구운로85번길 28', '1004동 1001호', '0', 'own'),
	('user148', '1111', '이나리', '1989-05-04', 'm', 'shipmarble@triponplan.ga', '01056789012', '경기 수원시 권선구 서부로1934번길 2', '303호', '0', 'own'),
	('user149', '1111', '장새롬', '1970-10-02', 'm', 'standup@triponplan.ga', '01067890123', '강원 철원군 서면 태봉로 465-83 ', '124-50호', '0', 'own'),
	('user15', '1111', '배구슬', '1987-04-09', 'f', 'joenkang@triponplan.ga', '01090123456', '서울 강남구 논현로119길 24', '1004동 1001호', '0', 'own'),
	('user150', '1111', '박하늘', '1971-11-23', 'f', 'jangsae@triponplan.ga', '01067890123', '경기 광주시 경안로 18', '101호', '0', 'own'),
	('user16', '1111', '이나리', '1968-05-18', 'f', 'simdanbi@triponplan.ga', '01023456789', '경기 화성시 서신면 궁평고잔길 85-5', '102동 202호', '0', 'own'),
	('user17', '1111', '장새롬', '1980-05-23', 'f', 'iknownam@triponplan.ga', '01034567890', '경남 창원시 진해구 명제로 324-5', '503동 604호', '0', 'own'),
	('user18', '1111', '박하늘', '1973-10-19', 'f', 'aramkim@triponplan.ga', '01056789012', '경북 울릉군 울릉읍 울릉순환로 678', '3동 609호', '0', 'own'),
	('user19', '1111', '김슬기', '1966-11-03', 'f', 'moonbo@triponplan.ga', '01067890123', '강원 철원군 서면 태봉로 465-83 ', '124-50호', '0', 'own'),
	('user20', '1111', '류새벽', '1966-04-22', 'f', 'saerone@triponplan.ga', '01067890123', '전남 해남군 계곡면 비슬안길 185', '101동 301호', '0', 'own'),
	('user21', '1111', '한으뜸', '1984-12-24', 'm', 'youseeme@triponplan.ga', '01078901234', '경기 안양시 만안구 안양로268번길 41', '202동 303호', '0', 'own'),
	('user22', '1111', '백힘찬', '1983-03-13', 'm', 'songari@triponplan.ga', '01089012345', '경기 수원시 권선구 구운로85번길 28', '1004동 1001호', '0', 'own'),
	('user222', '$2a$10$Klp2gYu.sQ3kA20nMq.XlOYqa0YKAmR8rFe.9jwV4ySjA3ATgxggO', '김아무개', '1993-02-12', 'm', 'yssh123@naver.com', '010-4104-7641', '경기 광명시 일직동 504-5', '401호', '0', 'own'),
	('user23', '1111', '양한결', '1989-05-04', 'm', 'shipmarble@triponplan.ga', '01090123456', '경기 수원시 권선구 서부로1934번길 2', '303호', '0', 'own'),
	('user24', '1111', '권나봄', '1970-10-02', 'm', 'standup@triponplan.ga', '01023456789', '경기 광주시 경안로 18', '101호', '0', 'own'),
	('user25', '1111', '송아리', '1971-11-23', 'f', 'jangsae@triponplan.ga', '01034567890', '경기 광주시 광주대로 133', '202동 303호', '0', 'own'),
	('user26', '1111', '배구슬', '1969-08-15', 'f', 'skypark@triponplan.ga', '01056789012', '경북 울릉군 울릉읍 울릉순환로 678', '1004동 1001호', '0', 'own'),
	('user27', '1111', '이나리', '1995-03-25', 'm', 'seulgikim@triponplan.ga', '01067890123', '서울 강남구 선릉로 524', '102동 202호', '0', 'own'),
	('user28', '1111', '장새롬', '1975-04-30', 'm', 'kwangil2@triponplan.ga', '01078901234', '서울 강남구 논현로119길 24', '503동 604호', '0', 'own'),
	('user29', '1111', '박하늘', '1965-08-27', 'f', 'namso123@triponplan.ga', '01089012345', '경기 화성시 서신면 궁평고잔길 85-5', '3동 609호', '0', 'own'),
	('user30', '1111', '김슬기', '1993-11-12', 'f', 'pyojong@triponplan.ga', '01090123456', '경남 창원시 진해구 명제로 324-5', '1004동 1001호', '0', 'own'),
	('user31', '1111', '류새벽', '1987-10-14', 'f', 'ryu1993@triponplan.ga', '01023456789', '경북 울릉군 울릉읍 울릉순환로 678', '503동 604호', '0', 'own'),
	('user32', '1111', '한으뜸', '1966-04-22', 'f', 'jungjong@triponplan.ga', '01034567890', '서울 강남구 선릉로 524', '3동 609호', '0', 'own'),
	('user33', '1111', '백힘찬', '1984-12-24', 'm', 'Yeon-jae@triponplan.ga', '01023456789', '서울 강남구 논현로119길 24', '124-50호', '0', 'own'),
	('user34', '1111', '양한결', '1983-03-13', 'm', 'oshee0313@triponplan.ga', '01034567890', '서울 강남구 선릉로 524', '101동 301호', '0', 'own'),
	('user35', '1111', '권나봄', '1989-05-04', 'm', 'wonchul@triponplan.ga', '01056789012', '서울 강남구 논현로119길 24', '202동 303호', '0', 'own'),
	('user36', '1111', '송아리', '1970-10-02', 'f', 'youminah@triponplan.ga', '01067890123', '경기 화성시 서신면 궁평고잔길 85-5', '1004동 1001호', '0', 'own'),
	('user37', '1111', '배구슬', '1971-11-23', 'f', 'songsea@triponplan.ga', '01078901234', '경남 창원시 진해구 명제로 324-5', '303호', '0', 'own'),
	('user38', '1111', '이나리', '1969-08-15', 'm', 'newroom@triponplan.ga', '01067890123', '경북 울릉군 울릉읍 울릉순환로 678', '101호', '0', 'own'),
	('user39', '1111', '장새롬', '1995-03-25', 'f', 'leenabom@triponplan.ga', '01078901234', '강원 철원군 서면 태봉로 465-83 ', '202동 303호', '0', 'own'),
	('user40', '1111', '박하늘', '1987-04-09', 'f', 'joenkang@triponplan.ga', '01089012345', '전남 해남군 계곡면 비슬안길 185', '101동 301호', '0', 'own'),
	('user41', '1111', '김슬기', '1968-05-18', 'f', 'simdanbi@triponplan.ga', '01090123456', '경기 안양시 만안구 안양로268번길 41', '202동 303호', '0', 'own'),
	('user42', '1111', '류새벽', '1980-05-23', 'f', 'iknownam@triponplan.ga', '01023456789', '경북 울릉군 울릉읍 울릉순환로 678', '503동 604호', '0', 'own'),
	('user43', '1111', '한으뜸', '1973-10-19', 'f', 'aramkim@triponplan.ga', '01034567890', '서울 강남구 선릉로 524', '3동 609호', '0', 'own'),
	('user44', '1111', '백힘찬', '1966-11-03', 'f', 'moonbo@triponplan.ga', '01056789012', '서울 강남구 논현로119길 24', '124-50호', '0', 'own'),
	('user45', '1111', '양한결', '1966-04-22', 'f', 'saerone@triponplan.ga', '01067890123', '경기 화성시 서신면 궁평고잔길 85-5', '101동 301호', '0', 'own'),
	('user46', '1111', '권나봄', '1984-12-24', 'm', 'youseeme@triponplan.ga', '01078901234', '경남 창원시 진해구 명제로 324-5', '202동 303호', '0', 'own'),
	('user47', '1111', '송아리', '1983-03-13', 'm', 'songari@triponplan.ga', '01089012345', '경북 울릉군 울릉읍 울릉순환로 678', '1004동 1001호', '0', 'own'),
	('user48', '1111', '배구슬', '1989-05-04', 'm', 'shipmarble@triponplan.ga', '01090123456', '서울 강남구 선릉로 524', '102동 202호', '0', 'own'),
	('user49', '1111', '이나리', '1970-10-02', 'm', 'standup@triponplan.ga', '01023456789', '서울 강남구 논현로119길 24', '503동 604호', '0', 'own'),
	('user50', '1111', '장새롬', '1971-11-23', 'f', 'jangsae@triponplan.ga', '01034567890', '서울 강남구 선릉로 524', '3동 609호', '0', 'own'),
	('user51', '1111', '박하늘', '1969-08-15', 'f', 'skypark@triponplan.ga', '01056789012', '서울 강남구 논현로119길 24', '1004동 1001호', '0', 'own'),
	('user52', '1111', '김슬기', '1995-03-25', 'm', 'seulgikim@triponplan.ga', '01067890123', '경기 화성시 서신면 궁평고잔길 85-5', '102동 202호', '0', 'own'),
	('user53', '1111', '류새벽', '1975-04-30', 'm', 'kwangil2@triponplan.ga', '01067890123', '경남 창원시 진해구 명제로 324-5', '503동 604호', '0', 'own'),
	('user54', '1111', '한으뜸', '1965-08-27', 'f', 'namso123@triponplan.ga', '01078901234', '경북 울릉군 울릉읍 울릉순환로 678', '3동 609호', '0', 'own'),
	('user55', '1111', '백힘찬', '1993-11-12', 'f', 'pyojong@triponplan.ga', '01089012345', '강원 철원군 서면 태봉로 465-83 ', '124-50호', '0', 'own'),
	('user56', '1111', '양한결', '1987-10-14', 'f', 'ryu1993@triponplan.ga', '01090123456', '전남 해남군 계곡면 비슬안길 185', '101동 301호', '0', 'own'),
	('user57', '1111', '권나봄', '1966-04-22', 'f', 'jungjong@triponplan.ga', '01023456789', '경기 안양시 만안구 안양로268번길 41', '202동 303호', '0', 'own'),
	('user58', '1111', '송아리', '1984-12-24', 'm', 'Yeon-jae@triponplan.ga', '01034567890', '경기 수원시 권선구 구운로85번길 28', '1004동 1001호', '0', 'own'),
	('user59', '1111', '배구슬', '1983-03-13', 'm', 'oshee0313@triponplan.ga', '01056789012', '경기 수원시 권선구 서부로1934번길 2', '303호', '0', 'own'),
	('user60', '1111', '이나리', '1989-05-04', 'm', 'wonchul@triponplan.ga', '01067890123', '경기 광주시 경안로 18', '101호', '0', 'own'),
	('user61', '1111', '장새롬', '1970-10-02', 'f', 'youminah@triponplan.ga', '01078901234', '경기 광주시 광주대로 133', '202동 303호', '0', 'own'),
	('user62', '1111', '박하늘', '1971-11-23', 'f', 'songsea@triponplan.ga', '01089012345', '경북 울릉군 울릉읍 울릉순환로 678', '1004동 1001호', '0', 'own'),
	('user63', '1111', '김슬기', '1969-08-15', 'm', 'newroom@triponplan.ga', '01090123456', '경기 안양시 만안구 안양로268번길 41', '202동 303호', '0', 'own'),
	('user64', '1111', '류새벽', '1995-03-25', 'f', 'leenabom@triponplan.ga', '01023456789', '경기 수원시 권선구 구운로85번길 28', '1004동 1001호', '0', 'own'),
	('user65', '1111', '한으뜸', '1987-04-09', 'f', 'joenkang@triponplan.ga', '01034567890', '경기 수원시 권선구 서부로1934번길 2', '303호', '0', 'own'),
	('user66', '1111', '백힘찬', '1968-05-18', 'f', 'simdanbi@triponplan.ga', '01056789012', '경기 광주시 경안로 18', '101호', '0', 'own'),
	('user67', '1111', '양한결', '1980-05-23', 'f', 'iknownam@triponplan.ga', '01067890123', '경기 광주시 광주대로 133', '202동 303호', '0', 'own'),
	('user68', '1111', '권나봄', '1973-10-19', 'f', 'aramkim@triponplan.ga', '01078901234', '경북 울릉군 울릉읍 울릉순환로 678', '1004동 1001호', '0', 'own'),
	('user69', '1111', '송아리', '1966-11-03', 'f', 'moonbo@triponplan.ga', '01089012345', '서울 강남구 선릉로 524', '102동 202호', '0', 'own'),
	('user70', '1111', '배구슬', '1966-04-22', 'f', 'saerone@triponplan.ga', '01090123456', '서울 강남구 논현로119길 24', '503동 604호', '0', 'own'),
	('user71', '1111', '이나리', '1984-12-24', 'm', 'youseeme@triponplan.ga', '01023456789', '경기 화성시 서신면 궁평고잔길 85-5', '3동 609호', '0', 'own'),
	('user72', '1111', '장새롬', '1983-03-13', 'm', 'songari@triponplan.ga', '01034567890', '경남 창원시 진해구 명제로 324-5', '1004동 1001호', '0', 'own'),
	('user73', '1111', '박하늘', '1989-05-04', 'm', 'shipmarble@triponplan.ga', '01056789012', '경북 울릉군 울릉읍 울릉순환로 678', '503동 604호', '0', 'own'),
	('user74', '1111', '김슬기', '1970-10-02', 'm', 'standup@triponplan.ga', '01067890123', '서울 강남구 선릉로 524', '3동 609호', '0', 'own'),
	('user75', '1111', '류새벽', '1971-11-23', 'f', 'jangsae@triponplan.ga', '01067890123', '서울 강남구 논현로119길 24', '124-50호', '0', 'own'),
	('user76', '1111', '한으뜸', '1969-08-15', 'f', 'skypark@triponplan.ga', '01078901234', '서울 강남구 선릉로 524', '101동 301호', '0', 'own'),
	('user77', '1111', '백힘찬', '1995-03-25', 'm', 'seulgikim@triponplan.ga', '01089012345', '서울 강남구 논현로119길 24', '202동 303호', '0', 'own'),
	('user78', '1111', '양한결', '1975-04-30', 'm', 'kwangil2@triponplan.ga', '01090123456', '경기 화성시 서신면 궁평고잔길 85-5', '1004동 1001호', '0', 'own'),
	('user79', '1111', '권나봄', '1965-08-27', 'f', 'namso123@triponplan.ga', '01023456789', '경남 창원시 진해구 명제로 324-5', '303호', '0', 'own'),
	('user80', '1111', '송아리', '1993-11-12', 'f', 'pyojong@triponplan.ga', '01034567890', '경북 울릉군 울릉읍 울릉순환로 678', '101호', '0', 'own'),
	('user81', '1111', '배구슬', '1987-10-14', 'f', 'ryu1993@triponplan.ga', '01056789012', '강원 철원군 서면 태봉로 465-83 ', '202동 303호', '0', 'own'),
	('user82', '1111', '이나리', '1966-04-22', 'f', 'jungjong@triponplan.ga', '01067890123', '경북 울릉군 울릉읍 울릉순환로 678', '503동 604호', '0', 'own'),
	('user83', '1111', '장새롬', '1984-12-24', 'm', 'Yeon-jae@triponplan.ga', '01078901234', '서울 강남구 선릉로 524', '3동 609호', '0', 'own'),
	('user84', '1111', '박하늘', '1983-03-13', 'm', 'oshee0313@triponplan.ga', '01089012345', '서울 강남구 논현로119길 24', '124-50호', '0', 'own'),
	('user85', '1111', '김슬기', '1989-05-04', 'm', 'wonchul@triponplan.ga', '01090123456', '서울 강남구 선릉로 524', '101동 301호', '0', 'own'),
	('user86', '1111', '류새벽', '1970-10-02', 'f', 'youminah@triponplan.ga', '01023456789', '서울 강남구 논현로119길 24', '202동 303호', '0', 'own'),
	('user87', '1111', '한으뜸', '1971-11-23', 'f', 'songsea@triponplan.ga', '01034567890', '경기 화성시 서신면 궁평고잔길 85-5', '1004동 1001호', '0', 'own'),
	('user88', '1111', '백힘찬', '1969-08-15', 'm', 'newroom@triponplan.ga', '01023456789', '경남 창원시 진해구 명제로 324-5', '303호', '0', 'own'),
	('user89', '1111', '양한결', '1995-03-25', 'f', 'leenabom@triponplan.ga', '01034567890', '경북 울릉군 울릉읍 울릉순환로 678', '101호', '0', 'own'),
	('user90', '1111', '권나봄', '1987-04-09', 'f', 'joenkang@triponplan.ga', '01056789012', '강원 철원군 서면 태봉로 465-83 ', '202동 303호', '0', 'own'),
	('user91', '1111', '송아리', '1968-05-18', 'f', 'simdanbi@triponplan.ga', '01067890123', '전남 해남군 계곡면 비슬안길 185', '101동 301호', '0', 'own'),
	('user92', '1111', '배구슬', '1980-05-23', 'f', 'iknownam@triponplan.ga', '01078901234', '경기 안양시 만안구 안양로268번길 41', '202동 303호', '0', 'own'),
	('user93', '1111', '이나리', '1973-10-19', 'f', 'aramkim@triponplan.ga', '01067890123', '경북 울릉군 울릉읍 울릉순환로 678', '503동 604호', '0', 'own'),
	('user94', '1111', '장새롬', '1966-11-03', 'f', 'moonbo@triponplan.ga', '01078901234', '서울 강남구 선릉로 524', '3동 609호', '0', 'own'),
	('user95', '1111', '박하늘', '1966-04-22', 'f', 'saerone@triponplan.ga', '01089012345', '서울 강남구 논현로119길 24', '124-50호', '0', 'own'),
	('user96', '1111', '김슬기', '1984-12-24', 'm', 'youseeme@triponplan.ga', '01090123456', '경기 화성시 서신면 궁평고잔길 85-5', '101동 301호', '0', 'own'),
	('user97', '1111', '류새벽', '1983-03-13', 'm', 'songari@triponplan.ga', '01023456789', '경남 창원시 진해구 명제로 324-5', '202동 303호', '0', 'own'),
	('user98', '1111', '한으뜸', '1989-05-04', 'm', 'shipmarble@triponplan.ga', '01034567890', '경북 울릉군 울릉읍 울릉순환로 678', '1004동 1001호', '0', 'own'),
	('user99', '1111', '백힘찬', '1970-10-02', 'm', 'standup@triponplan.ga', '01056789012', '서울 강남구 선릉로 524', '102동 202호', '0', 'own');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- 트리거 samp.TG_RESERVATION_INSERT 구조 내보내기
DROP TRIGGER IF EXISTS `TG_RESERVATION_INSERT`;
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
DROP TRIGGER IF EXISTS `TG_REVIEW_INSERT`;
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
DROP TRIGGER IF EXISTS `TG_ROOM_INSERT`;
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
