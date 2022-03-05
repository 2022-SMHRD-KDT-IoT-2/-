package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.VO.BreakVO;


public class BreakDAO {
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

	public ArrayList<BreakVO> getList(int startRow, int endRow) {

		ArrayList<BreakVO> al = new ArrayList<BreakVO>();
		try {

			connect();

			String sql = "select report_seq, reporter_name,product_seq,report_date from "
					+ "(select rownum rn, report_seq, reporter_name, product_seq,report_date from "
					+ "(select report_seq, reporter_name, product_seq,report_date from t_report order by report_seq desc)) where rn between ? and ?";
			;
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, startRow);
			psmt.setInt(2, endRow);
			rs = psmt.executeQuery();
			while (rs.next()) {
				int getSeq = rs.getInt(1);
				String getName = rs.getString(2);
				int getProd_Seq = rs.getInt(3);
				String getdate = rs.getString(4);

				BreakVO vo = new BreakVO(getSeq, getName, getProd_Seq, getdate);
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
	public int getCount() {
		int count = 0;
		String sql = "select count(*) from t_report";
		try {
			connect();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			if (rs.next()) {
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
	public BreakVO getOneList(int no) {

		BreakVO board = null;
		try {
			connect();

			String sql = "select * from t_report where report_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, no);
			rs = psmt.executeQuery();

			if (rs.next()) {
				int seq = rs.getInt(1);
				String name = rs.getString(2);
				String phone = rs.getString(3);
				int prod_seq = rs.getInt(4);
				String content = rs.getString(5);
				String date = rs.getString(6);
				board = new BreakVO(seq, name, phone, prod_seq, content, date);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			quitDB();
		}
		return board;
	}

	public int oneReport(String name, String phone, int product_num, String content) {
		int cnt = 0;
		try {

			connect();

			String sql = "INSERT INTO t_report(report_seq,reporter_name,reporter_phone,product_seq,report_content,report_date)"
					+ "VALUES(t_report_SEQ.nextval,?,?,?,?,sysdate)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, phone);
			psmt.setInt(3, product_num);
			psmt.setString(4, content);
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

	// 검색어와 일치하는 레코드 수를 구하는 로직
	public int getfCount(String sel, String find) {
		int fCount = 0;
		String sql = "select count(*) from t_report where " + sel + " like '%" + find + "%'";
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

	// 검색관련 로직(페이징처리)
	public ArrayList<BreakVO> getfList(int startRow, int endRow, String sel, String find) {

		ArrayList<BreakVO> al = new ArrayList<BreakVO>();
		try {

			connect();

			String sql = "select report_seq, reporter_name,product_seq,report_date from"
					+ "(select rownum rn, report_seq, reporter_name,product_seq,report_date from"
					+ "(select report_seq, reporter_name,product_seq,report_date from t_report where " + sel + " like '%" + find
					+ "%'" + "order by report_seq desc)) where rn between ? and ?";
			;
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, startRow);
			psmt.setInt(2, endRow);
			rs = psmt.executeQuery();
			while (rs.next()) {
				int getSeq = rs.getInt(1);
				String getName = rs.getString(2);
				int getProd_Seq = rs.getInt(3);
				String getdate = rs.getString(4);

				BreakVO vo = new BreakVO(getSeq, getName, getProd_Seq, getdate);
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
	public int deleteOneBreak(String no) {
		int cnt=0;
		try {

			connect();
			

			String sql = "delete from t_report where report_seq=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			quitDB();

		}
		return cnt;
	}
	public int deleteAllBreak() {
		int cnt=0;
		try {

			connect();
			

			String sql = "delete from t_report";
			psmt = conn.prepareStatement(sql);
			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			quitDB();

		}
		return cnt;
	}

}
