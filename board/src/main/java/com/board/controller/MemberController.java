package com.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//import org.mariadb.jdbc.internal.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.MemberVO;
import com.board.service.MemberService;

	@Controller
	@RequestMapping("/member/*")
	public class MemberController {
		private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);
		
		@Inject
		MemberService service;
		
		
		// 회원가입 get
		@RequestMapping(value="/register", method = RequestMethod.GET)
		
		public void getRegister() throws Exception{
			Logger.info("get register");
		}
	
//	// 회원가입 post	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception{
		Logger.info("post register");
		service.register(vo);
		return "redirect:/";
	}
	
	// 로그인
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr)throws Exception{
		Logger.info("post login");
		HttpSession session = req.getSession();
		MemberVO login = service.login(vo);
		if(login==null) {
			session.setAttribute("member", null);
			session.setAttribute("err", "로그인 정보가 올바르지 않아요.");
			rttr.addFlashAttribute("msg", false);
			// msg라는 정보에 false라는 값이 들어가서 전송됨. 일회용 값
			
		}else {
			session.setAttribute("member", login);
		}
		return "redirect:/";
	}
	
	// 로그아웃
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		Logger.info("get logout");
		session.invalidate();
		// 현재 사용하는 세션 초기화
		
		return "redirect:/";	
	}
	// 로그아웃 post
	@RequestMapping(value="/logout", method = RequestMethod.POST)
	public String postLogout(MemberVO vo) throws Exception{
		Logger.info("post logout");
		service.login(vo);
		return "redirect:/member/login";
	}
	
	// id 체크
	@ResponseBody
	@RequestMapping(value="/idCheck",method=RequestMethod.POST)
	public int postIdCheck(HttpServletRequest req) throws Exception{
		Logger.info("post idCheck");
		String userId = req.getParameter("userId");
		MemberVO idCheck = service.idCheck(userId);
		
		int result = 0;
		if(idCheck!=null) {
			result=1;
		}
		return result;
	}
}