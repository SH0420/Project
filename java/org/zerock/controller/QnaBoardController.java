package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.domain.ReplyVO;
import org.zerock.service.QnaBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/qnaboard/*")
@AllArgsConstructor
public class QnaBoardController {  //컨트롤러 부분
	
	private QnaBoardService service;  // 단일 생성자 자동 주입
	
	//@RequestMapping(value="/list", method=RequestMethod.POST)  // 전체 목록을 가져오는 처리
	@RequestMapping("/qnalist")
	public String qnalist(Model model, @ModelAttribute BoardVO board) {
		log.info("list");
		
		//
		int total = service.getListCount(board);
		
		model.addAttribute("pageMaker", new PageDTO(board, total));
		model.addAttribute("cateList", service.getCategoryList(board));
		model.addAttribute("list", service.getList(board));
		model.addAttribute("board", board); //모델 객체에 담아 전달
		log.info(model);  //모델객체 로그찍어보기
		
		return "Community/QnaBoardList"; //커뮤니티/자유게시판리스트로 반환
	}
	
	//글 작성폼에 있는 카테고리 리스트 기능
	@RequestMapping("/register")
	public String register(Model model, @ModelAttribute BoardVO board) {
		log.info("list");

		//
		model.addAttribute("cateList", service.getCategoryList(board));
	
		return "Community/QnaBoardWrite";
	}
	
	//글 작성하고 등록하는 처리
	@RequestMapping("/registerProc")          	 
	public String registerProc(Model model, @ModelAttribute BoardVO board) {  // 커맨드 객체 BoardVO에서 값을 자동으로 받아서 생성
		// RedirectAttributes의 addFlashAttribute -> 한번 사용할 데이터를 이동하는 페이지에 정보 전달 
		log.info("list");

		//디비에 들어갈 때 사용할 구문이 된다.
		service.register(board);
		
		
		return "redirect:/qnaboard/qnalist";
	}
	
	// 조회 처리 (수정 후)
	//@RequestMapping(value="/read", method= RequestMethod.GET)
	@GetMapping({"/read", "/update"})
//	@PreAuthorize(lvo.id || lvo.admin)
	public String read(@RequestParam("bno") Long bno , @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("read or update.....");
		
		BoardVO board = new BoardVO();
		log.info("Reply Get ....." + service.getReply(bno));
		
		
		model.addAttribute("cateList", service.getCategoryList(board));
		model.addAttribute("board", service.read(cri.getBno()));
		model.addAttribute("reply" , service.getReply(bno));
		
		return "Community/QnaBoardDetail";
	}
	
	//수정 처리
	@RequestMapping("/update") 
	public String update(@ModelAttribute BoardVO board, @ModelAttribute("cri") Criteria cri, Model model, RedirectAttributes rttr) {
		
		log.info("update : " + board);
		
		if(service.update(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/qnaboard/qnalist";
	}
	
	// 삭제 처리 (수정 후)
	@PostMapping("/delete")  
	public String delete(@RequestParam("bno") Long bno, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		
		log.info("delete...." + bno);
		
		if(service.delete(bno)) {
			
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/qnaboard/qnalist";
	}
};