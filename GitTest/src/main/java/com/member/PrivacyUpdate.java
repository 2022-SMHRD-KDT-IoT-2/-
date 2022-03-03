package com.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.memberDAO;
import com.VO.memberVO;

@WebServlet("/PrivacyUpdate")
public class PrivacyUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");

		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");
		String id=request.getParameter("id");
		
		HttpSession session = request.getSession();
	
		memberVO vo=new memberVO(id, pw, name,phone, email, addr);
		memberDAO dao=new memberDAO(); 
		
		int cnt=dao.updatePirvacy(name, pw, email, phone, addr, id);
		if(cnt>0) {
			System.out.println("수정성공");
			response.sendRedirect("privacy.jsp");
			session.setAttribute("loginvo", vo);
		}else {
			System.out.println("수정실패");
			response.sendRedirect("privacy.jsp");
		}

	}

}
