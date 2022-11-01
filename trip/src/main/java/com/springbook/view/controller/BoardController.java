package com.springbook.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.springbook.biz.qna.QnaService;
import com.springbook.biz.qna.QnaVO;

@Controller
public class BoardController {
	
	private static final String QnaVO = null;
	@Autowired
	private QnaService qnaService;
	@RequestMapping("/qna_insert.do")
	@ResponseBody
    public void qna_insert(QnaVO vo) {
		System.out.println("isnsertuser");
		qnaService.insertList(vo);
	}
	//글 수정
	@RequestMapping("/updateBoard.do")
	public String updateBoard(QnaVO vo) {
		qnaService.updateOne(vo);
		return "getBoardList.do";
	}
	
	//글 삭제
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(QnaVO vo) {
		qnaService.deleteOne(vo);
		return "getBoardList.do";
	}
	
	//글 상세 조회
	@RequestMapping("/getBoard.do")
	public ModelAndView getBoard(QnaVO vo, ModelAndView mav) {
		mav.addObject("board", qnaService.getQna(QnaVO));
		mav.setViewName("WEB-INF/board/getBoard.jsp");
		return mav;
	}


	//글 목록
	@RequestMapping("/getBoardList.do")
	public ModelAndView getBoardListPost(QnaVO bvo, 
			@RequestParam(value="searchCondition", defaultValue = "TITLE", required = false) String condition,
			@RequestParam(value="searchKeyword", defaultValue="", required = false) String keyword,
			ModelAndView mav) {
			System.out.println("글 목록 검색 처리: " + condition + ", " + keyword);
			mav.addObject("boardList", qnaService.getQnaList(bvo, keyword, condition));
			mav.setViewName("WEB-INF/board/getBoardList.jsp");
			return mav;
			//RequestParam 리퀘스트 객체의 파라미터 불러오기, value 키값 searchCondition, searchKeyword 찾아서 가져오기,
			// defaultValue 만약 value에 해당하는 value 값이 없으면 설정, required 속성은 이 해당하는 키값이 꼭 있어야 하는지 체크 (없어도 되면 false)
			//mav도 커맨드 객체 => 굳이 new로 생성하지 않아도 매개변수로 넣어주면 알아서 생성 & 매칭
	
}
	
}
