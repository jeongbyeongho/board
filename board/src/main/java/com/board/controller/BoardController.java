package com.board.controller;


import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		return "redirect:/board/listPageSearch?num=1";
		// 모든 작업을 마치고 /board/list, 게시물 목록 화면으로 이동
	}
	
	// 게시물 조회
	@RequestMapping(value ="/view", method = RequestMethod.GET)
	public void getView(@RequestParam("num") int num, Model model) throws Exception{
		BoardVO vo = service.view(num);
		model.addAttribute("view", vo);
	}
	// 게시물 수정
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("num") int num, Model model) throws Exception{
		BoardVO vo = service.view(num); 
		model.addAttribute("views", vo);
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
			// page의 데이터 전부를 view로 전달함
			model.addAttribute("select", num);
		}
			
		
			@RequestMapping(value="/listPageSearch", method = RequestMethod.GET)
			public void getListPageSearch(Model model, @RequestParam("num")int num,
					@RequestParam(value="searchType",required=false, defaultValue="title") String searchType,
					@RequestParam(value="keyword",required=false, defaultValue="") String keyword) throws Exception{
				
				Page page = new Page();
				// Page형의 page변수 생성
			
				page.setNum(num);
				page.setCount(service.count());
				
				List<BoardVO> list = null;
				list= service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
				
				model.addAttribute("list",list);
				// key, value를 쌍으로 하여 전달
				model.addAttribute("page",page);
				model.addAttribute("select",num);
				
			}
			
			
	}
	

