<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<%@ include file="searchBar6.jsp"%>

	<center>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Admins</h1>
					<%
						try {
							String searchString = request.getParameter("searchString");
							Class.forName("com.mysql.jdbc.Driver");

							String connURL = "jdbc:mysql://cqr.softether.net/LiquidBlast?user=root&password=EADBestModule";

							Connection conn = DriverManager.getConnection(connURL);

							PreparedStatement pstmt = conn.prepareStatement(
									"SELECT * FROM Members WHERE (MemberID LIKE ? OR FirstName LIKE ? OR LastName LIKE ? OR email LIKE ?) AND Priv_lvl NOT LIKE '0'");
							pstmt.setString(1, "%" + searchString + "%");
							pstmt.setString(2, "%" + searchString + "%");
							pstmt.setString(3, "%" + searchString + "%");
							pstmt.setString(4, "%" + searchString + "%");

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
										<th>Member ID</th>
										<th>First Name</th>
										<th>Last Name</th>
										<th>Email</th>
									</tr>
								</thead>
								<%
									while (rs.next()) {
								%>
								<tbody>
									<tr>
										<td><%=rs.getString("MemberID")%></td>
										<td><%=rs.getString("FirstName")%></td>
										<td><%=rs.getString("LastName")%></td>
										<td><%=rs.getString("Email")%></td>
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