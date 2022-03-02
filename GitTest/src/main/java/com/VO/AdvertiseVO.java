package com.VO;

public class AdvertiseVO {
	private int advertise_seq;
	private int product_seq;
	private String advertise_content;
	private String reg_date;
	public AdvertiseVO(int advertise_seq, int product_seq, String advertise_content, String reg_date) {
		super();
		this.advertise_seq = advertise_seq;
		this.product_seq = product_seq;
		this.advertise_content = advertise_content;
		this.reg_date = reg_date;
	}
	public int getAdvertise_seq() {
		return advertise_seq;
	}
	public int getProduct_seq() {
		return product_seq;
	}
	public String getAdvertise_content() {
		return advertise_content;
	}
	public String getReg_date() {
		return reg_date;
	}

	
}
