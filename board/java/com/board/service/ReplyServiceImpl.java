package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.ReplyDAO;
import com.board.domain.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Inject
	private ReplyDAO dao;
	
	@Override
	public List<ReplyVO> list(int num) throws Exception{
		return dao.list(num);
	}
	@Override
	public void write(ReplyVO vo)throws Exception{
		dao.write(vo);
	}
	@Override
	public void modify(ReplyVO vo)throws Exception{
		dao.modify(vo);
	}
	@Override
	public void delete(ReplyVO vo)throws Exception{
		dao.delete(vo);
	}
	@Override
	public ReplyVO replySelect(ReplyVO vo)throws Exception{
		return dao.replySelect(vo);
	}
}
