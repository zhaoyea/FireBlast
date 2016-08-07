package db;

import java.sql.*;


public class DBConn {
	static String db = "ead2016student";
	static String db_user = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
	static String db_pwd = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
	static String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
	static String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
	
	public static Connection getConnection() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");		
		String connURL = "jdbc:mysql://127.7.149.130:3306/fireblast?user=adminxhFKEkD&password=iq7dhgSiMvMW";
		return DriverManager.getConnection(connURL);
	}
	/*
public class DBConn {
	public static Connection getConnection() throws Exception {
	Class.forName("com.mysql.jdbc.Driver");
    
    String connURL ="jdbc:mysql://localhost:3306/fireblast?user=root&password=root123";
 
    Connection conn = DriverManager.getConnection(connURL);
	return conn; 
	}
	*/
}
