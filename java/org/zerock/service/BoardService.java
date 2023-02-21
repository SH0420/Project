package org.zerock.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardService {
	
	public List<BoardVO> getList(BoardVO board);
	
	public List<BoardVO> getCategoryList(BoardVO board);
	
	public void register(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public boolean update(BoardVO board);
	
	public boolean delete(Long bno);

	public int getListCount(BoardVO board);
	
	// 전체 데이터 갯수 가져오기
	public int getTotal(Criteria cri);

	public List<BoardAttachVO> getAttachList(Long bno);

	public void deleteFile(BoardAttachVO boardAttachVO);



	
	

}
