package com.springbook.view.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springbook.biz.reservation.ReservationService;
import com.springbook.biz.reservation.ReservationVO;
import com.springbook.biz.room.RoomService;
import com.springbook.biz.room.RoomVO;
import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;

@Controller
public class PayController {
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ReservationService reservationService;

	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	public static final String IMPORT_PAYMENTINFO_URL = "https://api.iamport.kr/payments/find/";
	public static final String IMPORT_PAYMENTLIST_URL = "https://api.iamport.kr/payments/status/all";
	public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	public static final String IMPORT_PREPARE_URL = "https://api.iamport.kr/payments/prepare";
	//"아임포트 Rest Api key로 설정";
	public static final String KEY = "4758005055508668";
	//"아임포트 Rest Api Secret로 설정"; 
	public static final String SECRET = "fFzVkIERPgeaeg6yZU3Z1x7mvd5TH0DLiJrdmkOjoQSQBUinDRkY6DlzidAosE3YyVylW5evPNmJFzmH";

	// 아임포트 인증(토큰)을 받아주는 함수 
	public String getImportToken() {
		String result = "";
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_TOKEN_URL);
		Map<String, String> m = new HashMap<String, String>();
		m.put("imp_key", KEY);
		m.put("imp_secret", SECRET);
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			result = resNode.get("access_token").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

// Map을 사용해서 Http요청 파라미터를 만들어 주는 함수 private
	List<NameValuePair> convertParameter(Map<String, String> paramMap) {
		List<NameValuePair> paramList = new ArrayList<NameValuePair>();
		Set<Entry<String, String>> entries = paramMap.entrySet();
		for (Entry<String, String> entry : entries) {
			paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		return paramList;
	}

// 아임포트 결제금액 변조는 방지하는 함수 
	public void setHackCheck(String amount, String mId, String token) {
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_PREPARE_URL);
		Map<String, String> m = new HashMap<String, String>();
		post.setHeader("Authorization", token);
		m.put("amount", amount);
		m.put("merchant_uid", mId);
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			System.out.println(rootNode);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

// 결제취소
	@RequestMapping(value = "/paycan", method = RequestMethod.POST)
	@ResponseBody
	public int cancelPayment(String mid) {
		String token = getImportToken();
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_CANCEL_URL);
		Map<String, String> map = new HashMap<String, String>();
		post.setHeader("Authorization", token);
		map.put("merchant_uid", mid);
		String asd = "";
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String enty = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(enty);
			asd = rootNode.get("response").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (asd.equals("null")) {
			System.err.println("환불실패");
			return -1;
		} else {
			System.err.println("환불성공");
			return 1;
		}
	}

	//상품결제 폼 호출
	//숙소 예약 결제 페이지 이동 (하면서 해당 숙소의 기본 정보 및 유저 정보 끌고 옴)
	@RequestMapping(value = "/pay.do", method = RequestMethod.GET)
	public String pay(HttpServletRequest request, Model model, RoomVO rovo, ReservationVO revo, HttpSession session, HttpServletResponse response) throws Exception {
		
		String user_id = (String) session.getAttribute("user_id");
		
		if(user_id != null) {

			System.out.println("예약 결제 폼 호출 시작");
			
			model.addAttribute("room",roomService.getRoom(rovo));
			
			model.addAttribute("reservation", revo);
			
			UserVO uvo = null;
			
			uvo = new UserVO();
			
			uvo.setUser_id(user_id);
			
			model.addAttribute("userInfo", userService.info(uvo));
			
			System.out.println("예약 결제 폼 호출 끝");
			
			// 값은 아임포트의 가맹점 식별코드 입력
			model.addAttribute("impKey", "imp57061355");
			
			return "WEB-INF/views/user_room/user_insert_reservation.jsp";
		
		} else {
			
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.println("<script>");
			
			out.println("alert('로그인 후 이용 가능 합니다.')");
			
			out.println("location.href='user.login.do'");
			
			out.println("</script>");
			
			out.flush();
			
			out.close();
			
			return null;
		}
	}
	

	//결제 진행 폼=> 이곳에서 DB저장 로직도 추가하기
		@RequestMapping(value="/pay.do", method=RequestMethod.POST)
		public String payment(HttpServletRequest request, HttpServletResponse response, Model model, ReservationVO rvo) throws IOException {
//			String nm = request.getParameter("unm");
//			String amount = request.getParameter("amount");
//			String mid = request.getParameter("mid");
			System.out.println(rvo);
			String nm = rvo.getRes_name();
			String amount = rvo.getPay_amount();
			String mid = rvo.getMerchant_uid();
			String token = getImportToken();
			setHackCheck(amount, mid, token);
			
			System.out.println("숙소 예약 등록 시작");
			System.out.println(rvo);
			reservationService.insertReservation(rvo);
			System.out.println("숙소 예약 등록 성공");
			
			return "WEB-INF/views/user_room/user_pay_complete.jsp";
		}

