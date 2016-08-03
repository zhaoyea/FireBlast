package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import db.*;

import model.*;

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
				String type = rs.getString("type");

				User inv = new User(id, firstName, lastName, email, password, contact, address, type);
				invList.add(inv);
			}
			conn.close();
			return invList;
		} catch (Exception e) {
			System.out.println("Error :" + e);
			return null;
		}
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

	/*
	 * public boolean checkLogin(String email, String password) throws Exception
	 * { Connection conn = DBConn.getConnection();
	 * 
	 * PreparedStatement pstmt = conn.prepareStatement(
	 * "SELECT * FROM members WHERE Email=? AND Password=?"); pstmt.setString(1,
	 * email); pstmt.setString(2, password);
	 * 
	 * ResultSet rs = pstmt.executeQuery(); String userType =
	 * rs.getString("type"); String lastName = rs.getString("LastName");
	 * 
	 * if(type.equals('a')){
	 * 
	 * } return false; }
	 */

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
