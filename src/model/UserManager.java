package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import db.*;

import db.DBConn;

public class UserManager {
	public ArrayList<User> searchUser(String searchUser) {

		try {

			Connection conn = DBConn.getConnection();

			String sql = "SELECT * FROM Members WHERE UserID LIKE ? OR FirstName LIKE ? OR LastName LIKE ?";

			ArrayList<User> invList = new ArrayList<User>();

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchUser + "%");
			pstmt.setString(2, "%" + searchUser + "%");
			pstmt.setString(3, "%" + searchUser + "%");

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("UserID");
				String firstName = rs.getString("FirstName");
				String lastName = rs.getString("LastName");
				String email = rs.getString("Email");
				String password = rs.getString("Password");
				int contact = rs.getInt("Contact");
				String address = rs.getString("Address");

				User inv = new User(id, firstName, lastName, email, password, contact, address);
				invList.add(inv);
			}
			conn.close();
			return invList;
		} catch (Exception e) {

			System.out.println("Error :" + e);
			return null;
		}
	}

	public boolean checkDBEmail(String email) throws Exception {
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM members WHERE Email=?");
		pstmt.setString(1, email);
		ResultSet emailDB = pstmt.executeQuery();	
		try {
			if (emailDB.next()) {		
				return true;
			}
			conn.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return false;

	}
}
