package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.AdminBoardDTO;
import org.zerock.domain.AdminClubDTO;
import org.zerock.domain.AdminReplyDTO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.AdminBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminBoardServiceImpl implements AdminBoardService {

	//@Setter(onMethod_=@Autowired) //생성자에 의한 주입 (단일생성자는 자동 의존주입이 된다)
	private AdminBoardMapper mapper;
	
	@Override
	public void write(AdminBoardDTO dto) {
		log.info("Anno_write ... : " + dto);
		mapper.write(dto);
	}
	
	
	@Override
	public List<AdminBoardDTO> getList() {
		
		log.info("getLIst..");
		return mapper.getList();
	}


	@Override
	public AdminBoardDTO read(Long bno) {
		log.info("get....." + bno);
		return mapper.read(bno);
	}


	@Override
	public void update(AdminBoardDTO dto) {
		log.info("update .... " + dto);
		mapper.update(dto);
	}


	@Override
	public void delete(Long bno) {
		log.info("delete .... : " + bno);
		mapper.delete(bno);
	}


	@Override
	public List<AdminBoardDTO> getList(Criteria cri) {
		log.info("get List with criteria : " + cri );
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get Total count ");
		return mapper.getTotalCount(cri);
	}


	
	// ---------------------- Q&A 
	

	@Override
	public int getqnaTotal(Criteria cri) {
		log.info("get Total count ");
		return mapper.qnaTotalCount(cri);
	}
	
	
	@Override
	public List<AdminBoardDTO> qnaList(Criteria cri) {
		log.info("get List with criteria : " );
		return mapper.getqnaList(cri);
	}


	@Override
	public void qnawrite(AdminReplyDTO dto) {
		log.info("qna_write ... : " + dto);
		mapper.qnawrite(dto);
	}
	
	
	@Override
	public void answerupdate(AdminReplyDTO dto) {
		log.info("qna_update ... : " + dto);
		mapper.answerupdate(dto);
	}
	
	// ------------ Club manager
	@Override
	public List<AdminClubDTO> getclubList() {
		log.info("AdminClub List..");
		return mapper.getclubList();
	}

	
	// ------------------- reply 
	
	// 자유게시판 댓글 리스트 
	@Override
	public List<AdminReplyDTO> getReplyList(Long bno) {
		log.info("get Reply List ....  " );
		return mapper.getReplyList(bno);
	}

	// 자유 게시판 댓글 작성 
	@Override
	public void replywrite(AdminReplyDTO dto) {
		log.info("Free Board Reply Write : " + dto);
		mapper.replywrite(dto);
		
	}
	
	// Q&A 게시판 답글 삭제 
	@Override
	public void ansdelete(Long bno) {
		log.info("reply delete .... : " + bno);
		mapper.ansdelete(bno);
		
	}

	// 자유 게시판 댓글 페이징 
	@Override
	public List<AdminReplyDTO> getReplyPagingList(Criteria cri) {
		log.info("get Reply Paging List ....  " );
		return mapper.getReplyPagingList(cri);
	}
	
	@Override
	public int getReplyTotal(Criteria cri) {
		log.info("get Total count ");
		return mapper.getReplyTotal(cri);
	}
	




}
