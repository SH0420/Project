package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.AdminClubDTO;
import org.zerock.domain.AdminMemberDTO;
import org.zerock.mapper.AdminMemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminMemberServiceImpl implements AdminMemberService{
	
	
	private AdminMemberMapper mapper;
	
	@Override
	public List<AdminMemberDTO> getList() {
		return mapper.getList();
	}
	
	@Override
	public int getTotal() {
		return mapper.getTotal();
	}

	@Override
	public void memberDelete(String empno) {
		log.info("member Delete");
		mapper.memberDelete(empno);
	}
	
	@Override
	public void downCount(String id) {
		log.info("Down Count");
		mapper.downCount(id);
	}

}
