package com.springbook.view.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springbook.biz.qna.QnaService;
import com.springbook.biz.qna.QnaVO;
import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;

@Controller("qna")
public class QnaController {

	@Autowired//qnaService는 인터페이스 이므로, 실제로는 상속받은qnaServiceImpl자료형의 객체로 생성된다. 
	private QnaService qnaService;

	@Autowired
	private UserService userService;
	
    //사용자가 질문할 때 사용
	@RequestMapping(value = "/qna_insert.do", method = RequestMethod.GET) // URL
	public String qna_insertOne(HttpSession session) {
		/*
		 * (String) session.getAttribute("user_id") 로그인이 되었으면 
		 * "user_id"가 가지고 있는 아이디를 돌려 주고, 로그인이 되어있지 않으면 null을 돌려준다.
		 * 
		 * 로그인시 로그인 성공하면 session객체에 로그인 정보를 담아놓은것을 가져오는 것 
		 * 이유 : 로그인 여부에 따라 질문등록화면이 보여지거나, 로그인 화면으로 이동되도록 처리하기위해
		 */
		String id = (String) session.getAttribute("user_id");
		if (id == null) {// 로그인 아이디가 존재하면 qna_insert.jsp(질문등록페이지)로 이동되도록 처리
			return "/WEB-INF/views/user_login.jsp";
		} else {// 로그인 아이디가 존재하지 않으면 로그인 페이지(user_login.jsp)로 이동되도록 처리
			return "/WEB-INF/views/qna_insert.jsp";
		}
	}

	//사용자가 질문할 때 사용
//	우리는 특정 url로 요청을 보내면 Controller에서 어떠한 방식으로 처리할지 정의
//	이때 들어온 요청을 특정 메서드와 매핑하기 위해 사용하는 것이 @RequestMapping이다.
//	@RequestMapping에서 가장 많이사용하는 부분은 value와 method이다. (더 많지만 여기서는 여기까지만)
//	value는 요청받을 url을 설정하게 된다.
//	method는 어떤 요청으로 받을지 정의하게 된다.(GET, POST, PUT, DELETE 등)
//	action="qna_insert.do" => action에 있는것이 url호출입니다. 
	@RequestMapping(value = "/qna_insert.do", method = RequestMethod.POST)//URL
	public String qna_insertOne(QnaVO vo, UserVO uvo, HttpSession session) throws Exception {
		// id는 로그인한 id를 가져와야 하므로 session에서 가져온다.
		System.out.println("insertuser : " + vo);
		// 가져온 session아이디를 uvo객체의 uvo.set user_id(session아이디)를 통해 설정해준다.
		// 인서트시 필요한 이메일 정보등 사용자 정보를 가져오기 위해 로그인한 아이디를 설정한다.
		uvo.setUser_id((String) session.getAttribute("user_id"));
		// QnaService 인터페이스를 상속받은 QnaServiceImpl클래스로 만든 객체
		uvo = qnaService.myUserOne(uvo);//사용자정보 1줄 가져오기(행수나 줄수를 반환한다.)
		vo.setQna_user_id(uvo.getUser_id());//사용자정보(UserVO객체의 ID)에서 가져온 아이디를 QnaVO(객체)의 qna_user_id에 설정(담기)
		vo.setQna_user_email(uvo.getUser_email());//사용자정보에서 가져온 이메일을 QnaVO의 qna_user_email에 설정
		// QnaService 인터페이스를 상속받은 QnaServiceImpl클래스로 만든 객체
		qnaService.myQnaInsert(vo);
		return "redirect:qna_list.do";
	}

