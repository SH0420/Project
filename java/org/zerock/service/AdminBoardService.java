package org.zerock.service;

import java.util.List;

import org.zerock.domain.AdminBoardDTO;
import org.zerock.domain.AdminClubDTO;
import org.zerock.domain.AdminReplyDTO;
import org.zerock.domain.Criteria;

public interface AdminBoardService {
	
	public void write(AdminBoardDTO dto);
	
	public AdminBoardDTO read(Long bno);
	
	public List<AdminBoardDTO> getList();
	
	public void update(AdminBoardDTO dto);
	
	public void delete(Long bno);
	
	public List<AdminBoardDTO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);

	// ------------------- Q&A
	
	public List<AdminBoardDTO> qnaList(Criteria cri);

	public int getqnaTotal(Criteria cri);

	public void qnawrite(AdminReplyDTO dto);
	
	
	// ------------------- reply 
	
	// 댓글 리스트 
	public List<AdminReplyDTO> getReplyList(Long bno); 
	
	public int getReplyTotal(Criteria cri);
	// 댓글 페이징 
	public List<AdminReplyDTO> getReplyPagingList(Criteria cri);

	// 자유 게시판 댓글 작성 
	public void replywrite(AdminReplyDTO dto);
	
	
	
	// ------------ Club manager
	
	public List<AdminClubDTO> getclubList();

	public void answerupdate(AdminReplyDTO dto);

	public void ansdelete(Long bno);

}
