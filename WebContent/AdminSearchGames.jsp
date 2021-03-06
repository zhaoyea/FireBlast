<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*" import="java.util.*"
	import="model.*" import="db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Results</title>
<link rel="stylesheet"
	href="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
</head>
<body>
	<%
		if (session.getAttribute("Username") == null || session.getAttribute("User") != null) {
			response.sendRedirect("ErrorPage.jsp");	
		} else {
	%>
	
	<%@include file="AdminSearchBar.jsp"%>
	
	<%
		ArrayList<Games> resultsList = (ArrayList<Games>) session.getAttribute("AdminGameResults");

			if (resultsList != null) {
	%>

	<center>
		<div class="row">
			<h2>Search Results</h2>
			<hr>
			<table class="hover">
				<thead>
					<tr>
						<td>Game ID</td>
						<td></td>
						<td>Game Name</td>
						<td>Description</td>
						<td>Price</td>
						<td>ReleaseDate</td>
						<td>Console</td>
						<td>Quantity</td>
						<td>Action</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<%
							for (Games inv : resultsList) {
						%>
						<td><%=inv.getId()%><input type="hidden"
							value="<%=inv.getId()%>" name="gameID"></td>
						<td><img src="<%=inv.getImageLink()%>"
							alt="<%=inv.getName()%>" width="100px" height="200px" /></td>
						<td><%=inv.getName()%></td>
						<td><%=inv.getDescription()%></td>
						<td><%=inv.getPrice()%></td>
						<td><%=inv.getDate()%></td>
						<td><%=inv.getConsole()%></td>
						<td><%=inv.getQuantity()%></td>
						<td><a
							href="AdminUpdateGames.jsp?id=<%=inv.getId()%>&console=<%=inv.getConsole()%>"
							class="tiny warning button">Update</a> <br /> <a
									href="DeleteGamesServlet?id=<%=inv.getId()%>&console=<%=inv.getConsole()%>"
									class="tiny alert button">Delete</a>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</center>
	<%
		}
	%>
	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script
		src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
	<script>
		$(document).foundation();
	</script>
	<%
		}
	%>
</body>
</html>