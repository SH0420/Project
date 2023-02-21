package org.zerock.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO extends Criteria {
	
	private int rn ;  			// 로럼 정렬 
	private Long bno;  			//게시물 번호
	private String cate_num; 	//카테고리 넘버
	private String title;  		//제목
	private String content; 	//내용
	private String id;  		//아이디
	private String board_type;  //게시판 타입  01:자유게시판  02:문의게시판
	private Date reg_date; 		//작성일
	private Date mod_date; 		//수정일자
	private int view_count; 	//조회수
	private int secret_type; 	//비밀글 선택 여부  0:공개글 , 1:비밀글
	
	private String cate_kind;   //카테고리 이름
	private String type;        //검색조건 타입
	private String keyword;  	//검색조건내용
	private String ans_type;
	
	private int replyCnt;       //댓글 수
//	private String uploadFile;
	private String file_check;   //파일 유무
	private List<BoardAttachVO> attachList;

}