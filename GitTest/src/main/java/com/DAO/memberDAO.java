package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.VO.memberVO;

public class memberDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	public void conn() {
		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			String dbid = "campus_d_4_0216";
			String dbpw = "smhrd4";

			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e2) {
			e2.printStackTrace();
		}

	}

	public memberVO login(String id, String pw) {

		memberVO vo = null;
		try {

			conn();

			String sql = "select * from t_user where id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery();

			if (rs.next()) {
				String getid = rs.getString(1);
				String getpw = rs.getString(2);
				String name = rs.getString(3);
				String phone = rs.getString(4);
				String addr = rs.getString(5);
				String yn = rs.getString(6);
				String joindate = rs.getString(7);

				System.out.println("로그인 성공");

				if (pw.equals(getpw)) {
					vo = new memberVO(id, pw);
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close();

		}
		return vo;
	}

	public int join(String id, String pw,String name, String phone,String addr) {

		int cnt = 0;
		try {

			conn();

			String sql = "insert into t_user values(?,?,?,?,?,sysdate)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.setString(3, name);
			psmt.setString(4, phone);
			psmt.setString(5, addr);



			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return cnt;
	}
}
