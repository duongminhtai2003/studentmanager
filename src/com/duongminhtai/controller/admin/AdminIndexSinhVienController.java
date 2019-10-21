package com.duongminhtai.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.duongminhtai.model.bean.SinhVien;
import com.duongminhtai.model.dao.SinhVienDAO;
import com.duongminhtai.utils.DefineUtil;
import com.sun.org.apache.regexp.internal.recompile;

public class AdminIndexSinhVienController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	List<SinhVien> listSinhVien = new ArrayList<SinhVien>();
	SinhVienDAO sinhVienDAO = new SinhVienDAO();
	public AdminIndexSinhVienController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String str = "";
		if (request.getParameter("str") != null) {
			str = request.getParameter("str");
			session.setAttribute("str", str);
		}
		if (session.getAttribute("str") != null) {
			str = (String) session.getAttribute("str");
		}
		int numberOfItems = sinhVienDAO.numberOfItems(str);
		int numberOfPage = (int)Math.ceil((float)numberOfItems / DefineUtil.NUMBER_PER_PAGE);
		int currentPage = 1;
		try {
			currentPage = Integer.valueOf(request.getParameter("pageid"));
		} catch (NumberFormatException e) {
			
		}
		if(currentPage > numberOfPage || currentPage < 1) {
			currentPage = 1;
		}
		int offset = (currentPage - 1) * DefineUtil.NUMBER_PER_PAGE;
		if (request.getParameter("str") == null) {
			session.removeAttribute("str");
			listSinhVien = sinhVienDAO.getItemsPagination(offset);
			request.setAttribute("listSinhVien", listSinhVien);
			request.setAttribute("numberOfPage", numberOfPage);
			request.setAttribute("currentPage", currentPage);
		}else {
			listSinhVien = sinhVienDAO.getItemsByNamePagination(str, offset);
			request.setAttribute("listSinhVien", listSinhVien);
			request.setAttribute("numberOfPage", numberOfPage);
			request.setAttribute("currentPage", currentPage);
		}
		RequestDispatcher rd = request.getRequestDispatcher("/views/sinhvien/index.jsp");
		rd.forward(request, response);
	}

}
