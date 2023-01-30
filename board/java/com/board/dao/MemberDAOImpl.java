package com.board.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.board.domain.MemberVO;

@Service
public class MemberDAOImpl implements MemberDAO{
	
	//mybatis
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.board.mappers.memberMapper";
	
	// 회원가입

	@Override
	public void register(MemberVO vo) throws Exception{
		sql.insert(namespace+".register",vo);
	}
	

	// 로그인
	
	@Override
	public MemberVO login(MemberVO vo) throws Exception{
		return sql.selectOne(namespace + ".loginBcrypt", vo);
	}
	
	@Override
	public MemberVO logincheck(HashMap<String, String> map) throws Exception {
	return sql.selectOne(namespace + ".login", map);
	}
	
	@Override
	public MemberVO idCheck(String userId) throws Exception{
		return sql.selectOne(namespace +".idCheck",userId);
		
	}
	@Override
	public void change(MemberVO vo)throws Exception{
		sql.update(namespace+".change",vo);
	}
	
	@Override
	public void pwdchange(MemberVO vo) throws Exception{
		sql.update(namespace+".pwdchange",vo);
	}
	@Override
	public void withdrawal(MemberVO vo)throws Exception{
		sql.delete(namespace+".withdrawal",vo);
	}
	@Override
	public boolean checkPw(String userId, String userPwd) throws Exception{
		boolean result = false;
		Map<String, String> map = new HashMap<String,String>();
		map.put("userId",userId);
		map.put("userPwd",userPwd);
		int count = sql.selectOne(namespace+".checkPw",map);
		if(count==1) result=true;
		return result;
	}
}
