package com.VO;

public class memberVO {
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String addr;
	private String yn;
	private String joindate;
	
	public memberVO(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;

	
	}
	
	public memberVO(String id, String pw, String name, String phone, String email, String addr) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.addr = addr;
	}

	public memberVO(String id, String pw, String name, String phone, String email, String addr, String yn) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.addr = addr;
		this.yn = yn;
	}

	public memberVO(String id, String pw, String name, String phone, String email, String addr, String yn,
			String joindate) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.addr = addr;
		this.yn = yn;
		this.joindate = joindate;
	}
	public memberVO(String id, String pw,String name, String phone,String addr) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.addr = addr;

	
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getYn() {
		return yn;
	}
	public void setYn(String yn) {
		this.yn = yn;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	
}
