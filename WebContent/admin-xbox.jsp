<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="db.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<%@ include file="AdminPanel.jsp"%>
	
	
	<center>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
				<h1 class="page-header">xBox Games</h1>
					<%
						try {
							String searchString = request.getParameter("searchString");
							String imageURL = request.getParameter("image");
							
							Connection conn = DBConn.getConnection();

							PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM Games WHERE (GameID LIKE ? OR Name LIKE ? OR ReleaseDate LIKE ?) AND Console LIKE 'XBox'");
							pstmt.setString(1, "%" + searchString + "%");
							pstmt.setString(2, "%" + searchString + "%");
							pstmt.setString(3, "%" + searchString + "%");

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
										<th>Game ID</th>
										<th>Game Name</th>
										<th><div style="width: 161px">Image</div></th>
										<th>Price</th>
										<th>Release Date</th>
										<th>Action</th>
									</tr>
								</thead>
								<%
									while (rs.next()) {
								%>
								<tbody>
									<tr>
										<td><div style="width: 161px">
												<img src="<%=rs.getString("GameImageLink")%>"
													alt="<%=rs.getString("Name")%>"
													style="width: 161px; height: 220px;">
											</div></td>
										<td><%=rs.getString("GameID")%></td>
										<td><%=rs.getString("Name")%></td>
										<td><%=rs.getString("Price")%></td>
										<td><%=rs.getString("ReleaseDate")%></td>
										<td><a href="deleteGames.jsp?id=<%=rs.getString("GameID")%> name="deleteGame" onclick="myFunction()"><span class="btn btn-danger">Delete</span></a>  <br>
										<br><a href="updateGames.jsp?id=<%=rs.getString("GameID")%>&console=<%=rs.getString("Console")%>" class="btn btn-info">Update</a></td>
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