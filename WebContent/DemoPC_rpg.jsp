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
			window.location = "DemoPC_action.jsp";
			break;

		case "Adventure":
			window.location = "DemoPC_adventure.jsp";
			break;

		case "Casual":
			window.location = "DemoPC_casual.jsp";
			break;
		case "RPG":
			window.location = "DemoPC_rpg.jsp";
			break;

		case "Sports":
			window.location = "DemoPC_sports.jsp";
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
		try {
			Connection conn = DBConn.getConnection();

			PreparedStatement pstmt = conn.prepareStatement(
					"SELECT a.* FROM Games a, Genre b, GamesGenre c WHERE a.GameID = c.GameID AND b.GenreID = c.GenreID AND a.Console ='PC' AND b.Genre='RPG'");

			ResultSet pc = pstmt.executeQuery();
	%>
	<br>
	<div class="row" id="content">
		<nav aria-label="You are here:" role="navigation">
		<ul class="breadcrumbs">
			<li><a href="DemoIndex.jsp">Home</a></li>
			<li><a href="DemoPC.jsp">PC</a></li>
			<li><a href="DemoPC_rpg.jsp">RPG</a></li>
		</ul>
		</nav>
		<div class="medium-8 columns">
			<div class="blog-post">
				<%
					while (pc.next()) {
				%>
				<h3><%=pc.getString("Name")%><small> / <%=pc.getString("Price")%></small>
				</h3>
				<a
					href="DemoProduct.jsp?id=<%=pc.getString("GameID")%>&console=<%=pc.getString("Console")%>">
					<img src="<%=pc.getString("GameImageLink")%>"
					alt="<%=pc.getString("Name")%>" width="161px" height="220px">
				</a>
				<p></p>
				<div class="callout">
					<ul class="menu simple">
						<%=pc.getString("Description")%>
					</ul>
				</div>
				<a
					href="DemoProduct.jsp?id=<%=pc.getString("GameID")%>&console=<%=pc.getString("Console")%>"
					class="button large">Learn More</a>

				<hr>
				<%
					}
				%>
			</div>
		</div>


		<%
			PreparedStatement getGenre = conn.prepareStatement("SELECT * FROM Genre");
				ResultSet genre = getGenre.executeQuery();
		%>


		<div class="medium-3 columns" data-sticky-container>
			<div class="sticky" data-sticky data-anchor="content">
				<h4>Categories</h4>
				<select id="s1" NAME="section" class="ui search dropdown"
					onChange="SelectRedirect();">
					<option value="">RPG</option>
					<ul>
						<%
							while (genre.next()) {
						%>
						<option><%=genre.getString("genre")%></option>

						<%
							}
						%>
					
				</select>
				</ul>


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