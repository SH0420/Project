package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UsersVO {
	private String id;
	private String empno;
	private String pw;
	private String phoneNum;
	private Date regidate;
	private int admin_type;
	
	
	private String email;
	
}