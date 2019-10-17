package com.duongminhtai.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.duongminhtai.model.bean.SinhVien;
import com.duongminhtai.model.dao.SinhVienDAO;

public class AdminEditSinhVienController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SinhVienDAO sinhVienDAO = new SinhVienDAO();

	public AdminEditSinhVienController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.valueOf(request.getParameter("id"));
		SinhVien sinhVien = sinhVienDAO.getItemsById(id);
		request.setAttribute("sinhVien", sinhVien);
		RequestDispatcher rd = request.getRequestDispatcher("/views/sinhvien/edit.jsp");
		rd.forward(request, response);
	}
}
