package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import db.*;

import db.DBConn;

public class UserManager {
	public ArrayList<User> searchUser(String search) {

		try {

			Connection conn = DBConn.getConnection();

			String sql = "SELECT * FROM Members WHERE UserID LIKE ? OR FirstName LIKE ? OR LastName LIKE ?";

			ArrayList<Games> invList = new ArrayList<Games>();

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setString(2, "%" + search + "%");
			pstmt.setString(3, "%" + search + "%");

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("UserID");
				String firstName = rs.getString("firstName");
				String lastName = rs.getString("lastName");
				String email = rs.getString("email");
				String password = rs.getString("password");
				int contact = rs.getInt("contact");

				User inv = new User(id, firstName, lastName, email, password, contact);
				invList.add(inv);
			}
			conn.close();
			return invList;
		} catch (Exception e) {

			System.out.println("Error :" + e);
			return null;
		}
	}
}
