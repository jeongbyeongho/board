package com.board.controller;


import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

// import com.board.dao.BoardDAO;
import com.board.domain.BoardVO;
import com.board.domain.MemberVO;
import com.board.domain.Page;
import com.board.domain.ReplyVO;
import com.board.service.BoardService;
import com.board.service.ReplyService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	 
	@Inject
	private BoardService service;
	
	@Inject
	private ReplyService replyService;
	
	// 게시물 목록
	@GetMapping("/getInfo")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	// get방식으로 왔을 때만 로직 수행
	 public void getList(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception {  
		PrintWriter out = response.getWriter();
		String referer = request.getHeader("referer");
		if(referer == null) {
			out.println("<script>location.href='/listPageSerach?=num1'</script>");
		}

		
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
	public String postWrite(BoardVO vo,HttpSession session,Model model) throws Exception{
		MemberVO member = (MemberVO)session.getAttribute("member");
		vo.setUserId(member.getUserId());
		model.addAttribute("id",vo);
		model.addAttribute("write", vo);
		service.write(vo);
		return "redirect:/board/listPageSearch?num=1";
		// 모든 작업을 마치고 /board/list, 게시물 목록 화면으로 이동
	}
	
/*	// 게시물 작성
	@RequestMapping(value ="/write", method = RequestMethod.POST)
	// post 방식으로 왔을 때만 로직 수행, get,post 상관없이 로직 수행을 위해선 method 부분 지우면 됨
	public String postWrite(BoardVO vo) throws Exception{
		service.write(vo);
		return "redirect:/board/listPageSearch?num=1";
		// 모든 작업을 마치고 /board/list, 게시물 목록 화면으로 이동
	}
*/
	
	// 게시물 조회
	@RequestMapping(value ="/view", method = RequestMethod.GET)
	public void getView(@RequestParam("num") int num, Model model) throws Exception{
		BoardVO vo = service.view(num);
		model.addAttribute("view", vo);
		model.addAttribute("write", vo);
		List<ReplyVO> reply = null;
		reply = replyService.list(num);
		model.addAttribute("reply",reply);
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
		 public void getListPage(Model model, @RequestParam("num")int num, @RequestParam("searchType")String searchType,
				 @RequestParam("keyword")String keyword) throws Exception {
			
			Page page = new Page();
			// page형의 page변수를 생성함
			page.setNum(num);
			page.setCount(service.count());
			
			
			List<BoardVO> list = null;
			list = service.listPage(page.getDisplayPost(), page.getPostNum());
			
			model.addAttribute("list",list);
			model.addAttribute("page",page);
			model.addAttribute("select", num);
		}
			
			
			@RequestMapping(value="/listPageSearch", method = RequestMethod.GET)
			public void getListPageSearch(Model model, @RequestParam("num")int num,
					@RequestParam(value="searchType",required=false, defaultValue="title") String searchType,
					@RequestParam(value="keyword",required=false, defaultValue="") String keyword) throws Exception{
				
				
				Page page = new Page();
				// Page형의 page변수 생성
				page.setNum(num);
				//page.setCount(service.count());
				page.setCount(service.searchCount(searchType,keyword));
				//page.setSearchTypeKeyword(searchType, keyword);
				page.setSearchType(searchType);
				page.setKeyword(keyword);
				
				List<BoardVO> list = null;
				list= service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
				
				model.addAttribute("list",list);
				// key, value를 쌍으로 하여 전달
				model.addAttribute("page",page);
				model.addAttribute("select",num);
				
//				model.addAttribute("searchType",searchType);
//				model.addAttribute("keyword",keyword);
				
			}
			
			
	}
	

