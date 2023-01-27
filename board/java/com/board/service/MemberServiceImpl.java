package com.board.service;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.board.dao.MemberDAO;
import com.board.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	@Inject
	private MemberDAO dao;
	
	@Override
	public void register(MemberVO vo) throws Exception{
		dao.register(vo);
	}
	
	@Override
	public MemberVO login(MemberVO vo) throws Exception{
		return dao.login(vo);
	}
	
	@Override
	public MemberVO idCheck(String userId)throws Exception{
		return dao.idCheck(userId);
	}
	@Override
	public void change(MemberVO vo) throws Exception{
		dao.change(vo);
	}
	@Override
	public void pwdchange(MemberVO vo) throws Exception{
		dao.pwdchange(vo);
	}
	@Override
	public boolean checkPw(String userId, String userPwd) throws Exception {
		return dao.checkPw(userId,userPwd);
	}
	@Override
	public boolean logincheck(HttpServletRequest request)throws Exception{
		HashMap<String,String> map= new HashMap<String,String>();
		boolean loginSuccess = false;
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		map.put("userId", userId);
		map.put("userPwd", userPwd);
		MemberVO login = dao.logincheck(map);
		
		if (login != null) {
			HttpSession session = request.getSession();

			// 세션에 로그인 정보를 부여함
			session.setAttribute("login", login);

			// 로그인 성공 여부를 변경
			loginSuccess = true;
		}

			return loginSuccess;
			

	}
}

