package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String name;
	private String empno;
	private String email;
	private String birth_date;
	
	private String id;
}
