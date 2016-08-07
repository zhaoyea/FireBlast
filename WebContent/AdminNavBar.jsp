<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*" import="model.*"%>
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

	<!-- Start Top Bar -->
	<div class="top-bar">
		<div class="row">
			<div class="top-bar-left">
				<ul class="dropdown menu" data-dropdown-menu>
					<li class="menu-text">LiquidBlast</li>
					<li class="has-submenu"><a href="#">Tables</a>
						<ul class="submenu menu vertical" data-submenu>
							<li><a href="AdminGames.jsp">Games</a></li>
							<li><a href="AdminGenre.jsp">Genre</a></li>
							<li><a href="AdminMembers.jsp">Members</a></li>
						</ul>
					</li>					
					<li class="has-submenu"><a href="#">Insert</a>
						<ul class="submenu menu vertical" data-submenu>
							<li><a href="AdminInsertGames.jsp">Games</a></li>
							<li><a href="AdminInsertGenre.jsp">Genre</a></li>							
						</ul>
					</li>
					<li class="has-submenu"><a href="#">Delete</a>
						<ul class="submenu menu vertical" data-submenu>
							<li><a href="AdminInsertGames.jsp">Games</a></li>
							<li><a href="AdminInsertGenre.jsp">Genre</a></li>
							<li><a href="AdminInsertMembers.jsp">Members</a></li>
						</ul>
					</li>
					<li><a href="AdminSearchBar.jsp">Search</a>
				</ul>
			</div>
			<div class="top-bar-right">
				<ul class="menu">
					<li></li>
					<%
						session.setAttribute("searchCode", "admin");
					%>
					<li></li>
					<li>
						<%
							if (session.getAttribute("Username") != null) {
						%>
						<ul class="dropdown menu" data-dropdown-menu>
							<li class="has-submenu"><a href="#"><%=session.getAttribute("Username")%></a>
								<ul class="submenu menu vertical" data-submenu>									
									<li><a href="logout">Log Out</a></li>
								</ul></li>
						</ul> <%
 	} else {
 %>
					
					<li><a href="login.jsp">Login</a></li>
				</ul>
				<%
					}
				%>
			</div>


		</div>
	</div>
	<!-- End Top Bar -->


	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script
		src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
	<script>
		$(document).foundation();
	</script>
</body>
</html>