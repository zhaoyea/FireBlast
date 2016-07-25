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
	Class.forName("com.mysql.jdbc.Driver");
	
	String connURL = "jdbc:mysql://cqr.softether.net/LiquidBlast?user=root&password=EADBestModule";
	
	Connection conn = DriverManager.getConnection(connURL);
	
	String GenreID = request.getParameter("id");	
	
	PreparedStatement pstmt = conn.prepareStatement("DELETE FROM Genre WHERE GenreID=?");
	pstmt.setString(1, GenreID);	
	
    pstmt.executeUpdate();
 	conn.close();
	
%>
Genre Deleted
Click <a href="searchGenreResults.jsp">here</a> to return to game page.
</body>
</html>