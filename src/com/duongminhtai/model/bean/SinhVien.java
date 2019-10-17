package com.duongminhtai.model.bean;

public class SinhVien {
	private int id;
	private String hoten;
	private int cmnd;
	private String quequan;
	private String khoa;
	private String ngaysinh;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public int getCmnd() {
		return cmnd;
	}
	public void setCmnd(int cmnd) {
		this.cmnd = cmnd;
	}
	public String getQuequan() {
		return quequan;
	}
	public void setQuequan(String quequan) {
		this.quequan = quequan;
	}
	public String getKhoa() {
		return khoa;
	}
	public void setKhoa(String khoa) {
		this.khoa = khoa;
	}
	public String getNgaysinh() {
		return ngaysinh;
	}
	public void setNgaysinh(String ngaysinh) {
		this.ngaysinh = ngaysinh;
	}
	public SinhVien(int id, String hoten, int cmnd, String quequan, String khoa, String ngaysinh) {
		super();
		this.id = id;
		this.hoten = hoten;
		this.cmnd = cmnd;
		this.quequan = quequan;
		this.khoa = khoa;
		this.ngaysinh = ngaysinh;
	}
	public SinhVien() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "SinhVien [id=" + id + ", hoten=" + hoten + ", cmnd=" + cmnd + ", quequan=" + quequan + ", khoa=" + khoa
				+ ", ngaysinh=" + ngaysinh + "]";
	}
}
