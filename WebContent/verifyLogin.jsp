<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="db.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		session.setAttribute("email", email);

		try {
			Connection conn = DBConn.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM Members WHERE email=?");
			pstmt.setString(1, email);

			ResultSet rs = pstmt.executeQuery();
			String emailDB = "";
			String passwordDB = "";

			while (rs.next()) {
				emailDB = rs.getString("email");
				passwordDB = rs.getString("password");
				if (emailDB.equals(email) && passwordDB.equals(password)) {
	%><form method="post" action="AdminPanel.jsp">
		<input type="hidden" name="emailDB" value="<%=rs.getString("email")%>">
	</form>
	<%
		response.sendRedirect("AdminPanel.jsp");
				} else if (emailDB.equals(email) && passwordDB.equals(password)) {
	%><form method="post" action="AdminPanel.jsp">
		<input type="hidden" name="emailDB" value="<%=rs.getString("email")%>">
	</form>
	<%
		response.sendRedirect("index.jsp");
				} else {
					response.sendRedirect("login.html");
				}
			}
			conn.close();
		} catch (Exception e) {
			out.println("Error :" + e);
		}
	%>
</body>
</html>