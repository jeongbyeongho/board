package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.ReplyVO;
@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession sql;
	private static String namespace = "com.board.mappers.replyMapper";
	
	@Override
	public List<ReplyVO> list(int num) throws Exception{
		return sql.selectList(namespace+".replyList",num);
	}
	@Override
	public void write(ReplyVO vo) throws Exception{
		sql.insert(namespace+".replyWrite",vo);
	}
	@Override
	public void modify(ReplyVO vo)throws Exception{
		sql.update(namespace+".replyModify",vo);
	}
	@Override
	public void delete(ReplyVO vo)throws Exception{
		sql.delete(namespace+".replyDelete",vo);
	}
}
