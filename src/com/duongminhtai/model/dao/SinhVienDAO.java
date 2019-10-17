package com.duongminhtai.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.duongminhtai.model.bean.SinhVien;
import com.duongminhtai.utils.ConnectDBUtil;

public class SinhVienDAO {
	private Connection conn;
	private Statement st;
	private ResultSet rs;
	private PreparedStatement ps;

	public List<SinhVien> getItems() {
		List<SinhVien> listItems = new ArrayList<SinhVien>();
		conn = ConnectDBUtil.getConnection();
		String sql = "SELECT * FROM sinhvien";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				SinhVien sinhVien = new SinhVien(rs.getInt("id"), rs.getString("hoten"), rs.getInt("cmnd"),
						rs.getString("quequan"), rs.getString("khoa"), rs.getString("ngaysinh"));
				listItems.add(sinhVien);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectDBUtil.close(rs, st, conn);
		}
		return listItems;
	}
	
	public List<SinhVien> getItemsByName(String str) {
		List<SinhVien> listItems = new ArrayList<SinhVien>();
		conn = ConnectDBUtil.getConnection();
		String sql = "SELECT * FROM sinhvien WHERE hoten LIKE ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+str+"%");
			rs = ps.executeQuery();
			while (rs.next()) {
				SinhVien sinhVien = new SinhVien(rs.getInt("id"), rs.getString("hoten"), rs.getInt("cmnd"),
						rs.getString("quequan"), rs.getString("khoa"), rs.getString("ngaysinh"));
				listItems.add(sinhVien);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectDBUtil.close(rs, st, conn);
		}
		return listItems;
	}

	public SinhVien getItemsById(int id) {
		SinhVien sinhVien = null;
		conn = ConnectDBUtil.getConnection();
		String sql = "SELECT * FROM sinhvien WHERE id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				sinhVien = new SinhVien(rs.getInt("id"), rs.getString("hoten"), rs.getInt("cmnd"),
						rs.getString("quequan"), rs.getString("khoa"), rs.getString("ngaysinh"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectDBUtil.close(rs, ps, conn);
		}
		return sinhVien;
	}

	public int addItem(SinhVien sinhVien) {
		conn = ConnectDBUtil.getConnection();
		int check = 0;
		String sql = "INSERT INTO sinhvien(hoten, cmnd, quequan, khoa, ngaysinh) VALUES (?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, sinhVien.getHoten());
			ps.setInt(2, sinhVien.getCmnd());
			ps.setString(3, sinhVien.getQuequan());
			ps.setString(4, sinhVien.getKhoa());
			ps.setString(5, sinhVien.getNgaysinh());
			check = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectDBUtil.close(rs, ps, conn);
		}
		return check;
	}

	public int editItem(SinhVien sinhVien) {
		conn = ConnectDBUtil.getConnection();
		int check = 0;
		String sql = "UPDATE sinhvien SET hoten=?, cmnd=?, quequan=?, khoa=?, ngaysinh=? WHERE id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, sinhVien.getHoten());
			ps.setInt(2, sinhVien.getCmnd());
			ps.setString(3, sinhVien.getQuequan());
			ps.setString(4, sinhVien.getKhoa());
			ps.setString(5, sinhVien.getNgaysinh());
			ps.setInt(6, sinhVien.getId());
			check = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectDBUtil.close(rs, ps, conn);
		}
		return check;
	}

	public int delItem(int id) {
		conn = ConnectDBUtil.getConnection();
		int check = 0;
		String sql = "DELETE FROM sinhvien WHERE id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			check = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectDBUtil.close(rs, ps, conn);
		}
		return check;
	}

	public static void main(String[] args) {
		SinhVienDAO dao = new SinhVienDAO();
		System.out.println(dao.getItemsByName("n"));
	}
}
