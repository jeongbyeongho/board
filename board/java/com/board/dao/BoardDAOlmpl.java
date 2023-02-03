package com.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.BoardVO;

@Repository
public class BoardDAOlmpl implements BoardDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.board.mappers.board";
	
	//게시물 목록
	@Override
	public List<BoardVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".list");
		// selectList : 쿼리 결과를 List<E>로 반환, 결과가 없을 땐 null이 아닌 빈 List 반환
	} 

	// 게시물 작성
	@Override
	public void write(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".write", vo);
	}
	
	// 게시물 조회
	@Override
	public BoardVO view(int num) throws Exception{
		return sql.selectOne(namespace+ ".view",num);
		// selectOne -> 쿼리 결과가 없으면 null 반환
	}
	// 게시물 수정
	@Override
	public void modify(BoardVO vo) throws Exception{
		sql.update(namespace + ".modify",vo);
	}
	
	// 게시물 삭제
	public void delete(int num) throws Exception{
		sql.delete(namespace + ".delete",num);
	}
	
	// 게시물 총 갯수
	@Override
	public int count() throws Exception{
		return sql.selectOne(namespace+".count");
	}
	// 게시물 조회수 증가
	@Override
	public void updateViewCnt(int num) throws Exception{
		sql.update(namespace + ".updateViewCnt",num);
	}

	@Override
	// 게시물 목록, 페이징
	public List<BoardVO> listPage(int displayPost,int postNum) throws Exception{
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		// displayPost, postNum
		data.put("displayPost",displayPost);
		data.put("postNum",postNum);
		
		return sql.selectList(namespace+".listPage",data);
	}
	
	// 게시물 목록 + 페이징 + 검색
	@Override
	public List<BoardVO> listPageSearch(
			int displayPost, int postNum, String searchType, String keyword) throws Exception{
				HashMap<String, Object> data = new HashMap<String, Object>();
				
				data.put("displayPost", displayPost);
				data.put("postNum", postNum);
				
				data.put("searchType", searchType);
				data.put("keyword", keyword);
				
				return sql.selectList(namespace + ".listPageSearch", data);
	}
	@Override
	public int searchCount(String searchType, String keyword)throws Exception{
		HashMap<String,String> data = new HashMap<String,String>();
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sql.selectOne(namespace+".searchCount",data);
		
	}
	
	
	

}
