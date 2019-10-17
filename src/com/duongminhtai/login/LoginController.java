package com.duongminhtai.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.duongminhtai.model.bean.User;
import com.duongminhtai.model.dao.UserDAO;
import com.duongminhtai.utils.StringUtil;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = request.getParameter("msg");
		request.setAttribute("msg", msg);
		RequestDispatcher rd = request.getRequestDispatcher("/views/auth/login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = StringUtil.md5(request.getParameter("password"));
		UserDAO userDAO = new UserDAO();
		User objUser = new User(1, username, password);
		User userinfo = userDAO.getItemByUsernameAndPassword(objUser);
		if(userinfo != null) {
			session.setAttribute("userinfo", userinfo);
			response.sendRedirect(request.getContextPath()+"/v1/admin/sinhvien/index");
			return;
		}else {
			response.sendRedirect(request.getContextPath()+"/v1/auth/login?msg=Error");
			return;
		}
		
	}
}
