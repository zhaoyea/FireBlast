package model;

public class Comment {
	private int commmentID;
	private int UserID;
	private int GameID;
	private int rating;
	private String date;
	private String comment;
	
	public Comment(int commmentID, int userID, int gameID, int rating, String date, String comment) {
		super();
		this.commmentID = commmentID;
		UserID = userID;
		GameID = gameID;
		this.rating = rating;
		this.date = date;
		this.comment = comment;
	}

	public int getCommmentID() {
		return commmentID;
	}

	public void setCommmentID(int commmentID) {
		this.commmentID = commmentID;
	}

	public int getUserID() {
		return UserID;
	}

	public void setUserID(int userID) {
		UserID = userID;
	}

	public int getGameID() {
		return GameID;
	}

	public void setGameID(int gameID) {
		GameID = gameID;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
}
