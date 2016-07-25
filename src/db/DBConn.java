package db;

import java.sql.*;


public class DBConn {
	public static Connection getConnection() throws Exception {
	Class.forName("com.mysql.jdbc.Driver");
    
    String connURL ="jdbc:mysql://localhost:3306/liquidblast?user=root&password=root123"; 

    Connection conn = DriverManager.getConnection(connURL);
	return conn; 
	}
}
