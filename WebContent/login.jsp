<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet"
	href="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
</head>
<body>
	<%@ include file="navBar.jsp"%>
	<br />


	<div class="row" id="content">
		<nav aria-label="You are here:" role="navigation">
		<ul class="breadcrumbs">
			<li><a href="DemoIndex.jsp">Home</a></li>
			<li><a href="login.jsp">Login</a></li>
		</ul>
		</nav>

		<ul class="tabs" data-tabs id="example-tabs">
			<li class="tabs-title is-active"><a href="#panel1"
				aria-selected="true">Login</a></li>
			<li class="tabs-title"><a href="#panel2">Sign Up</a></li>
		</ul>
		<div class="tabs-content" data-tabs-content="example-tabs">
			<div class="tabs-panel is-active" id="panel1">
				<div class="row">
					<div
						class="medium-6 medium-centered large-4 large-centered columns">
						<form action="loginServlet" method="get">
							<div class="row column log-in-form">
								<h4 class="text-center">Log in</h4>
								<label>Email <input type="text"
									placeholder="somebody@example.com" name="email" required>
								</label> <label>Password <input type="password" id="password"
									placeholder="Password" name="password" required>
								</label> <input id="show-password" type="checkbox"
									onchange="document.getElementById('password').type = this.checked ? 'text' : 'password'"><label
									for="show-password">Show password</label>
								<p>
									<input type="submit" class="button expanded" value="Log in">
								</p>
								<p class="text-center">
									<a href="#">Forgot your password?</a>
								</p>
							</div>
						</form>

					</div>
				</div>
			</div>

			<div class="tabs-panel" id="panel2">
				<%
					if (session.getAttribute("error") != null) {
				%>
				<center>
					<div data-alert class="alert label">
						<strong>Error!</strong>
						<%=session.getAttribute("error")%>
					</div>
					<% session.removeAttribute("error"); } %>
				<% if (session.getAttribute("success") != null) { %>
					<div data-alert class="success label">
						<strong>Success!</strong>
						<%=session.getAttribute("success") %>
					</div>
					<% session.removeAttribute("success"); } %>
				</center>
				

				<div class="medium-6 medium-centered large-4 large-centered columns">
					<div class="row">
						<form action="RegisterServlet" method="post">
							<div class="row column log-in-form">
								<h4 class="text-center">Sign Up</h4>
								<label>First Name <input type="text"
									placeholder="First Name" name="firstName" required></label> <label>Last
									Name <input type="text" placeholder="Last Name" name="lastName"
									required>
								</label> <label>Contact Number<input type="text"
									placeholder="91234567" name="contactNumber" required>
								</label> <label>Mailing Address<input type="text"
									placeholder="Blk 112 Jurong West Street 12 #12-112 SG 640112"
									name="mailAddress" required>
								</label> <label>Email <input type="text"
									placeholder="somebody@example.com" name="emailAddress" required>
									<p class="help-text" id="passwordHelpText" required>
										*Sign-in with email. Provide a valid email. <br />
									</p>
								</label> <label>Password <input type="password" id="password"
									placeholder="Password" name="password" required>
									<p class="help-text" id="passwordHelpText">Password must
										include at least one upper case letter, One lower case letter,
										One digit, At least one special character, And minimum 8 in
										length</p>
								</label> <label>Re-enter Password <input type="password"
									id="password" placeholder="Password" name="reEnterPassword"
									required>
								</label>

								<p>
									<input type="submit" class="button expanded" value="Sign Up">
								</p>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script
		src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
	<script>
		$(document).foundation();
		$(document).foundation('alert', 'reflow');
	</script>
</body>
</html>