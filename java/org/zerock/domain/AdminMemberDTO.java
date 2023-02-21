package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AdminMemberDTO {
	
	private String id;
	private String pw;
	private String phonenum;
	private Date regidate;
	private int admin_type;
	private String empno;
	
	private String name;
	private String app_date;
	private int count;
}
