<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		if (session.getAttribute("Username") == null || session.getAttribute("User") != null) {
			response.sendRedirect("ErrorPage.jsp");	
		} else {
	%>

	<%@ include file="AdminSearchBar.jsp"%>

	<%
		ArrayList<Stock> resultsList = (ArrayList<Stock>) session.getAttribute("AdminStockResults");

			if (resultsList != null) {
	%>

	<center>
		<div class="row">
			<h2>Search Results</h2>
			<hr>
			<table class="hover">
				<thead>
					<tr>
						<td>Game Name</td>						
						<td>Quantiy</td>
						<td>Price</td>
						<td>Console</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<%
							for (Stock inv : resultsList) {
						%>
						<td><%=inv.getGameName()%></td>
						<td><%=inv.getQuantity()%></td>
						<td><%=inv.getPrice()%></td>
						<td><%=inv.getConsole()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</center>
	<%
		}
	%>

	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script
		src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
	<script>
		$(document).foundation();
	</script>
	<%
		}
	%>
</body>
</html>