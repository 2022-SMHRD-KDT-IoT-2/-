package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.VO.ProductVO;

public class ProductDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	public void connect() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524";
			String dbid = "campus_d_4_0216";
			String dbpw = "smhrd4";

			conn = DriverManager.getConnection(url, dbid, dbpw);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void quitDB() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	public ArrayList<ProductVO> getList(int startRow,int endRow) {

		ArrayList<ProductVO> al = new ArrayList<ProductVO>();
		try {

			connect();
			
			String sql = "select product_seq,product_uid,product_loc,user_id from"
					+ "(select rownum rn, product_seq,product_uid,product_loc,user_id from"
					+ "(select product_seq,product_uid,product_loc,user_id from t_iot order by product_seq desc)) where rn between ? and ?";
			;
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, startRow);
			psmt.setInt(2, endRow);
			rs = psmt.executeQuery();
			while (rs.next()) {
				int getSeq = rs.getInt(1);
				String getPro_id = rs.getString(2);
				String getLoc = rs.getString(3);
				String getid = rs.getString(4);

				
				
				ProductVO vo = new ProductVO(getSeq, getPro_id, getLoc, getid);
				al.add(vo);

			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				quitDB();
			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
		return al;
	}
	public ArrayList<ProductVO> privacyList(int startRow,int endRow,String id) {

		ArrayList<ProductVO> al = new ArrayList<ProductVO>();
		try {

			connect();
			
			String sql = "select product_seq,product_uid,product_loc,user_id from"
					+ "(select rownum rn, product_seq,product_uid,product_loc,user_id from"
					+ "(select product_seq,product_uid,product_loc,user_id from t_iot order by product_seq desc)) where (rn between ? and ?) and user_id=?";
			;
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, startRow);
			psmt.setInt(2, endRow);
			psmt.setString(3, id);
			rs = psmt.executeQuery();
			while (rs.next()) {
				int getSeq = rs.getInt(1);
				String getPro_id = rs.getString(2);
				String getLoc = rs.getString(3);
				String getid = rs.getString(4);

				
				
				ProductVO vo = new ProductVO(getSeq, getPro_id, getLoc, getid);
				al.add(vo);

			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				quitDB();
			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
		return al;
	}
	// 총 레코드 수 구하는 로직
			public int getCount(){
				int count = 0;
				String sql = "select count(*) from t_iot";
				try {
					connect();
					psmt = conn.prepareStatement(sql);
					rs = psmt.executeQuery();
					
					if(rs.next()){
						count = rs.getInt(1);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					quitDB();
				}
				return count; // 총 레코드 수 리턴
			}
			
			public int getprivacyCount(String id){
				int count = 0;
				String sql = "select count(*) from t_iot where user_id=? ";
				try {
					connect();
					psmt = conn.prepareStatement(sql);
					psmt.setString(1,id);
					rs = psmt.executeQuery();
					
					if(rs.next()){
						count = rs.getInt(1);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					quitDB();
				}
				return count; // 총 레코드 수 리턴
			}
			// 하나의 리시트 가져오기
		public ProductVO getOneList(int no) {

			ProductVO board = null;
			try {
				connect();

				String sql = "select * from t_iot where product_seq = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, no);
				rs = psmt.executeQuery();
				

				if (rs.next()) {
					int seq = rs.getInt(1);
					String pro_id = rs.getString(2);
					String loc = rs.getString(3);
					double latitude = rs.getDouble(4);
					double longitude = rs.getDouble(5);
					String date = rs.getString(6);
					String user_id = rs.getString(7);
					board = new ProductVO(seq,pro_id,loc,latitude,longitude,date,user_id);

				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				quitDB();
			}
			return board;
		}

	public int oneProduct(String pro_id, String loc, double latitude, double longitude,String id) {
		int cnt = 0;
		try {

			connect();

			String sql = "INSERT INTO t_iot(product_seq, product_uid, product_loc,product_latitude,product_longitude,product_date,user_id)"
					+ "VALUES(t_iot_SEQ.nextval,?,?,?,?,sysdate,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pro_id);
			psmt.setString(2, loc);
			psmt.setDouble(3, latitude);
			psmt.setDouble(4, longitude);
			psmt.setString(5, id);
			cnt = psmt.executeUpdate();

			if (cnt > 0) {
				System.out.println("추가되었습니다");
			} else {
				System.out.println("추가실패하였습니다");
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				quitDB();
			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
		return cnt;
	}
	

		public int getprivacyfCount(String sel, String find, String id){
			int fCount = 0;
			String sql = "select count(*) from t_iot where (" + sel + " like '%" + find + "%') and where user_id=?";
			try {
				connect();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				rs = psmt.executeQuery();
				if (rs.next()) {
					fCount = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				quitDB();
			}
			return fCount; // 총 레코드 수 리턴
		}
		
		//검색관련 로직(페이징처리)
		public ArrayList<ProductVO> privacyfList(int startRow,int endRow, String sel, String find, String id) {

			ArrayList<ProductVO> al = new ArrayList<ProductVO>();
			try {

				connect();
				
				String sql = "select product_seq,product_uid,product_loc,user_id from"
						+ "(select rownum rn, product_seq,product_uid,product_loc,user_id from"
						+ "(select product_seq,product_uid,product_loc,user_id from t_iot where "+sel+" like '%"+find+"%'"
						+"order by product_seq desc)) where (rn between ? and ?) and user_id=?";
				;
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, startRow);
				psmt.setInt(2, endRow);
				psmt.setString(3, id);
				rs = psmt.executeQuery();
				while (rs.next()) {
					int getSeq = rs.getInt(1);
					String getPro_id = rs.getString(2);
					String getLoc = rs.getString(3);
					String getid = rs.getString(4);

					
					
					ProductVO vo = new ProductVO(getSeq, getPro_id, getLoc, getid);
					al.add(vo);

				}
			} catch (Exception e) {
				e.printStackTrace();

			} finally {
				try {
					quitDB();
				} catch (Exception e2) {
					e2.printStackTrace();
				}

			}
			return al;
		}
		public int getfCount(String sel, String find){
			int fCount = 0;
			String sql = "select count(*) from t_iot where " + sel + " like '%" + find + "%'";
			try {
				connect();
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				if (rs.next()) {
					fCount = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				quitDB();
			}
			return fCount; // 총 레코드 수 리턴
		}
		
		//검색관련 로직(페이징처리)
		public ArrayList<ProductVO> getfList(int startRow,int endRow, String sel, String find) {

			ArrayList<ProductVO> al = new ArrayList<ProductVO>();
			try {

				connect();
				
				String sql = "select product_seq,product_uid,product_loc,user_id from"
						+ "(select rownum rn, product_seq,product_uid,product_loc,user_id from"
						+ "(select product_seq,product_uid,product_loc,user_id from t_iot where "+sel+" like '%"+find+"%'"
						+"order by product_seq desc)) where rn between ? and ?";
				;
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, startRow);
				psmt.setInt(2, endRow);
				rs = psmt.executeQuery();
				while (rs.next()) {
					int getSeq = rs.getInt(1);
					String getPro_id = rs.getString(2);
					String getLoc = rs.getString(3);
					String getid = rs.getString(4);

					
					
					ProductVO vo = new ProductVO(getSeq, getPro_id, getLoc, getid);
					al.add(vo);

				}
			} catch (Exception e) {
				e.printStackTrace();

			} finally {
				try {
					quitDB();
				} catch (Exception e2) {
					e2.printStackTrace();
				}

			}
			return al;
		}
}
