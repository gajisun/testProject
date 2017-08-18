package model;

import java.sql.Date;

/*
 * DTO(DATA TRANSFER OBJECT):데이터를 전송하는 객체
 * 		테이블릐 레코드 하나를 저장할 수 있는 자료구조
 */
public class BbsDTO {
	 private String no;
	 private String id;
	 private String title;
	 private String content;
	 private String visitcount;
	 private java.sql.Date postdate;
	 
	 //프로그램의 효율성을 위한 속성 추가]
	 private String name;

	public BbsDTO() {	}
	 public BbsDTO(String no, String id, String title, String content, String visitcount, Date postdate) {
		 this.no = no;
		 this.id = id;
		 this.title = title;
		 this.content = content;
		 this.visitcount = visitcount;
		 this.postdate = postdate;
	 }

	 //프로그램의 효율성을 위한 속성
	 public String getName() {
		 return name;
	 }
	 public void setName(String name) {
		 this.name = name;
	 }

	 public String getNo() {
		 return no;
	 }

	 public void setNo(String no) {
		 this.no = no;
	 }

	 public String getId() {
		 return id;
	 }

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getVisitcount() {
		return visitcount;
	}

	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}

	public java.sql.Date getPostdate() {
		return postdate;
	}

	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}

}
