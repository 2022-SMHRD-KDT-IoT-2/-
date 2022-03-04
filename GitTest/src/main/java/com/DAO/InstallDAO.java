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
	int cnt=0;
	int count=0;
	int fCount=0;
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
			
			String sql = "select request_seq, request_loc, request_name, request_status from "
					+ "(select rownum rn, request_seq, request_loc, request_name,request_status from "
					+ "(select * from t_request order by request_seq desc)) where rn between ? and ?";
			;
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, startRow);
			psmt.setInt(2, endRow);
			rs = psmt.executeQuery();
			while (rs.next()) {
				int getSeq = rs.getInt(1);
				String getloc = rs.getString(2);
				String getname = rs.getString(3);
				String getstatus= rs.getString(4);

				InstallVO vo = new InstallVO(getSeq, getloc, getname, getstatus);
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
			
			try {
				connect();
				
				//여기 sql 실행코득
				String sql = "select count(*) from t_request";
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
		// 하나의 리시트 가져오기
	public InstallVO getOneList(int no) {

		InstallVO board = null;
		try {
			connect();

			String sql = "select * from t_request where request_seq = ?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, no);
			rs = psmt.executeQuery();  
			
			
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
		try {

			connect();

			String sql = "INSERT INTO t_request(request_seq,request_loc,request_name,request_phone,request_date,request_status,user_id)"
					+ "VALUES(t_request_SEQ.nextval,?,?,?,sysdate, 'N' ,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, loc);
			psmt.setString(2, name);
			psmt.setString(3, phone);
			psmt.setString(4, id);
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

			String sql = "select count(*) from t_request where " + sel + " like '%" + find + "%'";
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
		public ArrayList<InstallVO> getfList(int startRow, int endRow, String sel, String find) {

			ArrayList<InstallVO> al = new ArrayList<InstallVO>();
			try {

				connect();

				String sql = "select request_seq, request_loc, request_name,request_status from"
						+ "(select rownum rn, request_seq, request_loc, request_name,request_status from"
						+ "(select request_seq, request_loc, request_name,request_status from t_request where " + sel + " like '%" + find
						+ "%'" + "order by request_seq desc)) where rn between ? and ?";
				;
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, startRow);
				psmt.setInt(2, endRow);
				rs = psmt.executeQuery();
				while (rs.next()) {
					int getSeq = rs.getInt(1);
					String getloc = rs.getString(2);
					String getname = rs.getString(3);
					String getstatus=rs.getString(4);

					InstallVO vo = new InstallVO(getSeq, getloc, getname,getstatus);
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
		public int deleteInstall(String no) {
			try {

				connect();

				String sql = "delete from t_request where request_seq=?";
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
		public int modifyInstall(String name,String status ,String loc,String phone,int no) {
			try {

				connect();

				String sql = "update t_request set request_name=?, request_status=?, request_loc=?, request_phone=? where request_seq=?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, name);
				psmt.setString(2, status);
				psmt.setString(3, loc);
				psmt.setString(4, phone);
				psmt.setInt(5, no);
				cnt = psmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();

			} finally {
				quitDB();

			}
			return cnt;
		}
}
