package com.duongminhtai.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminAddSinhVienController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminAddSinhVienController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/views/sinhvien/add.jsp");
		rd.forward(request, response);
	}
}
