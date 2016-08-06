<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Panel</title>
<link rel="stylesheet"
	href="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
</head>
<body>
	<%@ include file="AdminNavBar.jsp"%>

	<%
		//code to display error if user try to enter Admin Page through url
	%>

	<br />
	<div class="row" id="content">
		<nav aria-label="You are here:" role="navigation">
		<ul class="breadcrumbs">
			<li>Admin Panel</li>
			<li><a href="AdminGames.jsp">Games Table</a></li>
			<li><a href="AdminGenre.jsp">Genre Table</a></li>
			<li><a href="AdminMembers.jsp">Members Table</a></li>
		</ul>
		</nav>
	</div>
	<%@ include file="AdminSearchBar.jsp"%>

	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script
		src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
	<script>
		$(document).foundation();
		$(document).foundation('alert', 'reflow');
	</script>
</body>
</html>