package com.VO;

public class BreakVO {

	private int num;
	private String name;
	private String phone;
	private int product_num;
	private String content;
	private String date;
	public BreakVO(String name, String phone, String content) {
		super();
		this.name = name;
		this.phone = phone;
		this.content = content;
	}
	public BreakVO(int num, String name, int product_num, String date) {
		super();
		this.num = num;
		this.name = name;
		this.product_num = product_num;
		this.date = date;
	}
	public BreakVO(int num, String name, String phone, int product_num, String content, String date) {
		super();
		this.num = num;
		this.name = name;
		this.phone = phone;
		this.product_num = product_num;
		this.content = content;
		this.date = date;
	}
	public int getNum() {
		return num;
	}
	public String getName() {
		return name;
	}
	public String getPhone() {
		return phone;
	}
	public int getProduct_num() {
		return product_num;
	}
	public String getContent() {
		return content;
	}
	public String getDate() {
		return date;
	}
	
	
	
}
