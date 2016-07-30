package db;

import java.sql.*;


public class DBConn {
	public static Connection getConnection() throws Exception {
	Class.forName("com.mysql.jdbc.Driver");
    
    //String connURL ="jdbc:mysql://localhost:3306/liquidblast?user=root&password=root123";
    String connURL ="jdbc:mysql://localhost:3306/liquidblast?user=root&password=root";
    //String connURL ="jdbc:mysql://cqr.softether.net/liquidblast?user=root&password=EADBestModule";

    Connection conn = DriverManager.getConnection(connURL);
	return conn; 
	}
}
