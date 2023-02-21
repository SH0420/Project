package org.zerock.service;

import java.util.List;

import org.zerock.domain.AdminClubDTO;
import org.zerock.domain.ClubDTO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MyClubDTO;

public interface ClubService {
	
	public List<ClubDTO> mainList1();
	public List<ClubDTO> mainList2();
	
	 public List<ClubDTO> getList1(Criteria cri); 
	 
	 public int getTotal(Criteria cri);
	 
	 public List<ClubDTO> getExerciseWithPaging(Criteria cri);
	 
	 public List<ClubDTO> getLeisureWithPaging(Criteria cri);

	 public List<ClubDTO> getTravelWithPaging(Criteria cri);
	 
	 public List<ClubDTO> getStudyWithPaging(Criteria cri);
	 
	 public ClubDTO getlist(Long cno);
	 
	 public int updatecount(ClubDTO dto);
	 
	 public void club_insert(ClubDTO dto);
	 
	 public void apply(AdminClubDTO dto);
}
