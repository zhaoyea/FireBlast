<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment</title>
</head>
<body>
	<%@ include file="navBar.jsp"%>
	<br />
	<div class="row" id="content">
		<nav aria-label="You are here:" role="navigation">
		<ul class="breadcrumbs">
			<li><a href="cart.jsp">Shopping Cart</a></li>
			<li><a href="customerInfo.jsp">Customer Information</a></li>
			<li>Payment Method</li>
		</ul>
		</nav>
		<div class="tabs-panel is-active" id="panel1">
			<div class="row">
				<div class="medium-6 medium-centered large-4 large-centered columns">
					<div class="row column log-in-form">
						<form action="Payment" method="post">
							<h4 class="text-center">
								Credit Card details <img src="http://imgur.com/CfABtD8.png"
									class="img-rounded" />
							</h4>
							<label>Name on Card <input type="text"
								placeholder="Name on the card" name="cardName" required>
							</label> <label>Credit Card Number <input type="text"
								placeholder="0000 0000 0000 0000" name="creditCardNumber"
								required>
							</label> <label>Expiry Month<input type="text" placeholder="MM"
								name="expiryMonth" required></label> <label>Expiry Year<input
								type="text" placeholder="YY" name="expiryYear" required></label>
							<label>CCV<input type="text" placeholder="CCV" name="ccv"
								required></label>
							<p>
								<a href="checkout.jsp" class="alert button">Cancel</a> 
								<button type="submit" class="warning button">Pay Now</button>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>