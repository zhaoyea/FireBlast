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
			<li><a href="profile.jsp">Profile</a></li>
			<li>Edit Profile</li>
		</ul>
		</nav>
	</div>

	<%
		try {
			Connection conn = DBConn.getConnection();			

			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM members WHERE UserID=?");
			pstmt.setInt(1, ((User)session.getAttribute("User")).getUserid());

			ResultSet mem = pstmt.executeQuery();			
	%>

	<div class="medium-6 medium-centered large-4 large-centered columns">
		<div class="row">
			<form action="UpdateUserServlet" method="post">
				<h4 class="text-center">Update your details</h4>
				<center>
			<%
				if (session.getAttribute("profileError") != null) {
			%>
			<div data-alert class="alert label">
				<strong>Error!</strong>
				<%=session.getAttribute("profileError")%>
			</div>
			<%
				session.removeAttribute("profileError");
					}
			%>			
		</center>
				<%
					while (mem.next()) { 
				%>
					<input type="hidden" value="<%=mem.getString("UserID")%>" name="UserID"> 
					<label>
						First Name <input type="text" value="<%=mem.getString("FirstName")%>" name="newFirstName">
					</label> 
					<label>
						Last Name <input type="text" value="<%=mem.getString("LastName")%>" name="newLastName">
					</label> 
					<label>
						Contact Number<input type="text" value="<%=mem.getString("Contact")%>" name="newContactNumber">
					</label> 
					<label>
						Mailing Address<input type="text" value="<%=mem.getString("Address")%>" name="newMailAddress">
					</label> 
					<label>
						Email <input type="text" value="<%=mem.getString("email")%>" name="newEmailAddress">					
					</label> 
					<label>
						New Password: <input type="password" id="password" name="newPassword">
						<p class="help-text" id="passwordHelpText">Password must
							include at least one upper case letter, One lower case letter, One
							digit, At least one special character, And minimum 8 in length</p>
					</label> 
					<label>
						Re-enter Password <input type="password" id="password" name="reEnterPassword">
					</label>
				
				<%
					}
				%>
				<p>
					<button type="submit" class="button expanded">Update my account details!</button>
				</p>
			</form>
		</div>		
	</div>


	<%
		conn.close();
		} catch (Exception e) {
			out.println("Error :" + e);
		}
	%>

	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script
		src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
	<script>
		$(document).foundation();
		$(document).foundation('alert', 'reflow');
	</script>
</body>
</html>