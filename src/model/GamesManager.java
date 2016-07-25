package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

				Games inv = new Games(id, name, description, price, date, imageLink, console);
				invList.add(inv);
			}
			conn.close();
			return invList;
		} catch (Exception e) {

			System.out.println("Error :" + e);
			return null;
		}
	}

	/*
	public boolean deleteGames(int id) {
		try {
			Connection conn = DBConn.getConnection();

			String sql = "DELETE FROM games WHERE id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);

			int recsAffected = pstmt.executeUpdate();
			conn.close();
			return recsAffected > 0;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}
	 */	
}
