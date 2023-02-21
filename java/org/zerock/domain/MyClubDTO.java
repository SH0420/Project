package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MyClubDTO {
	private String id;
	private int cno;
	private int status;
	private Date app_date;
}
