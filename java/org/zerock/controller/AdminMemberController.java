package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.AdminMemberDTO;
import org.zerock.service.AdminMemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin_member/*")
@AllArgsConstructor
public class AdminMemberController {
	
	AdminMemberService service;
	
	@RequestMapping("/management")
	public String Member_management(Model model , AdminMemberDTO dto) {
		log.info("Member List : " + service.getList());
		log.info("Member Total : " + service.getTotal());
		
		
		model.addAttribute("total" , service.getTotal());
		model.addAttribute("list" , service.getList());
		return "admin/management/member_management";
	}
	
	@PostMapping("delete")
	public String memberDelete(@RequestParam("empno") String empno , @RequestParam("id") String id){
		log.info("DELETE ....  id : " + id + " //  empno : " +  empno );
		
		 service.downCount(id); 
		 service.memberDelete(empno);
		
		return "redirect:/admin_member/management";
	}
	
	
	

}
