package model;

public class Cart {
	private int CartID;
	private int UserID;
	private int GameID;
	private String console;
	private String quantity;
	
	public Cart(int cartID, int userID, int gameID, String console, String quantity) {
		super();
		CartID = cartID;
		UserID = userID;
		GameID = gameID;
		this.console = console;
		this.quantity = quantity;
	}

	public int getCartID() {
		return CartID;
	}

	public void setCartID(int cartID) {
		CartID = cartID;
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

	public String getConsole() {
		return console;
	}

	public void setConsole(String console) {
		this.console = console;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
}
