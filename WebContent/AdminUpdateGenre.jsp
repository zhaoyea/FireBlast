<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="db.*, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
	<br />
	<%
		String GenreID = request.getParameter("genreid");
			try {
				Connection conn = DBConn.getConnection();

				PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM Genre WHERE GenreID=?");
				pstmt.setString(1, GenreID);

				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
	%>
	<div class="row" id="content">
		<div class="row columns">
			<nav aria-label="You are here:" role="navigation">
			<ul class="breadcrumbs">
				<li><a href="AdminGenre.jsp">Genre Tables</a></li>
				<li>Updating: <%=rs.getString("Genre")%></li>
			</ul>
			</nav>
		</div>
		<%
			if (session.getAttribute("GenreField") != null) {
		%>
		<div data-alert class="alert label">
			<strong>Error!:</strong>
			<%=session.getAttribute("GenreField")%>
		</div>
		<%
			session.removeAttribute("GenreField");
						}
		%>
		<form action="UpdateGenreServlet" method="post">
			<center>
				<table>
					<thead>
						<tr>
							<td>GenreID</td>
							<td>Genre</td>
						</tr>
					</thead>
					<tbody>
						<td><%=rs.getInt("GenreID")%></td>
						<td><input type="text" value="<%=rs.getString("Genre")%>"
							name="updateGenre" /></td>
					</tbody>
				</table>
				<input type="hidden" value="<%=rs.getInt("GenreID")%>"
					name="genreID" />
				<%
					}
				%>
				<hr>
				<button type="submit" class="small expanded button">Update</button>
			</center>
		</form>
	</div>
	<%
		} catch (Exception e) {
				System.out.println("Error:" + e);
			}
	%>
	<%
		}
	%>
</body>
</html>