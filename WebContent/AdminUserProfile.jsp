<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="db.*, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Profile</title>

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
	int userID = Integer.parseInt(request.getParameter("id"));
	
	try {
		Connection conn = DBConn.getConnection();
		PreparedStatement getMembers = conn.prepareStatement("SELECT * FROM members WHERE UserID=?");
		getMembers.setInt(1, userID);
		ResultSet members = getMembers.executeQuery();
%>
<br />
	<div class="row" id="content">
		<nav aria-label="You are here:" role="navigation">
		<ul class="breadcrumbs">
			<li><a href="AdminMembers.jsp">Members Table</a></li>
			<li>User Profile</li>
		</ul>
		</nav>
		<center>
			<%
				if (session.getAttribute("updateProfile") != null) {
			%>
			<div data-alert class="success label">
				<strong>Success!</strong>
				<%=session.getAttribute("updateProfile")%>
			</div>
			<%
				session.removeAttribute("updateProfile");
					}
			%>
		</center>
		<center>
			<h4 class="text-center">User Profile</h4>
			<table class="hover">
				<thead>
					<tr>
						<td>FirstName</td>
						<td>LastName</td>
						<td>Email</td>
						<td>Contact</td>
						<td>Mailing Address</td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<%
						while (members.next()) {
					%>
					<tr>
						<td><small><%=members.getString("FirstName")%></small></td>
						<td><small><%=members.getString("LastName")%></small></td>
						<td><small><%=members.getString("Email")%></small></td>
						<td><small><%=members.getInt("Contact")%></small></td>
						<td><small><%=members.getString("Address")%></small></td>
						<td><a
							href="UpdateMemberDetails.jsp?id=<%=members.getString("UserID")%>"
							class="tiny warning button">Edit</a></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</center>
		<h4 class="text-center">Purchased History</h4>

		<%
			PreparedStatement getPurchased = conn.prepareStatement("SELECT * FROM transaction WHERE UserID=?");
				getPurchased.setInt(1, userID);
				ResultSet ph = getPurchased.executeQuery();
				while (ph.next()) {
		%>
		<center>
			<table>
				<tbody>
					<tr>
						<td></td>
						<td>Game Name</td>
						<td>Quantity</td>
						<td>Total Price</td>
					</tr>
					<tr>
						<td><img src="<%=ph.getString("GameImageLink")%>"
							alt="<%=ph.getString("GameName")%>" width="100px" height="200px"></td>
						<td><small><%=ph.getString("GameName")%><br /> <span
								class="secondary label"><%=ph.getString("Console")%></span></small></td>
						<td><small>Order: <%=ph.getString("QuantityOrdered")%></small></td>
						<td><small class="label">$<%=ph.getString("TotalPrice")%></small></td>
					</tr>

				</tbody>
			</table>
		</center>
		<%
			}
		%>
	</div>

	<%
		conn.close();
		} catch (Exception e) {
			System.out.println("Error:" + e);
		}
	%>
<%} %>
</body>
</html>