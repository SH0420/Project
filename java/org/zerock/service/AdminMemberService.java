package org.zerock.service;

import java.util.List;

import org.zerock.domain.AdminClubDTO;
import org.zerock.domain.AdminMemberDTO;

public interface AdminMemberService {

	// 회원 리스트 
	public List<AdminMemberDTO> getList();
	
	public int getTotal();
	
	public void memberDelete(String empno);
	public void downCount(String id);
}
