package com.springbook.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springbook.biz.user.impl.PhoneService;

@Controller
public class PhoneController {
	@Autowired
	PhoneService testService;
	
	@RequestMapping(value = "/phoneCheck.do", method = RequestMethod.GET) 
	@ResponseBody 
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) { 
		System.out.println("휴대폰으로 보낼 인증번호 난수 생성"); 
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);
		//난수 생성 
		testService.certifiedPhoneNumber(userPhoneNumber,randomNumber); 
		return Integer.toString(randomNumber); 
	}
	
	
	

}
