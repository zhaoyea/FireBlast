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
		String gameName = request.getParameter("gameName");
		String gameDescription = request.getParameter("gameDescription");
		String genre = request.getParameter("genre");
		String Price = request.getParameter("Price");
		String ReleaseDate = request.getParameter("ReleaseDate");
		String GameImageLink = request.getParameter("GameImageLink");
		String Console = request.getParameter("Console");

		Class.forName("com.mysql.jdbc.Driver");

		String connURL = "jdbc:mysql://cqr.softether.net/LiquidBlast?user=root&password=EADBestModule";

		Connection conn = DriverManager.getConnection(connURL);

		PreparedStatement pstmt = conn.prepareStatement("INSERT INTO Games(Name,Description,Price,ReleaseDate,GameImageLink,Console) VALUES(?,?,?,?,?,?)");
		pstmt.setString(1, gameName);
		pstmt.setString(2, gameDescription);
		pstmt.setString(3, Price);
		pstmt.setString(4, ReleaseDate);
		pstmt.setString(5, GameImageLink);
		pstmt.setString(6, Console);

		pstmt.executeUpdate();
		
		PreparedStatement pstmt2 = conn.prepareStatement("INSERT INTO Genre(Genre) VALUES(?)");
		pstmt.setString(1, genre);
		
		conn.close();
		
			
	%>
	Game Inserted
	<br/>
	Click <a href="searchAllGameResults.jsp">here</a> to go back to game page.
</body>
</html>