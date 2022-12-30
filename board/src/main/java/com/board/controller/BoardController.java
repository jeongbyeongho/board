package com.board.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

// import com.board.dao.BoardDAO;
import com.board.domain.BoardVO;
import com.board.domain.Page;
import com.board.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	 
	@Inject
	private BoardService service;
	
	
	// 게시물 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	// get방식으로 왔을 때만 로직 수행
	 public void getList(Model model) throws Exception {  
		List<BoardVO> list = null;
		list = service.list();
		model.addAttribute("list", list);
		
	}
	
	
	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite(HttpSession session, Model model) throws Exception{
	
		
		Object loginInfo = session.getAttribute("member");
		
		if(loginInfo == null) {
			model.addAttribute("msg",false);
		}
		
	}
	
	// 게시물 작성
	@RequestMapping(value ="/write", method = RequestMethod.POST)
	// post 방식으로 왔을 때만 로직 수행, get,post 상관없이 로직 수행을 위해선 method 부분 지우면 됨
	public String postWrite(BoardVO vo) throws Exception{
		service.write(vo);
		
		return "redirect:/board/listPageSearch";
		// 모든 작업을 마치고 /board/list, 게시물 목록 화면으로 이동
	}
	
	// 게시물 조회
	@RequestMapping(value ="/view", method = RequestMethod.GET)
	public void getView(@RequestParam("num") int num, Model model) throws Exception{
		service.view(num);
		BoardVO vo = service.view(num);
		model.addAttribute("view", vo);
	}
	
	// 게시물 수정
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("num") int num, Model model) throws Exception{
		BoardVO vo = service.view(num);
		model.addAttribute("view", vo);
	}
	
	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(BoardVO vo) throws Exception {
		service.modify(vo);
		
		return "redirect:/board/view?num=" + vo.getNum();
	}
	
	// 게시물 삭제
	@RequestMapping(value ="/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("num")int num) throws Exception{
		service.delete(num);
		
		return "redirect:/board/listPageSearch?num=1";
	}
	
//	// 조회수 증가
//	@RequestMapping(value="/views", method=RequestMethod.GET)
//	public String readReply(BoardVO vo,@RequestParam("num") int num, @ModelAttribute("cri") Criteria cri,Model model)throws Exception{
//		logger.info("read");
//		service.views(num);
//		
//		model.addAttribute("BoardVO",service.views(num));
//		
//		model.addAttribute("cri",cri);
//		
//		
//		
//		
//	}
	
	// 게시물 목록 + 페이징
		@RequestMapping(value = "/listPage", method = RequestMethod.GET)
		// get방식으로 왔을 때만 로직 수행
		 public void getListPage(Model model, @RequestParam("num")int num) throws Exception {
			
			Page page = new Page();
			// page형의 page변수를 생성함
			page.setNum(num);
			page.setCount(service.count());
			
			List<BoardVO> list = null;
			list = service.listPage(page.getDisplayPost(), page.getPostNum());
			
			model.addAttribute("list",list);
//			model.addAttribute("pageNum", page.getStartPageNum());
//			
//			model.addAttribute("startPageNum", page.getStartPageNum());
//			model.addAttribute("endPagenum", page.getEndPageNum());
//			
//			model.addAttribute("prev",page.getPrev());
//			model.addAttribute("next",page.getNext());
			
			model.addAttribute("page",page);
			model.addAttribute("select", num);
		}
			
			
			
			
			
//			// 게시물 총 갯수
//			int count = service.count();
//			
//			// 한 페이지에 출력할 게시물 갯수
//			int postNum = 10;
//			
//			// 하단 페이징 번호 ( 게시물 총 갯수 + 한 페이지에 출력할 갯수 )의 올림
//			int pageNum = (int)Math.ceil((double)count/postNum);
//			
//			// 출력할 게시물
//			int displayPost = (num - 1) * postNum;
//			
//			// 한번에 표시할 페이징 번호의 갯수
//			int pageNum_cnt = 10;
//			
//			// 표시되는 페이지 번호 중 마지막 번호
//			int endPageNum = (int)(Math.ceil((double)num/(double)pageNum_cnt)*pageNum_cnt);
//			
//			// 표시되는 페이지 번호 중 첫번째 번호
//			int startPageNum = endPageNum - (pageNum_cnt - 1);
//			
//			// 마지막 페이지 번호 = ((올림)(현재 페이지 번호 / 한번에 표시할 페이지 번호의 갯수))* 한번에 표시할 페이지 번호의 갯수
//			int endPageNum_tmp = (int)(Math.ceil((double)num / (double)pageNum_cnt)*pageNum_cnt);
//			
//			if(endPageNum>endPageNum_tmp) {
//				endPageNum = endPageNum_tmp;
//			}
//			boolean prev = startPageNum == 1 ? false: true;
//			boolean next = endPageNum * pageNum_cnt >= count ? false: true;
//			
//			
//			
//			List<BoardVO> list = null;
//			list = service.listPage(displayPost,postNum);
//			model.addAttribute("list", list);
//			model.addAttribute("pageNum",pageNum);
//			
//			// 시작 및 끝 번호
//			model.addAttribute("startPageNum", startPageNum);
//			model.addAttribute("endPageNum", endPageNum);
//			
//			// 이전 및 다음
//			model.addAttribute("prev",prev);
//			model.addAttribute("next",next);
//			
//			// 현재 페이지
//			model.addAttribute("select",num);
			
			@RequestMapping(value="/listPageSearch", method = RequestMethod.GET)
			public void getListPageSearch(Model model, @RequestParam("num")int num,
					@RequestParam(value="searchType",required=false, defaultValue="title") String searchType,
					@RequestParam(value="keyword",required=false, defaultValue="") String keyword) throws Exception{
				
				Page page = new Page();
				
				page.setNum(num);
				page.setCount(service.count());
				
				List<BoardVO> list = null;
//				list = service.listPage(page.getDisplayPost(), page.getPostNum());
				list= service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
				
				model.addAttribute("list",list);
				model.addAttribute("page",page);
				model.addAttribute("select",num);
				
			}
			
			
	}
	