	// 사용자의 질문 리스트화면 보기
	@RequestMapping(value = "/qna_list.do") //jsp에서 호출한URL과 일치<a href="qna_list.do">
	//QnaVO vo커맨드객체:jsp에서 보낸 파라미터를 자동으로 VO에 맵핑시켜주는 객체.
	//model데이터를 담아서 보내기위한 객체.
	public String qna_userList(QnaVO vo, HttpSession session, Model model) {
		// Model 객체는 JSP에 컨트롤러에서 생성된 데이터를 담아서 전달하는 역할.
		// JSP와 같은 뷰(View)로 전달해야 하는 데이터를 담아서 보낼 수 있습니다.
//메서드의 파라미터에 Model 타입이 지정된 경우에는 스프링은 특별하게 Model 타입의 객체를 만들어서 메서드에 주입하게 됩니다.

		// 세션정보에서 아이디를 가져오기
		String id = (String) session.getAttribute("user_id");
		// 세션정보에서 가져온 아이디를 QnaVO의 qna_user_id에 설정
		vo.setQna_user_id(id);

		if (id != null) {
			//model.addAttribute데이터를 담아서.
			model.addAttribute("qnalist", qnaService.myQnaList(vo));
			return "/WEB-INF/views/qna_list.jsp";
		} else {
			return "/WEB-INF/views/user_login.jsp";
		}
	}
    //사용자 상세 보기
	@RequestMapping(value = "/qna_views.do", method = RequestMethod.GET) // URL
	public String qna_views(QnaVO vo, Model model) {
		// model객체:객체를 담는곳 (데이터를 담아야 하는 경우, 컨트롤러를 타야하는 경우)
		model.addAttribute("qnaOne", qnaService.qnaOne(vo));
		// model객체:객체를 담는곳 (데이터를 담아야 하는 경우, 컨트롤러를 타야하는 경우)
		return "/WEB-INF/views/qna_views.jsp";
	}

	// 게시물 수정
	@RequestMapping(value = "/qna_update.do", method = RequestMethod.POST) // URL
	public String qna_updateQna(QnaVO vo, HttpSession session) throws Exception {
		// 세션정보에서 아이디를 가져오기
		String id = (String) session.getAttribute("user_id");
		// 세션정보에서 가져온 아이디를 QnaVO의 qna_user_id에 설정
		vo.setQna_admin_id(id);
		qnaService.myQnaUpdate(vo);
		return "redirect:qna_views.do?qna_num=" + vo.getQna_num();
	}

	// 게시물 삭제
	@RequestMapping(value = "/qna_delete.do") // URL
	public String qna_deleteQna(QnaVO vo) {
		System.out.println("deleteuser : " + vo);
		if (qnaService.myQnaDelete(vo) > 0)
			System.out.println("삭제되었습니다.");
		else
			System.out.println("삭제할 내역이 없습니다.");

		return "redirect:qna_list.do";

	}

	// 관리자 질문 리스트화면 보기
	@RequestMapping(value = "/qna_admin_list.do")//URL
	public String qna_admin_list(Model model) {
		model.addAttribute("qnaadminlist", qnaService.adminQnaAllList());//데이터담기
		return "/WEB-INF/views/qna_admin_list.jsp";
	}

	// 관리자 상세보기
	@RequestMapping(value = "/qna_admin_views.do", method = RequestMethod.GET) // URL
	public String qna_admin_views(QnaVO vo, Model model) {
		// model객체:객체를 담는곳 (데이터를 담아야 하는 경우, 컨트롤러를 타야하는 경우)
		//위에서 받아온 데이터를model객체에 담기("키" , 받아오는 로직 처리); 
		model.addAttribute("qnaOne", qnaService.qnaOne(vo));
		// model객체:객체를 담는곳 (데이터를 담아야 하는 경우, 컨트롤러를 타야하는 경우)
		//보여줄 페이지의 Url경로 기술하기
		return "/WEB-INF/views/qna_admin_views.jsp";
	}

	// 관리자 게시물 수정
	@RequestMapping(value = "/qna_admin_update.do", method = RequestMethod.POST) // URL
	public String adminQnaAnswerUpdate(QnaVO vo, HttpSession session) throws Exception {

		// 세션정보에서 아이디를 가져오기
		String id = (String) session.getAttribute("user_id");
		// 세션정보에서 가져온 아이디를 QnaVO의 qna_user_id에 설정
		vo.setQna_admin_id(id);
		// QnaService 인터페이스를 상속받은 QnaServiceImpl클래스로 만든 객체
		qnaService.adminQnaAnswerUpdate(vo);
        //데이터를 전송할 필요가 없으므로 redirect:로 상세보기 페이지로 이동해야 하므로 상세보기 데이터를 담아야 하기 때문에
		//jsp를 바로 호출한 것이 아니라 qna_admin_views.do라는 QnaController의 Mapping Url을 호출함.
		return "redirect:qna_admin_views.do?qna_num=" + vo.getQna_num();
	}

}
