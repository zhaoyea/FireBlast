<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*" import="model.*"
	import="db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet"
	href="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<%
		try {
			String firstName = request.getParameter("FristName");
			String lastName = request.getParameter("LastName");
			
			Connection conn = DBConn.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM members WHERE FirstName=? AND LastName=?");
			pstmt.setString(1, firstName);
			pstmt.setString(2, lastName);

			ResultSet user = pstmt.executeQuery();
	%>


	<!-- Start Top Bar -->
	<div class="top-bar">
		<div class="row">
			<div class="top-bar-left">
				<ul class="dropdown menu" data-dropdown-menu>
					<li class="menu-text">LiquidBlast</li>
					<li class="has-submenu"><a href="#">Console</a>
						<ul class="submenu menu vertical" data-submenu>
							<li><a href="DemoPS.jsp">PS4</a></li>
							<li><a href="DemoXbox.jsp">XBox</a></li>
							<li><a href="DemoPC.jsp">PC</a></li>
						</ul></li>
					<li><a href="#">About Us</a></li>
					<li><a href="#">Support</a></li>
				</ul>
			</div>

			<div class="top-bar-right">
				<ul class="menu">
					<li><form action="SearchGamesServlet" method="get"></li>
					<%
						session.setAttribute("searchCode", "user");
					%>
					<li><input type="search" placeholder="Search"
						name="searchString"></li>
					<li><button type="submit" value="search" class="button">Search</button></li>
				</ul>
			</div>
			<ul class="dropdown menu" data-dropdown-menu>
				<li><a href="#"></a>
					<ul class="menu">
						<li><a href="#">Item 1A</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	<!-- End Top Bar -->
	<%
		conn.close();
		} catch (Exception e) {
			out.println("Error :" + e);
		}
	%>

	<!-- Bootstrap Core JavaScript -->
	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script
		src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
	<script>
		$(document).foundation();
	</script>
</body>
</html>