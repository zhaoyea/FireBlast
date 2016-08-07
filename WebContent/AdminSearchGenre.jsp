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

	<%@ include file="AdminSearchBar.jsp"%>
	<div class="row" id="content">
		<nav aria-label="You are here:" role="navigation">
		<ul class="breadcrumbs">
			<li><a href="AdminPanel.jsp">Admin Panel</a></li>
			<li><a href="AdminGames.jsp">Games Table</li>
			<li>Genre Table</li>
			<li><a href="AdminMembers.jsp">Member Table</a></li>
			<li><a href="AdminSearchStock.jsp">Member Table</a></li>
		</ul>
		</nav>
	</div>

	<%
		ArrayList<Genre> resultsList = (ArrayList<Genre>) session.getAttribute("AdminGenreResults");

			if (resultsList != null) {
	%>

	<center>
		<div class="row">
			<h2>Search Results</h2>
			<hr>
			<table class="hover">
				<thead>
					<tr>
						<td>Genre ID</td>
						<td>Genre Name</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<%
							for (Genre inv : resultsList) {
						%>
						<td><%=inv.getGenreID()%></td>
						<td><%=inv.getGenre()%></td>
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