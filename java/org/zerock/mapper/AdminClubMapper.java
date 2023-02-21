package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.AdminClubDTO;
import org.zerock.domain.AdminMemberDTO;
import org.zerock.domain.Criteria;

public interface AdminClubMapper {

	// 동호회 리스트 
	public List<AdminClubDTO> getList();
	public List<AdminClubDTO> getListWithPaging(Criteria cri);
	
	// 동호회 상세보기 
	public AdminClubDTO getRead(Long cno);
	
	// 동호회 활동 맴버 리스트 
	public List<AdminMemberDTO> getMemberRead(Long cno);
	
	// 새로운 동호회 등록 
	public void clubRegister(AdminClubDTO dto);
	
	// 동호회 승인 /거절 업데이트 
	public void update(AdminClubDTO dto);
	
	// 등록된 동호회 리스트 
	public List<AdminClubDTO> getManageList();
	
	//삭제하려는 동호회에 가입된 사람들 삭제 
	public void MemDelete(Long cno);
	
	//동호회 삭제
	public void clubDelete(Long cno);
	
	// 승인 대기중인 동호회 개수
	public int getClubCount();

	// 승인된 동호회 개수
	public int getTotalCount();
	
	// 승인시 신청한 인원 자동 가입 
	public void applyClub(AdminClubDTO dto);
	
	// 삭제 예정 동호회에 가입된 사람들의 상태 변경 -> 삭제 예정 
	public void wattingDeleteMyClub(Long cno);
	// 삭제 예정 동호회의 기존 이름 변경 
	public void wattingDeleteClub(Long cno);

	
}
