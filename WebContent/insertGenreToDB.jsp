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
		String GenreID = request.getParameter("GenreID");
		String Genre = request.getParameter("Genre");

		Class.forName("com.mysql.jdbc.Driver");

		String connURL = "jdbc:mysql://cqr.softether.net/LiquidBlast?user=root&password=EADBestModule";

		Connection conn = DriverManager.getConnection(connURL);

		PreparedStatement pstmt = conn.prepareStatement("INSERT INTO Genre(GenreID,Genre) VALUES(?,?)");
		pstmt.setString(1, GenreID);
		pstmt.setString(2, Genre);

		pstmt.executeUpdate();
			
	%>
	Genre Inserted
	<br/>
	Click <a href="searchGenreResults.jsp">here</a> to go back to genre page.
</body>
</html>