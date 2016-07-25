<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="db.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LiquidBlast Gaming</title>
</head>
<body>
	<%@ include file="navBar2.jsp"%>

	<%
		String GameID = request.getParameter("id");

		try {
			Connection conn = DBConn.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM Games WHERE GameID=?");
			pstmt.setString(1, GameID);

			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
	%>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header"><%=rs.getString("Name")%>
				</h1>
				<ol class="breadcrumb">
					<li><a href="searchAllGameResults.jsp">Admin Page</a></li>
					<li class="active"><%=rs.getString("Name")%></li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Portfolio Item Row -->
		<div class="row">

			<div class="col-md-8">
				<img class="img-responsive" src="<%=rs.getString("GameImageLink")%>"
					alt="<%=rs.getString("Name")%>" width="320" height="400">
			</div>

			<div class="col-md-4">
				<form action="UpdateGamesDesc.jsp?id=<%=rs.getString("GameID")%>" method="post">
					<div class="form-group">
						<h3>Game Description</h3>
						<textarea class="form-control" rows="15" name="gameDescription"><%=rs.getString("Description")%></textarea>
						<input class="btn btn-info" type="submit" value="Update">
					</div>
				</form>				


				<a class="btn btn-lg btn-default btn-block" href="#">Buy now at
					only $<%=rs.getString("Price")%></a>

			</div>
		</div>
	</div>
	<!-- Service Tabs -->

	<%
				}
					conn.close();
				} catch (Exception e) {
					out.println("Error :" + e);
				}
			%>

	<hr>
</body>
</html>