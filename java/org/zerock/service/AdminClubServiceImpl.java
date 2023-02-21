package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.AdminClubDTO;
import org.zerock.domain.AdminMemberDTO;
import org.zerock.domain.AdminMyClubDTO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.AdminClubMapper;
import org.zerock.mapper.AdminMemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminClubServiceImpl implements AdminClubService{
	
	private AdminClubMapper mapper;
	
	@Override
	public List<AdminClubDTO> getList() {
		
		log.info("Club List .... " );
		return mapper.getList();
	}
	
	@Override
	public List<AdminClubDTO> getListWithPaging(Criteria cri) {
		log.info("Club Paging List ");
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public AdminClubDTO getRead(Long cno) {
		log.info("Read Cno : " + cno);
		return mapper.getRead(cno);
	}
	
	@Override
	public List<AdminMemberDTO> getMemberRead(Long cno){
		log.info("Read Member List ");
		return mapper.getMemberRead(cno);
	}
	
	@Override
	public void clubRegister(AdminClubDTO dto) {
		log.info("Club Register " + dto);
		mapper.clubRegister(dto);
	}

	@Override
	public void update(AdminClubDTO dto) {
		log.info("Club update" + dto );
		mapper.update(dto);
	}

	@Override
	public List<AdminClubDTO> getManageList() {
		log.info("Club Manage List ....");
		return mapper.getManageList();
	}

	@Override
	public void MemDelete(Long cno) {
		log.info("Club Member Delete" );
		mapper.MemDelete(cno);
	}

	@Override
	public void clubDelete(Long cno) {
		log.info("Club Delete");
		mapper.clubDelete(cno);
	}
	
	@Override
	public int getClubCount() {
		log.info("Club Total Count ");
		return mapper.getClubCount();
	}
	@Override
	public int getTotalCount() {
		log.info("Club Total Count ");
		return mapper.getTotalCount();
	}
	@Override
	public void applyClub(AdminClubDTO dto) {
		log.info("Apply Club");
		mapper.applyClub(dto);
	}

	@Override
	public void wattingDeleteMyClub(Long cno) {
		log.info("TO BE DELETE MY_CLUB");
		mapper.wattingDeleteMyClub(cno);
	}
	@Override
	public void wattingDeleteClub(Long cno) {
		log.info("TO BE DELETE CLUB");
		mapper.wattingDeleteClub(cno);
	}



	
}
