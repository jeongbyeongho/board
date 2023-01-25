package com.board.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.domain.ReplyVO;
import com.board.service.ReplyService;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {
	
	@Inject
	private ReplyService replyService;
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String postWrite(ReplyVO vo)throws Exception{
		
		replyService.write(vo);
		return "redirect:/board/view?num="+vo.getNum();
	}
	// 댓글 단일 조회 (수정 페이지)
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getMofidy(@RequestParam("num") int num, @RequestParam("rnum") int rnum, Model model) throws Exception {
	    
	    ReplyVO vo = new ReplyVO();
	    vo.setNum(num);
	    vo.setRnum(rnum);
	    
	    ReplyVO reply = replyService.replySelect(vo);
	         
	    model.addAttribute("reply", reply);
	}
	
	// 댓글 수정
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String postModify(ReplyVO vo)throws Exception{
		
		replyService.modify(vo);
		
		return "redirect:/board/view?num=" + vo.getNum();
		
	}

	
	// 댓글 삭제
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String replyDelete(ReplyVO vo)throws Exception{
		replyService.delete(vo);
		return "redirect:/board/view?num="+vo.getNum();
		
	}
}
