<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="db.*" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PlayStation</title>
<link rel="stylesheet"
	href="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
<script>
	function SelectRedirect() {

		switch (document.getElementById('s1').value) {
		case "Action":
			window.location = "DemoPS_action.jsp";
			break;

		case "Adventure":
			window.location = "DemoPS_adventure.jsp";
			break;

		case "Casual":
			window.location = "DemoPS_casual.jsp";
			break;
		case "RPG":
			window.location = "DemoPS_rpg.jsp";
			break;

		case "Sports":
			window.location = "DemoPS_sports.jsp";
			break;

		/// Can be extended to other different selections of SubCategory //////
		default:
			window.location = "DemoIndex.jsp"; // if no selection matches then redirected to home page
			break;
		}// end of switch 
	}
</script>
</head>
<body>
	<%@ include file="navBar.jsp"%>
	<%
		String GameID = request.getParameter("id");
		try {
			Connection conn = DBConn.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM games WHERE Console='PS4'");

			ResultSet ps4 = pstmt.executeQuery();
	%>
	<br>
	<div class="row" id="content">
		<nav aria-label="You are here:" role="navigation">
		<ul class="breadcrumbs">
			<li><a href="DemoIndex.jsp">Home</a></li>
			<li><a href="DemoPS.jsp">PS4</a></li>
		</ul>
		</nav>
		<div class="medium-8 columns">
			<div class="blog-post">
				<%
					while (ps4.next()) {
				%>
				<h3><%=ps4.getString("Name")%><small> / <%=ps4.getString("Price")%></small>
				</h3>
				<a
					href="DemoProduct.jsp?id=<%=ps4.getString("GameID")%>&console=<%=ps4.getString("Console")%>">
					<img src="<%=ps4.getString("GameImageLink")%>"
					alt="<%=ps4.getString("Name")%>" width="161px" height="220px">
				</a>
				
				<p></p>
				<div class="callout">
					<ul class="menu simple">
						<%=ps4.getString("Description")%>
					</ul>
				</div>
				<a
					href="DemoProduct.jsp?id=<%=ps4.getString("GameID")%>&console=<%=ps4.getString("Console")%>"
					class="button large">Learn More</a>

				<hr>
				<%
					}
				%>
			</div>
		</div>


		<%
			PreparedStatement getGenre = conn.prepareStatement("SELECT * FROM genre");
				ResultSet genre = getGenre.executeQuery();
		%>


		<div class="medium-3 columns" data-sticky-container>
			<div class="sticky" data-sticky data-anchor="content">
				<h4>Categories</h4>
				<select id="s1" NAME="section" class="ui search dropdown"
					onChange="SelectRedirect();">
					<option value="">All</option>
					<ul>
						<%
							while (genre.next()) {
						%>
						<option><%=genre.getString("genre")%></option>

						<%
							}
						%>
					</ul>
				</select>
			</div>
		</div>

		<%
			genre.close();
		%>

	</div>


	<%
		conn.close();
		} catch (Exception e) {
			out.println("Error :" + e);
		}
	%>


	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script
		src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
	<script>
		$(document).foundation();
	</script>
</body>
</html>