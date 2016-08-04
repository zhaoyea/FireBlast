<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*" import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Cart</title>
<link rel="stylesheet" href="css\foundation.min.css">
</head>
<body>
	<%
		ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("displayCart");
	%>
	<%@ include file="navBar.jsp"%>

	<br />
	<div class="row columns">
		<nav aria-label="You are here:" role="navigation">
		<ul class="breadcrumbs">
			<li><a href="DemoIndex.jsp">Home</a></li>
			<li><a href="cart.jsp">Shopping Cart</a></li>
		</ul>
		</nav>
	</div>
	<div class="row">
		<%
			if (session.getAttribute("cartError") != null) {
		%>
		<div data-alert class="alert label">
			<strong>Error!</strong>
			<%=session.getAttribute("cartError")%>
		</div>
		<%
			session.removeAttribute("cartError");
			}
		%>

		<h3>Shopping Cart</h3>
		<%
			if (cartList == null) {
		%>

		<div class="row column text-center">
			<p>
				It appears your shopping cart is empty <br /> You can continue
				browsing <a href="DemoIndex.jsp">here</a>
			</p>

			<%
				} else {
			%>
			<center>
				<table class="hover">
					<thead>
						<tr>
							<th></th>
							<th width="200">Item</th>
							<th>Game Name</th>
							<th width="150">Quantity</th>
							<th width="150">Price</th>
						</tr>
					</thead>
					<hr>
					<tbody>
						<%
							for (Cart c : cartList) {
						%>

						<tr>
							<td>
								<form action="deleteCartGames" method="post">
									<div class="callout" data-closable>
										<button class="close-button" aria-label="Dismiss alert"
											data-close>
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
								</form>
							</td>

							<td><img src="<%=c.getImageLink()%>" alt="<%=c.getName()%>"
								width="100px" height="200px"></td>
							<td><%=c.getName()%> <br /> <span class="secondary label"><%=c.getConsole()%></span>
							</td>
							<td><form action="updateCart" method="">
									<input class="input-group-field" type="number"
										value="<%=c.getQuantity()%>" name="updateQuantity"> <input
										type="hidden" value="<%=c.getGameID()%>" name="GameID">
									<button type="submit" class="tiny success button">Update</button>
								</form></td>
							<td><span class="sucess label"><%=c.getPrice() * c.getQuantity()%></span></td>

						</tr>
						<%
							}
						%>

						<tr>
							<td><label><a href="DemoIndex.jsp">Continue
										Shopping</a></label></td>
							<td></td>
							<td></td>
							<td>Subtotal $</td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<center>
					<hr>
					<%
						}
					%>
				
		</div>

	</div>

	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script
		src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
	<script>
		$(document).foundation();
	</script>
</body>
</html>