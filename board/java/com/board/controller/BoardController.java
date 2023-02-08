package com.board.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	private static final Logger Logger = LoggerFactory.getLogger(BoardController.class); 
	
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
		Logger.info("게시물 작성 GET");
		Object loginInfo = session.getAttribute("member");
		
		if(loginInfo == null) {
			model.addAttribute("msg",false);
		}
		
	}
	
	// 게시물 작성
	@RequestMapping(value ="/write", method = RequestMethod.POST)
	// post 방식으로 왔을 때만 로직 수행, get,post 상관없이 로직 수행을 위해선 method 부분 지우면 됨
	public String postWrite(BoardVO vo,HttpSession session,Model model, MultipartHttpServletRequest mpRequest) throws Exception{
		Logger.info("글 작성");
		
				
		MemberVO member = (MemberVO)session.getAttribute("member");
		vo.setUserId(member.getUserId());
		model.addAttribute("id",vo);
		model.addAttribute("write", vo);
		service.write(vo,mpRequest);
	
		return "redirect:/board/listPageSearch?num=1";
		// 모든 작업을 마치고 /board/list, 게시물 목록 화면으로 이동
	}
	
	// 게시물 조회
	@RequestMapping(value ="/view", method = RequestMethod.GET)
	public void getView(@RequestParam("num") int num, Model model) throws Exception{
		Logger.info("게시물 조회");
		BoardVO vo = service.view(num);
		model.addAttribute("view", vo);
		model.addAttribute("write", vo);
		List<ReplyVO> reply = null;
		reply = replyService.list(num);
		model.addAttribute("reply",reply);
		
		List<Map<String, Object>> fileList = service.selectFileList(vo.getNum());
		model.addAttribute("file",fileList);
	}
	// 게시물 수정
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("num") int num, Model model) throws Exception{
		Logger.info("게시물 수정 GET");
		BoardVO vo = service.view(num); 
		model.addAttribute("views", vo);
		
		List<Map<String, Object>> fileList = service.selectFileList(vo.getNum());
		model.addAttribute("file", fileList);
	}
	
	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(BoardVO vo,@RequestParam(value="fileNoDel[]") String[] files,
			@RequestParam(value="fileNameDel[]")String[] fileNames,MultipartHttpServletRequest mpRequest) throws Exception {
		Logger.info("게시물 수정 POST");
		service.modify(vo,files,fileNames,mpRequest);
		return "redirect:/board/view?num=" + vo.getNum();
	}
	
	// 게시물 삭제
	@RequestMapping(value ="/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("num")int num) throws Exception{
		Logger.info("게시물 삭제 GET");
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
				
				Logger.info("리스트 페이지입니다.");
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
			
			// 파일 다운로드
			@RequestMapping(value="/fileDown")
			public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
				Logger.info("파일 다운로드");
				Map<String, Object> resultMap = service.selectFileInfo(map);
				String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
				String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
				
				// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
				byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("D:\\upload\\"+storedFileName));
				
				response.setContentType("application/octet-stream");
				response.setContentLength(fileByte.length);
				response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
				response.getOutputStream().write(fileByte);
				response.getOutputStream().flush();
				response.getOutputStream().close();
				
			}
			
		/*
			@RequestMapping(value="/fileDownload", method=RequestMethod.GET)
			public void fileDownload(HttpServletRequest req, HttpServletResponse response,Model model,@RequestParam("num")int num)throws Exception{
				BoardVO vo = service.view(num);
				model.addAttribute("view", vo);
				
				String filename = req.getParameter("file_name");
				String realFilename="";
				System.out.println(filename);
				
				
				try {
					String browser = req.getHeader("User-Agent");
					if(browser.contains("MSIE")||browser.contains("Trident")||browser.contains("Chrome")) {
						filename=URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
					}else {
						filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
						
					}		
				} catch(UnsupportedEncodingException ex) {
					System.out.println("UnsupportedEncodingException");
				}
				realFilename = "D:\\upload\\" + filename;
				System.out.println(realFilename);
				File file1 = new File(realFilename);
				if(!file1.exists()) {
					return ;
				}
				
				response.setContentType("application/octer-stream");
				response.setHeader("content-Transfer-Encoding", "binary;");
				response.setHeader("content-Disposition", "attachment); filename=\""+ filename+"\"");
				try {
					OutputStream os = response.getOutputStream();
					FileInputStream fis = new FileInputStream(realFilename);
					
					int ncount = 0;
					byte[] bytes = new byte[512];
					
					while((ncount = fis.read(bytes)) != -1) {
						os.write(bytes,0,ncount);
					}
					fis.close();
					os.close();
				} catch(Exception e) {
					System.out.println("FileNotFoundException : " + e);
				}
			} */
			
	}
	

