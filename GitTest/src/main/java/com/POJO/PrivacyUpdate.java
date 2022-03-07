package com.POJO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Command.Command;
import com.DAO.memberDAO;
import com.VO.memberVO;

public class PrivacyUpdate implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {


		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");
		String id=request.getParameter("id");
		
		HttpSession session = request.getSession();
		memberVO vo = (memberVO) session.getAttribute("loginvo");
		String yn=vo.getYn();
		
		memberDAO dao=new memberDAO(); 
		
		int cnt=dao.updatePirvacy(name, pw, email, phone, addr, id);
		if(cnt>0) {

			memberVO vo1=new memberVO(id, pw, name,phone, email, addr,yn);
			session.setAttribute("loginvo", vo1);
		}else {
			System.out.println("수정실패");

		}
		return "privacy.jsp";
	}

}

