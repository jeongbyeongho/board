package com.board.domain;

import java.util.Date;

public class ReplyVO {
	private int rnum;
	private int num;
	private String writer;
	private String content;
	private Date regDate;
	
	/*
	create table tbl_reply(
		rnum int not null auto_increment,
		num int not null,
		writer varchar(30) not null,
		content text not null,
		regDate timestamp not null default now(),
		primary key(rnum,num),
		foreign key(num) references tbl_board(num)
	);
	 
	 
	 */
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
