package com.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.board.dao.BoardDAO;
import com.board.domain.BoardVO;
import com.board.util.FileUtils;


@Service
public class BoardServicelmpl implements BoardService {
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Inject
	private BoardDAO dao;


	// 게시물 목록
	@Override
	public List<BoardVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

	// 게시물 작성
	@Override
	public void write(BoardVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(vo,mpRequest);
		int size = list.size();
		for(int i = 0; i<size; i++) {
			dao.insertFile(list.get(i));
		}
		
	}
	// 게시물 조회
	@Override
	public BoardVO view(int num) throws Exception{
		// dao.view(num);
		dao.updateViewCnt(num);
		return dao.view(num);
	}
	
	//첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int num) throws Exception{
		return dao.selectFileList(num);
	}
	
	//첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception{
		return dao.selectFileInfo(map);
	}
	// 게시물 수정
	@Override
	public void modify(BoardVO vo,String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception{
		dao.modify(vo);
		
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(vo,files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i=0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				dao.insertFile(tempMap);
			}else {
				dao.updateFile(tempMap);
			}
		}
	}
	// 게시물 삭제
	@Override
	public void delete(int num) throws Exception{
		dao.delete(num);
	}
	// 게시물 총 갯수
	@Override
	public int count() throws Exception{
		return dao.count();
	}
	// 게시글 목록 + 페이징
	@Override
	public List<BoardVO> listPage(int displayPost, int postNum)throws Exception{
		return dao.listPage(displayPost, postNum);
	}
	
	@Override
	public List<BoardVO> listPageSearch(
			int displayPost, int postNum, String searchType, String keyword)throws Exception{
		return dao.listPageSearch(displayPost, postNum, searchType,keyword);
	}

	@Override
	public int searchCount(String searchType, String keyword)throws Exception{
		return dao.searchCount(searchType, keyword);
	}
}
