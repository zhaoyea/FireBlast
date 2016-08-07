package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.DBConn;

public class GenreManager {
	public ArrayList<Genre> searchGenre(String search) {

		try {

			Connection conn = DBConn.getConnection();

			String sql = "SELECT * FROM genre WHERE GenreID LIKE ? OR Genre LIKE ?";

			ArrayList<Genre> invList = new ArrayList<Genre>();

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setString(2, "%" + search + "%");			

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int GenreID = rs.getInt("GenreID");
				String Genre = rs.getString("Genre");				

				Genre inv = new Genre(GenreID, Genre);
				invList.add(inv);
			}
			conn.close();
			return invList;
		} catch (Exception e) {

			System.out.println("Error :" + e);
			return null;
		}
	}
	public Genre updateGenre(String genre, int genreID) {
		try {
			Connection conn = DBConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("UPDATE genre SET Genre=? WHERE GenreID=?");

			pstmt.setString(1, genre);
			pstmt.setInt(2, genreID);

			pstmt.executeUpdate();

			conn.close();
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}
		return null;
	}

	public Genre insertGamesGenre(int genreID, String genre) {
		try {
			Connection conn = DBConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO genre(GenreID,Genre) VALUES(?,?)");

			pstmt.setInt(1, genreID);
			pstmt.setString(2, genre);

			pstmt.executeUpdate();

			conn.close();
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}
		return null;
	}

	public boolean deleteGamesGenre(int genreID) {
		try {
			Connection conn = DBConn.getConnection();

			String sql = "DELETE FROM genre WHERE GenreID=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, genreID);

			int recsAffected = pstmt.executeUpdate();
			conn.close();
			return recsAffected > 0;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}
	
}
