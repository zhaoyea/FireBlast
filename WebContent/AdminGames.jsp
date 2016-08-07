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
				PreparedStatement getPS4 = conn.prepareStatement("SELECT * FROM games WHERE console='PS4'");
				ResultSet ps4 = getPS4.executeQuery();
	%>
	<br />
	<div class="row" id="content">
		<nav aria-label="You are here:" role="navigation">
		<ul class="breadcrumbs">
			<li><a href="AdminPanel.jsp">Admin Panel</a></li>
			<li>Games Table</li>
			<li><a href="AdminGenre.jsp">Genre Table</a></li>
			<li><a href="AdminMembers.jsp">Member Table</a></li>
		</ul>
		</nav>

		<ul class="tabs" data-tabs id="example-tabs">
			<li class="tabs-title is-active"><a href="#panel1"
				aria-selected="true">PS4</a></li>
			<li class="tabs-title"><a href="#panel2">XBox</a></li>
			<li class="tabs-title"><a href="#panel3">PC</a></li>
		</ul>

		<div class="tabs-content" data-tabs-content="example-tabs">
			<div class="tabs-panel is-active" id="panel1">
				<div class="row">
					<h4 class="text-center">PS4</h4>
					<%
						if (session.getAttribute("deleteGame") != null) {
					%>
					<center>
						<div data-alert class="info label">
							<strong>Note:</strong>
							<%=session.getAttribute("deleteGame")%>
						</div>
					</center>
					<%
						session.removeAttribute("deleteGame");
								}
					%>
					<table class="hover">
						<thead>
							<tr>
								<td>GameID</td>
								<td>Game Name</td>
								<td>Description</td>
								<td>Price</td>
								<td>Release Date</td>
								<td>Console</td>
								<td>Quantity</td>
								<td></td>
								<td>Image Link</td>
								<td>Action</td>
							</tr>
						</thead>
						<tbody>
							<%
								while (ps4.next()) {
							%>
							<tr>
								<td><%=ps4.getInt("GameID")%></td>
								<td><small><%=ps4.getString("Name")%></small></td>
								<td><small><%=ps4.getString("Description")%></small></td>
								<td><small><%=ps4.getDouble("Price")%></small></td>
								<td><small><%=ps4.getString("ReleaseDate")%></small></td>
								<td><small><%=ps4.getString("Console")%></small></td>
								<td><small><%=ps4.getInt("Quantity")%></small></td>
								<td><img src="<%=ps4.getString("GameImageLink")%>"
									alt="<%=ps4.getString("Name")%>" width="100px" height="200px"></td>
								<td><small><%=ps4.getString("GameImageLink")%></small></td>
								<td><a
									href="AdminUpdateGames.jsp?id=<%=ps4.getString("GameID")%>&console=<%=ps4.getString("Console")%>"
									class="tiny warning button">Update</a> <br /> <a
									href="DeleteGamesServlet?id=<%=ps4.getString("GameID")%>&console=<%=ps4.getString("Console")%>"
									class="tiny alert button">Delete</a></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>

			<%
				PreparedStatement getXbox = conn.prepareStatement("SELECT * FROM games WHERE console='XBox'");
						ResultSet xbox = getXbox.executeQuery();
			%>

			<div class="tabs-panel is-active" id="panel2">
				<div class="row">
					<h4 class="text-center">XBox</h4>
					<table class="hover">
						<thead>
							<tr>
								<td>GameID</td>
								<td>Game Name</td>
								<td>Description</td>
								<td>Price</td>
								<td>Release Date</td>
								<td>Console</td>
								<td>Quantity</td>
								<td></td>
								<td>Image Link</td>
								<td>Action</td>
							</tr>
						</thead>
						<tbody>
							<%
								while (xbox.next()) {
							%>
							<tr>
								<td><%=xbox.getInt("GameID")%></td>
								<td><small><%=xbox.getString("Name")%></small></td>
								<td><small><%=xbox.getString("Description")%></small></td>
								<td><small><%=xbox.getDouble("Price")%></small></td>
								<td><small><%=xbox.getString("ReleaseDate")%></small></td>
								<td><small><%=xbox.getString("Console")%></small></td>
								<td><small><%=xbox.getInt("Quantity")%></small></td>
								<td><img src="<%=xbox.getString("GameImageLink")%>"
									alt="<%=xbox.getString("Name")%>" width="100px" height="200px"></td>
								<td><small><%=xbox.getString("GameImageLink")%></small></td>
								<td><a
									href="AdminUpdateGames.jsp?id=<%=xbox.getString("GameID")%>&console=<%=xbox.getString("Console")%>"
									class="tiny warning button">Update</a> <br /> <a
									href="DeleteGamesServlet?id=<%=xbox.getString("GameID")%>&console=<%=xbox.getString("Console")%>"
									class="tiny alert button">Delete</a></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>

			<%
				PreparedStatement getPC = conn.prepareStatement("SELECT * FROM games WHERE console='PC'");
						ResultSet pc = getPC.executeQuery();
			%>

			<div class="tabs-panel is-active" id="panel3">
				<div class="row">
					<h4 class="text-center">PS4</h4>
					<table class="hover">
						<thead>
							<tr>
								<td>GameID</td>
								<td>Game Name</td>
								<td>Description</td>
								<td>Price</td>
								<td>Release Date</td>
								<td>Console</td>
								<td>Quantity</td>
								<td></td>
								<td>Image Link</td>
								<td>Action</td>
							</tr>
						</thead>
						<tbody>

							<%
								while (pc.next()) {
							%>

							<tr>
								<td><%=pc.getInt("GameID")%></td>
								<td><small><%=pc.getString("Name")%></small></td>
								<td><small><%=pc.getString("Description")%></small></td>
								<td><small><%=pc.getDouble("Price")%></small></td>
								<td><small><%=pc.getString("ReleaseDate")%></small></td>
								<td><small><%=pc.getString("Console")%></small></td>
								<td><small><%=pc.getInt("Quantity")%></small></td>
								<td><img src="<%=pc.getString("GameImageLink")%>"
									alt="<%=pc.getString("Name")%>" width="100px" height="200px"></td>
								<td><small><%=pc.getString("GameImageLink")%></small></td>
								<td><a
									href="AdminUpdateGames.jsp?id=<%=pc.getString("GameID")%>&console=<%=pc.getString("Console")%>"
									class="tiny warning button">Update</a> <br /> <a
									href="DeleteGamesServlet?id=<%=pc.getString("GameID")%>&console=<%=pc.getString("Console")%>"
									class="tiny alert button">Delete</a></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
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