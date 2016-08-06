<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="model.*" import="db.*"
	import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Checkout</title>
<link rel="stylesheet"
	href="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
</head>
<body>
	<%@ include file="navBar.jsp"%>
	<%
		ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("displayCart");
		double totalCost = 0;
	%>

	<br />
	<div class="row columns">
		<nav aria-label="You are here:" role="navigation">
		<ul class="breadcrumbs">
			<li><a href="cart.jsp">Shopping Cart</a></li>
			<li>Customer Information</li>
			<li><a href="payment.jsp">Payment Method</a></li>
		</ul>
		</nav>
		<div class="row" id="content">
			<div class="medium-10 columns">
				<div class="blog-post">
					<h4>Mailing Address</h4>
					<small> <%=session.getAttribute("Username")%> <br /> <%=((User) session.getAttribute("User")).getEmail()%>
						<br /> <%=((User) session.getAttribute("User")).getAddress()%> <br />
						<%=((User) session.getAttribute("User")).getContact()%> <br /> <a
						href="#">Edit Shipping Address</a>
					</small>
				</div>

				<hr>

				<h4>Checkout</h4>
				<table>
					<tbody>
						<%
							for (Cart c : cartList) {
						%>
						<tr>
							<td><img src="<%=c.getImageLink()%>" alt="<%=c.getName()%>"
								width="100px" height="200px"></td>
							<td><small><%=c.getName()%><br /> <span
									class="secondary label"><%=c.getConsole()%></span></small></td>
							<td><small>Order: <%=c.getQuantity()%></small></td>
							<td><small class="label">$<%=c.getPrice() * c.getQuantity()%></small></td>
						</tr>
						<%
							}
						%>

						<tr>
							<td><small>Total</small></td>
							<td></td>
							<td></td>
							<%
								for (Cart c : cartList) {
									totalCost += c.getPrice() * c.getQuantity();
								}
							%>
							<td>$<%=totalCost%></td>
						</tr>
					</tbody>
				</table>
				<a href="cart.jsp"><small>Back to Cart</small> </a>
				<hr>
				<br /> <a href="payment.jsp" class="small expanded button">Payment
					method</a>
			</div>
		</div>
	</div>
</body>
</html>