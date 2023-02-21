package org.zerock.domain;

import java.util.Date;

import lombok.Data;


@Data
public class AdminReplyDTO {
	
	private Long rno;
	private String reply;
	private Date reg_date;
	private Date mod_date;
	private int ans_type;
	private Long bno;
	
	private String id;
}
