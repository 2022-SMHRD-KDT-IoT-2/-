package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.VO.InstallVO;

public class InstallDAO {

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
	// 리스트 가져오기
	public ArrayList<InstallVO> getList(int startRow,int endRow) {

		ArrayList<InstallVO> al = new ArrayList<InstallVO>();
		try {

			connect();
			
			String sql = "select request_seq, request_name, request_loc from "
					+ "(select rownum rn, request_seq, request_name, request_loc from "
					+ "(select * from t_request order by request_seq desc)) where rn between ? and ?";
			;
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, startRow);
			psmt.setInt(2, endRow);
			rs = psmt.executeQuery();
			while (rs.next()) {
				int getSeq = rs.getInt(1);
				String getName = rs.getString(2);
				String getloc = rs.getString(3);

				InstallVO vo = new InstallVO(getSeq, getName, getloc);
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
			String sql = "select count(*) from t_request";
			try {
				connect();
				
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
	public InstallVO getOneList(int no) {

		InstallVO board = null;
		try {
			connect();

			String sql = "select * from t_request where request_seq = ?";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			psmt.setInt(1, no);

			if (rs.next()) {
				int seq = rs.getInt(1);
				String loc = rs.getString(2);
				String name = rs.getString(3);
				String phone = rs.getString(4);
				String date = rs.getString(5);
				String status = rs.getString(6);
				String id = rs.getString(7);
				board = new InstallVO(seq, loc, name, phone, date, status, id);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			quitDB();
		}
		return board;
	}

	//설치게시판에 글 등록하기
	public int requestInstall(String loc, String name, String phone, String id) {
		int cnt = 0;
		try {

			connect();

			String sql = "INSERT INTO t_request(request_seq,request_loc,equest_name,request_phone,request_date,request_status,user_id)"
					+ "VALUES(t_request_SEQ,?,?,?,sysdate,'N',?); ";
			psmt = conn.prepareStatement(sql);
			cnt = psmt.executeUpdate();
			psmt.setString(1, loc);
			psmt.setString(2, name);
			psmt.setString(3, phone);
			psmt.setString(4, id);

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
}
