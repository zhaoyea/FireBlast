package model;

public class Games {
	private int id;
	private String name;
	private String description;
	private double price;
	private String date;
	private String imageLink;
	private String console;
	
	public Games() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Games(int id, String name, String description, double price, String date, String imageLink, String console) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.date = date;
		this.imageLink = imageLink;
		this.console = console;
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
}
