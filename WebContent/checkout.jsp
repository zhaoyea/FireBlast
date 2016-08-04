<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="model.*" import="db.*"%>
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
	
	<br />
	<div class="row columns">
		<nav aria-label="You are here:" role="navigation">
		<ul class="breadcrumbs">
			<li><a href="cart.jsp">Shopping Cart</a></li>
			<li><a href="customerInfo.jsp">Customer Information</a></li>
			<li>Payment Method</li>
		</ul>
		</nav>		
		<div class="row" id="content">
			<div class="medium-8 columns">
				<div class="blog-post">
					<h4>Mailing Address</h4>			
					<small>
						<%=session.getAttribute("Username") %>
						<br/>
						<%=session.getAttribute("Address") %>
						<br/>
						<%=session.getAttribute("Contact") %>
					</small>				
				</div>
			</div>
		</div>
	</div>
</body>
</html>