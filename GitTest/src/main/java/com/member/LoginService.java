package com.member;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.VO.memberVO;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		StringBuffer sb = new StringBuffer();
		String line = null;
		
		BufferedReader reader = request.getReader();
		while((line = reader.readLine()) != null) {
			sb.append(line);
		}
		
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(sb.toString());
		
		String id = element.getAsJsonObject().get("id").getAsString();
		String pw = element.getAsJsonObject().get("pw").getAsString();
		
		System.out.println("아이디 : " + id);
		System.out.println("비밀번호 : " + pw);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524";
			String dbid = "campus_d_4_0216";
			String dbpw = "smhrd4";
			
			conn = DriverManager.getConnection(url, dbid, dbpw);	// 3가지 정보 필요.
		
			String sql = "select * from t_user where user_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			
			PrintWriter out = response.getWriter();

			if(rs.next()){
				String getid = rs.getString(1);
				String getpw = rs.getString(2);
				String name = rs.getString(3);
				String phone = rs.getString(4);
				String email = rs.getString(5);
				String addr = rs.getString(6);
				String yn = rs.getString(7);
				String joindate = rs.getString(8);
				
				memberVO vo = new memberVO(getid, getpw, name, phone, email, addr,yn,joindate);
				if(pw.equals(getpw)) {
					System.out.println("로그인 성공");

					HttpSession session = request.getSession();
					session.setAttribute("loginvo", vo);
					
					out.print("success");
					
				}else {
					System.out.println("로그인 실패");
					out.print("fail");
				}
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				psmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		
		
	}

}
