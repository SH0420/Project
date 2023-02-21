package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AdminMyClubDTO {
	private String id;
	private Long cno;
	private int status;
	private Date app_date;
}
