<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Genre</title>
<link rel="stylesheet"
	href="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
</head>
<body>
	<%
		if (session.getAttribute("Username") == null || session.getAttribute("User") != null) {
			response.sendRedirect("ErrorPage.jsp");
		} else {
	%>

	<%@ include file="AdminNavBar.jsp"%>

	<%
		try {
				Connection conn = DBConn.getConnection();
				PreparedStatement getGenre = conn.prepareStatement("SELECT * FROM genre");
				ResultSet genre = getGenre.executeQuery();
	%>
	<br />
	<div class="row" id="content">
		<nav aria-label="You are here:" role="navigation">
		<ul class="breadcrumbs">
			<li><a href="AdminPanel.jsp">Admin Panel</a></li>
			<li><a href="AdminGames.jsp">Games Table</a></li>
			<li>Genre Table</li>
			<li><a href="AdminMembers.jsp">Stocks Table</a></li>

		</ul>
		</nav>

		<center>
			<h4 class="text-center">Genre</h4>
			<%
				if (session.getAttribute("GenreUpdate") != null) {
			%>
			<center>
				<div data-alert class="info label">
					<strong>Success!</strong>
					<%=session.getAttribute("GenreUpdate")%>
				</div>
			</center>
			<%
				session.removeAttribute("GenreUpdate");
						}
			%>
			<table class="hover">
				<thead>
					<tr>
						<td>GenreID</td>
						<td>Genre</td>
						<td>Action</td>
					</tr>
				</thead>
				<tbody>
					<%
						while (genre.next()) {
					%>
					<tr>
						<td><%=genre.getInt("GenreID")%></td>
						<td><%=genre.getString("Genre")%></td>
						<td><a
							href="AdminUpdateGenre.jsp?genreid=<%=genre.getInt("GenreID")%>"
							class="tiny warning button">Update</a> <br /> <a
							href="DeleteGenreServlet?id=<% %>" class="tiny alert button">Delete</a></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</center>
	</div>

	<%
		} catch (Exception e) {
				System.out.println("Error:" + e);
			}
	%>

	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script
		src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
	<script>
		$(document).foundation();
		$(document).foundation('alert', 'reflow');
	</script>
	<%
		}
	%>
</body>
</html>