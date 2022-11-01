package com.springbook.biz.room;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.springbook.biz.room.RoomVO;

public class RoomMain {

	public static void main(String[] args) {
		AbstractApplicationContext container = new GenericXmlApplicationContext("applicationContext.xml");
		RoomService roomService = (RoomService) container.getBean("roomService");
		
		RoomVO rvo = new RoomVO();
		rvo.setRoom_name("홍길동");
		rvo.setRoom_addr("경기도 안양시 만안구 박달로 453 한라비발디아파트 105동 1903호");
		rvo.setRoom_id("101");
		rvo.setHost_id("201");
		rvo.setRoom_price("34500");
		rvo.setRoom_points("300");
		rvo.setRoom_max("5");
		rvo.setRoom_theme("sea");
		rvo.setRoom_cat("호텔");
		rvo.setRoom_wifi("Y");
		rvo.setRoom_pet("Y");
		rvo.setRoom_meal("Y");
		rvo.setRoom_parking("N");
		rvo.setRoom_swpool("N");
		rvo.setRoom_likes("0");
		rvo.setRoom_stars("0");
		
//		roomService.insertRoom(rvo);
		
//		rvo.setRoom_name("윤상호");
//		rvo.setRoom_addr("경기도 광명시 일직동 504-5 401호");
//		rvo.setRoom_id("101");
//		rvo.setHost_id("201");
//		rvo.setRoom_price("48500");
//		rvo.setRoom_points("400");
//		rvo.setRoom_max("3");
//		rvo.setRoom_theme("mountain");
//		rvo.setRoom_cat("게스트 하우스");
//		rvo.setRoom_wifi("N");
//		rvo.setRoom_pet("N");
//		rvo.setRoom_meal("N");
//		rvo.setRoom_parking("Y");
//		rvo.setRoom_swpool("Y");
//		rvo.setRoom_likes("100");
//		rvo.setRoom_stars("105");
		
//		roomService.updateRoom(rvo);
		
//		roomService.deleteRoom(rvo);
		
		List<RoomVO> roomList = roomService.getRoomList(rvo);
		for(RoomVO room : roomList) {
			System.out.println("-----> " + room.toString());
		}
		
		container.close();
		
	}

}
