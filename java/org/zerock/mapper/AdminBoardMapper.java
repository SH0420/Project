package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.AdminBoardDTO;
import org.zerock.domain.AdminReplyDTO;
import org.zerock.domain.AdminClubDTO;
import org.zerock.domain.Criteria;

//스프링 컨테이너 등록 방식 
//1. @mapper
//2. root.context 의 mybatis-spring scan 정의
public interface AdminBoardMapper { //인터페이스의 추상메서드 이름과 xml의 id 값이 맻이
	
	public void write(AdminBoardDTO dto);
	
	// 게시글 리스트 
	public List<AdminBoardDTO> getList(); //xml에서 사용하는 select 구문의 id 속성값이 boardmapper 인터페이스 메소드의 이름이

	//게시글 조회 
	public AdminBoardDTO read(Long bno); //wrapper클래스의 long형 
	
	// 수정
	public void update(AdminBoardDTO dto);
	
	// 삭제
	public void delete(Long bno);
	
	public List<AdminBoardDTO> getListWithPaging(Criteria cri);

	public int getTotalCount(Criteria cri);
	
	// -------------- Q&A 

	/*
	 * public int qnaTotalCount();
	 * 
	 * public List<AdminBoardDTO> getqnaList();
	 */
	
	public int qnaTotalCount(Criteria cri);
	
	public List<AdminBoardDTO> getqnaList(Criteria cri);
	

	public void qnawrite(AdminReplyDTO dto);

	
	// ------------------- reply 
	
	// 댓글 리스트 
	public List<AdminReplyDTO> getReplyList(Long bno); 
	
	// 자유 게시판 댓글 작성 
	public void replywrite(AdminReplyDTO dto);
	
	// 댓글 페이징 
	public int getReplyTotal(Criteria cri);

	public List<AdminReplyDTO> getReplyPagingList(Criteria cri);
	
	
	// ------------ Club manager
	
	public List<AdminClubDTO> getclubList();

	public void answerupdate(AdminReplyDTO dto);

	public void ansdelete(Long bno);
	

}
