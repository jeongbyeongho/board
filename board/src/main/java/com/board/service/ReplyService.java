package com.board.service;

import java.util.List;

import com.board.domain.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> list(int num) throws Exception;
	public void write(ReplyVO vo) throws Exception;
	public void modify(ReplyVO vo)throws Exception;
	public void delete(ReplyVO vo)throws Exception;
}
