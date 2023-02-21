package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.AdminClubDTO;
import org.zerock.domain.ClubDTO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.ClubService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/club/*")
@AllArgsConstructor
public class ClubController {
	
	private ClubService service;

	@GetMapping("/newclubapply")
	public String Club_Apply() {
		
		return "/Club_Application/NewClubApply";	
	}
	
	@GetMapping("/clubapply")
	public String NewClub() {
		
		return "/Club_Application/Club_Apply";	
	}
	@GetMapping("/clubinfo")
	public String Clubinfo() {
		
		return "/Club_Application/Club_info";	
	}

	@GetMapping("/leisure")
	public String leisurelist(Criteria cri, Model model) {
		log.info("leisure");
		model.addAttribute("list", service.getLeisureWithPaging(cri));
		return "/Menu_Introduction/leisure";
	}

	@GetMapping("/exercise")
	public String exerciselist(Criteria cri, Model model) {
		log.info("exercise");
		model.addAttribute("list", service.getExerciseWithPaging(cri));
		return "/Menu_Introduction/exercise";
	}

	@GetMapping("/travel")
	public String travellist(Criteria cri, Model model) {
		log.info("travel");
		model.addAttribute("list", service.getTravelWithPaging(cri));
		return "/Menu_Introduction/travel";
	}

	@GetMapping("/study")
	public String studylist(Criteria cri, Model model) {
		log.info("study");
		model.addAttribute("list", service.getStudyWithPaging(cri));
		return "/Menu_Introduction/study";
	}

	@GetMapping("/detail")
	public String getlist(@RequestParam("cno")Long cno, Model model) {

		log.info("detail cno = " + cno);

		log.info(service.getlist(cno));
		
		ClubDTO dto = service.getlist(cno);
		
		model.addAttribute("list" , dto );
		
		return "/Menu_Introduction/detail";
	}
	
	@PostMapping("/apply")
	public String appClub(AdminClubDTO dto) {
		log.info("Apply Club .... :  " + dto );
		service.apply(dto);
		return "redirect:/club/list";
	}	
	@GetMapping("/list")
	public String clublist(Criteria cri ,Model model) {
		log.info("club");
		
		model.addAttribute("list", service.getList1(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri, 123));
		int total =service.getTotal(cri);
		log.info("total:" + total);
		log.info(service.getList1(cri));
		model.addAttribute("pageMaker", new PageDTO(cri ,total));
		
		return "/Club_Application/Club_Apply";
	}
	
	
	@PostMapping("/update")
	public String update(ClubDTO dto, Model model) {
		
		log.info("update : " + dto );
		
		service.updatecount(dto);
		service.club_insert(dto);
		return "redirect:/club/list";
	
	}
	
}
