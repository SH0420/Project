package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.AdminClubDTO;
import org.zerock.domain.AdminMemberDTO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.AdminClubService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin_club/*")
@AllArgsConstructor
public class AdminClubController {
	
	@Setter(onMethod_ = @Autowired)
	private AdminClubService service;
	
	
	// 동호회 리스트 
	@RequestMapping("/applist")
	public String appList(Model model) {
		
		log.info("Application Club List : " + service.getList() );
		log.info("Club Count " + service.getClubCount());
		
		model.addAttribute("club" , service.getList());
		model.addAttribute("total" , service.getClubCount());
		return "admin/club/club_Applist";
	}
	
	@GetMapping("/detail")
	public String getDetail(@RequestParam("cno") Long cno , Model model) {

		log.info("Club Get Read " + service.getRead(cno));
		log.info("Get Member Read ... " + service.getMemberRead(cno));
		
		model.addAttribute("detail" , service.getRead(cno));
		model.addAttribute("member" , service.getMemberRead(cno));
		
		
		return "/admin/club/club_detail";
	}
	
	// 신규 동호회 등록 페이지로 이동 
	@GetMapping("/registration")
	public String getClubRegister() {
		log.info("controller Club Registration Page Move .... ");
		return "admin/club/club_registration";
	}
	// 신규 동호회 등록 
	@PostMapping("registration")
	public String postClubRegister(AdminClubDTO dto) {
		log.info("registration " + dto );
		
		service.clubRegister(dto);
		return "redirect:/admin_club/applist";
	}

	// 동호회 신청 승인 or 거절
	@PostMapping("/update")
	public String clubUpdate(AdminClubDTO dto) {
		log.info("Club Update - status : " + dto.getStatus());
		
		int status = Integer.parseInt(dto.getStatus());
		if(status == 01) {
			log.info("Apply Club Member Add : " + dto.getId());
			service.applyClub(dto);
		}
		service.update(dto);
		return "redirect:/admin_club/applist";
	}
	
	// 동호회 관리 페이지로 이동 
	@GetMapping("/management")
	public String clubManagement(Criteria cri, Model model) {
		log.info("list :" + cri);
		log.info("Club Manage Pasing List" + service.getListWithPaging(cri));
		
		log.info("Club Manage List " + service.getManageList());
		int total = service.getTotalCount();
		model.addAttribute("club" , service.getListWithPaging(cri));

		model.addAttribute("pageMaker", new PageDTO(cri, total));
		// model.addAttribute("club" , service.getManageList());
		return "admin/club/club_management";
	}
	
	// 동호회 삭제 
	@GetMapping("delete")
	public String clubDelete(@RequestParam("cno") Long cno) {
		
		log.info("Member Delete..... ");
		log.info("Club Delete.....");
		service.MemDelete(cno);
		service.clubDelete(cno);
		return "redirect:/admin_club/management";
	}
	
	// 동호회 삭제 안내 
	@GetMapping("/waittingClub")
	public String waittingClub(@RequestParam("cno") Long cno) {
		log.info("To be Deleted Club ");
		service.wattingDeleteClub(cno);
		service.wattingDeleteMyClub(cno);
		
		return "redirect:/admin_club/management";
	}
}
