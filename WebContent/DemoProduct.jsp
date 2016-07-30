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

			<span class="hollow button"><%=genre.getString("b.Genre")%></span>

			<%
				}
						genre.close();
			%>


			<div class="row" data-sticky-container>
				<div class="sticky" data-sticky data-anchor="content">
					<h4>Console</h4>
					<select id="s1" NAME="section" class="ui search dropdown">
						<option value="">Please Choose</option>
						<ul>						
							<span class=""><%=rs.getString("Console")%></span>						
						</ul>
					</select>
				</div>
			</div>

			<hr>

			<div class="row">
				<div class="small-3 columns">
					<h4>Quantity</h4>
				</div>
				<div class="small-9 columns">
					<input type="text" id="middle-label" placeholder="1, 2 or 3">
				</div>
			</div>

			<a href="#" class="button large expanded">Buy Now $<%=rs.getString("Price")%></a>
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
				<div class="media-object stack-for-small">
					<div class="media-object-section">
						<img class="thumbnail" src="http://placehold.it/200x200">
					</div>
					<div class="media-object-section">
						<h5>Mike Stevenson</h5>
						<p>I'm going to improvise. Listen, there's something you
							should know about me... about inception. An idea is like a virus,
							resilient, highly contagious. The smallest seed of an idea can
							grow. It can grow to define or destroy you.</p>
					</div>
				</div>
				<div class="media-object stack-for-small">
					<div class="media-object-section">
						<img class="thumbnail" src="http://placehold.it/200x200">
					</div>
					<div class="media-object-section">
						<h5>Mike Stevenson</h5>
						<p>I'm going to improvise. Listen, there's something you
							should know about me... about inception. An idea is like a virus,
							resilient, highly contagious. The smallest seed of an idea can
							grow. It can grow to define or destroy you</p>
					</div>
				</div>
				<div class="media-object stack-for-small">
					<div class="media-object-section">
						<img class="thumbnail" src="http://placehold.it/200x200">
					</div>
					<div class="media-object-section">
						<h5>Mike Stevenson</h5>
						<p>I'm going to improvise. Listen, there's something you
							should know about me... about inception. An idea is like a virus,
							resilient, highly contagious. The smallest seed of an idea can
							grow. It can grow to define or destroy you</p>
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

	<div class="row column">
		<hr>
		<ul class="menu">
			<li>Yeti Store</li>
			<li><a href="#">Home</a></li>
			<li><a href="#">About</a></li>
			<li><a href="#">Contact</a></li>
			<li class="float-right">Copyright 2016</li>
		</ul>
	</div>



	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script
		src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
	<script>
		$(document).foundation();
	</script>
</body>
</html>