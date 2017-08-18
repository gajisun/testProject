package model.dataroom;

import java.sql.Date;

public class DataRoomDTO {
	//속성
	private String no;
	private String name;
	private String title;
	private String pass;
	private String content;
	private String downcount;
	private String attachedfile;
	private java.sql.Date postdate;
	
	public DataRoomDTO() {	}
	
	public DataRoomDTO(String no, String name, String title, String pass, String content, String downcount,
			String attachedfile, Date postdate) {
		this.no = no;
		this.name = name;
		this.title = title;
		this.pass = pass;
		this.content = content;
		this.downcount = downcount;
		this.attachedfile = attachedfile;
		this.postdate = postdate;
	}

	//getter & setter
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDowncount() {
		return downcount;
	}
	public void setDowncount(String downcount) {
		this.downcount = downcount;
	}
	public String getAttachedfile() {
		return attachedfile;
	}
	public void setAttachedfile(String attachedfile) {
		this.attachedfile = attachedfile;
	}
	public java.sql.Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
	
}
