package org.zerock.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {
	
	//@Select("select * from board where bno > 0")  : xml에 sql문 작성시  인터페이스에서는 삭제처리 시켜준다.(처음 테스트시에만 사용)
	// 전체 게시글 불러오기
	public List<BoardVO> getList(BoardVO board);
	
	public List<BoardVO> getCategoryList(BoardVO board);
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	// 특정글 하나만 조회하는 것
	public BoardVO read(Long bno);
	
	// 게시글 삭제
	public int delete(Long bno);
	
	// 업데이트 처리. 제목,내용,작성자를 수정할 때 최종 수정시간을 현재 시간으로 수정하는 것
	public int update(BoardVO board);

	public int getListCount(BoardVO board);
	
	// 전체 데이터의 개수 처리
	public int getTotalCount(Criteria cri);

	// 댓글 수 처리 (댓글 카운트 갱신)
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);

	public int getReplyCnt(@Param("bno") Long bno);
}
