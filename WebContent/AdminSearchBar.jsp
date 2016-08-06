<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*" import="java.util.*"
	import="model.*" import="db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Results</title>
<link rel="stylesheet"
	href="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
</head>
<body>
	<br />
	<center>
		<form action="" method="post">
			<div class="row" id="content">
				<ul class="menu">
					<small>What do you want to search?</small>
					<li><input type="search" placeholder="Search"
						name="searchString"></li>
					<li><button type="submit" value="search" class="button">Search</button></li>
				</ul>
			</div>
		</form>

		<%
			String search = request.getParameter("searchString");
			ArrayList<Games> resultsList = (ArrayList<Games>) session.getAttribute("GameResults");

			if (resultsList != null) {
		%>

	</center>
	<%
		}
	%>
	</div>
	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script
		src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
	<script>
		$(document).foundation();
	</script>
</body>
</html>