		// 아임포트 merchant_id 일치하면 모든 목록 반환
		// https://api.iamport.kr/#/ 참고, ready(미결제), paid(결제완료), failed(결제실패), cancelled(환불취소) 넣으면 조건별로 검색 가능
	@RequestMapping(value = "/payamount")
	@ResponseBody
	public Object getAmount(HttpServletRequest request, HttpSession session) {
		String mid = request.getParameter("mid");
		String token = getImportToken();
		System.out.println("토큰값: " + token);
		System.out.println("mid값: " + mid);
		Map<String, String> map = new HashMap<String, String>();
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(IMPORT_PAYMENTINFO_URL + mid + "/paid");
		get.setHeader("Authorization", token);
		try {
			HttpResponse res = client.execute(get);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			System.out.println("777: " + resNode);
			if (resNode.asText().equals("null")) {
				System.out.println("내역이 없습니다.");
				map.put("msg", "내역이 없습니다.");
			} else {
				map.put("imp_uid", resNode.get("imp_uid").asText());
				map.put("merchant_uid", resNode.get("merchant_uid").asText());
				map.put("name", resNode.get("name").asText());
				map.put("buyer_name", resNode.get("buyer_name").asText());
				map.put("amount", resNode.get("amount").asText());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return map;
	}
	
	public Long unixtime(String timestamp, String zoneoffset) {
		DateTimeFormatter pattern = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS Z");
  		LocalDateTime localDateTime = LocalDateTime.parse(timestamp, pattern);
  		ZonedDateTime zonedDateTime = ZonedDateTime.of(localDateTime, ZoneOffset.of(zoneoffset));
  		return zonedDateTime.toInstant().toEpochMilli();
  	}
	
	// 아임포트 전체 목록 반환 
	@RequestMapping(value="/paylist")
	@ResponseBody
	public Object getlist() { 
		String token = getImportToken();
		System.out.println("토큰값: "+token);
		List<Object> list = new ArrayList<Object>();
		
		long stime = unixtime("2022-11-01 00:00:00.000 +0100","+0100")/1000;
		long etime = unixtime("2022-11-30 00:00:00.000 +0100","+0100")/1000;
		System.out.println("start unixtime : "+stime);
		System.out.println("end unixtime : "+etime);
		
		HttpClient client = HttpClientBuilder.create().build(); 
		HttpGet get = new HttpGet(IMPORT_PAYMENTLIST_URL+"?page=1&limit=100&from="+stime+"&to="+etime+"&sorting=-started");
		get.setHeader("Authorization", token); 
		try {
			HttpResponse res = client.execute(get); 
			ObjectMapper mapper = new ObjectMapper(); 
			String body = EntityUtils.toString(res.getEntity()); 
			JsonNode rootNode = mapper.readTree(body); 
			JsonNode resNode = rootNode.get("response").get("list"); 
			JsonNode resNode1 = rootNode.get("response"); 
			System.out.println("555: " + resNode1);
			
			for(int i=0; i< resNode.size();i++) {
				
				Map<String, String> map = new HashMap<String, String>();
				map.put("imp_uid",resNode.get(i).get("imp_uid").asText() );
				map.put("merchant_uid",resNode.get(i).get("merchant_uid").asText() );
				map.put("name",resNode.get(i).get("name").asText() );
				map.put("buyer_name",resNode.get(i).get("buyer_name").asText() );
				map.put("amount",resNode.get(i).get("amount").asText() );
				map.put("cancel_amount",resNode.get(i).get("cancel_amount").asText() );
				map.put("failed_at",resNode.get(i).get("status").asText() );
				list.add(map);
			}
			
		} catch (Exception e) { 
			e.printStackTrace(); 
		}
		return list; 
	}
	
	@RequestMapping(value="/MobilePaymentComplete.do")
	public String MobilePaymentComplete(@RequestParam(required = false) String imp_uid, @RequestParam(required = false) String merchant_uid
			, @RequestParam(required = false) String imp_success, Model model) throws IOException {
		
		String mid = merchant_uid;
		String token = getImportToken();
		
		Map<String, String> map = new HashMap<String, String>();
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(IMPORT_PAYMENTINFO_URL + mid + "/paid");
		get.setHeader("Authorization", token);
		try {
			HttpResponse res = client.execute(get);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			System.out.println("777: " + resNode);
			if (resNode.asText().equals("null")) {
				System.out.println("내역이 없습니다.");
				map.put("msg", "내역이 없습니다.");
			} else {
				map.put("imp_uid", resNode.get("imp_uid").asText());
				map.put("merchant_uid", resNode.get("merchant_uid").asText());
				map.put("name", resNode.get("name").asText());
				map.put("buyer_name", resNode.get("buyer_name").asText());
				map.put("amount", resNode.get("amount").asText());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String amount = map.get("amount");
		setHackCheck(amount, mid, token);
		
		ReservationVO rvo = null;
		
		rvo = new ReservationVO();
		
		rvo.setRes_name(map.get("buyer_name"));
		rvo.setPay_amount(map.get("amount"));
		rvo.setMerchant_uid(map.get("merchant_uid"));
		rvo.setImp_uid(map.get("imp_uid"));
		
		System.out.println("숙소 예약 등록 시작");
		System.out.println(rvo);
		reservationService.insertReservation(rvo);
		System.out.println("숙소 예약 등록 성공");
		
		return "WEB-INF/views/user_room/user_pay_complete.jsp";
	}
	 
	 

}
