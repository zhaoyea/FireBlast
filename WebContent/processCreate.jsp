<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String FirstName = request.getParameter("FirstName");
	String LastName = request.getParameter("LastName"); 
	String email = request.getParameter("email"); 
	String password = request.getParameter("password");	

	Class.forName("com.mysql.jdbc.Driver");

	String connURL ="jdbc:mysql://cqr.softether.net/LiquidBlast?user=root&password=EADBestModule"; 

    Connection conn = DriverManager.getConnection(connURL); 
	      
    PreparedStatement pstmt = conn.prepareStatement("INSERT INTO Members(FirstName,LastName,Email,Password) VALUES(?,?,?,?)");
    
    pstmt.setString(1, FirstName);
    pstmt.setString(2, LastName);
    pstmt.setString(3, email);
    pstmt.setString(4, password);
    
    
    
    pstmt.executeUpdate();
 	conn.close();
%>
</body>
</html>