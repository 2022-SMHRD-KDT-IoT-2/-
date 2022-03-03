package com.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.memberDAO;

@WebServlet("/Join")
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");


		
		
		
		memberDAO dao = new memberDAO();
		int cnt = dao.join(id,pw,name,phone,email,addr);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		if (cnt > 0) {
			out.println("<script>alert('회원가입 성공'); location.href = 'login.jsp'; </script>");
			out.close();
		}else {
			out.println("<script>alert('회원가입 실패');</script>");
			out.close();
		}
	
	}

}
