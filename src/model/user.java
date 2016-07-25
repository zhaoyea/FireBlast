package model;

public class User {
	private int userid;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private int Contact;
	
	public User(int userid, String firstName, String lastName, String email, String password, int contact) {
		super();
		this.userid = userid;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		Contact = contact;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getContact() {
		return Contact;
	}

	public void setContact(int contact) {
		Contact = contact;
	}
	
	
}
