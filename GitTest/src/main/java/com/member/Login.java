package com.member;

import java.io.IOException;
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

import com.DAO.memberDAO;
import com.VO.memberVO;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		memberDAO dao = new memberDAO();
		memberVO vo = dao.login(id,pw);
		String name=vo.getName();
		String phone=vo.getPhone();
		String email=vo.getEmail();
		String addr=vo.getAddr();
		String yn=vo.getYn();
		
		if(vo!=null) {
			memberVO vo1= new memberVO(id,pw,name,phone,email,addr,yn);
			HttpSession session = request.getSession();
			session.setAttribute("loginvo", vo1); 
			
			response.sendRedirect("index.jsp");
		}else {
			response.sendRedirect("index.jsp");			
		}




		}

	}

