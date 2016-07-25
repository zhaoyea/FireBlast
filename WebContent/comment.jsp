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
	String commentorName = request.getParameter("commentorName");
	String comment = request.getParameter("commentBox");
	
	Class.forName("com.mysql.jdbc.Driver");

	String connURL = "jdbc:mysql://cqr.softether.net/LiquidBlast?user=root&password=EADBestModule";

	Connection conn = DriverManager.getConnection(connURL);
	
	PreparedStatement pstmt = conn.prepareStatement("INSERT INTO Comments(Name,Comment) VALUES(?,?)"); 
	pstmt.setString(1, commentorName);
	pstmt.setString(2, comment);
	
	pstmt.executeUpdate();
	conn.close();
%>
Comment Added! Thanks for your feedback!
<br>
Click <a href="index.jsp">here</a> to return to home page.
</body>
</html>