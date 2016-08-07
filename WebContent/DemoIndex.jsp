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
	<br/>
	<center>
		<ul class="orbit-container">
			<li class="orbit-slide is-active"><img
				src="http://imgur.com/ZH6vSYE.png"></li>
		</ul>
	</center>

	<div class="row column text-center">
		<h4>Welcome to LiquidBlast Gaming</h4>
		<a href="#" class="button large">Learn More</a>
	</div>

	<hr>

	<div class="row column text-center">
		<h2>PS4</h2>
		<a href="DemoPS.jsp" class="button hollow tiny">More on PS4 Games</a>
		<hr>
	</div>

	<div class="row small-up-2 medium-up-3 large-up-6">
		<%
			try {
				Connection conn = DBConn.getConnection();

				PreparedStatement pstmt = conn
						.prepareStatement("SELECT * FROM games WHERE Console='PS4' ORDER BY RAND() LIMIT 6");

				ResultSet ps4 = pstmt.executeQuery();

				while (ps4.next()) {
		%>
		<div class="column">
			<a
				href="DemoProduct.jsp?id=<%=ps4.getString("GameID")%>&console=<%=ps4.getString("Console")%>">
				<img src="<%=ps4.getString("GameImageLink")%>"
				alt="<%=ps4.getString("Name")%>" width="161px" height="220px">
			</a>
			<h6><%=ps4.getString("Name")%></h6>
			<a
				href="DemoProduct.jsp?id=<%=ps4.getString("GameID")%>&console=<%=ps4.getString("Console")%>"
				class="button small expanded hollow">View</a>
		</div>
		<%
			}
		%>
	</div>

	<%
		conn.close();
		} catch (Exception e) {
			out.println("Error :" + e);
		}
	%>

	<hr>

	<div class="row column text-center">
		<h2>XBox</h2>
		<a href="DemoXbox.jsp" class="button hollow tiny">More on XBox
			Games</a>
		<hr>
	</div>

	<div class="row small-up-2 medium-up-3 large-up-6">
		<%
			try {
				Connection conn = DBConn.getConnection();

				PreparedStatement pstmt = conn
						.prepareStatement("SELECT * FROM games WHERE Console='XBox' ORDER BY RAND() LIMIT 6");

				ResultSet xbox = pstmt.executeQuery();

				while (xbox.next()) {
		%>
		<div class="column">
			<a
				href="DemoProduct.jsp?id=<%=xbox.getString("GameID")%>&console=<%=xbox.getString("Console")%>">
				<img src="<%=xbox.getString("GameImageLink")%>"
				alt="<%=xbox.getString("Name")%>" width="161px" height="220px">
			</a>
			<h6><%=xbox.getString("Name")%></h6>
			<a
				href="DemoProduct.jsp?id=<%=xbox.getString("GameID")%>&console=<%=xbox.getString("Console")%>"
				class="button small expanded hollow">View</a>
		</div>
		<%
			}
		%>
	</div>

	<%
		conn.close();
		} catch (Exception e) {
			out.println("Error :" + e);
		}
	%>

	<hr>

	<div class="row column text-center">
		<h2>PC</h2>
		<a href="DemoPC.jsp" class="button hollow tiny">More on PC Games</a>
		<hr>
	</div>

	<div class="row small-up-2 medium-up-3 large-up-6">
		<%
			try {
				Connection conn = DBConn.getConnection();

				PreparedStatement pstmt = conn
						.prepareStatement("SELECT * FROM games WHERE Console='PC' ORDER BY RAND() LIMIT 6");

				ResultSet pc = pstmt.executeQuery();

				while (pc.next()) {
		%>
		<div class="column">
			<a
				href="DemoProduct.jsp?id=<%=pc.getString("GameID")%>&console=<%=pc.getString("Console")%>">
				<img src="<%=pc.getString("GameImageLink")%>"
				alt="<%=pc.getString("Name")%>" width="161px" height="220px">
			</a>
			<h6><%=pc.getString("Name")%></h6>
			<a
				href="DemoProduct.jsp?id=<%=pc.getString("GameID")%>&console=<%=pc.getString("Console")%>"
				class="button small expanded hollow">View</a>
		</div>
		<%
			}
		%>
	</div>

	<%
		conn.close();
		} catch (Exception e) {
			out.println("Error :" + e);
		}
	%>

	<!-- Footer -->
	<footer>
	<div class="row">
		<div class="col-lg-12">
			<hr>
			<p>Copyright &copy; LiquidBlast Gaming 2016</p>
		</div>
	</div>
	</footer>

	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script
		src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
	<script>
		$(document).foundation();
	</script>
</body>
</html>