package com.duongminhtai.controller.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.duongminhtai.model.bean.SinhVien;
import com.duongminhtai.model.dao.SinhVienDAO;
import com.google.gson.Gson;

public class SinhVienAPI extends HttpServlet {
	SinhVienDAO sinhVienDAO = new SinhVienDAO();
	List<SinhVien> listSinhVien = new ArrayList<SinhVien>();
	Gson gson = new Gson();

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		BufferedReader reader = request.getReader();
		SinhVien sinhVien = gson.fromJson(reader, SinhVien.class);
		sinhVienDAO.addItem(sinhVien);
		/*
		 * if(check > 0) {
		 * response.sendRedirect(request.getContextPath()+"/v1/admin/sinhvien/index");
		 * return; }else {
		 * response.sendRedirect(request.getContextPath()+"/v1/admin/sinhvien/add");
		 * return; }
		 */
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		BufferedReader reader = request.getReader();
		SinhVien sinhVien = gson.fromJson(reader, SinhVien.class);
		sinhVienDAO.editItem(sinhVien);
		/*
		 * if(check > 0) {
		 * response.sendRedirect(request.getContextPath()+"/v1/admin/sinhvien/index");
		 * return; }else {
		 * response.sendRedirect(request.getContextPath()+"/v1/admin/sinhvien/edit?id="+
		 * sinhVien.getId()); return; }
		 */
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BufferedReader reader = request.getReader();
		SinhVien sinhVien = gson.fromJson(reader, SinhVien.class);
		sinhVienDAO.delItem(sinhVien.getId());
	}

}
