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
	
	PreparedStatement pstmt = conn.prepareStatement("DELETE FROM Games WHERE GameID=?");
	pstmt.setString(1, GameID);	
	
    pstmt.executeUpdate();
 	conn.close();
	
%>
Game Deleted
Click <a href="searchAllGameResults.jsp">here</a> to return to game page.
</body>
</html>