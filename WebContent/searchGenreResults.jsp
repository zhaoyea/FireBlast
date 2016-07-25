<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<title>Admin Panel</title>

<!-- Bootstrap Core CSS-->
<link href="css/table.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/modern-business.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="css/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>
<body>

	<%@ include file="AdminPanel.jsp"%>
	<%@ include file="searchBar5.jsp"%>

	<center>
	<div id="page-wrapper">
		<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">All Genres</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
		<div class="row">
			<div class="col-lg-12">
				<%
					try {
						String searchString = request.getParameter("searchString");
						Class.forName("com.mysql.jdbc.Driver");

						String connURL = "jdbc:mysql://cqr.softether.net/LiquidBlast?user=root&password=EADBestModule";

						Connection conn = DriverManager.getConnection(connURL);

						PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM Genre WHERE GenreID LIKE ? OR Genre LIKE ?");
						pstmt.setString(1, "%" + searchString + "%");
						pstmt.setString(2, "%" + searchString + "%");

						ResultSet rs = pstmt.executeQuery();
						%>
				
			</div>
			<!-- /.col-lg-12 -->
		</div>

		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
								<tr>
									<th>Genre ID</th>
									<th>Genre</th>
									<th>Action</th>
								</tr>
							</thead>
							<%
										while (rs.next()) {
									%>
							<tbody>
								<tr>
									<td><%=rs.getString("GenreID")%></td>
									<td><%=rs.getString("Genre")%></td>
									<td><a href="deleteGenre.jsp?id=<%=rs.getString("GenreID")%>" class="btn btn-danger" name="deleteGenre" onclick="myFunction()">Delete</a> 
										<br><br>
										<a href="updateGenre.jsp?id=<%=rs.getString("GenreID")%>" class="btn btn-info">Update</a>
									</td>
								</tr>
							</tbody>
							<%
										}
									%>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
					conn.close();
					} catch (Exception e) {
						out.println("Error :" + e);
					}
				%>
	</center>
	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<script src="js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="js/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="js/sb-admin-2.js"></script>
</body>
</html>