package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import db.*;

public class GamesManager {
	public ArrayList<Games> searchGames(String search) {

		try {

			Connection conn = DBConn.getConnection();

			String sql = "SELECT * FROM Games WHERE GameID LIKE ? OR Name LIKE ? OR Console LIKE ?";

			ArrayList<Games> invList = new ArrayList<Games>();

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setString(2, "%" + search + "%");
			pstmt.setString(3, "%" + search + "%");

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("GameID");
				String name = rs.getString("name");
				String description = rs.getString("description");
				double price = rs.getDouble("price");
				String date = rs.getString("ReleaseDate");
				String imageLink = rs.getString("GameImageLink");
				String console = rs.getString("console");
				int quantity = rs.getInt("Quantity");

				Games inv = new Games(id, name, description, price, date, imageLink, console, quantity);
				invList.add(inv);
			}
			conn.close();
			return invList;
		} catch (Exception e) {

			System.out.println("Error :" + e);
			return null;
		}
	}

	public Games getGames(String gameID) {
		Games game = null;
		try {
			Connection conn = DBConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM Games WHERE GameID=?");
			pstmt.setString(1, gameID);
			
			ResultSet rs = pstmt.executeQuery();			
			if(rs.next()) {
				game = new Games();
				game.setId(rs.getInt("GameID"));
				game.setName(rs.getString("Name"));
				game.setDescription(rs.getString("Description"));
				game.setPrice(rs.getDouble("Price"));
				game.setImageLink(rs.getString("GameImageLink"));
				game.setConsole(rs.getString("Console"));
				game.setQuantity(rs.getInt("Quantity"));				
			}
		} catch (Exception e) {
			System.out.println("Error:" + e);
		}
		return game;
	}
	public Games insertGames(int id, String name, String description, double price, String date, String imageLink, String console, int quantity) {
		try {
			Connection conn = DBConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(
					"INSERT INTO Games(GameID,Name,Description,Price,ReleaseDate,GameImageLink,Console,Quantity) VALUES(?,?,?,?,?,?,?,?)");

			pstmt.setInt(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, description);
			pstmt.setDouble(4, price);
			pstmt.setString(5, date);
			pstmt.setString(6, imageLink);
			pstmt.setString(7, console);
			pstmt.setInt(8, quantity);

			pstmt.executeUpdate();

			conn.close();
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}

		return null;
	}
	
	/*
	 * public boolean deleteGames(int id) { try { Connection conn =
	 * DBConn.getConnection();
	 * 
	 * String sql = "DELETE FROM games WHERE id=?"; PreparedStatement pstmt =
	 * conn.prepareStatement(sql); pstmt.setInt(1, id);
	 * 
	 * int recsAffected = pstmt.executeUpdate(); conn.close(); return
	 * recsAffected > 0; } catch (Exception e) { System.out.println(e); return
	 * false; } }
	 */
}
