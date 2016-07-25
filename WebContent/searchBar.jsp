<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*" import="java.util.*"
	import="model.*"%>
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
	<div class="row">
	<hr>
	<%	
		String search = request.getParameter("searchString");
		ArrayList<Games> resultsList = (ArrayList<Games>) session.getAttribute("GameResults");
		
		if (search==null) {
			search = "";
			
		}
	%>
	
		<center>
			<form action="SearchGamesServlet" method="get">
				<strong>Search :</strong><input type="text" name="searchString">
				<input type="submit" value="Search"><br>
			</form>
		</center>

		<%
		if(resultsList!=null) {				
	%>
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<th><div style="width: 161px">Image</div></th>
								<th>Game ID</th>
								<th>Game Name</th>
								<th>Description</th>
								<th>Price</th>
								<th>Release Date</th>
								<th>Console</th>								
								<th>Action</th>
							</tr>
						</thead>
						<%
							for(Games inv:resultsList) {
							%>
						<tbody>
							<tr>
								<td>
									<div style="width: 161px">
										<img src="<%=inv.getImageLink()%>"
											alt="<%=inv.getImageLink()%>"
											style="width: 161px; height: 220px;">
									</div>
								</td>
								<td><%=inv.getId()%></td>
								<td><%=inv.getName()%></td>
								<td><%=inv.getDescription()%></td>
								<td><%=inv.getPrice()%></td>
								<td><%=inv.getDate()%></td>
								<td><%=inv.getConsole()%></td>
								<td>
									<a href="deleteGames.jsp?id=<%=inv.getId()%> value="deleteGame" onclick="myFunction()"><span class="btn btn-danger">Delete</span></a> 
									<br /><br /> 
									<a href="updateGames.jsp?id=<%=inv.getId()%>&console=<%=inv.getConsole()%>" class="btn btn-info">Update</a>
								</td>
							</tr>
						</tbody>
						<%} %>
					</table>
				</div>
			</div>
		</div>
		<%} %>
	</div>
</body>
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
</html>