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
	<%@ include file="navBar.jsp"%>
	<br />
	<%
		String search = request.getParameter("searchString");
		ArrayList<Games> resultsList = (ArrayList<Games>) session.getAttribute("GameResults");

		if (resultsList != null) {
	%>
	<div class="row" id="content">
		<nav aria-label="You are here:" role="navigation">
		<ul class="breadcrumbs">
			<li><a href="DemoIndex.jsp">Home</a></li>
			<li><a href="navBar.jsp">Search</a></li>
		</ul>
		</nav>

		<div class="row medium-8 large-7 columns">
			<div class="blog-post">
				<%
					for (Games inv : resultsList) {
				%>
				<h3>
					<%=inv.getName()%><small> / <%=inv.getPrice()%></small>
				</h3>
				<a
					href="DemoProduct.jsp?id=<%=inv.getId()%>&console=<%=inv.getConsole()%>">
					<img src="<%=inv.getImageLink()%>" alt="<%=inv.getName()%>"
					width="161px" height="220px">
				</a>
				<p></p>
				<div class="callout">
					<ul class="menu simple">
						<%=inv.getDescription()%>
					</ul>
				</div>
				<a
					href="DemoProduct.jsp?id=<%=inv.getId()%>&console=<%=inv.getConsole()%>"
					class="button large">Learn More</a>

				<hr>

				<%
					}
				%>
			</div>
		</div>

		<%
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