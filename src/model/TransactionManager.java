package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBConn;

public class TransactionManager {
	public Transaction getTransaction(int transactionID) {

		try {

			Connection conn = DBConn.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM transaction WHERE transactionID=?");
			pstmt.setInt(1, transactionID);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Transaction purchasedGames = new Transaction();
				purchasedGames.setTransactionID(rs.getInt("transactionID"));
				purchasedGames.setGameID(rs.getInt("GameID"));
				purchasedGames.setGameName(rs.getString("GameName"));
				purchasedGames.setConsole(rs.getString("Console"));
				purchasedGames.setImageLink(rs.getString("GameImageLink"));
				purchasedGames.setQuantityOrdered(rs.getInt("QuantityOrdered"));
				purchasedGames.setTotalPrice(rs.getDouble("TotalPrice"));				
				return purchasedGames;
			}
			conn.close();
		} catch (Exception e) {
			System.out.println("Error :" + e);
			return null;
		}
		return null;
	}

	public Transaction insertPurchasedGames(int gameID, String gameName, String console,
			String imageLink, int quantityOrdered, double totalPrice) {

		try {
			Connection conn = DBConn.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(
					"INSERT INTO transaction(GameID,GameName,Console,GameImageLink,QuantityOrdered,TotalPrice) VALUES(?,?,?,?,?,?)");
			
			pstmt.setInt(1, gameID);
			pstmt.setString(2, gameName);
			pstmt.setString(3, console);
			pstmt.setString(4, imageLink);
			pstmt.setInt(5, quantityOrdered);
			pstmt.setDouble(6, totalPrice);			

			pstmt.executeUpdate();

			conn.close();
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}

		return null;
	}
}
