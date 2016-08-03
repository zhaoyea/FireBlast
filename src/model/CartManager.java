package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import db.*;

public class CartManager {
	/*
	public ArrayList<Cart> displayCart(int userID) {

		try {

			Connection conn = DBConn.getConnection();

			String sql = "SELECT * FROM Cart WHERE userID = ?";

			ArrayList<Cart> cartList = new ArrayList<Cart>();

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userID);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int CartID = rs.getInt("cartID");
				int UserID = rs.getInt("UserID");
				int GameID = rs.getInt("GameID");
				String console = rs.getString("Console");
				String quantity = rs.getString("Quantity");

				Cart cartItem = new Cart(CartID, UserID, GameID, console, quantity);
				cartList.add(cartItem);
			}
			conn.close();			
			return cartList;
		} catch (Exception e) {

			System.out.println("Error :" + e);			
			return null;
		}
	}
	*/

	public Cart add2Cart(int userID, int gameID, String console, String quantity) {
		try {
			Connection conn = DBConn.getConnection();
			PreparedStatement pstmt = conn
					.prepareStatement("INSERT INTO cart(UserID,GameID,Console,Quantity) VALUES(?,?,?,?)");

			pstmt.setInt(1, userID);
			pstmt.setInt(2, gameID);
			pstmt.setString(3, console);
			pstmt.setString(4, quantity);

			pstmt.executeUpdate();

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Cart updateCart(int gameID, String quantity) {
		try {
			Connection conn = DBConn.getConnection();
			PreparedStatement pstmt = conn
					.prepareStatement("UPDATE cart SET quantity=? WHERE GameID=?");
			
			pstmt.setString(1, quantity);
			pstmt.setInt(2, gameID);

			pstmt.executeUpdate();

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;		
	}

	public boolean checkCart(int gameID) {
		try {
			Connection conn = DBConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM cart WHERE GameID=?");
			pstmt.setInt(1, gameID);
			ResultSet cart = pstmt.executeQuery();
			try {
				if (cart.next()) {
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
}
