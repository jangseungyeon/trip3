package com.springbook.view.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springbook.biz.planner.tourSearchVO;

@Controller
@ResponseBody
public class tourSearchAjaxController{

		@RequestMapping("/test.do")
		public Object getTourHouseList(HttpServletRequest request , String page, int pageNum , String keyword) throws Exception{
		    int pageNO = 1;	
			String apiToururl= "";
			if(!(page.isEmpty())){
				pageNO = page(pageNum , page);
			}
				if(keyword.isEmpty()) {
					apiToururl = "http://apis.data.go.kr/B551011/KorService/areaBasedList?"
							+ "numOfRows=5"
							+ "&pageNo="+pageNO
							+ "&MobileOS=ETC"
							+ "&MobileApp=AppTest"
							+ "&ServiceKey=CYndID2JHrOzK1Pr%2FAgioaNHSEKM3ql%2FiYRsxfTe9iJ6XXTbTF1H0oo%2FMYBEdb8iViimIILo%2FbsY63MXYjTZ6g%3D%3D"
							+ "&listYN=Y"
							+ "&arrange=A&"
							+ "&contentTypeId=39"
							+ "&areaCode=1"
							+ "&sigunguCode="
							+ "&cat1=A05"
							+ "&cat2=A0502"
							+ "&cat3="
							+ "&_type=json";	
				}else {
					apiToururl = "http://apis.data.go.kr/B551011/KorService/searchKeyword?"
							+ "numOfRows=5"
							+ "&pageNo="+pageNO
							+ "&MobileOS=ETC"
							+ "&MobileApp=AppTest"
							+ "&_type=json"
							+ "&areaCode="
							+ "&sigunguCode="
							+ "&cat1="
							+ "&cat2="
							+ "&cat3="
							+ "&ServiceKey=CYndID2JHrOzK1Pr%2FAgioaNHSEKM3ql%2FiYRsxfTe9iJ6XXTbTF1H0oo%2FMYBEdb8iViimIILo%2FbsY63MXYjTZ6g%3D%3D"
							+"&keyword=";
					keyword = URLEncoder.encode(keyword, "UTF-8");
					apiToururl = apiToururl+keyword;
				}
					
				URL url = new URL(apiToururl);
				InputStream in = url.openStream();                            
		        ByteArrayOutputStream bos1 = new ByteArrayOutputStream();        
		        IOUtils.copy(in, bos1);           
		        in.close();
		        bos1.close();
		      
		        String mbos = bos1.toString("UTF-8");
		 
		        byte[] b = mbos.getBytes("UTF-8");
		        String s = new String(b, "UTF-8");
		        JSONParser jsonParser = new JSONParser();
		        JSONObject jsonObject = (JSONObject)jsonParser.parse(s);
		        JSONObject response = (JSONObject)jsonObject.get("response");
		        JSONObject header = (JSONObject)response.get("header");
		        JSONObject body = (JSONObject)response.get("body");
		        JSONObject items = (JSONObject)body.get("items");
		        JSONArray item = (JSONArray)items.get("item");
		        List<tourSearchVO> tourList = new ArrayList<tourSearchVO>();
		        for(int i=0; i<item.size(); i++) {
		        	JSONObject jsonObj = (JSONObject)item.get(i);
		            tourSearchVO vo = new tourSearchVO();
		            vo.setTitle((String)jsonObj.get("title"));
		            vo.setAddr1((String)jsonObj.get("addr1"));
		            vo.setAddr2((String)jsonObj.get("addr2"));
		            vo.setMapx((String)jsonObj.get("mapx"));
		            vo.setMapy((String)jsonObj.get("mapy"));
		            vo.setFirstimage((String)jsonObj.get("firstimage"));
		            vo.setPageNum(pageNO);
		            vo.setKeyword(keyword);
		            tourList.add(vo);
		        }
		       
		       return tourList;
	}
		
		
	public int page(int pageNum , String page) {
		
		if(page.equals("이전") && pageNum != 1) {
			pageNum -= 1;
		}else if(page.equals("다음")){
			pageNum += 1;
		}
		
		
		return pageNum;
	}
}
