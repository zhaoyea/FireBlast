package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBConn;

public class GamesGenreManager {
	public GamesGenre getGamesGenre(int gameID, int genreID) {
		GamesGenre gamesgenre = null;
		try {
			Connection conn = DBConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM gamesgenre WHERE GameID=?");

			pstmt.setInt(1, gameID);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				gamesgenre = new GamesGenre();
				gamesgenre.setGameID(rs.getInt("GameID"));
				gamesgenre.setGenreID(rs.getInt("GenreID"));
			}
		} catch (Exception e) {
			System.out.println("Error:" + e);
		}
		return gamesgenre;
	}

	public GamesGenre updateGamesGenre(int genreID, int gameID) {
		try {
			Connection conn = DBConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("UPDATE gamesgenre SET GenreID=? WHERE GameID=?");

			pstmt.setInt(1, genreID);
			pstmt.setInt(2, gameID);

			pstmt.executeUpdate();

			conn.close();
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}
		return null;
	}

	public GamesGenre insertGamesGenre(int gameID, int genreID) {
		try {
			Connection conn = DBConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO gamesgenre(GameID,GenreID) VALUES(?,?)");

			pstmt.setInt(1, gameID);
			pstmt.setInt(2, genreID);

			pstmt.executeUpdate();

			conn.close();
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}
		return null;
	}

	public boolean deleteGamesGenre(int gameID) {
		try {
			Connection conn = DBConn.getConnection();

			String sql = "DELETE FROM gamesgenre WHERE GameID=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gameID);

			int recsAffected = pstmt.executeUpdate();
			conn.close();
			return recsAffected > 0;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}
}
