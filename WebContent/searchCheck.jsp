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

	<%@ include file="AdminPanel.jsp"%>

	<hr>
	<%
		String searchString = request.getParameter("searchString");

		try {
			response.sendRedirect("searchAllGameResults.jsp?searchString=" + searchString); 
		} catch (Exception e) {
			out.println("Error :" + e);
		}
	%>

</body>
</html>