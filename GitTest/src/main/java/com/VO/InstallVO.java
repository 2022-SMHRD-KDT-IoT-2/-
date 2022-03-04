package com.VO;

public class InstallVO {
	
	private int request_req;
	private String request_loc;
	private String request_name;
	private String request_Phone;
	private String request_date;
	private String request_status;
	private String user_id;
	public InstallVO(int request_req, String request_loc, String request_name,String request_status) {
		super();
		this.request_req = request_req;
		this.request_loc = request_loc;
		this.request_name = request_name;
		this.request_status=request_status;
	}
	
	public InstallVO(int request_req, String request_loc, String request_name, String request_Phone,
			String request_date, String request_status, String user_id) {
		super();
		this.request_req = request_req;
		this.request_loc = request_loc;
		this.request_name = request_name;
		this.request_Phone = request_Phone;
		this.request_date = request_date;
		this.request_status = request_status;
		this.user_id = user_id;
	}
 
	public int getRequest_req() {
		return request_req;
	}
	public String getRequest_loc() {
		return request_loc;
	}
	public String getRequest_name() {
		return request_name;
	}
	public String getRequest_Phone() {
		return request_Phone;
	}
	public String getRequest_date() {
		return request_date;
	}
	public String getRequest_status() {
		return request_status;
	}
	public String getUser_id() {
		return user_id;
	}
	

}
