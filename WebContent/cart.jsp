<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*" import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("displayCart");
		for (Cart c : cartList) {
	%>

	<%@ include file="navBar.jsp"%>
	<br />
	<div class="row" id="content">
		<nav aria-label="You are here:" role="navigation">
		<ul class="breadcrumbs">
			<li><a href="DemoIndex.jsp">Home</a></li>
			<li><a href="cart.jsp">Shopping Cart</a></li>
		</ul>
		</nav>

		<h2>Shopping Cart</h2>

		<table>
			<thead>
				<tr>
					<th width="200">Price</th>
					<th></th>
					<th width="150">Subtotal</th>
					<th width="150"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><img src="<%=c.getImageLink()%>" alt="<%=c.getName()%>" width="100px" height="200px"></td>
					<td><%=c.getName()%><br /><%=c.getConsole()%></td>
					<td><%=c.getQuantity()%></td>
					<td><%=c.getPrice()%></td>
				</tr>				
			</tbody>
		</table>
	</div>

	<%
		}
	%>
</body>
</html>