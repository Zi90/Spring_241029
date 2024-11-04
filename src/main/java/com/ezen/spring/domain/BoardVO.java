package com.ezen.spring.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {
//	bno bigint auto_increment,
//	title varchar(500) not null,
//	writer varchar(500) not null,
//	content text,
//	is_del varchar(5) default 'N',
//	reg_date datetime default now(),
//	read_cout int default 0,
	
	private long bno;
	private String title;
	private String writer;
	private String content;
	private String isDel;
	private String regDate;
	private int readCount;
	private int cmtQty;
	private int hasFile;
}
