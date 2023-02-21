package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AdminBoardDTO {
	
	private int rn;
	private Long bno;
	private String title;
	private String content;
	private Date reg_date;
	private Date mod_date;
	private int view_count;
	private int secret_type;
	private String board_type;
	private String id;
	private String cate_num;
	
	private String cate_kind;
	private int ans_type;
	private String reply;
}
