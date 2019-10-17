package com.duongminhtai.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.duongminhtai.model.bean.SinhVien;
import com.duongminhtai.model.dao.SinhVienDAO;

public class AdminIndexSinhVienController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	List<SinhVien> listSinhVien = new ArrayList<SinhVien>();
	SinhVienDAO sinhVienDAO = new SinhVienDAO();

	public AdminIndexSinhVienController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String str = request.getParameter("str");
		if (str == null) {
			listSinhVien = sinhVienDAO.getItems();
			request.setAttribute("listSinhVien", listSinhVien);
		}else {
			listSinhVien = sinhVienDAO.getItemsByName(str);
			request.setAttribute("listSinhVien", listSinhVien);
		}
		RequestDispatcher rd = request.getRequestDispatcher("/views/sinhvien/index.jsp");
		rd.forward(request, response);
	}

}
