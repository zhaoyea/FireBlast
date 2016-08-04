package model;

public class Cart {
	private int gameID;
	private String name;
	private String description;
	private double price;
	private String imageLink;
	private String console;
	private int quantity;
	

	public Cart(int gameID, String name, String description, double price, String imageLink, String console,
			int quantity) {		
		this.gameID = gameID;
		this.name = name;
		this.description = description;
		this.price = price;
		this.imageLink = imageLink;
		this.console = console;
		this.quantity = quantity;
	}
	
	public int getGameID() {
		return gameID;
	}
	public void setGameID(int gameID) {
		this.gameID = gameID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getImageLink() {
		return imageLink;
	}
	public void setImageLink(String imageLink) {
		this.imageLink = imageLink;
	}
	public String getConsole() {
		return console;
	}
	public void setConsole(String console) {
		this.console = console;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	
}
