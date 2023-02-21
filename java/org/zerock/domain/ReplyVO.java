package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private Long rno; //댓글 번호
	private Long bno; //게시물 번호
	
	private String reply; //댓글
	private String id;    //아이디
	private Date reg_date; 	//작성일
	private Date mod_date; 	//수정일자
	
	//문의게시판
	private int ans_type;   //답변 타입 0 - 답변 미작성 , 1- 답변 완료 
}
