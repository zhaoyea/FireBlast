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

			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM Games WHERE GameID=?");
			pstmt.setString(1, GameID);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
	%>

	<br>
	<!-- You can now combine a row and column if you just need a 12 column row -->
	<div class="row columns">
		<nav aria-label="You are here:" role="navigation">
		<ul class="breadcrumbs">
			<li><a href="DemoIndex.jsp">Home</a></li>
			<li><a href="#"><%=rs.getString("Name")%></a></li>
		</ul>
		</nav>
	</div>


	<div class="row">
		<div class="medium-6 columns">
			<img class="thumbnail" src="<%=rs.getString("GameImageLink")%>">
		</div>

		<div class="medium-6 large-5 columns">
			<h3><%=rs.getString("Name")%></h3>
			<p></p>
			<div class="callout">
				<ul class="menu simple">
					<%=rs.getString("Description")%>
				</ul>
			</div>

			<h3>Genre</h3>
			<%
				PreparedStatement getGenre = conn.prepareStatement(
								"SELECT * FROM Games a, Genre b, GamesGenre c WHERE a.GameID = c.GameID AND b.GenreID = c.GenreID AND c.gameID = ? ");
						getGenre.setString(1, GameID);
						ResultSet genre = getGenre.executeQuery();

						while (genre.next()) {
			%>

			
				<span class="success label"><%=genre.getString("b.Genre")%></span>
			

			<%
				}
						genre.close();
			%>

			<hr>

			<h4>Console</h4>
			<div class="small button-group">
				<a class="button">PS4</a> <a class="success button">XBox</a> <a
					class="warning button">PC</a>
			</div>
			<h4>Quantity</h4>
			<a href="#" class="button large">Buy Now $<%=rs.getString("Price")%></a>
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
		<div class="tabs-content" data-tabs-content="example-tabs">
			<div class="tabs-panel is-active" id="panel1">
				<h4>Reviews</h4>
				<div class="media-object">
					<div class="media-object-section">
						<div class="thumbnail">
							<img src="assets/img/media-object/avatar-1.jpg">
						</div>
					</div>
					<div class="media-object-section">
						<h4>I'm First!</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Porro at, tenetur cum beatae excepturi id ipsa? Esse dolor
							laboriosam itaque ea nesciunt, earum, ipsum commodi beatae velit
							id enim repellat.</p>
						<!-- Nested media object starts here -->
						<div class="media-object">
							<div class="media-object-section">
								<div class="thumbnail">
									<img src="assets/img/media-object/avatar-2.jpg">
								</div>
							</div>
							<div class="media-object-section">
								<h4>I'm Second!</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Voluptas magni, quam mollitia voluptatum in, animi suscipit
									tempora ea consequuntur non nulla vitae doloremque. Eius rerum,
									cum earum quae eveniet odio.</p>
							</div>
						</div>
						<!-- And ends here -->
					</div>
				</div>
				<label> My Review <textarea placeholder="None"></textarea>
				</label>
				<button class="button">Submit Review</button>
			</div>


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

					ResultSet rs = pstmt.executeQuery();
			%>

			<div class="tabs-panel" id="panel2">
				<div class="row medium-up-3 large-up-5">
					<%
						while (rs.next()) {
					%>
					<div class="column">
						<a
							href="DemoProduct.jsp?id=<%=rs.getString("GameID")%>&console=<%=rs.getString("Console")%>">
							<img src="<%=rs.getString("GameImageLink")%>"
							alt="<%=rs.getString("Name")%>" width="161px" height="220px">
						</a>
						<h6><%=rs.getString("Name")%></h6>
						<a href="#" class="button hollow tiny expanded">Buy Now @ $<%=rs.getString("Price")%></a>
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