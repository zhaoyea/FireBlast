<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="model.*, db.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Invoice</title>
<link rel='stylesheet' type='text/css' href='css/style2.css' />
<link rel='stylesheet' type='text/css' href='css/print.css'
	media="print" />
<script type='text/javascript' src='js/jquery-1.3.2.min.js'></script>
<script type='text/javascript' src='js/example.js'></script>
</head>
<body>
	<%@ include file="navBar.jsp"%>
	<%
		ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("displayCart");
		double totalCost = 0;
	%>


	<div id="page-wrap">

		<textarea id="header">INVOICE</textarea>

		<div id="identity">

			<div class="blog-post">
				<h4>Mailing Address</h4>
				<small> <%=session.getAttribute("Username")%> <br /> <%=((User) session.getAttribute("User")).getEmail()%>
					<br /> <%=((User) session.getAttribute("User")).getAddress()%> <br />
					<%=((User) session.getAttribute("User")).getContact()%>
				</small>
			</div>

			<table id="items">

				<tr>
					<%
						for (Cart c : cartList) {
					%>
					<td><img src="<%=c.getImageLink()%>" alt="<%=c.getName()%>"
						width="100px" height="200px"></td>
					<td><small><%=c.getName()%><br /> <span
							class="secondary label"><%=c.getConsole()%></span></small></td>
					<td><small>Order: <%=c.getQuantity()%></small></td>
					<td><small class="label">$<%=c.getPrice() * c.getQuantity()%></small></td>
					<%
						}
					%>
				</tr>
			</table>
			<hr>
			<table>
				<%
					for (Cart c : cartList) {
				%>
				<tr>
					<td colspan="2" class="total-line">Total</td>
					<td class="total-value"><div id="total">
							$<%=c.getPrice() * c.getQuantity()%></div></td>
				</tr>
				<tr>
					<td colspan="2" class="total-line">Amount Paid</td>
					<td class="total-value"><div id="total">
							$<%=c.getPrice() * c.getQuantity()%></div></td>
				</tr>
				<%
					}
				%>
			</table>

			<div id="terms">
				<h5>Terms</h5>
				<textarea>NET 30 Days. Finance Charge of 1.5% will be made on unpaid balances after 30 days.</textarea>
			</div>
<%session.removeAttribute("displayCart"); %>
		</div>		
</body>
</html>