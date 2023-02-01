package com.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.mariadb.jdbc.internal.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
		
		@Autowired
		BCryptPasswordEncoder passEncoder;
		
		
		// 회원가입 get
		@RequestMapping(value="/register", method = RequestMethod.GET)
		
		public void getRegister() throws Exception{
			Logger.info("get register");
		}
	
	// 회원가입 post	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception{
		Logger.info("post register");
		
		String inputPwd = vo.getUserPwd();
		String pwd = passEncoder.encode(inputPwd);
		vo.setUserPwd(pwd);
		
		service.register(vo);
		return "redirect:/";
	}

	
	// 로그인
	@RequestMapping(value="/login",method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr)throws Exception{
		Logger.info("post login");
		HttpSession session = req.getSession();
		
		MemberVO login = service.login(vo);
		boolean passMatch = passEncoder.matches(vo.getUserPwd(),login.getUserPwd());
		
		boolean loginSuccess = service.login(req);
		System.out.println("로그인 성공 여부 : "+ loginSuccess);
		
		
		
		if(login!=null && passMatch) {
			//System.out.println("passMatch: " + passMatch);
			session.setAttribute("member", login);
			
			long timeset = session.getMaxInactiveInterval() - session.getCreationTime();
			System.out.println(timeset);
			System.out.println("userId:" +vo.getUserId());
			System.out.println("userId:" +vo.getUserId().isEmpty());
			
			/*
			  System.out.println(session.getMaxInactiveInterval()/60);
			// 세션시간 30분
			System.out.println(session.getCreationTime());
			java.util.Date d = new java.util.Date(session.getCreationTime());
			System.out.println("마지막으로 엑세스한 시간"+session.getId());
			
			System.out.println("세션 생성한 시간"+d);
			*/
			// String sessionTime =formatter.format(time);
			// session.setAttrtibute로 시간 작성해서 최근접속 기록 남기기 
		}else{
			session.setAttribute("err", "로그인 정보가 올바르지 않아요.");
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			// msg라는 정보에 false라는 값이 들어가서 전송됨. 일회용 값
			return "redirect:/";
		}
		return "redirect:/";
		
	}
	// 로그인화면 아이디 체크
	

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
	@ResponseBody
	@RequestMapping(value="/nickCheck",method=RequestMethod.POST)
	public int postNickCheck(HttpServletRequest req) throws Exception{
		Logger.info("post nickCheck");
		String userName=req.getParameter("userName");
		MemberVO nickCheck = service.nickCheck(userName);
		
		int result=0;
		if(nickCheck!=null) {
			result=1;
		}
		return result;
		
	}
	// 닉네임 변경 get
	@RequestMapping(value="/change",method=RequestMethod.GET)
	public void getChange() throws Exception{
		Logger.info("get change");
		
	}
	// 닉네임 변경 post 
	@RequestMapping(value="/change",method=RequestMethod.POST)
	public String postChange(HttpSession session,MemberVO vo) throws Exception{
		Logger.info("post change");
		service.change(vo);
		session.invalidate();
		return "redirect:/";
	}
	// 비밀번호 변경 get
	@RequestMapping(value="/pwdchange",method=RequestMethod.GET)
	public void getPwdChange() throws Exception{
		Logger.info("get PwdChange");
		
	}
	// 비밀번호 변경 post
	@RequestMapping(value="/pwdchange",method=RequestMethod.POST)
	public String postPwdChange(HttpSession session,MemberVO vo,HttpServletRequest req) throws Exception{
		Logger.info("post PwdChange");
		String inputpass = req.getParameter("Pwd");
		//String inputPwd = vo.getUserPwd();
		
		//String userPwd = passEncoder.encode(inputPwd);
		//String Pwd = passEncoder.encode(inputPwd);
		String Pwd = passEncoder.encode(inputpass);
		vo.setUserPwd(Pwd);
		
		service.pwdchange(vo);
		session.invalidate();
		return "redirect:/";
	}
//	@RequestMapping(value="/pwdchange",method=RequestMethod.POST)
//	public String memberUpdate(HttpSession session, MemberVO vo,Model model) throws Exception {
//		boolean result= service.checkPw(vo.getUserId(), vo.getUserPwd());
//		boolean passMatch = passEncoder.matches(vo.getUserPwd(),result);
//		if(result!=null && passMatch) {
//			service.pwdchange(vo);
//			session.invalidate();
//			return "redirect:/board/listPageSearch?num=1";
//		}else {
//			vo.getUserPwd();
//			model.addAttribute("pwd",vo);
//			model.addAttribute("message","비밀번호가 불일치합니다.");
//			return "redirect:/";
//		}
//		
//	
//	}
		// 비밀번호 체크
	@ResponseBody
	@RequestMapping(value="/checkPw", method=RequestMethod.POST)
	public boolean checkPw(MemberVO vo,HttpServletRequest req)throws Exception{
		
//		String userId = req.getParameter("userId");
//		String userPwd = req.getParameter("userPwd");
//		String pwd = passEncoder.encode(userPwd);
//		vo.setUserPwd(pwd);

		MemberVO login = service.login(vo);
		boolean pwdChk = passEncoder.matches(vo.getUserPwd(), login.getUserPwd());
		return pwdChk;
	}

	@RequestMapping(value="/withdrawal",method=RequestMethod.GET)
	public void getWithdrawal() throws Exception{
		Logger.info("회원 탈퇴 GET");
		
	}
	@RequestMapping(value="/withdrawal",method=RequestMethod.POST)
	public String postWithdrawal(MemberVO vo,HttpSession session,RedirectAttributes rttr,HttpServletRequest req) throws Exception{
		 Logger.info("회원 탈퇴 POST");
		String inputpass = req.getParameter("Pwd");
		String Pwd = passEncoder.encode(inputpass);
		vo.setUserPwd(Pwd);
		
		service.withdrawal(vo);
		session.invalidate();
		return "redirect:/";
		 
		 
		 
		// MemberVO login = service.login(vo);
		//service.withdrawal(vo);
	}
		
	
	/*
    @RequestMapping(value = "/login", method = { RequestMethod.POST })
    public Object login(HttpServletRequest request, HttpServletResponse response, LoginVO loginVo) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();

        String id = ServletRequestUtils.getStringParameter(request, "schId", "");
        String pw = ServletRequestUtils.getStringParameter(request, "schPw", "");
        String Epw = SystemInfor.Base64encode(pw);

        LoginVO loginVO = mapper.login(id, Epw);
        if (loginVO == null) {
            result.put("result", "로그인 후 사용하십시오.");
            response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out = response.getWriter();
			 
			out.println("<script>alert('아이디가 없거나, 잘못된 비밀번호 입니다.');</script>");
			 
			out.flush();
			return "/login";
        } else {
            HttpSession session = request.getSession(true);
            session.setAttribute("id", id);
            session.setAttribute("name", loginVO.getUser_Nm());
            session.setAttribute("rest", loginVO.getRest());
            session.setAttribute("restNm", loginVO.getRest_nm());
            request.getSession().setMaxInactiveInterval(60 * 5);
            return "redirect:/main";
        }
        //return result;
    }
    */
	
	
	
	
	
	
	
	
	
	
}