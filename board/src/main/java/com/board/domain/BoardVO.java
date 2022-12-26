package com.board.domain;

import java.util.Date;

public class BoardVO {

	
	/*
	 * CREATE TABLE tbl_board(
	num INT	NOT NULL AUTO_INCREMENT,
	title VARCHAR(50) NOT NULL,
	content TEXT NOT NULL,
	writer VARCHAR(30) NOT NULL,
	regDate TIMESTAMP	DEFAULT NOW(),
	views INT DEFAULT 0,
	PRIMARY KEY(num)
	);
	
	 */
	
	
	private int num;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private int views;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	
	
	
	
	
	
}
	
	
	

