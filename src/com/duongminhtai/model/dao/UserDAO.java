package com.duongminhtai.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.duongminhtai.model.bean.User;
import com.duongminhtai.utils.ConnectDBUtil;

public class UserDAO {
	private Connection conn;
	private Statement st;
	private ResultSet rs;
	private PreparedStatement ps;

	public User getItemByUsernameAndPassword(User objUser) {
		User user = null;
		conn = ConnectDBUtil.getConnection();
		String sql = "SELECT * FROM nguoidung WHERE username = ? AND password = ? ";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, objUser.getUsername());
			ps.setString(2, objUser.getPassword());
			rs = ps.executeQuery();
			if (rs.next()) {
				user = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectDBUtil.close(rs, ps, conn);
		}
		return user;
	}
}
