package com.VO;

public class ProductVO {
	    private int product_seq;
	    private String product_uid;
	    private String product_loc;
	    private double product_latitude;
	    private double product_longitude;
	    private String product_date;
	    private String user_id;
	    
	    
		public ProductVO(int product_seq, String product_uid, String product_loc, String user_id) {
			super();
			this.product_seq = product_seq;
			this.product_uid = product_uid;
			this.product_loc = product_loc;
			this.user_id = user_id;
		}
		
		

		public ProductVO(int product_seq, double product_latitude, double product_longitude) {
			super();
			this.product_seq = product_seq;
			this.product_latitude = product_latitude;
			this.product_longitude = product_longitude;
		}



		public ProductVO(int product_seq, String product_uid, String product_loc, double product_latitude,
				double product_longitude, String product_date, String user_id) {
			super();
			this.product_seq = product_seq;
			this.product_uid = product_uid;
			this.product_loc = product_loc;
			this.product_latitude = product_latitude;
			this.product_longitude = product_longitude;
			this.product_date = product_date;
			this.user_id = user_id;
		}


		public int getProduct_seq() {
			return product_seq;
		}
		public String getProduct_uid() {
			return product_uid;
		}
		public String getProduct_loc() {
			return product_loc;
		}
		public double getProduct_latitude() {
			return product_latitude;
		}
		public double getProduct_longitude() {
			return product_longitude;
		}
		public String getProduct_date() {
			return product_date;
		}
		public String getUser_id() {
			return user_id;
		}
	    

}
