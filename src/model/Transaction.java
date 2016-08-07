package model;

public class Transaction {
	private int transactionID;
	private int userID;
	private int gameID;
	private String gameName;
	private String console;
	private String imageLink;
	private int quantityOrdered;
	private double totalPrice;	
	
	public Transaction() {
		
	}

	public Transaction(int transactionID, int userID, int gameID, String gameName, String console, String imageLink,
			int quantityOrdered, double totalPrice) {
		super();
		this.transactionID = transactionID;
		this.userID = userID;
		this.gameID = gameID;
		this.gameName = gameName;
		this.console = console;
		this.imageLink = imageLink;
		this.quantityOrdered = quantityOrdered;
		this.totalPrice = totalPrice;
	}

	public int getTransactionID() {
		return transactionID;
	}

	public void setTransactionID(int transactionID) {
		this.transactionID = transactionID;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public int getGameID() {
		return gameID;
	}

	public void setGameID(int gameID) {
		this.gameID = gameID;
	}

	public String getGameName() {
		return gameName;
	}

	public void setGameName(String gameName) {
		this.gameName = gameName;
	}

	public String getConsole() {
		return console;
	}

	public void setConsole(String console) {
		this.console = console;
	}

	public String getImageLink() {
		return imageLink;
	}

	public void setImageLink(String imageLink) {
		this.imageLink = imageLink;
	}

	public int getQuantityOrdered() {
		return quantityOrdered;
	}

	public void setQuantityOrdered(int quantityOrdered) {
		this.quantityOrdered = quantityOrdered;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	
}
