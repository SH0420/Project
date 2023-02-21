package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.AdminClubDTO;
import org.zerock.domain.ClubDTO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MyClubDTO;
import org.zerock.mapper.ClubMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ClubServiceImpl implements ClubService {

	@Setter(onMethod_ = @Autowired)
	private ClubMapper club_mapper;

	
	@Override
	public List<ClubDTO> mainList1(){
		log.info("Main Papular List " );
		return club_mapper.mainList1();
	}
	@Override
	public List<ClubDTO> mainList2(){
		log.info("Main Papular List " );
		return club_mapper.mainList2();
	}
	
	
//	@Override
//	public List<ClubDTO> getList1() {
//		log.info("asdfasdfasdfasdf");
//		return club_mapper.getList1();
//	}
	
	@Override
	public List<ClubDTO> getList1(Criteria cri){
		log.info("111" + cri);
		log.info("get List with criteria: ");
		
		return club_mapper.getListWithPaging(cri);
	}
	
	@Override
	public List<ClubDTO> getExerciseWithPaging(Criteria cri){
		log.info("exercisepaging");
		
		return club_mapper.getExerciseWithPaging(cri);
	}
	
	@Override
	public List<ClubDTO> getLeisureWithPaging(Criteria cri){
		log.info("leisurewithpaging");
		
		return club_mapper.getLeisureWithPaging(cri);
	}
	
	@Override
	public List<ClubDTO> getTravelWithPaging(Criteria cri){
		log.info("travelwithpaging");
		
		return club_mapper.getTravelWithPaging(cri);
	}
	
	@Override
	public List<ClubDTO> getStudyWithPaging(Criteria cri){
		log.info("studywithpaging");
		
		return club_mapper.getStudyWithPaging(cri);
	}
	
	@Override 
	public ClubDTO getlist(Long cno) {
		log.info("read ...");
		return club_mapper.getlist(cno);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return club_mapper.getTotalCount(cri);
	}
	
	@Override
	public int updatecount(ClubDTO dto) {
		log.info("Count");
		return club_mapper.updatecount(dto);
	}
	
	@Override
	public void club_insert(ClubDTO dto) {
		log.info("register");
		club_mapper.club_insert(dto);
	}
	
	@Override
	public void apply(AdminClubDTO dto) {
		log.info("insert");
		club_mapper.apply(dto);
	}
	

}
