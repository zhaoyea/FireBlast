<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="db.*" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Demo Product Page</title>
<link rel="stylesheet"
	href="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
</head>
<body>
	<%@ include file="navBar.jsp"%>
	<%
		String GameID = request.getParameter("id");

		try {
			Connection conn = DBConn.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM games WHERE GameID=?");
			pstmt.setString(1, GameID);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
	%>

	<br/>
	
	<div class="row columns">
		<nav aria-label="You are here:" role="navigation">
		<ul class="breadcrumbs">
			<li><a href="DemoIndex.jsp">Home</a></li>
			<li><a href="#"><%=rs.getString("Name")%></a></li>
		</ul>
		</nav>
	</div>

	<div class="row">
		<center>
			<%
				if (session.getAttribute("inputQuantityError") != null) {
			%>
			<div data-alert class="alert label">
				<strong>Error!</strong>
				<%=session.getAttribute("inputQuantityError")%>
			</div>
			<%
				session.removeAttribute("inputQuantityError");
						}
			%>
		</center>
		<div class="medium-6 columns">
			<img class="thumbnail" src="<%=rs.getString("GameImageLink")%>"
				alt="<%=rs.getString("Name")%>" width="350px" height="50px" />
		</div>



		<div class="medium-6 large-5 columns">
			<h3><%=rs.getString("Name")%></h3>
			<p><%=rs.getString("Description")%></p>


			<h3>Genre</h3>
			<%
				PreparedStatement getGenre = conn.prepareStatement(
								"SELECT * FROM games a, genre b, gamesgenre c WHERE a.GameID = c.GameID AND b.GenreID = c.GenreID AND c.gameID = ? ");
						getGenre.setString(1, GameID);
						ResultSet genre = getGenre.executeQuery();

						while (genre.next()) {
			%>


			<span class="success label"><%=genre.getString("b.Genre")%></span>


			<%
				}
						genre.close();
			%>




			<h3>Price</h3>
			<span class="alert label">$<%=rs.getDouble("Price")%></span>





			<%
				if (session.getAttribute("Username") != null) {
			%>
			<form action="Add2Cart" method="post">
				<div class="row">
					<div class="small-3 columns">
						<label for="middle-label" class="middle">Quantity</label>
					</div>
					<div class="small-9 columns">
						<input type="text" id="middle-label" placeholder="1"
							name="inputQuantity" required>
					</div>
				</div>
				<input type="hidden" value="<%=rs.getInt("GameID")%>" name="GameID">
				<input type="hidden" value="<%=rs.getString("Name")%>" name="name">
				<input type="hidden" value="<%=rs.getString("Description")%>"
					name="description"> <input type="hidden"
					value="<%=rs.getDouble("Price")%>" name="price"> <input
					type="hidden" value="<%=rs.getString("GameImageLink")%>"
					name="imageLink"> <input type="hidden"
					value="<%=rs.getString("Console")%>" name="console"> <input
					type="hidden" value="<%=rs.getInt("Quantity")%>" name="dbQuantity">
				<button type="submit" class="expanded button">Add to Cart</button>
			</form>
			<%
				} else {
			%>
			<form action="login.jsp" method="post">
				<div class="row">
					<div class="small-3 columns">
						<label for="middle-label" class="middle">Quantity</label>
					</div>
					<div class="small-9 columns">
						<input type="text" id="middle-label" placeholder="1">
					</div>
				</div>
				<button type="submit" class="expanded button">Add to Cart</button>

				<%
					}
				%>
				<%
					session.setAttribute("loginFirst", "Please login first before you can add a game to cart");
				%>
			</form>
		</div>
	</div>



	<%
		}
			conn.close();
		} catch (Exception e) {
			out.println("Error :" + e);
		}
	%>
	<div class="column row">
		<hr>
		<ul class="tabs" data-tabs id="example-tabs">
			<li class="tabs-title is-active"><a href="#panel1"
				aria-selected="true">Reviews</a></li>
			<li class="tabs-title"><a href="#panel2">Similar Products</a></li>
		</ul>
		<%
			try {
				Connection conn = DBConn.getConnection();

				PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM comment WHERE GameID=?");
				pstmt.setString(1, GameID);

				ResultSet comment = pstmt.executeQuery();

				while (comment.next()) {
		%>



		<div class="tabs-content" data-tabs-content="example-tabs">
			<form action="addComment" method="post">
				<div class="tabs-panel is-active" id="panel1">
					<h4>Reviews</h4>
					<div class="media-object">
						<div class="media-object-section">
							<h3><%=comment.getString("LastName")%></h3>
							<p><%=comment.getString("Comment")%></p>
						</div>
					</div>

					<%
						}
							conn.close();
						} catch (Exception e) {
							out.println("Error :" + e);
						}
					%>
					<label> My Review <textarea placeholder="None"></textarea>
					</label>
					<button class="button" type="submit">Submit Review</button>
				</div>
			</form>

			<!-- Start of DB Conn to Related games -->
			<%
				String console = request.getParameter("console");
				String gid = request.getParameter("id");

				try {
					Connection conn = DBConn.getConnection();

					PreparedStatement pstmt = conn.prepareStatement(
							"SELECT * FROM Games WHERE console LIKE ? AND GameID NOT LIKE ? ORDER BY RAND() LIMIT 5");
					pstmt.setString(1, console);
					pstmt.setString(2, gid);

					ResultSet relatedGames = pstmt.executeQuery();
			%>

			<div class="tabs-panel" id="panel2">
				<div class="row medium-up-3 large-up-5">
					<%
						while (relatedGames.next()) {
					%>
					<div class="column">
						<a
							href="DemoProduct.jsp?id=<%=relatedGames.getString("GameID")%>&console=<%=relatedGames.getString("Console")%>">
							<img src="<%=relatedGames.getString("GameImageLink")%>"
							alt="<%=relatedGames.getString("Name")%>" width="161px"
							height="220px">
						</a>
						<h6><%=relatedGames.getString("Name")%></h6>
						<a href="#" class="button hollow tiny expanded">Buy Now @ $<%=relatedGames.getString("Price")%></a>
					</div>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
	<%
		conn.close();
		} catch (Exception e) {
			out.println("Error :" + e);
		}
	%>

	<li class="float-right">Copyright 2016</li>




	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script
		src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
	<script>
		$(document).foundation();
	</script>
</body>
</html>