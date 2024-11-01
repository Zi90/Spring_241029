package com.ezen.spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.spring.domain.BoardDTO;
import com.ezen.spring.domain.BoardVO;
import com.ezen.spring.domain.FileVO;
import com.ezen.spring.domain.PagingVO;
import com.ezen.spring.handler.FileHandler;
import com.ezen.spring.handler.PagingHandler;
import com.ezen.spring.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/board/*")
@Controller
public class BoardController {
	// 생성자 주입시 객체는 final로 생성
	private final BoardService bsv;
	private final FileHandler fh;
	
	// return void => 온 경로 그대로 리턴 /board/register => /board/register.jsp
	@GetMapping("/register")
	public void register() {}
	
	// 첨부파일 => multipartFile / 여러 개... multipartFile[]
	@PostMapping("/insert")
	public String insert(BoardVO bvo, MultipartFile[] files) {
		log.info(">>> insert bvo > {}", bvo);
		List<FileVO> flist = null;

		if(files[0].getSize() > 0) {
			// 파일의 내용이 있다면
			flist = fh.uploadFiles(files);
			log.info(">>>>> flist > {}", flist);
		}
			
		// files 정보를 이용하여 => List<FileVO> 변환을 하는 핸들러
		// fileHandler => return List<FileVO> + 파일 저장
		
		BoardDTO bdto = new BoardDTO(bvo, flist); // bvo.flist 
//		int isOk = bsv.insert(bvo);
		int isOk = bsv.insert(bdto);
		log.info(">>> insert > {}", isOk > 0 ? "OK" : "FAIL");
		// /WEB-INF/views/.jsp (x)
		// 컨트롤러의 mapping 위치로 연결할 때 redirect:/board/list
		return "redirect:/";
	}
	
	@GetMapping("/list")
	public String list(Model m, PagingVO pgvo) {
		// request.setAttrbute()
		// Model 객체가 해당 일을 대신해줌.
//		PagingVO pgvo = new PagingVO();
		List<BoardVO> list = bsv.getList(pgvo);
		// totalcount 구해서 PagingHandler에 매개변수로 전달
		int totalCount = bsv.getTotal(pgvo);
		PagingHandler ph = new PagingHandler(totalCount, pgvo);
		log.info(">>> totalCount > {}", totalCount);
		m.addAttribute("list",list);
		m.addAttribute("ph",ph);
		return "/board/list";
	}
	
	@PostMapping("/update")
	public String update(BoardVO bvo) {
		int isOk = bsv.modify(bvo);
		log.info(">>> update > {}", isOk > 0 ? "OK" : "FAIL");
		
		// detail.jsp로 이동 X => controller detail mapping으로 이동 => redirect:/
		return "redirect:/board/detail?bno="+bvo.getBno();
	}
	
	// @ requestParam("bno") int bno => 전달되는 파라미터가 여러 개일 경우 이름을 명시
	// return void : 요청 경로로 응답을 그대로 보냄. /board/detail => /board/detail.jsp
	@GetMapping({"/detail", "/modify"})
	public void detail(int bno, Model m) {
		// bno에 해당하는 BoardVO 객체를 DB에서 가져와서 모델로 전달
//		BoardVO bvo = bsv.getDetail(bno);
//		m.addAttribute("bvo", bvo)
		BoardDTO bdto = bsv.getDetail(bno);
		m.addAttribute("bdto", bdto);
//		return "/board/detail";
	}
	
	@GetMapping("/delete")
	public String delete(int bno) {
		int isOk = bsv.delete(bno);
		log.info(">>> delete > {}", isOk > 0 ? "OK" : "FAIL");
		return "redirect:/board/list";
	}
	
	
}
