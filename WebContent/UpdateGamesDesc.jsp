<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="db.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	Connection conn = DBConn.getConnection();
	
	String GameID = request.getParameter("id");
	String gameDescription = request.getParameter("gameDescription");
	
	PreparedStatement pstmt = conn.prepareStatement("UPDATE Games SET Description=? WHERE GameID=?");
	pstmt.setString(1, gameDescription);	
	pstmt.setString(2, GameID);	
	
    pstmt.executeUpdate();
 	conn.close();
	
	%>
	Updated	<br>
	Click <a href="searchAllGameResults.jsp">here</a> to go back to the game page.
</body>
</html>