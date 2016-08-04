package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import db.*;

import model.*;

public class UserManager {
	public User getUser(String email, String password) {

		try {

			Connection conn = DBConn.getConnection();

			String sql = "SELECT * FROM Members WHERE email=?";			

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);			

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				User user = new User();
				user.setUserid(rs.getInt("UserID"));
				user.setFirstName(rs.getString("FirstName"));
				user.setLastName(rs.getString("LastName"));
				user.setEmail(rs.getString("Email"));
				user.setPassword(rs.getString("Password"));
				user.setContact(rs.getInt("Contact"));
				user.setAddress(rs.getString("Address"));
				user.setType(rs.getString("type"));
				return user;
			}
			conn.close();			
		} catch (Exception e) {
			System.out.println("Error :" + e);
			return null;
		}
		return null;
	}

	public boolean checkDBEmail(String email) {
		try {
			Connection conn = DBConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM members WHERE Email=?");
			pstmt.setString(1, email);
			ResultSet emailDB = pstmt.executeQuery();
			try {
				if (emailDB.next()) {
					return true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}
		return false;
	}

	
	public User insertUser(String firstName, String lastName, String email, String password, String contact,
			String address) {

		try {
			Connection conn = DBConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(
					"INSERT INTO Members(FirstName,LastName,Email,Password,Contact,Address) VALUES(?,?,?,?,?,?)");

			pstmt.setString(1, firstName);
			pstmt.setString(2, lastName);
			pstmt.setString(3, email);
			pstmt.setString(4, password);
			pstmt.setString(5, contact);
			pstmt.setString(6, address);

			pstmt.executeUpdate();

			conn.close();
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}

		return null;
	}

	public void close() {
		try {
			Connection conn = DBConn.getConnection();
			conn.close();
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}
	}
}
