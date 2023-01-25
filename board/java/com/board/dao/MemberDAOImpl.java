package com.board.dao;

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
		return sql.selectOne(namespace + ".login", vo);
	}
	
	@Override
	public MemberVO idCheck(String userId) throws Exception{
		return sql.selectOne(namespace +".idCheck",userId);
		
	}
	@Override
	public void change(MemberVO vo)throws Exception{
		sql.update(namespace+".change",vo);
	}
}
