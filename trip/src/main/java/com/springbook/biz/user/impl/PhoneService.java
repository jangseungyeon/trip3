package com.springbook.biz.user.impl;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class PhoneService {
	
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) { 
		System.out.println("실제 전송로직: "+userPhoneNumber);
		
		//coolsms의 개발/연동 메뉴에 있는 API Key관리 메뉴에서 API Key, API Secret값 넣기
		String api_key = "NCSPUWEQGDPWOPVK"; 
		String api_secret = "EEZLKUNJF6UGTO37WO6BBX6YZH9VKEHC"; 
		
		Message coolsms = new Message(api_key, api_secret); 
		
		HashMap<String, String> params = new HashMap<String, String>(); 
		// 수신전화번호 
		params.put("to", userPhoneNumber); 
		// coolsms의 환경설정 메뉴의 발신번호관리에 등록한 발신번호로 지정
		params.put("from", "01076079993"); 
		params.put("type", "SMS"); 
		params.put("text", "[Trip] 인증번호는" + "["+randomNumber+"]" + "입니다."); 
		// 문자 내용 입력 
		try { 
			Object obj = coolsms.send(params); 
			Object obj1 = coolsms.sent(params);
			System.out.println(obj.toString()); 
			System.out.println(obj1.toString()); 
		} catch (CoolsmsException e) { 
			System.out.println(e.getMessage()); 
			System.out.println(e.getCode()); 
		} 
	}
	
	

}
