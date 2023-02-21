package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.AdminClubDTO;
import org.zerock.domain.ClubDTO;
import org.zerock.domain.Criteria;

public interface ClubMapper {
	
	public List<ClubDTO> mainList1();
	
	public List<ClubDTO> mainList2();
	
//	public List<ClubDTO> getList1();
	
	public List<ClubDTO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);

	public List<ClubDTO> getExerciseWithPaging(Criteria cri);
	
	public List<ClubDTO> getLeisureWithPaging(Criteria cri);

	public List<ClubDTO> getTravelWithPaging(Criteria cri);

	public List<ClubDTO> getStudyWithPaging(Criteria cri);

	public List<ClubDTO> getDetailWithPaging(Criteria cri);

	public ClubDTO getlist(Long cno);

	public int updatecount(ClubDTO dto);
	
	public void insertSelectKey(ClubDTO dto);

	public void club_insert(ClubDTO dto);
	
	public void apply(AdminClubDTO dto);
	
}
