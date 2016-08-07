<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Games</title>
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
					PreparedStatement getMembers = conn.prepareStatement("SELECT * FROM members");
					ResultSet members = getMembers.executeQuery();
	%>
	<br />
	<div class="row" id="content">
		<nav aria-label="You are here:" role="navigation">
		<ul class="breadcrumbs">
			<li><a href="AdminPanel.jsp">Admin Panel</a></li>
			<li><a href="AdminGames.jsp">Games Table</a></li>
			<li><a href="AdminGenre.jsp">Genre Table</a></li>
			<li>Members Table</li>
		</ul>
		</nav>

		<center>
			<h4 class="text-center">Members</h4>
			<table class="hover">
				<thead>
					<tr>
						<td>UserID</td>
						<td>FirstName</td>
						<td>LastName</td>
						<td>Email</td>
						<td>Password</td>
						<td>Contact</td>
						<td>Mailing Address</td>
						<td>User Type</td>
					</tr>
				</thead>
				<tbody>
					<%
						while (members.next()) {
					%>
					<tr>
						<td><%=members.getInt("UserID")%></td>
						<td><small><%=members.getString("FirstName")%></small></td>
						<td><small><%=members.getString("LastName")%></small></td>
						<td><small><%=members.getString("Email")%></small></td>
						<td><small><%=members.getString("Password")%></small></td>
						<td><small><%=members.getInt("Contact")%></small></td>
						<td><small><%=members.getString("Address")%></small></td>
						<td><small><%=members.getString("type")%></small></td>
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
</body>
</html>