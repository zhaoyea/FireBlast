<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

	<style>
.log-in-form {
	border: 1px solid #cacaca;
	padding: 1rem;
	border-radius: 3px;
}

.signup-panel {
	border-radius: 5px;
	border: 1px solid #ccc;
	padding: 15px;
	margin-top: 30px;
}

.signup-panel i {
	font-size: 30px;
	line-height: 50px;
	color: #999;
}

.signup-panel form input, .signup-panel form span {
	height: 50px;
}

.signup-panel .welcome {
	font-size: 26px;
	text-align: center;
	margin-left: 0;
}

.signup-panel p {
	font-size: 13px;
	font-weight: 200;
	margin-left: 25%;
}

.signup-panel .button {
	margin-left: 35%;
}
</style>
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
						<form action="verifyUserServlet" method="post">
							<div class="row column log-in-form">
								<h4 class="text-center">Log in</h4>
								<label>Email <input type="text"
									placeholder="somebody@example.com">
								</label> <label>Password <input type="password" id="password"
									placeholder="Password">
								</label> <input id="show-password" type="checkbox"
									onchange="document.getElementById('password').type = this.checked ? 'text' : 'password'"><label
									for="show-password">Show password</label>
								<p>
									<a type="submit" class="button expanded">Log In</a>
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
				<div class="blog-post">
					<div class="row">
						<form>
							<div class="row column log-in-form">
								<h4 class="text-center">Sign Up</h4>
								<label>First Name <input type="text"
									placeholder="First Name"></label> <label>Last Name <input
									type="text" placeholder="Last Name"></label> <label>Contact
									Number<input type="text" placeholder="91234567">
								</label> <label>Email <input type="text"
									placeholder="somebody@example.com">
									<p class="help-text" id="passwordHelpText">
										*Sign-in with email. Provide a valid email to get information
										about payments, shipping and event winner notification. <br />
										*Please check validation of your email address before your
										enter the other information.
									</p>
									<button class="tiny button">Validation Check</button>
								</label> <label>Password <input type="password" id="password"
									placeholder="Password">
								</label> <input id="show-password" type="checkbox"
									onchange="document.getElementById('password').type = this.checked ? 'text' : 'password'"><label
									for="show-password">Show password</label>
								<p class="help-text" id="passwordHelpText">Password must
									contain both alphabets and numbers and be of length 8 to 16</p>
								<p>
									<a type="submit" class="button expanded">Sign up</a>
								</p>
							</div>
						</form>

					</div>
				</div>
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