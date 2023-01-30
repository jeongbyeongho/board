package com.board.service;

import javax.servlet.http.HttpServletRequest;

import com.board.domain.MemberVO;

public interface MemberService {

	public void register(MemberVO vo) throws Exception;
	public MemberVO login(MemberVO vo) throws Exception;
	public MemberVO idCheck(String userId)throws Exception;
	public void change(MemberVO vo) throws Exception;
	public void pwdchange(MemberVO vo) throws Exception;
	public void withdrawal(MemberVO vo)throws Exception;
	public boolean checkPw(String userId, String userPwd) throws Exception;
	public boolean logincheck(HttpServletRequest request)throws Exception;
}
