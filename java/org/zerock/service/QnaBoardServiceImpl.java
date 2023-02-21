package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.QnaBoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QnaBoardServiceImpl implements QnaBoardService {

	//spring 4.3에서는 자동 처리
	// 단일 생성자는 자동의존주입이 된다.  단일이 아니면 @Setter(onMethod_ = @Autowired) 써줘야댐.
	@Setter(onMethod_ = @Autowired)
	private QnaBoardMapper mapper;
	
	
	@Override
	public List<BoardVO> getList(BoardVO board) {
		log.info("getList............................");
		return mapper.getList(board);
	}
	
	@Override
	public List<BoardVO> getCategoryList(BoardVO board) {
		return mapper.getCategoryList(board);
	}
	
	@Override
	public void register(BoardVO board) {   // 글을 등록하는 역할
		log.info("register....." + board);
		mapper.insertSelectKey(board);
	}

	@Override
	public BoardVO read(Long bno) {
		log.info("read......" + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean update(BoardVO board) {
		log.info("update......." + board);
		return mapper.update(board) == 1;
	}

	@Override
	public boolean delete(Long bno) {
		log.info("delete....." + bno);
		return mapper.delete(bno) == 1;
	}

	@Override
	public int getListCount(BoardVO board) {
		return mapper.getListCount(board);
	}

	// 전체 데이터 개수 가져오기
	@Override
	public int getTotal(Criteria cri) {
		log.info("getTotalCount : ");
		return mapper.getTotalCount(cri);
	}

	@Override
	public ReplyVO getReply(Long bno) {
		
		return mapper.getReply(bno);
	}



}
