package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardAttachMapper;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	//spring 4.3에서는 자동 처리
	// 단일 생성자는 자동의존주입이 된다.  단일이 아니면 @Setter(onMethod_ = @Autowired) 써줘야댐.
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;
	
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
		
		//board테이블과 tbl_attach테이블 양쪽 모두 insert되야하기 때문에 트랜잭션 처리가 필요. 
		//MyBatis의 select key를 이용했기 때문에 별도의 currval을 매번 호출할 필요가 없다.
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		board.getAttachList().forEach(attach -> {//.forEach(attach -> 람다식 함수(익명함수)
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
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
	public List<BoardAttachVO> getAttachList(Long bno){
		log.info("get Attach list by bno" + bno);
		return attachMapper.findByBno(bno);
	}

	@Override
	public void deleteFile(BoardAttachVO boardAttachVO) {
		String uuid = boardAttachVO.getUuid();
		attachMapper.delete(uuid);
	}



}
