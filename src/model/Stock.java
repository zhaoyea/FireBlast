package model;

public class Stock {
	private int quantity;
	private String gameName;
	private double price;
	private String console;

	public Stock(int quantity, String gameName, double price, String console) {
		super();
		this.quantity = quantity;
		this.gameName = gameName;
		this.price = price;
		this.console = console;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getGameName() {
		return gameName;
	}

	public void setGameName(String gameName) {
		this.gameName = gameName;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getConsole() {
		return console;
	}

	public void setConsole(String console) {
		this.console = console;
	}

}
